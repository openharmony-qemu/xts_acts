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

export default function longProperty1Part2Test(): void {
  describe('LongProperty1Part2Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_0100
     * @tc.name testLongProperty1Part2_001
     * @tc.desc Verify Long.MAX_VALUE divided by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MAX_VALUE / 1).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_0200
     * @tc.name testLongProperty1Part2_002
     * @tc.desc Verify Long.MAX_VALUE divided by negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MAX_VALUE / -1).assertEqual(-9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_0300
     * @tc.name testLongProperty1Part2_003
     * @tc.desc Verify Long.MAX_VALUE modulo one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MAX_VALUE % 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_0400
     * @tc.name testLongProperty1Part2_004
     * @tc.desc Verify Long.MAX_VALUE modulo two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MAX_VALUE % 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_0500
     * @tc.name testLongProperty1Part2_005
     * @tc.desc Verify Long.MAX_VALUE modulo negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MAX_VALUE % -1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_0600
     * @tc.name testLongProperty1Part2_006
     * @tc.desc Verify Long.BIT_SIZE times Long.BYTE_SIZE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BIT_SIZE * Long.BYTE_SIZE).assertEqual(512);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_0700
     * @tc.name testLongProperty1Part2_007
     * @tc.desc Verify Long.BIT_SIZE modulo Long.BYTE_SIZE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BIT_SIZE % Long.BYTE_SIZE).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_0800
     * @tc.name testLongProperty1Part2_008
     * @tc.desc Verify Long.BIT_SIZE plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BIT_SIZE + 1).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_0900
     * @tc.name testLongProperty1Part2_009
     * @tc.desc Verify Long.BIT_SIZE minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BIT_SIZE - 1).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_1000
     * @tc.name testLongProperty1Part2_010
     * @tc.desc Verify Long.BIT_SIZE modulo three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BIT_SIZE % 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_1100
     * @tc.name testLongProperty1Part2_011
     * @tc.desc Verify Long.BIT_SIZE ORed with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((Long.BIT_SIZE | 0)).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_1200
     * @tc.name testLongProperty1Part2_012
     * @tc.desc Verify Long.BYTE_SIZE plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BYTE_SIZE + 1).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_1300
     * @tc.name testLongProperty1Part2_013
     * @tc.desc Verify Long.BYTE_SIZE minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BYTE_SIZE - 1).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_1400
     * @tc.name testLongProperty1Part2_014
     * @tc.desc Verify Long.BYTE_SIZE times two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BYTE_SIZE * 2).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_1500
     * @tc.name testLongProperty1Part2_015
     * @tc.desc Verify Long.BYTE_SIZE divided by two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BYTE_SIZE / 2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_1600
     * @tc.name testLongProperty1Part2_016
     * @tc.desc Verify Long.BYTE_SIZE modulo three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BYTE_SIZE % 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_1700
     * @tc.name testLongProperty1Part2_017
     * @tc.desc Verify Long.MIN_VALUE plus (-1) wraps to maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal + (-1);
      expect(result).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_1800
     * @tc.name testLongProperty1Part2_018
     * @tc.desc Verify Long.MIN_VALUE minus Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let maxVal: long = Long.MAX_VALUE;
      let result: long = minVal - maxVal;
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_1900
     * @tc.name testLongProperty1Part2_019
     * @tc.desc Verify Long.MIN_VALUE times (-1) wraps to minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal * (-1);
      expect(result).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_2000
     * @tc.name testLongProperty1Part2_020
     * @tc.desc Verify Long.MIN_VALUE times two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal * 2;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_2100
     * @tc.name testLongProperty1Part2_021
     * @tc.desc Verify Long.MIN_VALUE times (-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal * (-2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_2200
     * @tc.name testLongProperty1Part2_022
     * @tc.desc Verify Long.MIN_VALUE divided by (-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal / (-1);
      expect(result).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_2300
     * @tc.name testLongProperty1Part2_023
     * @tc.desc Verify Long.MIN_VALUE times zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal * 0;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_2400
     * @tc.name testLongProperty1Part2_024
     * @tc.desc Verify Long.MIN_VALUE divided by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal / 1;
      expect(result).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_2500
     * @tc.name testLongProperty1Part2_025
     * @tc.desc Verify Long.MIN_VALUE divided by two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal / 2;
      expect(result).assertEqual(-4611686018427387904);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_2600
     * @tc.name testLongProperty1Part2_026
     * @tc.desc Verify Long.MIN_VALUE modulo one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal % 1;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_2700
     * @tc.name testLongProperty1Part2_027
     * @tc.desc Verify Long.MIN_VALUE modulo (-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal % (-1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_2800
     * @tc.name testLongProperty1Part2_028
     * @tc.desc Verify Long.MIN_VALUE modulo two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal % 2;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_2900
     * @tc.name testLongProperty1Part2_029
     * @tc.desc Verify Long.MIN_VALUE modulo 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal % 7;
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_3000
     * @tc.name testLongProperty1Part2_030
     * @tc.desc Verify one divided by Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = 1 / minVal;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_3100
     * @tc.name testLongProperty1Part2_031
     * @tc.desc Verify Long.MIN_VALUE decimal string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min: Long = new Long(Long.MIN_VALUE);
      let str: string = min.toString();
      expect(str).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_3200
     * @tc.name testLongProperty1Part2_032
     * @tc.desc Verify Long.MIN_VALUE string representation in base-32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min: Long = new Long(Long.MIN_VALUE);
      let str: string = min.toString(32);
      expect(str).assertContain('-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_3300
     * @tc.name testLongProperty1Part2_033
     * @tc.desc Verify Long.MIN_VALUE compared to NaN returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min: Long = new Long(Long.MIN_VALUE);
      let result: boolean = min.equals(Double.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_3400
     * @tc.name testLongProperty1Part2_034
     * @tc.desc Verify Long.MIN_VALUE compared to non-Long string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min: Long = new Long(Long.MIN_VALUE);
      let result: boolean = min.equals('abc');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_3500
     * @tc.name testLongProperty1Part2_035
     * @tc.desc Verify Long.MIN_VALUE compared to primitive zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min: Long = new Long(Long.MIN_VALUE);
      let result: boolean = min.equals(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_3600
     * @tc.name testLongProperty1Part2_036
     * @tc.desc Verify compareTo returns -1 comparing Long.MIN_VALUE to Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min: Long = new Long(Long.MIN_VALUE);
      let max: Long = new Long(Long.MAX_VALUE);
      let result: int = min.compareTo(max);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_3700
     * @tc.name testLongProperty1Part2_037
     * @tc.desc Verify Long.MIN_VALUE ordered before zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min: Long = new Long(Long.MIN_VALUE);
      let zero: Long = new Long(0);
      let result: int = min.compareTo(zero);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_3800
     * @tc.name testLongProperty1Part2_038
     * @tc.desc Verify Long.MIN_VALUE ordered equal to Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min: Long = new Long(Long.MIN_VALUE);
      let result: int = min.compareTo(min);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_3900
     * @tc.name testLongProperty1Part2_039
     * @tc.desc Verify Long.MIN_VALUE converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min: Long = new Long(Long.MIN_VALUE);
      let i: int = min.toInt();
      expect(i).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_4000
     * @tc.name testLongProperty1Part2_040
     * @tc.desc Verify Long.MIN_VALUE converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min: Long = new Long(Long.MIN_VALUE);
      let f: float = min.toFloat();
      expect(f).assertEqual(-9.223372036854776e18f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_4100
     * @tc.name testLongProperty1Part2_041
     * @tc.desc Verify Long.MIN_VALUE converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min: Long = new Long(Long.MIN_VALUE);
      let d: double = min.toDouble();
      expect(d).assertEqual(-9.223372036854776e18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_4200
     * @tc.name testLongProperty1Part2_042
     * @tc.desc Verify Long.MAX_VALUE plus (-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let result: long = maxVal + (-1);
      expect(result).assertEqual(9223372036854775806);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_4300
     * @tc.name testLongProperty1Part2_043
     * @tc.desc Verify Long.MAX_VALUE times (-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let result: long = maxVal * (-1);
      expect(result).assertEqual(-9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_4400
     * @tc.name testLongProperty1Part2_044
     * @tc.desc Verify Long.MAX_VALUE times (-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let result: long = maxVal * (-2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_4500
     * @tc.name testLongProperty1Part2_045
     * @tc.desc Verify Long.MAX_VALUE plus Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let minVal: long = Long.MIN_VALUE;
      let result: long = maxVal + minVal;
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_4600
     * @tc.name testLongProperty1Part2_046
     * @tc.desc Verify Long.MAX_VALUE minus (-1) wraps to minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let result: long = maxVal - (-1);
      expect(result).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_4700
     * @tc.name testLongProperty1Part2_047
     * @tc.desc Verify Long.MAX_VALUE plus Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let result: long = maxVal + maxVal;
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_4800
     * @tc.name testLongProperty1Part2_048
     * @tc.desc Verify Long.MAX_VALUE times one wraps to maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let result: long = maxVal * 1;
      expect(result).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_4900
     * @tc.name testLongProperty1Part2_049
     * @tc.desc Verify Long.MAX_VALUE decimal string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max: Long = new Long(Long.MAX_VALUE);
      let str: string = max.toString();
      expect(str).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_5000
     * @tc.name testLongProperty1Part2_050
     * @tc.desc Verify Long.MAX_VALUE string representation in base-32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max: Long = new Long(Long.MAX_VALUE);
      let str: string = max.toString(32);
      expect(str).assertContain('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_5100
     * @tc.name testLongProperty1Part2_051
     * @tc.desc Verify Long.MAX_VALUE compared to NaN returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max: Long = new Long(Long.MAX_VALUE);
      let result: boolean = max.equals(Double.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_5200
     * @tc.name testLongProperty1Part2_052
     * @tc.desc Verify Long.MAX_VALUE compared to non-Long string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max: Long = new Long(Long.MAX_VALUE);
      let result: boolean = max.equals('xyz');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_5300
     * @tc.name testLongProperty1Part2_053
     * @tc.desc Verify Long.MAX_VALUE compared equal to zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max: Long = new Long(Long.MAX_VALUE);
      let zero: Long = new Long(0);
      let result: boolean = max.equals(zero);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_5400
     * @tc.name testLongProperty1Part2_054
     * @tc.desc Verify compareTo returns 1 comparing Long.MAX_VALUE to Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max: Long = new Long(Long.MAX_VALUE);
      let min: Long = new Long(Long.MIN_VALUE);
      let result: int = max.compareTo(min);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_5500
     * @tc.name testLongProperty1Part2_055
     * @tc.desc Verify Long.MAX_VALUE ordered after zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max: Long = new Long(Long.MAX_VALUE);
      let zero: Long = new Long(0);
      let result: int = max.compareTo(zero);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_5600
     * @tc.name testLongProperty1Part2_056
     * @tc.desc Verify Long.MAX_VALUE ordered equal to Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max: Long = new Long(Long.MAX_VALUE);
      let result: int = max.compareTo(max);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_5700
     * @tc.name testLongProperty1Part2_057
     * @tc.desc Verify bit shift by Long.BIT_SIZE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bitSize: byte = Long.BIT_SIZE;
      let result: long = 1 << bitSize;
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_5800
     * @tc.name testLongProperty1Part2_058
     * @tc.desc Verify Long.BIT_SIZE times zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bitSize: byte = Long.BIT_SIZE;
      expect(bitSize * 0).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_5900
     * @tc.name testLongProperty1Part2_059
     * @tc.desc Verify Long.MIN_VALUE plus zero wraps to minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal + 0;
      expect(result).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_6000
     * @tc.name testLongProperty1Part2_060
     * @tc.desc Verify Long.MAX_VALUE plus zero wraps to maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let result: long = maxVal + 0;
      expect(result).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_6100
     * @tc.name testLongProperty1Part2_061
     * @tc.desc Verify Long.MIN_VALUE minus Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal - minVal;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_6200
     * @tc.name testLongProperty1Part2_062
     * @tc.desc Verify Long.MAX_VALUE minus Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let result: long = maxVal - maxVal;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_6300
     * @tc.name testLongProperty1Part2_063
     * @tc.desc Verify Long.MIN_VALUE times Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal * minVal;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_6400
     * @tc.name testLongProperty1Part2_064
     * @tc.desc Verify Long.MAX_VALUE times Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let result: long = maxVal * maxVal;
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_6500
     * @tc.name testLongProperty1Part2_065
     * @tc.desc Verify zero divided by Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = 0 / minVal;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_6600
     * @tc.name testLongProperty1Part2_066
     * @tc.desc Verify zero divided by Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let result: long = 0 / maxVal;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_6700
     * @tc.name testLongProperty1Part2_067
     * @tc.desc Verify Long.MIN_VALUE modulo 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal % 3;
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_6800
     * @tc.name testLongProperty1Part2_068
     * @tc.desc Verify Long.MIN_VALUE modulo 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal % 5;
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_6900
     * @tc.name testLongProperty1Part2_069
     * @tc.desc Verify Long.MIN_VALUE modulo eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal % 8;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_7000
     * @tc.name testLongProperty1Part2_070
     * @tc.desc Verify Long.MIN_VALUE modulo (-3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal % (-3);
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_7100
     * @tc.name testLongProperty1Part2_071
     * @tc.desc Verify Long.MIN_VALUE modulo (-8)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minVal: long = Long.MIN_VALUE;
      let result: long = minVal % (-8);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_7200
     * @tc.name testLongProperty1Part2_072
     * @tc.desc Verify Long.MAX_VALUE modulo 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let result: long = maxVal % 3;
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_7300
     * @tc.name testLongProperty1Part2_073
     * @tc.desc Verify Long.MAX_VALUE modulo 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let result: long = maxVal % 7;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_7400
     * @tc.name testLongProperty1Part2_074
     * @tc.desc Verify Long.MAX_VALUE modulo eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let result: long = maxVal % 8;
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_7500
     * @tc.name testLongProperty1Part2_075
     * @tc.desc Verify Long.MAX_VALUE modulo 10000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let result: long = maxVal % 10000000000;
      expect(result).assertEqual(6854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_7600
     * @tc.name testLongProperty1Part2_076
     * @tc.desc Verify Long.MAX_VALUE modulo Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: long = Long.MAX_VALUE;
      let result: long = maxVal % maxVal;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_7700
     * @tc.name testLongProperty1Part2_077
     * @tc.desc Verify negative one plus negative one equals negative two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minHex: long = -1;
      let result: long = minHex + (-1);
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_7800
     * @tc.name testLongProperty1Part2_078
     * @tc.desc Verify negative one plus one equals zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxHex: long = -1;
      let result: long = maxHex + 1;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_7900
     * @tc.name testLongProperty1Part2_079
     * @tc.desc Verify Long.MIN_VALUE instance immutability after add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inst: Long = new Long(Long.MIN_VALUE);
      const result: Long = inst.add(new Long(1));
      expect(result.toLong()).assertEqual(-9223372036854775807);
      expect(inst.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_8000
     * @tc.name testLongProperty1Part2_080
     * @tc.desc Verify Long.MAX_VALUE instance immutability after sub
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inst: Long = new Long(Long.MAX_VALUE);
      const result: Long = inst.sub(new Long(1));
      expect(result.toLong()).assertEqual(9223372036854775806);
      expect(inst.toLong()).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_8100
     * @tc.name testLongProperty1Part2_081
     * @tc.desc Verify Long.MIN_VALUE instance immutability after mul
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inst: Long = new Long(Long.MIN_VALUE);
      const result: Long = inst.mul(new Long(2));
      expect(result.toLong()).assertEqual(0);
      expect(inst.toLong()).assertEqual(Long.MIN_VALUE);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_8200
     * @tc.name testLongProperty1Part2_082
     * @tc.desc Verify Long.MAX_VALUE instance immutability after div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inst: Long = new Long(Long.MAX_VALUE);
      const result: Long = inst.div(new Long(2));
      expect(result.toLong()).assertEqual(4611686018427387903);
      expect(inst.toLong()).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART2_8300
     * @tc.name testLongProperty1Part2_083
     * @tc.desc Verify Long.MIN_VALUE plus ten minus ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part2_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MIN_VALUE).add(new Long(10)).sub(new Long(10));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE);
    });
  });
}
