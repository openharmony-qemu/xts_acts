'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

import { Core } from './core';
import { TAG, PrintTag } from './Constant';
import DataDriver from './module/config/DataDriver';
import { ExpectExtend } from './module/assert/ExpectExtend';
import { OhReport } from './module/report/OhReport';
import { SysTestKit } from './module/kit/SysTestKit';
import { DataDriverAttr, DataDriverData, DataDriverSuite, TestcaseSummaryIF, SendData, TestcaseRet, ItItemIF, TestResultCode } from './interface';
import { HypiumValue, CustomAssert } from './module/types/common';
import { ConfigService } from './module/config/configService';
import hilog from '@ohos.hilog';
import { ExpectService } from './module/service/ExpectService';
import { SuiteService } from './module/service/SuiteService';
import { AssertResult } from './module/modal/assertModel';
import { EAWorker, jsonx } from 'std/core';
import { WorkerLocal, concurrency } from 'std/concurrency';

const domain: int = 0xD001;
const tag: string = 'testTag';

export class Hypium {
  private static parseParametersJson(parametersJson: string): Record<string, string> {
    const result: Record<string, string> = {};
    const root = JSON.parseJsonElement(parametersJson);
    // AbilityDelegator parameters must be a JSON object of stringifiable values.
    if (root.tryAsString() !== undefined
      || root.tryAsInteger() !== undefined
      || root.tryAsDouble() !== undefined
      || root.tryAsBoolean() !== undefined
      || root.tryAsNull() !== undefined
      || root.tryAsArray() !== undefined) {
      throw new Error('parametersJson must be a JSON object');
    }
    for (const entry of root) {
      const key = entry[0];
      if (typeof key !== 'string') {
        throw new Error('parseParametersJson: entry key must be a string');
      }
      const valueElem = entry[1];
      const asString = valueElem.tryAsString();
      if (asString !== undefined) {
        result[key] = asString;
        continue;
      }
      const asInteger = valueElem.tryAsInteger();
      if (asInteger !== undefined) {
        result[key] = String(asInteger);
        continue;
      }
      const asDouble = valueElem.tryAsDouble();
      if (asDouble !== undefined) {
        result[key] = String(asDouble);
        continue;
      }
      const asBoolean = valueElem.tryAsBoolean();
      if (asBoolean !== undefined) {
        result[key] = String(asBoolean);
        continue;
      }
      if (valueElem.tryAsNull() !== undefined) {
        result[key] = 'null';
        continue;
      }
      // Keep object/array parameters as JSON text for the worker.
      result[key] = JSON.stringifyJsonElement(valueElem);
    }
    return result;
  }


  private static asSendData(raw: Object): SendData | undefined {
    try {
      const candidate = raw as SendData;
      if (typeof candidate.currentThreadName !== 'string') {
        return undefined;
      }
      const summary = candidate.summary;
      if (summary === null || summary === undefined) {
        return undefined;
      }
      if (typeof summary.total !== 'number'
        || typeof summary.failure !== 'number'
        || typeof summary.error !== 'number'
        || typeof summary.pass !== 'number'
        || typeof summary.ignore !== 'number'
        || typeof summary.duration !== 'number'
        || summary.itItemList === null
        || summary.itItemList === undefined
        || !Array.isArray(summary.itItemList)) {
        return undefined;
      }
      return candidate;
    } catch (e) {
      const errMsg = e instanceof Error ? e.message : String(e);
      hilog.error(domain, tag, `asSendData cast/validation failed: ${errMsg}`);
      return undefined;
    }
  }

  // Worker -> main settle messages (resolve/reject only on EAWorker.main()).
  private static readonly EA_WORKER_MSG_OK: int = 1;
  private static readonly EA_WORKER_MSG_ERR: int = 2;

  // Per-worker context store — avoid sharing a static Map across EAWorkers.
  private static readonly contextLocal: WorkerLocal<Map<string, HypiumValue>> =
    new WorkerLocal<Map<string, HypiumValue>>(() => new Map<string, HypiumValue>());
  private static readonly MAX_PARSE_DEPTH: number = 20;
  private static readonly INITIAL_DEPTH: number = 1;

