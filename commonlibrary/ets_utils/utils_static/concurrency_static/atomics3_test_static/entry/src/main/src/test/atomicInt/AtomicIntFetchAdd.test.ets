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

export default function atomicIntFetchAddTest(): void {
  describe('atomicIntFetchAddTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicIntFetchAddTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_0100
     * @tc.desc   Verify AtomicInt.fetchAdd() with positive value (10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAddTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.fetchAdd(10);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(11);
    })

    /**
     * @tc.name   atomicIntFetchAddTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_0200
     * @tc.desc   Verify AtomicInt.fetchAdd() adding zero to value (5 + 0 = 5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAddTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(5);
      let oldValue = atomicInt.fetchAdd(0);
      expect(oldValue).assertEqual(5);
      expect(atomicInt.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicIntFetchAddTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_0300
     * @tc.desc   Verify AtomicInt.fetchAdd() with negative value (-3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAddTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(10);
      let oldValue = atomicInt.fetchAdd(-3);
      expect(oldValue).assertEqual(10);
      expect(atomicInt.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicIntFetchAddTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_0400
     * @tc.desc   Verify AtomicInt.fetchAdd() with max boundary value (2147483646)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.fetchAdd(2147483646);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(2147483647);
    })

    /**
     * @tc.name   atomicIntFetchAddTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_0500
     * @tc.desc   Verify AtomicInt.fetchAdd() with min boundary value (-2147483647)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(-1);
      let oldValue = atomicInt.fetchAdd(-2147483647);
      expect(oldValue).assertEqual(-1);
      expect(atomicInt.load()).assertEqual(-2147483648);
    })

    /**
     * @tc.name   atomicIntFetchAddTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_0600
     * @tc.desc   Verify AtomicInt.fetchAdd() returns old value before addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAddTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.fetchAdd(4);
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicIntFetchAddTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_0700
     * @tc.desc   Verify AtomicInt.fetchAdd() return value type is int
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAddTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      let oldValue = atomicInt.fetchAdd(4);
      expect(Number.isInteger(oldValue)).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchAddTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_0800
     * @tc.desc   Verify AtomicInt.fetchAdd() calculates new value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAddTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(10);
      let oldValue = atomicInt.fetchAdd(5);
      expect(atomicInt.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicIntFetchAddTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_0900
     * @tc.desc   Verify AtomicInt.fetchAdd() consecutive multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue1 = atomicInt.fetchAdd(1);
      expect(oldValue1).assertEqual(0);
      expect(atomicInt.load()).assertEqual(1);
      let oldValue2 = atomicInt.fetchAdd(2);
      expect(oldValue2).assertEqual(1);
      expect(atomicInt.load()).assertEqual(3);
      let oldValue3 = atomicInt.fetchAdd(3);
      expect(oldValue3).assertEqual(3);
      expect(atomicInt.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicIntFetchAddTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_1000
     * @tc.desc   Verify AtomicInt.fetchAdd() followed by immediate load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAddTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      atomicInt.fetchAdd(4);
      let result = atomicInt.load();
      expect(result).assertEqual(5);
    })

    /**
     * @tc.name   atomicIntFetchAddTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_1100
     * @tc.desc   Verify AtomicInt.fetchAdd() mixed with load, store, exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1);
      atomicInt.fetchAdd(4);
      expect(atomicInt.load()).assertEqual(5);
      atomicInt.store(10);
      atomicInt.fetchAdd(5);
      expect(atomicInt.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicIntFetchAddTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_1200
     * @tc.desc   Verify AtomicInt.fetchAdd() starting from negative value (-10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(-10);
      let oldValue = atomicInt.fetchAdd(5);
      expect(oldValue).assertEqual(-10);
      expect(atomicInt.load()).assertEqual(-5);
    })

    /**
     * @tc.name   atomicIntFetchAddTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_1300
     * @tc.desc   Verify AtomicInt.fetchAdd() adding to zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(-5);
      let oldValue = atomicInt.fetchAdd(5);
      expect(oldValue).assertEqual(-5);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchAddTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_1400
     * @tc.desc   Verify AtomicInt.fetchAdd() starting from zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAddTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue = atomicInt.fetchAdd(100);
      expect(oldValue).assertEqual(0);
      expect(atomicInt.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicIntFetchAddTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_1500
     * @tc.desc   Verify AtomicInt.fetchAdd() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAddTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(1);
      let start: number = Date.now();
      let oldValue = atomicInt.fetchAdd(4);
      let end: number = Date.now();
      let duration: number = end - start;
      expect(oldValue).assertEqual(1);
      expect(atomicInt.load()).assertEqual(5);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchAddTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_1600
     * @tc.desc   Verify AtomicInt.fetchAdd() multiple calls performance (10000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntFetchAddTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicInt = new AtomicInt(0);
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicInt.fetchAdd(1);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicInt.load()).assertEqual(10000);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchAddTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_1700
     * @tc.desc   Verify AtomicInt.fetchAdd() concurrent access with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchAddTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);
      let results: int[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicInt.fetchAdd(1));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicInt.fetchAdd(1));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicInt.load()).assertEqual(200);
      expect(results.length).assertEqual(200);
    })

    /**
     * @tc.name   atomicIntFetchAddTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_1800
     * @tc.desc   Verify AtomicInt.fetchAdd() high concurrency performance (100000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntFetchAddTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicInt = new AtomicInt(0);
      let start: number = Date.now();
      for (let i = 0; i < 100000; i++) {
        atomicInt.fetchAdd(1);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicInt.load()).assertEqual(100000);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchAddTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_1900
     * @tc.desc   Verify AtomicInt.fetchAdd() for counter increment scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter = new AtomicInt(0);
      counter.fetchAdd(1);
      expect(counter.load()).assertEqual(1);
      counter.fetchAdd(1);
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicIntFetchAddTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_2000
     * @tc.desc   Verify AtomicInt.fetchAdd() for batch increment scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter = new AtomicInt(0);
      counter.fetchAdd(100);
      expect(counter.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicIntFetchAddTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_2100
     * @tc.desc   Verify AtomicInt.fetchAdd() for accumulator scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let accumulator = new AtomicInt(0);
      let values: int[] = [1, 2, 3, 4, 5];
      for (let i = 0; i < values.length; i++) {
        accumulator.fetchAdd(values[i]);
      }
      expect(accumulator.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicIntFetchAddTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_2200
     * @tc.desc   Verify AtomicInt.fetchAdd() for offset calculation scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let offset = new AtomicInt(0);
      offset.fetchAdd(10);
      expect(offset.load()).assertEqual(10);
      offset.fetchAdd(20);
      expect(offset.load()).assertEqual(30);
    })

    /**
     * @tc.name   atomicIntFetchAddTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_2300
     * @tc.desc   Verify AtomicInt.fetchAdd() for subtraction using negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter = new AtomicInt(10);
      counter.fetchAdd(-3);
      expect(counter.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicIntFetchAddTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_2400
     * @tc.desc   Verify AtomicInt.fetchAdd() with overflow scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchAddTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(2147483647);
      let oldValue = atomicInt.fetchAdd(1);
      expect(oldValue).assertEqual(2147483647);
    })

    /**
     * @tc.name   atomicIntFetchAddTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_2500
     * @tc.desc   Verify AtomicInt.fetchAdd() with underflow scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchAddTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(-2147483648);
      let oldValue = atomicInt.fetchAdd(-1);
      expect(oldValue).assertEqual(-2147483648);
    })

    /**
     * @tc.name   atomicIntFetchAddTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_2600
     * @tc.desc   Verify AtomicInt.fetchAdd() with near max boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchAddTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(2147483640);
      let oldValue = atomicInt.fetchAdd(7);
      expect(oldValue).assertEqual(2147483640);
    })

    /**
     * @tc.name   atomicIntFetchAddTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_2700
     * @tc.desc   Verify AtomicInt.fetchAdd() with near min boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchAddTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(-2147483640);
      let oldValue = atomicInt.fetchAdd(-10);
      expect(oldValue).assertEqual(-2147483640);
    })

    /**
     * @tc.name   atomicIntFetchAddTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_2800
     * @tc.desc   Verify AtomicInt.fetchAdd() atomicity with concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchAddTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);

      let task1 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicInt.fetchAdd(1);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicInt.fetchAdd(1);
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicInt.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicIntFetchAddTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_2900
     * @tc.desc   Verify AtomicInt.fetchAdd() idempotency with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(5);
      let oldValue1 = atomicInt.fetchAdd(10);
      expect(oldValue1).assertEqual(5);
      let oldValue2 = atomicInt.fetchAdd(10);
      expect(oldValue2).assertEqual(15);
      let oldValue3 = atomicInt.fetchAdd(10);
      expect(oldValue3).assertEqual(25);
      expect(atomicInt.load()).assertEqual(35);
    })

    /**
     * @tc.name   atomicIntFetchAddTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_3000
     * @tc.desc   Verify AtomicInt.fetchAdd() with large positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1000000);
      let oldValue = atomicInt.fetchAdd(500000);
      expect(oldValue).assertEqual(1000000);
      expect(atomicInt.load()).assertEqual(1500000);
    })

    /**
     * @tc.name   atomicIntFetchAddTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_3100
     * @tc.desc   Verify AtomicInt.fetchAdd() with large negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1000000);
      let oldValue = atomicInt.fetchAdd(-500000);
      expect(oldValue).assertEqual(1000000);
      expect(atomicInt.load()).assertEqual(500000);
    })

    /**
     * @tc.name   atomicIntFetchAddTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_3200
     * @tc.desc   Verify AtomicInt.fetchAdd() multiple instances independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt1 = new AtomicInt(10);
      let atomicInt2 = new AtomicInt(20);
      let atomicInt3 = new AtomicInt(30);

      atomicInt1.fetchAdd(5);
      atomicInt2.fetchAdd(10);
      atomicInt3.fetchAdd(15);

      expect(atomicInt1.load()).assertEqual(15);
      expect(atomicInt2.load()).assertEqual(30);
      expect(atomicInt3.load()).assertEqual(45);
    })

    /**
     * @tc.name   atomicIntFetchAddTest3300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_3300
     * @tc.desc   Verify AtomicInt.fetchAdd() with hexadecimal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue = atomicInt.fetchAdd(0xFF);
      expect(oldValue).assertEqual(0);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntFetchAddTest3400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_3400
     * @tc.desc   Verify AtomicInt.fetchAdd() with octal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue = atomicInt.fetchAdd(0o77);
      expect(oldValue).assertEqual(0);
      expect(atomicInt.load()).assertEqual(63);
    })

    /**
     * @tc.name   atomicIntFetchAddTest3500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_3500
     * @tc.desc   Verify AtomicInt.fetchAdd() with binary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue = atomicInt.fetchAdd(0b1010);
      expect(oldValue).assertEqual(0);
      expect(atomicInt.load()).assertEqual(10);
    })

    /**
     * @tc.name   atomicIntFetchAddTest3600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_3600
     * @tc.desc   Verify AtomicInt.fetchAdd() with large value (1000000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue = atomicInt.fetchAdd(1000000);
      expect(oldValue).assertEqual(0);
      expect(atomicInt.load()).assertEqual(1000000);
    })

    /**
     * @tc.name   atomicIntFetchAddTest3700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_3700
     * @tc.desc   Verify AtomicInt.fetchAdd() concurrent read after operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchAddTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);
      let results: int[] = [];

      let task1 = async () => {
        atomicInt.fetchAdd(100);
        for (let i = 0; i < 50; i++) {
          results.push(atomicInt.load());
        }
      };

      let task2 = async () => {
        atomicInt.fetchAdd(100);
        for (let i = 0; i < 50; i++) {
          results.push(atomicInt.load());
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicInt.load()).assertEqual(200);
      expect(results.length).assertEqual(100);
    })

    /**
     * @tc.name   atomicIntFetchAddTest3800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_3800
     * @tc.desc   Verify AtomicInt.fetchAdd() with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchAddTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0);

      let task1 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchAdd(1);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchAdd(1);
        }
      };

      let task3 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchAdd(1);
        }
      };

      let task4 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchAdd(1);
        }
      };

      await Promise.all([task1(), task2(), task3(), task4()]);

      expect(atomicInt.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicIntFetchAddTest3900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_3900
     * @tc.desc   Verify AtomicInt.fetchAdd() return value independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(10);
      let oldValue1 = atomicInt.fetchAdd(5);
      let oldValue2 = atomicInt.fetchAdd(5);
      let oldValue3 = atomicInt.fetchAdd(5);

      expect(oldValue1).assertEqual(10);
      expect(oldValue2).assertEqual(15);
      expect(oldValue3).assertEqual(20);
      expect(atomicInt.load()).assertEqual(25);
    })

    /**
     * @tc.name   atomicIntFetchAddTest4000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHADD_TEST_4000
     * @tc.desc   Verify AtomicInt.fetchAdd() with alternating positive and negative values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAddTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(100);

      atomicInt.fetchAdd(50);
      expect(atomicInt.load()).assertEqual(150);

      atomicInt.fetchAdd(-30);
      expect(atomicInt.load()).assertEqual(120);

      atomicInt.fetchAdd(20);
      expect(atomicInt.load()).assertEqual(140);

      atomicInt.fetchAdd(-40);
      expect(atomicInt.load()).assertEqual(100);
    })
  })
}
