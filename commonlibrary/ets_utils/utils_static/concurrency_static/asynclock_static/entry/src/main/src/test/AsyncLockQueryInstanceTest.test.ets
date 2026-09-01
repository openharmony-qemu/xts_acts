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

export default function AsyncLockQueryInstanceTest(): void {
  describe('AsyncLockQueryInstanceTest', (): void => {

    /**
     * @tc.name    testAsyncLockQueryInstance0100
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_0100
     * @tc.desc    Verify instance query method returns AsyncLockState
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryInstance0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state: AsyncLockState = lock.query();
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryInstance0200
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_0200
     * @tc.desc    Verify instance query returns held array property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryInstance0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(Array.isArray(state.held)).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryInstance0300
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_0300
     * @tc.desc    Verify instance query returns pending array property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryInstance0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(Array.isArray(state.pending)).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryInstance0400
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_0400
     * @tc.desc    Verify instance query returns empty arrays for unused lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryInstance0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state: AsyncLockState = lock.query();
      let pending: AsyncLockInfo[] = state.pending;
      let held: AsyncLockInfo[] = state.held;
      expect(pending.length).assertEqual(0);
      expect(held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryInstance0500
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_0500
     * @tc.desc    Verify instance query returns held data when lock is held
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      const lockAsyncCallback1 = (): void => {
        try {
          let state = lock.query();
          expect(state.held.length).assertLarger(0);
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      await lock.lockAsync<void>(
        lockAsyncCallback1);

      } catch (error) {
        console.error("testAsyncLockQueryInstance0500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockQueryInstance0600
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_0600
     * @tc.desc    Verify instance query after lock is released
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      const lockAsyncCallback2 = (): void => {
        try {
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      await lock.lockAsync<void>(
        lockAsyncCallback2);
      let state = lock.query();
      expect(state.held.length).assertEqual(0);
      expect(state.pending.length).assertEqual(0);

      } catch (error) {
        console.error("testAsyncLockQueryInstance0600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockQueryInstance0700
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_0700
     * @tc.desc    Verify multiple instance queries return consistent results
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = new AsyncLock();
      let state1 = lock.query();
      let state2 = lock.query();
      expect(state1.held.length).assertEqual(state2.held.length);
      expect(state1.pending.length).assertEqual(state2.pending.length);
    });

    /**
     * @tc.name    testAsyncLockQueryInstance0800
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_0800
     * @tc.desc    Verify instance query with multiple shared locks held
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryInstance0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = AsyncLock.request("maxHeld");
        const lockAsyncCallback3 = (): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p1 = lock.lockAsync<void>(
          lockAsyncCallback3, AsyncLockMode.SHARED);
        const lockAsyncCallback4 = (): void => {
          try {
            let state = lock.query();
            expect(state.held.length).assertLargerOrEqual(2);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p2 = lock.lockAsync<void>(
          lockAsyncCallback4, AsyncLockMode.SHARED);
        await p1;
        await p2;
        let stateAfter = lock.query();
        expect(stateAfter.held.length).assertEqual(0);
        done();
      } catch (error) {
        console.error("testAsyncLockQueryInstance0800 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryInstance0900
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_0900
     * @tc.desc    Verify try-catch can catch instance query exceptions
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = new AsyncLock();
      let errorCaught = false;
      try {
        let state = lock.query();
        expect(state.held.length).assertEqual(0);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertFalse();
    });

    /**
     * @tc.name    testAsyncLockQueryInstance1000
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_1000
     * @tc.desc    Verify instance query with null lock throws error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock: AsyncLock | null = null;
      let errorCaught = false;
      try {
        lock!.query();
        expect().assertFail();
      } catch (error) {
        errorCaught = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryInstance1100
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_1100
     * @tc.desc    Verify instance query with undefined lock throws error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock: AsyncLock | undefined = undefined;
      let errorCaught = false;
      try {
        lock!.query();
        expect().assertFail();
      } catch (error) {
        errorCaught = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryInstance1200
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_1200
     * @tc.desc    Verify instance query on multiple independent locks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock1 = new AsyncLock();
      let lock2 = new AsyncLock();
      let state1 = lock1.query();
      let state2 = lock2.query();
      expect(state1 !== state2).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryInstance1300
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_1300
     * @tc.desc    Verify instance query with same name locks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock1 = AsyncLock.request("sameName");
      let lock2 = AsyncLock.request("sameName");
      let state1 = lock1.query();
      let state2 = lock2.query();
      expect(state1.held.length).assertEqual(state2.held.length);
      expect(state1.pending.length).assertEqual(state2.pending.length);
    });

    /**
     * @tc.name    testAsyncLockQueryInstance1400
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_1400
     * @tc.desc    Verify instance query via request created lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("instanceQuery");
      let state = lock.query();
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryInstance1500
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_1500
     * @tc.desc    Verify instance and static query return same result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("sameResult");
      let state1 = lock.query();
      let state2 = AsyncLock.query("sameResult");
      expect(state1.held.length).assertEqual(state2.held.length);
      expect(state1.pending.length).assertEqual(state2.pending.length);
    });

    /**
     * @tc.name    testAsyncLockQueryInstance1600
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_1600
     * @tc.desc    Verify static query for any lock instance
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("anyLock");
      let state = AsyncLock.query("anyLock");
      expect(state.held.length).assertEqual(0);
      expect(lock.name).assertEqual("anyLock");
    });

    /**
     * @tc.name    testAsyncLockQueryInstance1700
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_1700
     * @tc.desc    Verify multiple instance queries return consistent held array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryInstance1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let lock = new AsyncLock();
      for (let i = 0; i < 1000; i++) {
        lock.query();
      }
      let state = lock.query();
      expect(Array.isArray(state.held)).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryInstance1800
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_1800
     * @tc.desc    Verify instance queries on many locks return held arrays
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryInstance1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locks: AsyncLock[] = [];
      for (let i = 0; i < 100; i++) {
        locks.push(new AsyncLock());
      }
      for (let lock of locks) {
        lock.query();
      }
      expect(locks.length).assertEqual(100);
    });

    /**
     * @tc.name    testAsyncLockQueryInstance1900
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_1900
     * @tc.desc    Verify instance query in async monitor function
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("monitorLock");
      let monitor = async (): Promise<void> => {
        let state = lock.query();
        expect(Array.isArray(state.held)).assertTrue();
      };
      await monitor();

      } catch (error) {
        console.error("testAsyncLockQueryInstance1900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockQueryInstance2000
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_2000
     * @tc.desc    Verify instance query pending array not empty when lock is waiting
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryInstance2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        const lockAsyncCallback5 = (): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p1 = lock.lockAsync<void>(
          lockAsyncCallback5);
        const lockAsyncCallback6 = (): void => {};
        let p2 = lock.lockAsync<void>(
          lockAsyncCallback6);
        let state = lock.query();
        expect(state.pending.length).assertLarger(0);
        await p1;
        await p2;
        done();
      } catch (error) {
        console.error("testAsyncLockQueryInstance2000 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryInstance2100
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_2100
     * @tc.desc    Verify instance query pending array contains multiple waiting elements
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryInstance2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        const lockAsyncCallback7 = (): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p1 = lock.lockAsync<void>(
          lockAsyncCallback7);
        const lockAsyncCallback8 = (): void => {};
        let p2 = lock.lockAsync<void>(
          lockAsyncCallback8);
        const lockAsyncCallback9 = (): void => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p3: Promise<void> = lock.lockAsync<void>(
          lockAsyncCallback9);
        let state = lock.query();
        expect(state.pending.length).assertLargerOrEqual(2);
        await p1;
        await p2;
        await p3;
        done();
      } catch (error) {
        console.error("testAsyncLockQueryInstance2100 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryInstance2200
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_2200
     * @tc.desc    Verify instance query held element contains lock name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = AsyncLock.request("heldNameInst");
        const lockAsyncCallback10 = (): void => {
          let state = lock.query();
          expect(state.held.length).assertLarger(0);
          expect(state.held[0].name).assertEqual("heldNameInst");
        };
        await lock.lockAsync<void>(
          lockAsyncCallback10);
        done();
      } catch (error) {
        console.error("testAsyncLockQueryInstance2200 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryInstance2300
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_2300
     * @tc.desc    Verify instance query held element contains lock mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = AsyncLock.request("heldModeInst");
        const lockAsyncCallback11 = (): void => {
          let state = lock.query();
          expect(state.held.length).assertLarger(0);
          expect(state.held[0].mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        };
        await lock.lockAsync<void>(
          lockAsyncCallback11, AsyncLockMode.EXCLUSIVE);
        done();
      } catch (error) {
        console.error("testAsyncLockQueryInstance2300 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryInstance2400
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_2400
     * @tc.desc    Verify instance query held element contains contextId
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        const lockAsyncCallback12 = (): void => {
          try {
            let state = lock.query();
            expect(state.held.length).assertLarger(0);
            expect(state.held[0].contextId).assertLarger(0);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        await lock.lockAsync<void>(
          lockAsyncCallback12);
        done();
      } catch (error) {
        console.error("testAsyncLockQueryInstance2400 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryInstance2500
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_2500
     * @tc.desc    Verify instance query pending element contains lock name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = AsyncLock.request("pendingNameInst");
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
        let state = lock.query();
        expect(state.pending.length).assertLarger(0);
        expect(state.pending[0].name).assertEqual("pendingNameInst");
        await p1;
        await p2;
        done();
      } catch (error) {
        console.error("testAsyncLockQueryInstance2500 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryInstance2600
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_2600
     * @tc.desc    Verify instance query pending element contains lock mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = AsyncLock.request("pendingModeInst");
        const lockAsyncCallback15 = (): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p1 = lock.lockAsync<void>(
          lockAsyncCallback15, AsyncLockMode.EXCLUSIVE);
        const lockAsyncCallback16 = (): void => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p2 = lock.lockAsync<void>(
          lockAsyncCallback16, AsyncLockMode.EXCLUSIVE);
        let state = lock.query();
        expect(state.pending.length).assertLarger(0);
        expect(state.pending[0].mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        await p1;
        await p2;
        done();
      } catch (error) {
        console.error("testAsyncLockQueryInstance2600 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryInstance2700
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_2700
     * @tc.desc    Verify instance query pending element contains contextId
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        const lockAsyncCallback17 = (): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p1 = lock.lockAsync<void>(
          lockAsyncCallback17);
        const lockAsyncCallback18 = (): void => {};
        let p2: Promise<void> = lock.lockAsync<void>(
          lockAsyncCallback18);
        let state = lock.query();
        expect(state.pending.length).assertLarger(0);
        expect(state.pending[0].contextId).assertLarger(0);
        await p1;
        await p2;
        done();
      } catch (error) {
        console.error("testAsyncLockQueryInstance2700 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryInstance2800
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_2800
     * @tc.desc    Verify multiple instance query calls return consistent results
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryInstance2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let states = await Promise.all([
          Promise.resolve(lock.query()),
          Promise.resolve(lock.query()),
          Promise.resolve(lock.query())
        ]);
        expect(states.length).assertEqual(3);
        for (let s of states) {
          expect(s.held.length).assertEqual(0);
          expect(s.pending.length).assertEqual(0);
        }
        done();
      } catch (error) {
        console.error("testAsyncLockQueryInstance2800 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryInstance2900
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_2900
     * @tc.desc    Verify instance query state recovers after pending lock completes
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryInstance2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        const lockAsyncCallback19 = (): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p1: Promise<void> = lock.lockAsync<void>(
          lockAsyncCallback19);
        const lockAsyncCallback20 = (): void => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p2: Promise<void> = lock.lockAsync<void>(
          lockAsyncCallback20);
        let stateBefore = lock.query();
        expect(stateBefore.pending.length).assertLarger(0);
        await p1;
        await p2;
        let stateAfter = lock.query();
        expect(stateAfter.held.length).assertEqual(0);
        expect(stateAfter.pending.length).assertEqual(0);
        done();
      } catch (error) {
        console.error("testAsyncLockQueryInstance2900 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryInstance3000
     * @tc.number  SUB_ASYNCLOCK_QUERY_INSTANCE_TEST_3000
     * @tc.desc    Verify periodic instance query monitors lock state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryInstance3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        for (let i = 0; i < 10; i++) {
          let state = lock.query();
          expect(Array.isArray(state.held)).assertTrue();
          expect(Array.isArray(state.pending)).assertTrue();
          await sleep(100);
        }
        done();
      } catch (error) {
        console.error("testAsyncLockQueryInstance3000 failed");
        expect(false).assertFail();
        done();
      }
    });
  });
}
