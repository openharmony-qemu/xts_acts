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
    it('testAsyncLockInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("testLock");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let info = state.held[0];
          expect(info.contextId).assertLarger(0);
          expect(info.mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo0100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo0200
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0200
     * @tc.desc    Verify property access has no parameter types
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let info = state.held[0];
          expect(info.contextId).assertLarger(0);
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo0200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo0300
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0300
     * @tc.desc    Verify get name property from AsyncLockInfo
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("testLock");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let name = state.held[0].name;
          expect(name).assertEqual("testLock");
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo0300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo0400
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0400
     * @tc.desc    Verify get mode property from AsyncLockInfo
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let mode = state.held[0].mode;
          expect(mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        }
      }, AsyncLockMode.EXCLUSIVE);

      } catch (error) {
        console.error("testAsyncLockInfo0400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo0500
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0500
     * @tc.desc    Verify get contextId property from AsyncLockInfo
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let contextId: number = state.held[0].contextId;
          expect(contextId).assertLarger(0);
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo0500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo0600
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0600
     * @tc.desc    Verify contextId property value from AsyncLockInfo
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let info = state.held[0];
          expect(info.contextId).assertLarger(0);
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo0600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo0700
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0700
     * @tc.desc    Verify name property is lock name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("namedLock");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].name).assertEqual("namedLock");
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo0700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo0800
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0800
     * @tc.desc    Verify name property is a string for unnamed lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let name = state.held[0].name;
          expect(typeof name).assertEqual("string");
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo0800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo0900
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_0900
     * @tc.desc    Verify name property contains special characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("lock!@#$");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].name).assertEqual("lock!@#$");
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo0900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo1000
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1000
     * @tc.desc    Verify name property contains Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("测试锁");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].name).assertEqual("测试锁");
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo1000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo1100
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1100
     * @tc.desc    Verify mode property is SHARED
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].mode).assertEqual(AsyncLockMode.SHARED);
        }
      }, AsyncLockMode.SHARED);

      } catch (error) {
        console.error("testAsyncLockInfo1100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo1200
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1200
     * @tc.desc    Verify mode property is EXCLUSIVE
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        }
      }, AsyncLockMode.EXCLUSIVE);

      } catch (error) {
        console.error("testAsyncLockInfo1200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo1300
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1300
     * @tc.desc    Verify mode value is enum value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let mode = state.held[0].mode;
          expect(mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo1300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo1400
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1400
     * @tc.desc    Verify contextId is integer greater than 0
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
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

      } catch (error) {
        console.error("testAsyncLockInfo1400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo1500
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1500
     * @tc.desc    Verify contextId property value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let contextId = state.held[0].contextId;
          expect(contextId).assertLarger(0);
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo1500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo1600
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1600
     * @tc.desc    Verify contextId is int type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let contextId: number = state.held[0].contextId;
          expect(typeof contextId).assertEqual("number");
          expect(contextId).assertLarger(0);
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo1600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo1700
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1700
     * @tc.desc    Verify mode type is AsyncLockMode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let mode = state.held[0].mode;
          expect(mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo1700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo1800
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1800
     * @tc.desc    Verify contextId type is int
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(Number.isInteger(state.held[0].contextId)).assertTrue();
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo1800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo1900
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_1900
     * @tc.desc    Verify name property value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let info = state.held[0];
          expect(typeof info.name).assertEqual("string");
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo1900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo2000
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2000
     * @tc.desc    Verify mode property value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let info = state.held[0];
          expect(info.mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo2000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo2100
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2100
     * @tc.desc    Verify contextId property value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          let info = state.held[0];
          expect(info.contextId).assertLarger(0);
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo2100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo2200
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2200
     * @tc.desc    Verify name is not optional
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("notOptionalLock");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].name).assertEqual("notOptionalLock");
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo2200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo2300
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2300
     * @tc.desc    Verify mode is not optional
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo2300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo2400
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2400
     * @tc.desc    Verify contextId is not optional
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].contextId).assertLarger(0);
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo2400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo2500
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2500
     * @tc.desc    Verify held contains lock information
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        for (let info of state.held) {
          expect(info.contextId).assertLarger(0);
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo2500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo2600
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2600
     * @tc.desc    Verify held name matches lock name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("myLock");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        if (state.held.length > 0) {
          expect(state.held[0].name).assertEqual("myLock");
        }
      });

      } catch (error) {
        console.error("testAsyncLockInfo2600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo2700
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2700
     * @tc.desc    Verify name, mode and contextId together completely describe a lock operation
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let lock = AsyncLock.request("combinationLock");
        await lock.lockAsync<void>(() => {
          let state = lock.query();
          expect(state.held.length).assertLarger(0);
          if (state.held.length > 0) {
            let info = state.held[0];
            expect(info.name).assertEqual("combinationLock");
            expect(info.mode).assertEqual(AsyncLockMode.EXCLUSIVE);
            expect(info.contextId).assertLarger(0);
          }
        });
        done();
      } catch (error) {
        console.error('testAsyncLockInfo2700 failed: ' + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockInfo2800
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2800
     * @tc.desc    Verify different lock names have different AsyncLockInfo name properties
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let lock1 = AsyncLock.request("lock1");
        let lock2 = AsyncLock.request("lock2");
        let name1: string = "";
        let name2: string = "";
        let pLock1: Promise<void> = lock1.lockAsync<void>(() => {
          try {
            let state = lock1.query();
            expect(state.held.length).assertLarger(0);
            if (state.held.length > 0) {
              name1 = state.held[0].name;
              expect(name1).assertEqual("lock1");
            }
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        await pLock1;
        let pLock2: Promise<void> = lock2.lockAsync<void>(() => {
          try {
            let state = lock2.query();
            expect(state.held.length).assertLarger(0);
            if (state.held.length > 0) {
              name2 = state.held[0].name;
              expect(name2).assertEqual("lock2");
            }
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        await pLock2;
        expect(name1).not().assertEqual(name2);
        done();
      } catch (error) {
        console.error('testAsyncLockInfo2800 failed: ' + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockInfo2900
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_2900
     * @tc.desc    Verify different requests of the same lock can have different modes
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockInfo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let p1 = lock.lockAsync<void>((): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED);
        let p2: Promise<void> = lock.lockAsync<void>(() => {}, AsyncLockMode.EXCLUSIVE);
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        expect(state.pending.length).assertLarger(0);
        let heldMode: AsyncLockMode = state.held[0].mode;
        let pendingMode: AsyncLockMode = state.pending[0].mode;
        expect(heldMode).assertEqual(AsyncLockMode.SHARED);
        expect(pendingMode).assertEqual(AsyncLockMode.EXCLUSIVE);
        expect(heldMode).not().assertEqual(pendingMode);
        await p1;
        await p2;
        done();
      } catch (error) {
        console.error('testAsyncLockInfo2900 failed: ' + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockInfo3000
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_3000
     * @tc.desc    Verify AsyncLockInfo can be JSON serialized
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
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

      } catch (error) {
        console.error("testAsyncLockInfo3000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo3100
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_3100
     * @tc.desc    Verify serialization result format is correct
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
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

      } catch (error) {
        console.error("testAsyncLockInfo3100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo3200
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_3200
     * @tc.desc    Verify monitor held lock details
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("monitorLock");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        for (let info of state.held) {
          expect(typeof info.name).assertEqual("string");
        }
        expect(state.held.length).assertLarger(0);
      });

      } catch (error) {
        console.error("testAsyncLockInfo3200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo3300
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_3300
     * @tc.desc    Verify name property value is a string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockInfo3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
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

      } catch (error) {
        console.error("testAsyncLockInfo3300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockInfo3400
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_3400
     * @tc.desc    Verify AsyncLockInfo in pending array represents a waiting lock and its mode reflects the request mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = AsyncLock.request("pendingInfo");
        let p1 = lock.lockAsync<void>((): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        let p2: Promise<void> = lock.lockAsync<void>(() => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.EXCLUSIVE);
        let state = lock.query();
        expect(state.pending.length).assertLarger(0);
        for (let info of state.pending) {
          console.info('pending lock: ' + info.name + ', mode: ' + info.mode + ', contextId: ' + info.contextId);
          expect(typeof info.name).assertEqual("string");
          expect(info.contextId).assertLarger(0);
        }
        expect(state.pending[0].name).assertEqual("pendingInfo");
        expect(state.pending[0].mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        await p1;
        await p2;
        done();
      } catch (error) {
        console.error('testAsyncLockInfo3400 failed: ' + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockInfo3500
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_3500
     * @tc.desc    Verify contextId is different for lock requests from different execution contexts
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let p1 = lock.lockAsync<void>((): Promise<void> => {
          try {
            return sleep(300);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        let p2: Promise<void> | null = null;
        let timerPromise: Promise<void> = (async (): Promise<void> => {
          try {
            await sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
          p2 = lock.lockAsync<void>(() => {
            try {
            } catch (error) {
              console.error(`callback failed: ${error}`);
              throw error;
            }
          });
        })();
        await timerPromise;
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        expect(state.pending.length).assertLarger(0);
        let heldContextId: number = state.held[0].contextId;
        let pendingContextId: number = state.pending[0].contextId;
        expect(Number.isInteger(heldContextId)).assertTrue();
        expect(Number.isInteger(pendingContextId)).assertTrue();
        expect(heldContextId).assertLarger(0);
        expect(pendingContextId).assertLarger(0);
        expect(heldContextId).not().assertEqual(pendingContextId);
        await p1;
        if (p2 != null) {
          await p2;
        }
        done();
      } catch (error) {
        console.error('testAsyncLockInfo3500 failed: ' + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockInfo3600
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_3600
     * @tc.desc    Verify AsyncLockInfo can be used to debug lock operations
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockInfo3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = AsyncLock.request("debugLock");
        let pDebug: Promise<void> = lock.lockAsync<void>(() => {
          try {
            let state = lock.query();
            expect(state.held.length).assertLarger(0);
            if (state.held.length > 0) {
              let info: AsyncLockInfo = state.held[0];
              console.info('Lock held: ' + info.name);
              console.info('Mode: ' + info.mode);
              console.info('Context: ' + info.contextId);
              expect(info.name).assertEqual("debugLock");
              expect(info.mode).assertEqual(AsyncLockMode.EXCLUSIVE);
              expect(info.contextId).assertLarger(0);
            }
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        await pDebug;
        done();
      } catch (error) {
        console.error('testAsyncLockInfo3600 failed: ' + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockInfo3700
     * @tc.number  SUB_ASYNCLOCK_INFO_TEST_3700
     * @tc.desc    Verify traversing multiple AsyncLockInfo elements in pending array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockInfo3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let p1: Promise<void> = lock.lockAsync<void>((): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        let queued: Promise<void>[] = [];
        for (let i = 0; i < 10; i++) {
          queued.push(lock.lockAsync<void>(() => {
            try {
            } catch (error) {
              console.error(`callback failed: ${error}`);
              throw error;
            }
          }));
        }
        let state = lock.query();
        expect(state.pending.length).assertEqual(10);
        let startTime: number = Date.now();
        let traversedCount: number = 0;
        for (let info of state.pending) {
          traversedCount++;
          expect(info.contextId).assertLarger(0);
        }
        let elapsed: number = Date.now() - startTime;
        console.info('traversed ' + traversedCount + ' pending infos in ' + elapsed + ' ms');
        expect(traversedCount).assertEqual(10);
        await p1;
        await Promise.all(queued);
        done();
      } catch (error) {
        console.error('testAsyncLockInfo3700 failed: ' + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    });

  });
}
