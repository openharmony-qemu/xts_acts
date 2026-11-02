/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { ErrorEvent, MessageEvents, worker } from '@kit.ArkTS';

declare function requireNapi(moduleName: string, isShared?: boolean): Object | undefined;

interface ValidModuleResult {
  isSendable: boolean;
  initCount: number;
  addResult: number;
}

interface FailModuleResult {
  isUndefined: boolean;
}

export default function napiSharedModuleTest() {
  describe('napiSharedModuleTest', () => {

    afterEach(async () => {
      console.info('[napiSharedModuleTest] after each called')
    });

    /**
     * @tc.name   napiSharedModuleTest001
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SHARED_MODULE_0001
     * @tc.desc   Load shared module from main thread, verify sendable export root.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiSharedModuleTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('napiSharedModuleTest001 START');
      try {
        let mod = requireNapi('sharedtestvalid', true);
        expect(mod !== undefined && mod !== null).assertTrue();
        let addResult = (mod as Object as Record<string, Function>)['add'](1, 2) as number;
        console.info('napiSharedModuleTest001 add(1,2)=' + addResult);
        expect(addResult).assertEqual(3);
        let initCount = (mod as Object as Record<string, Function>)['getInitCount']() as number;
        console.info('napiSharedModuleTest001 getInitCount()=' + initCount);
        expect(initCount).assertEqual(1);
        console.info('napiSharedModuleTest001 END');
      } catch (err) {
        expect().assertFail();
        console.info('napiSharedModuleTest001 ERROR: ' + err + ' stack: ' + err.stack);
      }
      done();
    });

    /**
     * @tc.name   napiSharedModuleTest002
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SHARED_MODULE_0002
     * @tc.desc   Second import returns same root, init count stays 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiSharedModuleTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('napiSharedModuleTest002 START');
      try {
        let mod1 = requireNapi('sharedtestvalid', true);
        let mod2 = requireNapi('sharedtestvalid', true);
        expect(mod1 !== undefined && mod1 !== null).assertTrue();
        expect(mod2 !== undefined && mod2 !== null).assertTrue();
        let initCount = (mod2 as Object as Record<string, Function>)['getInitCount']() as number;
        console.info('napiSharedModuleTest002 getInitCount()=' + initCount);
        expect(initCount).assertEqual(1);
        let addResult1 = (mod1 as Object as Record<string, Function>)['add'](10, 20) as number;
        let addResult2 = (mod2 as Object as Record<string, Function>)['add'](10, 20) as number;
        console.info('napiSharedModuleTest002 add(10,20)=' + addResult1 + ',' + addResult2);
        expect(addResult1).assertEqual(addResult2);
        console.info('napiSharedModuleTest002 END');
      } catch (err) {
        expect().assertFail();
        console.info('napiSharedModuleTest002 ERROR: ' + err + ' stack: ' + err.stack);
      }
      done();
    });

    /**
     * @tc.name   napiSharedModuleTest003
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SHARED_MODULE_0003
     * @tc.desc   Load shared module from Worker, verify same init count.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiSharedModuleTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('napiSharedModuleTest003 START');
      let wkr = new worker.ThreadWorker('entry/ets/workers/SharedModuleWorker.ets');
      wkr.onmessage = (e: MessageEvents) => {
        try {
          let data = e.data as ValidModuleResult;
          expect(data.isSendable).assertTrue();
          expect(data.initCount).assertEqual(1);
          expect(data.addResult).assertEqual(7);
          wkr.terminate();
          console.info('napiSharedModuleTest003 END');
          done();
        } catch (err) {
          wkr.terminate();
          expect().assertFail();
          console.info('napiSharedModuleTest003 ERROR: ' + err);
          done();
        }
      };
      wkr.onerror = (err: ErrorEvent) => {
        wkr.terminate();
        expect().assertFail();
        console.info('napiSharedModuleTest003 onerror: ' + err);
        done();
      };
      wkr.postMessage('loadSharedModule');
    });

    /**
     * @tc.name   napiSharedModuleTest004
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SHARED_MODULE_0004
     * @tc.desc   Shared module callback returns null -> undefined export.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiSharedModuleTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('napiSharedModuleTest004 START');
      try {
        let mod = requireNapi('sharedtestfail', true);
        expect(mod === undefined || mod === null).assertTrue();
        console.info('napiSharedModuleTest004 END');
      } catch (err) {
        console.info('napiSharedModuleTest004 caught (expected): ' + err + ' stack: ' + err.stack);
      }
      done();
    });

    /**
     * @tc.name   napiSharedModuleTest005
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SHARED_MODULE_0005
     * @tc.desc   Shared module callback returns non-sendable object -> undefined export.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiSharedModuleTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('napiSharedModuleTest005 START');
      try {
        let mod = requireNapi('sharedtestnonsendable', true);
        expect(mod === undefined || mod === null).assertTrue();
        console.info('napiSharedModuleTest005 END');
      } catch (err) {
        console.info('napiSharedModuleTest005 caught (expected): ' + err);
      }
      done();
    });

    /**
     * @tc.name   napiSharedModuleTest006
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SHARED_MODULE_0006
     * @tc.desc   Load fail module from Worker, verify undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiSharedModuleTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('napiSharedModuleTest006 START');
      let wkr = new worker.ThreadWorker('entry/ets/workers/SharedModuleWorker.ets');
      wkr.onmessage = (e: MessageEvents) => {
        try {
          let data = e.data as FailModuleResult;
          expect(data.isUndefined).assertTrue();
          wkr.terminate();
          console.info('napiSharedModuleTest006 END');
          done();
        } catch (err) {
          wkr.terminate();
          expect().assertFail();
          console.info('napiSharedModuleTest006 ERROR: ' + err);
          done();
        }
      };
      wkr.onerror = (err: ErrorEvent) => {
        wkr.terminate();
        expect().assertFail();
        console.info('napiSharedModuleTest006 onerror: ' + err);
        done();
      };
      wkr.postMessage('loadSharedModuleFail');
    });

    /**
     * @tc.name   napiSharedModuleTest007
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SHARED_MODULE_0007
     * @tc.desc   5 workers concurrently load same shared module, verify shared root.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiSharedModuleTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('napiSharedModuleTest007 START');
      const WORKER_COUNT = 5;
      let results: ValidModuleResult[] = [];
      let received = 0;
      let finished = false;
      let workers: worker.ThreadWorker[] = [];

      let cleanupAll = () => {
        for (let i = 0; i < workers.length; i++) {
          try {
            workers[i].terminate();
          } catch (e) {
          }
        }
      };

      let onError = (msg: string) => {
        if (finished) {
          return;
        }
        finished = true;
        cleanupAll();
        expect().assertFail();
        console.info(msg);
        done();
      };

      for (let i = 0; i < WORKER_COUNT; i++) {
        let wkr = new worker.ThreadWorker('entry/ets/workers/SharedModuleWorker.ets');
        workers.push(wkr);
        wkr.onmessage = (e: MessageEvents) => {
          try {
            let data = e.data as ValidModuleResult;
            results[received] = data;
            received++;
            if (received === WORKER_COUNT && !finished) {
              finished = true;
              cleanupAll();
              for (let j = 0; j < WORKER_COUNT; j++) {
                expect(results[j].isSendable).assertTrue();
                expect(results[j].initCount).assertEqual(1);
                expect(results[j].addResult).assertEqual(7);
              }
              console.info('napiSharedModuleTest007 END, all ' + WORKER_COUNT + ' workers returned');
              done();
            }
          } catch (err) {
            onError('napiSharedModuleTest007 ERROR: ' + err);
          }
        };
        wkr.onerror = (err: ErrorEvent) => {
          onError('napiSharedModuleTest007 onerror: ' + err);
        };
      }

      for (let i = 0; i < WORKER_COUNT; i++) {
        workers[i].postMessage('loadSharedModule');
      }
    });
  });
}
