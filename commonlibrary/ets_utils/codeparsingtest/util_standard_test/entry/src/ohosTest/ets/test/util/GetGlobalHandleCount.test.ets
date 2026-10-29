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

import { describe, afterEach, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import worker, { MessageEvents, ErrorEvent } from '@ohos.worker';
import testNapi from 'libentry.so';
import { hidebug } from '@kit.PerformanceAnalysisKit';
import { fileIo as fs, statfs } from '@kit.CoreFileKit';

const FILES_DIR = '/data/storage/el2/base/files/';
const FREE_SIZE_THRESHOLD = 30 * 1024 * 1024 * 1024;

@Sendable
class SendableData {
  public value: number = 0;
}

class WeakRefTarget {
  public value: number = 0;
}

class WrapTarget {
  public value: number = 0;
}

let globalClosureTarget: WrapTarget = new WrapTarget();

let activeTimerIds: Array<number> = [];

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function getGlobalHandleCountTest() {

  describe('getGlobalHandleCountTest', () => {
    /**
     * run after testcase, restore native reference environment.
     * Note: hypium skips afterEach when an it body throws (any assertion failure throws
     * AssertException), so this hook only runs after passing tests. Tests that create
     * native state therefore clean up in a finally block as the reliable path.
     */
    afterEach(() => {
      testNapi.clearStrongRefs();
      testNapi.clearStrongSendableRefs();
      testNapi.clearNapiRefs();
      testNapi.clearWrapRefs();
      testNapi.clearDeferreds();
      testNapi.releaseThreadsafeFunctions();
      for (let i = 0; i < activeTimerIds.length; i++) {
        clearInterval(activeTimerIds[i]);
      }
      activeTimerIds = [];
    });
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
          expect(typeof count === 'number' && count >= 0).assertTrue();
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
    /**
     * @tc.name   testGetGlobalHandleCount006
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_0600
     * @tc.desc   Test getGlobalHandleCount increases after creating native strong references
     *            and decreases after deleting them.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGlobalHandleCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount006';
      console.info(`${TAG} START`);
      const STRONG_REF_COUNT = 5;
      try {
        let before: number = util.ArkTSVM.getGlobalHandleCount();
        let created: boolean = testNapi.createStrongRefs(STRONG_REF_COUNT);
        expect(created).assertTrue();
        let afterCreate: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} before: ${before}, afterCreate: ${afterCreate}`);
        expect(afterCreate - before >= STRONG_REF_COUNT).assertTrue();
        let deleted: boolean = testNapi.deleteStrongRefs(STRONG_REF_COUNT);
        expect(deleted).assertTrue();
        let afterDelete: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} afterDelete: ${afterDelete}`);
        expect(afterDelete < afterCreate).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        testNapi.clearStrongRefs();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount007
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_0700
     * @tc.desc   Test getGlobalHandleCount reflects a batch of native strong references:
     *            the count rises by at least the batch size and falls back after deletion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount007';
      console.info(`${TAG} START`);
      const BATCH_REF_COUNT = 100;
      try {
        let before: number = util.ArkTSVM.getGlobalHandleCount();
        let created: boolean = testNapi.createStrongRefs(BATCH_REF_COUNT);
        expect(created).assertTrue();
        let afterCreate: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} before: ${before}, afterCreate: ${afterCreate}`);
        expect(afterCreate - before >= BATCH_REF_COUNT).assertTrue();
        let deleted: boolean = testNapi.deleteStrongRefs(BATCH_REF_COUNT);
        expect(deleted).assertTrue();
        let afterDelete: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} afterDelete: ${afterDelete}`);
        expect(afterDelete - before < BATCH_REF_COUNT).assertTrue();
        expect(afterDelete < afterCreate).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        testNapi.clearStrongRefs();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount008
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_0800
     * @tc.desc   Test getGlobalHandleCount is not affected by strong sendable references,
     *            which are stored in a separate sendable global storage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount008';
      console.info(`${TAG} START`);
      const SENDABLE_REF_COUNT = 50;
      try {
        let data: SendableData = new SendableData();
        let before: number = util.ArkTSVM.getGlobalHandleCount();
        let created: boolean = testNapi.createStrongSendableRefs(data, SENDABLE_REF_COUNT);
        expect(created).assertTrue();
        let after: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} before: ${before}, after: ${after}`);
        expect(after - before < SENDABLE_REF_COUNT).assertTrue();
        let cleared: boolean = testNapi.clearStrongSendableRefs();
        expect(cleared).assertTrue();
        let afterClear: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} afterClear: ${afterClear}`);
        expect(afterClear - before < SENDABLE_REF_COUNT).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        testNapi.clearStrongSendableRefs();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount009
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_0900
     * @tc.desc   Test the count is queried on the VM of the calling thread: strong references
     *            created inside a worker change only the worker VM's count, and the main VM's
     *            count is not affected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testGetGlobalHandleCount009';
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
      let mainBefore: number = util.ArkTSVM.getGlobalHandleCount();
      newWorker.onmessage = (e: MessageEvents): void => {
        let result: number[] = e.data as number[];
        let mainAfter: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} worker result: ${result}, mainBefore: ${mainBefore}, mainAfter: ${mainAfter}`);
        expect(result.length === 6).assertTrue();
        let workerBefore: number = result[0];
        let workerAfterCreate: number = result[1];
        let workerAfterDelete: number = result[2];
        let workerRefCount: number = result[3];
        let workerCreateOk: number = result[4];
        let workerDeleteOk: number = result[5];
        expect(workerCreateOk === 1).assertTrue();
        expect(workerDeleteOk === 1).assertTrue();
        expect(workerAfterCreate - workerBefore >= workerRefCount).assertTrue();
        expect(workerAfterDelete - workerBefore < workerRefCount).assertTrue();
        expect(Math.abs(mainAfter - mainBefore) < workerRefCount).assertTrue();
        newWorker.terminate();
      }
      newWorker.postMessage('strongRefTest');
      while (!isTerminate) {
        await sleep(100);
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount010
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_1000
     * @tc.desc   Test getGlobalHandleCount is not increased by ArkTS WeakRef objects, because
     *            weak references are stored in a separate weak reference list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount010';
      console.info(`${TAG} START`);
      const WEAK_REF_COUNT = 1000;
      try {
        let target: WeakRefTarget = new WeakRefTarget();
        let weakRefs: Array<WeakRef<WeakRefTarget>> = new Array();
        let before: number = util.ArkTSVM.getGlobalHandleCount();
        for (let i = 0; i < WEAK_REF_COUNT; i++) {
          weakRefs.push(new WeakRef<WeakRefTarget>(target));
        }
        let after: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} before: ${before}, after: ${after}`);
        expect(after - before < WEAK_REF_COUNT).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount011
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_1100
     * @tc.desc   Test getGlobalHandleCount increases after creating strong napi references
     *            via napi_create_reference and decreases after napi_delete_reference.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGlobalHandleCount011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount011';
      console.info(`${TAG} START`);
      const NAPI_REF_COUNT = 10;
      try {
        let before: number = util.ArkTSVM.getGlobalHandleCount();
        let created: boolean = testNapi.createNapiRefs(NAPI_REF_COUNT, 1);
        expect(created).assertTrue();
        let afterCreate: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} before: ${before}, afterCreate: ${afterCreate}`);
        expect(afterCreate - before >= NAPI_REF_COUNT).assertTrue();
        let deleted: boolean = testNapi.deleteNapiRefs(NAPI_REF_COUNT);
        expect(deleted).assertTrue();
        let afterDelete: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} afterDelete: ${afterDelete}`);
        expect(afterDelete < afterCreate).assertTrue();
        expect(afterDelete - before < NAPI_REF_COUNT).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        testNapi.clearNapiRefs();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount012
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_1200
     * @tc.desc   Test refcount-0 napi references are weak and not counted, and
     *            napi_reference_ref/napi_reference_unref transitions between weak and
     *            strong change the count accordingly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount012';
      console.info(`${TAG} START`);
      const WEAK_NAPI_REF_COUNT = 10;
      try {
        let before: number = util.ArkTSVM.getGlobalHandleCount();
        let created: boolean = testNapi.createNapiRefs(WEAK_NAPI_REF_COUNT, 0);
        expect(created).assertTrue();
        let afterWeakCreate: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} before: ${before}, afterWeakCreate: ${afterWeakCreate}`);
        expect(afterWeakCreate - before < WEAK_NAPI_REF_COUNT).assertTrue();
        let refed: boolean = testNapi.refNapiRefs(WEAK_NAPI_REF_COUNT);
        expect(refed).assertTrue();
        let afterRef: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} afterWeakCreate: ${afterWeakCreate}, afterRef: ${afterRef}`);
        expect(afterRef - afterWeakCreate >= WEAK_NAPI_REF_COUNT).assertTrue();
        let unrefed: boolean = testNapi.unrefNapiRefs(WEAK_NAPI_REF_COUNT);
        expect(unrefed).assertTrue();
        let afterUnref: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} afterRef: ${afterRef}, afterUnref: ${afterUnref}`);
        expect(afterUnref < afterRef).assertTrue();
        let deleted: boolean = testNapi.deleteNapiRefs(WEAK_NAPI_REF_COUNT);
        expect(deleted).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        testNapi.clearNapiRefs();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount013
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_1300
     * @tc.desc   Test getGlobalHandleCount increases after napi_wrap creates strong wrap
     *            references and decreases after napi_remove_wrap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount013';
      console.info(`${TAG} START`);
      const WRAP_COUNT = 10;
      try {
        let targets: Array<object> = [];
        for (let i = 0; i < WRAP_COUNT; i++) {
          targets.push(new WrapTarget());
        }
        let before: number = util.ArkTSVM.getGlobalHandleCount();
        let wrapped: boolean = testNapi.wrapObjects(targets);
        expect(wrapped).assertTrue();
        let afterWrap: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} before: ${before}, afterWrap: ${afterWrap}`);
        expect(afterWrap - before >= WRAP_COUNT).assertTrue();
        let removed: boolean = testNapi.removeWraps(targets);
        expect(removed).assertTrue();
        let afterRemove: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} afterRemove: ${afterRemove}`);
        expect(afterRemove < afterWrap).assertTrue();
        expect(afterRemove - before < WRAP_COUNT).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        testNapi.clearWrapRefs();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount014
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_1400
     * @tc.desc   Test getGlobalHandleCount increases after napi_create_promise and
     *            decreases after the deferred is settled by napi_resolve_deferred or
     *            napi_reject_deferred.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount014';
      console.info(`${TAG} START`);
      const PROMISE_COUNT = 10;
      try {
        let before: number = util.ArkTSVM.getGlobalHandleCount();
        let promises: Array<Promise<object>> = testNapi.createPromises(PROMISE_COUNT);
        expect(promises.length === PROMISE_COUNT).assertTrue();
        let afterCreate: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} before: ${before}, afterCreate: ${afterCreate}`);
        expect(afterCreate - before >= PROMISE_COUNT).assertTrue();
        for (let i = 0; i < promises.length; i++) {
          promises[i].catch((): void => {});
        }
        let settled: boolean = testNapi.settlePromises();
        expect(settled).assertTrue();
        let afterSettle: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} afterSettle: ${afterSettle}`);
        expect(afterSettle < afterCreate).assertTrue();
        expect(afterSettle - before < PROMISE_COUNT).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        testNapi.clearDeferreds();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount015
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_1500
     * @tc.desc   Test napi_create_threadsafe_function allocates a counted global handle for
     *            the callback reference, napi_acquire_threadsafe_function allocates none, and
     *            napi_release_threadsafe_function with abort releases them asynchronously
     *            on the JS event loop.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testGetGlobalHandleCount015';
      console.info(`${TAG} START`);
      const TSFN_COUNT = 5;
      const POLL_TIMES = 50;
      try {
        let callback = (): void => {
          console.info(`${TAG} threadsafe callback invoked`);
        };
        let before: number = util.ArkTSVM.getGlobalHandleCount();
        let created: boolean = testNapi.createThreadsafeFunctions(callback, TSFN_COUNT);
        expect(created).assertTrue();
        let afterCreate: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} before: ${before}, afterCreate: ${afterCreate}`);
        expect(afterCreate - before >= TSFN_COUNT).assertTrue();
        let acquired: boolean = testNapi.acquireThreadsafeFunctions();
        expect(acquired).assertTrue();
        let afterAcquire: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} afterAcquire: ${afterAcquire}`);
        expect(afterAcquire - afterCreate < TSFN_COUNT).assertTrue();
        let released: boolean = testNapi.releaseThreadsafeFunctions();
        expect(released).assertTrue();
        let settled = false;
        let finalCount: number = afterAcquire;
        for (let i = 0; i < POLL_TIMES; i++) {
          await sleep(100);
          finalCount = util.ArkTSVM.getGlobalHandleCount();
          if (finalCount <= afterCreate - 3) {
            settled = true;
            break;
          }
        }
        console.info(`${TAG} finalCount: ${finalCount}, settled: ${settled}`);
        expect(settled).assertTrue();
        expect(finalCount < afterCreate).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        testNapi.releaseThreadsafeFunctions();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount016
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_1600
     * @tc.desc   Test closures capturing a module-level global variable do not consume
     *            native global handles, because closures are managed by the VM heap
     *            (JSFunction plus lexical environment), not by the native global storage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount016';
      console.info(`${TAG} START`);
      const CLOSURE_COUNT = 1000;
      try {
        let closures: Array<() => number> = [];
        let before: number = util.ArkTSVM.getGlobalHandleCount();
        for (let i = 0; i < CLOSURE_COUNT; i++) {
          closures.push((): number => {
            globalClosureTarget.value = 1;
            return globalClosureTarget.value;
          });
        }
        let afterCreate: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} before: ${before}, afterCreate: ${afterCreate}`);
        expect(afterCreate - before < CLOSURE_COUNT).assertTrue();
        let sample: number = closures[0]() + closures[CLOSURE_COUNT - 1]();
        expect(sample === 2).assertTrue();
        let afterInvoke: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} afterInvoke: ${afterInvoke}`);
        expect(afterInvoke - before < CLOSURE_COUNT).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount017
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_1700
     * @tc.desc   Test an active setInterval timer is held by the native global storage:
     *            each timer keeps its callback alive through a counted strong napi
     *            reference, and clearInterval releases them synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount017';
      console.info(`${TAG} START`);
      const TIMER_COUNT = 10;
      const TIMER_INTERVAL_MS = 5000;
      try {
        let holder: WrapTarget = new WrapTarget();
        let before: number = util.ArkTSVM.getGlobalHandleCount();
        for (let i = 0; i < TIMER_COUNT; i++) {
          let cb = (): void => {
            console.info(`${TAG} tick ${holder.value}`);
          };
          activeTimerIds.push(setInterval(cb, TIMER_INTERVAL_MS));
        }
        let afterCreate: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} before: ${before}, afterCreate: ${afterCreate}`);
        expect(afterCreate - before >= TIMER_COUNT).assertTrue();
        for (let i = 0; i < activeTimerIds.length; i++) {
          clearInterval(activeTimerIds[i]);
        }
        activeTimerIds = [];
        let afterClear: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} afterClear: ${afterClear}`);
        expect(afterClear < afterCreate).assertTrue();
        expect(afterClear - before < TIMER_COUNT).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        for (let i = 0; i < activeTimerIds.length; i++) {
          clearInterval(activeTimerIds[i]);
        }
        activeTimerIds = [];
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount018
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_1800
     * @tc.desc   Test an object passed as a setInterval timer argument is also held by a
     *            counted strong napi reference in addition to the callback reference, and
     *            clearInterval releases all of them synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount018';
      console.info(`${TAG} START`);
      const TIMER_COUNT = 10;
      const TIMER_INTERVAL_MS = 5000;
      try {
        let holder: WrapTarget = new WrapTarget();
        let before: number = util.ArkTSVM.getGlobalHandleCount();
        for (let i = 0; i < TIMER_COUNT; i++) {
          let cb = (obj: WrapTarget): void => {
            console.info(`${TAG} tick ${obj.value}`);
          };
          activeTimerIds.push(setInterval(cb, TIMER_INTERVAL_MS, holder));
        }
        let afterCreate: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} before: ${before}, afterCreate: ${afterCreate}`);
        expect(afterCreate - before > TIMER_COUNT).assertTrue();
        for (let i = 0; i < activeTimerIds.length; i++) {
          clearInterval(activeTimerIds[i]);
        }
        activeTimerIds = [];
        let afterClear: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} afterClear: ${afterClear}`);
        expect(afterClear < afterCreate).assertTrue();
        expect(afterClear - before < TIMER_COUNT).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        for (let i = 0; i < activeTimerIds.length; i++) {
          clearInterval(activeTimerIds[i]);
        }
        activeTimerIds = [];
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount019
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_1900
     * @tc.desc   Test an independent ark runtime created via napi_create_ark_runtime
     *            returns a valid global handle count, verifying the sub-thread VM path
     *            is reachable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGlobalHandleCount019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount019';
      console.info(`${TAG} START`);
      try {
        let count: number = testNapi.getSubRuntimeHandleCount();
        console.info(`${TAG} sub-runtime count: ${count}`);
        expect(typeof count === 'number').assertTrue();
        expect(count >= 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount020
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_2000
     * @tc.desc   Test the ArkTS bridge getGlobalHandleCount and the C API
     *            napi_get_global_handle_count return the same value on the main thread
     *            at the same time, verifying AC-1.2 consistency.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGlobalHandleCount020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount020';
      console.info(`${TAG} START`);
      try {
        let capiCount: number = testNapi.getCApiHandleCount();
        let arktsCount: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} capiCount: ${capiCount}, arktsCount: ${arktsCount}`);
        expect(typeof capiCount === 'number' && capiCount >= 0).assertTrue();
        expect(typeof arktsCount === 'number' && arktsCount >= 0).assertTrue();
        expect(arktsCount === capiCount).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount021
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_2100
     * @tc.desc   Test the ArkTS bridge and the C API return the same value inside a
     *            worker thread (worker's own VM context), verifying AC-1.2 consistency
     *            in the worker VM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testGetGlobalHandleCount021';
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
        let result: number[] = e.data as number[];
        console.info(`${TAG} worker result: ${result}`);
        expect(result.length === 2).assertTrue();
        let arktsCount: number = result[0];
        let capiCount: number = result[1];
        console.info(`${TAG} worker arktsCount: ${arktsCount}, capiCount: ${capiCount}`);
        expect(typeof arktsCount === 'number' && arktsCount >= 0).assertTrue();
        expect(typeof capiCount === 'number' && capiCount >= 0).assertTrue();
        expect(arktsCount === capiCount).assertTrue();
        newWorker.terminate();
      }
      newWorker.postMessage('capiConsistency');
      while (!isTerminate) {
        await sleep(100);
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount022
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_2200
     * @tc.desc   Test that promises created by napi_create_promise but never settled
     *            (no resolve/reject) keep the global handle count elevated and do not
     *            fall back, verifying un-closed promises hold references.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount022';
      console.info(`${TAG} START`);
      const PROMISE_COUNT = 10;
      try {
        let before: number = util.ArkTSVM.getGlobalHandleCount();
        let promises: Array<Promise<object>> = testNapi.createPromises(PROMISE_COUNT);
        expect(promises.length === PROMISE_COUNT).assertTrue();
        let afterCreate: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} before: ${before}, afterCreate: ${afterCreate}`);
        expect(afterCreate - before >= PROMISE_COUNT).assertTrue();
        for (let i = 0; i < promises.length; i++) {
          promises[i].catch((): void => {});
        }
        let afterWait: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} afterWait (not settled): ${afterWait}`);
        expect(afterWait >= afterCreate).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        testNapi.clearDeferreds();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount024
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_2400
     * @tc.desc   Test an active setTimeout one-shot timer is held by the native global
     *            storage: each timer keeps its callback alive through a counted strong
     *            napi reference, and clearTimeout releases them synchronously.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount024';
      console.info(`${TAG} START`);
      const TIMER_COUNT = 10;
      const TIMER_DELAY_MS = 5000;
      try {
        let holder: WrapTarget = new WrapTarget();
        let before: number = util.ArkTSVM.getGlobalHandleCount();
        let timerIds: Array<number> = [];
        for (let i = 0; i < TIMER_COUNT; i++) {
          let cb = (): void => {
            console.info(`${TAG} timeout ${holder.value}`);
          };
          timerIds.push(setTimeout(cb, TIMER_DELAY_MS));
        }
        let afterCreate: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} before: ${before}, afterCreate: ${afterCreate}`);
        expect(afterCreate - before >= TIMER_COUNT).assertTrue();
        for (let i = 0; i < timerIds.length; i++) {
          clearTimeout(timerIds[i]);
        }
        let afterClear: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} afterClear: ${afterClear}`);
        expect(afterClear < afterCreate).assertTrue();
        expect(afterClear - before < TIMER_COUNT).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount026
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_2600
     * @tc.desc   Test getGlobalHandleCount reflects a large batch of 1000 napi_create_reference
     *            references: the count rises by at least 1000 and falls back after deletion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testGetGlobalHandleCount026';
      console.info(`${TAG} START`);
      const BATCH_COUNT = 1000;
      try {
        let before: number = util.ArkTSVM.getGlobalHandleCount();
        let created: boolean = testNapi.createNapiRefs(BATCH_COUNT, 1);
        expect(created).assertTrue();
        let afterCreate: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} before: ${before}, afterCreate: ${afterCreate}`);
        expect(afterCreate - before >= BATCH_COUNT).assertTrue();
        let deleted: boolean = testNapi.deleteNapiRefs(BATCH_COUNT);
        expect(deleted).assertTrue();
        let afterDelete: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} afterDelete: ${afterDelete}`);
        expect(afterDelete - before < BATCH_COUNT).assertTrue();
        expect(afterDelete < afterCreate).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        testNapi.clearNapiRefs();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount027
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_2700
     * @tc.desc   Test main thread and worker thread calling getGlobalHandleCount concurrently
     *            100 times each: all returns are valid numbers >= 0, main thread returns
     *            are consistent with the single-thread baseline (no cross-VM interference).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGlobalHandleCount027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = 'testGetGlobalHandleCount027';
      console.info(`${TAG} START`);
      const CALL_TIMES = 100;
      let baseline: number = util.ArkTSVM.getGlobalHandleCount();
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
      let workerResults: number[] = [];
      newWorker.onmessage = (e: MessageEvents): void => {
        workerResults = e.data as number[];
        console.info(`${TAG} worker returned ${workerResults.length} results`);
        expect(workerResults.length === CALL_TIMES).assertTrue();
        for (let i = 0; i < workerResults.length; i++) {
          expect(typeof workerResults[i] === 'number' && workerResults[i] >= 0).assertTrue();
        }
        newWorker.terminate();
      }
      newWorker.postMessage('concurrentQuery');
      let mainResults: number[] = [];
      for (let i = 0; i < CALL_TIMES; i++) {
        mainResults.push(util.ArkTSVM.getGlobalHandleCount());
      }
      console.info(`${TAG} main thread completed ${mainResults.length} calls`);
      for (let i = 0; i < mainResults.length; i++) {
        expect(typeof mainResults[i] === 'number' && mainResults[i] >= 0).assertTrue();
        expect(Math.abs(mainResults[i] - baseline) < 10).assertTrue();
      }
      while (!isTerminate) {
        await sleep(100);
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount028
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_2800
     * @tc.desc   Test using getGlobalHandleCount as a threshold trigger for heap profiling:
     *            when napi_create_reference pushes the count above a threshold, trigger
     *            hidebug.dumpJsHeapData and verify the snapshot file exists and is non-empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testGetGlobalHandleCount028';
      console.info(`${TAG} START`);
      const REF_COUNT = 50;
      const SNAPSHOT_NAME = 'globalhandle_napi_ref';
      const SNAPSHOT_KEYWORD = 'Object';
      try {
        let baseline: number = util.ArkTSVM.getGlobalHandleCount();
        let threshold: number = baseline + REF_COUNT;
        let created: boolean = testNapi.createNapiRefs(REF_COUNT, 1);
        expect(created).assertTrue();
        let current: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} baseline: ${baseline}, current: ${current}, threshold: ${threshold}`);
        expect(current >= threshold).assertTrue();
        if (current >= threshold) {
          let freeSize = await statfs.getFreeSize(FILES_DIR);
          if (freeSize > FREE_SIZE_THRESHOLD) {
            console.info(`${TAG} count exceeded threshold, triggering heap profiler`);
            hidebug.dumpJsHeapData(SNAPSHOT_NAME, true);
            let files: string[] = fs.listFileSync(FILES_DIR);
            let found = false;
            for (let i = 0; i < files.length; i++) {
              if (files[i].startsWith(SNAPSHOT_NAME)) {
                let filePath = FILES_DIR + files[i];
                let fileStat = fs.statSync(filePath);
                console.info(`${TAG} snapshot file: ${files[i]}, size: ${fileStat.size}`);
                expect(fileStat.size > 0).assertTrue();
                let content = fs.readTextSync(filePath);
                console.info(`${TAG} snapshot size: ${content.length} chars, keyword: ${SNAPSHOT_KEYWORD}`);
                expect(content.includes(SNAPSHOT_KEYWORD)).assertTrue();
                fs.unlinkSync(filePath);
                console.info(`${TAG} deleted snapshot file: ${files[i]}`);
                found = true;
                break;
              }
            }
            expect(found).assertTrue();
          }
        }
        let deleted: boolean = testNapi.deleteNapiRefs(REF_COUNT);
        expect(deleted).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        testNapi.clearNapiRefs();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount029
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_2900
     * @tc.desc   Test using getGlobalHandleCount as a threshold trigger for heap profiling:
     *            when napi_create_promise pushes the count above a threshold, trigger
     *            hidebug.dumpJsHeapData and verify the snapshot file exists and is non-empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testGetGlobalHandleCount029';
      console.info(`${TAG} START`);
      const PROMISE_COUNT = 50;
      const SNAPSHOT_NAME = 'globalhandle_promise';
      const SNAPSHOT_KEYWORD = 'Promise';
      try {
        let baseline: number = util.ArkTSVM.getGlobalHandleCount();
        let threshold: number = baseline + PROMISE_COUNT;
        let promises: Array<Promise<object>> = testNapi.createPromises(PROMISE_COUNT);
        expect(promises.length === PROMISE_COUNT).assertTrue();
        let current: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} baseline: ${baseline}, current: ${current}, threshold: ${threshold}`);
        expect(current >= threshold).assertTrue();
        if (current >= threshold) {
          let freeSize = await statfs.getFreeSize(FILES_DIR);
          if (freeSize > FREE_SIZE_THRESHOLD) {
            console.info(`${TAG} count exceeded threshold, triggering heap profiler`);
            hidebug.dumpJsHeapData(SNAPSHOT_NAME, true);
            let files: string[] = fs.listFileSync(FILES_DIR);
            let found = false;
            for (let i = 0; i < files.length; i++) {
              if (files[i].startsWith(SNAPSHOT_NAME)) {
                let filePath = FILES_DIR + files[i];
                let fileStat = fs.statSync(filePath);
                console.info(`${TAG} snapshot file: ${files[i]}, size: ${fileStat.size}`);
                expect(fileStat.size > 0).assertTrue();
                let content = fs.readTextSync(filePath);
                console.info(`${TAG} snapshot size: ${content.length} chars, keyword: ${SNAPSHOT_KEYWORD}`);
                expect(content.includes(SNAPSHOT_KEYWORD)).assertTrue();
                fs.unlinkSync(filePath);
                console.info(`${TAG} deleted snapshot file: ${files[i]}`);
                found = true;
                break;
              }
            }
            expect(found).assertTrue();
          }
        }
        for (let i = 0; i < promises.length; i++) {
          promises[i].catch((): void => {});
        }
        let settled: boolean = testNapi.settlePromises();
        expect(settled).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        testNapi.clearDeferreds();
      }
      done();
    });
    /**
     * @tc.name   testGetGlobalHandleCount030
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBALHANDLECOUNT1_3000
     * @tc.desc   Test using getGlobalHandleCount as a threshold trigger for heap profiling:
     *            when setInterval timers push the count above a threshold, trigger
     *            hidebug.dumpJsHeapData and verify the snapshot file exists and is non-empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobalHandleCount030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testGetGlobalHandleCount030';
      console.info(`${TAG} START`);
      const TIMER_COUNT = 50;
      const TIMER_INTERVAL_MS = 5000;
      const SNAPSHOT_NAME = 'globalhandle_setinterval';
      const SNAPSHOT_KEYWORD = 'Closure';
      try {
        let baseline: number = util.ArkTSVM.getGlobalHandleCount();
        let threshold: number = baseline + TIMER_COUNT;
        for (let i = 0; i < TIMER_COUNT; i++) {
          let cb = (): void => {
            console.info(`${TAG} tick`);
          };
          activeTimerIds.push(setInterval(cb, TIMER_INTERVAL_MS));
        }
        let current: number = util.ArkTSVM.getGlobalHandleCount();
        console.info(`${TAG} baseline: ${baseline}, current: ${current}, threshold: ${threshold}`);
        expect(current >= threshold).assertTrue();
        if (current >= threshold) {
          let freeSize = await statfs.getFreeSize(FILES_DIR);
          if (freeSize > FREE_SIZE_THRESHOLD) {
            console.info(`${TAG} count exceeded threshold, triggering heap profiler`);
            hidebug.dumpJsHeapData(SNAPSHOT_NAME, true);
            let files: string[] = fs.listFileSync(FILES_DIR);
            let found = false;
            for (let i = 0; i < files.length; i++) {
              if (files[i].startsWith(SNAPSHOT_NAME)) {
                let filePath = FILES_DIR + files[i];
                let fileStat = fs.statSync(filePath);
                console.info(`${TAG} snapshot file: ${files[i]}, size: ${fileStat.size}`);
                expect(fileStat.size > 0).assertTrue();
                let content = fs.readTextSync(filePath);
                console.info(`${TAG} snapshot size: ${content.length} chars, keyword: ${SNAPSHOT_KEYWORD}`);
                expect(content.includes(SNAPSHOT_KEYWORD)).assertTrue();
                fs.unlinkSync(filePath);
                console.info(`${TAG} deleted snapshot file: ${files[i]}`);
                found = true;
                break;
              }
            }
            expect(found).assertTrue();
          }
        }
        for (let i = 0; i < activeTimerIds.length; i++) {
          clearInterval(activeTimerIds[i]);
        }
        activeTimerIds = [];
      } catch (err) {
        console.error(`${TAG} failed, error code: ${(err as BusinessError).code}`);
        expect().assertFail();
      } finally {
        for (let i = 0; i < activeTimerIds.length; i++) {
          clearInterval(activeTimerIds[i]);
        }
        activeTimerIds = [];
      }
      done();
    });
  })
}
