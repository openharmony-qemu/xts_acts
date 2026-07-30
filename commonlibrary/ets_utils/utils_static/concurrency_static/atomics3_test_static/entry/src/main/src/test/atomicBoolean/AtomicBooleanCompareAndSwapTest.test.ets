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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

export default function atomicBooleanCompareAndSwapTest():void {
  describe('atomicBooleanCompareAndSwapTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicBooleanCompareAndSwapTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_TEST_0100
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() with all required parameters - expected matches current value (false to true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanCompareAndSwapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const oldValue = atomicBoolean.compareAndSwap(false, true);
      expect(oldValue).assertFalse();
      expect(atomicBoolean.load()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanCompareAndSwapTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_TEST_0200
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() with all required parameters - expected matches current value (true to false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanCompareAndSwapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(true);
      const oldValue = atomicBoolean.compareAndSwap(true, false);
      expect(oldValue).assertTrue();
      expect(atomicBoolean.load()).assertFalse();
    });

    /**
     * @tc.name   atomicBooleanCompareAndSwapTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_TEST_0300
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() return expected value when match succeeds (false to false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanCompareAndSwapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const oldValue = atomicBoolean.compareAndSwap(false, false);
      expect(oldValue).assertFalse();
      expect(atomicBoolean.load()).assertFalse();
    });

    /**
     * @tc.name   atomicBooleanCompareAndSwapTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_TEST_0400
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() return expected value when match succeeds (true to true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanCompareAndSwapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(true);
      const oldValue = atomicBoolean.compareAndSwap(true, true);
      expect(oldValue).assertTrue();
      expect(atomicBoolean.load()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanCompareAndSwapTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_TEST_0500
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() returns actual old value when match fails (expected true, actual false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanCompareAndSwapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const oldValue = atomicBoolean.compareAndSwap(true, false);
      expect(oldValue).assertFalse();
      expect(atomicBoolean.load()).assertFalse();
    });

    /**
     * @tc.name   atomicBooleanCompareAndSwapTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_TEST_0600
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() returns actual old value when match fails (expected false, actual true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanCompareAndSwapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(true);
      const oldValue = atomicBoolean.compareAndSwap(false, true);
      expect(oldValue).assertTrue();
      expect(atomicBoolean.load()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanCompareAndSwapTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_TEST_0700
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() used in spin lock implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanCompareAndSwapTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const lock = new AtomicBoolean(false);

      // Simulate acquiring lock
      let acquired = false;
      let attempts = 0;
      const maxAttempts = 10;

      while (!acquired && attempts < maxAttempts) {
        if (lock.compareAndSwap(false, true) === false) {
          acquired = true;
        }
        attempts++;
      }

      expect(acquired).assertTrue();
      expect(lock.load()).assertTrue();

      // Simulate releasing lock
      lock.store(false);
      expect(lock.load()).assertFalse();
    });

    /**
     * @tc.name   atomicBooleanCompareAndSwapTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_TEST_0800
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() used in state machine - start operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanCompareAndSwapTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const running = new AtomicBoolean(false);

      // First start should succeed
      const startResult1 = running.compareAndSwap(false, true);
      expect(startResult1).assertFalse();
      expect(running.load()).assertTrue();

      // Second start should fail (already running)
      const startResult2 = running.compareAndSwap(false, true);
      expect(startResult2).assertTrue();
      expect(running.load()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanCompareAndSwapTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_TEST_0900
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() used in state machine - stop operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanCompareAndSwapTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const running = new AtomicBoolean(true);

      // First stop should succeed
      const stopResult1 = running.compareAndSwap(true, false);
      expect(stopResult1).assertTrue();
      expect(running.load()).assertFalse();

      // Second stop should fail (already stopped)
      const stopResult2 = running.compareAndSwap(true, false);
      expect(stopResult2).assertFalse();
      expect(running.load()).assertFalse();
    });

    /**
     * @tc.name   atomicBooleanCompareAndSwapTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_TEST_1000
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() complete state machine lifecycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanCompareAndSwapTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const running = new AtomicBoolean(false);

      // Start the service
      const startResult = running.compareAndSwap(false, true);
      expect(startResult).assertFalse();
      expect(running.load()).assertTrue();

      // Stop the service
      const stopResult = running.compareAndSwap(true, false);
      expect(stopResult).assertTrue();
      expect(running.load()).assertFalse();

      // Restart the service
      const restartResult = running.compareAndSwap(false, true);
      expect(restartResult).assertFalse();
      expect(running.load()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanCompareAndSwapTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_TEST_1100
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() multiple consecutive successful swaps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanCompareAndSwapTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);

      // First swap: false -> true
      let result = atomicBoolean.compareAndSwap(false, true);
      expect(result).assertFalse();
      expect(atomicBoolean.load()).assertTrue();

      // Second swap: true -> false
      result = atomicBoolean.compareAndSwap(true, false);
      expect(result).assertTrue();
      expect(atomicBoolean.load()).assertFalse();

      // Third swap: false -> true
      result = atomicBoolean.compareAndSwap(false, true);
      expect(result).assertFalse();
      expect(atomicBoolean.load()).assertTrue();

      // Fourth swap: true -> true
      result = atomicBoolean.compareAndSwap(true, true);
      expect(result).assertTrue();
      expect(atomicBoolean.load()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanCompareAndSwapTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_TEST_1200
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() multiple consecutive failed swaps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanCompareAndSwapTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(true);

      // First failed swap: expected false, actual true
      let result = atomicBoolean.compareAndSwap(false, false);
      expect(result).assertTrue();
      expect(atomicBoolean.load()).assertTrue();

      // Second failed swap: expected false, actual true
      result = atomicBoolean.compareAndSwap(false, true);
      expect(result).assertTrue();
      expect(atomicBoolean.load()).assertTrue();

      // Third failed swap: expected false, actual true
      result = atomicBoolean.compareAndSwap(false, false);
      expect(result).assertTrue();
      expect(atomicBoolean.load()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanCompareAndSwapTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_TEST_1300
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() return type is boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanCompareAndSwapTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const result = atomicBoolean.compareAndSwap(false, true);
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.name   atomicBooleanCompareAndSwapTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_TEST_1400
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() concurrent CAS returns valid boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicBooleanCompareAndSwapTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const results: boolean[] = [];

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          const oldValue = atomicBoolean.compareAndSwap(false, true);
          results.push(oldValue);
          atomicBoolean.store(false);
        }
      };

      const task2 = async () => {
        for (let i = 0; i < 100; i++) {
          const oldValue = atomicBoolean.compareAndSwap(false, true);
          results.push(oldValue);
          atomicBoolean.store(false);
        }
      };

      await Promise.all([task1(), task2()]);

      expect(results.length).assertEqual(200);
      for (let i = 0; i < results.length; i++) {
        expect(typeof results[i]).assertEqual('boolean');
      }
    });

    /**
     * @tc.name   atomicBooleanCompareAndSwapTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_COMPARE_AND_SWAP_TEST_1500
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() concurrent read and CAS returns valid boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicBooleanCompareAndSwapTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const readResults: boolean[] = [];
      const casResults: boolean[] = [];

      const readTask = async () => {
        for (let i = 0; i < 100; i++) {
          readResults.push(atomicBoolean.load());
        }
      };

      const casTask = async () => {
        for (let i = 0; i < 100; i++) {
          const oldValue = atomicBoolean.compareAndSwap(false, true);
          casResults.push(oldValue);
          atomicBoolean.store(false);
        }
      };

      await Promise.all([readTask(), casTask()]);

      expect(readResults.length).assertEqual(100);
      expect(casResults.length).assertEqual(100);
      for (let i = 0; i < readResults.length; i++) {
        expect(typeof readResults[i]).assertEqual('boolean');
      }
      for (let i = 0; i < casResults.length; i++) {
        expect(typeof casResults[i]).assertEqual('boolean');
      }
    });
  });
}
