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

export default function atomicLongFetchSubTest(): void {
  describe('atomicLongFetchSubTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicLongFetchSubTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_0100
     * @tc.desc   Verify AtomicLong.fetchSub() with required parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchSubTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.fetchSub(6);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(10);
    })

    /**
     * @tc.name   atomicLongFetchSubTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_0200
     * @tc.desc   Verify AtomicLong.fetchSub() with positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchSubTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.fetchSub(3);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(13);
    })

    /**
     * @tc.name   atomicLongFetchSubTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_0300
     * @tc.desc   Verify AtomicLong.fetchSub() with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchSubTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.fetchSub(0);
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(16);
    })

    /**
     * @tc.name   atomicLongFetchSubTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_0400
     * @tc.desc   Verify AtomicLong.fetchSub() with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchSubTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(7);
      let oldValue = atomicLong.fetchSub(-3);
      expect(oldValue).assertEqual(7);
      expect(atomicLong.load()).assertEqual(10);
    })

    /**
     * @tc.name   atomicLongFetchSubTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_0500
     * @tc.desc   Verify AtomicLong.fetchSub() with max boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchSubTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(10);
      let oldValue = atomicLong.fetchSub(9223372036854775797);
      expect(oldValue).assertEqual(10);
      expect(atomicLong.load()).assertEqual(-9223372036854775787);
    })

    /**
     * @tc.name   atomicLongFetchSubTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_0600
     * @tc.desc   Verify AtomicLong.fetchSub() returns old value with different parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchSubTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(100);
      let oldValue = atomicLong.fetchSub(25);
      expect(oldValue).assertEqual(100);
      expect(atomicLong.load()).assertEqual(75);
    })

    /**
     * @tc.name   atomicLongFetchSubTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_0700
     * @tc.desc   Verify AtomicLong.fetchSub() return value type is long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchSubTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let oldValue = atomicLong.fetchSub(6);
      expect(typeof oldValue).assertEqual("long");
    })

    /**
     * @tc.name   atomicLongFetchSubTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_0800
     * @tc.desc   Verify AtomicLong.fetchSub() calculates new value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchSubTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.fetchSub(6);
      expect(atomicLong.load()).assertEqual(10);
    })

    /**
     * @tc.name   atomicLongFetchSubTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_0900
     * @tc.desc   Verify AtomicLong.fetchSub() with large number subtraction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchSubTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(3000000000000);
      let oldValue = atomicLong.fetchSub(1000000000000);
      expect(oldValue).assertEqual(3000000000000);
      expect(atomicLong.load()).assertEqual(2000000000000);
    })

    /**
     * @tc.name   atomicLongFetchSubTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_1000
     * @tc.desc   Verify AtomicLong.fetchSub() with larger negative value results in addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchSubTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(20);
      let oldValue = atomicLong.fetchSub(-10);
      expect(oldValue).assertEqual(20);
      expect(atomicLong.load()).assertEqual(30);
    })

    /**
     * @tc.name   atomicLongFetchSubTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_1100
     * @tc.desc   Verify AtomicLong.fetchSub() atomic operation with large numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchSubTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(1000);
      let oldValue = atomicLong.fetchSub(500);
      expect(oldValue).assertEqual(1000);
      expect(atomicLong.load()).assertEqual(500);
    })

    /**
     * @tc.name   atomicLongFetchSubTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_1200
     * @tc.desc   Verify AtomicLong.fetchSub() concurrent operation with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongFetchSubTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(100);
      let task1 = async (): Promise<void> => {
        for (let i = 0; i < 10; i++) {
          atomicLong.fetchSub(1);
        }
      };
      let task2 = async (): Promise<void> => {
        for (let i = 0; i < 10; i++) {
          atomicLong.fetchSub(1);
        }
      };
      await Promise.all([task1(), task2()]);
      expect(atomicLong.load()).assertEqual(80);
    })

    /**
     * @tc.name   atomicLongFetchSubTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_1300
     * @tc.desc   Verify AtomicLong.fetchSub() multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchSubTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(10);
      let oldValue1 = atomicLong.fetchSub(1);
      expect(oldValue1).assertEqual(10);
      expect(atomicLong.load()).assertEqual(9);
      let oldValue2 = atomicLong.fetchSub(2);
      expect(oldValue2).assertEqual(9);
      expect(atomicLong.load()).assertEqual(7);
      let oldValue3 = atomicLong.fetchSub(3);
      expect(oldValue3).assertEqual(7);
      expect(atomicLong.load()).assertEqual(4);
    })

    /**
     * @tc.name   atomicLongFetchSubTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_1400
     * @tc.desc   Verify AtomicLong.fetchSub() followed by immediate load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchSubTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.fetchSub(6);
      let result = atomicLong.load();
      expect(result).assertEqual(10);
    })

    /**
     * @tc.name   atomicLongFetchSubTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_1500
     * @tc.desc   Verify AtomicLong.fetchSub() mixed with other operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchSubTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(16);
      atomicLong.fetchSub(6);
      expect(atomicLong.load()).assertEqual(10);
      atomicLong.store(20);
      atomicLong.fetchSub(5);
      expect(atomicLong.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicLongFetchSubTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_1600
     * @tc.desc   Verify AtomicLong.fetchSub() starting from negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchSubTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(-10);
      let oldValue = atomicLong.fetchSub(5);
      expect(oldValue).assertEqual(-10);
      expect(atomicLong.load()).assertEqual(-15);
    })

    /**
     * @tc.name   atomicLongFetchSubTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_1700
     * @tc.desc   Verify AtomicLong.fetchSub() reduces to zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchSubTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(5);
      let oldValue = atomicLong.fetchSub(5);
      expect(oldValue).assertEqual(5);
      expect(atomicLong.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicLongFetchSubTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_1800
     * @tc.desc   Verify AtomicLong.fetchSub() reduces to negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchSubTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(3);
      let oldValue = atomicLong.fetchSub(5);
      expect(oldValue).assertEqual(3);
      expect(atomicLong.load()).assertEqual(-2);
    })

    /**
     * @tc.name   atomicLongFetchSubTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_1900
     * @tc.desc   Verify AtomicLong.fetchSub() with max boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchSubTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(9223372036854775807);
      let oldValue = atomicLong.fetchSub(7);
      expect(oldValue).assertEqual(9223372036854775807);
      expect(atomicLong.load()).assertEqual(9223372036854775800);
    })

    /**
     * @tc.name   atomicLongFetchSubTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_2000
     * @tc.desc   Verify AtomicLong.fetchSub() with min boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchSubTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(-9223372036854775800);
      let oldValue = atomicLong.fetchSub(8);
      expect(oldValue).assertEqual(-9223372036854775800);
      expect(atomicLong.load()).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.name   atomicLongFetchSubTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_2100
     * @tc.desc   Verify AtomicLong.fetchSub() starting from zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchSubTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let oldValue = atomicLong.fetchSub(10);
      expect(oldValue).assertEqual(0);
      expect(atomicLong.load()).assertEqual(-10);
    })

    /**
     * @tc.name   atomicLongFetchSubTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_2200
     * @tc.desc   Verify AtomicLong.fetchSub() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchSubTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(16);
      let start = Date.now();
      let oldValue = atomicLong.fetchSub(6);
      let end = Date.now();
      let duration = end - start;
      expect(oldValue).assertEqual(16);
      expect(atomicLong.load()).assertEqual(10);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicLongFetchSubTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_2300
     * @tc.desc   Verify AtomicLong.fetchSub() multiple calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicLongFetchSubTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicLong = new AtomicLong(1000);
      let start = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicLong.fetchSub(1);
      }
      let end = Date.now();
      let duration = end - start;
      expect(atomicLong.load()).assertEqual(-9000);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicLongFetchSubTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_2400
     * @tc.desc   Verify AtomicLong.fetchSub() high concurrency performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongFetchSubTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(100);
      let task1 = async (): Promise<void> => {
        for (let i = 0; i < 10; i++) {
          atomicLong.fetchSub(1);
        }
      };
      let task2 = async (): Promise<void> => {
        for (let i = 0; i < 10; i++) {
          atomicLong.fetchSub(1);
        }
      };
      let task3 = async (): Promise<void> => {
        for (let i = 0; i < 10; i++) {
          atomicLong.fetchSub(1);
        }
      };
      await Promise.all([task1(), task2(), task3()]);
      expect(atomicLong.load()).assertEqual(70);
    })

    /**
     * @tc.name   atomicLongFetchSubTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_2500
     * @tc.desc   Verify AtomicLong.fetchSub() compatibility with small numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchSubTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(5);
      let oldValue = atomicLong.fetchSub(2);
      expect(oldValue).assertEqual(5);
      expect(atomicLong.load()).assertEqual(3);
    })

    /**
     * @tc.name   atomicLongFetchSubTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_2600
     * @tc.desc   Verify AtomicLong.fetchSub() for counter decrement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchSubTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter = new AtomicLong(10);
      counter.fetchSub(1);
      expect(counter.load()).assertEqual(9);
      counter.fetchSub(1);
      expect(counter.load()).assertEqual(8);
    })

    /**
     * @tc.name   atomicLongFetchSubTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_2700
     * @tc.desc   Verify AtomicLong.fetchSub() for batch reduction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchSubTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter = new AtomicLong(100);
      counter.fetchSub(50);
      expect(counter.load()).assertEqual(50);
    })

    /**
     * @tc.name   atomicLongFetchSubTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_2800
     * @tc.desc   Verify AtomicLong.fetchSub() for resource counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchSubTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let resourceCount = new AtomicLong(10);
      resourceCount.fetchSub(1);
      expect(resourceCount.load()).assertEqual(9);
      resourceCount.fetchSub(5);
      expect(resourceCount.load()).assertEqual(4);
    })

    /**
     * @tc.name   atomicLongFetchSubTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_2900
     * @tc.desc   Verify AtomicLong.fetchSub() overflow behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchSubTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(-9223372036854775808);
      let oldValue = atomicLong.fetchSub(1);
      expect(oldValue).assertEqual(-9223372036854775808);
      expect(atomicLong.load()).assertEqual(9223372036854775807);
    })

    /**
     * @tc.name   atomicLongFetchSubTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHSUB_TEST_3000
     * @tc.desc   Verify AtomicLong.fetchSub() underflow behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchSubTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(9223372036854775807);
      let oldValue = atomicLong.fetchSub(-1);
      expect(oldValue).assertEqual(9223372036854775807);
      expect(atomicLong.load()).assertEqual(-9223372036854775808);
    })
  })
}
