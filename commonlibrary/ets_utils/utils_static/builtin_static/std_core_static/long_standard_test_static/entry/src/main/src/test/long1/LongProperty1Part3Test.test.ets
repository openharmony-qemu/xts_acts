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

export default function longProperty1Part3Test(): void {
  describe('LongProperty1Part3Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_0100
     * @tc.name testLongProperty1Part3_001
     * @tc.desc Verify Long.MAX_VALUE minus ten plus ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).sub(new Long(10)).add(new Long(10));
      expect(result.toLong()).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_0200
     * @tc.name testLongProperty1Part3_002
     * @tc.desc Verify Long.MIN_VALUE times two plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MIN_VALUE).mul(new Long(2)).add(new Long(1));
      expect(result.toLong()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_0300
     * @tc.name testLongProperty1Part3_003
     * @tc.desc Verify Long.MAX_VALUE plus one times one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).add(new Long(1)).mul(new Long(1));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_0400
     * @tc.name testLongProperty1Part3_004
     * @tc.desc Verify Long.MIN_VALUE plus Long.MAX_VALUE plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MIN_VALUE).add(new Long(Long.MAX_VALUE)).add(new Long(1));
      expect(result.toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_0500
     * @tc.name testLongProperty1Part3_005
     * @tc.desc Verify Long.MAX_VALUE plus Long.MIN_VALUE minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).add(new Long(Long.MIN_VALUE)).sub(new Long(1));
      expect(result.toLong()).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_0600
     * @tc.name testLongProperty1Part3_006
     * @tc.desc Verify Long.MIN_VALUE times two plus Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MIN_VALUE).mul(new Long(2)).add(new Long(Long.MAX_VALUE));
      expect(result.toLong()).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_0700
     * @tc.name testLongProperty1Part3_007
     * @tc.desc Verify Long.MAX_VALUE times two minus Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).mul(new Long(2)).sub(new Long(Long.MIN_VALUE));
      expect(result.toLong()).assertEqual(9223372036854775806);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_0800
     * @tc.name testLongProperty1Part3_008
     * @tc.desc Verify Long.MIN_VALUE divided by negative one plus Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MIN_VALUE).div(new Long(-1)).add(new Long(Long.MAX_VALUE));
      expect(result.toLong()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_0900
     * @tc.name testLongProperty1Part3_009
     * @tc.desc Verify Long.BIT_SIZE times two plus Long.BYTE_SIZE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.BIT_SIZE).mul(new Long(2)).add(new Long(Long.BYTE_SIZE));
      expect(result.toLong()).assertEqual(136);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_1000
     * @tc.name testLongProperty1Part3_010
     * @tc.desc Verify Long.BYTE_SIZE times eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.BYTE_SIZE).mul(new Long(8));
      const bits: Long = new Long(Long.BIT_SIZE);
      expect(result.equals(bits)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_1100
     * @tc.name testLongProperty1Part3_011
     * @tc.desc Verify Long.MIN_VALUE plus one wraps to minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Long = new Long(Long.MIN_VALUE).add(new Long(1));
      const outer: Long = inner.add(new Long(-1));
      expect(outer.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_1200
     * @tc.name testLongProperty1Part3_012
     * @tc.desc Verify Long.MAX_VALUE minus one wraps to maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Long = new Long(Long.MAX_VALUE).sub(new Long(1));
      const outer: Long = inner.sub(new Long(-1));
      expect(outer.toLong()).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_1300
     * @tc.name testLongProperty1Part3_013
     * @tc.desc Verify Long.MIN_VALUE plus Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MIN_VALUE).add(new Long(Long.MAX_VALUE));
      expect(result.toLong()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_1400
     * @tc.name testLongProperty1Part3_014
     * @tc.desc Verify Long.MAX_VALUE plus one wraps to minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).add(new Long(1));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_1500
     * @tc.name testLongProperty1Part3_015
     * @tc.desc Verify Long.MAX_VALUE plus negative one yields exact long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).add(new Long(-1));
      expect(result.toLong()).assertEqual(9223372036854775806);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_1600
     * @tc.name testLongProperty1Part3_016
     * @tc.desc Verify zero plus Long.MIN_VALUE wraps to minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(0).add(new Long(Long.MIN_VALUE));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_1700
     * @tc.name testLongProperty1Part3_017
     * @tc.desc Verify zero plus Long.MAX_VALUE wraps to maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(0).add(new Long(Long.MAX_VALUE));
      expect(result.toLong()).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_1800
     * @tc.name testLongProperty1Part3_018
     * @tc.desc Verify Long.MAX_VALUE minus negative one wraps to minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).sub(new Long(-1));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_1900
     * @tc.name testLongProperty1Part3_019
     * @tc.desc Verify Long.MAX_VALUE minus Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).sub(new Long(Long.MIN_VALUE));
      expect(result.toLong()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_2000
     * @tc.name testLongProperty1Part3_020
     * @tc.desc Verify zero minus Long.MIN_VALUE wraps to minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(0).sub(new Long(Long.MIN_VALUE));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_2100
     * @tc.name testLongProperty1Part3_021
     * @tc.desc Verify Long.MIN_VALUE times negative one wraps to minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MIN_VALUE).mul(new Long(-1));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_2200
     * @tc.name testLongProperty1Part3_022
     * @tc.desc Verify Long.MAX_VALUE times negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).mul(new Long(-1));
      expect(result.toLong()).assertEqual(-9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_2300
     * @tc.name testLongProperty1Part3_023
     * @tc.desc Verify Long.MAX_VALUE times zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MAX_VALUE).mul(new Long(0));
      expect(result.toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_2400
     * @tc.name testLongProperty1Part3_024
     * @tc.desc Verify Long.MIN_VALUE times one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(Long.MIN_VALUE).mul(new Long(1));
      expect(result.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_2500
     * @tc.name testLongProperty1Part3_025
     * @tc.desc Verify zero divided by negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(0).div(new Long(-1));
      expect(result.toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_2600
     * @tc.name testLongProperty1Part3_026
     * @tc.desc Verify Long.MAX_VALUE converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: byte = Long.toByte(Long.MAX_VALUE);
      expect(b).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_2700
     * @tc.name testLongProperty1Part3_027
     * @tc.desc Verify Long.BIT_SIZE converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: byte = Long.toByte(Long.BIT_SIZE);
      expect(b).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_2800
     * @tc.name testLongProperty1Part3_028
     * @tc.desc Verify Long.BYTE_SIZE converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: byte = Long.toByte(Long.BYTE_SIZE);
      expect(b).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_2900
     * @tc.name testLongProperty1Part3_029
     * @tc.desc Verify negative one hundred twenty-nine converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: byte = Long.toByte(-129);
      expect(b).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_3000
     * @tc.name testLongProperty1Part3_030
     * @tc.desc Verify one hundred twenty-eight converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: byte = Long.toByte(128);
      expect(b).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_3100
     * @tc.name testLongProperty1Part3_031
     * @tc.desc Verify Long.MIN_VALUE converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: short = Long.toShort(Long.MIN_VALUE);
      expect(s).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_3200
     * @tc.name testLongProperty1Part3_032
     * @tc.desc Verify Long.MAX_VALUE converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: short = Long.toShort(Long.MAX_VALUE);
      expect(s).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_3300
     * @tc.name testLongProperty1Part3_033
     * @tc.desc Verify negative thirty-two thousand seven hundred sixty-nine converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: short = Long.toShort(-32769);
      expect(s).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_3400
     * @tc.name testLongProperty1Part3_034
     * @tc.desc Verify thirty-two thousand seven hundred sixty-eight converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: short = Long.toShort(32768);
      expect(s).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_3500
     * @tc.name testLongProperty1Part3_035
     * @tc.desc Verify -2147483649 converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i: int = Long.toInt(-2147483649);
      expect(i).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_3600
     * @tc.name testLongProperty1Part3_036
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-eight converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i: int = Long.toInt(2147483648);
      expect(i).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_3700
     * @tc.name testLongProperty1Part3_037
     * @tc.desc Verify Long.MAX_VALUE converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: float = Long.toFloat(Long.MAX_VALUE);
      expect(f).assertEqual(9223372036854775807f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_3800
     * @tc.name testLongProperty1Part3_038
     * @tc.desc Verify Long.MAX_VALUE converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: double = Long.toDouble(Long.MAX_VALUE);
      expect(d).assertEqual(9.223372036854776e18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_3900
     * @tc.name testLongProperty1Part3_039
     * @tc.desc Verify Long.MIN_VALUE converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: char = Long.toChar(Long.MIN_VALUE);
      expect(c.toString()).assertEqual("\x00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_4000
     * @tc.name testLongProperty1Part3_040
     * @tc.desc Verify Long.MAX_VALUE converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: char = Long.toChar(Long.MAX_VALUE);
      expect(c.toString()).assertEqual("￿");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_4100
     * @tc.name testLongProperty1Part3_041
     * @tc.desc Verify Long.MAX_VALUE converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MAX_VALUE);
      expect(v.toInt()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_4200
     * @tc.name testLongProperty1Part3_042
     * @tc.desc Verify Long.MIN_VALUE compared equal to Long.MIN_VALUE returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MIN_VALUE);
      const b: Long = new Long(Long.MIN_VALUE);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_4300
     * @tc.name testLongProperty1Part3_043
     * @tc.desc Verify Long.MIN_VALUE compared equal to Long.MAX_VALUE returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MIN_VALUE);
      const b: Long = new Long(Long.MAX_VALUE);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_4400
     * @tc.name testLongProperty1Part3_044
     * @tc.desc Verify Long.MIN_VALUE compared equal to zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      expect(v.equals(new Long(0))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_4500
     * @tc.name testLongProperty1Part3_045
     * @tc.desc Verify Long value ordered equal to Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      expect(v.compareTo(new Long(Long.MIN_VALUE))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_4600
     * @tc.name testLongProperty1Part3_046
     * @tc.desc Verify Long value ordered before zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      expect(v.compareTo(new Long(0))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_4700
     * @tc.name testLongProperty1Part3_047
     * @tc.desc Verify Long value ordered after zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MAX_VALUE);
      expect(v.compareTo(new Long(0))).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_4800
     * @tc.name testLongProperty1Part3_048
     * @tc.desc Verify Long.MIN_VALUE is less than Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min: Long = new Long(Long.MIN_VALUE);
      const max: Long = new Long(Long.MAX_VALUE);
      expect(min.isLessThan(max)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_4900
     * @tc.name testLongProperty1Part3_049
     * @tc.desc Verify Long.MAX_VALUE is less than Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min: Long = new Long(Long.MIN_VALUE);
      const max: Long = new Long(Long.MAX_VALUE);
      expect(max.isLessThan(min)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_5000
     * @tc.name testLongProperty1Part3_050
     * @tc.desc Verify Long.MIN_VALUE is less than Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      expect(v.isLessThan(v)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_5100
     * @tc.name testLongProperty1Part3_051
     * @tc.desc Verify Long.MAX_VALUE is greater than Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min: Long = new Long(Long.MIN_VALUE);
      const max: Long = new Long(Long.MAX_VALUE);
      expect(max.isGreaterThan(min)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_5200
     * @tc.name testLongProperty1Part3_052
     * @tc.desc Verify Long.MIN_VALUE is greater than Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min: Long = new Long(Long.MIN_VALUE);
      const max: Long = new Long(Long.MAX_VALUE);
      expect(min.isGreaterThan(max)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_5300
     * @tc.name testLongProperty1Part3_053
     * @tc.desc Verify Long.MAX_VALUE is greater than Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MAX_VALUE);
      expect(v.isGreaterThan(v)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_5400
     * @tc.name testLongProperty1Part3_054
     * @tc.desc Verify Long.MIN_VALUE is less than or equal to Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      expect(v.isLessEqualThan(v)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_5500
     * @tc.name testLongProperty1Part3_055
     * @tc.desc Verify Long.MAX_VALUE is greater than or equal to Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MAX_VALUE);
      expect(v.isGreaterEqualThan(v)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_5600
     * @tc.name testLongProperty1Part3_056
     * @tc.desc Verify Long.MIN_VALUE string representation in base-36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      const s: string = v.toString(36);
      expect(s).assertEqual('-1y2p0ij32e8e8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_5700
     * @tc.name testLongProperty1Part3_057
     * @tc.desc Verify Long.MAX_VALUE string representation in base-36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MAX_VALUE);
      const s: string = v.toString(36);
      expect(s).assertEqual('1y2p0ij32e8e7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_5800
     * @tc.name testLongProperty1Part3_058
     * @tc.desc Verify Long.BIT_SIZE string representation in binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.BIT_SIZE);
      const bin: string = v.toString(2);
      expect(bin).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_5900
     * @tc.name testLongProperty1Part3_059
     * @tc.desc Verify Long.BYTE_SIZE string representation in hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.BYTE_SIZE);
      const hex: string = v.toString(16);
      expect(hex).assertEqual('8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_6000
     * @tc.name testLongProperty1Part3_060
     * @tc.desc Verify -0x8000000000000000 string parsed as Long in hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = Long.parseInt('-0x8000000000000000', 16);
      expect(v).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_6100
     * @tc.name testLongProperty1Part3_061
     * @tc.desc Verify 9223372036854775807 string parsed as Long in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = Long.parseInt('9223372036854775807', 10);
      expect(v).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PROPERTY_PART3_6200
     * @tc.name testLongProperty1Part3_062
     * @tc.desc Verify 7fffffffffffffff string parsed as Long in hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongProperty1Part3_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = Long.parseInt('7fffffffffffffff', 16);
      expect(v).assertEqual(Long.MAX_VALUE);
    });
  });
}
