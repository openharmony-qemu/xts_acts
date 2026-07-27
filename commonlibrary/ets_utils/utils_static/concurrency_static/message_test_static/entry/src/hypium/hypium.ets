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
import { DataDriverAttr, DataDriverData, DataDriverSuite, TestcaseSummaryIF, SendData, TestcaseRet, ItItemIF } from './interface';
import { AnyType, CustomAssert } from './module/types/common';
import { ConfigService } from './module/config/configService';
import hilog from '@ohos.hilog';
import { ExpectService } from './module/service/ExpectService';
import { SuiteService } from './module/service/SuiteService';
import { AssertResult } from './module/modal/assertModel';

let domain: int = 0x0000;
let tag: string = 'testTag';

export class Hypium {
  // Suites are shared by worker id; postTask only captures serializable primitives.
  private static workerSuiteById: Map<int, () => void> = new Map<int, () => void>();

  private static parseParametersJson(parametersJson: string): Record<string, string> {
    const result: Record<string, string> = {};
    const root = JSON.parseJsonElement(parametersJson);
    for (const entry of root) {
      const key = entry[0];
      const valueElem = entry[1];
      const asString = valueElem.tryAsString();
      if (asString !== undefined) {
        result[key] = asString;
      }
    }
    return result;
  }

  public static context: Map<string, AnyType> = new Map<string, AnyType>();
  private static readonly MAX_PARSE_DEPTH: number = 20;
  private static readonly INITIAL_DEPTH: number = 1;

  static parseValue(value: jsonx.JsonElement, currentDepth: number): Array<Object | null | undefined> | Record<string, AnyType> | string | int | double | boolean | null | undefined {
    if (currentDepth > Hypium.MAX_PARSE_DEPTH) {
      throw new Error('Maximum parsing depth exceeded. currentParseDepth is ' + currentDepth);
    }
    if (value.tryAsNull() !== undefined) {
      return null
    }
    // Avoid truthy checks: "", 0, false are valid JSON values.
    const asString = value.tryAsString();
    if (asString !== undefined) {
      return asString
    }
    const asInteger = value.tryAsInteger();
    if (asInteger !== undefined) {
      return asInteger
    }
    const asDouble = value.tryAsDouble();
    if (asDouble !== undefined) {
      return asDouble
    }
    const asBoolean = value.tryAsBoolean();
    if (asBoolean !== undefined) {
      return asBoolean
    }
    const asArray = value.tryAsArray();
    if (asArray !== undefined) {
      const parsedValue: Array<object | undefined | null> = []
      for (const val of asArray) {
        // 数组元素保持同一层数
        parsedValue.push(Hypium.parseValue(val, currentDepth))
      }
      return parsedValue;
    }
    // 当时对象时，层数递增1位
    return Hypium.parseParams(value, currentDepth + 1)
  }

  static parseParams(paramsItem: jsonx.JsonElement, currentDepth: number): Record<string, AnyType> {
    const it = paramsItem.$_iterator()
    const tempRecord: Record<string, AnyType> = {}
    while (true) {
      const v = it.next()
      if (v.done) {
        break
      }
      const entry = v.value;
      if (entry === null || entry === undefined) {
        throw new Error('parseParams: iterator value is null or undefined');
      }
      // ArkTS does not preserve iterator-value narrowing for indexed access.
      const key = entry![0];
      const value = entry![1];
      tempRecord[key] = Hypium.parseValue(value, currentDepth)
    }
    return tempRecord;
  }

