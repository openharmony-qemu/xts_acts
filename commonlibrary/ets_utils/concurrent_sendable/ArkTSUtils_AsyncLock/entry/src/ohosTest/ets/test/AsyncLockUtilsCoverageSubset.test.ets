/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, lang } from '@kit.ArkTS';

@Sendable
class Test {
  name: string = '';
  value: number = 0;
}

@Sendable
class TestObj implements lang.ISendable {
  value: number = 100;
}

export default function AsyncLockUtilsCoverageSubsetTest() {
  describe('AsyncLockUtilsCoverageSubsetTest', () => {

    /**
     * @tc.name   asyncLockQueryPropertyValidation001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_UTILS_COVERAGE_SUBSET_0001
     * @tc.desc   Test AsyncLock.query property validation for held and pending arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncLockQueryPropertyValidation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const TAG: string = 'asyncLockQueryPropertyValidation001';
        try {
          const lockName = 'testLockQuery';
          let lock = ArkTSUtils.locks.AsyncLock.request(lockName);

          let state = ArkTSUtils.locks.AsyncLock.query(lockName);
          expect(state?.held.length).assertEqual(0);
          expect(state?.pending.length).assertEqual(0);
        } catch (error) {
          console.error(`${TAG} catch error: ${error}`);
          expect().assertFail();
        }
        done()
      })

    /**
     * @tc.name   asyncLockLockAsyncReturnValidation001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_UTILS_COVERAGE_SUBSET_0002
     * @tc.desc   Test AsyncLock.lockAsync return type validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncLockLockAsyncReturnValidation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const TAG: string = 'asyncLockLockAsyncReturnValidation001';
        try {
          let lock = new ArkTSUtils.locks.AsyncLock();

          // Test with string return
          let result = await lock.lockAsync<string>(() => {
            return "test result";
          });
          expect(result).assertEqual("test result");

          // Test with number return
          let numberResult = await lock.lockAsync<number>(() => {
            return 42;
          });
          expect(numberResult).assertEqual(42);

          // Test with boolean return
          let boolResult = await lock.lockAsync<boolean>(() => {
            return true;
          });
          expect(boolResult).assertTrue();

          // Test with object return
          let objResult = await lock.lockAsync<TestObj>(() => {
            return new TestObj();
          });
          expect(objResult.value).assertEqual(100);
        } catch (error) {
          console.error(`${TAG} catch error: ${error}`);
          expect().assertFail();
        }
        done()
      })

    /**
     * @tc.name   asyncLockRequestEmptyString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_UTILS_COVERAGE_SUBSET_0003
     * @tc.desc   Test AsyncLock.request with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncLockRequestEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asyncLockRequestEmptyString001';
      try {
        // Test with empty string parameter
        let lock = ArkTSUtils.locks.AsyncLock.request("");
        expect(lock instanceof ArkTSUtils.locks.AsyncLock).assertTrue();
        expect(lock.name).assertEqual("");
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })

    /**
     * @tc.name   asyncLockQueryEmptyString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASYNC_LOCK_UTILS_COVERAGE_SUBSET_0004
     * @tc.desc   Test AsyncLock.query with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncLockQueryEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG: string = 'asyncLockQueryEmptyString001';
      try {
        // Create a lock first
        let lock = ArkTSUtils.locks.AsyncLock.request("");

        // Test with empty string parameter
        let state = ArkTSUtils.locks.AsyncLock.query("");
        expect(state.held.length).assertEqual(0);
        expect(state.pending.length).assertEqual(0);
        expect(Array.isArray(state.held)).assertTrue();
        expect(Array.isArray(state.pending)).assertTrue();
      } catch (error) {
        console.error(`${TAG} catch error: ${error}`);
        expect().assertFail();
      }
      done()
    })
  });
}