  static parseValue(value: jsonx.JsonElement, currentDepth: number): Array<HypiumValue | null | undefined> | Record<string, HypiumValue> | string | number | boolean | null | undefined {
    if (currentDepth > Hypium.MAX_PARSE_DEPTH) {
      throw new Error('Maximum parsing depth exceeded. currentParseDepth is ' + currentDepth);
    }
    if (value.tryAsNull() !== undefined) {
      return null;
    }
    // Avoid truthy checks: "", 0, false are valid JSON values.
    const asString = value.tryAsString();
    if (asString !== undefined) {
      return asString;
    }
    const asInteger = value.tryAsInteger();
    if (asInteger !== undefined) {
      // Keep integer JSON values as integers (not double) for strict ArkTS comparisons.
      return asInteger;
    }
    const asDouble = value.tryAsDouble();
    if (asDouble !== undefined) {
      return asDouble;
    }
    const asBoolean = value.tryAsBoolean();
    if (asBoolean !== undefined) {
      return asBoolean;
    }
    const asArray = value.tryAsArray();
    if (asArray !== undefined) {
      const parsedValue: Array<HypiumValue | null | undefined> = [];
      for (const val of asArray) {
        // Increment depth so deeply nested arrays hit MAX_PARSE_DEPTH.
        parsedValue.push(Hypium.parseValue(val, currentDepth + 1));
      }
      return parsedValue;
    }
    // 当是对象时，层数递增1位
    return Hypium.parseParams(value, currentDepth + 1);
  }

  static parseParams(paramsItem: jsonx.JsonElement, currentDepth: number): Record<string, HypiumValue> {
    const tempRecord: Record<string, HypiumValue> = {};
    // Only iterate object-shaped JsonElement; primitives/arrays are rejected by callers.
    if (paramsItem.tryAsString() !== undefined
      || paramsItem.tryAsInteger() !== undefined
      || paramsItem.tryAsDouble() !== undefined
      || paramsItem.tryAsBoolean() !== undefined
      || paramsItem.tryAsNull() !== undefined
      || paramsItem.tryAsArray() !== undefined) {
      throw new Error('parseParams expects a JSON object');
    }
    for (const entry of paramsItem) {
      if (entry === null || entry === undefined) {
        throw new Error('parseParams: iterator value is null or undefined');
      }
      // JsonElement object iterator yields [key, value] pairs (same as parseParametersJson).
      const key: string = entry[0];
      const value: jsonx.JsonElement = entry[1];
      if (typeof key !== 'string') {
        throw new Error('parseParams: entry key must be a string');
      }
      tempRecord[key] = Hypium.parseValue(value, currentDepth);
    }
    return tempRecord;
  }

  static parseSuite(item: jsonx.JsonElement): DataDriverSuite {
    try {
      return Hypium.parseSuiteInner(item);
    } catch (e) {
      const errMsg = e instanceof Error ? e.message : String(e);
      throw new Error(`parseSuite failed: ${errMsg}`);
    }
  }

