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

export default function atomicLongFetchAndTest(): void {
  describe('atomicLongFetchAndTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicLongFetchAndTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_0100
     * @tc.desc   Verify AtomicLong.fetchAnd() with required parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAndTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(10);
      let oldValue = atomicLong.fetchAnd(7);
      expect(oldValue).assertEqual(10);
      expect(atomicLong.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicLongFetchAndTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_0200
     * @tc.desc   Verify AtomicLong.fetchAnd() with positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAndTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(10);
      let oldValue = atomicLong.fetchAnd(7);
      expect(oldValue).assertEqual(10);
      expect(atomicLong.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicLongFetchAndTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_0300
     * @tc.desc   Verify AtomicLong.fetchAnd() with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAndTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(10);
      let oldValue = atomicLong.fetchAnd(0);
      expect(oldValue).assertEqual(10);
      expect(atomicLong.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicLongFetchAndTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_0400
     * @tc.desc   Verify AtomicLong.fetchAnd() with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAndTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(10);
      let oldValue = atomicLong.fetchAnd(-1);
      expect(oldValue).assertEqual(10);
      expect(atomicLong.load()).assertEqual(10);
    })

    /**
     * @tc.name   atomicLongFetchAndTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_0500
     * @tc.desc   Verify AtomicLong.fetchAnd() with max boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAndTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(255);
      let oldValue = atomicLong.fetchAnd(9223372036854775807);
      expect(oldValue).assertEqual(255);
      expect(atomicLong.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicLongFetchAndTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_0600
     * @tc.desc   Verify AtomicLong.fetchAnd() with min boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAndTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(255);
      let oldValue = atomicLong.fetchAnd(-9223372036854775808);
      expect(oldValue).assertEqual(255);
    })

    /**
     * @tc.name   atomicLongFetchAndTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_0700
     * @tc.desc   Verify AtomicLong.fetchAnd() returns old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAndTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(10);
      let oldValue = atomicLong.fetchAnd(7);
      expect(oldValue).assertEqual(10);
      expect(atomicLong.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicLongFetchAndTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_0800
     * @tc.desc   Verify AtomicLong.fetchAnd() return value type is long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAndTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(10);
      let oldValue = atomicLong.fetchAnd(7);
      expect(typeof oldValue).assertEqual("long");
    })

    /**
     * @tc.name   atomicLongFetchAndTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_0900
     * @tc.desc   Verify AtomicLong.fetchAnd() calculates new value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAndTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(10);
      atomicLong.fetchAnd(7);
      expect(atomicLong.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicLongFetchAndTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_1000
     * @tc.desc   Verify AtomicLong.fetchAnd() with 0 results in 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAndTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(255);
      let oldValue = atomicLong.fetchAnd(0);
      expect(oldValue).assertEqual(255);
      expect(atomicLong.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicLongFetchAndTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_1100
     * @tc.desc   Verify AtomicLong.fetchAnd() with -1 keeps value unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAndTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(100);
      let oldValue = atomicLong.fetchAnd(-1);
      expect(oldValue).assertEqual(100);
      expect(atomicLong.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicLongFetchAndTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_1200
     * @tc.desc   Verify AtomicLong.fetchAnd() with self keeps value unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAndTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(100);
      let oldValue = atomicLong.fetchAnd(100);
      expect(oldValue).assertEqual(100);
      expect(atomicLong.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicLongFetchAndTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_1300
     * @tc.desc   Verify AtomicLong.fetchAnd() atomic operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAndTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(10);
      let oldValue = atomicLong.fetchAnd(7);
      expect(oldValue).assertEqual(10);
      expect(atomicLong.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicLongFetchAndTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_1400
     * @tc.desc   Verify AtomicLong.fetchAnd() concurrent operation with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongFetchAndTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(255);
      let task1 = async (): Promise<void> => {
        for (let i = 0; i < 100; i++) {
          atomicLong.fetchAnd(255);
        }
      };
      let task2 = async (): Promise<void> => {
        for (let i = 0; i < 100; i++) {
          atomicLong.fetchAnd(255);
        }
      };
      await Promise.all([task1(), task2()]);
      expect(atomicLong.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicLongFetchAndTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_1500
     * @tc.desc   Verify AtomicLong.fetchAnd() clears low bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(255);
      atomicLong.fetchAnd(240);
      expect(atomicLong.load()).assertEqual(240);
    })

    /**
     * @tc.name   atomicLongFetchAndTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_1600
     * @tc.desc   Verify AtomicLong.fetchAnd() clears high bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(255);
      atomicLong.fetchAnd(15);
      expect(atomicLong.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicLongFetchAndTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_1700
     * @tc.desc   Verify AtomicLong.fetchAnd() keeps specific bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(255);
      atomicLong.fetchAnd(85);
      expect(atomicLong.load()).assertEqual(85);
    })

    /**
     * @tc.name   atomicLongFetchAndTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_1800
     * @tc.desc   Verify AtomicLong.fetchAnd() multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(255);
      let oldValue1 = atomicLong.fetchAnd(240);
      expect(oldValue1).assertEqual(255);
      expect(atomicLong.load()).assertEqual(240);
      let oldValue2 = atomicLong.fetchAnd(15);
      expect(oldValue2).assertEqual(240);
      expect(atomicLong.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicLongFetchAndTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_1900
     * @tc.desc   Verify AtomicLong.fetchAnd() followed by immediate load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(10);
      atomicLong.fetchAnd(7);
      let result = atomicLong.load();
      expect(result).assertEqual(2);
    })

    /**
     * @tc.name   atomicLongFetchAndTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_2000
     * @tc.desc   Verify AtomicLong.fetchAnd() mixed with other operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(10);
      atomicLong.fetchAnd(7);
      expect(atomicLong.load()).assertEqual(2);
      atomicLong.store(15);
      atomicLong.fetchAnd(6);
      expect(atomicLong.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicLongFetchAndTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_2100
     * @tc.desc   Verify AtomicLong.fetchAnd() with negative number bitwise AND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(-1);
      let oldValue = atomicLong.fetchAnd(255);
      expect(oldValue).assertEqual(-1);
      expect(atomicLong.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicLongFetchAndTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_2200
     * @tc.desc   Verify AtomicLong.fetchAnd() with max boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(9223372036854775807);
      let oldValue = atomicLong.fetchAnd(255);
      expect(oldValue).assertEqual(9223372036854775807);
      expect(atomicLong.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicLongFetchAndTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_2300
     * @tc.desc   Verify AtomicLong.fetchAnd() with min boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(-9223372036854775808);
      let oldValue = atomicLong.fetchAnd(255);
      expect(oldValue).assertEqual(-9223372036854775808);
    })

    /**
     * @tc.name   atomicLongFetchAndTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_2400
     * @tc.desc   Verify AtomicLong.fetchAnd() starting from zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(0);
      let oldValue = atomicLong.fetchAnd(255);
      expect(oldValue).assertEqual(0);
      expect(atomicLong.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicLongFetchAndTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_2500
     * @tc.desc   Verify AtomicLong.fetchAnd() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongFetchAndTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicLong = new AtomicLong(10);
      let start = Date.now();
      let oldValue = atomicLong.fetchAnd(7);
      let end = Date.now();
      let duration = end - start;
      expect(oldValue).assertEqual(10);
      expect(atomicLong.load()).assertEqual(2);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicLongFetchAndTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_2600
     * @tc.desc   Verify AtomicLong.fetchAnd() multiple calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicLongFetchAndTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicLong = new AtomicLong(255);
      let start = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicLong.fetchAnd(255);
      }
      let end = Date.now();
      let duration = end - start;
      expect(atomicLong.load()).assertEqual(255);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicLongFetchAndTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_2700
     * @tc.desc   Verify AtomicLong.fetchAnd() high concurrency performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongFetchAndTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicLong = new AtomicLong(255);
      let start = Date.now();
      for (let i = 0; i < 100000; i++) {
        atomicLong.fetchAnd(255);
      }
      let end = Date.now();
      let duration = end - start;
      expect(atomicLong.load()).assertEqual(255);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicLongFetchAndTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_2800
     * @tc.desc   Verify AtomicLong.fetchAnd() compatibility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicLong = new AtomicLong(10);
      let oldValue = atomicLong.fetchAnd(7);
      expect(oldValue).assertEqual(10);
      expect(atomicLong.load()).assertEqual(2);
    })

    /**
     * @tc.name   atomicLongFetchAndTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_2900
     * @tc.desc   Verify AtomicLong.fetchAnd() for clearing flag bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let flags = new AtomicLong(15);
      flags.fetchAnd(7);
      expect(flags.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicLongFetchAndTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_3000
     * @tc.desc   Verify AtomicLong.fetchAnd() for bitmask operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let value = new AtomicLong(255);
      value.fetchAnd(0x0F);
      expect(value.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicLongFetchAndTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_3100
     * @tc.desc   Verify AtomicLong.fetchAnd() for clearing specific bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let value = new AtomicLong(0xFF);
      value.fetchAnd(0xF0);
      expect(value.load()).assertEqual(240);
    })

    /**
     * @tc.name   atomicLongFetchAndTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_3200
     * @tc.desc   Verify AtomicLong.fetchAnd() for permission management
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let permissions = new AtomicLong(7);
      permissions.fetchAnd(5);
      expect(permissions.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicLongFetchAndTest3300
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_FETCHAND_TEST_3300
     * @tc.desc   Verify AtomicLong.fetchAnd() for large value bitmask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongFetchAndTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let largeValue = new AtomicLong(-1);
      largeValue.fetchAnd(4294967295);
      expect(largeValue.load()).assertEqual(4294967295);
    })
  })
}
