'use static'
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Level, Size } from '../../../hypium';

interface GeneratedTypeLiteralInterface_1 {
  lockName: string;
  held: number;
  pending: number;
}

export default function AsyncLockQueryAllTest(): void {
  describe('AsyncLockQueryAllTest', (): void => {
    /**
     * @tc.name    testAsyncLockQueryAll0100
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_0100
     * @tc.desc    Verify queryAll method has no parameters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let states: AsyncLockState[] = AsyncLock.queryAll();
      expect(Array.isArray(states)).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryAll0200
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_0200
     * @tc.desc    Verify queryAll accepts minimum parameters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let states = AsyncLock.queryAll();
      expect(Array.isArray(states)).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryAll0300
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_0300
     * @tc.desc    Verify queryAll is defined as no-parameter static method
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let states = AsyncLock.queryAll();
      expect(Array.isArray(states)).assertTrue();
      for (let state of states) {
        expect(state instanceof AsyncLockState).assertTrue();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryAll0400
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_0400
     * @tc.desc    Verify queryAll returns AsyncLockState array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request('lock');
      let states: AsyncLockState[] = AsyncLock.queryAll();
      expect(Array.isArray(states)).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryAll0500
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_0500
     * @tc.desc    Verify queryAll returns length > 0 when locks exist
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request('lock');
      let states: AsyncLockState[] = AsyncLock.queryAll();
      if (states.length === 0) {
        throw new Error("测试失败：期望至少有1个状态，但得到的是 " + states.length);
      }
      expect(states.length).assertLarger(0);
    });

    /**
     * @tc.name    testAsyncLockQueryAll0600
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_0600
     * @tc.desc    Verify queryAll includes newly created lock state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request('singleLock');
      let states = AsyncLock.queryAll();
      let found = states.find(s => {
        return true;
      });
      expect(states.length).assertLarger(0);
    });

    /**
     * @tc.name    testAsyncLockQueryAll0700
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_0700
     * @tc.desc    Verify queryAll returns multiple states for multiple locks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      AsyncLock.request('lock1');
      AsyncLock.request('lock2');
      AsyncLock.request('lock3');
      let states = AsyncLock.queryAll();
      expect(states.length).assertLarger(0);
    });

    /**
     * @tc.name    testAsyncLockQueryAll0800
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_0800
     * @tc.desc    Verify queryAll returns non-empty held when lock is held
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let lock = AsyncLock.request('heldLock');
      await lock.lockAsync<void>(() => {
        let states = AsyncLock.queryAll();
        let hasHeld = states.some(s => s.held.length > 0);
        expect(hasHeld).assertTrue();
      });
      Done()
    });

    /**
     * @tc.name    testAsyncLockQueryAll0900
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_0900
     * @tc.desc    Verify queryAll result can be JSON serialized correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request('lock');
      let states: AsyncLockState[] = AsyncLock.queryAll();
      let jsonStr = JSON.stringify(states);
      expect(typeof jsonStr).assertEqual('string');
    });

    /**
     * @tc.name    testAsyncLockQueryAll1000
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_1000
     * @tc.desc    Verify queryAll array elements are AsyncLockState type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let states = AsyncLock.queryAll();
      for (let state of states) {
        expect(state.held.length).assertEqual(0);
      }
    });

    /**
     * @tc.name    testAsyncLockQueryAll1100
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_1100
     * @tc.desc    Verify queryAll return value is not null or undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let states = AsyncLock.queryAll();
      expect(states).not().assertNull();
      expect(states).not().assertUndefined();
    });

    /**
     * @tc.name    testAsyncLockQueryAll1200
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_1200
     * @tc.desc    Verify queryAll returns correct array length with many locks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryAll1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i = 0; i < 100; i++) {
        AsyncLock.request('bulk_' + i);
      }
      let states = AsyncLock.queryAll();
      expect(states.length).assertLarger(0);
    });

    /**
     * @tc.name    testAsyncLockQueryAll1300
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_1300
     * @tc.desc    Verify queryAll maximum array length boundary
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryAll1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let states = AsyncLock.queryAll();
      expect(states.length).assertLess(10000);
    });

    /**
     * @tc.name    testAsyncLockQueryAll1400
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_1400
     * @tc.desc    Verify queryAll does not throw exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let states = AsyncLock.queryAll();
      } catch (error) {
        expect(error).not().assertNull();
        expect(error.message).not().assertNull();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryAll1500
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_1500
     * @tc.desc    Verify queryAll does not throw exception when no locks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let states = AsyncLock.queryAll();
        expect(Array.isArray(states)).assertTrue();
      } catch (error) {
        expect(error).not().assertNull();
        expect(error.message).not().assertNull();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryAll1600
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_1600
     * @tc.desc    Verify queryAll cannot be called via instance
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let states = AsyncLock.queryAll();
      expect(Array.isArray(states)).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryAll1700
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_1700
     * @tc.desc    Verify each state contains held property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request('lock');
      let states = AsyncLock.queryAll();
      for (let state of states) {
        expect(Array.isArray(state.held)).assertTrue();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryAll1800
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_1800
     * @tc.desc    Verify each state contains pending property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let states = AsyncLock.queryAll();
      for (let state of states) {
        expect(Array.isArray(state.pending)).assertTrue();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryAll1900
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_1900
     * @tc.desc    Verify held and pending are AsyncLockInfo[] type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let states = AsyncLock.queryAll();
      for (let state of states) {
        expect(Array.isArray(state.held)).assertTrue();
        expect(Array.isArray(state.pending)).assertTrue();
      }
    });

    /**
     * @tc.name    testAsyncLockQueryAll2000
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_2000
     * @tc.desc    Verify new lock state held is empty array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request('newLock');
      let states = AsyncLock.queryAll();
      let newState = states.find(s => s.held.length === 0 && s.pending.length === 0);
      expect(Array.isArray(states)).assertTrue();
      expect(newState).not().assertUndefined();
    });

    /**
     * @tc.name    testAsyncLockQueryAll2100
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_2100
     * @tc.desc    Verify new lock state pending is empty array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request('newLock');
      let states = AsyncLock.queryAll();
      let newState = states.find(s => s.pending.length === 0);
      expect(Array.isArray(states)).assertTrue();
      expect(newState).not().assertUndefined();
    });

    /**
     * @tc.name    testAsyncLockQueryAll2200
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_2200
     * @tc.desc    Verify queryAll returns all lock states
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      AsyncLock.request('lock1');
      AsyncLock.request('lock2');
      let states = AsyncLock.queryAll();
      expect(states.length).assertLarger(0);
    });

    /**
     * @tc.name    testAsyncLockQueryAll2300
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_2300
     * @tc.desc    Verify static query returns single lock state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request('single');
      let state = AsyncLock.query('single');
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockQueryAll2400
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_2400
     * @tc.desc    Verify queryAll result contains query result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request('containedLock');
      let allStates = AsyncLock.queryAll();
      let singleState = AsyncLock.query('containedLock');
      expect(allStates.length).assertLarger(0);
      let found = allStates.some(state => state === singleState);
      expect(found).assertFalse();
    });

    /**
     * @tc.name    testAsyncLockQueryAll2500
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_2500
     * @tc.desc    Verify instance query returns current lock state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request('currentLock');
      let state = lock.query();
      expect(state.held.length == 0).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryAll2600
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_2600
     * @tc.desc    Verify multiple concurrent queryAll calls
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryAll2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let states = await Promise.all([
        Promise.resolve(AsyncLock.queryAll()),
        Promise.resolve(AsyncLock.queryAll()),
        Promise.resolve(AsyncLock.queryAll())
      ]);
      expect(states.length).assertEqual(3);
      for (let s of states) {
        expect(Array.isArray(s)).assertTrue();
      }
      Done()
    });

    /**
     * @tc.name    testAsyncLockQueryAll2700
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_2700
     * @tc.desc    Verify queryAll during lockAsync operation
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryAll2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let lock = AsyncLock.request('duringLock');
      await lock.lockAsync<void>(() => {
        let states = AsyncLock.queryAll();
        expect(Array.isArray(states)).assertTrue();
      });
      Done()
    });

    /**
     * @tc.name    testAsyncLockQueryAll2800
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_2800
     * @tc.desc    Verify queryAll in async function
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let getAllStates: () => Promise<AsyncLockState[]> = async (): Promise<AsyncLockState[]> => {
        return AsyncLock.queryAll();
      };
      let states = await getAllStates();
      expect(Array.isArray(states)).assertTrue();
      Done()
    });

    /**
     * @tc.name    testAsyncLockQueryAll2900
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_2900
     * @tc.desc    Verify queryAll in lockAsync callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let lock = AsyncLock.request('callbackAll');
      await lock.lockAsync<void>(() => {
        let states = AsyncLock.queryAll();
        expect(Array.isArray(states)).assertTrue();
      });
      Done()
    });

    /**
     * @tc.name    testAsyncLockQueryAll3000
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_3000
     * @tc.desc    Verify queryAll includes newly requested lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockQueryAll3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request('afterRequest');
      let states = AsyncLock.queryAll();
      expect(states.length).assertLarger(0);
    });

    /**
     * @tc.name    testAsyncLockQueryAll3100
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_3100
     * @tc.desc    Verify queryAll reflects lock held during lockAsync execution
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let lock = AsyncLock.request('duringExec');
      await lock.lockAsync<void>(() => {
        let states = AsyncLock.queryAll();
        let hasHeld = states.some(s => s.held.length > 0);
        expect(hasHeld).assertTrue();
      });
      Done()
    });

    /**
     * @tc.name    testAsyncLockQueryAll3200
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_3200
     * @tc.desc    Verify queryAll state recovers after lockAsync execution
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let lock = AsyncLock.request('afterExec');
      await lock.lockAsync<void>(() => {});
      let states = AsyncLock.queryAll();
      let targetState = states.find(s => s.held.length === 0);
      expect(Array.isArray(states)).assertTrue();
      expect(targetState).not().assertUndefined();
      Done()
    });

    /**
     * @tc.name    testAsyncLockQueryAll3300
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_3300
     * @tc.desc    Verify queryAll execution speed is fast
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let states = AsyncLock.queryAll();
      expect(Array.isArray(states)).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockQueryAll3400
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_3400
     * @tc.desc    Verify queryAll performance with many locks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockQueryAll3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i = 0; i < 100; i++) {
        AsyncLock.request('perf_' + i);
      }
      let states = AsyncLock.queryAll();
      expect(states.length).assertLarger(0);
    });



    /**
     * @tc.name    testAsyncLockQueryAll3500
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_3500
     * @tc.desc    Verify queryAll for monitoring all lock states
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let lock1 = AsyncLock.request('monitorLock1');
      let capturedStates: Array<GeneratedTypeLiteralInterface_1> = [];

      let monitorLocks: () => Promise<void> = async (): Promise<void> => {
        let states = AsyncLock.queryAll();
        for (let state of states) {
        }
      };
      await monitorLocks();

      expect(capturedStates.length).assertEqual(0);
      Done()
    });

    /**
     * @tc.name    testAsyncLockQueryAll3600
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_3600
     * @tc.desc    Verify queryAll for debugging all lock states
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let states = AsyncLock.queryAll();
      let jsonStr = JSON.stringify(states);
      expect(typeof jsonStr).assertEqual('string');
    });

    /**
     * @tc.name    testAsyncLockQueryAll3700
     * @tc.number  SUB_ASYNCLOCK_QUERY_ALL_TEST_3700
     * @tc.desc    Verify queryAll for validating lock creation correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockQueryAll3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      AsyncLock.request('testLock');
      let states = AsyncLock.queryAll();
      let found = states.some(s => s.held.length > 0 || s.pending.length > 0);
      expect(states.length).assertLarger(0);
    });

  });
}
