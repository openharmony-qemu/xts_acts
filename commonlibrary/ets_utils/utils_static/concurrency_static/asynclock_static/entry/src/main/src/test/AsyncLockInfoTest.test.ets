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

export default function AsyncLockInfoTest(): void {
  describe('AsyncLockInfoTest', (): void => {

    /**
     * @tc.name    testAsyncLockInfo0100
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0100
     * @tc.desc    Verify property access has no parameters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = AsyncLock.request("testLock");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let info = state.held[0];
          let name: string = info.name;
          let mode: AsyncLockMode = info.mode;
          let contextId: number = info.contextId;
          expect(typeof name).assertEqual("string");
          expect(typeof contextId).assertEqual("number");
          expect(contextId).assertLarger(0);
          expect(mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo0200
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0200
     * @tc.desc    Verify property access has no parameter types
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let info = state.held[0];
          expect(info.contextId).assertLarger(0);
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo0300
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0300
     * @tc.desc    Verify get name property from AsyncLockInfo
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = AsyncLock.request("testLock");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let name = state.held[0].name;
          expect(typeof name).assertEqual("string");
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo0400
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0400
     * @tc.desc    Verify get mode property from AsyncLockInfo
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let mode = state.held[0].mode;
          expect(mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        }
      }, AsyncLockMode.EXCLUSIVE);

    });

    /**
     * @tc.name    testAsyncLockInfo0500
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0500
     * @tc.desc    Verify get contextId property from AsyncLockInfo
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let contextId: number = state.held[0].contextId;          expect(typeof contextId).assertEqual("number");
          expect(contextId).assertLarger(0);
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo0600
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0600
     * @tc.desc    Verify get all properties from AsyncLockInfo
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let info = state.held[0];
          expect(info.contextId).assertLarger(0);
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo0700
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0700
     * @tc.desc    Verify name property is lock name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = AsyncLock.request("namedLock");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].name).assertEqual("namedLock");
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo0800
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0800
     * @tc.desc    Verify name is empty string for unnamed lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let name = state.held[0].name;
          expect(typeof name).assertEqual("string");
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo0900
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0900
     * @tc.desc    Verify name property contains special characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = AsyncLock.request("lock!@#$");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].name).assertEqual("lock!@#$");
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo1000
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1000
     * @tc.desc    Verify name property contains Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = AsyncLock.request("测试锁");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].name).assertEqual("测试锁");
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo1100
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1100
     * @tc.desc    Verify mode property is SHARED
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].mode).assertEqual(AsyncLockMode.SHARED);
        }
      }, AsyncLockMode.SHARED);

    });

    /**
     * @tc.name    testAsyncLockInfo1200
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1200
     * @tc.desc    Verify mode property is EXCLUSIVE
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        }
      }, AsyncLockMode.EXCLUSIVE);

    });

    /**
     * @tc.name    testAsyncLockInfo1300
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1300
     * @tc.desc    Verify mode value is enum value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let mode = state.held[0].mode;
          expect(mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo1400
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1400
     * @tc.desc    Verify contextId is integer greater than 0
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let contextId = state.held[0].contextId;
          expect(Number.isInteger(contextId)).assertTrue();
          expect(contextId).assertLarger(0);
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo1500
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1500
     * @tc.desc    Verify contextId represents execution context
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let contextId = state.held[0].contextId;
          expect(contextId).assertLarger(0);
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo1600
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1600
     * @tc.desc    Verify contextId is int type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let contextId: number = state.held[0].contextId;
          expect(typeof contextId).assertEqual("number");        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo1700
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1700
     * @tc.desc    Verify mode type is AsyncLockMode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let mode = state.held[0].mode;
          expect(mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo1800
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1800
     * @tc.desc    Verify contextId type is int
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(Number.isInteger(state.held[0].contextId)).assertTrue();
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo1900
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1900
     * @tc.desc    Verify name property is read-only
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let info = state.held[0];
          expect(typeof info.name).assertEqual("string");
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo2000
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2000
     * @tc.desc    Verify mode property is read-only
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let info = state.held[0];
          expect(info.mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo2100
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2100
     * @tc.desc    Verify contextId property is read-only
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let info = state.held[0];
          expect(info.contextId).assertLarger(0);
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo2200
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2200
     * @tc.desc    Verify name is not optional
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].name !== undefined).assertTrue();
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo2300
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2300
     * @tc.desc    Verify mode is not optional
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].mode !== undefined).assertTrue();
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo2400
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2400
     * @tc.desc    Verify contextId is not optional
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].contextId !== undefined).assertTrue();
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo2500
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2500
     * @tc.desc    Verify held contains lock information
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        for (let info of state.held) {
          expect(info.contextId).assertLarger(0);
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo2600
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2600
     * @tc.desc    Verify held name matches lock name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = AsyncLock.request("myLock");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].name).assertEqual("myLock");
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo2700
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2700
     * @tc.desc    Verify AsyncLockInfo contains complete properties
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let info = state.held[0];
          expect(typeof info.name !== 'undefined').assertTrue();
          expect(typeof info.mode !== 'undefined').assertTrue();
          expect(typeof info.contextId !== 'undefined').assertTrue();
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo2800
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2800
     * @tc.desc    Verify different lock names have different info
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock1 = AsyncLock.request("lock1");
      let lock2 = AsyncLock.request("lock2");
      await lock1.lockAsync<void>(() => {
        expect(lock1.name).assertEqual("lock1");
      });
      await lock2.lockAsync<void>(() => {
        expect(lock2.name).assertEqual("lock2");
      });

    });

    /**
     * @tc.name    testAsyncLockInfo2900
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2900
     * @tc.desc    Verify different modes have different info
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      await Promise.all([
        lock.lockAsync<void>(() => {}, AsyncLockMode.SHARED),
        lock.lockAsync<void>(() => {}, AsyncLockMode.EXCLUSIVE)
      ]);
      let state = lock.query();
      expect(state.held.length > 0).assertFalse();

    });

    /**
     * @tc.name    testAsyncLockInfo3000
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_3000
     * @tc.desc    Verify AsyncLockInfo can be JSON serialized
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let json = JSON.stringify(state.held[0]);
          expect(json).assertContain("name");
          expect(json).assertContain("mode");
          expect(json).assertContain("contextId");
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo3100
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_3100
     * @tc.desc    Verify serialization result format is correct
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let json = JSON.stringify(state);
          expect(json.includes('"held"')).assertTrue();
          expect(json.includes('"pending"')).assertTrue();
        }
      });

    });

    /**
     * @tc.name    testAsyncLockInfo3200
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_3200
     * @tc.desc    Verify monitor held lock details
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = AsyncLock.request("monitorLock");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        for (let info of state.held) {
          expect(typeof info.name).assertEqual("string");
        }
        expect(state.held.length).assertLarger(0);
      });

    });

    /**
     * @tc.name    testAsyncLockInfo3300
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_3300
     * @tc.desc    Verify name property access speed
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockInfo3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let info = state.held[0];
          for (let i = 0; i < 1000; i++) {
            let val = info.name;
          }
          expect(typeof info.name).assertEqual("string");
        }
      });

    });

  });
}
