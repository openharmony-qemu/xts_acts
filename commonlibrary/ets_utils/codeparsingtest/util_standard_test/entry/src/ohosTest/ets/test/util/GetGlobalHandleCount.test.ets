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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import worker, { MessageEvents, ErrorEvent } from '@ohos.worker';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function getGlobalHandleCountTest() {

  describe('getGlobalHandleCountTest', () => {
    /**
     * @tc.name   testGetGlobalHandleCount001
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_0100
     * @tc.desc   Test getGlobalHandleCount returns a non-negative number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGlobalHandleCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount001';
      console.info(`${TAG} START`);
      try {
        let count: number = util.ArkTSVM.getGlobalHandleCount();
        expect(typeof count === 'number').assertTrue();
        expect(count >= 0).assertTrue();
        console.info(`${TAG} count: ${count}`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount002
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_0200
     * @tc.desc   Test two consecutive calls of getGlobalHandleCount both return valid
     *            non-negative numbers. The global handle count is a live VM metric that
     *            may change due to background threads or GC, so exact equality between
     *            two reads is not asserted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount002';
      console.info(`${TAG} START`);
      try {
        let count1: number = util.ArkTSVM.getGlobalHandleCount();
        let count2: number = util.ArkTSVM.getGlobalHandleCount();
        expect(typeof count1 === 'number' && count1 >= 0).assertTrue();
        expect(typeof count2 === 'number' && count2 >= 0).assertTrue();
        console.info(`${TAG} count1: ${count1}, count2: ${count2}`);
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount003
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_0300
     * @tc.desc   Test repeated calls of getGlobalHandleCount always return a
     *            non-negative number and never throw.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount003';
      console.info(`${TAG} START`);
      const CALL_TIMES = 10;
      try {
        for (let i = 0; i < CALL_TIMES; i++) {
          let count: number = util.ArkTSVM.getGlobalHandleCount();
          expect(count >= 0).assertTrue();
        }
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetGlobalHandleCount004
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_0400
     * @tc.desc   Test getGlobalHandleCount called in a worker thread returns the count of the worker's own VM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testGetGlobalHandleCount004';
      console.info(`${TAG} START`);
      let isTerminate = false;
      let newWorker = new worker.ThreadWorker('./GetGlobalHandleCountWorker.ets');
      newWorker.onexit = () => {
        isTerminate = true;
      }
      newWorker.onerror = (err: ErrorEvent) => {
        console.error(`${TAG} worker error: ${err.message}`);
        expect().assertFail();
        newWorker.terminate();
      }
      newWorker.onmessage = (e: MessageEvents): void => {
        let count: number = e.data as number;
        console.info(`${TAG} worker VM count: ${count}`);
        expect(typeof count === 'number').assertTrue();
        expect(count >= 0).assertTrue();
        newWorker.terminate();
      }
      newWorker.postMessage('query');
      while (!isTerminate) {
        await sleep(100);
      }
      done();
    });

    /**
     * @tc.name   testGetGlobalHandleCount005
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_0500
     * @tc.desc   Test getGlobalHandleCount called repeatedly in a larger loop always returns valid
     *            finite non-negative numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount005';
      console.info(`${TAG} START`);
      const CALL_TIMES = 100;
      try {
        for (let i = 0; i < CALL_TIMES; i++) {
          let count: number = util.ArkTSVM.getGlobalHandleCount();
          expect(count >= 0).assertTrue();
          expect(Number.isFinite(count)).assertTrue();
        }
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      }
      done();
    });
  })
}
