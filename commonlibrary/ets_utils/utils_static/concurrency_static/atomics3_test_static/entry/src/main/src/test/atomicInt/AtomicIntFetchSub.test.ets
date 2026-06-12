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

export default function atomicIntFetchSubTest(): void {
  describe('atomicIntFetchSubTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicIntFetchSubTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_0100
     * @tc.desc   Verify AtomicInt.fetchSub() with positive value (3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchSubTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(10);
      let oldValue = atomicInt.fetchSub(3);
      expect(oldValue).assertEqual(10);
      expect(atomicInt.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicIntFetchSubTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_0200
     * @tc.desc   Verify AtomicInt.fetchSub() with zero value (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchSubTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(5);
      let oldValue = atomicInt.fetchSub(0);
      expect(oldValue).assertEqual(5);
      expect(atomicInt.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicIntFetchSubTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_0300
     * @tc.desc   Verify AtomicInt.fetchSub() with negative value (-3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchSubTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(7);
      let oldValue = atomicInt.fetchSub(-3);
      expect(oldValue).assertEqual(7);
      expect(atomicInt.load()).assertEqual(10);
    })

    /**
     * @tc.name   atomicIntFetchSubTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_0400
     * @tc.desc   Verify AtomicInt.fetchSub() with max boundary value (2147483640)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(10);
      let oldValue = atomicInt.fetchSub(2147483640);
      expect(oldValue).assertEqual(10);
      expect(atomicInt.load()).assertEqual(-2147483630);
    })

    /**
     * @tc.name   atomicIntFetchSubTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_0500
     * @tc.desc   Verify AtomicInt.fetchSub() with min boundary value (-2147483638)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(-10);
      let oldValue = atomicInt.fetchSub(-2147483638);
      expect(oldValue).assertEqual(-10);
      expect(atomicInt.load()).assertEqual(2147483628);
    })

    /**
     * @tc.name   atomicIntFetchSubTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_0600
     * @tc.desc   Verify AtomicInt.fetchSub() return value type is int
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchSubTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(10);
      let oldValue = atomicInt.fetchSub(3);
      expect(Number.isInteger(oldValue)).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchSubTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_0700
     * @tc.desc   Verify AtomicInt.fetchSub() calculates new value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchSubTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(10);
      let oldValue = atomicInt.fetchSub(5);
      expect(atomicInt.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicIntFetchSubTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_0800
     * @tc.desc   Verify AtomicInt.fetchSub() consecutive multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(10);
      let oldValue1 = atomicInt.fetchSub(1);
      expect(oldValue1).assertEqual(10);
      expect(atomicInt.load()).assertEqual(9);
      let oldValue2 = atomicInt.fetchSub(2);
      expect(oldValue2).assertEqual(9);
      expect(atomicInt.load()).assertEqual(7);
      let oldValue3 = atomicInt.fetchSub(3);
      expect(oldValue3).assertEqual(7);
      expect(atomicInt.load()).assertEqual(4);
    })

    /**
     * @tc.name   atomicIntFetchSubTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_0900
     * @tc.desc   Verify AtomicInt.fetchSub() followed by immediate load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchSubTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(10);
      atomicInt.fetchSub(3);
      let result = atomicInt.load();
      expect(result).assertEqual(7);
    })

    /**
     * @tc.name   atomicIntFetchSubTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_1000
     * @tc.desc   Verify AtomicInt.fetchSub() mixed with load, store, exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(10);
      atomicInt.fetchSub(3);
      expect(atomicInt.load()).assertEqual(7);
      atomicInt.store(20);
      atomicInt.fetchSub(5);
      expect(atomicInt.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicIntFetchSubTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_1100
     * @tc.desc   Verify AtomicInt.fetchSub() starting from negative value (-10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(-10);
      let oldValue = atomicInt.fetchSub(5);
      expect(oldValue).assertEqual(-10);
      expect(atomicInt.load()).assertEqual(-15);
    })

    /**
     * @tc.name   atomicIntFetchSubTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_1200
     * @tc.desc   Verify AtomicInt.fetchSub() subtract to zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(5);
      let oldValue = atomicInt.fetchSub(5);
      expect(oldValue).assertEqual(5);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchSubTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_1300
     * @tc.desc   Verify AtomicInt.fetchSub() subtract to negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(3);
      let oldValue = atomicInt.fetchSub(5);
      expect(oldValue).assertEqual(3);
      expect(atomicInt.load()).assertEqual(-2);
    })

    /**
     * @tc.name   atomicIntFetchSubTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_1400
     * @tc.desc   Verify AtomicInt.fetchSub() with near max boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchSubTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(2147483647);
      let oldValue = atomicInt.fetchSub(7);
      expect(oldValue).assertEqual(2147483647);
      expect(atomicInt.load()).assertEqual(2147483640);
    })

    /**
     * @tc.name   atomicIntFetchSubTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_1500
     * @tc.desc   Verify AtomicInt.fetchSub() with near min boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchSubTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(-2147483640);
      let oldValue = atomicInt.fetchSub(10);
      expect(oldValue).assertEqual(-2147483640);
      expect(atomicInt.load()).assertEqual(2147483646);
    })

    /**
     * @tc.name   atomicIntFetchSubTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_1600
     * @tc.desc   Verify AtomicInt.fetchSub() starting from zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchSubTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue = atomicInt.fetchSub(10);
      expect(oldValue).assertEqual(0);
      expect(atomicInt.load()).assertEqual(-10);
    })

    /**
     * @tc.name   atomicIntFetchSubTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_1700
     * @tc.desc   Verify AtomicInt.fetchSub() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchSubTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(10);
      let start: number = Date.now();
      let oldValue = atomicInt.fetchSub(3);
      let end: number = Date.now();
      let duration: number = end - start;
      expect(oldValue).assertEqual(10);
      expect(atomicInt.load()).assertEqual(7);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchSubTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_1800
     * @tc.desc   Verify AtomicInt.fetchSub() multiple calls performance (10000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntFetchSubTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicInt = new AtomicInt(10000);
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicInt.fetchSub(1);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicInt.load()).assertEqual(0);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchSubTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_1900
     * @tc.desc   Verify AtomicInt.fetchSub() concurrent access with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchSubTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(200);
      let results: int[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicInt.fetchSub(1));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicInt.fetchSub(1));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicInt.load()).assertEqual(0);
      expect(results.length).assertEqual(200);
    })

    /**
     * @tc.name   atomicIntFetchSubTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_2000
     * @tc.desc   Verify AtomicInt.fetchSub() high concurrency performance (100000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntFetchSubTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicInt = new AtomicInt(100000);
      let start: number = Date.now();
      for (let i = 0; i < 100000; i++) {
        atomicInt.fetchSub(1);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicInt.load()).assertEqual(0);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchSubTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_2100
     * @tc.desc   Verify AtomicInt.fetchSub() for counter decrement scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter = new AtomicInt(10);
      counter.fetchSub(1);
      expect(counter.load()).assertEqual(9);
      counter.fetchSub(1);
      expect(counter.load()).assertEqual(8);
    })

    /**
     * @tc.name   atomicIntFetchSubTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_2200
     * @tc.desc   Verify AtomicInt.fetchSub() for batch decrement scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter = new AtomicInt(100);
      counter.fetchSub(50);
      expect(counter.load()).assertEqual(50);
    })

    /**
     * @tc.name   atomicIntFetchSubTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_2300
     * @tc.desc   Verify AtomicInt.fetchSub() for resource count scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let resourceCount = new AtomicInt(10);
      resourceCount.fetchSub(1);
      expect(resourceCount.load()).assertEqual(9);
      resourceCount.fetchSub(5);
      expect(resourceCount.load()).assertEqual(4);
    })

    /**
     * @tc.name   atomicIntFetchSubTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_2400
     * @tc.desc   Verify AtomicInt.fetchSub() for addition using negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter = new AtomicInt(7);
      counter.fetchSub(-3);
      expect(counter.load()).assertEqual(10);
    })

    /**
     * @tc.name   atomicIntFetchSubTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_2500
     * @tc.desc   Verify AtomicInt.fetchSub() for countdown scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let countdown = new AtomicInt(10);
      while (countdown.load() > 0) {
        countdown.fetchSub(1);
      }
      expect(countdown.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchSubTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_2600
     * @tc.desc   Verify AtomicInt.fetchSub() for offset rollback scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let offset = new AtomicInt(100);
      offset.fetchSub(10);
      expect(offset.load()).assertEqual(90);
      offset.fetchSub(20);
      expect(offset.load()).assertEqual(70);
    })

    /**
     * @tc.name   atomicIntFetchSubTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_2700
     * @tc.desc   Verify AtomicInt.fetchSub() with overflow scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchSubTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(-2147483648);
      let oldValue = atomicInt.fetchSub(1);
      expect(oldValue).assertEqual(-2147483648);
    })

    /**
     * @tc.name   atomicIntFetchSubTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_2800
     * @tc.desc   Verify AtomicInt.fetchSub() with underflow scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchSubTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(2147483647);
      let oldValue = atomicInt.fetchSub(-1);
      expect(oldValue).assertEqual(2147483647);
    })

    /**
     * @tc.name   atomicIntFetchSubTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_2900
     * @tc.desc   Verify AtomicInt.fetchSub() atomicity with concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchSubTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(100);

      let task1 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicInt.fetchSub(1);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicInt.fetchSub(1);
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchSubTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_3000
     * @tc.desc   Verify AtomicInt.fetchSub() idempotency with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(35);
      let oldValue1 = atomicInt.fetchSub(10);
      expect(oldValue1).assertEqual(35);
      let oldValue2 = atomicInt.fetchSub(10);
      expect(oldValue2).assertEqual(25);
      let oldValue3 = atomicInt.fetchSub(10);
      expect(oldValue3).assertEqual(15);
      expect(atomicInt.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicIntFetchSubTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_3100
     * @tc.desc   Verify AtomicInt.fetchSub() with large positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1500000);
      let oldValue = atomicInt.fetchSub(500000);
      expect(oldValue).assertEqual(1500000);
      expect(atomicInt.load()).assertEqual(1000000);
    })

    /**
     * @tc.name   atomicIntFetchSubTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_3200
     * @tc.desc   Verify AtomicInt.fetchSub() with large negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(500000);
      let oldValue = atomicInt.fetchSub(-500000);
      expect(oldValue).assertEqual(500000);
      expect(atomicInt.load()).assertEqual(1000000);
    })

    /**
     * @tc.name   atomicIntFetchSubTest3300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_3300
     * @tc.desc   Verify AtomicInt.fetchSub() multiple instances independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt1 = new AtomicInt(15);
      let atomicInt2 = new AtomicInt(30);
      let atomicInt3 = new AtomicInt(45);

      atomicInt1.fetchSub(5);
      atomicInt2.fetchSub(10);
      atomicInt3.fetchSub(15);

      expect(atomicInt1.load()).assertEqual(10);
      expect(atomicInt2.load()).assertEqual(20);
      expect(atomicInt3.load()).assertEqual(30);
    })

    /**
     * @tc.name   atomicIntFetchSubTest3400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_3400
     * @tc.desc   Verify AtomicInt.fetchSub() with hexadecimal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(255);
      let oldValue = atomicInt.fetchSub(0xFF);
      expect(oldValue).assertEqual(255);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchSubTest3500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_3500
     * @tc.desc   Verify AtomicInt.fetchSub() with octal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(63);
      let oldValue = atomicInt.fetchSub(0o77);
      expect(oldValue).assertEqual(63);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchSubTest3600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_3600
     * @tc.desc   Verify AtomicInt.fetchSub() with binary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(10);
      let oldValue = atomicInt.fetchSub(0b1010);
      expect(oldValue).assertEqual(10);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchSubTest3700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_3700
     * @tc.desc   Verify AtomicInt.fetchSub() with large value (1000000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(1000000);
      let oldValue = atomicInt.fetchSub(1000000);
      expect(oldValue).assertEqual(1000000);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchSubTest3800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_3800
     * @tc.desc   Verify AtomicInt.fetchSub() concurrent read after operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchSubTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(200);
      let results: int[] = [];

      let task1 = async () => {
        atomicInt.fetchSub(100);
        for (let i = 0; i < 50; i++) {
          results.push(atomicInt.load());
        }
      };

      let task2 = async () => {
        atomicInt.fetchSub(100);
        for (let i = 0; i < 50; i++) {
          results.push(atomicInt.load());
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicInt.load()).assertEqual(0);
      expect(results.length).assertEqual(100);
    })

    /**
     * @tc.name   atomicIntFetchSubTest3900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_3900
     * @tc.desc   Verify AtomicInt.fetchSub() with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchSubTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(100);

      let task1 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchSub(1);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchSub(1);
        }
      };

      let task3 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchSub(1);
        }
      };

      let task4 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchSub(1);
        }
      };

      await Promise.all([task1(), task2(), task3(), task4()]);

      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchSubTest4000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_4000
     * @tc.desc   Verify AtomicInt.fetchSub() return value independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(25);
      let oldValue1 = atomicInt.fetchSub(5);
      let oldValue2 = atomicInt.fetchSub(5);
      let oldValue3 = atomicInt.fetchSub(5);

      expect(oldValue1).assertEqual(25);
      expect(oldValue2).assertEqual(20);
      expect(oldValue3).assertEqual(15);
      expect(atomicInt.load()).assertEqual(10);
    })

    /**
     * @tc.name   atomicIntFetchSubTest4100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHSUB_TEST_4100
     * @tc.desc   Verify AtomicInt.fetchSub() with alternating positive and negative values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchSubTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(100);

      atomicInt.fetchSub(50);
      expect(atomicInt.load()).assertEqual(50);

      atomicInt.fetchSub(-30);
      expect(atomicInt.load()).assertEqual(80);

      atomicInt.fetchSub(20);
      expect(atomicInt.load()).assertEqual(60);

      atomicInt.fetchSub(-40);
      expect(atomicInt.load()).assertEqual(100);
    })
  })
}
