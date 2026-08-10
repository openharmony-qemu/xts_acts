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

export default function longOverall1Part4Test(): void {
  describe('LongOverall1Part4Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0010
     * @tc.name testLongOverall1Part4_001
     * @tc.desc Verify ff string parsed as Long in hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: long = Long.parseInt("ff", 16);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0020
     * @tc.name testLongOverall1Part4_002
     * @tc.desc Verify 1010 string parsed as Long in binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: long = Long.parseInt("1010", 2);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0030
     * @tc.name testLongOverall1Part4_003
     * @tc.desc Verify overflowing hexadecimal string parsed as Long throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: String = '9223372036854775807';
      try {
        const r: long = Long.parseInt(s, 16);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0040
     * @tc.name testLongOverall1Part4_004
     * @tc.desc Verify negative hexadecimal string parsed as Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: String = '-0x8000000000000000';
      const r: long = Long.parseInt(s, 16);
      expect(r).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0050
     * @tc.name testLongOverall1Part4_005
     * @tc.desc Verify Long 42 compared equal to Long 42 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(42);
      const b: Long = new Long(42);
      const eq: boolean = a.equals(b);
      expect(a.toLong()).assertEqual(42);
      expect(b.toLong()).assertEqual(42);
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0060
     * @tc.name testLongOverall1Part4_006
     * @tc.desc Verify Long 1234567 localized as string for English locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(1234567);
      const s: String = v.toLocaleString('en-US');
      expect(v.toLong()).assertEqual(1234567);
      expect(s).assertEqual('1,234,567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0070
     * @tc.name testLongOverall1Part4_007
     * @tc.desc Verify Long 1234567 localized as string for Chinese locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(1234567);
      const s: String = v.toLocaleString('zh-CN');
      expect(v.toLong()).assertEqual(1234567);
      expect(s).assertEqual('1,234,567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0080
     * @tc.name testLongOverall1Part4_008
     * @tc.desc Verify Long 1234567 localized as string for German locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(1234567);
      const s: String = v.toLocaleString('de-DE');
      expect(v.toLong()).assertEqual(1234567);
      expect(s).assertEqual('1.234.567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0090
     * @tc.name testLongOverall1Part4_009
     * @tc.desc Verify Long 12345 localized as string for English locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(12345);
      const s: String = v.toLocaleString('en-US', {});
      expect(v.toLong()).assertEqual(12345);
      expect(s).assertEqual('12,345');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0100
     * @tc.name testLongOverall1Part4_010
     * @tc.desc Verify 12345 converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(12345);
      const options: object = new Object();
      const s: String = v.toLocaleString('en-US', options);
      expect(v.toLong()).assertEqual(12345);
      expect(s).assertEqual('12,345');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0110
     * @tc.name testLongOverall1Part4_011
     * @tc.desc Verify Long.MAX_VALUE localized as string for English locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MAX_VALUE);
      const s: String = v.toLocaleString('en-US');
      expect(s).assertEqual('9,223,372,036,854,775,807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0120
     * @tc.name testLongOverall1Part4_012
     * @tc.desc Verify Long value localized as string for English locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      const s: String = v.toLocaleString('en-US');
      expect(s).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0130
     * @tc.name testLongOverall1Part4_013
     * @tc.desc Verify positive value plus ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(120);
      const b: Long = new Long(10);
      const sum: Long = a.add(b);
      expect(sum.toByte()).assertEqual(-126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0140
     * @tc.name testLongOverall1Part4_014
     * @tc.desc Verify sixteen times sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(16);
      const b: Long = new Long(16);
      const prod: Long = a.mul(b);
      const s: string = prod.toString(16);
      expect(s).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0150
     * @tc.name testLongOverall1Part4_015
     * @tc.desc Verify one hundred minus positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(100);
      const b: Long = new Long(30);
      const diff: Long = a.sub(b);
      const c: Long = new Long(70);
      expect(diff.compareTo(c)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0160
     * @tc.name testLongOverall1Part4_016
     * @tc.desc Verify hexadecimal string round-trips through toString and parseInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(255);
      const hex: string = v.toString(16);
      const parsed: long = Long.parseInt(hex, 16);
      expect(parsed).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0170
     * @tc.name testLongOverall1Part4_017
     * @tc.desc Verify Long.MAX_VALUE plus negative one yields approximate float value converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MAX_VALUE);
      const b: Long = new Long(-1);
      const sum: Long = a.add(b);
      expect(sum.toFloat()).assertEqual(9.223372036854776e18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0180
     * @tc.name testLongOverall1Part4_018
     * @tc.desc Verify Long.MAX_VALUE plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MAX_VALUE);
      const b: Long = new Long(1);
      const overflow: Long = a.add(b);
      expect(overflow.toByte()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0190
     * @tc.name testLongOverall1Part4_019
     * @tc.desc Verify add-mul-div round trip preserves ten billion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(10000000000);
      const b: Long = a.add(new Long(1));
      const c: Long = b.mul(new Long(2));
      expect(c.toLong() / 2 - 1).assertEqual(10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0200
     * @tc.name testLongOverall1Part4_020
     * @tc.desc Verify positive value converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(42);
      expect(v.toLong()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0210
     * @tc.name testLongOverall1Part4_021
     * @tc.desc Verify zero converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      expect(v.toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0220
     * @tc.name testLongOverall1Part4_022
     * @tc.desc Verify negative one converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-1);
      expect(v.toLong()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0230
     * @tc.name testLongOverall1Part4_023
     * @tc.desc Verify ten billion converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(10000000000);
      expect(result).assertEqual(10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0240
     * @tc.name testLongOverall1Part4_024
     * @tc.desc Verify Long.MAX_VALUE converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(Long.MAX_VALUE);
      expect(result).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0250
     * @tc.name testLongOverall1Part4_025
     * @tc.desc Verify Long.MIN_VALUE converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.toLong(Long.MIN_VALUE);
      expect(result).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0260
     * @tc.name testLongOverall1Part4_026
     * @tc.desc Verify negative one hundred twenty-eight converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-128);
      expect(v.toLong()).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0270
     * @tc.name testLongOverall1Part4_027
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(2147483647);
      expect(v.toLong()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0280
     * @tc.name testLongOverall1Part4_028
     * @tc.desc Verify maximum boundary converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      expect(v.toLong()).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0290
     * @tc.name testLongOverall1Part4_029
     * @tc.desc Verify one hundred twenty-seven converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(127);
      expect(v.toLong()).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0300
     * @tc.name testLongOverall1Part4_030
     * @tc.desc Verify -2147483648 converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-2147483648);
      expect(v.toLong()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0310
     * @tc.name testLongOverall1Part4_031
     * @tc.desc Verify zero converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      const r: byte = v.toByte();
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0320
     * @tc.name testLongOverall1Part4_032
     * @tc.desc Verify negative one hundred twenty-eight converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-128);
      const r: byte = v.toByte();
      expect(r).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0330
     * @tc.name testLongOverall1Part4_033
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(2147483647);
      const r: byte = v.toByte();
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0340
     * @tc.name testLongOverall1Part4_034
     * @tc.desc Verify maximum boundary converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      const r: byte = v.toByte();
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0350
     * @tc.name testLongOverall1Part4_035
     * @tc.desc Verify Long.MIN_VALUE converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      const r: byte = v.toByte();
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0360
     * @tc.name testLongOverall1Part4_036
     * @tc.desc Verify negative one converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-1);
      const r: byte = v.toByte();
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0370
     * @tc.name testLongOverall1Part4_037
     * @tc.desc Verify zero converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      const r: short = v.toShort();
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0380
     * @tc.name testLongOverall1Part4_038
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(2147483647);
      const r: short = v.toShort();
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0390
     * @tc.name testLongOverall1Part4_039
     * @tc.desc Verify negative one hundred twenty-eight converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-128);
      const r: short = v.toShort();
      expect(r).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0400
     * @tc.name testLongOverall1Part4_040
     * @tc.desc Verify maximum boundary converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      const r: short = v.toShort();
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0410
     * @tc.name testLongOverall1Part4_041
     * @tc.desc Verify zero converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      const r: int = v.toInt();
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0420
     * @tc.name testLongOverall1Part4_042
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(2147483647);
      const r: int = v.toInt();
      expect(r).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0430
     * @tc.name testLongOverall1Part4_043
     * @tc.desc Verify maximum boundary converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      const r: int = v.toInt();
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0440
     * @tc.name testLongOverall1Part4_044
     * @tc.desc Verify zero converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      const r: float = v.toFloat();
      expect(r).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0450
     * @tc.name testLongOverall1Part4_045
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(2147483647);
      const r: float = v.toFloat();
      expect(r).assertEqual(2147483648.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0460
     * @tc.name testLongOverall1Part4_046
     * @tc.desc Verify maximum boundary converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      const r: float = v.toFloat();
      expect(r).assertEqual(9.223372036854776e18f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0470
     * @tc.name testLongOverall1Part4_047
     * @tc.desc Verify zero converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      const r: double = v.toDouble();
      expect(r).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0480
     * @tc.name testLongOverall1Part4_048
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(2147483647);
      const r: double = v.toDouble();
      expect(r).assertEqual(2147483647.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0490
     * @tc.name testLongOverall1Part4_049
     * @tc.desc Verify maximum boundary converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      const r: double = v.toDouble();
      expect(r).assertEqual(9.223372036854776e18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0500
     * @tc.name testLongOverall1Part4_050
     * @tc.desc Verify zero converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      const r: char = v.toChar();
      expect(r.toString()).assertEqual("\0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0510
     * @tc.name testLongOverall1Part4_051
     * @tc.desc Verify positive value converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(65);
      const r: char = v.toChar();
      expect(r.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0520
     * @tc.name testLongOverall1Part4_052
     * @tc.desc Verify 0x4E2D converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0x4E2D);
      const r: char = v.toChar();
      expect(r.toString()).assertEqual("中");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0530
     * @tc.name testLongOverall1Part4_053
     * @tc.desc Verify maximum boundary converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      const r: string = v.toChar().toString();
      expect(r).assertEqual('￿');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0540
     * @tc.name testLongOverall1Part4_054
     * @tc.desc Verify zero ordered equal to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(0);
      expect(a.compareTo(b)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0550
     * @tc.name testLongOverall1Part4_055
     * @tc.desc Verify zero ordered before two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(2147483647);
      expect(a.compareTo(b)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0560
     * @tc.name testLongOverall1Part4_056
     * @tc.desc Verify compareTo returns 1 comparing two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483647);
      const b: Long = new Long(0);
      expect(a.compareTo(b)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0570
     * @tc.name testLongOverall1Part4_057
     * @tc.desc Verify zero ordered after negative one hundred twenty-eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(-128);
      expect(a.compareTo(b)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0580
     * @tc.name testLongOverall1Part4_058
     * @tc.desc Verify maximum boundary ordered after Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(9223372036854775807);
      const b: Long = new Long(Long.MIN_VALUE);
      expect(a.compareTo(b)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0590
     * @tc.name testLongOverall1Part4_059
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven ordered equal to two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483647);
      const b: Long = new Long(2147483647);
      expect(a.compareTo(b)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0600
     * @tc.name testLongOverall1Part4_060
     * @tc.desc Verify negative one ordered before zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(-1);
      const b: Long = new Long(0);
      expect(a.compareTo(b)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0610
     * @tc.name testLongOverall1Part4_061
     * @tc.desc Verify zero decimal string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      expect(v.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0620
     * @tc.name testLongOverall1Part4_062
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven decimal string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(2147483647);
      expect(v.toString()).assertEqual("2147483647");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0630
     * @tc.name testLongOverall1Part4_063
     * @tc.desc Verify negative one hundred twenty-eight decimal string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-128);
      expect(v.toString()).assertEqual("-128");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0640
     * @tc.name testLongOverall1Part4_064
     * @tc.desc Verify ten string representation in binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(10);
      expect(v.toString(2)).assertEqual("1010");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0650
     * @tc.name testLongOverall1Part4_065
     * @tc.desc Verify zero string representation in binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      expect(v.toString(2)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0660
     * @tc.name testLongOverall1Part4_066
     * @tc.desc Verify ten billion string representation in binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(10000000000);
      const r: string = v.toString(2);
      expect(r.length).assertEqual(34);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0670
     * @tc.name testLongOverall1Part4_067
     * @tc.desc Verify two hundred fifty-five string representation in hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(255);
      expect(v.toString(16)).assertEqual("ff");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0680
     * @tc.name testLongOverall1Part4_068
     * @tc.desc Verify positive value string representation in base-36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(35);
      expect(v.toString(36)).assertEqual("z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0690
     * @tc.name testLongOverall1Part4_069
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven string representation in base-0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(2147483647);
      try {
        v.toString(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0700
     * @tc.name testLongOverall1Part4_070
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven string representation in binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(2147483647);
      const r: string = v.toString(2);
      expect(r.length).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0710
     * @tc.name testLongOverall1Part4_071
     * @tc.desc Verify ten string representation in octal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(10);
      expect(v.toString(8)).assertEqual("12");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0720
     * @tc.name testLongOverall1Part4_072
     * @tc.desc Verify maximum boundary decimal string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toString(9223372036854775807)).assertEqual("9223372036854775807");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0730
     * @tc.name testLongOverall1Part4_073
     * @tc.desc Verify negative one decimal string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toString(-1)).assertEqual("-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0740
     * @tc.name testLongOverall1Part4_074
     * @tc.desc Verify ten billion decimal string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toString(10000000000)).assertEqual("10000000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0750
     * @tc.name testLongOverall1Part4_075
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven compared equal to two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483647);
      const b: Long = new Long(2147483647);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0760
     * @tc.name testLongOverall1Part4_076
     * @tc.desc Verify zero compared equal to two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(2147483647);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0770
     * @tc.name testLongOverall1Part4_077
     * @tc.desc Verify Long 42 compared to string forty-two returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(42);
      expect(v.equals("42")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0780
     * @tc.name testLongOverall1Part4_078
     * @tc.desc Verify Long 42 compared to primitive forty-two returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(42);
      expect(v.equals(42)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0790
     * @tc.name testLongOverall1Part4_079
     * @tc.desc Verify negative one hundred twenty-eight compared equal to negative one hundred twenty-eight returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(-128);
      const b: Long = new Long(-128);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0800
     * @tc.name testLongOverall1Part4_080
     * @tc.desc Verify maximum boundary compared equal to Long.MAX_VALUE returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      const w: Long = new Long(Long.MAX_VALUE);
      expect(v.equals(w)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0810
     * @tc.name testLongOverall1Part4_081
     * @tc.desc Verify ten billion compared equal to ten billion returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(10000000000);
      const w: Long = new Long(10000000000);
      expect(v.equals(w)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0820
     * @tc.name testLongOverall1Part4_082
     * @tc.desc Verify Long value localized as string for Chinese locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(2147483647);
      const r: String = v.toLocaleString('zh-CN', {useGrouping: false});
      expect(r).assertEqual("2147483647");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0830
     * @tc.name testLongOverall1Part4_083
     * @tc.desc Verify zero plus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(0);
      expect(a.add(b).toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0840
     * @tc.name testLongOverall1Part4_084
     * @tc.desc Verify zero plus two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(2147483647);
      expect(a.add(b).toLong()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0850
     * @tc.name testLongOverall1Part4_085
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven plus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483647);
      const b: Long = new Long(0);
      expect(a.add(b).toLong()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0860
     * @tc.name testLongOverall1Part4_086
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven plus negative one hundred twenty-eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483647);
      const b: Long = new Long(-128);
      expect(a.add(b).toLong()).assertEqual(2147483519);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0870
     * @tc.name testLongOverall1Part4_087
     * @tc.desc Verify maximum boundary plus one wraps to minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(9223372036854775807);
      const one: Long = new Long(1);
      expect(a.add(one).toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0880
     * @tc.name testLongOverall1Part4_088
     * @tc.desc Verify Long.MIN_VALUE plus negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MIN_VALUE);
      const negOne: Long = new Long(-1);
      expect(a.add(negOne).toLong()).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0890
     * @tc.name testLongOverall1Part4_089
     * @tc.desc Verify ten billion plus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(10000000000);
      const b: Long = new Long(0);
      expect(a.add(b).toLong()).assertEqual(10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0900
     * @tc.name testLongOverall1Part4_090
     * @tc.desc Verify zero minus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(0);
      expect(a.sub(b).toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0910
     * @tc.name testLongOverall1Part4_091
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven minus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483647);
      const b: Long = new Long(0);
      expect(a.sub(b).toLong()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0920
     * @tc.name testLongOverall1Part4_092
     * @tc.desc Verify zero minus two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(2147483647);
      expect(a.sub(b).toLong()).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0930
     * @tc.name testLongOverall1Part4_093
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven minus negative one hundred twenty-eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483647);
      const b: Long = new Long(-128);
      expect(a.sub(b).toLong()).assertEqual(2147483775);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0940
     * @tc.name testLongOverall1Part4_094
     * @tc.desc Verify Long.MIN_VALUE minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(Long.MIN_VALUE);
      const one: Long = new Long(1);
      expect(a.sub(one).toLong()).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0950
     * @tc.name testLongOverall1Part4_095
     * @tc.desc Verify maximum boundary minus negative one wraps to minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(9223372036854775807);
      const negOne: Long = new Long(-1);
      expect(a.sub(negOne).toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0960
     * @tc.name testLongOverall1Part4_096
     * @tc.desc Verify zero times two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(2147483647);
      expect(a.mul(b).toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0970
     * @tc.name testLongOverall1Part4_097
     * @tc.desc Verify one hundred thousand times twenty thousand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(100000);
      const b: Long = new Long(20000);
      expect(a.mul(b).toLong()).assertEqual(2000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0980
     * @tc.name testLongOverall1Part4_098
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven times negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483647);
      const b: Long = new Long(-1);
      expect(a.mul(b).toLong()).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_0990
     * @tc.name testLongOverall1Part4_099
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven times two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483647);
      const b: Long = new Long(2147483647);
      const r: long = a.mul(b).toLong();
      expect(r).assertEqual(4611686014132420609);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_1000
     * @tc.name testLongOverall1Part4_100
     * @tc.desc Verify negative one times Long.MIN_VALUE wraps to minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(-1);
      const b: Long = new Long(Long.MIN_VALUE);
      expect(a.mul(b).toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_1010
     * @tc.name testLongOverall1Part4_101
     * @tc.desc Verify zero divided by two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(2147483647);
      expect(a.div(b).toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_1020
     * @tc.name testLongOverall1Part4_102
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven divided by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483647);
      const b: Long = new Long(1);
      expect(a.div(b).toLong()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_1030
     * @tc.name testLongOverall1Part4_103
     * @tc.desc Verify maximum boundary divided by two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(9223372036854775807);
      const two: Long = new Long(2);
      expect(a.div(two).toLong()).assertEqual(4611686018427387903);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_1040
     * @tc.name testLongOverall1Part4_104
     * @tc.desc Verify negative one hundred twenty-eight divided by ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(-128);
      const b: Long = new Long(10);
      expect(a.div(b).toLong()).assertEqual(-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_1050
     * @tc.name testLongOverall1Part4_105
     * @tc.desc Verify zero is less than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(0);
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_1060
     * @tc.name testLongOverall1Part4_106
     * @tc.desc Verify zero is less than two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(2147483647);
      expect(a.isLessThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_1070
     * @tc.name testLongOverall1Part4_107
     * @tc.desc Verify two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven is less than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(2147483647);
      const b: Long = new Long(0);
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_1080
     * @tc.name testLongOverall1Part4_108
     * @tc.desc Verify zero is less than or equal to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(0);
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART4_1090
     * @tc.name testLongOverall1Part4_109
     * @tc.desc Verify zero is less than or equal to two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part4_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Long = new Long(0);
      const b: Long = new Long(2147483647);
      expect(a.isLessEqualThan(b)).assertTrue();
    });
  });
}
