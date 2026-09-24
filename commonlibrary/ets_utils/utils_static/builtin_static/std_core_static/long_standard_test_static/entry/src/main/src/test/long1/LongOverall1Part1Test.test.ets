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

export default function longOverall1Part1Test(): void {
  describe('LongOverall1Part1Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0010
     * @tc.name testLongOverall1Part1_001
     * @tc.desc Verify instance Long.MAX_VALUE converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(9223372036854775807);
      expect(v.toLong()).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0020
     * @tc.name testLongOverall1Part1_002
     * @tc.desc Verify instance 127 converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(127);
      expect(v.toLong()).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0030
     * @tc.name testLongOverall1Part1_003
     * @tc.desc Verify instance one converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(1);
      expect(v.toLong()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0040
     * @tc.name testLongOverall1Part1_004
     * @tc.desc Verify static Long.MAX_VALUE converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toByte(9223372036854775807);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0050
     * @tc.name testLongOverall1Part1_005
     * @tc.desc Verify static negative one converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toByte(-1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0060
     * @tc.name testLongOverall1Part1_006
     * @tc.desc Verify static 127 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toByte(127);
      expect(r).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0070
     * @tc.name testLongOverall1Part1_007
     * @tc.desc Verify static one converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toByte(1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0080
     * @tc.name testLongOverall1Part1_008
     * @tc.desc Verify static 128 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toByte(128);
      expect(r).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0090
     * @tc.name testLongOverall1Part1_009
     * @tc.desc Verify static Long.MAX_VALUE converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toShort(9223372036854775807);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0100
     * @tc.name testLongOverall1Part1_010
     * @tc.desc Verify static negative one converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toShort(-1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0110
     * @tc.name testLongOverall1Part1_011
     * @tc.desc Verify static 127 converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toShort(127);
      expect(r).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0120
     * @tc.name testLongOverall1Part1_012
     * @tc.desc Verify static thirty-two thousand seven hundred sixty-eight converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toShort(32768);
      expect(r).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0130
     * @tc.name testLongOverall1Part1_013
     * @tc.desc Verify static one converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toShort(1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0140
     * @tc.name testLongOverall1Part1_014
     * @tc.desc Verify static Long.MAX_VALUE converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toInt(9223372036854775807);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0150
     * @tc.name testLongOverall1Part1_015
     * @tc.desc Verify static negative one converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toInt(-1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0160
     * @tc.name testLongOverall1Part1_016
     * @tc.desc Verify static 127 converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toInt(127);
      expect(r).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0170
     * @tc.name testLongOverall1Part1_017
     * @tc.desc Verify static two billion one hundred forty-seven million four hundred eighty-three thousand six hundred forty-eight converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toInt(2147483648);
      expect(r).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0180
     * @tc.name testLongOverall1Part1_018
     * @tc.desc Verify static one converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toInt(1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0190
     * @tc.name testLongOverall1Part1_019
     * @tc.desc Verify static Long.MAX_VALUE converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toFloat(9223372036854775807);
      expect(r).assertEqual(9.223372036854776e18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0200
     * @tc.name testLongOverall1Part1_020
     * @tc.desc Verify static negative one converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toFloat(-1);
      expect(r).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0210
     * @tc.name testLongOverall1Part1_021
     * @tc.desc Verify static 127 converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toFloat(127);
      expect(r).assertEqual(127.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0220
     * @tc.name testLongOverall1Part1_022
     * @tc.desc Verify static one converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toFloat(1);
      expect(r).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0230
     * @tc.name testLongOverall1Part1_023
     * @tc.desc Verify static ten billion converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toFloat(10000000000);
      expect(r).assertEqual(1e10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0240
     * @tc.name testLongOverall1Part1_024
     * @tc.desc Verify static Long.MAX_VALUE converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toDouble(9223372036854775807);
      expect(r).assertEqual(9.223372036854776e18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0250
     * @tc.name testLongOverall1Part1_025
     * @tc.desc Verify static negative one converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toDouble(-1);
      expect(r).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0260
     * @tc.name testLongOverall1Part1_026
     * @tc.desc Verify static 127 converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toDouble(127);
      expect(r).assertEqual(127.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0270
     * @tc.name testLongOverall1Part1_027
     * @tc.desc Verify static one converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toDouble(1);
      expect(r).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0280
     * @tc.name testLongOverall1Part1_028
     * @tc.desc Verify static ten billion converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toDouble(10000000000);
      expect(r).assertEqual(1e10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0290
     * @tc.name testLongOverall1Part1_029
     * @tc.desc Verify static Long.MAX_VALUE converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toChar(9223372036854775807);
      expect(r.toString()).assertEqual("\uFFFF");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0300
     * @tc.name testLongOverall1Part1_030
     * @tc.desc Verify static negative one converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toChar(-1);
      expect(r.toString()).assertEqual("\uFFFF");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0310
     * @tc.name testLongOverall1Part1_031
     * @tc.desc Verify static 65 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toChar(65);
      expect(r.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0320
     * @tc.name testLongOverall1Part1_032
     * @tc.desc Verify static one converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toChar(1);
      expect(r.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0330
     * @tc.name testLongOverall1Part1_033
     * @tc.desc Verify static zero converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toChar(0);
      expect(r.toString()).assertEqual("\0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0340
     * @tc.name testLongOverall1Part1_034
     * @tc.desc Verify static Long.MAX_VALUE converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toLong(9223372036854775807);
      expect(r).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0350
     * @tc.name testLongOverall1Part1_035
     * @tc.desc Verify static negative one converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toLong(-1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0360
     * @tc.name testLongOverall1Part1_036
     * @tc.desc Verify static 127 converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toLong(127);
      expect(r).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0370
     * @tc.name testLongOverall1Part1_037
     * @tc.desc Verify static one converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toLong(1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0380
     * @tc.name testLongOverall1Part1_038
     * @tc.desc Verify static zero converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toLong(0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0390
     * @tc.name testLongOverall1Part1_039
     * @tc.desc Verify compareTo of Long.MAX_VALUE vs Long.MAX_VALUE returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(9223372036854775807);
      const b = new Long(9223372036854775807);
      expect(a.compareTo(b)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0400
     * @tc.name testLongOverall1Part1_040
     * @tc.desc Verify compareTo of negative one vs 127 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(-1);
      const b = new Long(127);
      expect(a.compareTo(b)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0410
     * @tc.name testLongOverall1Part1_041
     * @tc.desc Verify compareTo of 127 vs negative one returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(-1);
      expect(a.compareTo(b)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0420
     * @tc.name testLongOverall1Part1_042
     * @tc.desc Verify compareTo of negative one vs negative one returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(-1);
      const b = new Long(-1);
      expect(a.compareTo(b)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0430
     * @tc.name testLongOverall1Part1_043
     * @tc.desc Verify compareTo of 127 vs 127 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(127);
      expect(a.compareTo(b)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0440
     * @tc.name testLongOverall1Part1_044
     * @tc.desc Verify compareTo of one vs Long.MAX_VALUE returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(1);
      const b = new Long(9223372036854775807);
      expect(a.compareTo(b)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0450
     * @tc.name testLongOverall1Part1_045
     * @tc.desc Verify compareTo of Long.MAX_VALUE vs Long.MIN_VALUE returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(9223372036854775807);
      const b = new Long(Long.MIN_VALUE);
      expect(a.compareTo(b)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0460
     * @tc.name testLongOverall1Part1_046
     * @tc.desc Verify instance 1234 string representation in radix-36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(1234);
      const r = v.toString(36);
      expect(r).assertEqual('ya');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0470
     * @tc.name testLongOverall1Part1_047
     * @tc.desc Verify instance 255 string representation in binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(255);
      const r = v.toString(2);
      expect(r).assertEqual('11111111');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0480
     * @tc.name testLongOverall1Part1_048
     * @tc.desc Verify instance one hundred string representation in radix-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(100);
      const r = v.toString(3);
      expect(r).assertEqual('10201');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0490
     * @tc.name testLongOverall1Part1_049
     * @tc.desc Verify toString with invalid radix 0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(255);
      try {
        v.toString(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0500
     * @tc.name testLongOverall1Part1_050
     * @tc.desc Verify instance 255 string representation in hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(255);
      const r = v.toString(16);
      expect(r).assertEqual('ff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0510
     * @tc.name testLongOverall1Part1_051
     * @tc.desc Verify static Long.MAX_VALUE string representation in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toString(9223372036854775807);
      expect(r).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0520
     * @tc.name testLongOverall1Part1_052
     * @tc.desc Verify static negative one string representation in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toString(-1);
      expect(r).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0530
     * @tc.name testLongOverall1Part1_053
     * @tc.desc Verify static 127 string representation in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toString(127);
      expect(r).assertEqual('127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0540
     * @tc.name testLongOverall1Part1_054
     * @tc.desc Verify static one string representation in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toString(1);
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0550
     * @tc.name testLongOverall1Part1_055
     * @tc.desc Verify static Long.MIN_VALUE string representation in decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.toString(Long.MIN_VALUE);
      expect(r).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0560
     * @tc.name testLongOverall1Part1_056
     * @tc.desc Verify 127 compared equal to 127 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(127);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0570
     * @tc.name testLongOverall1Part1_057
     * @tc.desc Verify 127 compared equal to one returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(1);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0580
     * @tc.name testLongOverall1Part1_058
     * @tc.desc Verify Long.MAX_VALUE compared equal to one returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(9223372036854775807);
      const b = new Long(1);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0590
     * @tc.name testLongOverall1Part1_059
     * @tc.desc Verify Long.MAX_VALUE compared equal to Long.MAX_VALUE returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(9223372036854775807);
      const b = new Long(9223372036854775807);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0600
     * @tc.name testLongOverall1Part1_060
     * @tc.desc Verify negative one compared equal to 127 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(-1);
      const b = new Long(127);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0610
     * @tc.name testLongOverall1Part1_061
     * @tc.desc Verify one plus Long.MAX_VALUE wraps to minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(1);
      const b = new Long(9223372036854775807);
      const r = a.add(b);
      expect(r.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0620
     * @tc.name testLongOverall1Part1_062
     * @tc.desc Verify one hundred plus negative one equals 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(100);
      const b = new Long(-1);
      const r = a.add(b);
      expect(r.toLong()).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0630
     * @tc.name testLongOverall1Part1_063
     * @tc.desc Verify one hundred plus 127 equals 227
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(100);
      const b = new Long(127);
      const r = a.add(b);
      expect(r.toLong()).assertEqual(227);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0640
     * @tc.name testLongOverall1Part1_064
     * @tc.desc Verify near maximum boundary plus one equals Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(9223372036854775806);
      const b = new Long(1);
      const r = a.add(b);
      expect(r.toLong()).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0650
     * @tc.name testLongOverall1Part1_065
     * @tc.desc Verify 127 plus 127 equals 254
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const r = a.add(a);
      expect(r.toLong()).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0660
     * @tc.name testLongOverall1Part1_066
     * @tc.desc Verify negative one minus Long.MAX_VALUE equals Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(-1);
      const b = new Long(9223372036854775807);
      const r = a.sub(b);
      expect(r.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0670
     * @tc.name testLongOverall1Part1_067
     * @tc.desc Verify one hundred minus negative one equals 101
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(100);
      const b = new Long(-1);
      const r = a.sub(b);
      expect(r.toLong()).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0680
     * @tc.name testLongOverall1Part1_068
     * @tc.desc Verify 200 minus 127 equals 73
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(200);
      const b = new Long(127);
      const r = a.sub(b);
      expect(r.toLong()).assertEqual(73);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0690
     * @tc.name testLongOverall1Part1_069
     * @tc.desc Verify one minus one equals zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(1);
      const b = new Long(1);
      const r = a.sub(b);
      expect(r.toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0700
     * @tc.name testLongOverall1Part1_070
     * @tc.desc Verify 127 minus 127 equals zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const r = a.sub(a);
      expect(r.toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0710
     * @tc.name testLongOverall1Part1_071
     * @tc.desc Verify two times Long.MAX_VALUE wraps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(2);
      const b = new Long(9223372036854775807);
      const r = a.mul(b);
      expect(r.toLong()).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0720
     * @tc.name testLongOverall1Part1_072
     * @tc.desc Verify 127 times negative one equals -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(-1);
      const r = a.mul(b);
      expect(r.toLong()).assertEqual(-127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0730
     * @tc.name testLongOverall1Part1_073
     * @tc.desc Verify ten times 127 equals 1270
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(10);
      const b = new Long(127);
      const r = a.mul(b);
      expect(r.toLong()).assertEqual(1270);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0740
     * @tc.name testLongOverall1Part1_074
     * @tc.desc Verify 127 times one equals 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(1);
      const r = a.mul(b);
      expect(r.toLong()).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0750
     * @tc.name testLongOverall1Part1_075
     * @tc.desc Verify 127 times zero equals zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(0);
      const r = a.mul(b);
      expect(r.toLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0760
     * @tc.name testLongOverall1Part1_076
     * @tc.desc Verify Long.MAX_VALUE divided by one equals Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(9223372036854775807);
      const b = new Long(1);
      const r = a.div(b);
      expect(r.toLong()).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0770
     * @tc.name testLongOverall1Part1_077
     * @tc.desc Verify 127 divided by negative one equals -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(-1);
      const r = a.div(b);
      expect(r.toLong()).assertEqual(-127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0780
     * @tc.name testLongOverall1Part1_078
     * @tc.desc Verify Long.MIN_VALUE divided by negative one wraps to minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(Long.MIN_VALUE);
      const b = new Long(-1);
      const r = a.div(b);
      expect(r.toLong()).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0790
     * @tc.name testLongOverall1Part1_079
     * @tc.desc Verify negative one ordered before 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(-1);
      const b = new Long(127);
      expect(a.isLessThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0800
     * @tc.name testLongOverall1Part1_080
     * @tc.desc Verify 127 not ordered before negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(-1);
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0810
     * @tc.name testLongOverall1Part1_081
     * @tc.desc Verify 127 not ordered before 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(127);
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0820
     * @tc.name testLongOverall1Part1_082
     * @tc.desc Verify Long.MIN_VALUE ordered before Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(Long.MIN_VALUE);
      const b = new Long(9223372036854775807);
      expect(a.isLessThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0830
     * @tc.name testLongOverall1Part1_083
     * @tc.desc Verify Long.MAX_VALUE not ordered before one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(9223372036854775807);
      const b = new Long(1);
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0840
     * @tc.name testLongOverall1Part1_084
     * @tc.desc Verify negative one ordered before or equal to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(-1);
      const b = new Long(127);
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0850
     * @tc.name testLongOverall1Part1_085
     * @tc.desc Verify 127 ordered before or equal to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(127);
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0860
     * @tc.name testLongOverall1Part1_086
     * @tc.desc Verify 127 not ordered before or equal to negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(-1);
      expect(a.isLessEqualThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0870
     * @tc.name testLongOverall1Part1_087
     * @tc.desc Verify Long.MAX_VALUE ordered before or equal to Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(9223372036854775807);
      const b = new Long(9223372036854775807);
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0880
     * @tc.name testLongOverall1Part1_088
     * @tc.desc Verify Long.MIN_VALUE ordered before or equal to one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(Long.MIN_VALUE);
      const b = new Long(1);
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0890
     * @tc.name testLongOverall1Part1_089
     * @tc.desc Verify negative one not ordered after 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(-1);
      const b = new Long(127);
      expect(a.isGreaterThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0900
     * @tc.name testLongOverall1Part1_090
     * @tc.desc Verify 127 ordered after negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(-1);
      expect(a.isGreaterThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0910
     * @tc.name testLongOverall1Part1_091
     * @tc.desc Verify 127 not ordered after 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(127);
      expect(a.isGreaterThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0920
     * @tc.name testLongOverall1Part1_092
     * @tc.desc Verify one not ordered after one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(1);
      const b = new Long(1);
      expect(a.isGreaterThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0930
     * @tc.name testLongOverall1Part1_093
     * @tc.desc Verify 127 ordered after or equal to negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(-1);
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0940
     * @tc.name testLongOverall1Part1_094
     * @tc.desc Verify 127 ordered after or equal to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(127);
      const b = new Long(127);
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0950
     * @tc.name testLongOverall1Part1_095
     * @tc.desc Verify negative one not ordered after or equal to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Long(-1);
      const b = new Long(127);
      expect(a.isGreaterEqualThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0960
     * @tc.name testLongOverall1Part1_096
     * @tc.desc Verify auto-detect string 255 parsed as Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.parseInt('255', 0);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0970
     * @tc.name testLongOverall1Part1_097
     * @tc.desc Verify hexadecimal string FF parsed as Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.parseInt('FF', 16);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0980
     * @tc.name testLongOverall1Part1_098
     * @tc.desc Verify decimal string 9223372036854775807 parsed as Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Long.parseInt('9223372036854775807', 10);
      expect(r).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_0990
     * @tc.name testLongOverall1Part1_099
     * @tc.desc Verify Long.MIN_VALUE property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MIN_VALUE).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_1000
     * @tc.name testLongOverall1Part1_100
     * @tc.desc Verify Long.MAX_VALUE property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.MAX_VALUE).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_1010
     * @tc.name testLongOverall1Part1_101
     * @tc.desc Verify Long.BIT_SIZE property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BIT_SIZE).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_1020
     * @tc.name testLongOverall1Part1_102
     * @tc.desc Verify Long.BYTE_SIZE property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.BYTE_SIZE).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_1030
     * @tc.name testLongOverall1Part1_103
     * @tc.desc Verify instance 127 converted to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(127);
      expect(v.toShort()).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_1040
     * @tc.name testLongOverall1Part1_104
     * @tc.desc Verify instance 127 converted to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(127);
      expect(v.toInt()).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_1050
     * @tc.name testLongOverall1Part1_105
     * @tc.desc Verify instance 127 converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(127);
      expect(v.toFloat()).assertEqual(127.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_1060
     * @tc.name testLongOverall1Part1_106
     * @tc.desc Verify instance 127 converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(127);
      expect(v.toDouble()).assertEqual(127.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_OVERALL_PART1_1070
     * @tc.name testLongOverall1Part1_107
     * @tc.desc Verify instance 42 converted to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongOverall1Part1_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: Long = new Long(42);
      expect(l.toLong()).assertEqual(42);
    });
  });
}
