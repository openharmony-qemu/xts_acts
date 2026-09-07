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

export default function longToShort3Test(): void {
  describe('LongToShort3Test', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0010
     * @tc.name testLongToShort3_001
     * @tc.desc Verify zero value converts to short 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(0x0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0020
     * @tc.name testLongToShort3_002
     * @tc.desc Verify hex literal 0x1 converts to short 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(0x1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0030
     * @tc.name testLongToShort3_003
     * @tc.desc Verify in-range negative value -255 converts to short -255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-255)).assertEqual(-255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0040
     * @tc.name testLongToShort3_004
     * @tc.desc Verify in-range negative value -256 converts to short -256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-256)).assertEqual(-256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0050
     * @tc.name testLongToShort3_005
     * @tc.desc Verify in-range positive value 16383 converts to short 16383
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(16383)).assertEqual(16383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0060
     * @tc.name testLongToShort3_006
     * @tc.desc Verify in-range positive value 16384 converts to short 16384
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(16384)).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0070
     * @tc.name testLongToShort3_007
     * @tc.desc Verify value at short maximum boundary 32767 converts to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(0x7fff)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0080
     * @tc.name testLongToShort3_008
     * @tc.desc Verify in-range negative value -16384 converts to short -16384
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-16384)).assertEqual(-16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0090
     * @tc.name testLongToShort3_009
     * @tc.desc Verify value one above short maximum wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(0x8000)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0100
     * @tc.name testLongToShort3_010
     * @tc.desc Verify value two above short maximum wraps to -32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(32769)).assertEqual(-32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0110
     * @tc.name testLongToShort3_011
     * @tc.desc Verify value three above short maximum wraps to -32766
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(32770)).assertEqual(-32766);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0120
     * @tc.name testLongToShort3_012
     * @tc.desc Verify value 65537 above short maximum wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(65537)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0130
     * @tc.name testLongToShort3_013
     * @tc.desc Verify value one below short minimum wraps to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-32769)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0140
     * @tc.name testLongToShort3_014
     * @tc.desc Verify value two below short minimum wraps to 32766
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-32770)).assertEqual(32766);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0150
     * @tc.name testLongToShort3_015
     * @tc.desc Verify value at 16-bit boundary wraps to short 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-65535)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0160
     * @tc.name testLongToShort3_016
     * @tc.desc Verify value above short maximum wraps to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(65538)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0170
     * @tc.name testLongToShort3_017
     * @tc.desc Verify value above short maximum wraps to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(65539)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0180
     * @tc.name testLongToShort3_018
     * @tc.desc Verify value above short maximum wraps to -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(65534)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0190
     * @tc.name testLongToShort3_019
     * @tc.desc Verify value above short maximum wraps to -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(65533)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0200
     * @tc.name testLongToShort3_020
     * @tc.desc Verify value above short maximum wraps to 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(65540)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0210
     * @tc.name testLongToShort3_021
     * @tc.desc Verify value above short maximum wraps to -6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(65530)).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0220
     * @tc.name testLongToShort3_022
     * @tc.desc Verify value below short minimum wraps to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-65534)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0230
     * @tc.name testLongToShort3_023
     * @tc.desc Verify value -65537 below short minimum wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-65537)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0240
     * @tc.name testLongToShort3_024
     * @tc.desc Verify value below short minimum wraps to 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-65530)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0250
     * @tc.name testLongToShort3_025
     * @tc.desc Verify value below short minimum wraps to -4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-65540)).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0260
     * @tc.name testLongToShort3_026
     * @tc.desc Verify value 131073 above short maximum wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(131073)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0270
     * @tc.name testLongToShort3_027
     * @tc.desc Verify value 131071 above short maximum wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(131071)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0280
     * @tc.name testLongToShort3_028
     * @tc.desc Verify value 196607 above short maximum wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(196607)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0290
     * @tc.name testLongToShort3_029
     * @tc.desc Verify value 262145 above short maximum wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(262145)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0300
     * @tc.name testLongToShort3_030
     * @tc.desc Verify value 262143 above short maximum wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(262143)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0310
     * @tc.name testLongToShort3_031
     * @tc.desc Verify value -131073 below short minimum wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-131073)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0320
     * @tc.name testLongToShort3_032
     * @tc.desc Verify value -131071 below short minimum wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-131071)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0330
     * @tc.name testLongToShort3_033
     * @tc.desc Verify value -196607 below short minimum wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-196607)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0340
     * @tc.name testLongToShort3_034
     * @tc.desc Verify value -196609 below short minimum wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-196609)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0350
     * @tc.name testLongToShort3_035
     * @tc.desc Verify value -262145 below short minimum wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-262145)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0360
     * @tc.name testLongToShort3_036
     * @tc.desc Verify value -262143 below short minimum wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-262143)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0370
     * @tc.name testLongToShort3_037
     * @tc.desc Verify large value 2147483647 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0380
     * @tc.name testLongToShort3_038
     * @tc.desc Verify large value 1000000000 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(1000000000)).assertEqual(-13824);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0390
     * @tc.name testLongToShort3_039
     * @tc.desc Verify large value 1234567890 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(1234567890)).assertEqual(722);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0400
     * @tc.name testLongToShort3_040
     * @tc.desc Verify large value 987654321 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(987654321)).assertEqual(26801);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0410
     * @tc.name testLongToShort3_041
     * @tc.desc Verify large negative value -1000000000 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-1000000000)).assertEqual(13824);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0420
     * @tc.name testLongToShort3_042
     * @tc.desc Verify large negative value -1234567890 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-1234567890)).assertEqual(-722);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0430
     * @tc.name testLongToShort3_043
     * @tc.desc Verify large negative value -987654321 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-987654321)).assertEqual(-26801);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0440
     * @tc.name testLongToShort3_044
     * @tc.desc Verify large negative value -2147483647 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-2147483647)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0450
     * @tc.name testLongToShort3_045
     * @tc.desc Verify large negative value -1073741825 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-1073741825)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0460
     * @tc.name testLongToShort3_046
     * @tc.desc Verify large negative value -9223372036854775807 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-9223372036854775807)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0470
     * @tc.name testLongToShort3_047
     * @tc.desc Verify in-range negative value -1 converts to short -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0480
     * @tc.name testLongToShort3_048
     * @tc.desc Verify large value 10000000000 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(10000000000)).assertEqual(-7168);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0490
     * @tc.name testLongToShort3_049
     * @tc.desc Verify large negative value -10000000000 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-10000000000)).assertEqual(7168);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0500
     * @tc.name testLongToShort3_050
     * @tc.desc Verify large value 5000000000 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(5000000000)).assertEqual(-3584);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0510
     * @tc.name testLongToShort3_051
     * @tc.desc Verify large negative value -5000000000 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-5000000000)).assertEqual(3584);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0520
     * @tc.name testLongToShort3_052
     * @tc.desc Verify large value 15000000000 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(15000000000)).assertEqual(-10752);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0530
     * @tc.name testLongToShort3_053
     * @tc.desc Verify large negative value -15000000000 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-15000000000)).assertEqual(10752);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0540
     * @tc.name testLongToShort3_054
     * @tc.desc Verify large value 20000000000 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(20000000000)).assertEqual(-14336);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0550
     * @tc.name testLongToShort3_055
     * @tc.desc Verify large negative value -20000000000 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-20000000000)).assertEqual(14336);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0560
     * @tc.name testLongToShort3_056
     * @tc.desc Verify large value 9999999999 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(9999999999)).assertEqual(-7169);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0570
     * @tc.name testLongToShort3_057
     * @tc.desc Verify large negative value -9999999999 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(-9999999999)).assertEqual(7169);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0580
     * @tc.name testLongToShort3_058
     * @tc.desc Verify hex literal 0x1234 converts to short 4660
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(0x1234)).assertEqual(4660);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0590
     * @tc.name testLongToShort3_059
     * @tc.desc Verify value above short maximum wraps to -21555
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(0xabcd)).assertEqual(-21555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0600
     * @tc.name testLongToShort3_060
     * @tc.desc Verify value 0xc000 above short maximum wraps to -16384
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(0xc000)).assertEqual(-16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0610
     * @tc.name testLongToShort3_061
     * @tc.desc Verify hex literal 0x5555 converts to short 21845
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(0x5555)).assertEqual(21845);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0620
     * @tc.name testLongToShort3_062
     * @tc.desc Verify value above short maximum wraps to -21846
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(0xaaaa)).assertEqual(-21846);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0630
     * @tc.name testLongToShort3_063
     * @tc.desc Verify value above short maximum wraps to 16384
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(81920)).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0640
     * @tc.name testLongToShort3_064
     * @tc.desc Verify value 114688 above short maximum wraps to -16384
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(114688)).assertEqual(-16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0650
     * @tc.name testLongToShort3_065
     * @tc.desc Verify value 163840 above short maximum wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toShort(163840)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0660
     * @tc.name testLongToShort3_066
     * @tc.desc Verify value at 16-bit boundary wraps to short -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: short = Long.toShort(65535);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0670
     * @tc.name testLongToShort3_067
     * @tc.desc Verify multiple 65536 of 2^16 wraps to short 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: short = Long.toShort(65536);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0680
     * @tc.name testLongToShort3_068
     * @tc.desc Verify large value 11259375 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: short = Long.toShort(0xabcdef);
      expect(result).assertEqual(-12817);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0690
     * @tc.name testLongToShort3_069
     * @tc.desc Verify repeated calls return consistent short result for 0xabcdef
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(0xabcdef);
      let r2: short = Long.toShort(0xabcdef);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(-12817);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0700
     * @tc.name testLongToShort3_070
     * @tc.desc Verify repeated calls return consistent short result for 0x5555
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(0x5555);
      let r2: short = Long.toShort(0x5555);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(21845);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0710
     * @tc.name testLongToShort3_071
     * @tc.desc Verify hex literal 0x0fff converts to short 4095
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: short = Long.toShort(0x0fff);
      expect(result).assertEqual(4095);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0720
     * @tc.name testLongToShort3_072
     * @tc.desc Verify large value 1000000 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: short = Long.toShort(1000000);
      expect(result).assertEqual(16960);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0730
     * @tc.name testLongToShort3_073
     * @tc.desc Verify value 0x18000 above short maximum wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: short = Long.toShort(0x18000);
      expect(r).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0740
     * @tc.name testLongToShort3_074
     * @tc.desc Verify large value 305419896 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: short = Long.toShort(0x12345678);
      expect(r).assertEqual(22136);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0750
     * @tc.name testLongToShort3_075
     * @tc.desc Verify large value 3735928559 truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: short = Long.toShort(0xdeadbeef);
      expect(r).assertEqual(-16657);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0760
     * @tc.name testLongToShort3_076
     * @tc.desc Verify hex literal 0x3333 converts to short 13107
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: short = Long.toShort(0x3333);
      expect(r).assertEqual(13107);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0770
     * @tc.name testLongToShort3_077
     * @tc.desc Verify value above short maximum wraps to -13108
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: short = Long.toShort(0xcccc);
      expect(r).assertEqual(-13108);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0780
     * @tc.name testLongToShort3_078
     * @tc.desc Verify value above short maximum wraps to -3856
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: short = Long.toShort(0xf0f0);
      expect(r).assertEqual(-3856);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0790
     * @tc.name testLongToShort3_079
     * @tc.desc Verify hex literal 0x0f0f converts to short 3855
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: short = Long.toShort(0x0f0f);
      expect(r).assertEqual(3855);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0800
     * @tc.name testLongToShort3_080
     * @tc.desc Verify hex literal 0x1111 converts to short 4369
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: short = Long.toShort(0x1111);
      expect(r).assertEqual(4369);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0810
     * @tc.name testLongToShort3_081
     * @tc.desc Verify hex literal 0x2222 converts to short 8738
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: short = Long.toShort(0x2222);
      expect(r).assertEqual(8738);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0820
     * @tc.name testLongToShort3_082
     * @tc.desc Verify hex literal 0x4444 converts to short 17476
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: short = Long.toShort(0x4444);
      expect(r).assertEqual(17476);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0830
     * @tc.name testLongToShort3_083
     * @tc.desc Verify value above short maximum wraps to -30584
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: short = Long.toShort(0x8888);
      expect(r).assertEqual(-30584);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0840
     * @tc.name testLongToShort3_084
     * @tc.desc Verify 65535 and 0xffff literals produce equivalent short result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(65535);
      let r2: short = Long.toShort(0xffff);
      expect(r1).assertEqual(-1);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0850
     * @tc.name testLongToShort3_085
     * @tc.desc Verify 32768 and 0x8000 literals produce equivalent short result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(32768);
      let r2: short = Long.toShort(0x8000);
      expect(r1).assertEqual(-32768);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0860
     * @tc.name testLongToShort3_086
     * @tc.desc Verify 65536 and 0x10000 literals produce equivalent short result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(65536);
      let r2: short = Long.toShort(0x10000);
      expect(r1).assertEqual(0);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0870
     * @tc.name testLongToShort3_087
     * @tc.desc Verify 42 and 0x2a literals produce equivalent short result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(42);
      let r2: short = Long.toShort(0x2a);
      expect(r1).assertEqual(42);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0880
     * @tc.name testLongToShort3_088
     * @tc.desc Verify 100 and 0x64 literals produce equivalent short result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(100);
      let r2: short = Long.toShort(0x64);
      expect(r1).assertEqual(100);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0890
     * @tc.name testLongToShort3_089
     * @tc.desc Verify value 0x10001 truncates to the same short result as reference 0x1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(0x10001);
      let r2: short = Long.toShort(0x1);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0900
     * @tc.name testLongToShort3_090
     * @tc.desc Verify value 0x20001 truncates to the same short result as reference 0x1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(0x20001);
      let r2: short = Long.toShort(0x1);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0910
     * @tc.name testLongToShort3_091
     * @tc.desc Verify value 0x30001 truncates to the same short result as reference 0x1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(0x30001);
      let r2: short = Long.toShort(0x1);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0920
     * @tc.name testLongToShort3_092
     * @tc.desc Verify value 0x1ffff truncates to the same short result as reference 0xffff
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(0x1ffff);
      let r2: short = Long.toShort(0xffff);
      expect(r1).assertEqual(-1);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0930
     * @tc.name testLongToShort3_093
     * @tc.desc Verify value 0x2ffff truncates to the same short result as reference 0xffff
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(0x2ffff);
      let r2: short = Long.toShort(0xffff);
      expect(r1).assertEqual(-1);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0940
     * @tc.name testLongToShort3_094
     * @tc.desc Verify value 0x3ffff truncates to the same short result as reference 0xffff
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(0x3ffff);
      let r2: short = Long.toShort(0xffff);
      expect(r1).assertEqual(-1);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0950
     * @tc.name testLongToShort3_095
     * @tc.desc Verify value 0x18000 truncates to the same short result as reference 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(0x18000);
      let r2: short = Long.toShort(0x8000);
      expect(r1).assertEqual(-32768);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0960
     * @tc.name testLongToShort3_096
     * @tc.desc Verify value 0x28000 truncates to the same short result as reference 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(0x28000);
      let r2: short = Long.toShort(0x8000);
      expect(r1).assertEqual(-32768);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0970
     * @tc.name testLongToShort3_097
     * @tc.desc Verify value 0x38000 truncates to the same short result as reference 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(0x38000);
      let r2: short = Long.toShort(0x8000);
      expect(r1).assertEqual(-32768);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0980
     * @tc.name testLongToShort3_098
     * @tc.desc Verify value 0x10007fff truncates to the same short result as reference 0x7fff
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(0x10007fff);
      let r2: short = Long.toShort(0x7fff);
      expect(r1).assertEqual(32767);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_0990
     * @tc.name testLongToShort3_099
     * @tc.desc Verify repeated calls return consistent short result for zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: short = Long.toShort(0);
      let r2: short = Long.toShort(0);
      expect(r1).assertEqual(0);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_1000
     * @tc.name testLongToShort3_100
     * @tc.desc Verify maximum long value truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(Long.MAX_VALUE);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_1010
     * @tc.name testLongToShort3_101
     * @tc.desc Verify minimum long value truncates to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(Long.MIN_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_1020
     * @tc.name testLongToShort3_102
     * @tc.desc Verify multiple -65536 of 2^16 wraps to short 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(-65536);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_1030
     * @tc.name testLongToShort3_103
     * @tc.desc Verify value at short minimum boundary -32768 converts to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(-32768);
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_1040
     * @tc.name testLongToShort3_104
     * @tc.desc Verify hexadecimal literal 0xffff and decimal 65535 convert to the same short value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: short = Long.toShort(0xffff);
      const r2: short = Long.toShort(65535);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT3_1050
     * @tc.name testLongToShort3_105
     * @tc.desc Verify hexadecimal literal 0x2a and decimal 42 convert to the same short value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToShort3_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: short = Long.toShort(0x2a);
      const r2: short = Long.toShort(42);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(42);
    });
  });
}
