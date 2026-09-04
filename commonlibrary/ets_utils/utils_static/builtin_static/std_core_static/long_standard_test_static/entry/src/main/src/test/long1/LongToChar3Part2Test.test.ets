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

export default function longToChar3Part2Test(): void {
  describe('LongToChar3Part2Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_0100
     * @tc.name testLongToChar3Part2_001
     * @tc.desc Verify Long.toChar(1000000) returns char code 16960
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(1000000);
      expect(result.toString().charCodeAt(0)).assertEqual(16960);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_0200
     * @tc.name testLongToChar3Part2_002
     * @tc.desc Verify Long.toChar(10000000) returns char code 38528
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(10000000);
      expect(result.toString().charCodeAt(0)).assertEqual(38528);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_0300
     * @tc.name testLongToChar3Part2_003
     * @tc.desc Verify Long.toChar(-1) wraps negative value to char code 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-1);
      expect(result.toString().charCodeAt(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_0400
     * @tc.name testLongToChar3Part2_004
     * @tc.desc Verify Long.toChar(-128) wraps negative byte boundary to char code 65408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-128);
      expect(result.toString().charCodeAt(0)).assertEqual(65408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_0500
     * @tc.name testLongToChar3Part2_005
     * @tc.desc Verify Long.toChar(-256) wraps negative value to char code 65280
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-256);
      expect(result.toString().charCodeAt(0)).assertEqual(65280);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_0600
     * @tc.name testLongToChar3Part2_006
     * @tc.desc Verify Long.toChar(-1000) wraps negative value to char code 64536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-1000);
      expect(result.toString().charCodeAt(0)).assertEqual(64536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_0700
     * @tc.name testLongToChar3Part2_007
     * @tc.desc Verify Long.toChar(-10000) wraps negative value to char code 55536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-10000);
      expect(result.toString().charCodeAt(0)).assertEqual(55536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_0800
     * @tc.name testLongToChar3Part2_008
     * @tc.desc Verify Long.toChar(-32768) wraps 2^15 boundary to char code 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-32768);
      expect(result.toString().charCodeAt(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_0900
     * @tc.name testLongToChar3Part2_009
     * @tc.desc Verify Long.toChar(-32769) wraps across 2^15 boundary to char code 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-32769);
      expect(result.toString().charCodeAt(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_1000
     * @tc.name testLongToChar3Part2_010
     * @tc.desc Verify Long.toChar(-65535) wraps near 2^16 boundary to char code 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-65535);
      expect(result.toString().charCodeAt(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_1100
     * @tc.name testLongToChar3Part2_011
     * @tc.desc Verify Long.toChar(-65536) wraps 2^16 boundary to char code 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-65536);
      expect(result.toString().charCodeAt(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_1200
     * @tc.name testLongToChar3Part2_012
     * @tc.desc Verify Long.toChar(-65537) wraps across 2^16 boundary to char code 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-65537);
      expect(result.toString().charCodeAt(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_1300
     * @tc.name testLongToChar3Part2_013
     * @tc.desc Verify Long.toChar(-131071) wraps near double 2^16 boundary to char code 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-131071);
      expect(result.toString().charCodeAt(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_1400
     * @tc.name testLongToChar3Part2_014
     * @tc.desc Verify Long.toChar(-131072) wraps double 2^16 boundary to char code 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-131072);
      expect(result.toString().charCodeAt(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_1500
     * @tc.name testLongToChar3Part2_015
     * @tc.desc Verify Long.toChar(-100000) wraps negative value to char code 31072
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-100000);
      expect(result.toString().charCodeAt(0)).assertEqual(31072);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_1600
     * @tc.name testLongToChar3Part2_016
     * @tc.desc Verify Long.toChar(-0xF4240) hex literal wraps to char code 48576
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-0xF4240);
      expect(result.toString().charCodeAt(0)).assertEqual(48576);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_1700
     * @tc.name testLongToChar3Part2_017
     * @tc.desc Verify Long.toChar(-0x989680) hex literal wraps to char code 27008
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(-0x989680);
      expect(result.toString().charCodeAt(0)).assertEqual(27008);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_1800
     * @tc.name testLongToChar3Part2_018
     * @tc.desc Verify Long.toChar(0x7FFFFFFF) hex literal returns char code 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x7FFFFFFF);
      expect(result.toString().charCodeAt(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_1900
     * @tc.name testLongToChar3Part2_019
     * @tc.desc Verify Long.toChar(0x80000000) hex literal returns char code 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x80000000);
      expect(result.toString().charCodeAt(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_2000
     * @tc.name testLongToChar3Part2_020
     * @tc.desc Verify Long.toChar(0x100000000) hex literal returns char code 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x100000000);
      expect(result.toString().charCodeAt(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_2100
     * @tc.name testLongToChar3Part2_021
     * @tc.desc Verify Long.toChar(0x1FFFFFFFF) hex literal returns char code 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x1FFFFFFFF);
      expect(result.toString().charCodeAt(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_2200
     * @tc.name testLongToChar3Part2_022
     * @tc.desc Verify Long.toChar(0x100000001) hex literal returns char code 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x100000001);
      expect(result.toString().charCodeAt(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_2300
     * @tc.name testLongToChar3Part2_023
     * @tc.desc Verify Long.toChar octal literal 0o200000 returns char code 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0o200000);
      expect(result.toString().charCodeAt(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_2400
     * @tc.name testLongToChar3Part2_024
     * @tc.desc Verify Long.toChar octal literal 0o101 returns char code 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0o101);
      expect(result.toString().charCodeAt(0)).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_2500
     * @tc.name testLongToChar3Part2_025
     * @tc.desc Verify Long.toChar octal literal 0o141 returns char code 97
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0o141);
      expect(result.toString().charCodeAt(0)).assertEqual(97);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_2600
     * @tc.name testLongToChar3Part2_026
     * @tc.desc Verify Long.toChar octal literal 0o77777 returns char code 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0o77777);
      expect(result.toString().charCodeAt(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_2700
     * @tc.name testLongToChar3Part2_027
     * @tc.desc Verify Long.toChar octal literal 0o100000 returns char code 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0o100000);
      expect(result.toString().charCodeAt(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_2800
     * @tc.name testLongToChar3Part2_028
     * @tc.desc Verify Long.toChar octal literal 0o377777 returns char code 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0o377777);
      expect(result.toString().charCodeAt(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_2900
     * @tc.name testLongToChar3Part2_029
     * @tc.desc Verify Long.toChar octal literal 0o400000 returns char code 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0o400000);
      expect(result.toString().charCodeAt(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_3000
     * @tc.name testLongToChar3Part2_030
     * @tc.desc Verify Long.toChar binary literal 0b1111111111111111 returns char code 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0b1111111111111111);
      expect(result.toString().charCodeAt(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_3100
     * @tc.name testLongToChar3Part2_031
     * @tc.desc Verify Long.toChar binary literal 0b10000000000000000 returns char code 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0b10000000000000000);
      expect(result.toString().charCodeAt(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_3200
     * @tc.name testLongToChar3Part2_032
     * @tc.desc Verify Long.toChar binary literal 0b1000001 returns char code 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0b1000001);
      expect(result.toString().charCodeAt(0)).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_3300
     * @tc.name testLongToChar3Part2_033
     * @tc.desc Verify Long.toChar binary literal 0b1100001 returns char code 97
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0b1100001);
      expect(result.toString().charCodeAt(0)).assertEqual(97);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_3400
     * @tc.name testLongToChar3Part2_034
     * @tc.desc Verify Long.toChar binary literal 0b111111111111111 returns char code 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0b111111111111111);
      expect(result.toString().charCodeAt(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_3500
     * @tc.name testLongToChar3Part2_035
     * @tc.desc Verify Long.toChar binary literal 0b1000000000000000 returns char code 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0b1000000000000000);
      expect(result.toString().charCodeAt(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_3600
     * @tc.name testLongToChar3Part2_036
     * @tc.desc Verify Long.toChar 32-bit binary literal returns char code 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0b11111111111111111111111111111111);
      expect(result.toString().charCodeAt(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_3700
     * @tc.name testLongToChar3Part2_037
     * @tc.desc Verify Long.toChar(0xABCD) returns char code 43981 and single-char string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0xABCD);
      expect(result.toString().charCodeAt(0)).assertEqual(43981);
      expect(result.toString().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_3800
     * @tc.name testLongToChar3Part2_038
     * @tc.desc Verify Long.toChar(0x7FFF) returns char code 32767 and single-char string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x7FFF);
      expect(result.toString().charCodeAt(0)).assertEqual(32767);
      expect(result.toString().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_3900
     * @tc.name testLongToChar3Part2_039
     * @tc.desc Verify Long.toChar(0x8000) returns char code 32768 and single-char string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(0x8000);
      expect(result.toString().charCodeAt(0)).assertEqual(32768);
      expect(result.toString().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_4000
     * @tc.name testLongToChar3Part2_040
     * @tc.desc Verify Long.toChar decimal and hex literals of same value return equal char code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: char = Long.toChar(65);
      const hex: char = Long.toChar(0x41);
      expect(dec.toString().charCodeAt(0)).assertEqual(hex.toString().charCodeAt(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_4100
     * @tc.name testLongToChar3Part2_041
     * @tc.desc Verify Long.toChar decimal and octal literals of same value return equal char code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: char = Long.toChar(255);
      const oct: char = Long.toChar(0o377);
      expect(dec.toString().charCodeAt(0)).assertEqual(oct.toString().charCodeAt(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_4200
     * @tc.name testLongToChar3Part2_042
     * @tc.desc Verify Long.toChar decimal and binary literals of same value return equal char code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: char = Long.toChar(10);
      const bin: char = Long.toChar(0b1010);
      expect(dec.toString().charCodeAt(0)).assertEqual(bin.toString().charCodeAt(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR_PART2_4300
     * @tc.name testLongToChar3Part2_043
     * @tc.desc Verify Long.toChar decimal and hex literals of 65535 return equal char code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToChar3Part2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dec: char = Long.toChar(65535);
      const hex: char = Long.toChar(0xFFFF);
      expect(dec.toString().charCodeAt(0)).assertEqual(hex.toString().charCodeAt(0));
    });
  });
}
