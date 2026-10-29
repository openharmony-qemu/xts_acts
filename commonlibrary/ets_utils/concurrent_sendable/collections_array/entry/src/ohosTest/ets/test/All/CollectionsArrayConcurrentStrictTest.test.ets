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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { collections, taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleep } from './pages/Utils';
import {
  createSharedSignal,
  notifySharedSignal,
  waitForSharedSignal
} from '../SharedLock';

// Cross-thread forEach traversal. On the first element it hands control to the modifier task via a
// shared signal and blocks (Atomics.wait) until the modifier has performed its push, guaranteeing
// the write overlaps the traversal. Either this traversal or the push must report a concurrent
// modification error.
@Concurrent
async function forEachTraverseStrict(arr: collections.Array<number>,
  signal: SharedArrayBuffer): Promise<string> {
  try {
    let signaled: boolean = false;
    let timedOut: boolean = false;
    arr.forEach((value: number): void => {
      if (!signaled) {
        signaled = true;
        notifySharedSignal(signal, 0);
        if (!waitForSharedSignal(signal, 1, 5000)) { timedOut = true; }
      }
    });
    if (timedOut) { return 'error:timeout'; }
    return 'success';
  } catch (err) {
    const code: number = err.code;
    if (code === 10200201 || code === 10200001) { return 'error:' + code; }
    return 'error:unknown';
  }
}

// Cross-thread modifier. Waits for the traversal to signal it has started, then pushes one element
// into the shared array during the traversal, and finally releases the traversal.
@Concurrent
async function modifyPushAfterStart(arr: collections.Array<number>,
  signal: SharedArrayBuffer): Promise<string> {
  if (!waitForSharedSignal(signal, 0, 5000)) {
    notifySharedSignal(signal, 1);
    return 'error:timeout';
  }
  try {
    arr.push(9999);
    return 'success';
  } catch (err) {
    const code: number = err.code;
    if (code === 10200201 || code === 10200001) { return 'error:' + code; }
    return 'error:unknown';
  } finally {
    notifySharedSignal(signal, 1);
  }
}

function makeArray(count: number): collections.Array<number> {
  const arr: collections.Array<number> = new collections.Array<number>();
  for (let i: number = 0; i < count; i++) { arr.push(i); }
  return arr;
}

export default function CollectionsArrayConcurrentStrictTest() {
  describe('CollectionsArrayConcurrentStrictTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   collectionsArrayConcurrentStrictTest049
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_CONCURRENT_STRICT_0049
     * @tc.desc   case_id_temp_049: a cross-thread push performed via taskpool during a forEach
     *            traversal must produce a concurrent modification error (10200201 or 10200001).
     *            Strict assertion: the error must occur, not "normal completion OR error".
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayConcurrentStrictTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const TAG: string = 'collectionsArrayConcurrentStrictTest049';
        console.log(TAG + ' start');
        const arr: collections.Array<number> = makeArray(1000);
        const signal: SharedArrayBuffer = createSharedSignal(2);
        let traverseStatus: string = 'error:unknown';
        let modifyStatus: string = 'error:unknown';
        try {
          const results: Object[] = await Promise.all([
            taskpool.execute(forEachTraverseStrict, arr, signal),
            taskpool.execute(modifyPushAfterStart, arr, signal)
          ]) as Object[];
          traverseStatus = results[0] as string;
          modifyStatus = results[1] as string;
        } catch (err) {
          console.error(TAG + ' taskpool execution failed: ' + JSON.stringify(err));
        }
        console.info(TAG + ' traverseStatus=' + traverseStatus + ' modifyStatus=' + modifyStatus);
        // Neither side may hit a handshake failure (timeout) or an unrecognized error.
        expect(traverseStatus !== 'error:timeout' && traverseStatus !== 'error:unknown').assertTrue();
        expect(modifyStatus !== 'error:timeout' && modifyStatus !== 'error:unknown').assertTrue();
        // Strict: a concurrent modification error (10200201 or 10200001) MUST be reported by at
        // least one side of the overlapping traversal/write.
        const traverseErrored: boolean = traverseStatus === 'error:10200201' ||
          traverseStatus === 'error:10200001';
        const modifyErrored: boolean = modifyStatus === 'error:10200201' ||
          modifyStatus === 'error:10200001';
        expect(traverseErrored || modifyErrored).assertTrue();
        console.log(TAG + ' done');
        done();
      });

    /**
     * @tc.name   collectionsArrayConcurrentStrictTest050
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_CONCURRENT_STRICT_0050
     * @tc.desc   case_id_temp_050: a forEach callback that writes to the same array (push) must
     *            throw a concurrent modification error (10200201 or 10200001). Strict assertion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayConcurrentStrictTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        let threw: boolean = false;
        try {
          arr.forEach((value: number): void => {
            arr.push(0);
          });
          expect().assertFail();
        } catch (error) {
          const e: BusinessError = error as BusinessError;
          console.error('collectionsArrayConcurrentStrictTest050 failed, code is ' + e.code +
            ', message is ' + e.message);
          expect(e.code === 10200201 || e.code === 10200001).assertTrue();
          threw = true;
        }
        expect(threw).assertTrue();
        done();
      });

    /**
     * @tc.name   collectionsArrayConcurrentStrictTest051
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_CONCURRENT_STRICT_0051
     * @tc.desc   case_id_temp_051: after catching the concurrent modification exception, the
     *            container remains usable — forEach runs to completion and element-existence query
     *            (includes) works — and the original data is intact. (collections.Array exposes
     *            `includes`, not `has`; `has` exists only on Map/Set.)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayConcurrentStrictTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        let caughtCode: number = -1;
        try {
          arr.forEach((value: number): void => {
            arr.push(0);
          });
          expect().assertFail();
        } catch (error) {
          const e: BusinessError = error as BusinessError;
          caughtCode = e.code;
          expect(caughtCode === 10200201 || caughtCode === 10200001).assertTrue();
        }
        // After the exception is caught, re-run forEach and an element-existence query to verify
        // the container is still usable and the original elements are intact.
        let iteratedCount: number = 0;
        arr.forEach((value: number): void => {
          iteratedCount++;
        });
        expect(iteratedCount).assertEqual(arr.length);
        expect(arr.includes(1)).assertTrue();
        expect(arr.includes(2)).assertTrue();
        expect(arr.includes(3)).assertTrue();
        done();
      });

  });
}
