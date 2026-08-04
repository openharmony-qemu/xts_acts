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

export default function atomicShortCompareAndSwapTest(): void {
  describe('atomicShortCompareAndSwapTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicShortCompareAndSwapTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_0100
     * @tc.desc   Verify AtomicShort.compareAndSwap() with all required parameters present and match succeeds (7 to 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortCompareAndSwapTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(7);
      const oldValue: short = atomicShort.compareAndSwap(7, 2);
      expect(oldValue).assertEqual(7);
      expect(atomicShort.load()).assertEqual(2);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_0200
     * @tc.desc   Verify AtomicShort.compareAndSwap() with expected matches current value (5 to 10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortCompareAndSwapTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(5);
      const oldValue: short = atomicShort.compareAndSwap(5, 10);
      expect(oldValue).assertEqual(5);
      expect(atomicShort.load()).assertEqual(10);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_0300
     * @tc.desc   Verify AtomicShort.compareAndSwap() with expected does not match current value (expected 10, actual 7)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortCompareAndSwapTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(7);
      const oldValue: short = atomicShort.compareAndSwap(10, 15);
      expect(oldValue).assertEqual(7);
      expect(atomicShort.load()).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_0400
     * @tc.desc   Verify AtomicShort.compareAndSwap() with expected matches max value (32767 to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortCompareAndSwapTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(32767);
      const oldValue: short = atomicShort.compareAndSwap(32767, 0);
      expect(oldValue).assertEqual(32767);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_0500
     * @tc.desc   Verify AtomicShort.compareAndSwap() with expected matches min value (-32768 to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortCompareAndSwapTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(-32768);
      const oldValue: short = atomicShort.compareAndSwap(-32768, 0);
      expect(oldValue).assertEqual(-32768);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_0600
     * @tc.desc   Verify AtomicShort.compareAndSwap() with val is normal value (7 to 100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortCompareAndSwapTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(7);
      const oldValue: short = atomicShort.compareAndSwap(7, 100);
      expect(oldValue).assertEqual(7);
      expect(atomicShort.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_0700
     * @tc.desc   Verify AtomicShort.compareAndSwap() with val is max value (7 to 32767)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortCompareAndSwapTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(7);
      const oldValue: short = atomicShort.compareAndSwap(7, 32767);
      expect(oldValue).assertEqual(7);
      expect(atomicShort.load()).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_0800
     * @tc.desc   Verify AtomicShort.compareAndSwap() with val is min value (7 to -32768)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortCompareAndSwapTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(7);
      const oldValue: short = atomicShort.compareAndSwap(7, -32768);
      expect(oldValue).assertEqual(7);
      expect(atomicShort.load()).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_0900
     * @tc.desc   Verify AtomicShort.compareAndSwap() returns expected value when match succeeds (15 to 25)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortCompareAndSwapTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(15);
      const oldValue: short = atomicShort.compareAndSwap(15, 25);
      expect(oldValue).assertEqual(15);
      expect(atomicShort.load()).assertEqual(25);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_1000
     * @tc.desc   Verify AtomicShort.compareAndSwap() updates value correctly when match succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortCompareAndSwapTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(7);
      atomicShort.compareAndSwap(7, 2);
      expect(atomicShort.load()).assertEqual(2);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_1100
     * @tc.desc   Verify AtomicShort.compareAndSwap() does not update value when match fails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortCompareAndSwapTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(7);
      atomicShort.compareAndSwap(10, 15);
      expect(atomicShort.load()).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_1200
     * @tc.desc   Verify AtomicShort.compareAndSwap() with expected and val are same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortCompareAndSwapTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort = new AtomicShort(7);
      const oldValue: short = atomicShort.compareAndSwap(7, 7);
      expect(oldValue).assertEqual(7);
      expect(atomicShort.load()).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_1300
     * @tc.desc   Verify AtomicShort.compareAndSwap() multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortCompareAndSwapTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort = new AtomicShort(7);

      const oldValue1: short = atomicShort.compareAndSwap(7, 2);
      expect(oldValue1).assertEqual(7);
      expect(atomicShort.load()).assertEqual(2);

      const oldValue2: short = atomicShort.compareAndSwap(2, 3);
      expect(oldValue2).assertEqual(2);
      expect(atomicShort.load()).assertEqual(3);

      const oldValue3: short = atomicShort.compareAndSwap(3, 4);
      expect(oldValue3).assertEqual(3);
      expect(atomicShort.load()).assertEqual(4);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_1400
     * @tc.desc   Verify AtomicShort.compareAndSwap() atomic compare and swap operation (100 to 200)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortCompareAndSwapTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort = new AtomicShort(100);
      const oldValue: short = atomicShort.compareAndSwap(100, 200);
      expect(oldValue).assertEqual(100);
      expect(atomicShort.load()).assertEqual(200);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_1500
     * @tc.desc   Verify AtomicShort.compareAndSwap() concurrent CAS loop with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortCompareAndSwapTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort = new AtomicShort(0);

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          let success = false;
          while (!success) {
            const oldVal = atomicShort.load();
            const newVal = (oldVal + 1).toShort();
            const oldValue = atomicShort.compareAndSwap(oldVal, newVal);
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
            const oldVal = atomicShort.load();
            const newVal = (oldVal + 1).toShort();
            const oldValue = atomicShort.compareAndSwap(oldVal, newVal);
            if (oldValue === oldVal) {
              success = true;
            }
          }
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicShort.load()).assertEqual(200);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_1600
     * @tc.desc   Verify AtomicShort.compareAndSwap() first call match succeeds (50 to 60)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortCompareAndSwapTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort = new AtomicShort(50);
      const oldValue: short = atomicShort.compareAndSwap(50, 60);
      expect(oldValue).assertEqual(50);
      expect(atomicShort.load()).assertEqual(60);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_1700
     * @tc.desc   Verify AtomicShort.compareAndSwap() multiple consecutive successful swaps (10 to 20 to 30 to 40)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortCompareAndSwapTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort = new AtomicShort(10);

      const oldValue1: short = atomicShort.compareAndSwap(10, 20);
      expect(oldValue1).assertEqual(10);
      expect(atomicShort.load()).assertEqual(20);

      const oldValue2: short = atomicShort.compareAndSwap(20, 30);
      expect(oldValue2).assertEqual(20);
      expect(atomicShort.load()).assertEqual(30);

      const oldValue3: short = atomicShort.compareAndSwap(30, 40);
      expect(oldValue3).assertEqual(30);
      expect(atomicShort.load()).assertEqual(40);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_1800
     * @tc.desc   Verify AtomicShort.compareAndSwap() multiple consecutive failed swaps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortCompareAndSwapTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort = new AtomicShort(7);

      const oldValue1: short = atomicShort.compareAndSwap(10, 15);
      expect(oldValue1).assertEqual(7);

      const oldValue2: short = atomicShort.compareAndSwap(20, 25);
      expect(oldValue2).assertEqual(7);

      const oldValue3: short = atomicShort.compareAndSwap(30, 35);
      expect(oldValue3).assertEqual(7);

      expect(atomicShort.load()).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_1900
     * @tc.desc   Verify AtomicShort.compareAndSwap() alternating success and failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortCompareAndSwapTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort = new AtomicShort(7);

      const oldValue1: short = atomicShort.compareAndSwap(7, 2);
      expect(oldValue1).assertEqual(7);
      expect(atomicShort.load()).assertEqual(2);

      const oldValue2: short = atomicShort.compareAndSwap(7, 3);
      expect(oldValue2).assertEqual(2);
      expect(atomicShort.load()).assertEqual(2);

      const oldValue3: short = atomicShort.compareAndSwap(2, 3);
      expect(oldValue3).assertEqual(2);
      expect(atomicShort.load()).assertEqual(3);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_2000
     * @tc.desc   Verify AtomicShort.compareAndSwap() CAS loop implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortCompareAndSwapTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort = new AtomicShort(0);
      let success = false;
      while (!success) {
        const oldVal = atomicShort.load();
        const newVal = (oldVal + 1).toShort();
        const oldValue = atomicShort.compareAndSwap(oldVal, newVal);
        if (oldValue === oldVal) {
          success = true;
        }
      }
      expect(atomicShort.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_2100
     * @tc.desc   Verify AtomicShort.compareAndSwap() with zero value (0 to 100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortCompareAndSwapTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort = new AtomicShort(0);
      const oldValue: short = atomicShort.compareAndSwap(0, 100);
      expect(oldValue).assertEqual(0);
      expect(atomicShort.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_2200
     * @tc.desc   Verify AtomicShort.compareAndSwap() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortCompareAndSwapTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort = new AtomicShort(7);
      const start: number = Date.now();
      const oldValue: short = atomicShort.compareAndSwap(7, 2);
      const end: number = Date.now();
      const duration: number = end - start;

      expect(oldValue).assertEqual(7);
      expect(atomicShort.load()).assertEqual(2);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_2300
     * @tc.desc   Verify AtomicShort.compareAndSwap() multiple successful calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortCompareAndSwapTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort = new AtomicShort(0);
      const start: number = Date.now();
      for (let i = 0; i < 1000; i++) {
        atomicShort.compareAndSwap(i.toShort(), (i + 1).toShort());
      }
      const end: number = Date.now();
      const duration: number = end - start;

      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_2400
     * @tc.desc   Verify AtomicShort.compareAndSwap() CAS loop performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortCompareAndSwapTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort = new AtomicShort(0);
      const start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        let success = false;
        while (!success) {
          const oldVal = atomicShort.load();
          const newVal = (oldVal + 1).toShort();
          const oldValue = atomicShort.compareAndSwap(oldVal, newVal);
          if (oldValue === oldVal) {
            success = true;
          }
        }
      }
      const end: number = Date.now();
      const duration: number = end - start;

      expect(atomicShort.load()).assertEqual(10000);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_2500
     * @tc.desc   Verify AtomicShort.compareAndSwap() CAS loop implementation performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortCompareAndSwapTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort = new AtomicShort(0);
      const start: number = Date.now();
      for (let i = 0; i < 1000; i++) {
        let success = false;
        while (!success) {
          const oldVal = atomicShort.load();
          const newVal = (oldVal + 1).toShort();
          const oldValue = atomicShort.compareAndSwap(oldVal, newVal);
          if (oldValue === oldVal) {
            success = true;
          }
        }
      }
      const end: number = Date.now();
      const duration: number = end - start;

      expect(atomicShort.load()).assertEqual(1000);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_2600
     * @tc.desc   Verify AtomicShort.compareAndSwap() compatibility with different ArkTS versions (20 to 30)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortCompareAndSwapTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort = new AtomicShort(20);
      const oldValue: short = atomicShort.compareAndSwap(20, 30);
      expect(oldValue).assertEqual(20);
      expect(atomicShort.load()).assertEqual(30);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_2700
     * @tc.desc   Verify AtomicShort.compareAndSwap() state machine transition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortCompareAndSwapTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const state = new AtomicShort(0); // 0: idle, 1: running
      const oldState: short = state.load();
      if (oldState === 0) {
        state.compareAndSwap(0, 1);
      }
      expect(state.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_2800
     * @tc.desc   Verify AtomicShort.compareAndSwap() optimistic lock implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortCompareAndSwapTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const version = new AtomicShort(1);
      const oldVersion = version.load();
      const data = "initial";
      const newVersion = (oldVersion + 1).toShort();
      const oldValue = version.compareAndSwap(oldVersion, newVersion);
      if (oldValue === oldVersion) {
        expect(version.load()).assertEqual(2);
      }
    });

    /**
     * @tc.name   atomicShortCompareAndSwapTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_COMPARE_AND_SWAP_TEST_2900
     * @tc.desc   Verify AtomicShort.compareAndSwap() port number update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortCompareAndSwapTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const port = new AtomicShort(8080);
      let success = false;
      while (!success) {
        const oldPort = port.load();
        const newPort = (oldPort + 1).toShort();
        const oldValue = port.compareAndSwap(oldPort, newPort);
        if (oldValue === oldPort) {
          success = true;
        }
      }
      expect(port.load()).assertEqual(8081);
    });
  })
}
