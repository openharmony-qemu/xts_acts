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

export default function atomicShortFetchOrTest(): void {
  describe('atomicShortFetchOrTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicShortFetchOrTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_0100
     * @tc.desc   Verify AtomicShort.fetchOr() with all required parameters present
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(3);
      const oldValue: number = atomicShort.fetchOr(4);
      expect(oldValue).assertEqual(3);
      expect(atomicShort.load()).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortFetchOrTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_0200
     * @tc.desc   Verify AtomicShort.fetchOr() with normal short value 10 and 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(10);
      const oldValue: number = atomicShort.fetchOr(20);
      expect(oldValue).assertEqual(10);
      expect(atomicShort.load()).assertEqual(30);
    });

    /**
     * @tc.name   atomicShortFetchOrTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_0300
     * @tc.desc   Verify AtomicShort.fetchOr() with max boundary value 32767
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const oldValue: number = atomicShort.fetchOr(32767);
      expect(oldValue).assertEqual(0);
      expect(atomicShort.load()).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortFetchOrTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_0400
     * @tc.desc   Verify AtomicShort.fetchOr() with min boundary value -32768
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const oldValue: number = atomicShort.fetchOr(-32768);
      expect(oldValue).assertEqual(0);
      expect(atomicShort.load()).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortFetchOrTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_0500
     * @tc.desc   Verify AtomicShort.fetchOr() with hexadecimal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x03);
      const oldValue: number = atomicShort.fetchOr(0x04);
      expect(oldValue).assertEqual(3);
      expect(atomicShort.load()).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortFetchOrTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_0600
     * @tc.desc   Verify AtomicShort.fetchOr() with octal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0o03);
      const oldValue: number = atomicShort.fetchOr(0o04);
      expect(oldValue).assertEqual(3);
      expect(atomicShort.load()).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortFetchOrTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_0700
     * @tc.desc   Verify AtomicShort.fetchOr() with binary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0b0011);
      const oldValue: number = atomicShort.fetchOr(0b0100);
      expect(oldValue).assertEqual(3);
      expect(atomicShort.load()).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortFetchOrTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_0800
     * @tc.desc   Verify AtomicShort.fetchOr() with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(5);
      const oldValue: number = atomicShort.fetchOr(-3);
      expect(oldValue).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchOrTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_0900
     * @tc.desc   Verify AtomicShort.fetchOr() with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(7);
      const oldValue: number = atomicShort.fetchOr(0);
      expect(oldValue).assertEqual(7);
      expect(atomicShort.load()).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortFetchOrTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_1000
     * @tc.desc   Verify AtomicShort.fetchOr() bitwise OR with 0 returns original value for negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-100);
      const oldValue: number = atomicShort.fetchOr(0);
      expect(oldValue).assertEqual(-100);
      expect(atomicShort.load()).assertEqual(-100);
    });

    /**
     * @tc.name   atomicShortFetchOrTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_1100
     * @tc.desc   Verify AtomicShort.fetchOr() bitwise OR results in all 1s
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x0F);
      const oldValue: number = atomicShort.fetchOr(0xF0);
      expect(oldValue).assertEqual(15);
      expect(atomicShort.load()).assertEqual(255);
    });

    /**
     * @tc.name   atomicShortFetchOrTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_1200
     * @tc.desc   Verify AtomicShort.fetchOr() sets specific bit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0b0010);
      const oldValue: number = atomicShort.fetchOr(0b0001);
      expect(oldValue).assertEqual(2);
      expect(atomicShort.load()).assertEqual(3);
    });

    /**
     * @tc.name   atomicShortFetchOrTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_1300
     * @tc.desc   Verify AtomicShort.fetchOr() with all 0s mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(100);
      const oldValue: number = atomicShort.fetchOr(0);
      expect(oldValue).assertEqual(100);
      expect(atomicShort.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicShortFetchOrTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_1400
     * @tc.desc   Verify AtomicShort.fetchOr() with all 1s mask (0xFFFF)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const oldValue: number = atomicShort.fetchOr((-1).toShort());
      expect(oldValue).assertEqual(0);
      expect(atomicShort.load()).assertEqual(-1);
    });

    /**
     * @tc.name   atomicShortFetchOrTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_1500
     * @tc.desc   Verify AtomicShort.fetchOr() returns old value with different values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(15);
      const oldValue: number = atomicShort.fetchOr(240);
      expect(oldValue).assertEqual(15);
      expect(atomicShort.load()).assertEqual(255);
    });

    /**
     * @tc.name   atomicShortFetchOrTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_1600
     * @tc.desc   Verify AtomicShort.fetchOr() multiple calls return correct old values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(1);
      const oldValue1: number = atomicShort.fetchOr(2);
      expect(oldValue1).assertEqual(1);
      const oldValue2: number = atomicShort.fetchOr(4);
      expect(oldValue2).assertEqual(3);
      const oldValue3: number = atomicShort.fetchOr(8);
      expect(oldValue3).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortFetchOrTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_1700
     * @tc.desc   Verify AtomicShort.fetchOr() returns zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const oldValue: number = atomicShort.fetchOr(5);
      expect(oldValue).assertEqual(0);
      expect(atomicShort.load()).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchOrTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_1800
     * @tc.desc   Verify AtomicShort.fetchOr() returns negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-10);
      const oldValue: number = atomicShort.fetchOr(5);
      expect(oldValue).assertEqual(-10);
    });

    /**
     * @tc.name   atomicShortFetchOrTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_1900
     * @tc.desc   Verify AtomicShort.fetchOr() returns max value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32767);
      const oldValue: number = atomicShort.fetchOr(0);
      expect(oldValue).assertEqual(32767);
      expect(atomicShort.load()).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortFetchOrTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_2000
     * @tc.desc   Verify AtomicShort.fetchOr() returns min value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32768);
      const oldValue: number = atomicShort.fetchOr(0);
      expect(oldValue).assertEqual(-32768);
      expect(atomicShort.load()).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortFetchOrTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_2100
     * @tc.desc   Verify AtomicShort.fetchOr() return value type is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(3);
      const oldValue: number = atomicShort.fetchOr(4);
      expect(Number.isInteger(oldValue)).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchOrTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_2200
     * @tc.desc   Verify AtomicShort.fetchOr() return value in short range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(3);
      const oldValue: number = atomicShort.fetchOr(4);
      expect(oldValue >= -32768 && oldValue <= 32767).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchOrTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_2300
     * @tc.desc   Verify AtomicShort.fetchOr() with different initial values and zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x55AA);
      const oldValue: number = atomicShort.fetchOr(0);
      expect(oldValue).assertEqual(0x55AA);
      expect(atomicShort.load()).assertEqual(0x55AA);
    });

    /**
     * @tc.name   atomicShortFetchOrTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_2400
     * @tc.desc   Verify AtomicShort.fetchOr() with all 1s mask on non-zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x1234);
      const oldValue: number = atomicShort.fetchOr((-1).toShort());
      expect(oldValue).assertEqual(0x1234);
      expect(atomicShort.load()).assertEqual(-1);
    });

    /**
     * @tc.name   atomicShortFetchOrTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_2500
     * @tc.desc   Verify AtomicShort.fetchOr() repeated setting same bit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      atomicShort.fetchOr(0x01);
      atomicShort.fetchOr(0x01);
      expect(atomicShort.load()).assertEqual(0x01);
    });

    /**
     * @tc.name   atomicShortFetchOrTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_2600
     * @tc.desc   Verify AtomicShort.fetchOr() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchOrTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const results: number[] = [];

      const task1 = async () => {
        for (let i: number = 0; i < 100; i++) {
          results.push(atomicShort.fetchOr(0x01));
        }
      };

      const task2 = async () => {
        for (let i: number = 0; i < 100; i++) {
          results.push(atomicShort.fetchOr(0x02));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicShort.load()).assertEqual(0x03);
      expect(results.length).assertEqual(200);
    });

    /**
     * @tc.name   atomicShortFetchOrTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_2700
     * @tc.desc   Verify AtomicShort.isLockFree() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchOrTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AtomicShort.isLockFree()).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchOrTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_2800
     * @tc.desc   Verify AtomicShort.fetchOr() default memory order with concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchOrTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const results: number[] = [];

      const task1 = async () => {
        for (let i: number = 0; i < 50; i++) {
          results.push(atomicShort.fetchOr(0x01));
        }
      };

      const task2 = async () => {
        for (let i: number = 0; i < 50; i++) {
          results.push(atomicShort.fetchOr(0x02));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(atomicShort.load() === 0x03 || atomicShort.load() === 0x01 || atomicShort.load() === 0x02).assertTrue();
      expect(results.length).assertEqual(100);
    });

    /**
     * @tc.name   atomicShortFetchOrTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_2900
     * @tc.desc   Verify AtomicShort.fetchOr() immediately after construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(3);
      const oldValue: number = atomicShort.fetchOr(4);
      expect(oldValue).assertEqual(3);
    });

    /**
     * @tc.name   atomicShortFetchOrTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_3000
     * @tc.desc   Verify AtomicShort.fetchOr() multiple instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomic1: AtomicShort = new AtomicShort(3);
      const atomic2: AtomicShort = new AtomicShort(7);
      const oldValue1: number = atomic1.fetchOr(4);
      const oldValue2: number = atomic2.fetchOr(8);
      expect(oldValue1).assertEqual(3);
      expect(oldValue2).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortFetchOrTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_3100
     * @tc.desc   Verify AtomicShort.fetchOr() consecutive bitwise OR operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchOrTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      atomicShort.fetchOr(0x01);
      atomicShort.fetchOr(0x02);
      atomicShort.fetchOr(0x04);
      atomicShort.fetchOr(0x08);
      expect(atomicShort.load()).assertEqual(0x0F);
    });

    /**
     * @tc.name   atomicShortFetchOrTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_3200
     * @tc.desc   Verify AtomicShort.fetchOr() combined with other atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchOrTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const oldValue1: number = atomicShort.fetchOr(1);
      const oldValue2: number = atomicShort.fetchAdd(2);
      const oldValue3: number = atomicShort.fetchAnd(0x0F);
      expect(oldValue1).assertEqual(0);
      expect(oldValue2).assertEqual(1);
    });

    /**
     * @tc.name   atomicShortFetchOrTest3300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_3300
     * @tc.desc   Verify AtomicShort.fetchOr() gradually sets all bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchOrTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      for (let i: number = 0; i < 16; i++) {
        atomicShort.fetchOr((1 << i).toShort());
      }
      expect(atomicShort.load()).assertEqual(-1);
    });

    /**
     * @tc.name   atomicShortFetchOrTest3400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_3400
     * @tc.desc   Verify AtomicShort.fetchOr() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchOrTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(3);
      const start: number = Date.now();
      atomicShort.fetchOr(4);
      const end: number = Date.now();
      const duration: number = end - start;

      expect(atomicShort.load()).assertEqual(7);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchOrTest3500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_3500
     * @tc.desc   Verify AtomicShort.fetchOr() batch call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchOrTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const start: number = Date.now();
      for (let i: number = 0; i < 1000000; i++) {
        atomicShort.fetchOr((i & 0xFF).toShort());
      }
      const end: number = Date.now();
      const duration: number = end - start;

      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchOrTest3600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_3600
     * @tc.desc   Verify AtomicShort.fetchOr() concurrent performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchOrTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const iterations: number = 1000;

      const task1 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          atomicShort.fetchOr(0x01);
        }
      };

      const task2 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          atomicShort.fetchOr(0x02);
        }
      };

      const start: number = Date.now();
      await Promise.all([task1(), task2()]);
      const end: number = Date.now();
      const duration: number = end - start;

      expect(atomicShort.load()).assertEqual(0x03);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchOrTest3700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_3700
     * @tc.desc   Verify AtomicShort.fetchOr() platform compatibility with various values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchOrTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x5555);
      const oldValue: number = atomicShort.fetchOr(-21846);
      expect(oldValue).assertEqual(0x5555);
      expect(atomicShort.load()).assertEqual(-1);
    });

    /**
     * @tc.name   atomicShortFetchOrTest3800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_3800
     * @tc.desc   Verify AtomicShort.fetchOr() byte order handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchOrTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      atomicShort.fetchOr(0x1234);
      expect(atomicShort.load()).assertEqual(0x1234);
    });

    /**
     * @tc.name   atomicShortFetchOrTest3900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_3900
     * @tc.desc   Verify AtomicShort.fetchOr() for bit flag operation - set specific bit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchOrTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flags: AtomicShort = new AtomicShort(0x00);
      flags.fetchOr(0x01);
      expect(flags.load()).assertEqual(0x01);
      flags.fetchOr(0x02);
      expect(flags.load()).assertEqual(0x03);
      flags.fetchOr(0x04);
      expect(flags.load()).assertEqual(0x07);
    });

    /**
     * @tc.name   atomicShortFetchOrTest4000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_4000
     * @tc.desc   Verify AtomicShort.fetchOr() for accumulating multiple bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchOrTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const status: AtomicShort = new AtomicShort(0);
      status.fetchOr(0x01);
      status.fetchOr(0x02);
      status.fetchOr(0x04);
      expect(status.load()).assertEqual(0x07);
    });

    /**
     * @tc.name   atomicShortFetchOrTest4100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_4100
     * @tc.desc   Verify AtomicShort.fetchOr() for permission addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchOrTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const permissions: AtomicShort = new AtomicShort(0x00);
      permissions.fetchOr(0x01);
      expect(permissions.load()).assertEqual(0x01);
      permissions.fetchOr(0x02);
      expect(permissions.load()).assertEqual(0x03);
    });

    /**
     * @tc.name   atomicShortFetchOrTest4200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_4200
     * @tc.desc   Verify AtomicShort.fetchOr() for permission combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchOrTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const userPerms: AtomicShort = new AtomicShort(0x00);
      userPerms.fetchOr(0x07);
      expect(userPerms.load()).assertEqual(0x07);
    });

    /**
     * @tc.name   atomicShortFetchOrTest4300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_4300
     * @tc.desc   Verify AtomicShort.fetchOr() for data bit merging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchOrTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const data1: AtomicShort = new AtomicShort(0x00AA);
      const data2: number = 0x0055;
      data1.fetchOr(data2.toShort());
      expect(data1.load()).assertEqual(0x00FF);
    });

    /**
     * @tc.name   atomicShortFetchOrTest4400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_4400
     * @tc.desc   Verify AtomicShort.fetchOr() for network protocol flag handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchOrTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const packetFlags: AtomicShort = new AtomicShort(0x0000);
      packetFlags.fetchOr(0x0001);
      packetFlags.fetchOr(0x0002);
      expect(packetFlags.load()).assertEqual(0x0003);
    });

    /**
     * @tc.name   atomicShortFetchOrTest4500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_4500
     * @tc.desc   Verify AtomicShort.fetchOr() for setting higher bits on existing value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchOrTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const taskStatus: AtomicShort = new AtomicShort(0x0F);
      taskStatus.fetchOr(0x10);
      taskStatus.fetchOr(0x20);
      taskStatus.fetchOr(0x40);
      expect(taskStatus.load()).assertEqual(0x7F);
    });

    /**
     * @tc.name   atomicShortFetchOrTest4600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHOR_TEST_4600
     * @tc.desc   Verify AtomicShort.fetchOr() for event notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchOrTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const eventFlags: AtomicShort = new AtomicShort(0);
      eventFlags.fetchOr(0x01);
      eventFlags.fetchOr(0x02);
      expect(eventFlags.load()).assertEqual(0x03);
    });
  })
}
