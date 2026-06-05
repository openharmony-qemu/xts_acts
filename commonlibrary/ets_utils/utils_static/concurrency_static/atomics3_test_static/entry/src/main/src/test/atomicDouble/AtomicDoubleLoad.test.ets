'use static'

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

export default function atomicDoubleLoadTest():void {
  describe('atomicDoubleLoadTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicDoubleLoadTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_0100
     * @tc.desc   Verify AtomicDouble.load() requires no parameters and returns current value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleLoadTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      const value = atomicDouble.load();
      expect(value).assertEqual(10.0);
    });

    /**
     * @tc.name   atomicDoubleLoadTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_0200
     * @tc.desc   Verify AtomicDouble.load() returns correct value for negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleLoadTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(-25.5);
      const value = atomicDouble.load();
      expect(value).assertEqual(-25.5);
    });

    /**
     * @tc.name   atomicDoubleLoadTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_0300
     * @tc.desc   Verify AtomicDouble.load() returns positive infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleLoadTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(Infinity);
      const value = atomicDouble.load();
      expect(value).assertEqual(Infinity);
    });

    /**
     * @tc.name   atomicDoubleLoadTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_0400
     * @tc.desc   Verify AtomicDouble.load() returns negative infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleLoadTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(-Infinity);
      const value = atomicDouble.load();
      expect(value).assertEqual(-Infinity);
    });

    /**
     * @tc.name   atomicDoubleLoadTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_0500
     * @tc.desc   Verify AtomicDouble.load() returns NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleLoadTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(NaN);
      const value = atomicDouble.load();
      expect(Number.isNaN(value)).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleLoadTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_0600
     * @tc.desc   Verify AtomicDouble.load() returns zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleLoadTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(0.0);
      const value = atomicDouble.load();
      expect(value).assertEqual(0.0);
    });

    /**
     * @tc.name   atomicDoubleLoadTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_0700
     * @tc.desc   Verify AtomicDouble.load() returns very small positive number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleLoadTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(Number.MIN_VALUE);
      const value = atomicDouble.load();
      expect(value).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name   atomicDoubleLoadTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_0800
     * @tc.desc   Verify AtomicDouble.load() returns very large number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleLoadTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(Number.MAX_VALUE);
      const value = atomicDouble.load();
      expect(value).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name   atomicDoubleLoadTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_0900
     * @tc.desc   Verify AtomicDouble.load() return type is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleLoadTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      const result = atomicDouble.load();
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.name   atomicDoubleLoadTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_1000
     * @tc.desc   Verify AtomicDouble.load() reads updated value after store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleLoadTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.store(20.5);
      const value = atomicDouble.load();
      expect(value).assertEqual(20.5);
    });

    /**
     * @tc.name   atomicDoubleLoadTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_1100
     * @tc.desc   Verify AtomicDouble.load() multiple consecutive reads return same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleLoadTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(15.5);
      const value1 = atomicDouble.load();
      const value2 = atomicDouble.load();
      const value3 = atomicDouble.load();
      expect(value1).assertEqual(15.5);
      expect(value2).assertEqual(15.5);
      expect(value3).assertEqual(15.5);
    });

    /**
     * @tc.name   atomicDoubleLoadTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_1200
     * @tc.desc   Verify AtomicDouble.load() in sensor data reading scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleLoadTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const temperature = new AtomicDouble(25.5);
      const currentTemp = temperature.load();
      expect(currentTemp).assertEqual(25.5);
    });

    /**
     * @tc.name   atomicDoubleLoadTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_1300
     * @tc.desc   Verify AtomicDouble.load() with scientific notation value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleLoadTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(1.5e10);
      const value = atomicDouble.load();
      expect(value).assertEqual(1.5e10);
    });

    /**
     * @tc.name   atomicDoubleLoadTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_1400
     * @tc.desc   Verify AtomicDouble.load() with negative zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleLoadTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(-0.0);
      const value = atomicDouble.load();
      expect(value).assertEqual(-0.0);
    });

    /**
     * @tc.name   atomicDoubleLoadTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_1500
     * @tc.desc   Verify AtomicDouble.load() after exchange operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleLoadTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.exchange(30.5);
      const value = atomicDouble.load();
      expect(value).assertEqual(30.5);
    });

    /**
     * @tc.name   atomicDoubleLoadTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_1600
     * @tc.desc   Verify AtomicDouble.load() after compareAndSwap success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleLoadTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.compareAndSwap(10.0, 40.5);
      const value = atomicDouble.load();
      expect(value).assertEqual(40.5);
    });

    /**
     * @tc.name   atomicDoubleLoadTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_1700
     * @tc.desc   Verify AtomicDouble.load() after fetchAdd operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleLoadTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.fetchAdd(5.5);
      const value = atomicDouble.load();
      expect(value).assertEqual(15.5);
    });

    /**
     * @tc.name   atomicDoubleLoadTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_1800
     * @tc.desc   Verify AtomicDouble.load() after fetchSub operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleLoadTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicDouble = new AtomicDouble(10.0);
      atomicDouble.fetchSub(3.5);
      const value = atomicDouble.load();
      expect(value).assertEqual(6.5);
    });

    /**
     * @tc.name   atomicDoubleLoadTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_1900
     * @tc.desc   Verify AtomicDouble.load() with precision test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleLoadTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(3.141592653589793);
      const value = atomicDouble.load();
      expect(value).assertEqual(3.141592653589793);
    });

    /**
     * @tc.name   atomicDoubleLoadTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_2000
     * @tc.desc   Verify AtomicDouble.load() with Number.EPSILON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleLoadTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicDouble = new AtomicDouble(Number.EPSILON);
      const value = atomicDouble.load();
      expect(value).assertEqual(Number.EPSILON);
    });
    /**
     * @tc.name   atomicDoubleLoadTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_2100
     * @tc.desc   Verify AtomicDouble.load() concurrent read with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleLoadTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   atomicDoubleLoadTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_2200
     * @tc.desc   Verify AtomicDouble.load() atomicity with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleLoadTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicDouble = new AtomicDouble(25.5);
      let results: number[] = [];

      let task1 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicDouble.load());
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicDouble.load());
        }
      };

      let task3 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicDouble.load());
        }
      };

      await Promise.all([task1(), task2(), task3()]);

      expect(results.length).assertEqual(150);
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(25.5);
      }
    });
    /**
     * @tc.name   atomicDoubleLoadTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_LOAD_TEST_2300
     * @tc.desc   Verify AtomicDouble.load() concurrent read-write consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleLoadTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicDouble = new AtomicDouble(1.5);
      let readResults: number[] = [];

      let readTask = async () => {
        for (let i = 0; i < 100; i++) {
          readResults.push(atomicDouble.load());
        }
      };

      let writeTask = async () => {
        for (let i = 0; i < 100; i++) {
          atomicDouble.store(2.5);
          atomicDouble.store(1.5);
        }
      };

      await Promise.all([readTask(), writeTask()]);

      for (let i = 0; i < readResults.length; i++) {
        expect(readResults[i] === 1.5 || readResults[i] === 2.5).assertTrue();
      }
    });
  });
}