  private static parseSuiteInner(item: jsonx.JsonElement): DataDriverSuite {
    let describe: string[] | undefined
    if (item.tryGetElement("describe") !== undefined) {
      const describeElem = item.getElement("describe");
      const describeValue = describeElem.tryAsArray();
      if (describeValue === undefined) {
        throw new Error('describe must be a JSON array');
      }
      const parsedDescribe: string[] = []
      for (const describeItem of describeValue) {
        const describeName = describeItem.tryAsString()
        if (describeName === undefined) {
          throw new Error('describe item must be a string')
        }
        parsedDescribe.push(describeName)
      }
      describe = parsedDescribe
    }

    let params: Record<string, HypiumValue> = {};
    let paramsArray: Record<string, HypiumValue>[] = []
    if (item.tryGetElement("params") !== undefined) {
      const paramsElement = item.getElement("params");
      const paramsValue = paramsElement.tryAsArray();
      if (Array.isArray(paramsValue)) {
        const paramArray = paramsValue as Array<jsonx.JsonElement>
        for (const paramsItem of paramArray) {
          const tempRecord = Hypium.parseParams(paramsItem, Hypium.INITIAL_DEPTH)
          paramsArray.push(tempRecord)
        }
      } else if (paramsElement.tryAsString() !== undefined
        || paramsElement.tryAsInteger() !== undefined
        || paramsElement.tryAsDouble() !== undefined
        || paramsElement.tryAsBoolean() !== undefined
        || paramsElement.tryAsNull() !== undefined) {
        throw new Error('params must be a JSON object or array of objects');
      } else {
        params = Hypium.parseParams(paramsElement, Hypium.INITIAL_DEPTH)
      }
    } else {
      params = {}
    }

    let items: DataDriverSuite[] | undefined = undefined;
    if (item.tryGetElement("items") !== undefined) {
      const itemsElem = item.getElement("items");
      const itemsValue = itemsElem.tryAsArray();
      if (itemsValue === undefined) {
        throw new Error('items must be a JSON array');
      }
      const parsedItems: DataDriverSuite[] = [];
      for (const childItem of itemsValue) {
        const parsedChild = Hypium.parseSuite(childItem);
        parsedItems.push(parsedChild);
      }
      items = parsedItems;
    }

    let stress: number | undefined = 1;
    if (item.tryGetElement("stress") !== undefined) {
      const stressElem = item.getElement("stress");
      const stressDouble = stressElem.tryAsDouble();
      if (stressDouble !== undefined) {
        stress = stressDouble;
      } else {
        const stressInteger = stressElem.tryAsInteger();
        if (stressInteger === undefined) {
          throw new Error('stress must be a number');
        }
        // int widens to number; avoid toDouble() for raw integer JSON values.
        stress = stressInteger;
      }
    }

    let it: string | undefined = undefined;
    if (item.tryGetElement("it") !== undefined) {
      const itName = item.getElement("it").tryAsString();
      if (itName === undefined) {
        throw new Error('it must be a string');
      }
      it = itName;
    }

    return {
      describe,
      stress,
      it,
      params: paramsArray.length ? paramsArray : params,
      items
    }
  }

  static setData(jsonStr: string): void {
    const core = Core.getInstance();
    if (core === null) {
      throw new Error('[hypium] core not initialized');
    }
    let jsonData: jsonx.JsonElement;
    try {
      jsonData = JSON.parseJsonElement(jsonStr);
    } catch (e) {
      const errMsg = e instanceof Error ? e.message : String(e);
      console.error(`${TAG} setData parseJsonElement failed: ${errMsg}`);
      throw new Error(`setData invalid jsonStr: ${errMsg}`);
    }
    if (jsonData.tryAsString() !== undefined
      || jsonData.tryAsInteger() !== undefined
      || jsonData.tryAsDouble() !== undefined
      || jsonData.tryAsBoolean() !== undefined
      || jsonData.tryAsNull() !== undefined
      || jsonData.tryAsArray() !== undefined) {
      throw new Error('setData jsonStr must be a JSON object');
    }
    if (jsonData.tryGetElement("suites") === undefined) {
      throw new Error('suites is null');
    }
    const suitesElem = jsonData.getElement("suites");
    const suitesValue = suitesElem.tryAsArray();
    if (suitesValue === undefined) {
      throw new Error('suites must be a JSON array');
    }
    const dataDriverSuite: DataDriverSuite[] = []
    for (const item of suitesValue) {
      const parseSuite = Hypium.parseSuite(item);
      dataDriverSuite.push(parseSuite);
    }
    const data: DataDriverData = {
      suites: dataDriverSuite
    }
    const dataDriver = new DataDriver({ data });
    core.addService('dataDriver', dataDriver);
  }

  static registerAssert(customAssertionName: string, customAssertion: CustomAssert): void {
    const core = Core.getInstance();
    if (core === null) {
      throw new Error('[hypium] core not initialized');
    }
    const expectService = core.getDefaultService('expect');
    if (expectService instanceof ExpectService) {
      expectService.addCustomMatchers(customAssertionName, customAssertion);
    }
  }

  static unregisterAssert(customAssertionName: string): void {
    const core = Core.getInstance();
    if (core === null) {
      throw new Error('[hypium] core not initialized');
    }
    const expectService = core.getDefaultService('expect');
    if (expectService instanceof ExpectService) {
      expectService.removeCustomMatchers(customAssertionName);
    }
  }

