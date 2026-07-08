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

export default function atomicShortFetchAndTest(): void {
  describe('atomicShortFetchAndTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicShortFetchAndTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_0100
     * @tc.desc   Verify AtomicShort.fetchAnd() with all required parameters present
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(7);
      const oldValue: number = atomicShort.fetchAnd(6);
      expect(oldValue).assertEqual(7);
      expect(atomicShort.load()).assertEqual(6);
    });

    /**
     * @tc.name   atomicShortFetchAndTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_0200
     * @tc.desc   Verify AtomicShort.fetchAnd() with normal short value (15)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(15);
      const oldValue: number = atomicShort.fetchAnd(10);
      expect(oldValue).assertEqual(15);
      expect(atomicShort.load()).assertEqual(10);
    });

    /**
     * @tc.name   atomicShortFetchAndTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_0300
     * @tc.desc   Verify AtomicShort.fetchAnd() with max boundary value (32767)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32767);
      const oldValue: number = atomicShort.fetchAnd(32767);
      expect(oldValue).assertEqual(32767);
      expect(atomicShort.load()).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortFetchAndTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_0400
     * @tc.desc   Verify AtomicShort.fetchAnd() with min boundary value (-32768)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32768);
      const oldValue: number = atomicShort.fetchAnd(-32768);
      expect(oldValue).assertEqual(-32768);
      expect(atomicShort.load()).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortFetchAndTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_0500
     * @tc.desc   Verify AtomicShort.fetchAnd() with hexadecimal value (0x0F)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x0F);
      const oldValue: number = atomicShort.fetchAnd(0x0A);
      expect(oldValue).assertEqual(15);
      expect(atomicShort.load()).assertEqual(10);
    });

    /**
     * @tc.name   atomicShortFetchAndTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_0600
     * @tc.desc   Verify AtomicShort.fetchAnd() with octal value (0o17)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0o17);
      const oldValue: number = atomicShort.fetchAnd(0o12);
      expect(oldValue).assertEqual(15);
      expect(atomicShort.load()).assertEqual(10);
    });

    /**
     * @tc.name   atomicShortFetchAndTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_0700
     * @tc.desc   Verify AtomicShort.fetchAnd() with binary value (0b1111)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0b1111);
      const oldValue: number = atomicShort.fetchAnd(0b1010);
      expect(oldValue).assertEqual(15);
      expect(atomicShort.load()).assertEqual(10);
    });

    /**
     * @tc.name   atomicShortFetchAndTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_0800
     * @tc.desc   Verify AtomicShort.fetchAnd() with negative numbers bitwise AND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-5);
      const oldValue: number = atomicShort.fetchAnd(-3);
      expect(oldValue).assertEqual(-5);
    });

    /**
     * @tc.name   atomicShortFetchAndTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_0900
     * @tc.desc   Verify AtomicShort.fetchAnd() with zero value returns old value and sets to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(7);
      const oldValue: number = atomicShort.fetchAnd(0);
      expect(oldValue).assertEqual(7);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortFetchAndTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_1000
     * @tc.desc   Verify AtomicShort.fetchAnd() result is 0 when no common bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(8);
      const oldValue: number = atomicShort.fetchAnd(7);
      expect(oldValue).assertEqual(8);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortFetchAndTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_1100
     * @tc.desc   Verify AtomicShort.fetchAnd() result equals one operand
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(15);
      const oldValue: number = atomicShort.fetchAnd(7);
      expect(oldValue).assertEqual(15);
      expect(atomicShort.load()).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortFetchAndTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_1200
     * @tc.desc   Verify AtomicShort.fetchAnd() with positive and negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(10);
      const oldValue: number = atomicShort.fetchAnd(-5);
      expect(oldValue).assertEqual(10);
    });

    /**
     * @tc.name   atomicShortFetchAndTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_1300
     * @tc.desc   Verify AtomicShort.fetchAnd() with full 1 mask (0xFFFF)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(100);
      const oldValue: number = atomicShort.fetchAnd(0xFFFF.toShort());
      expect(oldValue).assertEqual(100);
      expect(atomicShort.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicShortFetchAndTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_1400
     * @tc.desc   Verify AtomicShort.fetchAnd() with partial mask (0x0F)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0xFF.toShort());
      const oldValue: number = atomicShort.fetchAnd(0x0F.toShort());
      expect(oldValue).assertEqual(255);
      expect(atomicShort.load()).assertEqual(15);
    });

    /**
     * @tc.name   atomicShortFetchAndTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_1500
     * @tc.desc   Verify AtomicShort.fetchAnd() with different initial and operation values (20 & 12)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(20);
      const oldValue: number = atomicShort.fetchAnd(12);
      expect(oldValue).assertEqual(20);
      expect(atomicShort.load()).assertEqual(4);
    });

    /**
     * @tc.name   atomicShortFetchAndTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_1600
     * @tc.desc   Verify AtomicShort.fetchAnd() multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(15);
      const oldValue1: number = atomicShort.fetchAnd(10);
      expect(oldValue1).assertEqual(15);
      const oldValue2: number = atomicShort.fetchAnd(5);
      expect(oldValue2).assertEqual(10);
      const oldValue3: number = atomicShort.fetchAnd(7);
      expect(oldValue3).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortFetchAndTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_1700
     * @tc.desc   Verify AtomicShort.fetchAnd() returns zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const oldValue: number = atomicShort.fetchAnd(5);
      expect(oldValue).assertEqual(0);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortFetchAndTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_1800
     * @tc.desc   Verify AtomicShort.fetchAnd() returns negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-10);
      const oldValue: number = atomicShort.fetchAnd(15);
      expect(oldValue).assertEqual(-10);
    });

    /**
     * @tc.name   atomicShortFetchAndTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_1900
     * @tc.desc   Verify AtomicShort.fetchAnd() returns max value (32767)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32767);
      const oldValue: number = atomicShort.fetchAnd(0);
      expect(oldValue).assertEqual(32767);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortFetchAndTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_2000
     * @tc.desc   Verify AtomicShort.fetchAnd() returns min value (-32768)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32768);
      const oldValue: number = atomicShort.fetchAnd(0);
      expect(oldValue).assertEqual(-32768);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortFetchAndTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_2100
     * @tc.desc   Verify AtomicShort.fetchAnd() return value type is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(7);
      const oldValue: number = atomicShort.fetchAnd(6);
      expect(Number.isInteger(oldValue)).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchAndTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_2200
     * @tc.desc   Verify AtomicShort.fetchAnd() return value in short range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(7);
      const oldValue: number = atomicShort.fetchAnd(6);
      expect(oldValue >= -32768 && oldValue <= 32767).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchAndTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_2300
     * @tc.desc   Verify AtomicShort.fetchAnd() result unchanged when val contains all bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(7);
      const oldValue: number = atomicShort.fetchAnd(7);
      expect(oldValue).assertEqual(7);
      expect(atomicShort.load()).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortFetchAndTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_2400
     * @tc.desc   Verify AtomicShort.fetchAnd() result is 0 when no common bits (16 & 7)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(16);
      const oldValue: number = atomicShort.fetchAnd(7);
      expect(oldValue).assertEqual(16);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortFetchAndTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_2500
     * @tc.desc   Verify AtomicShort.fetchAnd() concurrent access with Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAndTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0xFFFF.toShort());
      const results1: number[] = [];
      const results2: number[] = [];

      const task1 = async () => {
        for (let i: number = 0; i < 100; i++) {
          results1.push(atomicShort.fetchAnd(0xFF00.toShort()));
        }
      };

      const task2 = async () => {
        for (let i: number = 0; i < 100; i++) {
          results2.push(atomicShort.fetchAnd(0x00FF.toShort()));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(results1.length).assertEqual(100);
      expect(results2.length).assertEqual(100);
    });

    /**
     * @tc.name   atomicShortFetchAndTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_2600
     * @tc.desc   Verify AtomicShort.isLockFree() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAndTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AtomicShort.isLockFree()).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchAndTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_2700
     * @tc.desc   Verify AtomicShort.fetchAnd() immediately after construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(15);
      const oldValue: number = atomicShort.fetchAnd(10);
      expect(oldValue).assertEqual(15);
    });

    /**
     * @tc.name   atomicShortFetchAndTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_2800
     * @tc.desc   Verify AtomicShort.fetchAnd() with multiple instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomic1: AtomicShort = new AtomicShort(15);
      const atomic2: AtomicShort = new AtomicShort(7);
      const oldValue1: number = atomic1.fetchAnd(10);
      const oldValue2: number = atomic2.fetchAnd(3);
      expect(oldValue1).assertEqual(15);
      expect(oldValue2).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortFetchAndTest4200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_4200
     * @tc.desc   Verify AtomicShort.fetchAnd() consecutive bitwise AND operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchAndTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0xFF);
      atomicShort.fetchAnd(0xF0);
      atomicShort.fetchAnd(0x0F);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortFetchAndTest4300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_4300
     * @tc.desc   Verify AtomicShort.fetchAnd() combined with other atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchAndTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(10);
      const oldValue1: number = atomicShort.fetchAnd(6);
      expect(oldValue1).assertEqual(10);
      const oldValue2: number = atomicShort.fetchAdd(2);
      expect(oldValue2).assertEqual(2);
      const oldValue3: number = atomicShort.fetchOr(8);
      expect(oldValue3).assertEqual(4);
    });

    /**
     * @tc.name   atomicShortFetchAndTest4400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_4400
     * @tc.desc   Verify AtomicShort.fetchAnd() with max and min values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchAndTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32767);
      const oldValue: number = atomicShort.fetchAnd(-32768);
      expect(oldValue).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortFetchAndTest4500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_4500
     * @tc.desc   Verify AtomicShort.fetchAnd() with special mask (0xFF00)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchAndTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x1234.toShort());
      atomicShort.fetchAnd(0xFF00.toShort());
      expect(atomicShort.load()).assertEqual(0x1200);
    });

    /**
     * @tc.name   atomicShortFetchAndTest4600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_4600
     * @tc.desc   Verify AtomicShort.fetchAnd() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchAndTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(15);
      const start: number = Date.now();
      atomicShort.fetchAnd(7);
      const end: number = Date.now();
      const duration: number = end - start;

      expect(atomicShort.load()).assertEqual(7);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchAndTest4700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_4700
     * @tc.desc   Verify AtomicShort.fetchAnd() multiple calls performance (1000000 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchAndTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0xFFFF.toShort());
      const start: number = Date.now();
      for (let i: number = 0; i < 1000000; i++) {
        atomicShort.fetchAnd(0xFF.toShort());
      }
      const end: number = Date.now();
      const duration: number = end - start;

      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchAndTest4800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_4800
     * @tc.desc   Verify AtomicShort.fetchAnd() platform compatibility with different values (25 & 9)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchAndTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(25);
      const oldValue: number = atomicShort.fetchAnd(9);
      expect(oldValue).assertEqual(25);
      expect(atomicShort.load()).assertEqual(9);
    });

    /**
     * @tc.name   atomicShortFetchAndTest4900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_4900
     * @tc.desc   Verify AtomicShort.fetchAnd() byte order handling with different mask (0x00FF)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchAndTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x1234.toShort());
      atomicShort.fetchAnd(0x00FF.toShort());
      expect(atomicShort.load()).assertEqual(0x0034);
    });

    /**
     * @tc.name   atomicShortFetchAndTest5000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_5000
     * @tc.desc   Verify AtomicShort.fetchAnd() for clearing specific bit flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAndTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flags: AtomicShort = new AtomicShort(0xFF);
      flags.fetchAnd(0xFE);
      expect(flags.load()).assertEqual(0xFE);
      flags.fetchAnd(0xFD);
      expect(flags.load()).assertEqual(0xFC);
    });

    /**
     * @tc.name   atomicShortFetchAndTest5100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_5100
     * @tc.desc   Verify AtomicShort.fetchAnd() for preserving specific bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAndTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const value: AtomicShort = new AtomicShort(0xABCD.toShort());
      value.fetchAnd(0xFF00.toShort());
      expect(value.load()).assertEqual(-21760);
    });

    /**
     * @tc.name   atomicShortFetchAndTest5200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_5200
     * @tc.desc   Verify AtomicShort.fetchAnd() for permission clearing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAndTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: AtomicShort = new AtomicShort(0x1F);
      permissions.fetchAnd(0x0F);
      expect(permissions.load()).assertEqual(0x0F);
    });

    /**
     * @tc.name   atomicShortFetchAndTest5300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_5300
     * @tc.desc   Verify AtomicShort.fetchAnd() for permission checking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAndTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const userMask: AtomicShort = new AtomicShort(0x1F.toShort());
      const required: number = 0x07;
      const oldValue: number = userMask.fetchAnd(required.toShort());
      expect((oldValue & required) === required).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchAndTest5400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_5400
     * @tc.desc   Verify AtomicShort.fetchAnd() for data mask operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAndTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const data: AtomicShort = new AtomicShort(0xAAAA.toShort());
      data.fetchAnd(0x00FF.toShort());
      expect(data.load()).assertEqual(0x00AA);
    });

    /**
     * @tc.name   atomicShortFetchAndTest5500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHAND_TEST_5500
     * @tc.desc   Verify AtomicShort.fetchAnd() for network protocol flag handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchAndTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const packetFlags: AtomicShort = new AtomicShort(0xFFFF.toShort());
      packetFlags.fetchAnd(0x7FFF.toShort());
      expect(packetFlags.load()).assertEqual(0x7FFF);
    });
  })
}
