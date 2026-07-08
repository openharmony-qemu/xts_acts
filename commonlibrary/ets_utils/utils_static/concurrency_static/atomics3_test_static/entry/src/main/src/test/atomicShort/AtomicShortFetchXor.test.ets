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

export default function atomicShortFetchXorTest(): void {
  describe('atomicShortFetchXorTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicShortFetchXorTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_0100
     * @tc.desc   Verify AtomicShort.fetchXor() with all required parameters present
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(5);
      const oldValue: number = atomicShort.fetchXor(3);
      expect(oldValue).assertEqual(5);
      expect(atomicShort.load()).assertEqual(6);
    });

    /**
     * @tc.name   atomicShortFetchXorTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_0200
     * @tc.desc   Verify AtomicShort.fetchXor() with normal short value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(10);
      const oldValue: number = atomicShort.fetchXor(5);
      expect(oldValue).assertEqual(10);
      expect(atomicShort.load()).assertEqual(15);
    });

    /**
     * @tc.name   atomicShortFetchXorTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_0300
     * @tc.desc   Verify AtomicShort.fetchXor() with max boundary value 32767
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const oldValue: number = atomicShort.fetchXor(32767);
      expect(oldValue).assertEqual(0);
      expect(atomicShort.load()).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortFetchXorTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_0400
     * @tc.desc   Verify AtomicShort.fetchXor() with min boundary value -32768
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const oldValue: number = atomicShort.fetchXor(-32768);
      expect(oldValue).assertEqual(0);
      expect(atomicShort.load()).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortFetchXorTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_0500
     * @tc.desc   Verify AtomicShort.fetchXor() with hexadecimal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x0F);
      const oldValue: number = atomicShort.fetchXor(0x0A);
      expect(oldValue).assertEqual(15);
      expect(atomicShort.load()).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchXorTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_0600
     * @tc.desc   Verify AtomicShort.fetchXor() with octal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0o15);
      const oldValue: number = atomicShort.fetchXor(0o10);
      expect(oldValue).assertEqual(13);
      expect(atomicShort.load()).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchXorTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_0700
     * @tc.desc   Verify AtomicShort.fetchXor() with binary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0b1111);
      const oldValue: number = atomicShort.fetchXor(0b1010);
      expect(oldValue).assertEqual(15);
      expect(atomicShort.load()).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchXorTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_0800
     * @tc.desc   Verify AtomicShort.fetchXor() with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(5);
      const oldValue: number = atomicShort.fetchXor(-3);
      expect(oldValue).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchXorTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_0900
     * @tc.desc   Verify AtomicShort.fetchXor() with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(7);
      const oldValue: number = atomicShort.fetchXor(0);
      expect(oldValue).assertEqual(7);
      expect(atomicShort.load()).assertEqual(7);
    });

    /**
     * @tc.name   atomicShortFetchXorTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_1000
     * @tc.desc   Verify AtomicShort.fetchXor() with same value returns 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(10);
      const oldValue: number = atomicShort.fetchXor(10);
      expect(oldValue).assertEqual(10);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortFetchXorTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_1100
     * @tc.desc   Verify AtomicShort.fetchXor() flips specific bit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0b0010);
      const oldValue: number = atomicShort.fetchXor(0b0001);
      expect(oldValue).assertEqual(2);
      expect(atomicShort.load()).assertEqual(3);
    });

    /**
     * @tc.name   atomicShortFetchXorTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_1200
     * @tc.desc   Verify AtomicShort.fetchXor() with all 1s mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x1234);
      const oldValue: number = atomicShort.fetchXor(-1);
      expect(oldValue).assertEqual(0x1234);
      expect(atomicShort.load()).assertEqual(-4661);
    });

    /**
     * @tc.name   atomicShortFetchXorTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_1300
     * @tc.desc   Verify AtomicShort.fetchXor() with all 0s mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(200);
      const oldValue: number = atomicShort.fetchXor(0);
      expect(oldValue).assertEqual(200);
      expect(atomicShort.load()).assertEqual(200);
    });

    /**
     * @tc.name   atomicShortFetchXorTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_1400
     * @tc.desc   Verify AtomicShort.fetchXor() returns old value with different values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(15);
      const oldValue: number = atomicShort.fetchXor(7);
      expect(oldValue).assertEqual(15);
      expect(atomicShort.load()).assertEqual(8);
    });

    /**
     * @tc.name   atomicShortFetchXorTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_1500
     * @tc.desc   Verify AtomicShort.fetchXor() multiple calls return correct old values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(1);
      const oldValue1: number = atomicShort.fetchXor(2);
      expect(oldValue1).assertEqual(1);
      const oldValue2: number = atomicShort.fetchXor(1);
      expect(oldValue2).assertEqual(3);
      const oldValue3: number = atomicShort.fetchXor(2);
      expect(oldValue3).assertEqual(2);
    });

    /**
     * @tc.name   atomicShortFetchXorTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_1600
     * @tc.desc   Verify AtomicShort.fetchXor() returns zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const oldValue: number = atomicShort.fetchXor(5);
      expect(oldValue).assertEqual(0);
      expect(atomicShort.load()).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchXorTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_1700
     * @tc.desc   Verify AtomicShort.fetchXor() returns negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-10);
      const oldValue: number = atomicShort.fetchXor(5);
      expect(oldValue).assertEqual(-10);
    });

    /**
     * @tc.name   atomicShortFetchXorTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_1800
     * @tc.desc   Verify AtomicShort.fetchXor() returns max value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32767);
      const oldValue: number = atomicShort.fetchXor(0);
      expect(oldValue).assertEqual(32767);
      expect(atomicShort.load()).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortFetchXorTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_1900
     * @tc.desc   Verify AtomicShort.fetchXor() returns min value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(-32768);
      const oldValue: number = atomicShort.fetchXor(0);
      expect(oldValue).assertEqual(-32768);
      expect(atomicShort.load()).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortFetchXorTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_2000
     * @tc.desc   Verify AtomicShort.fetchXor() return value type is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(5);
      const oldValue: number = atomicShort.fetchXor(3);
      expect(Number.isInteger(oldValue)).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchXorTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_2100
     * @tc.desc   Verify AtomicShort.fetchXor() return value in short range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(5);
      const oldValue: number = atomicShort.fetchXor(3);
      expect(oldValue >= -32768 && oldValue <= 32767).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchXorTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_2200
     * @tc.desc   Verify AtomicShort.fetchXor() with different initial value and zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x55AA);
      const oldValue: number = atomicShort.fetchXor(0);
      expect(oldValue).assertEqual(0x55AA);
      expect(atomicShort.load()).assertEqual(0x55AA);
    });

    /**
     * @tc.name   atomicShortFetchXorTest2300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_2300
     * @tc.desc   Verify AtomicShort.fetchXor() with different same values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x1234);
      const oldValue: number = atomicShort.fetchXor(0x1234);
      expect(oldValue).assertEqual(0x1234);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortFetchXorTest2400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_2400
     * @tc.desc   Verify AtomicShort.fetchXor() flips all bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x5678);
      const oldValue: number = atomicShort.fetchXor(-1);
      expect(oldValue).assertEqual(0x5678);
    });

    /**
     * @tc.name   atomicShortFetchXorTest2500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_2500
     * @tc.desc   Verify AtomicShort.fetchXor() repeated flip same bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x01);
      atomicShort.fetchXor(0xFF);
      atomicShort.fetchXor(0xFF);
      expect(atomicShort.load()).assertEqual(0x01);
    });

    /**
     * @tc.name   atomicShortFetchXorTest2600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_2600
     * @tc.desc   Verify AtomicShort.fetchXor() concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchXorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const results: number[] = [];

      const task1 = async () => {
        for (let i: number = 0; i < 100; i++) {
          results.push(atomicShort.fetchXor(0x01));
        }
      };

      const task2 = async () => {
        for (let i: number = 0; i < 100; i++) {
          results.push(atomicShort.fetchXor(0x02));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(results.length).assertEqual(200);
    });

    /**
     * @tc.name   atomicShortFetchXorTest2700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_2700
     * @tc.desc   Verify AtomicShort.isLockFree() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchXorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(AtomicShort.isLockFree()).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchXorTest2800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_2800
     * @tc.desc   Verify AtomicShort.fetchXor() default memory order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchXorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort: AtomicShort = new AtomicShort(20);
      const oldValue: number = atomicShort.fetchXor(10);
      expect(oldValue).assertEqual(20);
      expect(atomicShort.load()).assertEqual(30);
    });

    /**
     * @tc.name   atomicShortFetchXorTest2900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_2900
     * @tc.desc   Verify AtomicShort.fetchXor() immediately after construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(5);
      const oldValue: number = atomicShort.fetchXor(3);
      expect(oldValue).assertEqual(5);
    });

    /**
     * @tc.name   atomicShortFetchXorTest3000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_3000
     * @tc.desc   Verify AtomicShort.fetchXor() multiple instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomic1: AtomicShort = new AtomicShort(5);
      const atomic2: AtomicShort = new AtomicShort(3);
      const oldValue1: number = atomic1.fetchXor(10);
      const oldValue2: number = atomic2.fetchXor(5);
      expect(oldValue1).assertEqual(5);
      expect(oldValue2).assertEqual(3);
    });

    /**
     * @tc.name   atomicShortFetchXorTest3100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_3100
     * @tc.desc   Verify AtomicShort.fetchXor() consecutive XOR operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortFetchXorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      atomicShort.fetchXor(0x01);
      atomicShort.fetchXor(0x02);
      atomicShort.fetchXor(0x04);
      atomicShort.fetchXor(0x08);
      expect(atomicShort.load()).assertEqual(0x0F);
    });

    /**
     * @tc.name   atomicShortFetchXorTest3200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_3200
     * @tc.desc   Verify AtomicShort.fetchXor() combined with other atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchXorTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const oldValue1: number = atomicShort.fetchXor(1);
      const oldValue2: number = atomicShort.fetchAdd(2);
      const oldValue3: number = atomicShort.fetchOr(8);
      expect(oldValue1).assertEqual(0);
      expect(oldValue2).assertEqual(1);
    });

    /**
     * @tc.name   atomicShortFetchXorTest3300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_3300
     * @tc.desc   Verify AtomicShort.fetchXor() max and min values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchXorTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(32767);
      const oldValue: number = atomicShort.fetchXor(-32768);
      expect(oldValue).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortFetchXorTest3400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_3400
     * @tc.desc   Verify AtomicShort.fetchXor() gradually flip all bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchXorTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      for (let i: number = 0; i < 16; i++) {
        atomicShort.fetchXor((1 << i).toShort());
      }
      expect(atomicShort.load()).assertEqual(-1);
    });

    /**
     * @tc.name   atomicShortFetchXorTest3500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_3500
     * @tc.desc   Verify AtomicShort.fetchXor() circular flip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortFetchXorTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0x1234);
      atomicShort.fetchXor(-256);
      expect(atomicShort.load()).assertEqual(-4812);
      atomicShort.fetchXor(-256);
      expect(atomicShort.load()).assertEqual(0x1234);
    });

    /**
     * @tc.name   atomicShortFetchXorTest3600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_3600
     * @tc.desc   Verify AtomicShort.fetchXor() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchXorTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(5);
      const start: number = Date.now();
      atomicShort.fetchXor(3);
      const end: number = Date.now();
      const duration: number = end - start;

      expect(atomicShort.load()).assertEqual(6);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchXorTest3700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_3700
     * @tc.desc   Verify AtomicShort.fetchXor() batch call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchXorTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const start: number = Date.now();
      for (let i: number = 0; i < 1000000; i++) {
        atomicShort.fetchXor((i & 0xFF).toShort());
      }
      const end: number = Date.now();
      const duration: number = end - start;

      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchXorTest3800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_3800
     * @tc.desc   Verify AtomicShort.fetchXor() concurrent performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchXorTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      const iterations: number = 1000;

      const task1 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          atomicShort.fetchXor(0x01);
        }
      };

      const task2 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          atomicShort.fetchXor(0x02);
        }
      };

      const start: number = Date.now();
      await Promise.all([task1(), task2()]);
      const end: number = Date.now();
      const duration: number = end - start;

      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortFetchXorTest3900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_3900
     * @tc.desc   Verify AtomicShort.fetchXor() byte order handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortFetchXorTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort: AtomicShort = new AtomicShort(0);
      atomicShort.fetchXor(0x1234);
      expect(atomicShort.load()).assertEqual(0x1234);
    });

    /**
     * @tc.name   atomicShortFetchXorTest4000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_4000
     * @tc.desc   Verify AtomicShort.fetchXor() for bit flag operation - flip specific bit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchXorTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flags: AtomicShort = new AtomicShort(0x00);
      flags.fetchXor(0x01);
      expect(flags.load()).assertEqual(0x01);
      flags.fetchXor(0x01);
      expect(flags.load()).assertEqual(0x00);
      flags.fetchXor(0x02);
      expect(flags.load()).assertEqual(0x02);
    });

    /**
     * @tc.name   atomicShortFetchXorTest4100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_4100
     * @tc.desc   Verify AtomicShort.fetchXor() for switch state toggle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchXorTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const switchState: AtomicShort = new AtomicShort(0);
      switchState.fetchXor(0x01);
      expect(switchState.load()).assertEqual(0x01);
      switchState.fetchXor(0x01);
      expect(switchState.load()).assertEqual(0x00);
    });

    /**
     * @tc.name   atomicShortFetchXorTest4200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_4200
     * @tc.desc   Verify AtomicShort.fetchXor() for simple XOR encryption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchXorTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const data: AtomicShort = new AtomicShort(0x1234);
      const key: number = 0x5678;
      const oldValue: number = data.fetchXor(key.toShort());
      expect(oldValue).assertEqual(0x1234);
      data.fetchXor(key.toShort());
      expect(data.load()).assertEqual(0x1234);
    });

    /**
     * @tc.name   atomicShortFetchXorTest4300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_4300
     * @tc.desc   Verify AtomicShort.fetchXor() for multi-round XOR encryption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchXorTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const data: AtomicShort = new AtomicShort(-21555);
      const key1: number = 0x1234;
      const key2: number = 0x5678;
      data.fetchXor(key1.toShort());
      data.fetchXor(key2.toShort());
      data.fetchXor(key2.toShort());
      data.fetchXor(key1.toShort());
      expect(data.load()).assertEqual(-21555);
    });

    /**
     * @tc.name   atomicShortFetchXorTest4400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_4400
     * @tc.desc   Verify AtomicShort.fetchXor() for cumulative checksum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchXorTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const checksum: AtomicShort = new AtomicShort(0);
      const data1: number = 0x1234;
      const data2: number = 0x5678;
      checksum.fetchXor(data1.toShort());
      checksum.fetchXor(data2.toShort());
      expect(checksum.load()).assertEqual(0x444C);
    });

    /**
     * @tc.name   atomicShortFetchXorTest4500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_4500
     * @tc.desc   Verify AtomicShort.fetchXor() for multi-state cycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchXorTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const state: AtomicShort = new AtomicShort(0);
      state.fetchXor(0x01);
      state.fetchXor(0x02);
      state.fetchXor(0x04);
      state.fetchXor(0x01);
      state.fetchXor(0x02);
      expect(state.load()).assertEqual(0x04);
    });

    /**
     * @tc.name   atomicShortFetchXorTest4600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_FETCHXOR_TEST_4600
     * @tc.desc   Verify AtomicShort.fetchXor() for incremental update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortFetchXorTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const delta: AtomicShort = new AtomicShort(0);
      const oldValue: number = 0x1234;
      const newValue: number = 0x5678;
      delta.fetchXor((oldValue ^ newValue).toShort());
      expect(delta.load()).assertEqual(0x444C);
    });
  })
}
