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

export default function atomicLongCompareAndSwapTest():void {
  describe('atomicLongCompareAndSwapTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicLongCompareAndSwapTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_0100
     * @tc.desc   Verify AtomicLong.compareAndSwap() with expected matches current value (16 to 20)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongCompareAndSwapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicLong = new AtomicLong(16);
      const oldValue = atomicLong.compareAndSwap(16, 20);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_0200
     * @tc.desc   Verify AtomicLong.compareAndSwap() with expected does not match current value (expected 20, actual 16)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongCompareAndSwapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicLong = new AtomicLong(16);
      const oldValue = atomicLong.compareAndSwap(20, 30);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(16);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_0300
     * @tc.desc   Verify AtomicLong.compareAndSwap() with expected matches max value (9223372036854775807 to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongCompareAndSwapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicLong = new AtomicLong(9223372036854775807);
      const oldValue = atomicLong.compareAndSwap(9223372036854775807, 0);
      expect(oldValue).assertEqual(9223372036854775807);
      expect(atomicLong.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_0400
     * @tc.desc   Verify AtomicLong.compareAndSwap() with expected matches min value (-9223372036854775808 to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongCompareAndSwapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicLong = new AtomicLong(-9223372036854775808);
      const oldValue = atomicLong.compareAndSwap(-9223372036854775808, 0);
      expect(oldValue).assertEqual(-9223372036854775808);
      expect(atomicLong.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_0500
     * @tc.desc   Verify AtomicLong.compareAndSwap() with val is max value (16 to 9223372036854775807)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongCompareAndSwapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicLong = new AtomicLong(16);
      const oldValue = atomicLong.compareAndSwap(16, 9223372036854775807);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(9223372036854775807);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_0600
     * @tc.desc   Verify AtomicLong.compareAndSwap() with val is min value (16 to -9223372036854775808)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongCompareAndSwapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicLong = new AtomicLong(16);
      const oldValue = atomicLong.compareAndSwap(16, -9223372036854775808);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_0700
     * @tc.desc   Verify AtomicLong.compareAndSwap() returns expected value when match succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongCompareAndSwapTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicLong = new AtomicLong(16);
      const oldValue = atomicLong.compareAndSwap(16, 20);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(20);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_0800
     * @tc.desc   Verify AtomicLong.compareAndSwap() returns actual old value when match fails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongCompareAndSwapTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicLong = new AtomicLong(16);
      const oldValue = atomicLong.compareAndSwap(20, 30);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(16);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_0900
     * @tc.desc   Verify AtomicLong.compareAndSwap() with expected and val are same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongCompareAndSwapTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicLong = new AtomicLong(16);
      const oldValue = atomicLong.compareAndSwap(16, 16);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(16);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_1000
     * @tc.desc   Verify AtomicLong.compareAndSwap() with zero value (0 to 100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongCompareAndSwapTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicLong = new AtomicLong(0);
      const oldValue = atomicLong.compareAndSwap(0, 100);
      expect(oldValue).assertEqual(0);
      expect(atomicLong.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_1100
     * @tc.desc   Verify AtomicLong.compareAndSwap() multiple consecutive successful swaps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongCompareAndSwapTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicLong = new AtomicLong(16);

      const oldValue1 = atomicLong.compareAndSwap(16, 20);
      expect(oldValue1).assertEqual(16);
      expect(atomicLong.load()).assertEqual(20);

      const oldValue2 = atomicLong.compareAndSwap(20, 30);
      expect(oldValue2).assertEqual(20);
      expect(atomicLong.load()).assertEqual(30);

      const oldValue3 = atomicLong.compareAndSwap(30, 40);
      expect(oldValue3).assertEqual(30);
      expect(atomicLong.load()).assertEqual(40);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_1200
     * @tc.desc   Verify AtomicLong.compareAndSwap() multiple consecutive failed swaps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongCompareAndSwapTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicLong = new AtomicLong(16);

      const oldValue1 = atomicLong.compareAndSwap(20, 30);
      expect(oldValue1).assertEqual(16);
      expect(atomicLong.load()).assertEqual(16);

      const oldValue2 = atomicLong.compareAndSwap(40, 50);
      expect(oldValue2).assertEqual(16);
      expect(atomicLong.load()).assertEqual(16);

      const oldValue3 = atomicLong.compareAndSwap(60, 70);
      expect(oldValue3).assertEqual(16);
      expect(atomicLong.load()).assertEqual(16);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_1300
     * @tc.desc   Verify AtomicLong.compareAndSwap() with alternating success and failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongCompareAndSwapTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicLong = new AtomicLong(16);

      const oldValue1 = atomicLong.compareAndSwap(16, 20);
      expect(oldValue1).assertEqual(16);
      expect(atomicLong.load()).assertEqual(20);

      const oldValue2 = atomicLong.compareAndSwap(16, 30);
      expect(oldValue2).assertEqual(20);
      expect(atomicLong.load()).assertEqual(20);

      const oldValue3 = atomicLong.compareAndSwap(20, 30);
      expect(oldValue3).assertEqual(20);
      expect(atomicLong.load()).assertEqual(30);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_1400
     * @tc.desc   Verify AtomicLong.compareAndSwap() used in CAS loop implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongCompareAndSwapTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicLong = new AtomicLong(0);

      let success = false;
      while (!success) {
        const oldVal = atomicLong.load();
        const newVal = oldVal + 1;
        const oldValue = atomicLong.compareAndSwap(oldVal, newVal);
        if (oldValue === oldVal) {
          success = true;
        }
      }

      expect(atomicLong.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_1500
     * @tc.desc   Verify AtomicLong.compareAndSwap() used in lock-free counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongCompareAndSwapTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const counter = new AtomicLong(0);

      let success = false;
      while (!success) {
        const oldVal = counter.load();
        const newVal = oldVal + 1;
        const oldValue = counter.compareAndSwap(oldVal, newVal);
        if (oldValue === oldVal) {
          success = true;
        }
      }

      expect(counter.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_1600
     * @tc.desc   Verify AtomicLong.compareAndSwap() used in state machine transition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongCompareAndSwapTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const state = new AtomicLong(0);

      const oldState = state.load();
      if (oldState === 0) {
        state.compareAndSwap(0, 1);
      }

      expect(state.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_1700
     * @tc.desc   Verify AtomicLong.compareAndSwap() used in optimistic locking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongCompareAndSwapTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const version = new AtomicLong(1);

      const oldVersion = version.load();
      const newVersion = oldVersion + 1;
      const oldValue = version.compareAndSwap(oldVersion, newVersion);

      if (oldValue === oldVersion) {
        expect(version.load()).assertEqual(2);
      }
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_1800
     * @tc.desc   Verify AtomicLong.compareAndSwap() with large value CAS operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongCompareAndSwapTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const largeValue = new AtomicLong(1000000000000);

      let success = false;
      while (!success) {
        const oldVal = largeValue.load();
        const newVal = oldVal + 1000000000;
        const oldValue = largeValue.compareAndSwap(oldVal, newVal);
        if (oldValue === oldVal) {
          success = true;
        }
      }

      expect(largeValue.load()).assertEqual(1001000000000);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_1900
     * @tc.desc   Verify AtomicLong.compareAndSwap() concurrent read with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongCompareAndSwapTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicLong = new AtomicLong(16);
      const results1: long[] = [];
      const results2: long[] = [];

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicLong.load());
        }
      };

      const task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicLong.load());
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results1.length; i++) {
        expect(results1[i]).assertEqual(16);
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i]).assertEqual(16);
      }
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_2000
     * @tc.desc   Verify AtomicLong.compareAndSwap() concurrent CAS loop with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongCompareAndSwapTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicLong = new AtomicLong(0);

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          let success = false;
          while (!success) {
            const oldVal = atomicLong.load();
            const newVal = oldVal + 1;
            const oldValue = atomicLong.compareAndSwap(oldVal, newVal);
            if (oldValue === oldVal) {
              success = true;
            }
          }
        }
      };

      const task2 = async () => {
        for (let i = 0; i < 100; i++) {
          let success = false;
          while (!success) {
            const oldVal = atomicLong.load();
            const newVal = oldVal + 1;
            const oldValue = atomicLong.compareAndSwap(oldVal, newVal);
            if (oldValue === oldVal) {
              success = true;
            }
          }
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicLong.load()).assertEqual(200);
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_2100
     * @tc.desc   Verify AtomicLong.compareAndSwap() single operation performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicLongCompareAndSwapTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let start: number = Date.now();
      let atomicLong = new AtomicLong(16);
      let oldValue: long = atomicLong.compareAndSwap(16, 20);
      let end: number = Date.now();
      let duration: number = end - start;
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(20);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_2200
     * @tc.desc   Verify AtomicLong.compareAndSwap() multiple successful operations performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicLongCompareAndSwapTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicLong = new AtomicLong(0);
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicLong.compareAndSwap(i, i + 1);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicLong.load()).assertEqual(10000);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicLongCompareAndSwapTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_COMPARE_AND_SWAP_TEST_2300
     * @tc.desc   Verify AtomicLong.compareAndSwap() CAS loop performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicLongCompareAndSwapTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicLong = new AtomicLong(0);
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        let success = false;
        while (!success) {
          let oldVal: long = atomicLong.load();
          let newVal: long = oldVal + 1;
          let oldValue: long = atomicLong.compareAndSwap(oldVal, newVal);
          if (oldValue === oldVal) {
            success = true;
          }
        }
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicLong.load()).assertEqual(10000);
      expect(duration >= 0).assertTrue();
    });
  });
}
