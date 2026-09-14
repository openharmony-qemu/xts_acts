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

export default function longToChar3Part1Test(): void {
  describe('LongToChar3Part1Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_0100
     * @tc.name testLongToChar3Part1_001
     * @tc.desc Verify static 256 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(256);
      expect(result.toString()).assertEqual('\u0100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_0200
     * @tc.name testLongToChar3Part1_002
     * @tc.desc Verify static 511 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(511);
      expect(result.toString()).assertEqual('\u01FF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_0300
     * @tc.name testLongToChar3Part1_003
     * @tc.desc Verify static 512 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(512);
      expect(result.toString()).assertEqual('\u0200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_0400
     * @tc.name testLongToChar3Part1_004
     * @tc.desc Verify static 1023 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(1023);
      expect(result.toString()).assertEqual('\u03FF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_0500
     * @tc.name testLongToChar3Part1_005
     * @tc.desc Verify static 1024 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(1024);
      expect(result.toString()).assertEqual('\u0400');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_0600
     * @tc.name testLongToChar3Part1_006
     * @tc.desc Verify static 2047 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(2047);
      expect(result.toString()).assertEqual('\u07FF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_0700
     * @tc.name testLongToChar3Part1_007
     * @tc.desc Verify static 2048 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(2048);
      expect(result.toString()).assertEqual('\u0800');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_0800
     * @tc.name testLongToChar3Part1_008
     * @tc.desc Verify static 4095 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(4095);
      expect(result.toString()).assertEqual('\u0FFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_0900
     * @tc.name testLongToChar3Part1_009
     * @tc.desc Verify static 4096 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(4096);
      expect(result.toString()).assertEqual('\u1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_1000
     * @tc.name testLongToChar3Part1_010
     * @tc.desc Verify static 8191 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(8191);
      expect(result.toString()).assertEqual('\u1FFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_1100
     * @tc.name testLongToChar3Part1_011
     * @tc.desc Verify static 8192 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(8192);
      expect(result.toString()).assertEqual(' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_1200
     * @tc.name testLongToChar3Part1_012
     * @tc.desc Verify static sixteen thousand three hundred eighty-three converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(16383);
      expect(result.toString()).assertEqual('\u3FFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_1300
     * @tc.name testLongToChar3Part1_013
     * @tc.desc Verify static sixteen thousand three hundred eighty-four converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(16384);
      expect(result.toString()).assertEqual('\u4000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_1400
     * @tc.name testLongToChar3Part1_014
     * @tc.desc Verify static thirty-two thousand seven hundred sixty-seven converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(32767);
      expect(result.toString()).assertEqual('翿');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_1500
     * @tc.name testLongToChar3Part1_015
     * @tc.desc Verify static thirty-two thousand seven hundred sixty-eight converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(32768);
      expect(result.toString()).assertEqual('耀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_1600
     * @tc.name testLongToChar3Part1_016
     * @tc.desc Verify static sixty-five thousand five hundred thirty-five converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(65535);
      expect(result.toString()).assertEqual('\uFFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_1700
     * @tc.name testLongToChar3Part1_017
     * @tc.desc Verify static fifty-five thousand two hundred ninety-six converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(55296);
      expect(result.toString()).assertEqual('\uD800');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_1800
     * @tc.name testLongToChar3Part1_018
     * @tc.desc Verify static fifty-six thousand three hundred twenty converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(56320);
      expect(result.toString()).assertEqual('\uDC00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_1900
     * @tc.name testLongToChar3Part1_019
     * @tc.desc Verify static fifty-seven thousand three hundred forty-three converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(57343);
      expect(result.toString()).assertEqual('\uDFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_2000
     * @tc.name testLongToChar3Part1_020
     * @tc.desc Verify static fifty-seven thousand three hundred forty-four converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(57344);
      expect(result.toString()).assertEqual('\uE000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_2100
     * @tc.name testLongToChar3Part1_021
     * @tc.desc Verify static nineteen thousand nine hundred sixty-eight converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x4E00);
      expect(result.toString()).assertEqual('一');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_2200
     * @tc.name testLongToChar3Part1_022
     * @tc.desc Verify static twenty-one thousand eight hundred thirty-four converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x554A);
      expect(result.toString()).assertEqual('啊');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_2300
     * @tc.name testLongToChar3Part1_023
     * @tc.desc Verify static twelve thousand two hundred eighty-nine converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x3001);
      expect(result.toString()).assertEqual('、');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_2400
     * @tc.name testLongToChar3Part1_024
     * @tc.desc Verify static 8734 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x221E);
      expect(result.toString()).assertEqual('∞');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_2500
     * @tc.name testLongToChar3Part1_025
     * @tc.desc Verify static 8800 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x2260);
      expect(result.toString()).assertEqual('≠');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_2600
     * @tc.name testLongToChar3Part1_026
     * @tc.desc Verify static twelve thousand four hundred fifty converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x30A2);
      expect(result.toString()).assertEqual('ア');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_2700
     * @tc.name testLongToChar3Part1_027
     * @tc.desc Verify static 916 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x0394);
      expect(result.toString()).assertEqual('Δ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_2800
     * @tc.name testLongToChar3Part1_028
     * @tc.desc Verify static 937 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x03A9);
      expect(result.toString()).assertEqual('Ω');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_2900
     * @tc.name testLongToChar3Part1_029
     * @tc.desc Verify static 960 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x03C0);
      expect(result.toString()).assertEqual('π');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_3000
     * @tc.name testLongToChar3Part1_030
     * @tc.desc Verify static 8482 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x2122);
      expect(result.toString()).assertEqual('™');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_3100
     * @tc.name testLongToChar3Part1_031
     * @tc.desc Verify static 97 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x61);
      expect(result.toString()).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_3200
     * @tc.name testLongToChar3Part1_032
     * @tc.desc Verify static 48 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x30);
      expect(result.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_3300
     * @tc.name testLongToChar3Part1_033
     * @tc.desc Verify static 32 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x20);
      expect(result.toString()).assertEqual(' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_3400
     * @tc.name testLongToChar3Part1_034
     * @tc.desc Verify static 126 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x7E);
      expect(result.toString()).assertEqual('~');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_3500
     * @tc.name testLongToChar3Part1_035
     * @tc.desc Verify static 127 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x7F);
      expect(result.toString()).assertEqual('\u007F');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_3600
     * @tc.name testLongToChar3Part1_036
     * @tc.desc Verify static 255 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0xFF);
      expect(result.toString()).assertEqual('\xFF');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_3700
     * @tc.name testLongToChar3Part1_037
     * @tc.desc Verify static fifty-five thousand two hundred ninety-five converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0xD7FF);
      expect(result.toString()).assertEqual('\uD7FF');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_3800
     * @tc.name testLongToChar3Part1_038
     * @tc.desc Verify static 64 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0o100);
      expect(result.toString()).assertEqual('@');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_3900
     * @tc.name testLongToChar3Part1_039
     * @tc.desc Verify static 128 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0b10000000);
      expect(result.toString()).assertEqual('\x80');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_4000
     * @tc.name testLongToChar3Part1_040
     * @tc.desc Verify static sixty-five thousand six hundred one converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x10041);
      expect(result.toString()).assertEqual('A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_4100
     * @tc.name testLongToChar3Part1_041
     * @tc.desc Verify static sixty-five thousand six hundred thirty-three converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x10061);
      expect(result.toString()).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_4200
     * @tc.name testLongToChar3Part1_042
     * @tc.desc Verify static one hundred thirty-one thousand seventy-one converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x1FFFF);
      expect(result.toString()).assertEqual('\uFFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_4300
     * @tc.name testLongToChar3Part1_043
     * @tc.desc Verify static one hundred thirty-one thousand seventy-two converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x20000);
      expect(result.toString()).assertEqual('\0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_4400
     * @tc.name testLongToChar3Part1_044
     * @tc.desc Verify static one hundred nine thousand five hundred seventeen converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x1ABCD);
      expect(result.toString()).assertEqual('\uABCD');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_4500
     * @tc.name testLongToChar3Part1_045
     * @tc.desc Verify static one hundred twenty-two thousand five hundred forty-one converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x1DEAD);
      expect(result.toString()).assertEqual('\uDEAD');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_4600
     * @tc.name testLongToChar3Part1_046
     * @tc.desc Verify static sixteen million seven hundred seventy-seven thousand two hundred fifteen converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0xFFFFFF);
      expect(result.toString()).assertEqual('\uFFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_4700
     * @tc.name testLongToChar3Part1_047
     * @tc.desc Verify static one million forty-eight thousand five hundred seventy-seven converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x100001);
      expect(result.toString()).assertEqual('\u0001');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_4800
     * @tc.name testLongToChar3Part1_048
     * @tc.desc Verify static -2 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-2);
      expect(result.toString()).assertEqual('\uFFFE');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_4900
     * @tc.name testLongToChar3Part1_049
     * @tc.desc Verify static -3 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-3);
      expect(result.toString()).assertEqual('\uFFFD');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_5000
     * @tc.name testLongToChar3Part1_050
     * @tc.desc Verify static -7 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-7);
      expect(result.toString()).assertEqual('\uFFF9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_5100
     * @tc.name testLongToChar3Part1_051
     * @tc.desc Verify static -65 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-65);
      expect(result.toString()).assertEqual('\uFFBF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_5200
     * @tc.name testLongToChar3Part1_052
     * @tc.desc Verify static -128 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-128);
      expect(result.toString()).assertEqual('\uFF80');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_5300
     * @tc.name testLongToChar3Part1_053
     * @tc.desc Verify static -255 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-255);
      expect(result.toString()).assertEqual('\uFF01');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_5400
     * @tc.name testLongToChar3Part1_054
     * @tc.desc Verify static -256 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-256);
      expect(result.toString()).assertEqual('\uFF00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_5500
     * @tc.name testLongToChar3Part1_055
     * @tc.desc Verify static negative thirty-two thousand seven hundred sixty-eight converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-32768);
      expect(result.toString()).assertEqual('耀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_5600
     * @tc.name testLongToChar3Part1_056
     * @tc.desc Verify static negative thirty-two thousand seven hundred sixty-nine converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-32769);
      expect(result.toString()).assertEqual('翿');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_5700
     * @tc.name testLongToChar3Part1_057
     * @tc.desc Verify static negative sixty-five thousand five hundred thirty-five converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-65535);
      expect(result.toString()).assertEqual('\u0001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_5800
     * @tc.name testLongToChar3Part1_058
     * @tc.desc Verify static negative sixty-five thousand five hundred thirty-six converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-65536);
      expect(result.toString()).assertEqual('\0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_5900
     * @tc.name testLongToChar3Part1_059
     * @tc.desc Verify static negative sixty-five thousand five hundred thirty-seven converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-65537);
      expect(result.toString()).assertEqual('\uFFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_6000
     * @tc.name testLongToChar3Part1_060
     * @tc.desc Verify static negative one hundred thirty-one thousand seventy-one converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-131071);
      expect(result.toString()).assertEqual('\u0001');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_6100
     * @tc.name testLongToChar3Part1_061
     * @tc.desc Verify static -2047 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-0x7FF);
      expect(result.toString()).assertEqual('\uF801');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_6200
     * @tc.name testLongToChar3Part1_062
     * @tc.desc Verify static -2048 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-0x800);
      expect(result.toString()).assertEqual('\uF800');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_6300
     * @tc.name testLongToChar3Part1_063
     * @tc.desc Verify static sixty-five thousand five hundred thirty-seven converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0b10000000000000001);
      expect(result.toString()).assertEqual('\u0001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_6400
     * @tc.name testLongToChar3Part1_064
     * @tc.desc Verify static eight million three hundred eighty-eight thousand six hundred seventy-three converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0b100000000000000001000001);
      expect(result.toString()).assertEqual('A');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_6500
     * @tc.name testLongToChar3Part1_065
     * @tc.desc Verify static four billion two hundred ninety-four million nine hundred one thousand seven hundred sixty converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toChar(0xFFFF0000).toString().charCodeAt(0)).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_6600
     * @tc.name testLongToChar3Part1_066
     * @tc.desc Verify static sixty-five thousand two hundred eighty converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toChar(0xFF00).toString().charCodeAt(0)).assertEqual(65280);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_6700
     * @tc.name testLongToChar3Part1_067
     * @tc.desc Verify static 3855 converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toChar(0x0F0F).toString().charCodeAt(0)).assertEqual(3855);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_6800
     * @tc.name testLongToChar3Part1_068
     * @tc.desc Verify static sixty-one thousand six hundred eighty converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toChar(0xF0F0).toString().charCodeAt(0)).assertEqual(61680);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_6900
     * @tc.name testLongToChar3Part1_069
     * @tc.desc Verify static forty-three thousand nine hundred eighty-one converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toChar(0xABCD).toString().charCodeAt(0)).assertEqual(43981);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_7000
     * @tc.name testLongToChar3Part1_070
     * @tc.desc Verify static seventeen thousand one hundred eighty-five converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toChar(0x4321).toString().charCodeAt(0)).assertEqual(17185);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_7100
     * @tc.name testLongToChar3Part1_071
     * @tc.desc Verify static sixty-five thousand five hundred thirty-four converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0xFFFE);
      expect(result.toString().charCodeAt(0)).assertEqual(65534);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_7200
     * @tc.name testLongToChar3Part1_072
     * @tc.desc Verify static sixty-five thousand five hundred thirty-eight converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(65538);
      expect(result.toString().charCodeAt(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_7300
     * @tc.name testLongToChar3Part1_073
     * @tc.desc Verify static sixty-five thousand five hundred thirty-nine converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(65539);
      expect(result.toString().charCodeAt(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_7400
     * @tc.name testLongToChar3Part1_074
     * @tc.desc Verify static sixty-five thousand five hundred forty converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(65540);
      expect(result.toString().charCodeAt(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_7500
     * @tc.name testLongToChar3Part1_075
     * @tc.desc Verify static sixty-five thousand five hundred fifty converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(65550);
      expect(result.toString().charCodeAt(0)).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_7600
     * @tc.name testLongToChar3Part1_076
     * @tc.desc Verify static sixty-five thousand six hundred converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(65600);
      expect(result.toString().charCodeAt(0)).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_7700
     * @tc.name testLongToChar3Part1_077
     * @tc.desc Verify static sixty-five thousand seven hundred ninety-three converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(65793);
      expect(result.toString().charCodeAt(0)).assertEqual(257);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_7800
     * @tc.name testLongToChar3Part1_078
     * @tc.desc Verify static sixty-five thousand eight hundred twenty-five converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(65825);
      expect(result.toString().charCodeAt(0)).assertEqual(289);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_7900
     * @tc.name testLongToChar3Part1_079
     * @tc.desc Verify static sixty-six thousand converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(66000);
      expect(result.toString().charCodeAt(0)).assertEqual(464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_8000
     * @tc.name testLongToChar3Part1_080
     * @tc.desc Verify static seventy thousand converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(70000);
      expect(result.toString().charCodeAt(0)).assertEqual(4464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_8100
     * @tc.name testLongToChar3Part1_081
     * @tc.desc Verify static one hundred thousand converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(100000);
      expect(result.toString().charCodeAt(0)).assertEqual(34464);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_8200
     * @tc.name testLongToChar3Part1_082
     * @tc.desc Verify static one hundred ninety-six thousand six hundred seven converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(196607);
      expect(result.toString().charCodeAt(0)).assertEqual(65535);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART1_8300
     * @tc.name testLongToChar3Part1_083
     * @tc.desc Verify static one hundred ninety-six thousand six hundred eight converted to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part1_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(196608);
      expect(result.toString().charCodeAt(0)).assertEqual(0);
    });
  });
}
