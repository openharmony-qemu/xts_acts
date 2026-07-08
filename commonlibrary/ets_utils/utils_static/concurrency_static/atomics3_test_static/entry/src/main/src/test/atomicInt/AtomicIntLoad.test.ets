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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function atomicIntLoadTest(): void {
  describe('atomicIntLoadTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicIntLoadTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_0100
     * @tc.desc   Verify AtomicInt.load() requires no parameters and returns initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntLoadTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(5);
      const result: int = atomicInt.load();
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   atomicIntLoadTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_0200
     * @tc.desc   Verify AtomicInt.load() returns positive number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntLoadTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(100);
      const result: int = atomicInt.load();
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name   atomicIntLoadTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_0300
     * @tc.desc   Verify AtomicInt.load() returns zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntLoadTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(0);
      const result: int = atomicInt.load();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   atomicIntLoadTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_0400
     * @tc.desc   Verify AtomicInt.load() returns negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntLoadTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(-100);
      const result: int = atomicInt.load();
      expect(result).assertEqual(-100);
    });

    /**
     * @tc.name   atomicIntLoadTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_0500
     * @tc.desc   Verify AtomicInt.load() returns int max value 2147483647
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntLoadTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(2147483647);
      const result: int = atomicInt.load();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.name   atomicIntLoadTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_0600
     * @tc.desc   Verify AtomicInt.load() returns int min value -2147483648
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntLoadTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(-2147483648);
      const result: int = atomicInt.load();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.name   atomicIntLoadTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_0700
     * @tc.desc   Verify AtomicInt.load() return type is int
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntLoadTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(5);
      const result: int = atomicInt.load();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.name   atomicIntLoadTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_0800
     * @tc.desc   Verify AtomicInt.load() returns new value after store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntLoadTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(5);
      atomicInt.store(10);
      const result: int = atomicInt.load();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   atomicIntLoadTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_0900
     * @tc.desc   Verify AtomicInt.load() multiple consecutive reads return same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntLoadTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(5);
      const result1: int = atomicInt.load();
      const result2: int = atomicInt.load();
      const result3: int = atomicInt.load();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(5);
    });

    /**
     * @tc.name   atomicIntLoadTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_1000
     * @tc.desc   Verify AtomicInt.load() returns new value after exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntLoadTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(5);
      atomicInt.exchange(10);
      const result: int = atomicInt.load();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   atomicIntLoadTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_1100
     * @tc.desc   Verify AtomicInt.load() returns new value after compareAndSwap success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntLoadTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(5);
      atomicInt.compareAndSwap(5, 10);
      const result: int = atomicInt.load();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   atomicIntLoadTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_1200
     * @tc.desc   Verify AtomicInt.load() returns original value after compareAndSwap failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntLoadTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(5);
      atomicInt.compareAndSwap(10, 15);
      const result: int = atomicInt.load();
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   atomicIntLoadTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_1300
     * @tc.desc   Verify AtomicInt.load() returns new value after fetchAdd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntLoadTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(5);
      atomicInt.fetchAdd(3);
      const result: int = atomicInt.load();
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name   atomicIntLoadTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_1400
     * @tc.desc   Verify AtomicInt.load() returns new value after fetchSub
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntLoadTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(10);
      atomicInt.fetchSub(3);
      const result: int = atomicInt.load();
      expect(result).assertEqual(7);
    });

    /**
     * @tc.name   atomicIntLoadTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_1500
     * @tc.desc   Verify AtomicInt.load() returns new value after fetchAnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntLoadTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(15);
      atomicInt.fetchAnd(6);
      const result: int = atomicInt.load();
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   atomicIntLoadTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_1600
     * @tc.desc   Verify AtomicInt.load() returns new value after fetchOr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntLoadTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(3);
      atomicInt.fetchOr(4);
      const result: int = atomicInt.load();
      expect(result).assertEqual(7);
    });

    /**
     * @tc.name   atomicIntLoadTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_1700
     * @tc.desc   Verify AtomicInt.load() returns new value after fetchXor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntLoadTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(5);
      atomicInt.fetchXor(3);
      const result: int = atomicInt.load();
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   atomicIntLoadTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_1800
     * @tc.desc   Verify AtomicInt.load() returns value consistent with constructor parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntLoadTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const initialValue: int = 123;
      const atomicInt = new AtomicInt(initialValue);
      const result: int = atomicInt.load();
      expect(result).assertEqual(initialValue);
    });

    /**
     * @tc.name   atomicIntLoadTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_1900
     * @tc.desc   Verify AtomicInt.load() returns -1 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntLoadTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(-1);
      const result: int = atomicInt.load();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   atomicIntLoadTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_2000
     * @tc.desc   Verify AtomicInt.load() returns 1 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntLoadTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(1);
      const result: int = atomicInt.load();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   atomicIntLoadTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_2100
     * @tc.desc   Verify AtomicInt.load() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntLoadTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicInt = new AtomicInt(5);
      const start: number = Date.now();
      const result: int = atomicInt.load();
      const end: number = Date.now();
      const duration: number = end - start;
      expect(result).assertEqual(5);
      expect(duration >= 0).assertTrue();
    });


    /**
     * @tc.name   atomicIntLoadTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_2300
     * @tc.desc   Verify AtomicInt.load() returns value that is not a float
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntLoadTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(5);
      const result: int = atomicInt.load();
      expect(result % 1).assertEqual(0);
    });

    /**
     * @tc.name   atomicIntLoadTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_2400
     * @tc.desc   Verify AtomicInt.load() handles exception scenarios correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntLoadTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        const atomicInt = new AtomicInt(5);
        const result: int = atomicInt.load();
        expect(result).assertEqual(5);
      } catch (error) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name   atomicIntLoadTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_2500
     * @tc.desc   Verify AtomicInt.load() works correctly with mixed operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntLoadTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicInt = new AtomicInt(5);
      const loaded1: int = atomicInt.load();
      expect(loaded1).assertEqual(5);
      atomicInt.store(10);
      const loaded2: int = atomicInt.load();
      expect(loaded2).assertEqual(10);
      atomicInt.exchange(15);
      const loaded3: int = atomicInt.load();
      expect(loaded3).assertEqual(15);
    });

    /**
     * @tc.name   atomicIntLoadTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_2600
     * @tc.desc   Verify AtomicInt.load() concurrent read with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntLoadTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicInt = new AtomicInt(5);
      const results1: int[] = [];
      const results2: int[] = [];

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicInt.load());
        }
      };

      const task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicInt.load());
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results1.length; i++) {
        expect(results1[i]).assertEqual(5);
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i]).assertEqual(5);
      }
    });

    /**
     * @tc.name   atomicIntLoadTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_2700
     * @tc.desc   Verify AtomicInt.load() multiple calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntLoadTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicInt = new AtomicInt(5);
      const start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        const result: int = atomicInt.load();
      }
      const end: number = Date.now();
      const duration: number = end - start;
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicIntLoadTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_2800
     * @tc.desc   Verify AtomicInt.load() high concurrency read performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntLoadTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicInt = new AtomicInt(5);
      const start: number = Date.now();
      for (let i = 0; i < 100000; i++) {
        const result: int = atomicInt.load();
      }
      const end: number = Date.now();
      const duration: number = end - start;
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicIntLoadTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_2900
     * @tc.desc   Verify AtomicInt.load() works correctly in a loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntLoadTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicInt = new AtomicInt(5);
      for (let i = 0; i < 10; i++) {
        const result: int = atomicInt.load();
        expect(result).assertEqual(5);
      }
    });

    /**
     * @tc.name   atomicIntLoadTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_3000
     * @tc.desc   Verify AtomicInt.load() works correctly with conditional call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntLoadTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicInt = new AtomicInt(5);
      const condition: boolean = true;
      if (condition) {
        const result: int = atomicInt.load();
        expect(result).assertEqual(5);
      }
    });

    /**
     * @tc.name   atomicIntLoadTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_3100
     * @tc.desc   Verify AtomicInt.load() in counter reading scenario with value 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntLoadTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new AtomicInt(42);
      const currentCount: int = counter.load();
      expect(currentCount).assertEqual(42);
    });

    /**
     * @tc.name   atomicIntLoadTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_3200
     * @tc.desc   Verify AtomicInt.load() in index reading scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntLoadTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const index = new AtomicInt(-1);
      const currentIndex: int = index.load();
      expect(currentIndex).assertEqual(-1);
    });

    /**
     * @tc.name   atomicIntLoadTest3300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_3300
     * @tc.desc   Verify AtomicInt.load() in version number reading scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntLoadTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const version = new AtomicInt(1);
      const currentVersion: int = version.load();
      expect(currentVersion).assertEqual(1);
    });

    /**
     * @tc.name   atomicIntLoadTest3400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_3400
     * @tc.desc   Verify AtomicInt.load() in config value reading scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntLoadTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const config = new AtomicInt(8080);
      const currentConfig: int = config.load();
      expect(currentConfig).assertEqual(8080);
    });

    /**
     * @tc.name   atomicIntLoadTest3500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_3500
     * @tc.desc   Verify AtomicInt.load() in loop scenario (10 iterations)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntLoadTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicInt = new AtomicInt(5);
      for (let i = 0; i < 10; i++) {
        const result: int = atomicInt.load();
        expect(result).assertEqual(5);
      }
    });

    /**
     * @tc.name   atomicIntLoadTest3600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_3600
     * @tc.desc   Verify AtomicInt.load() consistency across 100 calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntLoadTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicInt = new AtomicInt(100);
      const results: int[] = [];
      for (let i = 0; i < 100; i++) {
        results.push(atomicInt.load());
      }
      for (let i = 0; i < 100; i++) {
        expect(results[i]).assertEqual(100);
      }
    });

    /**
     * @tc.name   atomicIntLoadTest3700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_LOAD_TEST_3700
     * @tc.desc   Verify AtomicInt.load() has no side effects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntLoadTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicInt = new AtomicInt(5);
      const beforeLoad: int = atomicInt.load();
      const result: int = atomicInt.load();
      const afterLoad: int = atomicInt.load();
      expect(beforeLoad).assertEqual(result);
      expect(result).assertEqual(afterLoad);
      expect(result).assertEqual(5);
    });
  });
}
