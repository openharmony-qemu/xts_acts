'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function longOverall1Part3Test(): void {
  describe('LongOverall1Part3Test', (): void => {

    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_0100
     * @tc.name testLongOverall1Part3_001
     * @tc.desc Verify instance seven converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(7);
      expect(v.toFloat()).assertEqual(7.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_0200
     * @tc.name testLongOverall1Part3_002
     * @tc.desc Verify instance Long.MAX_VALUE converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      expect(v.toFloat()).assertEqual(9223372036854775807.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_0300
     * @tc.name testLongOverall1Part3_003
     * @tc.desc Verify instance Long.MIN_VALUE converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      expect(v.toFloat()).assertEqual(-9223372036854775808.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_0400
     * @tc.name testLongOverall1Part3_004
     * @tc.desc Verify instance ten billion converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(10000000000);
      expect(v.toFloat()).assertEqual(10000000000.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_0500
     * @tc.name testLongOverall1Part3_005
     * @tc.desc Verify instance one hundred twenty-three trillion four hundred fifty-six billion seven hundred eighty-nine million twelve thousand three hundred forty-five converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(123456789012345);
      expect(v.toFloat()).assertEqual(123456789012345.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_0600
     * @tc.name testLongOverall1Part3_006
     * @tc.desc Verify instance zero converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      expect(v.toDouble()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_0700
     * @tc.name testLongOverall1Part3_007
     * @tc.desc Verify instance seven converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(7);
      expect(v.toDouble()).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_0800
     * @tc.name testLongOverall1Part3_008
     * @tc.desc Verify instance Long.MAX_VALUE converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      expect(v.toDouble()).assertEqual(9223372036854775807.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_0900
     * @tc.name testLongOverall1Part3_009
     * @tc.desc Verify instance Long.MIN_VALUE converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      expect(v.toDouble()).assertEqual(-9223372036854775808.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_1000
     * @tc.name testLongOverall1Part3_010
     * @tc.desc Verify instance ten billion converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(10000000000);
      expect(v.toDouble()).assertEqual(10000000000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_1100
     * @tc.name testLongOverall1Part3_011
     * @tc.desc Verify instance one hundred twenty-three trillion four hundred fifty-six billion seven hundred eighty-nine million twelve thousand three hundred forty-five converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(123456789012345);
      expect(v.toDouble()).assertEqual(123456789012345.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_1200
     * @tc.name testLongOverall1Part3_012
     * @tc.desc Verify static Long.MIN_VALUE converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(Long.MIN_VALUE)).assertEqual(-9223372036854775808.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_1300
     * @tc.name testLongOverall1Part3_013
     * @tc.desc Verify static ten billion converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toLong(10000000000)).assertEqual(10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_1400
     * @tc.name testLongOverall1Part3_014
     * @tc.desc Verify toString with invalid radix 1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(42);
      try {
        v.toString(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_1500
     * @tc.name testLongOverall1Part3_015
     * @tc.desc Verify instance 35 string representation in radix-36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(35);
      expect(v.toString(36)).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_1600
     * @tc.name testLongOverall1Part3_016
     * @tc.desc Verify Long.MAX_VALUE divided by two equals 4611686018427387903
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      const two: Long = new Long(2);
      expect(v.div(two).toLong()).assertEqual(4611686018427387903);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_1700
     * @tc.name testLongOverall1Part3_017
     * @tc.desc Verify Long.MIN_VALUE divided by two equals -4611686018427387904
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      const two: Long = new Long(2);
      expect(v.div(two).toLong()).assertEqual(-4611686018427387904);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_1800
     * @tc.name testLongOverall1Part3_018
     * @tc.desc Verify Long.MAX_VALUE times two wraps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(9223372036854775807);
      const two: Long = new Long(2);
      expect(a.mul(two).toLong()).assertEqual(-2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_1900
     * @tc.name testLongOverall1Part3_019
     * @tc.desc Verify Long.MAX_VALUE plus Long.MAX_VALUE wraps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(9223372036854775807);
      expect(a.add(a).toLong()).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_2000
     * @tc.name testLongOverall1Part3_020
     * @tc.desc Verify Long.MIN_VALUE plus Long.MIN_VALUE wraps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MIN_VALUE);
      expect(a.add(a).toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_2100
     * @tc.name testLongOverall1Part3_021
     * @tc.desc Verify Long.MAX_VALUE minus Long.MIN_VALUE wraps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max: Long = new Long(9223372036854775807);
      const min: Long = new Long(Long.MIN_VALUE);
      expect(max.sub(min).toLong()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_2200
     * @tc.name testLongOverall1Part3_022
     * @tc.desc Verify four billion two hundred ninety-four million nine hundred sixty-seven thousand two hundred ninety-six times four billion two hundred ninety-four million nine hundred sixty-seven thousand two hundred ninety-six wraps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(4294967296);
      const b: Long = new Long(4294967296);
      expect(a.mul(b).toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_2300
     * @tc.name testLongOverall1Part3_023
     * @tc.desc Verify ten billion plus negative five billion equals five billion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(10000000000);
      const b: Long = new Long(-5000000000);
      expect(a.add(b).toLong()).assertEqual(5000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_2400
     * @tc.name testLongOverall1Part3_024
     * @tc.desc Verify hexadecimal string 0x8000000000000000 parsed as Long throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result: long = Long.parseInt("0x8000000000000000", 16);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_2500
     * @tc.name testLongOverall1Part3_025
     * @tc.desc Verify hexadecimal string -0x8000000000000001 parsed as Long throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result: long = Long.parseInt("-0x8000000000000001", 16);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_2600
     * @tc.name testLongOverall1Part3_026
     * @tc.desc Verify 42 compared equal to 42 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(42);
      const b: Long = new Long(42);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_2700
     * @tc.name testLongOverall1Part3_027
     * @tc.desc Verify 42 compared equal to 43 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(42);
      const b: Long = new Long(43);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_2800
     * @tc.name testLongOverall1Part3_028
     * @tc.desc Verify Long.MAX_VALUE compared equal to Long.MIN_VALUE returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max: Long = new Long(9223372036854775807);
      const min: Long = new Long(Long.MIN_VALUE);
      expect(max.equals(min)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_2900
     * @tc.name testLongOverall1Part3_029
     * @tc.desc Verify zero compared equal to zero returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero: Long = new Long(0);
      const neg: Long = new Long(-0);
      expect(zero.equals(neg)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_3000
     * @tc.name testLongOverall1Part3_030
     * @tc.desc Verify compareTo of 42 vs 42 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(42);
      const b: Long = new Long(42);
      expect(a.compareTo(b)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_3100
     * @tc.name testLongOverall1Part3_031
     * @tc.desc Verify compareTo of three vs five returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(3);
      const b: Long = new Long(5);
      expect(a.compareTo(b)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_3200
     * @tc.name testLongOverall1Part3_032
     * @tc.desc Verify compareTo of five vs three returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(5);
      const b: Long = new Long(3);
      expect(a.compareTo(b)).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_3300
     * @tc.name testLongOverall1Part3_033
     * @tc.desc Verify compareTo of Long.MIN_VALUE vs Long.MAX_VALUE returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min: Long = new Long(Long.MIN_VALUE);
      const max: Long = new Long(9223372036854775807);
      expect(min.compareTo(max)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_3400
     * @tc.name testLongOverall1Part3_034
     * @tc.desc Verify compareTo of ten billion vs zero returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(10000000000);
      const b: Long = new Long(0);
      expect(a.compareTo(b)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_3500
     * @tc.name testLongOverall1Part3_035
     * @tc.desc Verify three ordered before five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(3);
      const b: Long = new Long(5);
      expect(a.isLessThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_3600
     * @tc.name testLongOverall1Part3_036
     * @tc.desc Verify five not ordered before five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(5);
      const b: Long = new Long(5);
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_3700
     * @tc.name testLongOverall1Part3_037
     * @tc.desc Verify five ordered before or equal to five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(5);
      const b: Long = new Long(5);
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_3800
     * @tc.name testLongOverall1Part3_038
     * @tc.desc Verify five ordered after three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(5);
      const b: Long = new Long(3);
      expect(a.isGreaterThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_3900
     * @tc.name testLongOverall1Part3_039
     * @tc.desc Verify five ordered after or equal to five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(5);
      const b: Long = new Long(5);
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_4000
     * @tc.name testLongOverall1Part3_040
     * @tc.desc Verify Long.MIN_VALUE not ordered after or equal to Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min: Long = new Long(Long.MIN_VALUE);
      const max: Long = new Long(9223372036854775807);
      expect(min.isGreaterEqualThan(max)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_4100
     * @tc.name testLongOverall1Part3_041
     * @tc.desc Verify static -42 string representation in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toString(-42)).assertEqual('-42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_4200
     * @tc.name testLongOverall1Part3_042
     * @tc.desc Verify static zero string representation in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toString(0)).assertEqual('0');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_4300
     * @tc.name testLongOverall1Part3_043
     * @tc.desc Verify instance zero string representation in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      expect(v.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_4400
     * @tc.name testLongOverall1Part3_044
     * @tc.desc Verify instance ten billion string representation in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(10000000000);
      expect(v.toString()).assertEqual('10000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_4500
     * @tc.name testLongOverall1Part3_045
     * @tc.desc Verify instance Long.MAX_VALUE string representation in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      expect(v.toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_4600
     * @tc.name testLongOverall1Part3_046
     * @tc.desc Verify instance Long.MIN_VALUE string representation in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      expect(v.toString()).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_4700
     * @tc.name testLongOverall1Part3_047
     * @tc.desc Verify zero instance immutability after add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long();
      const b: Long = a.add(new Long(5));
      expect(a.toLong()).assertEqual(0);
      expect(b.toLong()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_4800
     * @tc.name testLongOverall1Part3_048
     * @tc.desc Verify one hundred instance immutability after sub
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(100);
      const b: Long = a.sub(new Long(30));
      expect(a.toLong()).assertEqual(100);
      expect(b.toLong()).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_4900
     * @tc.name testLongOverall1Part3_049
     * @tc.desc Verify seven instance immutability after mul
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(7);
      const b: Long = a.mul(new Long(3));
      expect(a.toLong()).assertEqual(7);
      expect(b.toLong()).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_5000
     * @tc.name testLongOverall1Part3_050
     * @tc.desc Verify one hundred instance immutability after div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(100);
      const b: Long = a.div(new Long(4));
      expect(a.toLong()).assertEqual(100);
      expect(b.toLong()).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_5100
     * @tc.name testLongOverall1Part3_051
     * @tc.desc Verify ten instance immutability after add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(10);
      const b: Long = a.add(new Long(20));
      const c: Long = b.add(new Long(30));
      expect(a.toLong()).assertEqual(10);
      expect(b.toLong()).assertEqual(30);
      expect(c.toLong()).assertEqual(60);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_5200
     * @tc.name testLongOverall1Part3_052
     * @tc.desc Verify instance ten billion converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(10000000000);
      const result: byte = v.toByte();
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_5300
     * @tc.name testLongOverall1Part3_053
     * @tc.desc Verify instance Long.MIN_VALUE converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      expect(v.toShort()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_5400
     * @tc.name testLongOverall1Part3_054
     * @tc.desc Verify instance ten billion converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(10000000000);
      const result: short = v.toShort();
      expect(result).assertEqual(-7168);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_5500
     * @tc.name testLongOverall1Part3_055
     * @tc.desc Verify instance Long.MIN_VALUE converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      expect(v.toInt()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_5600
     * @tc.name testLongOverall1Part3_056
     * @tc.desc Verify instance ten billion converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(10000000000);
      const result: int = v.toInt();
      expect(result).assertEqual(1410065408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_5700
     * @tc.name testLongOverall1Part3_057
     * @tc.desc Verify instance sixty-five thousand five hundred thirty-five converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(65535);
      expect(v.toChar().toString()).assertEqual('\uFFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_5800
     * @tc.name testLongOverall1Part3_058
     * @tc.desc Verify instance sixty-five thousand five hundred thirty-six converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(65536);
      expect(v.toChar().toString()).assertEqual('\0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_5900
     * @tc.name testLongOverall1Part3_059
     * @tc.desc Verify instance negative one converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-1);
      expect(v.toChar().toString()).assertEqual('\uFFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_6000
     * @tc.name testLongOverall1Part3_060
     * @tc.desc Verify instance Long.MAX_VALUE converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MAX_VALUE);
      expect(v.toChar().toString()).assertEqual('\uFFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_6100
     * @tc.name testLongOverall1Part3_061
     * @tc.desc Verify instance Long.MIN_VALUE converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      expect(v.toChar().toString()).assertEqual('\0');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_6200
     * @tc.name testLongOverall1Part3_062
     * @tc.desc Verify instance zero converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      expect(v.toFloat()).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_6300
     * @tc.name testLongOverall1Part3_063
     * @tc.desc Verify static Long.MIN_VALUE converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: float = Long.toFloat(Long.MIN_VALUE);
      expect(f).assertEqual(-9.223372036854776e18);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_6400
     * @tc.name testLongOverall1Part3_064
     * @tc.desc Verify static 255 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: byte = Long.toByte(255);
      expect(b).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_6500
     * @tc.name testLongOverall1Part3_065
     * @tc.desc Verify static sixty-five thousand five hundred thirty-five converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: short = Long.toShort(65535);
      expect(s).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_6600
     * @tc.name testLongOverall1Part3_066
     * @tc.desc Verify static four billion two hundred ninety-four million nine hundred sixty-seven thousand two hundred ninety-five converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i: int = Long.toInt(4294967295);
      expect(i).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_6700
     * @tc.name testLongOverall1Part3_067
     * @tc.desc Verify static sixty-five thousand five hundred thirty-six converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: char = Long.toChar(65536);
      expect(c.toString()).assertEqual('\0');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_6800
     * @tc.name testLongOverall1Part3_068
     * @tc.desc Verify Long.MAX_VALUE plus two wraps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MAX_VALUE);
      const b: Long = new Long(2);
      const result: Long = a.add(b);
      expect(result.toLong()).assertEqual(-9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_6900
     * @tc.name testLongOverall1Part3_069
     * @tc.desc Verify ten billion plus negative ten billion equals zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(10000000000);
      const b: Long = new Long(-10000000000);
      const result: Long = a.add(b);
      expect(result.toLong()).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_7000
     * @tc.name testLongOverall1Part3_070
     * @tc.desc Verify zero minus one equals negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero: Long = new Long(0);
      const one: Long = new Long(1);
      const result: Long = zero.sub(one);
      expect(result.toLong()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_7100
     * @tc.name testLongOverall1Part3_071
     * @tc.desc Verify fifty instance immutability after sub
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(50);
      const b: Long = new Long(30);
      const c: Long = a.sub(b);
      expect(a.toLong()).assertEqual(50);
      expect(c.toLong()).assertEqual(20);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_7200
     * @tc.name testLongOverall1Part3_072
     * @tc.desc Verify Long.MAX_VALUE times negative one equals near minimum boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MAX_VALUE);
      const neg: Long = new Long(-1);
      const result: Long = a.mul(neg);
      expect(result.toLong()).assertEqual(-Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_7300
     * @tc.name testLongOverall1Part3_073
     * @tc.desc Verify Long.MIN_VALUE times two wraps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MIN_VALUE);
      const two: Long = new Long(2);
      const result: Long = a.mul(two);
      expect(result.toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_7400
     * @tc.name testLongOverall1Part3_074
     * @tc.desc Verify ten billion times ten billion wraps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(10000000000);
      const result: Long = a.mul(a);
      expect(result.toLong()).assertEqual(7766279631452241920);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_7500
     * @tc.name testLongOverall1Part3_075
     * @tc.desc Verify seven times three equals 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(7);
      const b: Long = new Long(3);
      const result: Long = a.mul(b);
      expect(result.toLong()).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_7600
     * @tc.name testLongOverall1Part3_076
     * @tc.desc Verify six instance immutability after mul
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(6);
      const b: Long = new Long(7);
      const c: Long = a.mul(b);
      expect(a.toLong()).assertEqual(6);
      expect(c.toLong()).assertEqual(42);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_7700
     * @tc.name testLongOverall1Part3_077
     * @tc.desc Verify -7 divided by three equals -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(-7);
      const b: Long = new Long(3);
      const result: Long = a.div(b);
      expect(result.toLong()).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_7800
     * @tc.name testLongOverall1Part3_078
     * @tc.desc Verify zero divided by five equals zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero: Long = new Long(0);
      const five: Long = new Long(5);
      const result: Long = zero.div(five);
      expect(result.toLong()).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_7900
     * @tc.name testLongOverall1Part3_079
     * @tc.desc Verify fifty instance immutability after div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(50);
      const b: Long = new Long(10);
      const c: Long = a.div(b);
      expect(a.toLong()).assertEqual(50);
      expect(c.toLong()).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_8000
     * @tc.name testLongOverall1Part3_080
     * @tc.desc Verify one hundred plus fifty minus thirty equals 120
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(100);
      const r: Long = a.add(new Long(50)).sub(new Long(30));
      expect(r.toLong()).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_8100
     * @tc.name testLongOverall1Part3_081
     * @tc.desc Verify five times three plus two equals 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(5);
      const r: Long = a.mul(new Long(3)).add(new Long(2));
      expect(r.toLong()).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_8200
     * @tc.name testLongOverall1Part3_082
     * @tc.desc Verify one hundred minus ten minus twenty equals 70
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(100);
      const r: Long = a.sub(new Long(10)).sub(new Long(20));
      expect(r.toLong()).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_8300
     * @tc.name testLongOverall1Part3_083
     * @tc.desc Verify two plus three times four equals twenty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2);
      const b: Long = new Long(3);
      const c: Long = new Long(4);
      const r: Long = a.add(b).mul(c);
      expect(r.toLong()).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_8400
     * @tc.name testLongOverall1Part3_084
     * @tc.desc Verify one plus two plus three plus four equals ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(1);
      const r: Long = a.add(new Long(2)).add(new Long(3)).add(new Long(4));
      expect(r.toLong()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_8500
     * @tc.name testLongOverall1Part3_085
     * @tc.desc Verify five instance immutability after add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(5);
      const b: Long = a.add(new Long(3));
      const c: Long = b.mul(new Long(2));
      expect(a.toLong()).assertEqual(5);
      expect(b.toLong()).assertEqual(8);
      expect(c.toLong()).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_8600
     * @tc.name testLongOverall1Part3_086
     * @tc.desc Verify compareTo of fifty vs thirty returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(50);
      const b: Long = new Long(30);
      const cmp: int = a.compareTo(b);
      expect(a.toLong()).assertEqual(50);
      expect(b.toLong()).assertEqual(30);
      expect(cmp).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_8700
     * @tc.name testLongOverall1Part3_087
     * @tc.desc Verify ten ordered before twenty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(10);
      const b: Long = new Long(20);
      const r: boolean = a.isLessThan(b);
      expect(a.toLong()).assertEqual(10);
      expect(b.toLong()).assertEqual(20);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_8800
     * @tc.name testLongOverall1Part3_088
     * @tc.desc Verify thirty ordered after twenty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(30);
      const b: Long = new Long(20);
      const r: boolean = a.isGreaterThan(b);
      expect(a.toLong()).assertEqual(30);
      expect(b.toLong()).assertEqual(20);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_8900
     * @tc.name testLongOverall1Part3_089
     * @tc.desc Verify twenty ordered before or equal to twenty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(20);
      const b: Long = new Long(20);
      const r: boolean = a.isLessEqualThan(b);
      expect(a.toLong()).assertEqual(20);
      expect(b.toLong()).assertEqual(20);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_9000
     * @tc.name testLongOverall1Part3_090
     * @tc.desc Verify thirty ordered after or equal to twenty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(30);
      const b: Long = new Long(20);
      const r: boolean = a.isGreaterEqualThan(b);
      expect(a.toLong()).assertEqual(30);
      expect(b.toLong()).assertEqual(20);
      expect(r).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_9100
     * @tc.name testLongOverall1Part3_091
     * @tc.desc Verify instance twelve thousand three hundred forty-five string representation in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(12345);
      const s: String = v.toString();
      expect(v.toLong()).assertEqual(12345);
      expect(s).assertEqual('12345');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_9200
     * @tc.name testLongOverall1Part3_092
     * @tc.desc Verify instance Long.MAX_VALUE string representation in binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MAX_VALUE);
      const s: string = v.toString(2);
      expect(s).assertEqual('111111111111111111111111111111111111111111111111111111111111111');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART3_9300
     * @tc.name testLongOverall1Part3_093
     * @tc.desc Verify instance ten billion string representation in radix-36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part3_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(10000000000);
      const s: string = v.toString(36);
      expect(s).assertEqual('4ldqpds');
    });
  });
}
