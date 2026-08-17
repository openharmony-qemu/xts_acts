'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, it, expect, TestType, Level, Size } from '../../../hypium/index';
import { sleep } from './utils/utils';

export default function AsyncLockQueryStaticTest(): void {
  describe('AsyncLockQueryStaticTest', (): void => {

    /**
     * @tc.name    testAsyncLockQueryStatic0100
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_0100
     * @tc.desc    Verify query static method with normal string parameter
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryStatic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("queryTestLock");
      let state = AsyncLock.query("queryTestLock");
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic0200
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_0200
     * @tc.desc    Verify query static method with normal lock name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("normalLock");
      let state = AsyncLock.query("normalLock");
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic0300
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_0300
     * @tc.desc    Verify query static method with single character string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("a");
      let state = AsyncLock.query("a");
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic0400
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_0400
     * @tc.desc    Verify query static method with empty string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("");
      let state = AsyncLock.query("");
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic0500
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_0500
     * @tc.desc    Verify query static method with very long string name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let longName = "a".repeat(1000);
      let lock = AsyncLock.request(longName);
      let state = AsyncLock.query(longName);
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic0600
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_0600
     * @tc.desc    Verify query static method throws error for non-existent lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errorCaught = false;
      try {
        AsyncLock.query("notExistLock");
        expect().assertFail();
      } catch (e) {
        errorCaught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic0700
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_0700
     * @tc.desc    Verify query static method with undefined parameter
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errorCaught = false;
      try {
        AsyncLock.query(undefined as string);
        expect().assertFail();
      } catch (error) {
        errorCaught = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic0800
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_0800
     * @tc.desc    Verify query static method with string containing spaces
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("lock with spaces");
      let state = AsyncLock.query("lock with spaces");
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic0900
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_0900
     * @tc.desc    Verify query static method with Unicode Chinese characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("测试锁");
      let state = AsyncLock.query("测试锁");
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic1000
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_1000
     * @tc.desc    Verify query static method with string containing emoji
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("lock😀");
      let state = AsyncLock.query("lock😀");
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic1100
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_1100
     * @tc.desc    Verify query static method with special characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("lock!@#$");
      let state = AsyncLock.query("lock!@#$");
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic1200
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_1200
     * @tc.desc    Verify query static method with XSS string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("<script>alert(1)</script>");
      let state = AsyncLock.query("<script>alert(1)</script>");
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic1300
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_1300
     * @tc.desc    Verify query static method with newline character
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("lock\nname");
      let state = AsyncLock.query("lock\nname");
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic1400
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_1400
     * @tc.desc    Verify query static method with Japanese characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("テスト");
      let state = AsyncLock.query("テスト");
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic1500
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_1500
     * @tc.desc    Verify query static method returns AsyncLockState instance
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryStatic1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("queryTestLock2");
      let state: AsyncLockState = AsyncLock.query("queryTestLock2");
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic1600
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_1600
     * @tc.desc    Verify query static method returns held array property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryStatic1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("heldTest");
      let state = AsyncLock.query("heldTest");
      expect(Array.isArray(state.held)).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic1700
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_1700
     * @tc.desc    Verify query static method returns pending array property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryStatic1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("pendingTest");
      let state = AsyncLock.query("pendingTest");
      expect(Array.isArray(state.pending)).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic1800
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_1800
     * @tc.desc    Verify query static method returns empty arrays for unused lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("emptyStateTest");
      let state = AsyncLock.query("emptyStateTest");
      expect(state.held.length).assertEqual(0);
      expect(state.pending.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic1900
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_1900
     * @tc.desc    Verify query static method returns held data when lock is held
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("heldLock");
      const lockAsyncCallback1 = (): void => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
      };
      await lock.lockAsync<void>(
        lockAsyncCallback1);
      let stateAfter = AsyncLock.query("heldLock");
      expect(stateAfter.held.length).assertEqual(0);

      } catch (error) {
        console.error("testAsyncLockQueryStatic1900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic2000
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_2000
     * @tc.desc    Verify query static method with multiple shared locks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryStatic2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = AsyncLock.request("maxHeld");
        const lockAsyncCallback2 = (): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p1 = lock.lockAsync<void>(
          lockAsyncCallback2, AsyncLockMode.SHARED);
        const lockAsyncCallback3 = (): void => {
          try {
            let state = AsyncLock.query("maxHeld");
            expect(state.held.length).assertLargerOrEqual(2);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p2 = lock.lockAsync<void>(
          lockAsyncCallback3, AsyncLockMode.SHARED);
        await p1;
        await p2;
        let stateAfter = AsyncLock.query("maxHeld");
        expect(stateAfter.held.length).assertEqual(0);
        done();
      } catch (error) {
        console.error("testAsyncLockQueryStatic2000 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryStatic2100
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_2100
     * @tc.desc    Verify query throws Error for non-existent lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errorCaught = false;
      try {
        AsyncLock.query("nonexistent");
        expect().assertFail();
      } catch (e) {
        errorCaught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic2200
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_2200
     * @tc.desc    Verify query throws error for custom non-existent lock name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let customName = "customMissingLock";
      let errorCaught = false;
      try {
        AsyncLock.query(customName);
        expect().assertFail();
      } catch (e) {
        errorCaught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic2300
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_2300
     * @tc.desc    Verify query static method throws error for null parameter
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errorCaught = false;
      try {
        AsyncLock.query(null as string);
        expect().assertFail();
      } catch (error) {
        errorCaught = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic2400
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_2400
     * @tc.desc    Verify try-catch can catch query exceptions
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("tryNormal");
      let state: AsyncLockState;
      try {
        state = AsyncLock.query("tryNormal");
        expect(state.held.length).assertEqual(0);
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryStatic2500
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_2500
     * @tc.desc    Verify finally block executes after query exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errorCaught = false;
      let finallyExecuted = false;
      try {
        AsyncLock.query("finallyTest");
        expect().assertFail();
      } catch (e) {
        errorCaught = true;
      } finally {
        finallyExecuted = true;
      }
      expect(errorCaught).assertTrue();
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic2600
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_2600
     * @tc.desc    Verify static query differs from instance query
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("staticVsInstance");
      let state = AsyncLock.query("staticVsInstance");
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic2700
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_2700
     * @tc.desc    Verify instance query call form via static-requested lock, distinguishing instance call form from static call form
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("instanceQuery");
      let state = lock.query();
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic2800
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_2800
     * @tc.desc    Verify static and instance query return same result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("sameResult");
      let state1 = AsyncLock.query("sameResult");
      let state2 = lock.query();
      expect(state1.held.length).assertEqual(state2.held.length);
      expect(state1.pending.length).assertEqual(state2.pending.length);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic2900
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_2900
     * @tc.desc    Verify instance query for current lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("currentLock");
      let state = lock.query();
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic3000
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_3000
     * @tc.desc    Verify multiple static query calls return consistent results
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryStatic3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("concurrentQuery");
      let states = await Promise.all([
        Promise.resolve(AsyncLock.query("concurrentQuery")),
        Promise.resolve(AsyncLock.query("concurrentQuery")),
        Promise.resolve(AsyncLock.query("concurrentQuery"))
      ]);
      expect(states.length).assertEqual(3);
      for (let s of states) {
        expect(s.held.length).assertEqual(0);
        expect(s.pending.length).assertEqual(0);
      }
      } catch (error) {
        console.error("testAsyncLockQueryStatic3000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic3100
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_3100
     * @tc.desc    Verify multiple static query calls on different locks return consistent results
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryStatic3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock1 = AsyncLock.request("lock1");
      let lock2 = AsyncLock.request("lock2");
      let lock3 = AsyncLock.request("lock3");
      let states = await Promise.all([
        Promise.resolve(AsyncLock.query("lock1")),
        Promise.resolve(AsyncLock.query("lock2")),
        Promise.resolve(AsyncLock.query("lock3"))
      ]);
      expect(states.length).assertEqual(3);
      for (let s of states) {
        expect(s.held.length).assertEqual(0);
        expect(s.pending.length).assertEqual(0);
      }
      } catch (error) {
        console.error("testAsyncLockQueryStatic3100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic3200
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_3200
     * @tc.desc    Verify async function calling static query
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryStatic3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let queryState = async (name: string): Promise<AsyncLockState> => {
        return AsyncLock.query(name);
      };
      let lock = AsyncLock.request("asyncQuery");
      let state = await queryState("asyncQuery");
      expect(state.held.length).assertEqual(0);

      } catch (error) {
        console.error("testAsyncLockQueryStatic3200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic3300
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_3300
     * @tc.desc    Verify static query inside lock callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryStatic3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = AsyncLock.request("callbackQuery");
        const lockAsyncCallback4 = (): void => {
          let state = AsyncLock.query("callbackQuery");
          expect(state.held.length).assertLarger(0);
        };
        await lock.lockAsync<void>(
          lockAsyncCallback4);
        done();
      } catch (error) {
        console.error("testAsyncLockQueryStatic3300 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryStatic3400
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_3400
     * @tc.desc    Verify held entry contains name property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("heldName");
      const lockAsyncCallback5 = (): void => {
        let state = lock.query();
        if (state.held.length > 0) {
          expect(typeof state.held[0].name).assertEqual("string");
        }
        expect(state.held.length).assertLarger(0);
      };
      await lock.lockAsync<void>(
        lockAsyncCallback5);

      } catch (error) {
        console.error("testAsyncLockQueryStatic3400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic3500
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_3500
     * @tc.desc    Verify held entry contains mode property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("heldMode");
      const lockAsyncCallback6 = (): void => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        }
      };
      await lock.lockAsync<void>(
        lockAsyncCallback6, AsyncLockMode.EXCLUSIVE);

      } catch (error) {
        console.error("testAsyncLockQueryStatic3500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic3600
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_3600
     * @tc.desc    Verify held entry contains contextId property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("heldContext");
      const lockAsyncCallback7 = (): void => {
        try {
          let state = lock.query();
          if (state.held.length > 0) {
            expect(state.held[0].contextId).assertLarger(0);
          }
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      await lock.lockAsync<void>(
        lockAsyncCallback7);

      } catch (error) {
        console.error("testAsyncLockQueryStatic3600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic3700
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_3700
     * @tc.desc    Verify multiple queries return consistent results
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryStatic3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let lock = AsyncLock.request("perf");
      let queryCount: number = 0;
      for (let i = 0; i < 1000; i++) {
        AsyncLock.query("perf");
        queryCount++;
      }
      expect(queryCount).assertEqual(1000);
    });

    /**
     * @tc.name    testAsyncLockQueryStatic3800
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_3800
     * @tc.desc    Verify static query pending array not empty when lock is waiting
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryStatic3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = AsyncLock.request("pendingLockStatic");
        const lockAsyncCallback8 = (): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p1 = lock.lockAsync<void>(
          lockAsyncCallback8);
        const lockAsyncCallback9 = (): void => {};
        let p2: Promise<void> = lock.lockAsync<void>(
          lockAsyncCallback9);
        let state = AsyncLock.query("pendingLockStatic");
        expect(state.pending.length).assertLarger(0);
        await p1;
        await p2;
        done();
      } catch (error) {
        console.error("testAsyncLockQueryStatic3800 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryStatic3900
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_3900
     * @tc.desc    Verify static query pending array contains multiple waiting elements
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryStatic3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = AsyncLock.request("maxPendingStatic");
        const lockAsyncCallback10 = (): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p1 = lock.lockAsync<void>(
          lockAsyncCallback10);
        const lockAsyncCallback11 = (): void => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p2 = lock.lockAsync<void>(
          lockAsyncCallback11);
        const lockAsyncCallback12 = (): void => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p3: Promise<void> = lock.lockAsync<void>(
          lockAsyncCallback12);
        let state = AsyncLock.query("maxPendingStatic");
        expect(state.pending.length).assertLargerOrEqual(2);
        await p1;
        await p2;
        await p3;
        done();
      } catch (error) {
        console.error("testAsyncLockQueryStatic3900 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryStatic4000
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_4000
     * @tc.desc    Verify static query throws not found error for a lock name that is not created
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errorCaught = false;
      try {
        AsyncLock.query("__qs_not_found_case__");
        expect().assertFail();
      } catch (e) {
        errorCaught = true;
        expect(e instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryStatic4100
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_4100
     * @tc.desc    Verify static query pending element contains lock name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = AsyncLock.request("pendingNameStatic");
        const lockAsyncCallback13 = (): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p1 = lock.lockAsync<void>(
          lockAsyncCallback13);
        const lockAsyncCallback14 = (): void => {};
        let p2: Promise<void> = lock.lockAsync<void>(
          lockAsyncCallback14, AsyncLockMode.EXCLUSIVE);
        let state = AsyncLock.query("pendingNameStatic");
        expect(state.pending.length).assertLarger(0);
        expect(state.pending[0].name).assertEqual("pendingNameStatic");
        await p1;
        await p2;
        done();
      } catch (error) {
        console.error("testAsyncLockQueryStatic4100 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryStatic4200
     * @tc.number  SUB_ASYNCLOCK_QUERY_STATIC_TEST_4200
     * @tc.desc    Verify static query pending element contains lock mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryStatic4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = AsyncLock.request("pendingModeStatic");
        const lockAsyncCallback15 = (): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p1: Promise<void> = lock.lockAsync<void>(
          lockAsyncCallback15, AsyncLockMode.EXCLUSIVE);
        const lockAsyncCallback16 = (): void => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p2: Promise<void> = lock.lockAsync<void>(
          lockAsyncCallback16, AsyncLockMode.EXCLUSIVE);
        let state = AsyncLock.query("pendingModeStatic");
        expect(state.pending.length).assertLarger(0);
        expect(state.pending[0].mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        await p1;
        await p2;
        done();
      } catch (error) {
        console.error("testAsyncLockQueryStatic4200 failed");
        expect(false).assertFail();
        done();
      }
    });
  });
}
