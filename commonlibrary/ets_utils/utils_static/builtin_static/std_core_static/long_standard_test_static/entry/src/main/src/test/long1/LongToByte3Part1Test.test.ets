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

export default function longToByte3Part1Test(): void {
  describe('LongToByte3Part1Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_0100
     * @tc.name testLongToByte3Part1_001
     * @tc.desc Verify decimal value 255 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(255);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_0200
     * @tc.name testLongToByte3Part1_002
     * @tc.desc Verify decimal value 256 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(256);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_0300
     * @tc.name testLongToByte3Part1_003
     * @tc.desc Verify hexadecimal value 0x0 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0x0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_0400
     * @tc.name testLongToByte3Part1_004
     * @tc.desc Verify hexadecimal value 0x1 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0x1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_0500
     * @tc.name testLongToByte3Part1_005
     * @tc.desc Verify hexadecimal value 0x7F converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0x7F);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_0600
     * @tc.name testLongToByte3Part1_006
     * @tc.desc Verify hexadecimal value 0x80 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0x80);
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_0700
     * @tc.name testLongToByte3Part1_007
     * @tc.desc Verify hexadecimal value 0xFF converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0xFF);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_0800
     * @tc.name testLongToByte3Part1_008
     * @tc.desc Verify hexadecimal value 0x100 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0x100);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_0900
     * @tc.name testLongToByte3Part1_009
     * @tc.desc Verify hexadecimal value 0x7E converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0x7E);
      expect(result).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_1000
     * @tc.name testLongToByte3Part1_010
     * @tc.desc Verify hexadecimal value 0x81 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0x81);
      expect(result).assertEqual(-127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_1100
     * @tc.name testLongToByte3Part1_011
     * @tc.desc Verify 4-byte hexadecimal value 0xABCDEF01 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0xABCDEF01);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_1200
     * @tc.name testLongToByte3Part1_012
     * @tc.desc Verify 4-byte hexadecimal value 0x12345678 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0x12345678);
      expect(result).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_1300
     * @tc.name testLongToByte3Part1_013
     * @tc.desc Verify 4-byte hexadecimal value 0xDEADBEEF converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0xDEADBEEF);
      expect(result).assertEqual(-17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_1400
     * @tc.name testLongToByte3Part1_014
     * @tc.desc Verify 4-byte hexadecimal value 0xCAFEBABE converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0xCAFEBABE);
      expect(result).assertEqual(-66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_1500
     * @tc.name testLongToByte3Part1_015
     * @tc.desc Verify 4-byte hexadecimal value 0x87654321 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0x87654321);
      expect(result).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_1600
     * @tc.name testLongToByte3Part1_016
     * @tc.desc Verify decimal value -1 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(-1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_1700
     * @tc.name testLongToByte3Part1_017
     * @tc.desc Verify hexadecimal value 0x7FF converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0x7FF);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_1800
     * @tc.name testLongToByte3Part1_018
     * @tc.desc Verify hexadecimal value 0x800 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0x800);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_1900
     * @tc.name testLongToByte3Part1_019
     * @tc.desc Verify hexadecimal value 0xFFFF converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0xFFFF);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_2000
     * @tc.name testLongToByte3Part1_020
     * @tc.desc Verify hexadecimal value 0x10000 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0x10000);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_2100
     * @tc.name testLongToByte3Part1_021
     * @tc.desc Verify octal value 0o0 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0o0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_2200
     * @tc.name testLongToByte3Part1_022
     * @tc.desc Verify octal value 0o177 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0o177);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_2300
     * @tc.name testLongToByte3Part1_023
     * @tc.desc Verify octal value 0o200 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0o200);
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_2400
     * @tc.name testLongToByte3Part1_024
     * @tc.desc Verify octal value 0o377 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0o377);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_2500
     * @tc.name testLongToByte3Part1_025
     * @tc.desc Verify octal value 0o400 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0o400);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_2600
     * @tc.name testLongToByte3Part1_026
     * @tc.desc Verify octal value 0o777 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0o777);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_2700
     * @tc.name testLongToByte3Part1_027
     * @tc.desc Verify octal value 0o177777 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0o177777);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_2800
     * @tc.name testLongToByte3Part1_028
     * @tc.desc Verify octal value 0o200000 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0o200000);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_2900
     * @tc.name testLongToByte3Part1_029
     * @tc.desc Verify binary value 0b0 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0b0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_3000
     * @tc.name testLongToByte3Part1_030
     * @tc.desc Verify binary value 0b1 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0b1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_3100
     * @tc.name testLongToByte3Part1_031
     * @tc.desc Verify binary value 0b1111111 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0b1111111);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_3200
     * @tc.name testLongToByte3Part1_032
     * @tc.desc Verify binary value 0b10000000 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0b10000000);
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_3300
     * @tc.name testLongToByte3Part1_033
     * @tc.desc Verify binary value 0b11111111 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0b11111111);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_3400
     * @tc.name testLongToByte3Part1_034
     * @tc.desc Verify binary value 0b100000000 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0b100000000);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_3500
     * @tc.name testLongToByte3Part1_035
     * @tc.desc Verify decimal value -2 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(-2);
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_3600
     * @tc.name testLongToByte3Part1_036
     * @tc.desc Verify decimal value 1000 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(1000);
      expect(result).assertEqual(-24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_3700
     * @tc.name testLongToByte3Part1_037
     * @tc.desc Verify decimal value -1000 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(-1000);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_3800
     * @tc.name testLongToByte3Part1_038
     * @tc.desc Verify hexadecimal value 0xFF compared equal to decimal value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexVal: byte = Long.toByte(0xFF);
      let decVal: byte = Long.toByte(255);
      expect(hexVal).assertEqual(decVal);
      expect(hexVal).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_3900
     * @tc.name testLongToByte3Part1_039
     * @tc.desc Verify hexadecimal value 0x80 compared equal to decimal value 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexVal: byte = Long.toByte(0x80);
      let decVal: byte = Long.toByte(128);
      expect(hexVal).assertEqual(decVal);
      expect(hexVal).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_4000
     * @tc.name testLongToByte3Part1_040
     * @tc.desc Verify hexadecimal value 0x7F compared equal to decimal value 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexVal: byte = Long.toByte(0x7F);
      let decVal: byte = Long.toByte(127);
      expect(hexVal).assertEqual(decVal);
      expect(hexVal).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_4100
     * @tc.name testLongToByte3Part1_041
     * @tc.desc Verify hexadecimal value 0x100 compared equal to decimal value 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexVal: byte = Long.toByte(0x100);
      let decVal: byte = Long.toByte(256);
      expect(hexVal).assertEqual(decVal);
      expect(hexVal).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_4200
     * @tc.name testLongToByte3Part1_042
     * @tc.desc Verify octal value 0o377 compared equal to decimal value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let octVal: byte = Long.toByte(0o377);
      let decVal: byte = Long.toByte(255);
      expect(octVal).assertEqual(decVal);
      expect(octVal).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_4300
     * @tc.name testLongToByte3Part1_043
     * @tc.desc Verify octal value 0o200 compared equal to decimal value 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let octVal: byte = Long.toByte(0o200);
      let decVal: byte = Long.toByte(128);
      expect(octVal).assertEqual(decVal);
      expect(octVal).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_4400
     * @tc.name testLongToByte3Part1_044
     * @tc.desc Verify binary value 0b11111111 compared equal to decimal value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binVal: byte = Long.toByte(0b11111111);
      let decVal: byte = Long.toByte(255);
      expect(binVal).assertEqual(decVal);
      expect(binVal).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_4500
     * @tc.name testLongToByte3Part1_045
     * @tc.desc Verify binary value 0b10000000 compared equal to decimal value 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binVal: byte = Long.toByte(0b10000000);
      let decVal: byte = Long.toByte(128);
      expect(binVal).assertEqual(decVal);
      expect(binVal).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_4600
     * @tc.name testLongToByte3Part1_046
     * @tc.desc Verify binary value 0b01111111 compared equal to decimal value 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binVal: byte = Long.toByte(0b01111111);
      let decVal: byte = Long.toByte(127);
      expect(binVal).assertEqual(decVal);
      expect(binVal).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_4700
     * @tc.name testLongToByte3Part1_047
     * @tc.desc Verify hexadecimal value 0xFF compared equal to octal value 0o377
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexVal: byte = Long.toByte(0xFF);
      let octVal: byte = Long.toByte(0o377);
      expect(hexVal).assertEqual(octVal);
      expect(hexVal).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_4800
     * @tc.name testLongToByte3Part1_048
     * @tc.desc Verify decimal value -64 converted to negative byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = Long.toByte(-64);
      expect(b).assertLess(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_4900
     * @tc.name testLongToByte3Part1_049
     * @tc.desc Verify decimal value 0 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = Long.toByte(0);
      expect(b).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_5000
     * @tc.name testLongToByte3Part1_050
     * @tc.desc Verify decimal value 131 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(131);
      expect(result).assertEqual(-125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_5100
     * @tc.name testLongToByte3Part1_051
     * @tc.desc Verify decimal value 191 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(191);
      expect(result).assertEqual(-65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_5200
     * @tc.name testLongToByte3Part1_052
     * @tc.desc Verify decimal value 128 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(128);
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_5300
     * @tc.name testLongToByte3Part1_053
     * @tc.desc Verify decimal value -132 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(-132);
      expect(result).assertEqual(124);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_5400
     * @tc.name testLongToByte3Part1_054
     * @tc.desc Verify decimal value -192 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(-192);
      expect(result).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_5500
     * @tc.name testLongToByte3Part1_055
     * @tc.desc Verify decimal value -129 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(-129);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_5600
     * @tc.name testLongToByte3Part1_056
     * @tc.desc Verify decimal value 32768 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(32768);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_5700
     * @tc.name testLongToByte3Part1_057
     * @tc.desc Verify decimal value 32769 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(32769);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_5800
     * @tc.name testLongToByte3Part1_058
     * @tc.desc Verify decimal value -1001 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(-1001);
      expect(result).assertEqual(23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_5900
     * @tc.name testLongToByte3Part1_059
     * @tc.desc Verify decimal value -32768 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(-32768);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_6000
     * @tc.name testLongToByte3Part1_060
     * @tc.desc Verify decimal value -32769 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(-32769);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_6100
     * @tc.name testLongToByte3Part1_061
     * @tc.desc Verify hexadecimal value 0x0F converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0x0F);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_6200
     * @tc.name testLongToByte3Part1_062
     * @tc.desc Verify hexadecimal value 0xF0 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0xF0);
      expect(result).assertEqual(-16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_6300
     * @tc.name testLongToByte3Part1_063
     * @tc.desc Verify hexadecimal value 0x0FF0 converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0x0FF0);
      expect(result).assertEqual(-16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_6400
     * @tc.name testLongToByte3Part1_064
     * @tc.desc Verify hexadecimal value 0xF00F converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0xF00F);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_6500
     * @tc.name testLongToByte3Part1_065
     * @tc.desc Verify hexadecimal value 0x0A0B converted to byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(0x0A0B);
      expect(result).assertEqual(11);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_6600
     * @tc.name testLongToByte3Part1_066
     * @tc.desc Verify repeated calls return consistent byte result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: byte = Long.toByte(-55);
      const r2: byte = Long.toByte(-55);
      const r3: byte = Long.toByte(-55);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(r3);
      expect(r1).assertEqual(-55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE_PART1_6700
     * @tc.name testLongToByte3Part1_067
     * @tc.desc Verify decimal and hex literals produce equivalent byte result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToByte3Part1_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: byte = Long.toByte(26);
      const r2: byte = Long.toByte(0x1a);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(26);
    });

  });
}