  static parseSuite(item: jsonx.JsonElement): DataDriverSuite {
    let describe: string[] | undefined
    if (item.tryGetElement("describe") !== undefined) {
      const parsedDescribe: string[] = []
      const describeValue = item.getArray("describe")
      for (const describeItem of describeValue) {
        const describeName = describeItem.asString()
        parsedDescribe.push(describeName)
      }
      describe = parsedDescribe
    }

    let params: Record<string, AnyType> = {};
    let paramsArray: Record<string, AnyType>[] = []
    if (item.tryGetElement("params") !== undefined) {
      const paramsElement = item.getElement("params");
      const paramsValue = paramsElement.tryAsArray();
      if (Array.isArray(paramsValue)) {
        const paramArray = paramsValue as Array<jsonx.JsonElement>
        for (const paramsItem of paramArray) {
          const tempRecord = Hypium.parseParams(paramsItem, Hypium.INITIAL_DEPTH)
          paramsArray.push(tempRecord)
        }
      } else {
        params = Hypium.parseParams(paramsElement, Hypium.INITIAL_DEPTH)
      }
    } else {
      params = {}
    }

    let items: DataDriverSuite[] | undefined = [];
    if (item.tryGetElement("items") !== undefined) {
      const itemsValue = item.getArray("items");
      for (const childItem of itemsValue) {
        const parsedChild = Hypium.parseSuite(childItem);
        items?.push(parsedChild);
      }
    } else {
      items = undefined;
    }

    let stress: number | undefined = 1;
    if (item.tryGetElement("stress") !== undefined) {
      stress = item.getElement("stress").asDouble() as number;
    }

    let it: string | undefined = undefined;
    if (item.tryGetElement("it") !== undefined) {
      it = item.getElement("it").asString();
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
    let suitesValue: Array<jsonx.JsonElement> | undefined = [];
    if (jsonData.tryGetElement("suites") !== undefined) {
      suitesValue = jsonData.getArray("suites");
    } else {
      throw Error('suites is null');
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

  static set(key: string, value: AnyType): void {
    Hypium.context.set(key, value);
  }

  static get(key: string): AnyType | undefined {
    return Hypium.context.get(key);
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
    if (core) {
      core.addService('expect', expectExtend);
      core.addService('report', ohReport);
      core.init();
      core.subscribeEvent('spec', ohReport);
      core.subscribeEvent('suite', ohReport);
      core.subscribeEvent('task', ohReport);
      const cService = core.getDefaultService('config');
      if (cService !== null && abilityDelegatorArguments !== null) {
        const configService = cService as ConfigService;
        const testParameters = configService.translateParams(abilityDelegatorArguments.parameters);
        console.info(`${TAG}parameters:${JSON.stringify(testParameters)}`);
        configService.setConfig(testParameters);
      }
      testsuite();
      await core.execute(abilityDelegator);
    }
  }

  static async hypiumInitEAWorkers(
    abilityDelegator: abilityDelegatorRegistry.AbilityDelegator,
    abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs,
    workerNum: int,
    testsuite: () => void
  ): Promise<void> {
    let workerPromiseArray: Promise<TestcaseSummaryIF>[] = [];
    let startTime = SysTestKit.getRealTime();
    Core.getInstance();
    for (let i = 0; i < workerNum; i++) {
      const workerPromise: Promise<TestcaseSummaryIF> = Hypium.createEAWorkerPromise(i, testsuite,
        abilityDelegatorArguments) as Promise<TestcaseSummaryIF>;
      workerPromiseArray.push(workerPromise);
    }
    let runTimes: int = 0;
    let totalDuration: int = 0;
    return Promise.allSettled(workerPromiseArray).then(async (settledResults: Array<PromiseSettledResult<TestcaseSummaryIF>>) => {
      let items: Array<TestcaseSummaryIF> = [];
      let rejectDetails: Array<string> = [];
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
      let allItemList = new Array<ItItemIF>();
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
      let endTime = SysTestKit.getRealTime();
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

  static createEAWorkerPromise(i: int, testsuite: () => void,
    abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs): Promise<TestcaseSummaryIF> {
    // Capture only serializable primitives into the worker task; look up suite by id.
    Hypium.workerSuiteById.set(i, testsuite);
    const workerId: int = i;
    const bundleName: string = abilityDelegatorArguments.bundleName;
    const testCaseNames: string = abilityDelegatorArguments.testCaseNames;
    const testRunnerClassName: string = abilityDelegatorArguments.testRunnerClassName;
    const parametersJson: string = JSON.stringify(abilityDelegatorArguments.parameters);
    const workerPromise: Promise<TestcaseSummaryIF> = new Promise<TestcaseSummaryIF>(
      (resolve: (value: TestcaseSummaryIF | PromiseLike<TestcaseSummaryIF>) => void, reject: (reason: Error) => void): void => {
      const worker = new EAWorker(`EAWork_${i}`);
      worker.start();
      worker.setUncaughtExceptionHandler((e: Error): void => {
        // An uncaught exception terminates the worker; do not access the main-thread worker reference here.
        Hypium.workerSuiteById.delete(workerId);
        hilog.error(domain, tag, `worker error: ${e.message}`);
        reject(e);
      });
      // MessageHandler / quit / getName must use the worker-local EAWorker (EAWorker.current()),
      // not the main-thread worker reference captured across threads.
      // Do not pass AbilityDelegator into the worker; results go back via MessageHandler / summary resolve.
      worker.postTask((): void => {
        const current = EAWorker.current();
        if (current === undefined) {
          Hypium.workerSuiteById.delete(workerId);
          reject(new Error('EAWorker.current() is undefined inside worker task'));
          return;
        }
        const localWorker: EAWorker = current;
        let settled = false;
        const quitLocal = (): void => {
          try {
            localWorker.quit();
          } catch (quitError) {
            hilog.error(domain, tag, 'Failed to quit worker: ' + JSON.stringify(quitError));
          }
        };
        const safeResolve = (summary: TestcaseSummaryIF): void => {
          if (settled) {
            return;
          }
          settled = true;
          Hypium.workerSuiteById.delete(workerId);
          quitLocal();
          resolve(summary);
        };
        const safeReject = (err: Error): void => {
          if (settled) {
            return;
          }
          settled = true;
          Hypium.workerSuiteById.delete(workerId);
          quitLocal();
          reject(err);
        };
        const currentCB = (msg: concurrency.Message): void => {
          const messageType = msg.getWhat();
          if (messageType !== 1) {
            hilog.error(domain, tag, `Unexpected EAWorker message type: ${messageType}`);
            safeReject(new Error(`Unexpected EAWorker message type: ${messageType}`));
            return;
          }
          const raw = msg.getObject();
          if (raw === null || raw === undefined) {
            hilog.error(domain, tag, 'EAWorker message object is null');
            safeReject(new Error('EAWorker message object is null'));
            return;
          }
          // Message type 1 is emitted only by OhReport with a SendData payload.
          const data = raw as SendData;
          const summary = data.summary;
          if (summary === null || summary === undefined) {
            hilog.error(domain, tag, 'EAWorker message missing summary');
            safeReject(new Error('EAWorker message missing summary'));
            return;
          }
          const currentThreadName = data.currentThreadName;
          hilog.info(domain, tag, 'receview data from ' + currentThreadName + ' ' + JSON.stringify(data));
          safeResolve(summary);
        };
        const msgHandler = new concurrency.MessageHandler(currentCB, localWorker);
        const core = new Core();
        core.msgHandle = msgHandler;
        Core.setThreadInstance(core);
        const workerName = localWorker.getName();
        hilog.info(domain, tag, 'Run test in Worker ' + workerName);
        if (!Hypium.workerSuiteById.has(workerId)) {
          safeReject(new Error(`worker suite missing for id ${workerId}`));
          return;
        }
        const suite = Hypium.workerSuiteById.get(workerId) as () => void;
        // Rebuild AbilityDelegatorArgs from serialized primitives on the worker thread.
        const localArgs: abilityDelegatorRegistry.AbilityDelegatorArgs = {
          bundleName: bundleName,
          parameters: Hypium.parseParametersJson(parametersJson),
          testCaseNames: testCaseNames,
          testRunnerClassName: testRunnerClassName
        };
        // Pass null AbilityDelegator: finishTest must stay on the main thread.
        Hypium.hypiumTest(null, localArgs, suite).then(
          (): void => {
            const coreInst = Core.getInstance();
            if (coreInst === null) {
              safeReject(new Error('Core is null after worker hypiumTest'));
              return;
            }
            const suiteService = coreInst.getDefaultService('suite');
            if (suiteService !== null && suiteService instanceof SuiteService) {
              safeResolve((suiteService as SuiteService).getSummary());
              return;
            }
            safeReject(new Error('suite service missing after worker hypiumTest'));
          },
          (e: Error): void => {
            hilog.error(domain, tag, 'hypiumTest error: ' + JSON.stringify(e));
            safeReject(e instanceof Error ? e : new Error(String(e)));
          }
        );
      });
    });
    return workerPromise;
  }


  static handleItResult(allItemList: Array<ItItemIF>, itItemList: Array<ItItemIF>): void {
    for (const itItem of itItemList) {
      const description = itItem.description;
      const result = itItem.result;
      const currentThreadName = itItem.currentThreadName;
      const item = allItemList.find((it: ItItemIF) => (it.description === description));
      if (item) {
        // Never overwrite a prior failure/error with a later pass from another worker.
        if (item.result === 0 && result !== 0) {
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
      if (result === 0) {
        retResult.pass++;
      } else if (result === -1) {
        retResult.error++;
      } else if (result === -2) {
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