  static setTimeConfig(systemTime: number): void {
    SysTestKit.systemTime = systemTime;
  }

  static set(key: string, value: HypiumValue): void {
    const ctx = Hypium.contextLocal.get();
    if (ctx === null || ctx === undefined) {
      throw new Error('[hypium] contextLocal is unavailable');
    }
    ctx.set(key, value);
  }

  static get(key: string): HypiumValue | undefined {
    const ctx = Hypium.contextLocal.get();
    if (ctx === null || ctx === undefined) {
      return undefined;
    }
    return ctx.get(key);
  }

  static async hypiumTest(
    abilityDelegator: abilityDelegatorRegistry.AbilityDelegator | null,
    abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs,
    testsuite: () => void
  ): Promise<void> {
    const core = Core.getInstance();
    const expectExtend = new ExpectExtend({
      id: 'extend',
    });
    const ohReport = new OhReport({
      delegator: abilityDelegator,
      abilityDelegatorArguments: abilityDelegatorArguments,
    });
    // Only bind AbilityDelegator on the main thread; worker path keeps it null.
    if (abilityDelegator !== null) {
      SysTestKit.delegator = abilityDelegator;
    }
    if (core === null) {
      throw new Error('[hypium] core not initialized');
    }
    core.addService('expect', expectExtend);
    core.addService('report', ohReport);
    core.init();
    core.subscribeEvent('spec', ohReport);
    core.subscribeEvent('suite', ohReport);
    core.subscribeEvent('task', ohReport);
    const cService = core.getDefaultService('config');
    if (cService instanceof ConfigService && abilityDelegatorArguments !== null) {
      const configService = cService;
      const testParameters = configService.translateParams(abilityDelegatorArguments.parameters);
      console.info(`${TAG}parameters:${JSON.stringify(testParameters)}`);
      configService.setConfig(testParameters);
    }
    testsuite();
    await core.execute(abilityDelegator);
  }

  static async hypiumInitEAWorkers(
    abilityDelegator: abilityDelegatorRegistry.AbilityDelegator,
    abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs,
    workerNum: number,
    testsuite: () => void
  ): Promise<void> {
    const workerPromiseArray: Promise<TestcaseSummaryIF>[] = [];
    const startTime = SysTestKit.getRealTime();
    // Ensure worker-local Core is initialized before spawning EAWorkers.
    Core.getInstance();
    for (let i = 0; i < workerNum; i++) {
      const workerPromise: Promise<TestcaseSummaryIF> = Hypium.createEAWorkerPromise(i, testsuite,
        abilityDelegatorArguments);
      workerPromiseArray.push(workerPromise);
    }
    let runTimes: number = 0;
    let totalDuration: number = 0;
    return Promise.allSettled(workerPromiseArray).then(async (settledResults: Array<PromiseSettledResult<TestcaseSummaryIF>>) => {
      const items: Array<TestcaseSummaryIF> = [];
      const rejectDetails: Array<string> = [];
      for (let i = 0; i < settledResults.length; i++) {
        const settled = settledResults[i];
        if (settled.status === 'fulfilled') {
          items.push((settled as PromiseFulfilledResult<TestcaseSummaryIF>).value);
        } else {
          const reason = (settled as PromiseRejectedResult).reason;
          const detail = reason instanceof Error ? reason.message : String(reason);
          rejectDetails.push(detail);
          console.error(`${TAG}, worker[${i}] rejected: ${detail}`);
        }
      }
      const allItemList = new Array<ItItemIF>();
      for (const item of items) {
        runTimes += item.total;
        totalDuration += item.duration;
        Hypium.handleItResult(allItemList, item.itItemList);
      }
      const mergedResult: TestcaseRet = {
        total: 0,
        failure: 0,
        error: 0,
        pass: 0,
        ignore: 0,
        duration: 0
      };
      Hypium.configWorkerItTestResult(mergedResult, allItemList);
      Hypium.printWorkerTestResult(abilityDelegator, allItemList);
      const endTime = SysTestKit.getRealTime();
      const taskConsuming = endTime - startTime;
      if (rejectDetails.length > 0) {
        const detail = rejectDetails.join('; ');
        const errMsg = `${TAG}, [end] error you worker test, ${detail}`;
        console.error(errMsg);
        const failReport =
          `\n${PrintTag.OHOS_REPORT_ALL_RESULT}: stream=Error: ${detail}` +
          `\n${PrintTag.OHOS_REPORT_ALL_CODE}: -1` +
          `\n${PrintTag.OHOS_REPORT_ALL_STATUS}: taskconsuming=${taskConsuming > 0 ? taskConsuming : totalDuration}`;
        abilityDelegator.printSync(failReport);
        abilityDelegator.finishTest(`you worker test error finished!!! ${detail}`, -1, () => { });
        return;
      }
      const message =
        `\n${PrintTag.OHOS_REPORT_ALL_RESULT}: stream=Test run: runTimes: ${runTimes},total: ${mergedResult.total}, Failure: ${mergedResult.failure}, Error: ${mergedResult.error}, Pass: ${mergedResult.pass}, Ignore: ${mergedResult.ignore}` +
        `\n${PrintTag.OHOS_REPORT_ALL_CODE}: ${mergedResult.failure > 0 || mergedResult.error > 0 ? -1 : 0}` +
        `\n${PrintTag.OHOS_REPORT_ALL_STATUS}: taskconsuming=${taskConsuming > 0 ? taskConsuming : totalDuration}`;
      abilityDelegator.printSync(message);
      console.info(`${TAG}, [end] you worker test`);
      abilityDelegator.finishTest('you worker test finished!!!', 0, () => { });
    }).finally(() => {
      console.info(`${TAG}, all promise finally end`);
    });
  }

