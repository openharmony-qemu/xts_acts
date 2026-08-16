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

export default function AsyncLockStatePropertyTest(): void {
  describe('AsyncLockStatePropertyTest', (): void => {

    /**
     * @tc.name    testAsyncLockStateProperty0100
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_0100
     * @tc.desc    Verify property access requires no parameters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      let held: AsyncLockInfo[] = state.held;
      let pending: AsyncLockInfo[] = state.pending;
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty0200
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_0200
     * @tc.desc    Verify property access has no parameter types
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty0300
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_0300
     * @tc.desc    Verify get held property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      let held: AsyncLockInfo[] = state.held;
      expect(Array.isArray(held)).assertTrue();
      expect(held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty0400
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_0400
     * @tc.desc    Verify get pending property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      let pending: AsyncLockInfo[] = state.pending;
      expect(Array.isArray(pending)).assertTrue();
      expect(pending.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty0500
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_0500
     * @tc.desc    Verify get all properties
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(Array.isArray(state.held)).assertTrue();
      expect(Array.isArray(state.pending)).assertTrue();
      expect(state.held.length).assertEqual(0);
      expect(state.pending.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty0600
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_0600
     * @tc.desc    Verify property structure is correct
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(Array.isArray(state.held)).assertTrue();
      expect(Array.isArray(state.pending)).assertTrue();
      expect(state.held.length).assertEqual(0);
      expect(state.pending.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty0700
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_0700
     * @tc.desc    Verify newly created lock held is empty array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty0800
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_0800
     * @tc.desc    Verify newly created lock pending is empty array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(state.pending.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty0900
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_0900
     * @tc.desc    Verify no lock operations state is empty
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request("emptyState");
      let state = lock.query();
      expect(state.held.length).assertEqual(0);
      expect(state.pending.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty1000
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_1000
     * @tc.desc    Verify when lock is held state is not empty
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockStateProperty1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
      }, AsyncLockMode.EXCLUSIVE);

      } catch (error) {
        console.error("testAsyncLockStateProperty1000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockStateProperty1100
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_1100
     * @tc.desc    Verify held and pending are empty arrays for new lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(state.held.length).assertEqual(0);
      expect(state.pending.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty1200
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_1200
     * @tc.desc    Verify held array is initially empty for new lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockStateProperty1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty1300
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_1300
     * @tc.desc    Verify pending array is initially empty for new lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockStateProperty1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(state.pending.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty1400
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_1400
     * @tc.desc    Verify held property is not optional
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(Array.isArray(state.held)).assertTrue();
      expect(state.held.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty1500
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_1500
     * @tc.desc    Verify pending property is not optional
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(Array.isArray(state.pending)).assertTrue();
      expect(state.pending.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty1600
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_1600
     * @tc.desc    Verify held and pending are independent
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      expect(state.held).not().assertEqual(state.pending);
    });

    /**
     * @tc.name    testAsyncLockStateProperty1700
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_1700
     * @tc.desc    Verify held and pending can both be empty
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {});
      let state = lock.query();
      expect(state.held.length).assertEqual(0);
      expect(state.pending.length).assertEqual(0);

      } catch (error) {
        console.error("testAsyncLockStateProperty1700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockStateProperty1800
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_1800
     * @tc.desc    Verify state can be JSON serialized
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      let json = JSON.stringify(state);
      expect(json.includes("held")).assertTrue();
      expect(json.includes("pending")).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockStateProperty1900
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_1900
     * @tc.desc    Verify JSON serialization result is correct
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockStateProperty1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = AsyncLock.request('lock');
      let states: AsyncLockState[] = AsyncLock.queryAll();
      let json = JSON.stringify(states);
      expect(json.includes("held")).assertTrue();
      expect(json.includes("pending")).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockStateProperty2000
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_2000
     * @tc.desc    Verify acquiring lock increases held elements
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockStateProperty2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let stateBefore = lock.query();
      expect(stateBefore.held.length).assertEqual(0);
      await lock.lockAsync<void>(() => {
        let stateDuring = lock.query();
        expect(stateDuring.held.length).assertLarger(0);
      });

      } catch (error) {
        console.error("testAsyncLockStateProperty2000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockStateProperty2100
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_2100
     * @tc.desc    Verify releasing lock decreases held elements
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockStateProperty2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        try {
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let stateAfter = lock.query();
      expect(stateAfter.held.length).assertEqual(0);

      } catch (error) {
        console.error("testAsyncLockStateProperty2100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockStateProperty2200
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_2200
     * @tc.desc    Verify held property returns array for new lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockStateProperty2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      let heldLen: number = state.held.length;
      for (let i = 0; i < 1000; i++) {
        let val = state.held;
      }
      expect(heldLen).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty2300
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_2300
     * @tc.desc    Verify pending property returns array for new lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockStateProperty2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let lock = new AsyncLock();
      let state = lock.query();
      let pendingLen: number = state.pending.length;
      for (let i = 0; i < 1000; i++) {
        let val = state.pending;
      }
      expect(pendingLen).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockStateProperty2400
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_2400
     * @tc.desc    Verify held array traversal returns correct count
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockStateProperty2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        let heldCount: number = 0;
        for (let info of state.held) { heldCount++ }
        expect(heldCount).assertLarger(0);
      });

      } catch (error) {
        console.error("testAsyncLockStateProperty2400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockStateProperty2500
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_2500
     * @tc.desc    Verify held contains AsyncLockInfo objects
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockStateProperty2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("heldInfo");
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        if (state.held.length > 0) {
          expect(state.held[0].contextId).assertLarger(0);
        }
      });

      } catch (error) {
        console.error("testAsyncLockStateProperty2500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockStateProperty2600
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_2600
     * @tc.desc    Verify concurrent SHARED lock requests keep held non-empty
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockStateProperty2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await Promise.all([
        lock.lockAsync<void>(() => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED),
        lock.lockAsync<void>(() => {
          try {
            let state = lock.query();
            expect(state.held.length > 0).assertTrue();
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED)
      ]);

      } catch (error) {
        console.error("testAsyncLockStateProperty2600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockStateProperty2700
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_2700
     * @tc.desc    Verify pending array length, element access and traversal
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockStateProperty2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let p1 = lock.lockAsync<void>((): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        let p2 = lock.lockAsync<void>(() => {});
        let state = lock.query();
        let length = state.pending.length;
        expect(typeof length).assertEqual("int");
        expect(length).assertLarger(0);
        if (state.pending.length > 0) {
          let firstPending: AsyncLockInfo = state.pending[0];
          expect(typeof firstPending.name).assertEqual("string");
          expect(firstPending.mode).assertEqual(AsyncLockMode.EXCLUSIVE);
          expect(Number.isInteger(firstPending.contextId)).assertTrue();
          expect(firstPending.contextId).assertLarger(0);
        }
        let traversedCount: number = 0;
        for (let info of state.pending) {
          traversedCount++;
        }
        expect(traversedCount).assertEqual(length);
        await p1;
        await p2;
        done();
      } catch (error) {
        console.error('testAsyncLockStateProperty2700 failed: ' + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockStateProperty2800
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_2800
     * @tc.desc    Verify waiting completion decreases pending elements
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockStateProperty2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let p1 = lock.lockAsync<void>((): Promise<void> => {
        try {
          return sleep(100);
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let p2: Promise<void> = lock.lockAsync<void>(() => {});
      let state = lock.query();
      expect(state.pending.length).assertLarger(0);
      await p1;
      await p2;
      let stateAfter = lock.query();
      expect(stateAfter.pending.length).assertEqual(0);

      } catch (error) {
        console.error("testAsyncLockStateProperty2800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockStateProperty2900
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_2900
     * @tc.desc    Verify monitor lock held state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockStateProperty2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let monitorHeld: () => Promise<Int> = async (): Promise<Int> => {
        let state = lock.query();
        return state.held.length as Int;
      };

      let heldCountBefore = await monitorHeld();
      expect(heldCountBefore).assertEqual(0);
      await lock.lockAsync<void>(async () => {
        try {
          let heldCountDuring = await monitorHeld();
          expect(heldCountDuring).assertEqual(1);
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let heldCountAfter = await monitorHeld();
      expect(heldCountAfter).assertEqual(0);

      } catch (error) {
        console.error("testAsyncLockStateProperty2900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockStateProperty3000
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_3000
     * @tc.desc    Verify pending state is empty before any waiting request
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockStateProperty3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let monitorPending: () => Promise<int> = async (): Promise<int> => {
        let state = lock.query();
        return state.pending.length;
      };
      let pendingCountBefore = await monitorPending();
      expect(pendingCountBefore).assertEqual(0);

      } catch (error) {
        console.error("testAsyncLockStateProperty3000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockStateProperty3100
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_3100
     * @tc.desc    Verify debug view lock state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockStateProperty3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        let jsonStr = JSON.stringify(state);
        expect(jsonStr).assertContain('"held"');
        expect(jsonStr).assertContain('"pending"');
      });

      } catch (error) {
        console.error("testAsyncLockStateProperty3100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockStateProperty3200
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_3200
     * @tc.desc    Verify held array in state snapshot can be modified
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockStateProperty3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        await lock.lockAsync<void>(() => {
          try {
            let state = lock.query();
            expect(state.held.length).assertLarger(0);
            let info: AsyncLockInfo = state.held[0];
            let originalLen: number = state.held.length;
            state.held.push(info);
            expect(state.held.length).assertEqual(originalLen + 1);
            expect(state.held[1].name).assertEqual(info.name);
            let emptyHeld: AsyncLockInfo[] = [];
            state.held = emptyHeld;
            expect(state.held.length).assertEqual(0);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        done();
      } catch (error) {
        console.error('testAsyncLockStateProperty3200 failed: ' + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockStateProperty3300
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_3300
     * @tc.desc    Verify pending array in state snapshot can be modified
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockStateProperty3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let p1 = lock.lockAsync<void>((): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        let p2 = lock.lockAsync<void>(() => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        let state = lock.query();
        expect(state.pending.length).assertLarger(0);
        let info: AsyncLockInfo = state.pending[0];
        let originalLen: number = state.pending.length;
        state.pending.push(info);
        expect(state.pending.length).assertEqual(originalLen + 1);
        expect(state.pending[1].mode).assertEqual(info.mode);
        let emptyPending: AsyncLockInfo[] = [];
        state.pending = emptyPending;
        expect(state.pending.length).assertEqual(0);
        await p1;
        await p2;
        done();
      } catch (error) {
        console.error('testAsyncLockStateProperty3300 failed: ' + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockStateProperty3400
     * @tc.number  SUB_ASYNCLOCK_STATE_PROPERTY_TEST_3400
     * @tc.desc    Verify held and pending can be non-empty at the same time
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockStateProperty3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let p1: Promise<void> = lock.lockAsync<void>((): Promise<void> => {
          try {
            return sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED);
        let p2: Promise<void> = lock.lockAsync<void>(() => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.EXCLUSIVE);
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
        expect(state.pending.length).assertLarger(0);
        expect(state.held[0].mode).assertEqual(AsyncLockMode.SHARED);
        expect(state.pending[0].mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        await p1;
        await p2;
        done();
      } catch (error) {
        console.error('testAsyncLockStateProperty3400 failed: ' + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    });

  });
}
