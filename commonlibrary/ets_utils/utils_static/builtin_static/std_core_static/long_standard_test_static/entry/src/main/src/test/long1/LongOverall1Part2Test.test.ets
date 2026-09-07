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

export default function longOverall1Part2Test(): void {
  describe('LongOverall1Part2Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0010
     * @tc.name testLongOverall1Part2_001
     * @tc.desc Verify toLong() converts Long.MIN_VALUE extreme boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(Long.MIN_VALUE);
      expect(l.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0020
     * @tc.name testLongOverall1Part2_002
     * @tc.desc Verify toLong() converts negative small value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(-1);
      expect(l.toLong()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0030
     * @tc.name testLongOverall1Part2_003
     * @tc.desc Verify toLong() converts short minimum boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(-32768);
      expect(l.toLong()).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0040
     * @tc.name testLongOverall1Part2_004
     * @tc.desc Verify toFloat() converts small positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(42);
      expect(l.toFloat()).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0050
     * @tc.name testLongOverall1Part2_005
     * @tc.desc Verify toFloat() converts short minimum boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(-32768);
      expect(l.toFloat()).assertEqual(-32768.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0060
     * @tc.name testLongOverall1Part2_006
     * @tc.desc Verify toFloat() converts zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(0);
      expect(l.toFloat()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0070
     * @tc.name testLongOverall1Part2_007
     * @tc.desc Verify toFloat() converts Long.MIN_VALUE extreme boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(Long.MIN_VALUE);
      expect(l.toFloat()).assertClose(-9.223372036854776e18, 1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0080
     * @tc.name testLongOverall1Part2_008
     * @tc.desc Verify toFloat() converts negative small value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(-1);
      expect(l.toFloat()).assertClose(-1.0, 1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0090
     * @tc.name testLongOverall1Part2_009
     * @tc.desc Verify toDouble() converts small positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(42);
      expect(l.toDouble()).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0100
     * @tc.name testLongOverall1Part2_010
     * @tc.desc Verify toDouble() converts short minimum boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(-32768);
      expect(l.toDouble()).assertEqual(-32768.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0110
     * @tc.name testLongOverall1Part2_011
     * @tc.desc Verify toDouble() converts zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(0);
      expect(l.toDouble()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0120
     * @tc.name testLongOverall1Part2_012
     * @tc.desc Verify toDouble() converts Long.MIN_VALUE extreme boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(Long.MIN_VALUE);
      expect(l.toDouble()).assertClose(-9.223372036854776e18, 1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0130
     * @tc.name testLongOverall1Part2_013
     * @tc.desc Verify toDouble() converts negative small value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(-1);
      expect(l.toDouble()).assertClose(-1.0, 1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0140
     * @tc.name testLongOverall1Part2_014
     * @tc.desc Verify toChar() converts ASCII printable value to character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(65);
      expect(l.toChar().toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0150
     * @tc.name testLongOverall1Part2_015
     * @tc.desc Verify toChar() converts zero value to null character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(0);
      expect(l.toChar().toString()).assertEqual("\0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0160
     * @tc.name testLongOverall1Part2_016
     * @tc.desc Verify toChar() converts 16-bit boundary maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(65535);
      expect(l.toChar().toString()).assertEqual("\uFFFF");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0170
     * @tc.name testLongOverall1Part2_017
     * @tc.desc Verify toChar() wraps value beyond 16-bit range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(65536);
      expect(l.toChar().toString()).assertEqual("\0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0180
     * @tc.name testLongOverall1Part2_018
     * @tc.desc Verify toChar() converts negative value with wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(-1);
      expect(l.toChar().toString()).assertEqual("\uFFFF");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0190
     * @tc.name testLongOverall1Part2_019
     * @tc.desc Verify Long.toByte() converts byte maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toByte(127)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0200
     * @tc.name testLongOverall1Part2_020
     * @tc.desc Verify Long.toByte() converts byte minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toByte(-128)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0210
     * @tc.name testLongOverall1Part2_021
     * @tc.desc Verify Long.toByte() wraps overflow beyond byte maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toByte(128)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0220
     * @tc.name testLongOverall1Part2_022
     * @tc.desc Verify Long.toByte() wraps value beyond byte range to negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toByte(255)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0230
     * @tc.name testLongOverall1Part2_023
     * @tc.desc Verify Long.toByte() truncates Long.MIN_VALUE to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toByte(Long.MIN_VALUE)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0240
     * @tc.name testLongOverall1Part2_024
     * @tc.desc Verify Long.toByte() converts negative small value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toByte(-1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0250
     * @tc.name testLongOverall1Part2_025
     * @tc.desc Verify Long.toShort() converts short maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(32767)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0260
     * @tc.name testLongOverall1Part2_026
     * @tc.desc Verify Long.toShort() wraps overflow beyond short maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(32768)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0270
     * @tc.name testLongOverall1Part2_027
     * @tc.desc Verify Long.toShort() wraps value beyond short range to negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(65535)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0280
     * @tc.name testLongOverall1Part2_028
     * @tc.desc Verify Long.toShort() converts short minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-32768)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0290
     * @tc.name testLongOverall1Part2_029
     * @tc.desc Verify Long.toShort() wraps negative value to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-65536)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0300
     * @tc.name testLongOverall1Part2_030
     * @tc.desc Verify Long.toInt() converts int maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toInt(2147483647)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0310
     * @tc.name testLongOverall1Part2_031
     * @tc.desc Verify Long.toInt() wraps overflow beyond int maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toInt(2147483648)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0320
     * @tc.name testLongOverall1Part2_032
     * @tc.desc Verify Long.toInt() wraps value beyond int range to negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toInt(4294967295)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0330
     * @tc.name testLongOverall1Part2_033
     * @tc.desc Verify Long.toInt() converts int minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toInt(-2147483648)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0340
     * @tc.name testLongOverall1Part2_034
     * @tc.desc Verify Long.toInt() converts negative small value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toInt(-1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0350
     * @tc.name testLongOverall1Part2_035
     * @tc.desc Verify Long.toLong() converts small positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toLong(42)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0360
     * @tc.name testLongOverall1Part2_036
     * @tc.desc Verify Long.toLong() converts Long.MIN_VALUE extreme boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toLong(Long.MIN_VALUE)).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0370
     * @tc.name testLongOverall1Part2_037
     * @tc.desc Verify Long.toFloat() converts small positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toFloat(42)).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0380
     * @tc.name testLongOverall1Part2_038
     * @tc.desc Verify Long.toFloat() converts Long.MIN_VALUE extreme boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toFloat(Long.MIN_VALUE)).assertClose(-9.223372036854776e18, 1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0390
     * @tc.name testLongOverall1Part2_039
     * @tc.desc Verify Long.toDouble() converts small positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(42)).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0400
     * @tc.name testLongOverall1Part2_040
     * @tc.desc Verify Long.toDouble() converts negative small value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(-1)).assertClose(-1.0, 1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0410
     * @tc.name testLongOverall1Part2_041
     * @tc.desc Verify Long.toChar() converts ASCII printable value to character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toChar(65).toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0420
     * @tc.name testLongOverall1Part2_042
     * @tc.desc Verify toChar() truncates large value to 16-bit character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toChar(0x7FFFFFFF).toString()).assertEqual("\uFFFF");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0430
     * @tc.name testLongOverall1Part2_043
     * @tc.desc Verify toString() converts small positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(42);
      expect(l.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0440
     * @tc.name testLongOverall1Part2_044
     * @tc.desc Verify toString() converts negative small value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(-1);
      expect(l.toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0450
     * @tc.name testLongOverall1Part2_045
     * @tc.desc Verify instance toString() converts zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(0);
      expect(l.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0460
     * @tc.name testLongOverall1Part2_046
     * @tc.desc Verify toString() converts Long.MIN_VALUE to exact string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(Long.MIN_VALUE);
      expect(l.toString()).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0470
     * @tc.name testLongOverall1Part2_047
     * @tc.desc Verify instance toString() converts Long.MAX_VALUE to exact string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(Long.MAX_VALUE);
      expect(l.toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0480
     * @tc.name testLongOverall1Part2_048
     * @tc.desc Verify Long.toString() converts small positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toString(42)).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0490
     * @tc.name testLongOverall1Part2_049
     * @tc.desc Verify Long.toString() converts Long.MIN_VALUE to exact string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toString(Long.MIN_VALUE)).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0500
     * @tc.name testLongOverall1Part2_050
     * @tc.desc Verify toString() converts value with hex radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(255);
      expect(l.toString(16)).assertEqual('ff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0510
     * @tc.name testLongOverall1Part2_051
     * @tc.desc Verify toString() converts value with binary radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(255);
      expect(l.toString(2)).assertEqual('11111111');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0520
     * @tc.name testLongOverall1Part2_052
     * @tc.desc Verify toString() converts value with base-36 radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(255);
      expect(l.toString(36)).assertEqual('73');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0530
     * @tc.name testLongOverall1Part2_053
     * @tc.desc Verify toString() throws RangeError for invalid radix zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(255);
      try {
        l.toString(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0540
     * @tc.name testLongOverall1Part2_054
     * @tc.desc Verify toString() converts negative value with hex radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(-255);
      expect(l.toString(16)).assertEqual('-ff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0550
     * @tc.name testLongOverall1Part2_055
     * @tc.desc Verify equals() returns true for equal small values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(42);
      let b: Long = new Long(42);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0560
     * @tc.name testLongOverall1Part2_056
     * @tc.desc Verify equals() returns false for different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(42);
      let b: Long = new Long(43);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0570
     * @tc.name testLongOverall1Part2_057
     * @tc.desc Verify equals() returns true for equal boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(Long.MIN_VALUE);
      let b: Long = new Long(Long.MIN_VALUE);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0580
     * @tc.name testLongOverall1Part2_058
     * @tc.desc Verify equals() returns true for equal negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(-1);
      let b: Long = new Long(-1);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0590
     * @tc.name testLongOverall1Part2_059
     * @tc.desc Verify add() does not mutate original Long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(42);
      l.add(new Long(1));
      expect(l.toByte()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0600
     * @tc.name testLongOverall1Part2_060
     * @tc.desc Verify sub() does not mutate original Long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(42);
      l.sub(new Long(1));
      expect(l.toByte()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0610
     * @tc.name testLongOverall1Part2_061
     * @tc.desc Verify mul() does not mutate original Long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(42);
      l.mul(new Long(2));
      expect(l.toByte()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0620
     * @tc.name testLongOverall1Part2_062
     * @tc.desc Verify div() does not mutate original Long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(42);
      l.div(new Long(2));
      expect(l.toByte()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0630
     * @tc.name testLongOverall1Part2_063
     * @tc.desc Verify toString() does not mutate original Long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(42);
      l.toString();
      expect(l.toByte()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0640
     * @tc.name testLongOverall1Part2_064
     * @tc.desc Verify chained add() does not mutate original Long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(0);
      l.add(new Long(1));
      l.add(new Long(2));
      expect(l.toByte()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0650
     * @tc.name testLongOverall1Part2_065
     * @tc.desc Verify add() returns sum of small positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(42);
      let r: Long = a.add(new Long(1));
      expect(r.toByte()).assertEqual(43);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0660
     * @tc.name testLongOverall1Part2_066
     * @tc.desc Verify sub() returns difference of small values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(42);
      let r: Long = a.sub(new Long(1));
      expect(r.toByte()).assertEqual(41);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0670
     * @tc.name testLongOverall1Part2_067
     * @tc.desc Verify mul() returns product of small positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(42);
      let r: Long = a.mul(new Long(2));
      expect(r.toByte()).assertEqual(84);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0680
     * @tc.name testLongOverall1Part2_068
     * @tc.desc Verify div() returns quotient of small positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(42);
      let r: Long = a.div(new Long(2));
      expect(r.toByte()).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0690
     * @tc.name testLongOverall1Part2_069
     * @tc.desc Verify add() wraps overflow at Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(Long.MAX_VALUE);
      let r: Long = a.add(new Long(1));
      expect(r.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0700
     * @tc.name testLongOverall1Part2_070
     * @tc.desc Verify sub() wraps underflow at Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(Long.MIN_VALUE);
      let r: Long = a.sub(new Long(1));
      expect(r.toLong()).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0710
     * @tc.name testLongOverall1Part2_071
     * @tc.desc Verify mul() wraps overflow at Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(Long.MAX_VALUE);
      let r: Long = a.mul(new Long(2));
      expect(r.toLong()).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0720
     * @tc.name testLongOverall1Part2_072
     * @tc.desc Verify div() returns Long.MIN_VALUE dividing by negative unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(Long.MIN_VALUE);
      let r: Long = a.div(new Long(-1));
      expect(r.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0730
     * @tc.name testLongOverall1Part2_073
     * @tc.desc Verify add() of short minimum values wraps to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(-32768);
      let r: Long = a.add(new Long(-32768));
      expect(r.toShort()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0740
     * @tc.name testLongOverall1Part2_074
     * @tc.desc Verify mul() of negative small value returns negative product
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(-1);
      let r: Long = a.mul(new Long(2));
      expect(r.toLong()).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0750
     * @tc.name testLongOverall1Part2_075
     * @tc.desc Verify isLessThan() returns false for equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(42);
      expect(a.isLessThan(new Long(42))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0760
     * @tc.name testLongOverall1Part2_076
     * @tc.desc Verify isLessEqualThan() returns true for equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(42);
      expect(a.isLessEqualThan(new Long(42))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0770
     * @tc.name testLongOverall1Part2_077
     * @tc.desc Verify isGreaterThan() returns true when this exceeds other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(100);
      expect(a.isGreaterThan(new Long(42))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0780
     * @tc.name testLongOverall1Part2_078
     * @tc.desc Verify isGreaterEqualThan() returns true for equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(42);
      expect(a.isGreaterEqualThan(new Long(42))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0790
     * @tc.name testLongOverall1Part2_079
     * @tc.desc Verify compareTo() returns zero for equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(42);
      expect(a.compareTo(new Long(42))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0800
     * @tc.name testLongOverall1Part2_080
     * @tc.desc Verify compareTo() returns negative when this is smaller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(42);
      expect(a.compareTo(new Long(100))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0810
     * @tc.name testLongOverall1Part2_081
     * @tc.desc Verify compareTo() returns positive when this is larger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(100);
      expect(a.compareTo(new Long(42))).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0820
     * @tc.name testLongOverall1Part2_082
     * @tc.desc Verify isLessThan() returns true for Long.MIN_VALUE compared to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(Long.MIN_VALUE);
      expect(a.isLessThan(new Long(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0830
     * @tc.name testLongOverall1Part2_083
     * @tc.desc Verify isGreaterThan() returns false when this is negative and other is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Long = new Long(-1);
      expect(a.isGreaterThan(new Long(0))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0840
     * @tc.name testLongOverall1Part2_084
     * @tc.desc Verify toLong() converts default-constructed zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long();
      expect(v.toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0850
     * @tc.name testLongOverall1Part2_085
     * @tc.desc Verify toLong() converts multi-digit positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(10000000000);
      expect(v.toLong()).assertEqual(10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0860
     * @tc.name testLongOverall1Part2_086
     * @tc.desc Verify toByte() converts zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      expect(v.toByte()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0870
     * @tc.name testLongOverall1Part2_087
     * @tc.desc Verify toByte() converts positive unit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(1);
      expect(v.toByte()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0880
     * @tc.name testLongOverall1Part2_088
     * @tc.desc Verify toByte() converts negative small value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-1);
      expect(v.toByte()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0890
     * @tc.name testLongOverall1Part2_089
     * @tc.desc Verify toByte() converts byte maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(127);
      expect(v.toByte()).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0900
     * @tc.name testLongOverall1Part2_090
     * @tc.desc Verify toByte() wraps overflow beyond byte maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(128);
      expect(v.toByte()).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0910
     * @tc.name testLongOverall1Part2_091
     * @tc.desc Verify toByte() wraps value beyond byte maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(129);
      expect(v.toByte()).assertEqual(-127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0920
     * @tc.name testLongOverall1Part2_092
     * @tc.desc Verify toByte() wraps value beyond byte range to negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(255);
      expect(v.toByte()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0930
     * @tc.name testLongOverall1Part2_093
     * @tc.desc Verify toByte() wraps value to zero at 256 boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(256);
      expect(v.toByte()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0940
     * @tc.name testLongOverall1Part2_094
     * @tc.desc Verify toByte() converts byte minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-128);
      expect(v.toByte()).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0950
     * @tc.name testLongOverall1Part2_095
     * @tc.desc Verify toByte() wraps value below byte minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-129);
      expect(v.toByte()).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0960
     * @tc.name testLongOverall1Part2_096
     * @tc.desc Verify toByte() wraps negative value beyond byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-255);
      expect(v.toByte()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0970
     * @tc.name testLongOverall1Part2_097
     * @tc.desc Verify toByte() wraps negative value to zero at -256 boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-256);
      expect(v.toByte()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0980
     * @tc.name testLongOverall1Part2_098
     * @tc.desc Verify toByte() truncates large value to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(10000000000);
      expect(v.toByte()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_0990
     * @tc.name testLongOverall1Part2_099
     * @tc.desc Verify toByte() truncates Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      expect(v.toByte()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1000
     * @tc.name testLongOverall1Part2_100
     * @tc.desc Verify toByte() truncates Long.MIN_VALUE to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      expect(v.toByte()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1010
     * @tc.name testLongOverall1Part2_101
     * @tc.desc Verify toShort() converts zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      expect(v.toShort()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1020
     * @tc.name testLongOverall1Part2_102
     * @tc.desc Verify toShort() converts positive unit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(1);
      expect(v.toShort()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1030
     * @tc.name testLongOverall1Part2_103
     * @tc.desc Verify toShort() converts negative small value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-1);
      expect(v.toShort()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1040
     * @tc.name testLongOverall1Part2_104
     * @tc.desc Verify toShort() converts short maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(32767);
      expect(v.toShort()).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1050
     * @tc.name testLongOverall1Part2_105
     * @tc.desc Verify toShort() wraps overflow beyond short maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(32768);
      expect(v.toShort()).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1060
     * @tc.name testLongOverall1Part2_106
     * @tc.desc Verify toShort() wraps value beyond short maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(32769);
      expect(v.toShort()).assertEqual(-32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1070
     * @tc.name testLongOverall1Part2_107
     * @tc.desc Verify toShort() wraps value beyond short range to negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(65535);
      expect(v.toShort()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1080
     * @tc.name testLongOverall1Part2_108
     * @tc.desc Verify toShort() wraps value to zero at 65536 boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(65536);
      expect(v.toShort()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1090
     * @tc.name testLongOverall1Part2_109
     * @tc.desc Verify toShort() converts short minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-32768);
      expect(v.toShort()).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1100
     * @tc.name testLongOverall1Part2_110
     * @tc.desc Verify toShort() wraps value below short minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-32769);
      expect(v.toShort()).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1110
     * @tc.name testLongOverall1Part2_111
     * @tc.desc Verify toShort() wraps negative value beyond short range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-65535);
      expect(v.toShort()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1120
     * @tc.name testLongOverall1Part2_112
     * @tc.desc Verify toShort() wraps negative value to zero at -65536 boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-65536);
      expect(v.toShort()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1130
     * @tc.name testLongOverall1Part2_113
     * @tc.desc Verify toShort() truncates Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      expect(v.toShort()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1140
     * @tc.name testLongOverall1Part2_114
     * @tc.desc Verify toShort() truncates Long.MIN_VALUE to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      expect(v.toShort()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1150
     * @tc.name testLongOverall1Part2_115
     * @tc.desc Verify toInt() converts zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0);
      expect(v.toInt()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1160
     * @tc.name testLongOverall1Part2_116
     * @tc.desc Verify toInt() converts positive unit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(1);
      expect(v.toInt()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1170
     * @tc.name testLongOverall1Part2_117
     * @tc.desc Verify toInt() converts negative small value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-1);
      expect(v.toInt()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1180
     * @tc.name testLongOverall1Part2_118
     * @tc.desc Verify toInt() converts int maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(2147483647);
      expect(v.toInt()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1190
     * @tc.name testLongOverall1Part2_119
     * @tc.desc Verify toInt() wraps overflow beyond int maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(2147483648);
      expect(v.toInt()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1200
     * @tc.name testLongOverall1Part2_120
     * @tc.desc Verify toInt() wraps value beyond int maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(2147483649);
      expect(v.toInt()).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1210
     * @tc.name testLongOverall1Part2_121
     * @tc.desc Verify toInt() wraps value beyond int range to negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(4294967295);
      expect(v.toInt()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1220
     * @tc.name testLongOverall1Part2_122
     * @tc.desc Verify toInt() wraps value to zero at 2^32 boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(4294967296);
      expect(v.toInt()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1230
     * @tc.name testLongOverall1Part2_123
     * @tc.desc Verify toInt() converts int minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-2147483648);
      expect(v.toInt()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1240
     * @tc.name testLongOverall1Part2_124
     * @tc.desc Verify toInt() wraps value below int minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-2147483649);
      expect(v.toInt()).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1250
     * @tc.name testLongOverall1Part2_125
     * @tc.desc Verify toInt() wraps negative value beyond int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-4294967295);
      expect(v.toInt()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1260
     * @tc.name testLongOverall1Part2_126
     * @tc.desc Verify toInt() wraps negative value to zero at -2^32 boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(-4294967296);
      expect(v.toInt()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1270
     * @tc.name testLongOverall1Part2_127
     * @tc.desc Verify toInt() truncates Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      expect(v.toInt()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1280
     * @tc.name testLongOverall1Part2_128
     * @tc.desc Verify toInt() truncates Long.MIN_VALUE to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(Long.MIN_VALUE);
      expect(v.toInt()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1290
     * @tc.name testLongOverall1Part2_129
     * @tc.desc Verify toChar() converts lowercase ASCII value to character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(97);
      expect(v.toChar().toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1300
     * @tc.name testLongOverall1Part2_130
     * @tc.desc Verify toChar() converts digit ASCII value to character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(48);
      expect(v.toChar().toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1310
     * @tc.name testLongOverall1Part2_131
     * @tc.desc Verify toChar() truncates value beyond 16-bit range to character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(0x10041);
      expect(v.toChar().toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1320
     * @tc.name testLongOverall1Part2_132
     * @tc.desc Verify toChar() truncates Long.MAX_VALUE to 16-bit character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(9223372036854775807);
      expect(v.toChar().toString()).assertEqual("\uFFFF");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1330
     * @tc.name testLongOverall1Part2_133
     * @tc.desc Verify Long.toByte() wraps value below byte minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toByte(-129)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1340
     * @tc.name testLongOverall1Part2_134
     * @tc.desc Verify Long.toShort() wraps value below short minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-32769)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1350
     * @tc.name testLongOverall1Part2_135
     * @tc.desc Verify Long.toInt() wraps value below int minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toInt(-2147483649)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART2_1360
     * @tc.name testLongOverall1Part2_136
     * @tc.desc Verify Long.toChar() wraps value beyond 16-bit range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part2_136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toChar(0x10000).toString()).assertEqual("\0");
    });
  });
}