  static createEAWorkerPromise(i: number, testsuite: () => void,
    abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs): Promise<TestcaseSummaryIF> {
    // Per-worker local suite reference — avoid a shared static Map across EAWorkers.
    // AbilityDelegatorArgs stay serialized as primitives for the worker task.
    const suiteFn: () => void = testsuite;
    const bundleName: string = abilityDelegatorArguments.bundleName;
    const testCaseNames: string = abilityDelegatorArguments.testCaseNames;
    const testRunnerClassName: string = abilityDelegatorArguments.testRunnerClassName;
    let parametersJson: string = '{}';
    try {
      parametersJson = JSON.stringify(abilityDelegatorArguments.parameters);
    } catch (e) {
      const errMsg = e instanceof Error ? e.message : String(e);
      console.error(`${TAG}, failed to stringify AbilityDelegator parameters: ${errMsg}`);
      throw new Error(`AbilityDelegator parameters are not JSON-serializable: ${errMsg}`);
    }
    const workerPromise: Promise<TestcaseSummaryIF> = new Promise<TestcaseSummaryIF>((resolve, reject) => {
      let settled = false;
      const worker = new EAWorker(`EAWork_${i}`);

      const quitWorkerBestEffort = (): void => {
        try {
          if (worker.isAlive()) {
            worker.quit();
          }
        } catch (quitError) {
          const quitMsg = quitError instanceof Error ? quitError.message : String(quitError);
          hilog.error(domain, tag, 'Failed to quit worker: ' + quitMsg);
        }
      };

      // Settle the Promise only on EAWorker.main() — never call resolve/reject from worker tasks.
      const mainHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        if (settled) {
          return;
        }
        settled = true;
        quitWorkerBestEffort();
        try {
          const messageType = msg.getWhat();
          if (messageType === Hypium.EA_WORKER_MSG_OK) {
            const raw = msg.getObject();
            if (raw === null || raw === undefined) {
              reject(new Error('EAWorker OK message object is null'));
              return;
            }
            const data = Hypium.asSendData(raw as Object);
            if (data === undefined) {
              reject(new Error('EAWorker OK message is not a valid SendData'));
              return;
            }
            hilog.info(domain, tag, 'receive data from ' + data.currentThreadName + ' ' + JSON.stringify(data));
            resolve(data.summary);
            return;
          }
          if (messageType === Hypium.EA_WORKER_MSG_ERR) {
            const raw = msg.getObject();
            let errMsg = 'EAWorker error';
            if (typeof raw === 'string') {
              errMsg = raw as string;
            }
            reject(new Error(errMsg));
            return;
          }
          reject(new Error(`Unexpected EAWorker settle message type: ${messageType}`));
        } catch (e) {
          const errMsg = e instanceof Error ? e.message : String(e);
          reject(new Error(`EAWorker main settle handler failed: ${errMsg}`));
        }
      }, EAWorker.main());

      const postErrToMain = (errMsg: string): void => {
        try {
          const errMessage = new concurrency.Message(Hypium.EA_WORKER_MSG_ERR, errMsg, mainHandler);
          errMessage.sendToTarget();
        } catch (sendError) {
          const sendMsg = sendError instanceof Error ? sendError.message : String(sendError);
          hilog.error(domain, tag, 'Failed to post worker error to main: ' + sendMsg);
        }
      };

      worker.setUncaughtExceptionHandler((e: Error): void => {
        hilog.error(domain, tag, `worker error: ${e.message}`);
        postErrToMain(e.message);
      });
      try {
        worker.start();
        // MessageHandler / quit / getName must use the worker-local EAWorker (EAWorker.current()),
        // not the main-thread worker reference captured across threads.
        // Results are forwarded to mainHandler; resolve/reject run only on the main worker.
        worker.postTask(() => {
        const current = EAWorker.current();
        if (current === undefined) {
          // Do not call main-thread worker.quit() here (cross-thread object use).
          // Throw so setUncaughtExceptionHandler can reject and the worker can terminate.
          throw new Error('EAWorker.current() is undefined inside worker task');
        }
        const localWorker: EAWorker = current;
        let forwarded = false;
        const quitLocal = (): void => {
          try {
            localWorker.quit();
          } catch (quitError) {
            const quitMsg = quitError instanceof Error ? quitError.message : String(quitError);
            hilog.error(domain, tag, 'Failed to quit worker: ' + quitMsg);
          }
        };
        const postOkToMain = (payload: SendData): void => {
          if (forwarded) {
            return;
          }
          forwarded = true;
          try {
            const okMessage = new concurrency.Message(Hypium.EA_WORKER_MSG_OK, payload, mainHandler);
            okMessage.sendToTarget();
          } catch (sendError) {
            forwarded = false;
            const sendMsg = sendError instanceof Error ? sendError.message : String(sendError);
            hilog.error(domain, tag, 'Failed to post worker result to main: ' + sendMsg);
            postErrToMain(sendMsg);
          }
          quitLocal();
        };
        const postFailToMain = (err: Error): void => {
          if (forwarded) {
            return;
          }
          forwarded = true;
          postErrToMain(err.message);
          quitLocal();
        };
        const currentCB = (msg: concurrency.Message): void => {
          try {
            const messageType = msg.getWhat();
            if (messageType !== Hypium.EA_WORKER_MSG_OK) {
              hilog.error(domain, tag, `Unexpected EAWorker message type: ${messageType}`);
              postFailToMain(new Error(`Unexpected EAWorker message type: ${messageType}`));
              return;
            }
            const raw = msg.getObject();
            if (raw === null || raw === undefined) {
              hilog.error(domain, tag, 'EAWorker message object is null');
              postFailToMain(new Error('EAWorker message object is null'));
              return;
            }
            // Message type 1 is emitted only by OhReport with a SendData payload.
            // msg.getObject() is typed as Any; asSendData requires Object.
            const data = Hypium.asSendData(raw as Object);
            if (data === undefined) {
              hilog.error(domain, tag, 'EAWorker message is not a valid SendData');
              postFailToMain(new Error('EAWorker message is not a valid SendData'));
              return;
            }
            // Forward to main MessageHandler; do not resolve/reject here.
            postOkToMain(data);
          } catch (e) {
            const errMsg = e instanceof Error ? e.message : String(e);
            hilog.error(domain, tag, `EAWorker message handler failed: ${errMsg}`);
            postFailToMain(e instanceof Error ? e : new Error(errMsg));
          }
        };
        const msgHandler = new concurrency.MessageHandler(currentCB, localWorker);
        const core = new Core();
        core.msgHandle = msgHandler;
        Core.setThreadInstance(core);
        const workerName = localWorker.getName();
        hilog.info(domain, tag, 'Run test in Worker ' + workerName);
        // Rebuild AbilityDelegatorArgs from serialized primitives on the worker thread.
        const localArgs: abilityDelegatorRegistry.AbilityDelegatorArgs = {
          bundleName: bundleName,
          parameters: Hypium.parseParametersJson(parametersJson),
          testCaseNames: testCaseNames,
          testRunnerClassName: testRunnerClassName
        };
        // Pass null AbilityDelegator: finishTest must stay on the main thread.
        Hypium.hypiumTest(null, localArgs, suiteFn).then(
          (): void => {
            const coreInst = Core.getInstance();
            if (coreInst === null) {
              postFailToMain(new Error('Core is null after worker hypiumTest'));
              return;
            }
            const suiteService = coreInst.getDefaultService('suite');
            if (suiteService instanceof SuiteService) {
              const summary = suiteService.getSummary();
              const payload: SendData = {
                currentThreadName: workerName,
                summary: summary
              };
              postOkToMain(payload);
              return;
            }
            postFailToMain(new Error('suite service missing after worker hypiumTest'));
          },
          (e: Error): void => {
            hilog.error(domain, tag, 'hypiumTest error: ' + e.message);
            postFailToMain(e);
          }
        );
      });
      } catch (e) {
        quitWorkerBestEffort();
        if (!settled) {
          settled = true;
          const errMsg = e instanceof Error ? e.message : String(e);
          reject(new Error(`Failed to start/postTask EAWorker: ${errMsg}`));
        }
      }
    });
    return workerPromise;
  }


  private static resultSeverity(code: TestResultCode): int {
    // Higher value wins when merging multi-worker results.
    if (code === TestResultCode.ERROR) {
      return 3;
    }
    if (code === TestResultCode.FAILURE) {
      return 2;
    }
    if (code === TestResultCode.IGNORE) {
      return 1;
    }
    return 0; // PASS
  }

  static handleItResult(allItemList: Array<ItItemIF>, itItemList: Array<ItItemIF>): void {
    for (const itItem of itItemList) {
      const description = itItem.description;
      const result = itItem.result;
      const currentThreadName = itItem.currentThreadName;
      const item = allItemList.find((it: ItItemIF) => (it.description === description));
      if (item !== undefined) {
        // Keep the more severe outcome across workers (ERROR > FAILURE > IGNORE > PASS).
        if (Hypium.resultSeverity(result) > Hypium.resultSeverity(item.result)) {
          item.result = result;
          item.currentThreadName = currentThreadName;
        }
      } else {
        let it: ItItemIF = {
          description: description,
          currentThreadName: currentThreadName,
          result: result
        };
        allItemList.push(it);
      }
    }
  }

  static configWorkerItTestResult(retResult: TestcaseRet, allItemList: Array<ItItemIF>): void {
    for (const item of allItemList) {
      const description = item.description;
      const result = item.result;
      console.info(`${TAG}, description, ${description}, result,${result}`);
      retResult.total++;
      if (result === TestResultCode.PASS) {
        retResult.pass++;
      } else if (result === TestResultCode.ERROR) {
        retResult.error++;
      } else if (result === TestResultCode.FAILURE) {
        retResult.failure++;
      } else {
        retResult.ignore++;
      }
    }
  }

  static printWorkerTestResult(abilityDelegator: abilityDelegatorRegistry.AbilityDelegator, allItemList: Array<ItItemIF>): void {
    let index = 1;
    for (const itemValue of allItemList) {
      const description = itemValue.description;
      const result = itemValue.result;
      const itArray = description.split('#');
      let des = 'undefined';
      let itName = 'undefined';
      if (itArray.length > 1) {
        des = itArray[0];
        itName = itArray[1];
      } else if (itArray.length === 1) {
        des = itArray[0];
        itName = itArray[0];
      }
      let msg = `\n${PrintTag.OHOS_REPORT_WORKER_STATUS}: class=${des}`;
      msg += `\n${PrintTag.OHOS_REPORT_WORKER_STATUS}: test=${itName}`;
      msg += `\n${PrintTag.OHOS_REPORT_WORKER_STATUS}: current=${index}`;
      msg += `\n${PrintTag.OHOS_REPORT_WORKER_STATUS}: CODE=${result}`;
      abilityDelegator.printSync(msg);
      index++;
    }
  }
}
