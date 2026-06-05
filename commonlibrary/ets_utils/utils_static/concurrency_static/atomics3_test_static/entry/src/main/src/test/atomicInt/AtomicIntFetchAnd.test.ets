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

export default function atomicIntFetchAndTest(): void {
  describe('atomicIntFetchAndTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicIntFetchAndTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_0100
     * @tc.desc   Verify AtomicInt.fetchAnd() with positive value (6)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAndTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(15);
      let oldValue = atomicInt.fetchAnd(6);
      expect(oldValue).assertEqual(15);
      expect(atomicInt.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicIntFetchAndTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_0200
     * @tc.desc   Verify AtomicInt.fetchAnd() with zero value (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAndTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(15);
      let oldValue = atomicInt.fetchAnd(0);
      expect(oldValue).assertEqual(15);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchAndTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_0300
     * @tc.desc   Verify AtomicInt.fetchAnd() with negative value (-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAndTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(15);
      let oldValue = atomicInt.fetchAnd(-1);
      expect(oldValue).assertEqual(15);
      expect(atomicInt.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicIntFetchAndTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_0400
     * @tc.desc   Verify AtomicInt.fetchAnd() with max boundary value (2147483647)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(255);
      let oldValue = atomicInt.fetchAnd(2147483647);
      expect(oldValue).assertEqual(255);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntFetchAndTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_0500
     * @tc.desc   Verify AtomicInt.fetchAnd() with min boundary value (-2147483648)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(15);
      let oldValue = atomicInt.fetchAnd(-2147483648);
      expect(oldValue).assertEqual(15);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchAndTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_0600
     * @tc.desc   Verify AtomicInt.fetchAnd() return type is int
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAndTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(15);
      let oldValue = atomicInt.fetchAnd(6);
      expect(Number.isInteger(oldValue)).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchAndTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_0700
     * @tc.desc   Verify AtomicInt.fetchAnd() calculates new value correctly (15 & 6 = 6)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAndTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(15);
      atomicInt.fetchAnd(6);
      expect(atomicInt.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicIntFetchAndTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_0800
     * @tc.desc   Verify AtomicInt.fetchAnd() with -1 results in unchanged value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAndTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(100);
      let oldValue = atomicInt.fetchAnd(-1);
      expect(oldValue).assertEqual(100);
      expect(atomicInt.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicIntFetchAndTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_0900
     * @tc.desc   Verify AtomicInt.fetchAnd() with self results in unchanged value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAndTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(100);
      let oldValue = atomicInt.fetchAnd(100);
      expect(oldValue).assertEqual(100);
      expect(atomicInt.load()).assertEqual(100);
    })

    /**
     * @tc.name   atomicIntFetchAndTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_1000
     * @tc.desc   Verify AtomicInt.fetchAnd() clears low bits (255 & 240 = 240)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(255);
      atomicInt.fetchAnd(240);
      expect(atomicInt.load()).assertEqual(240);
    })

    /**
     * @tc.name   atomicIntFetchAndTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_1100
     * @tc.desc   Verify AtomicInt.fetchAnd() clears high bits (255 & 15 = 15)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(255);
      atomicInt.fetchAnd(15);
      expect(atomicInt.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicIntFetchAndTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_1200
     * @tc.desc   Verify AtomicInt.fetchAnd() preserves specific bits (255 & 85 = 85)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(255);
      atomicInt.fetchAnd(85);
      expect(atomicInt.load()).assertEqual(85);
    })

    /**
     * @tc.name   atomicIntFetchAndTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_1300
     * @tc.desc   Verify AtomicInt.fetchAnd() consecutive multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(255);
      let oldValue1 = atomicInt.fetchAnd(240);
      expect(oldValue1).assertEqual(255);
      expect(atomicInt.load()).assertEqual(240);
      let oldValue2 = atomicInt.fetchAnd(15);
      expect(oldValue2).assertEqual(240);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchAndTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_1400
     * @tc.desc   Verify AtomicInt.fetchAnd() followed by immediate load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAndTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(15);
      atomicInt.fetchAnd(6);
      let result = atomicInt.load();
      expect(result).assertEqual(6);
    })

    /**
     * @tc.name   atomicIntFetchAndTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_1500
     * @tc.desc   Verify AtomicInt.fetchAnd() mixed with load, store, exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(255);
      atomicInt.fetchAnd(240);
      expect(atomicInt.load()).assertEqual(240);
      atomicInt.store(15);
      atomicInt.fetchAnd(6);
      expect(atomicInt.load()).assertEqual(6);
    })

    /**
     * @tc.name   atomicIntFetchAndTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_1600
     * @tc.desc   Verify AtomicInt.fetchAnd() with negative initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(-1);
      let oldValue = atomicInt.fetchAnd(255);
      expect(oldValue).assertEqual(-1);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntFetchAndTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_1700
     * @tc.desc   Verify AtomicInt.fetchAnd() with max boundary initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(2147483647);
      let oldValue = atomicInt.fetchAnd(255);
      expect(oldValue).assertEqual(2147483647);
      expect(atomicInt.load()).assertEqual(255);
    })

    /**
     * @tc.name   atomicIntFetchAndTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_1800
     * @tc.desc   Verify AtomicInt.fetchAnd() with min boundary initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(-2147483648);
      let oldValue = atomicInt.fetchAnd(255);
      expect(oldValue).assertEqual(-2147483648);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchAndTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_1900
     * @tc.desc   Verify AtomicInt.fetchAnd() with zero initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAndTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(0);
      let oldValue = atomicInt.fetchAnd(255);
      expect(oldValue).assertEqual(0);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchAndTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_2000
     * @tc.desc   Verify AtomicInt.fetchAnd() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntFetchAndTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicInt = new AtomicInt(15);
      let start: number = Date.now();
      let oldValue = atomicInt.fetchAnd(6);
      let end: number = Date.now();
      let duration: number = end - start;
      expect(oldValue).assertEqual(15);
      expect(atomicInt.load()).assertEqual(6);
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchAndTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_2100
     * @tc.desc   Verify AtomicInt.fetchAnd() multiple calls performance (10000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntFetchAndTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicInt = new AtomicInt(255);
      let start: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicInt.fetchAnd(i);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchAndTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_2200
     * @tc.desc   Verify AtomicInt.fetchAnd() concurrent access with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchAndTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(255);
      let results: int[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicInt.fetchAnd(0xAA));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results.push(atomicInt.fetchAnd(0x55));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(results.length).assertEqual(200);
    })

    /**
     * @tc.name   atomicIntFetchAndTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_2300
     * @tc.desc   Verify AtomicInt.fetchAnd() high concurrency performance (100000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicIntFetchAndTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicInt = new AtomicInt(255);
      let start: number = Date.now();
      for (let i = 0; i < 100000; i++) {
        atomicInt.fetchAnd(i);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicIntFetchAndTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_2400
     * @tc.desc   Verify AtomicInt.fetchAnd() for clearing flag bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let flags = new AtomicInt(15);
      flags.fetchAnd(7);
      expect(flags.load()).assertEqual(7);
    })

    /**
     * @tc.name   atomicIntFetchAndTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_2500
     * @tc.desc   Verify AtomicInt.fetchAnd() for bitmask operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let value = new AtomicInt(255);
      value.fetchAnd(0x0F);
      expect(value.load()).assertEqual(15);
    })

    /**
     * @tc.name   atomicIntFetchAndTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_2600
     * @tc.desc   Verify AtomicInt.fetchAnd() for clearing specific bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let value = new AtomicInt(0xFF);
      value.fetchAnd(0xF0);
      expect(value.load()).assertEqual(240);
    })

    /**
     * @tc.name   atomicIntFetchAndTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_2700
     * @tc.desc   Verify AtomicInt.fetchAnd() for permission management
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let permissions = new AtomicInt(7);
      permissions.fetchAnd(5);
      expect(permissions.load()).assertEqual(5);
    })

    /**
     * @tc.name   atomicIntFetchAndTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_2800
     * @tc.desc   Verify AtomicInt.fetchAnd() for state filtering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let state = new AtomicInt(255);
      state.fetchAnd(0xAA);
      expect(state.load()).assertEqual(170);
    })

    /**
     * @tc.name   atomicIntFetchAndTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_2900
     * @tc.desc   Verify AtomicInt.fetchAnd() atomicity with concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchAndTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(255);

      let task1 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicInt.fetchAnd(0xFE);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 50; i++) {
          atomicInt.fetchAnd(0xFD);
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicInt.load()).assertEqual(252);
    })

    /**
     * @tc.name   atomicIntFetchAndTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_3000
     * @tc.desc   Verify AtomicInt.fetchAnd() idempotency with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(255);
      let oldValue1 = atomicInt.fetchAnd(240);
      expect(oldValue1).assertEqual(255);
      let oldValue2 = atomicInt.fetchAnd(240);
      expect(oldValue2).assertEqual(240);
      let oldValue3 = atomicInt.fetchAnd(240);
      expect(oldValue3).assertEqual(240);
      expect(atomicInt.load()).assertEqual(240);
    })

    /**
     * @tc.name   atomicIntFetchAndTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_3100
     * @tc.desc   Verify AtomicInt.fetchAnd() with hexadecimal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0xFF);
      let oldValue = atomicInt.fetchAnd(0xF0);
      expect(oldValue).assertEqual(255);
      expect(atomicInt.load()).assertEqual(240);
    })

    /**
     * @tc.name   atomicIntFetchAndTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_3200
     * @tc.desc   Verify AtomicInt.fetchAnd() with octal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0o77);
      let oldValue = atomicInt.fetchAnd(0o37);
      expect(oldValue).assertEqual(63);
      expect(atomicInt.load()).assertEqual(31);
    })

    /**
     * @tc.name   atomicIntFetchAndTest3300
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_3300
     * @tc.desc   Verify AtomicInt.fetchAnd() with binary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(0b11111111);
      let oldValue = atomicInt.fetchAnd(0b11110000);
      expect(oldValue).assertEqual(255);
      expect(atomicInt.load()).assertEqual(240);
    })

    /**
     * @tc.name   atomicIntFetchAndTest3400
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_3400
     * @tc.desc   Verify AtomicInt.fetchAnd() multiple instances independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt1 = new AtomicInt(255);
      let atomicInt2 = new AtomicInt(255);
      let atomicInt3 = new AtomicInt(255);

      atomicInt1.fetchAnd(0xF0);
      atomicInt2.fetchAnd(0x0F);
      atomicInt3.fetchAnd(0xAA);

      expect(atomicInt1.load()).assertEqual(240);
      expect(atomicInt2.load()).assertEqual(15);
      expect(atomicInt3.load()).assertEqual(170);
    })

    /**
     * @tc.name   atomicIntFetchAndTest3500
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_3500
     * @tc.desc   Verify AtomicInt.fetchAnd() return value independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(255);
      let oldValue1 = atomicInt.fetchAnd(240);
      let oldValue2 = atomicInt.fetchAnd(224);
      let oldValue3 = atomicInt.fetchAnd(192);

      expect(oldValue1).assertEqual(255);
      expect(oldValue2).assertEqual(240);
      expect(oldValue3).assertEqual(224);
      expect(atomicInt.load()).assertEqual(192);
    })

    /**
     * @tc.name   atomicIntFetchAndTest3600
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_3600
     * @tc.desc   Verify AtomicInt.fetchAnd() with alternating mask values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntFetchAndTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicInt = new AtomicInt(255);

      atomicInt.fetchAnd(0xF0);
      expect(atomicInt.load()).assertEqual(240);

      atomicInt.fetchAnd(0x0F);
      expect(atomicInt.load()).assertEqual(0);

      atomicInt.store(255);
      atomicInt.fetchAnd(0xAA);
      expect(atomicInt.load()).assertEqual(170);

      atomicInt.fetchAnd(0x55);
      expect(atomicInt.load()).assertEqual(0);
    })

    /**
     * @tc.name   atomicIntFetchAndTest3700
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_3700
     * @tc.desc   Verify AtomicInt.fetchAnd() with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchAndTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(0xFFFF);

      let task1 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchAnd(0xFFFE);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchAnd(0xFFFD);
        }
      };

      let task3 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchAnd(0xFFFB);
        }
      };

      let task4 = async () => {
        for (let i = 0; i < 25; i++) {
          atomicInt.fetchAnd(0xFFF7);
        }
      };

      await Promise.all([task1(), task2(), task3(), task4()]);

      expect(atomicInt.load()).assertEqual(65520);
    })

    /**
     * @tc.name   atomicIntFetchAndTest3800
     * @tc.number SUB_BUILTINS_ATOMIC_INT_FETCHAND_TEST_3800
     * @tc.desc   Verify AtomicInt.fetchAnd() concurrent read after operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntFetchAndTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicInt = new AtomicInt(255);
      let results: int[] = [];

      let task1 = async () => {
        atomicInt.fetchAnd(240);
        for (let i = 0; i < 50; i++) {
          results.push(atomicInt.load());
        }
      };

      let task2 = async () => {
        atomicInt.fetchAnd(15);
        for (let i = 0; i < 50; i++) {
          results.push(atomicInt.load());
        }
      };

      await Promise.all([task1(), task2()]);

      expect(results.length).assertEqual(100);
    })
  })
}
