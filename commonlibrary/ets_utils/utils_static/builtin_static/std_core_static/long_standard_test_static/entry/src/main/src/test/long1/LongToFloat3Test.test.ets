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

export default function longToFloat3Test(): void {
  describe('LongToFloat3Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_0100
     * @tc.name testLongToFloat3_001
     * @tc.desc Verify Long.toFloat converts MAX_VALUE to approximate float 9.223372036854776e18f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(9223372036854775807);
      expect(r).assertClose(9.223372036854776e18f, 1.0e6f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_0200
     * @tc.name testLongToFloat3_002
     * @tc.desc Verify Long.toFloat converts MIN_VALUE to approximate float -9.223372036854776e18f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(Long.MIN_VALUE);
      expect(r).assertClose(-9.223372036854776e18f, 1.0e6f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_0300
     * @tc.name testLongToFloat3_003
     * @tc.desc Verify Long.toFloat converts MAX-neighbor value to approximate float 9.223372036854775e18f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(9223372036854774807);
      expect(r).assertClose(9.223372036854775e18f, 1.0e6f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_0400
     * @tc.name testLongToFloat3_004
     * @tc.desc Verify Long.toFloat converts MIN-neighbor value to approximate float -9.223372036854775e18f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(-9223372036854774808);
      expect(r).assertClose(-9.223372036854775e18f, 1.0e6f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_0500
     * @tc.name testLongToFloat3_005
     * @tc.desc Verify Long.toFloat converts negative one to float -1.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(-1);
      expect(r).assertEqual(-1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_0600
     * @tc.name testLongToFloat3_006
     * @tc.desc Verify Long.toFloat converts hex zero to float 0.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0x0);
      expect(r).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_0700
     * @tc.name testLongToFloat3_007
     * @tc.desc Verify Long.toFloat converts hex one to float 1.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0x1);
      expect(r).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_0800
     * @tc.name testLongToFloat3_008
     * @tc.desc Verify Long.toFloat converts hex value 0xA to float 10.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0xA);
      expect(r).assertEqual(10.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_0900
     * @tc.name testLongToFloat3_009
     * @tc.desc Verify Long.toFloat converts hex value 0xF to float 15.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0xF);
      expect(r).assertEqual(15.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_1000
     * @tc.name testLongToFloat3_010
     * @tc.desc Verify Long.toFloat converts hex value 0x10 to float 16.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0x10);
      expect(r).assertEqual(16.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_1100
     * @tc.name testLongToFloat3_011
     * @tc.desc Verify Long.toFloat converts hex byte-max value 0x7F to float 127.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0x7F);
      expect(r).assertEqual(127.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_1200
     * @tc.name testLongToFloat3_012
     * @tc.desc Verify Long.toFloat converts hex byte-boundary value 0x80 to float 128.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0x80);
      expect(r).assertEqual(128.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_1300
     * @tc.name testLongToFloat3_013
     * @tc.desc Verify Long.toFloat converts hex byte-full value 0xFF to float 255.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0xFF);
      expect(r).assertEqual(255.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_1400
     * @tc.name testLongToFloat3_014
     * @tc.desc Verify Long.toFloat converts hex value 0x100 to float 256.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0x100);
      expect(r).assertEqual(256.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_1500
     * @tc.name testLongToFloat3_015
     * @tc.desc Verify Long.toFloat converts hex short-max value 0x7FFF to float 32767.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0x7FFF);
      expect(r).assertEqual(32767.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_1600
     * @tc.name testLongToFloat3_016
     * @tc.desc Verify Long.toFloat converts hex short-boundary value 0x8000 to float 32768.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0x8000);
      expect(r).assertEqual(32768.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_1700
     * @tc.name testLongToFloat3_017
     * @tc.desc Verify Long.toFloat converts hex unsigned-short-max value 0xFFFF to float 65535.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0xFFFF);
      expect(r).assertEqual(65535.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_1800
     * @tc.name testLongToFloat3_018
     * @tc.desc Verify Long.toFloat converts hex value 0x10000 to float 65536.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0x10000);
      expect(r).assertEqual(65536.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_1900
     * @tc.name testLongToFloat3_019
     * @tc.desc Verify Long.toFloat converts hex int-max value 0x7FFFFFFF to float 2147483648.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0x7FFFFFFF);
      expect(r).assertEqual(2147483648.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_2000
     * @tc.name testLongToFloat3_020
     * @tc.desc Verify Long.toFloat converts hex int-boundary value 0x80000000 to approximate float 2.147483648e9f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0x80000000);
      expect(r).assertClose(2.147483648e9f, 1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_2100
     * @tc.name testLongToFloat3_021
     * @tc.desc Verify Long.toFloat converts hex 2^32 value 0x100000000 to approximate float 4.294967296e9f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0x100000000);
      expect(r).assertClose(4.294967296e9f, 1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_2200
     * @tc.name testLongToFloat3_022
     * @tc.desc Verify Long.toFloat converts hex 2^33 value 0x1FFFFFFFF to approximate float 8.589934591e9f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0x1FFFFFFFF);
      expect(r).assertClose(8.589934591e9f, 1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_2300
     * @tc.name testLongToFloat3_023
     * @tc.desc Verify Long.toFloat converts hex value 0xABCDEF to float 11259375.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0xABCDEF);
      expect(r).assertEqual(11259375.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_2400
     * @tc.name testLongToFloat3_024
     * @tc.desc Verify Long.toFloat converts hex value 0xDEADBEEF to approximate float 3.735928878e9f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0xDEADBEEF);
      expect(r).assertClose(3.735928878e9f, 1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_2500
     * @tc.name testLongToFloat3_025
     * @tc.desc Verify Long.toFloat converts octal zero to float 0.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0o0);
      expect(r).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_2600
     * @tc.name testLongToFloat3_026
     * @tc.desc Verify Long.toFloat converts octal one to float 1.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0o1);
      expect(r).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_2700
     * @tc.name testLongToFloat3_027
     * @tc.desc Verify Long.toFloat converts octal value 0o7 to float 7.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0o7);
      expect(r).assertEqual(7.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_2800
     * @tc.name testLongToFloat3_028
     * @tc.desc Verify Long.toFloat converts octal value 0o10 to float 8.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0o10);
      expect(r).assertEqual(8.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_2900
     * @tc.name testLongToFloat3_029
     * @tc.desc Verify Long.toFloat converts octal value 0o77 to float 63.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0o77);
      expect(r).assertEqual(63.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_3000
     * @tc.name testLongToFloat3_030
     * @tc.desc Verify Long.toFloat converts octal value 0o100 to float 64.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0o100);
      expect(r).assertEqual(64.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_3100
     * @tc.name testLongToFloat3_031
     * @tc.desc Verify Long.toFloat converts octal byte-max value 0o177 to float 127.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0o177);
      expect(r).assertEqual(127.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_3200
     * @tc.name testLongToFloat3_032
     * @tc.desc Verify Long.toFloat converts octal byte-boundary value 0o200 to float 128.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0o200);
      expect(r).assertEqual(128.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_3300
     * @tc.name testLongToFloat3_033
     * @tc.desc Verify Long.toFloat converts octal short-max value 0o77777 to float 32767.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0o77777);
      expect(r).assertEqual(32767.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_3400
     * @tc.name testLongToFloat3_034
     * @tc.desc Verify Long.toFloat converts octal short-boundary value 0o100000 to float 32768.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0o100000);
      expect(r).assertEqual(32768.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_3500
     * @tc.name testLongToFloat3_035
     * @tc.desc Verify Long.toFloat converts octal unsigned-short-max value 0o177777 to float 65535.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0o177777);
      expect(r).assertEqual(65535.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_3600
     * @tc.name testLongToFloat3_036
     * @tc.desc Verify Long.toFloat converts octal value 0o200000 to float 65536.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0o200000);
      expect(r).assertEqual(65536.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_3700
     * @tc.name testLongToFloat3_037
     * @tc.desc Verify Long.toFloat converts octal 2^32 value 0o37777777777 to approximate float 4.294967295e9f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0o37777777777);
      expect(r).assertClose(4.294967295e9f, 1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_3800
     * @tc.name testLongToFloat3_038
     * @tc.desc Verify Long.toFloat converts binary zero to float 0.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0b0);
      expect(r).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_3900
     * @tc.name testLongToFloat3_039
     * @tc.desc Verify Long.toFloat converts binary one to float 1.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0b1);
      expect(r).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_4000
     * @tc.name testLongToFloat3_040
     * @tc.desc Verify Long.toFloat converts binary value 0b10 to float 2.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0b10);
      expect(r).assertEqual(2.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_4100
     * @tc.name testLongToFloat3_041
     * @tc.desc Verify Long.toFloat converts binary value 0b100 to float 4.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0b100);
      expect(r).assertEqual(4.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_4200
     * @tc.name testLongToFloat3_042
     * @tc.desc Verify Long.toFloat converts binary value 0b1000 to float 8.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0b1000);
      expect(r).assertEqual(8.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_4300
     * @tc.name testLongToFloat3_043
     * @tc.desc Verify Long.toFloat converts binary byte-max value 0b1111111 to float 127.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0b1111111);
      expect(r).assertEqual(127.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_4400
     * @tc.name testLongToFloat3_044
     * @tc.desc Verify Long.toFloat converts binary byte-boundary value 0b10000000 to float 128.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0b10000000);
      expect(r).assertEqual(128.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_4500
     * @tc.name testLongToFloat3_045
     * @tc.desc Verify Long.toFloat converts binary short-max value 0b111111111111111 to float 32767.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0b111111111111111);
      expect(r).assertEqual(32767.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_4600
     * @tc.name testLongToFloat3_046
     * @tc.desc Verify Long.toFloat converts binary value 0b10000000000000000 to float 65536.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0b10000000000000000);
      expect(r).assertEqual(65536.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_4700
     * @tc.name testLongToFloat3_047
     * @tc.desc Verify Long.toFloat converts binary value 0b1010101010101010 to float 43690.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0b1010101010101010);
      expect(r).assertEqual(43690.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_4800
     * @tc.name testLongToFloat3_048
     * @tc.desc Verify Long.toFloat converts binary 2^24-minus-one value to float 16777215.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0b111111111111111111111111);
      expect(r).assertEqual(16777215.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_4900
     * @tc.name testLongToFloat3_049
     * @tc.desc Verify Long.toFloat converts binary 2^24 value to float 16777216.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = Long.toFloat(0b1000000000000000000000000);
      expect(r).assertEqual(16777216.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_5000
     * @tc.name testLongToFloat3_050
     * @tc.desc Verify instance toFloat converts 2^30-minus-one Long to approximate float 1.073741823e9f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = new Long(1073741823).toFloat();
      expect(r).assertClose(1.073741823e9f, 1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_5100
     * @tc.name testLongToFloat3_051
     * @tc.desc Verify instance toFloat converts negative 2^30-minus-one Long to approximate float -1.073741823e9f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = new Long(-1073741823).toFloat();
      expect(r).assertClose(-1.073741823e9f, 1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_5200
     * @tc.name testLongToFloat3_052
     * @tc.desc Verify instance toFloat converts small positive Long 3 to float 3.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: Long = new Long(3);
      const f: float = v.toFloat();
      expect(f).assertEqual(3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_5300
     * @tc.name testLongToFloat3_053
     * @tc.desc Verify instance toFloat equals static toFloat for negative value -34567
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i: float = new Long(-34567).toFloat();
      const s: float = Long.toFloat(-34567);
      expect(i).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_5400
     * @tc.name testLongToFloat3_054
     * @tc.desc Verify instance toFloat collapses MAX-neighbor value to same float as MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: float = new Long(9223372036854775806).toFloat();
      const r2: float = new Long(9223372036854775807).toFloat();
      expect(r1).assertEqual(r2);
      expect(r1).assertClose(9.223372036854776e18f, 1.0e6f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_5500
     * @tc.name testLongToFloat3_055
     * @tc.desc Verify instance toFloat of MAX-neighbor value is less or equal to 9.223372036854776e18f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = new Long(9223372036854765807).toFloat();
      expect(r).assertLessOrEqual(9.223372036854776e18f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_5600
     * @tc.name testLongToFloat3_056
     * @tc.desc Verify instance toFloat converts 2^62-minus-one Long to approximate float 4.611686018427387903e18f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = new Long(4611686018427387903).toFloat();
      expect(r).assertClose(4.611686018427387903e18f, 1.0e5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_5700
     * @tc.name testLongToFloat3_057
     * @tc.desc Verify instance toFloat converts 2^61-minus-one Long to approximate float 2.305843009213693951e18f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = new Long(2305843009213693951).toFloat();
      expect(r).assertClose(2.305843009213693951e18f, 1.0e4f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_5800
     * @tc.name testLongToFloat3_058
     * @tc.desc Verify instance toFloat collapses MIN-neighbor value to same float as MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: float = new Long(-9223372036854775807).toFloat();
      const r2: float = new Long(Long.MIN_VALUE).toFloat();
      expect(r1).assertEqual(r2);
      expect(r1).assertClose(-9.223372036854776e18f, 1.0e6f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_5900
     * @tc.name testLongToFloat3_059
     * @tc.desc Verify instance toFloat converts negative 2^62 Long to approximate float -4.611686018427387904e18f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = new Long(-4611686018427387904).toFloat();
      expect(r).assertClose(-4.611686018427387904e18f, 1.0e5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_6000
     * @tc.name testLongToFloat3_060
     * @tc.desc Verify instance toFloat converts negative one Long to float -1.0f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = new Long(-1).toFloat();
      expect(r).assertEqual(-1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_6100
     * @tc.name testLongToFloat3_061
     * @tc.desc Verify instance toFloat converts 18-digit Long to approximate float 9.87654321098765432e17f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = new Long(987654321098765432).toFloat();
      expect(r).assertClose(9.87654321098765432e17f, 1.0e10f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_6200
     * @tc.name testLongToFloat3_062
     * @tc.desc Verify instance toFloat converts 18-digit Long to approximate float 1.0e18f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = new Long(999999999999999999).toFloat();
      expect(r).assertClose(1.0e18f, 1.0e8f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_6300
     * @tc.name testLongToFloat3_063
     * @tc.desc Verify instance toFloat returns equal floats for decimal 255 and hex 0xFF Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: float = new Long(255).toFloat();
      const r2: float = new Long(0xFF).toFloat();
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(255.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_6400
     * @tc.name testLongToFloat3_064
     * @tc.desc Verify instance toFloat returns equal floats for decimal 65535 and hex 0xFFFF Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: float = new Long(65535).toFloat();
      const r2: float = new Long(0xFFFF).toFloat();
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(65535.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_6500
     * @tc.name testLongToFloat3_065
     * @tc.desc Verify instance toFloat returns equal floats for decimal 16777215 and hex 0xFFFFFF Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: float = new Long(16777215).toFloat();
      const r2: float = new Long(0xFFFFFF).toFloat();
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(16777215.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_6600
     * @tc.name testLongToFloat3_066
     * @tc.desc Verify instance toFloat returns equal floats for decimal int-max and hex 0x7FFFFFFF Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: float = new Long(2147483647).toFloat();
      const r2: float = new Long(0x7FFFFFFF).toFloat();
      expect(r1).assertEqual(r2);
      expect(r1).assertClose(2.147483648e9f, 1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_6700
     * @tc.name testLongToFloat3_067
     * @tc.desc Verify instance toFloat equals static toFloat for 4294967295 Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: float = new Long(4294967295).toFloat();
      const r2: float = Long.toFloat(4294967295);
      expect(r1).assertEqual(r2);
      expect(r1).assertClose(4.294967296e9f, 1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_6800
     * @tc.name testLongToFloat3_068
     * @tc.desc Verify instance toFloat returns consistent results for repeated calls on -1 Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: float = new Long(-1).toFloat();
      const r2: float = new Long(-1).toFloat();
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(-1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_6900
     * @tc.name testLongToFloat3_069
     * @tc.desc Verify instance toFloat converts hex 0xDEADBEEF Long to approximate float 3.735928753e9f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = new Long(0xDEADBEEF).toFloat();
      expect(r).assertClose(3.735928753e9f, 1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOFLOAT3_7000
     * @tc.name testLongToFloat3_070
     * @tc.desc Verify instance toFloat converts hex 0xCAFEBABE Long to approximate float 3.405690014e9f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToFloat3_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: float = new Long(0xCAFEBABE).toFloat();
      expect(r).assertClose(3.405690014e9f, 1.0f);
    });
  })
}