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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function atomicDoubleCompareAndSwapTest():void {
  describe('atomicDoubleCompareAndSwapTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_0100
     * @tc.desc   Verify AtomicDouble.compareAndSwap() with all required parameters - expected matches current value (7.5 to 12.0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleCompareAndSwapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(7.5);
      const oldValue = atomicDouble.compareAndSwap(7.5, 12.0);
      expect(oldValue).assertEqual(7.5);
      expect(atomicDouble.load()).assertEqual(12.0);
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_0200
     * @tc.desc   Verify AtomicDouble.compareAndSwap() returns actual old value when match fails (expected 10.0, actual 7.5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleCompareAndSwapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(7.5);
      const oldValue = atomicDouble.compareAndSwap(10.0, 12.0);
      expect(oldValue).assertEqual(7.5);
      expect(atomicDouble.load()).assertEqual(7.5);
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_0300
     * @tc.desc   Verify AtomicDouble.compareAndSwap() return type is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleCompareAndSwapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(7.5);
      const result = atomicDouble.compareAndSwap(7.5, 12.0);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_0400
     * @tc.desc   Verify AtomicDouble.compareAndSwap() used in spin lock implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleCompareAndSwapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const lock = new AtomicDouble(0.0);

      // Simulate acquiring lock
      let acquired = false;
      let attempts = 0;
      const maxAttempts = 10;

      while (!acquired && attempts < maxAttempts) {
        if (lock.compareAndSwap(0.0, 1.0) === 0.0) {
          acquired = true;
        }
        attempts++;
      }

      expect(acquired).assertTrue();
      expect(lock.load()).assertEqual(1.0);

      // Simulate releasing lock
      lock.store(0.0);
      expect(lock.load()).assertEqual(0.0);
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_0500
     * @tc.desc   Verify AtomicDouble.compareAndSwap() with zero values (0.0 to 1.0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleCompareAndSwapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(0.0);
      const oldValue = atomicDouble.compareAndSwap(0.0, 1.0);
      expect(oldValue).assertEqual(0.0);
      expect(atomicDouble.load()).assertEqual(1.0);
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_0600
     * @tc.desc   Verify AtomicDouble.compareAndSwap() with negative values (-5.5 to -10.5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleCompareAndSwapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(-5.5);
      const oldValue = atomicDouble.compareAndSwap(-5.5, -10.5);
      expect(oldValue).assertEqual(-5.5);
      expect(atomicDouble.load()).assertEqual(-10.5);
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_0700
     * @tc.desc   Verify AtomicDouble.compareAndSwap() with negative values match fails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleCompareAndSwapTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(-5.5);
      const oldValue = atomicDouble.compareAndSwap(-3.5, -10.5);
      expect(oldValue).assertEqual(-5.5);
      expect(atomicDouble.load()).assertEqual(-5.5);
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_0800
     * @tc.desc   Verify AtomicDouble.compareAndSwap() with special value Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleCompareAndSwapTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(Infinity);
      const oldValue = atomicDouble.compareAndSwap(Infinity, 100.0);
      expect(oldValue).assertEqual(Infinity);
      expect(atomicDouble.load()).assertEqual(100.0);
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_0900
     * @tc.desc   Verify AtomicDouble.compareAndSwap() with special value -Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleCompareAndSwapTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(-Infinity);
      const oldValue = atomicDouble.compareAndSwap(-Infinity, -100.0);
      expect(oldValue).assertEqual(-Infinity);
      expect(atomicDouble.load()).assertEqual(-100.0);
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_1000
     * @tc.desc   Verify AtomicDouble.compareAndSwap() multiple consecutive successful swaps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleCompareAndSwapTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(0.0);

      // First swap: 0.0 -> 1.0
      let result = atomicDouble.compareAndSwap(0.0, 1.0);
      expect(result).assertEqual(0.0);
      expect(atomicDouble.load()).assertEqual(1.0);

      // Second swap: 1.0 -> 2.0
      result = atomicDouble.compareAndSwap(1.0, 2.0);
      expect(result).assertEqual(1.0);
      expect(atomicDouble.load()).assertEqual(2.0);

      // Third swap: 2.0 -> 3.0
      result = atomicDouble.compareAndSwap(2.0, 3.0);
      expect(result).assertEqual(2.0);
      expect(atomicDouble.load()).assertEqual(3.0);
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_1100
     * @tc.desc   Verify AtomicDouble.compareAndSwap() multiple consecutive failed swaps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleCompareAndSwapTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(5.0);

      // First failed swap: expected 3.0, actual 5.0
      let result = atomicDouble.compareAndSwap(3.0, 10.0);
      expect(result).assertEqual(5.0);
      expect(atomicDouble.load()).assertEqual(5.0);

      // Second failed swap: expected 4.0, actual 5.0
      result = atomicDouble.compareAndSwap(4.0, 10.0);
      expect(result).assertEqual(5.0);
      expect(atomicDouble.load()).assertEqual(5.0);

      // Third failed swap: expected 6.0, actual 5.0
      result = atomicDouble.compareAndSwap(6.0, 10.0);
      expect(result).assertEqual(5.0);
      expect(atomicDouble.load()).assertEqual(5.0);
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_1200
     * @tc.desc   Verify AtomicDouble.compareAndSwap() swap same value (5.0 to 5.0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleCompareAndSwapTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(5.0);
      const oldValue = atomicDouble.compareAndSwap(5.0, 5.0);
      expect(oldValue).assertEqual(5.0);
      expect(atomicDouble.load()).assertEqual(5.0);
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_1300
     * @tc.desc   Verify AtomicDouble.compareAndSwap() with very small decimal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleCompareAndSwapTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(0.0001);
      const oldValue = atomicDouble.compareAndSwap(0.0001, 0.0002);
      expect(oldValue).assertEqual(0.0001);
      expect(atomicDouble.load()).assertEqual(0.0002);
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_1400
     * @tc.desc   Verify AtomicDouble.compareAndSwap() with very large values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleCompareAndSwapTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(1e10);
      const oldValue = atomicDouble.compareAndSwap(1e10, 1e11);
      expect(oldValue).assertEqual(1e10);
      expect(atomicDouble.load()).assertEqual(1e11);
    });
    /**
     * @tc.name   atomicDoubleCompareAndSwapTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_1500
     * @tc.desc   Verify AtomicDouble.compareAndSwap() concurrent read with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleCompareAndSwapTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicDouble = new AtomicDouble(10.5);
      let results1: number[] = [];
      let results2: number[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicDouble.load());
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicDouble.load());
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results1.length; i++) {
        expect(results1[i]).assertEqual(10.5);
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i]).assertEqual(10.5);
      }
    });
    /**
     * @tc.name   atomicDoubleCompareAndSwapTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_1600
     * @tc.desc   Verify AtomicDouble.compareAndSwap() concurrent CAS loop with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleCompareAndSwapTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicDouble = new AtomicDouble(0.0);
      let successCount1: int = 0;
      let successCount2: int = 0;

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          let success = false;
          let attempts = 0;
          let maxAttempts = 100;
          while (!success && attempts < maxAttempts) {
            let oldVal = atomicDouble.load();
            let oldValue = atomicDouble.compareAndSwap(oldVal, oldVal + 1.0);
            if (oldValue === oldVal) {
              success = true;
              successCount1++;
            }
            attempts++;
          }
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          let success = false;
          let attempts = 0;
          let maxAttempts = 100;
          while (!success && attempts < maxAttempts) {
            let oldVal = atomicDouble.load();
            let oldValue = atomicDouble.compareAndSwap(oldVal, oldVal + 1.0);
            if (oldValue === oldVal) {
              success = true;
              successCount2++;
            }
            attempts++;
          }
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicDouble.load()).assertEqual(200.0);
    });
    /**
     * @tc.name   atomicDoubleCompareAndSwapTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_1700
     * @tc.desc   Verify AtomicDouble.compareAndSwap() atomicity with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleCompareAndSwapTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicDouble = new AtomicDouble(1.0);
      let results: number[] = [];

      let task1 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicDouble.compareAndSwap(1.0, 2.0));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicDouble.compareAndSwap(2.0, 3.0));
        }
      };

      let task3 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicDouble.compareAndSwap(3.0, 1.0));
        }
      };

      await Promise.all([task1(), task2(), task3()]);

      for (let i = 0; i < results.length; i++) {
        expect(results[i] === 1.0 || results[i] === 2.0 || results[i] === 3.0).assertTrue();
      }
    });
    /**
     * @tc.name   atomicDoubleCompareAndSwapTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_1800
     * @tc.desc   Verify AtomicDouble.compareAndSwap() concurrent read-write consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleCompareAndSwapTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicDouble = new AtomicDouble(1.0);
      let readResults: number[] = [];
      let casResults: number[] = [];

      let readTask = async () => {
        for (let i = 0; i < 100; i++) {
          readResults.push(atomicDouble.load());
        }
      };

      let casTask = async () => {
        for (let i = 0; i < 100; i++) {
          casResults.push(atomicDouble.compareAndSwap(1.0, 2.0));
          atomicDouble.store(1.0);
        }
      };

      await Promise.all([readTask(), casTask()]);

      for (let i = 0; i < readResults.length; i++) {
        expect(readResults[i] === 1.0 || readResults[i] === 2.0).assertTrue();
      }
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_1900
     * @tc.desc   Verify AtomicDouble.compareAndSwap() with NaN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleCompareAndSwapTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(NaN);
      const oldValue = atomicDouble.compareAndSwap(NaN, 10.0);
      expect(Number.isNaN(oldValue)).assertTrue();
      expect(atomicDouble.load()).assertEqual(10.0);
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_2000
     * @tc.desc   Verify AtomicDouble.compareAndSwap() with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleCompareAndSwapTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(Number.MIN_VALUE);
      const oldValue = atomicDouble.compareAndSwap(Number.MIN_VALUE, 10.0);
      expect(oldValue).assertEqual(Number.MIN_VALUE);
      expect(atomicDouble.load()).assertEqual(10.0);
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_2100
     * @tc.desc   Verify AtomicDouble.compareAndSwap() with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleCompareAndSwapTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(Number.MAX_VALUE);
      const oldValue = atomicDouble.compareAndSwap(Number.MAX_VALUE, 10.0);
      expect(oldValue).assertEqual(Number.MAX_VALUE);
      expect(atomicDouble.load()).assertEqual(10.0);
    });

    /**
     * @tc.name   atomicDoubleCompareAndSwapTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_COMPARE_AND_SWAP_TEST_2200
     * @tc.desc   Verify AtomicDouble.compareAndSwap() with Number.EPSILON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleCompareAndSwapTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(Number.EPSILON);
      const oldValue = atomicDouble.compareAndSwap(Number.EPSILON, 10.0);
      expect(oldValue).assertEqual(Number.EPSILON);
      expect(atomicDouble.load()).assertEqual(10.0);
    });
  });
}
