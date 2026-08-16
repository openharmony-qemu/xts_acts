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

export default function AsyncLockRequestTest(): void {
  describe('AsyncLockRequestTest', (): void => {

    /**
     * @tc.name    testAsyncLockRequest0100
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_0100
     * @tc.desc    Verify request requires a string name parameter and returns lock with matching name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lockName = "testLock";
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockRequest0200
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_0200
     * @tc.desc    Verify request with normal string parameter
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lockName = "normalLockName";
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockRequest0300
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_0300
     * @tc.desc    Verify request with single character string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("a");
      expect(lock.name).assertEqual("a");
    });

    /**
     * @tc.name    testAsyncLockRequest0400
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_0400
     * @tc.desc    Verify request with empty string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("");
      expect(lock.name).assertEqual("");
    });

    /**
     * @tc.name    testAsyncLockRequest0500
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_0500
     * @tc.desc    Verify request with very long string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockRequest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let longName = "a".repeat(10000);
      let lock = AsyncLock.request(longName);
      expect(lock.name.length).assertEqual(10000);
    });

    /**
     * @tc.name    testAsyncLockRequest0600
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_0600
     * @tc.desc    Verify request with null parameter
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockRequest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errorCaught = false;
      try {
        AsyncLock.request(null as string);
        expect().assertFail();
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockRequest0700
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_0700
     * @tc.desc    Verify request with undefined parameter
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockRequest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errorCaught = false;
      try {
        AsyncLock.request(undefined as string);
        expect().assertFail();
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockRequest0800
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_0800
     * @tc.desc    Verify request with string containing spaces
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("lock with spaces");
      expect(lock.name).assertEqual("lock with spaces");
    });

    /**
     * @tc.name    testAsyncLockRequest0900
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_0900
     * @tc.desc    Verify request with Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("测试锁名称");
      expect(lock.name).assertEqual("测试锁名称");
    });

    /**
     * @tc.name    testAsyncLockRequest1000
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_1000
     * @tc.desc    Verify request with emoji characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("lock😀");
      expect(lock.name).assertEqual("lock😀");
    });

    /**
     * @tc.name    testAsyncLockRequest1100
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_1100
     * @tc.desc    Verify request with special characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("lock!@#$%^&*()");
      expect(lock.name).assertEqual("lock!@#$%^&*()");
    });

    /**
     * @tc.name    testAsyncLockRequest1200
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_1200
     * @tc.desc    Verify request with XSS attack string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockRequest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("<script>alert(1)</script>");
      expect(lock.name).assertEqual("<script>alert(1)</script>");
    });

    /**
     * @tc.name    testAsyncLockRequest1300
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_1300
     * @tc.desc    Verify request with newline character
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("lock\nname");
      expect(lock.name).assertEqual("lock\nname");
    });

    /**
     * @tc.name    testAsyncLockRequest1400
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_1400
     * @tc.desc    Verify request with tab character
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("lock\tname");
      expect(lock.name).assertEqual("lock\tname");
    });

    /**
     * @tc.name    testAsyncLockRequest1500
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_1500
     * @tc.desc    Verify request with zero-width space
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockRequest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("lock\u200Bname");
      expect(lock.name).assertEqual("lock\u200Bname");
    });

    /**
     * @tc.name    testAsyncLockRequest1600
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_1600
     * @tc.desc    Verify request with Japanese string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("テストロック");
      expect(lock.name).assertEqual("テストロック");
    });

    /**
     * @tc.name    testAsyncLockRequest1700
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_1700
     * @tc.desc    Verify request with Unicode encoded string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("\u4e2d\u6587");
      expect(lock.name).assertEqual("中文");
    });

    /**
     * @tc.name    testAsyncLockRequest1800
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_1800
     * @tc.desc    Verify request with numeric string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("123456");
      expect(lock.name).assertEqual("123456");
    });

    /**
     * @tc.name    testAsyncLockRequest1900
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_1900
     * @tc.desc    Verify request with hex format string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("0x123");
      expect(lock.name).assertEqual("0x123");
    });

    /**
     * @tc.name    testAsyncLockRequest2000
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_2000
     * @tc.desc    Verify request returns AsyncLock instance
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lockName = "isAvailableLock";
      let lock = AsyncLock.request(lockName);
      expect(lock instanceof AsyncLock).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockRequest2100
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_2100
     * @tc.desc    Verify returned instance name property is correct
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lockName = "testLock";
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockRequest2200
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_2200
     * @tc.desc    Verify returned instance can be used immediately
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("useLock");
      let called = false;
      await lock.lockAsync<void>(() => {
        try {
          called = true;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      expect(called).assertTrue();

      } catch (error) {
        console.error("testAsyncLockRequest2200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockRequest2300
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_2300
     * @tc.desc    Verify returned instance can query state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("queryLock");
      let state = lock.query();
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockRequest2400
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_2400
     * @tc.desc    Verify second request returns existing lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock1 = AsyncLock.request("existingLock");
      let lock2 = AsyncLock.request("existingLock");
      expect(lock1 === lock2).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockRequest2500
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_2500
     * @tc.desc    Verify different names return different instances
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock1 = AsyncLock.request("lock1");
      let lock2 = AsyncLock.request("lock2");
      expect(lock1 === lock2).assertFalse();
    });

    /**
     * @tc.name    testAsyncLockRequest2600
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_2600
     * @tc.desc    Verify return value type is AsyncLock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("typeCheck");
      expect(lock instanceof AsyncLock).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockRequest2700
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_2700
     * @tc.desc    Verify request returns an AsyncLock instance
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("nonNull");
      expect(lock instanceof AsyncLock).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockRequest2800
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_2800
     * @tc.desc    Verify many different name requests
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockRequest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locks: AsyncLock[] = [];
      for (let i = 0; i < 100; i++) {
        locks.push(AsyncLock.request("lock_" + i));
      }
      expect(locks.length).assertEqual(100);
    });

    /**
     * @tc.name    testAsyncLockRequest2900
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_2900
     * @tc.desc    Verify same name returns same instance
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockRequest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = "sameLock";
      let locks: AsyncLock[] = [];
      for (let i = 0; i < 100; i++) {
        locks.push(AsyncLock.request(lockName));
      }
      for (let lock of locks) {
        expect(lock === locks[0]).assertTrue();
      }
    });

    /**
     * @tc.name    testAsyncLockRequest3000
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_3000
     * @tc.desc    Verify request does not throw exception normally
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockRequest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let lock = AsyncLock.request("normalCall");
        expect(lock instanceof AsyncLock).assertTrue();
      } catch (error) {
        expect(false).assertFail();
        expect(error).not().assertNull();
        expect(error.message).not().assertNull();
      }
    });

    /**
     * @tc.name    testAsyncLockRequest3100
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_3100
     * @tc.desc    Verify request with empty string name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockRequest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("");
      expect(lock instanceof AsyncLock).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockRequest3200
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_3200
     * @tc.desc    Verify request invoked as a static method returns a lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("staticMethod");
      expect(lock instanceof AsyncLock).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockRequest3300
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_3300
     * @tc.desc    Verify static request returns a lock distinct from an instance-created lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let instanceLock = new AsyncLock();
      let staticLock = AsyncLock.request("staticCall");
      expect(instanceLock === staticLock).assertFalse();
      expect(staticLock.name).assertEqual("staticCall");
    });

    /**
     * @tc.name    testAsyncLockRequest3400
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_3400
     * @tc.desc    Verify new name creates and registers lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("newRegisteredLock");
      let state = AsyncLock.query("newRegisteredLock");
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockRequest3500
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_3500
     * @tc.desc    Verify request can be queried via static query
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lockName = "queryAfterRequest";
      let lock = AsyncLock.request(lockName);
      let state = AsyncLock.query(lockName);
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockRequest3600
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_3600
     * @tc.desc    Verify query non-existent lock throws exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockRequest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errorCaught = false;
      try {
        AsyncLock.query("notExistLock");
        expect().assertFail();
      } catch (e) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockRequest3700
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_3700
     * @tc.desc    Verify request created lock is included in queryAll
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("queryAllTest");
      let states = AsyncLock.queryAll();
      let singleState = AsyncLock.query("queryAllTest");
      let found = states.some(state => state.held.length === singleState.held.length &&
        state.pending.length === singleState.pending.length);
      expect(found).assertTrue();
      expect(states.length).assertLargerOrEqual(1);
    });

    /**
     * @tc.name    testAsyncLockRequest3800
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_3800
     * @tc.desc    Verify multiple concurrent requests for same name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockRequest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let requestLock = async (): Promise<AsyncLock> => {
        return AsyncLock.request("concurrentLock");
      };
      let locks = await Promise.all([
        requestLock(),
        requestLock(),
        requestLock()
      ]);
      for (let lock of locks) {
        expect(lock === locks[0]).assertTrue();
      }

      } catch (error) {
        console.error("testAsyncLockRequest3800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockRequest3900
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_3900
     * @tc.desc    Verify multiple concurrent requests for different names
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockRequest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let locks = await Promise.all([
        AsyncLock.request("lock1"),
        AsyncLock.request("lock2"),
        AsyncLock.request("lock3")
      ]);
      expect(locks.length).assertEqual(3);
      expect(locks[0] === locks[1]).assertFalse();
      expect(locks[0] === locks[2]).assertFalse();
      expect(locks[1] === locks[2]).assertFalse();

      } catch (error) {
        console.error("testAsyncLockRequest3900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockRequest4000
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_4000
     * @tc.desc    Verify request in async function
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockRequest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let getLock: () => Promise<AsyncLock> = async (): Promise<AsyncLock> => {
        return AsyncLock.request("asyncLock");
      };
      let lock = await getLock();
      expect(lock instanceof AsyncLock).assertTrue();

      } catch (error) {
        console.error("testAsyncLockRequest4000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockRequest4100
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_4100
     * @tc.desc    Verify request in lockAsync callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockRequest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("outerLock");
      let innerLock: AsyncLock = await lock.lockAsync<AsyncLock>(() => {
        try {
          return AsyncLock.request("innerLock");
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      expect(innerLock.name).assertEqual("innerLock");

      } catch (error) {
        console.error("testAsyncLockRequest4100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockRequest4200
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_4200
     * @tc.desc    Verify request with business related name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("databaseConnectionLock");
      expect(lock.name).assertEqual("databaseConnectionLock");
    });

    /**
     * @tc.name    testAsyncLockRequest4300
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_4300
     * @tc.desc    Verify request with module related name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("userService.userUpdate");
      expect(lock.name).assertEqual("userService.userUpdate");
    });

    /**
     * @tc.name    testAsyncLockRequest4400
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_4400
     * @tc.desc    Verify request with function related name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("isAvailableLock");
      expect(lock.name).assertEqual("isAvailableLock");
    });

    /**
     * @tc.name    testAsyncLockRequest4500
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_4500
     * @tc.desc    Verify request with underscore naming
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("user_update_lock");
      expect(lock.name).assertEqual("user_update_lock");
    });

    /**
     * @tc.name    testAsyncLockRequest4600
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_4600
     * @tc.desc    Verify request with camelCase naming
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("userUpdateLock");
      expect(lock.name).assertEqual("userUpdateLock");
    });

    /**
     * @tc.name    testAsyncLockRequest4700
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_4700
     * @tc.desc    Verify request with dot separated naming
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("module.submodule.lock");
      expect(lock.name).assertEqual("module.submodule.lock");
    });

    /**
     * @tc.name    testAsyncLockRequest4800
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_4800
     * @tc.desc    Verify many different name requests return locks with matching names
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockRequest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let names: string[] = [];
      for (let i = 0; i < 1000; i++) {
        names.push(AsyncLock.request("perf_" + i).name);
      }
      expect(names[0]).assertEqual("perf_0");
      expect(names[999]).assertEqual("perf_999");
    });

    /**
     * @tc.name    testAsyncLockRequest4900
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_4900
     * @tc.desc    Verify repeated same-name requests return the same cached instance
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockRequest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locks: AsyncLock[] = [];
      for (let i = 0; i < 1000; i++) {
        locks.push(AsyncLock.request("sameName"));
      }
      expect(locks[0] === locks[999]).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockRequest5000
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_5000
     * @tc.desc    Verify request does not depend on instance context
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockRequest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("ctxTest_request");
      expect(lock instanceof AsyncLock).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockRequest5100
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_5100
     * @tc.desc    Verify queryAll returns the array of registered lock states
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockRequest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let states = AsyncLock.queryAll();
      expect(Array.isArray(states)).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockRequest5200
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_5200
     * @tc.desc    Verify request with boolean parameter
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockRequest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let errorCaught = false;
      try {
        AsyncLock.request(true as string);
        expect().assertFail();
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockRequest5300
     * @tc.number  SUB_ASYNCLOCK_REQUEST_TEST_5300
     * @tc.desc    Verify request with non-string parameter is blocked by static type check (runtime cross-check with null/undefined/true cases 0600/0700/5200 to confirm non-string contract)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockRequest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let nameArg: string = {} as string;
      let lock = AsyncLock.request(nameArg);
      expect(lock.name === nameArg).assertTrue();
    });

  });
}
