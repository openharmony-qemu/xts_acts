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

export default function AsyncLockConstructorTest(): void {
  describe('AsyncLockConstructorTest', (): void => {

    /**
     * @tc.name    testAsyncLockConstructor0100
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_0100
     * @tc.desc    Verify constructor is a parameterless constructor
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      expect(lock instanceof AsyncLock).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockConstructor0200
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_0200
     * @tc.desc    Verify AsyncLock instance creation success
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockConstructor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      expect(lock instanceof AsyncLock).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockConstructor0300
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_0300
     * @tc.desc    Verify created instance can be used immediately
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      await expect(lock.lockAsync<void>(() => {})).assertPromiseIsResolved()
    });

    /**
     * @tc.name    testAsyncLockConstructor0400
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_0400
     * @tc.desc    Verify created instance can call query method
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = new AsyncLock();
      let state: AsyncLockState = lock.query();
      expect(state.held.length).assertEqual(0);
      expect(state.pending.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockConstructor0500
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_0500
     * @tc.desc    Verify creating multiple independent instances
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock1 = new AsyncLock();
      let lock2 = new AsyncLock();
      expect(lock1 === lock2).assertFalse();
    });

    /**
     * @tc.name    testAsyncLockConstructor0600
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_0600
     * @tc.desc    Verify name property is accessible after creation
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = new AsyncLock();
      let name: string = lock.name;
      expect(typeof name).assertEqual('string');
    });

    /**
     * @tc.name    testAsyncLockConstructor0700
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_0700
     * @tc.desc    Verify creating large number of instances (100)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locks: AsyncLock[] = [];
      for (let i: number = 0; i < 100; i++) {
        locks.push(new AsyncLock());
      }
      expect(locks.length).assertEqual(100);
    });

    /**
     * @tc.name    testAsyncLockConstructor0800
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_0800
     * @tc.desc    Verify multiple concurrent instances creation with Promise.all
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockConstructor0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let createLock = async (): Promise<AsyncLock> => {
        return new AsyncLock();
      };
      let locks:AsyncLock[] = await Promise.all([
        createLock(),
        createLock(),
        createLock()
      ]);
      expect(locks.length).assertEqual(3);
    });

    /**
     * @tc.name    testAsyncLockConstructor0900
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_0900
     * @tc.desc    Verify created instance supports concurrent lockAsync operations
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockConstructor0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let lock = new AsyncLock();
      let promises: Promise<void>[] = [
        lock.lockAsync<void>(() => {}),
        lock.lockAsync<void>(() => {}),
        lock.lockAsync<void>(() => {})
      ];
      await Promise.all(promises);
      expect(promises.length).assertEqual(3);
    });

    /**
     * @tc.name    testAsyncLockConstructor1000
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_1000
     * @tc.desc    Verify async function can create and use lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockConstructor1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let createAndUseLock = async (): Promise<string> => {
        let lock = new AsyncLock();
        return await lock.lockAsync<string>(() => 'result');
      };
      let result = await createAndUseLock();
      expect(result).assertEqual('result');
    });

    /**
     * @tc.name    testAsyncLockConstructor1100
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_1100
     * @tc.desc    Verify created instance can be used immediately in async context
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockConstructor1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let lock = new AsyncLock();
      let used: boolean = false;
      let useLock: () => Promise<void> = async (): Promise<void> => {
        await lock.lockAsync<void>(() => {
          used = true;
        });
      };
      await useLock();
      expect(used).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockConstructor1200
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_1200
     * @tc.desc    Verify new instance pending list is empty
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(state.pending.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockConstructor1300
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_1300
     * @tc.desc    Verify new instance held list is empty
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockConstructor1400
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_1400
     * @tc.desc    Verify new instance held and pending lists are empty
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(state.held.length).assertEqual(0);
      expect(state.pending.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockConstructor1500
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_1500
     * @tc.desc    Verify name property is accessible
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = new AsyncLock();
      expect(typeof lock.name).assertEqual('string');
    });

    /**
     * @tc.name    testAsyncLockConstructor1600
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_1600
     * @tc.desc    Verify name property type is string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = new AsyncLock();
      let name: string = lock.name;
      expect(typeof name).assertEqual('string');
    });

    /**
     * @tc.name    testAsyncLockConstructor1700
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_1700
     * @tc.desc    Verify request creates named lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request('namedLock');
      expect(lock.name).assertEqual('namedLock');
    });

    /**
     * @tc.name    testAsyncLockConstructor1800
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_1800
     * @tc.desc    Verify constructor and request create different instances
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock1 = new AsyncLock();
      let lock2 = AsyncLock.request('requestLock');
      expect(lock1 === lock2).assertFalse();
    });

    /**
     * @tc.name    testAsyncLockConstructor1900
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_1900
     * @tc.desc    Verify constructor is used for local temporary lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let localOperation: () => Promise<void> = async (): Promise<void> => {
        let lock = new AsyncLock();
        await lock.lockAsync<void>(() => {
        });
      };
      await localOperation();
      await expect(localOperation()).assertPromiseIsResolved();
    });

    /**
     * @tc.name    testAsyncLockConstructor2000
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_2000
     * @tc.desc    Verify lockAsync method is available after construction
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      let called = false;
      await lock.lockAsync<void>(() => {
        called = true;
        return Promise.resolve();
      });
      expect(called).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockConstructor2100
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_2100
     * @tc.desc    Verify query method is available after construction
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockConstructor2200
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_2200
     * @tc.desc    Verify name property is accessible after construction
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = new AsyncLock();
      expect(typeof lock.name).assertEqual('string');
    });

    /**
     * @tc.name    testAsyncLockConstructor2300
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_2300
     * @tc.desc    Verify multiple instances memory accumulation is normal (100)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locks:AsyncLock[]  = [];
      for (let i: number = 0; i < 100; i++) {
        locks.push(new AsyncLock());
      }
      expect(locks.length).assertEqual(100);
    });

    /**
     * @tc.name    testAsyncLockConstructor2400
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_2400
     * @tc.desc    Verify request can be used for global shared lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock1 = AsyncLock.request('globalLock');
      let lock2 = AsyncLock.request('globalLock');
      expect(lock1 === lock2).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockConstructor2500
     * @tc.number  SUB_ASYNCLOCK_CONSTRUCTOR_TEST_2500
     * @tc.desc    Verify constructor-created lock can be found via request by its name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockConstructor2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = new AsyncLock();
      let foundLock = AsyncLock.request(lock.name);
      expect(foundLock === lock).assertTrue();
    });

  })
}
