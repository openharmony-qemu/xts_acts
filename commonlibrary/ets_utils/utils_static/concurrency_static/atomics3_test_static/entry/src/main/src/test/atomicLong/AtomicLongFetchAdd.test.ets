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

export default function atomicLongFetchAddTest(): void {
  describe('atomicLongFetchAddTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicLongFetchAddTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_0100
     * @tc.desc   Verify AtomicLong.fetchAdd() with required parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAddTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong: AtomicLong = new AtomicLong(16);
      let oldValue: long = atomicLong.fetchAdd(4);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(20);
    })

    /**
     * @tc.name   atomicLongFetchAddTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_0200
     * @tc.desc   Verify AtomicLong.fetchAdd() with positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAddTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong: AtomicLong = new AtomicLong(16);
      let oldValue: long = atomicLong.fetchAdd(10);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(26);
    })

    /**
     * @tc.name   atomicLongFetchAddTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_0300
     * @tc.desc   Verify AtomicLong.fetchAdd() with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAddTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong: AtomicLong = new AtomicLong(16);
      let oldValue: long = atomicLong.fetchAdd(0);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(16);
    })

    /**
     * @tc.name   atomicLongFetchAddTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_0400
     * @tc.desc   Verify AtomicLong.fetchAdd() with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAddTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong: AtomicLong = new AtomicLong(16);
      let oldValue: long = atomicLong.fetchAdd(-3);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(13);
    })

    /**
     * @tc.name   atomicLongFetchAddTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_0500
     * @tc.desc   Verify AtomicLong.fetchAdd() with max boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAddTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong: AtomicLong = new AtomicLong(1);
      let oldValue: long = atomicLong.fetchAdd(9223372036854775806);
      expect(oldValue).assertEqual(1);
      expect(atomicLong.load()).assertEqual(9223372036854775807);
    })

    /**
     * @tc.name   atomicLongFetchAddTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_0600
     * @tc.desc   Verify AtomicLong.fetchAdd() with min boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAddTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong: AtomicLong = new AtomicLong(-1);
      let oldValue: long = atomicLong.fetchAdd(-9223372036854775807);
      expect(oldValue).assertEqual(-1);
      expect(atomicLong.load()).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.name   atomicLongFetchAddTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_0700
     * @tc.desc   Verify AtomicLong.fetchAdd() return value type is long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAddTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong: AtomicLong = new AtomicLong(16);
      let oldValue: long = atomicLong.fetchAdd(4);
      expect(typeof oldValue).assertEqual("long");
    })

    /**
     * @tc.name   atomicLongFetchAddTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_0800
     * @tc.desc   Verify AtomicLong.fetchAdd() calculates new value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAddTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong: AtomicLong = new AtomicLong(16);
      atomicLong.fetchAdd(4);
      expect(atomicLong.load()).assertEqual(20);
    })

    /**
     * @tc.name   atomicLongFetchAddTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_0900
     * @tc.desc   Verify AtomicLong.fetchAdd() concurrent operation with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongFetchAddTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong: AtomicLong = new AtomicLong(0);
      let task1 = async (): Promise<void> => {
        for (let i: number = 0; i < 100; i++) {
          atomicLong.fetchAdd(1);
        }
      };
      let task2 = async (): Promise<void> => {
        for (let i: number = 0; i < 100; i++) {
          atomicLong.fetchAdd(1);
        }
      };
      await Promise.all([task1(), task2()]);
      expect(atomicLong.load()).assertEqual(200);
    })

    /**
     * @tc.name   atomicLongFetchAddTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_1000
     * @tc.desc   Verify AtomicLong.fetchAdd() multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong: AtomicLong = new AtomicLong(0);
      let oldValue1: long = atomicLong.fetchAdd(1);
      expect(oldValue1).assertEqual(0);
      expect(atomicLong.load()).assertEqual(1);
      let oldValue2: long = atomicLong.fetchAdd(2);
      expect(oldValue2).assertEqual(1);
      expect(atomicLong.load()).assertEqual(3);
      let oldValue3: long = atomicLong.fetchAdd(3);
      expect(oldValue3).assertEqual(3);
      expect(atomicLong.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicLongFetchAddTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_1100
     * @tc.desc   Verify AtomicLong.fetchAdd() followed by immediate load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong: AtomicLong = new AtomicLong(16);
      atomicLong.fetchAdd(4);
      let result: long = atomicLong.load();
      expect(result).assertEqual(20);
    })

    /**
     * @tc.name   atomicLongFetchAddTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_1200
     * @tc.desc   Verify AtomicLong.fetchAdd() mixed with other operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong: AtomicLong = new AtomicLong(16);
      atomicLong.fetchAdd(4);
      expect(atomicLong.load()).assertEqual(20);
      atomicLong.store(30);
      atomicLong.fetchAdd(5);
      expect(atomicLong.load()).assertEqual(35);
    })

    /**
     * @tc.name   atomicLongFetchAddTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_1300
     * @tc.desc   Verify AtomicLong.fetchAdd() starting from negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong: AtomicLong = new AtomicLong(-10);
      let oldValue: long = atomicLong.fetchAdd(5);
      expect(oldValue).assertEqual(-10);
      expect(atomicLong.load()).assertEqual(-5);
    })

    /**
     * @tc.name   atomicLongFetchAddTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_1400
     * @tc.desc   Verify AtomicLong.fetchAdd() results in zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong: AtomicLong = new AtomicLong(-5);
      let oldValue: long = atomicLong.fetchAdd(5);
      expect(oldValue).assertEqual(-5);
      expect(atomicLong.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicLongFetchAddTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_1500
     * @tc.desc   Verify AtomicLong.fetchAdd() near max boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong: AtomicLong = new AtomicLong(9223372036854775800);
      let oldValue: long = atomicLong.fetchAdd(7);
      expect(oldValue).assertEqual(9223372036854775800);
      expect(atomicLong.load()).assertEqual(9223372036854775807);
    })

    /**
     * @tc.name   atomicLongFetchAddTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_1600
     * @tc.desc   Verify AtomicLong.fetchAdd() near min boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong: AtomicLong = new AtomicLong(-9223372036854775800);
      let oldValue: long = atomicLong.fetchAdd(-8);
      expect(oldValue).assertEqual(-9223372036854775800);
      expect(atomicLong.load()).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.name   atomicLongFetchAddTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_1700
     * @tc.desc   Verify AtomicLong.fetchAdd() starting from zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong: AtomicLong = new AtomicLong(0);
      let oldValue: long = atomicLong.fetchAdd(100);
      expect(oldValue).assertEqual(0);
      expect(atomicLong.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicLongFetchAddTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_1800
     * @tc.desc   Verify AtomicLong.fetchAdd() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAddTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong: AtomicLong = new AtomicLong(16);
      let start: number = Date.now();
      let oldValue: long = atomicLong.fetchAdd(4);
      let end: number = Date.now();
      let duration: number = end - start;
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(20);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicLongFetchAddTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_1900
     * @tc.desc   Verify AtomicLong.fetchAdd() multiple calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicLongFetchAddTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicLong: AtomicLong = new AtomicLong(0);
      let start: number = Date.now();
      for (let i: number = 0; i < 10000; i++) {
        atomicLong.fetchAdd(1);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicLong.load()).assertEqual(10000);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicLongFetchAddTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_2000
     * @tc.desc   Verify AtomicLong.fetchAdd() high concurrency performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongFetchAddTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong: AtomicLong = new AtomicLong(0);
      let start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        atomicLong.fetchAdd(1);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicLong.load()).assertEqual(100000);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicLongFetchAddTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_2100
     * @tc.desc   Verify AtomicLong.fetchAdd() for counter increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter: AtomicLong = new AtomicLong(0);
      counter.fetchAdd(1);
      expect(counter.load()).assertEqual(1);
      counter.fetchAdd(1);
      expect(counter.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicLongFetchAddTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_2200
     * @tc.desc   Verify AtomicLong.fetchAdd() for batch increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter: AtomicLong = new AtomicLong(0);
      counter.fetchAdd(100);
      expect(counter.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicLongFetchAddTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_2300
     * @tc.desc   Verify AtomicLong.fetchAdd() for accumulator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let accumulator: AtomicLong = new AtomicLong(0);
      accumulator.fetchAdd(1);
      accumulator.fetchAdd(2);
      accumulator.fetchAdd(3);
      accumulator.fetchAdd(4);
      accumulator.fetchAdd(5);
      expect(accumulator.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicLongFetchAddTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_2400
     * @tc.desc   Verify AtomicLong.fetchAdd() for large value accumulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let largeValue: AtomicLong = new AtomicLong(0);
      largeValue.fetchAdd(1000000000000);
      expect(largeValue.load()).assertEqual(1000000000000);
      largeValue.fetchAdd(2000000000000);
      expect(largeValue.load()).assertEqual(3000000000000);
    })

    /**
     * @tc.name   atomicLongFetchAddTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_2500
     * @tc.desc   Verify AtomicLong.fetchAdd() for timestamp accumulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let timestamp: AtomicLong = new AtomicLong(0);
      timestamp.fetchAdd(1000);
      expect(timestamp.load()).assertEqual(1000);
    })

    /**
     * @tc.name   atomicLongFetchAddTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_2600
     * @tc.desc   Verify AtomicLong.fetchAdd() with negative value for subtraction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter: AtomicLong = new AtomicLong(10);
      counter.fetchAdd(-3);
      expect(counter.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicLongFetchAddTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_2700
     * @tc.desc   Verify AtomicLong.fetchAdd() overflow behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong: AtomicLong = new AtomicLong(9223372036854775807);
      let oldValue: long = atomicLong.fetchAdd(1);
      expect(oldValue).assertEqual(9223372036854775807);
      expect(atomicLong.load()).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.name   atomicLongFetchAddTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHADD_TEST_2800
     * @tc.desc   Verify AtomicLong.fetchAdd() underflow behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAddTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong: AtomicLong = new AtomicLong(-9223372036854775808);
      let oldValue: long = atomicLong.fetchAdd(-1);
      expect(oldValue).assertEqual(-9223372036854775808);
      expect(atomicLong.load()).assertEqual(9223372036854775807);
    })
  })
}
