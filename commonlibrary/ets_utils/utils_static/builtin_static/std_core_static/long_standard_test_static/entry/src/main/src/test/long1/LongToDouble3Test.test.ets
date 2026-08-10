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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function longToDouble3Test(): void {
  describe('LongToDouble3Test', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_0100
     * @tc.name testLongToDouble3_001
     * @tc.desc Verify Long.toDouble converts hex single-digit positive value 0xa to double 10.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(0xa);
      expect(r).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_0200
     * @tc.name testLongToDouble3_002
     * @tc.desc Verify Long.toDouble converts hex power-of-two value 0x10 to double 16.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(0x10);
      expect(r).assertEqual(16.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_0300
     * @tc.name testLongToDouble3_003
     * @tc.desc Verify Long.toDouble converts hex power-of-two value 0x20 to double 32.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(0x20);
      expect(r).assertEqual(32.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_0400
     * @tc.name testLongToDouble3_004
     * @tc.desc Verify Long.toDouble converts hex power-of-two value 0x40 to double 64.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(0x40);
      expect(r).assertEqual(64.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_0500
     * @tc.name testLongToDouble3_005
     * @tc.desc Verify Long.toDouble converts hex byte-boundary value 0x80 to double 128.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(0x80);
      expect(r).assertEqual(128.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_0600
     * @tc.name testLongToDouble3_006
     * @tc.desc Verify Long.toDouble converts hex power-of-two value 0x100 to double 256.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(0x100);
      expect(r).assertEqual(256.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_0700
     * @tc.name testLongToDouble3_007
     * @tc.desc Verify Long.toDouble converts hex power-of-two value 0x200 to double 512.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(0x200);
      expect(r).assertEqual(512.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_0800
     * @tc.name testLongToDouble3_008
     * @tc.desc Verify Long.toDouble converts hex power-of-two value 0x400 to double 1024.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(0x400);
      expect(r).assertEqual(1024.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_0900
     * @tc.name testLongToDouble3_009
     * @tc.desc Verify Long.toDouble converts hex power-of-two value 0x800 to double 2048.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(0x800);
      expect(r).assertEqual(2048.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_1000
     * @tc.name testLongToDouble3_010
     * @tc.desc Verify Long.toDouble converts hex power-of-two value 0x1000 to double 4096.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(0x1000);
      expect(r).assertEqual(4096.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_1100
     * @tc.name testLongToDouble3_011
     * @tc.desc Verify Long.toDouble converts hex power-of-two value 0x2000 to double 8192.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(0x2000);
      expect(r).assertEqual(8192.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_1200
     * @tc.name testLongToDouble3_012
     * @tc.desc Verify Long.toDouble converts hex power-of-two value 0x4000 to double 16384.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(0x4000);
      expect(r).assertEqual(16384.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_1300
     * @tc.name testLongToDouble3_013
     * @tc.desc Verify Long.toDouble converts hex short-boundary value 0x8000 to double 32768.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(0x8000);
      expect(r).assertEqual(32768.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_1400
     * @tc.name testLongToDouble3_014
     * @tc.desc Verify Long.toDouble converts hex unsigned-short-boundary value 0x10000 to double 65536.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(0x10000);
      expect(r).assertEqual(65536.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_1500
     * @tc.name testLongToDouble3_015
     * @tc.desc Verify Long.toDouble converts hex negative value -0x10 to double -16.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(-0x10);
      expect(r).assertEqual(-16.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_1600
     * @tc.name testLongToDouble3_016
     * @tc.desc Verify Long.toDouble converts hex negative byte-boundary value -0x80 to double -128.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(-0x80);
      expect(r).assertEqual(-128.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_1700
     * @tc.name testLongToDouble3_017
     * @tc.desc Verify Long.toDouble converts hex negative value -0x100 to double -256.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(-0x100);
      expect(r).assertEqual(-256.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_1800
     * @tc.name testLongToDouble3_018
     * @tc.desc Verify Long.toDouble converts hex negative value -0x1000 to double -4096.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: double = Long.toDouble(-0x1000);
      expect(r).assertEqual(-4096.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_1900
     * @tc.name testLongToDouble3_019
     * @tc.desc Verify Long.toDouble converts hex zero value 0x0 to double 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0x0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_2000
     * @tc.name testLongToDouble3_020
     * @tc.desc Verify Long.toDouble converts octal zero value 0o0 to double 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0o0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_2100
     * @tc.name testLongToDouble3_021
     * @tc.desc Verify Long.toDouble converts binary zero value 0b0 to double 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0b0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_2200
     * @tc.name testLongToDouble3_022
     * @tc.desc Verify Long.toDouble converts hex byte-max value 0x7f to double 127.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0x7f)).assertEqual(127.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_2300
     * @tc.name testLongToDouble3_023
     * @tc.desc Verify Long.toDouble converts hex byte-full value 0xff to double 255.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0xff)).assertEqual(255.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_2400
     * @tc.name testLongToDouble3_024
     * @tc.desc Verify Long.toDouble converts binary byte-max value 0b01111111 to double 127.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0b01111111)).assertEqual(127.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_2500
     * @tc.name testLongToDouble3_025
     * @tc.desc Verify Long.toDouble converts hex short-max value 0x7fff to double 32767.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0x7fff)).assertEqual(32767.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_2600
     * @tc.name testLongToDouble3_026
     * @tc.desc Verify Long.toDouble converts hex short-min value -0x8000 to double -32768.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(-0x8000)).assertEqual(-32768.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_2700
     * @tc.name testLongToDouble3_027
     * @tc.desc Verify Long.toDouble converts hex unsigned-short-max value 0xffff to double 65535.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0xffff)).assertEqual(65535.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_2800
     * @tc.name testLongToDouble3_028
     * @tc.desc Verify Long.toDouble converts binary short-max value 0b111111111111111 to double 32767.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0b111111111111111)).assertEqual(32767.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_2900
     * @tc.name testLongToDouble3_029
     * @tc.desc Verify Long.toDouble converts hex int-max value 0x7fffffff to double 2147483647.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0x7fffffff)).assertEqual(2147483647.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_3000
     * @tc.name testLongToDouble3_030
     * @tc.desc Verify Long.toDouble converts hex int-min value -0x80000000 to double -2147483648.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(-0x80000000)).assertEqual(-2147483648.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_3100
     * @tc.name testLongToDouble3_031
     * @tc.desc Verify Long.toDouble converts negative one value -1 to double -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(-1)).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_3200
     * @tc.name testLongToDouble3_032
     * @tc.desc Verify Long.toDouble converts hex one value 0x1 to double 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0x1)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_3300
     * @tc.name testLongToDouble3_033
     * @tc.desc Verify Long.toDouble converts hex 2^20 value 0x100000 to double 1048576.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0x100000)).assertEqual(1048576.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_3400
     * @tc.name testLongToDouble3_034
     * @tc.desc Verify Long.toDouble converts hex 2^24 value 0x1000000 to double 16777216.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0x1000000)).assertEqual(16777216.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_3500
     * @tc.name testLongToDouble3_035
     * @tc.desc Verify Long.toDouble converts binary one value 0b1 to double 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0b1)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_3600
     * @tc.name testLongToDouble3_036
     * @tc.desc Verify Long.toDouble converts binary value 0b10 to double 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0b10)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_3700
     * @tc.name testLongToDouble3_037
     * @tc.desc Verify Long.toDouble converts binary value 0b100 to double 4.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0b100)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_3800
     * @tc.name testLongToDouble3_038
     * @tc.desc Verify Long.toDouble converts binary value 0b1000 to double 8.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0b1000)).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_3900
     * @tc.name testLongToDouble3_039
     * @tc.desc Verify Long.toDouble converts binary value 0b10000 to double 16.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0b10000)).assertEqual(16.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_4000
     * @tc.name testLongToDouble3_040
     * @tc.desc Verify Long.toDouble converts octal value 0o10 to double 8.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0o10)).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_4100
     * @tc.name testLongToDouble3_041
     * @tc.desc Verify Long.toDouble converts octal value 0o100 to double 64.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0o100)).assertEqual(64.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_4200
     * @tc.name testLongToDouble3_042
     * @tc.desc Verify Long.toDouble converts octal value 0o1000 to double 512.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0o1000)).assertEqual(512.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_4300
     * @tc.name testLongToDouble3_043
     * @tc.desc Verify Long.toDouble converts octal value 0o10000 to double 4096.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0o10000)).assertEqual(4096.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_4400
     * @tc.name testLongToDouble3_044
     * @tc.desc Verify Long.toDouble converts octal short-boundary value 0o100000 to double 32768.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toDouble(0o100000)).assertEqual(32768.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_4500
     * @tc.name testLongToDouble3_045
     * @tc.desc Verify Long.toDouble returns consistent results for Long.MIN_VALUE repeated conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: number = Long.toDouble(Long.MIN_VALUE);
      let r2: number = Long.toDouble(Long.MIN_VALUE);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(-9.223372036854776e18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_4600
     * @tc.name testLongToDouble3_046
     * @tc.desc Verify Long.toDouble returns equal results for decimal 255 and hex 0xff literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: number = Long.toDouble(255);
      let r2: number = Long.toDouble(0xff);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(255.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_4700
     * @tc.name testLongToDouble3_047
     * @tc.desc Verify Long.toDouble returns equal results for decimal 8 and octal 0o10 literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: number = Long.toDouble(8);
      let r2: number = Long.toDouble(0o10);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_4800
     * @tc.name testLongToDouble3_048
     * @tc.desc Verify Long.toDouble returns equal results for decimal 16 and binary 0b10000 literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: number = Long.toDouble(16);
      let r2: number = Long.toDouble(0b10000);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(16.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_4900
     * @tc.name testLongToDouble3_049
     * @tc.desc Verify Long.toDouble returns equal results for decimal int-max and hex 0x7fffffff literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: number = Long.toDouble(2147483647);
      let r2: number = Long.toDouble(0x7fffffff);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(2147483647.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_5000
     * @tc.name testLongToDouble3_050
     * @tc.desc Verify Long.toDouble converts decimal value 42 to double 42.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(42);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_5100
     * @tc.name testLongToDouble3_051
     * @tc.desc Verify Long.toDouble handles double-precision rounding at 2^55 plus 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(36028797018963970);
      expect(result).assertEqual(36028797018963968.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TODOUBLE3_5200
     * @tc.name testLongToDouble3_052
     * @tc.desc Verify Long.toDouble handles double-precision rounding at 2^55 plus 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToDouble3_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(36028797018963974);
      expect(result).assertEqual(36028797018963976.0);
    });
  });
}
