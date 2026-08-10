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

export default function longToInt3Test(): void {
  describe('LongToInt3Test', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_0100
     * @tc.name testLongToInt3_001
     * @tc.desc Verify large value 72057594037927935 truncates to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(72057594037927935);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_0200
     * @tc.name testLongToInt3_002
     * @tc.desc Verify multiple 72057594037927936 of 2^32 wraps to int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(72057594037927936);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_0300
     * @tc.name testLongToInt3_003
     * @tc.desc Verify in-range negative value -1 converts to int -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(-1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_0400
     * @tc.name testLongToInt3_004
     * @tc.desc Verify multiple 0x100000000 of 2^32 wraps to int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(0x100000000);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_0500
     * @tc.name testLongToInt3_005
     * @tc.desc Verify value 0x100000001 above int maximum wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(0x100000001);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_0600
     * @tc.name testLongToInt3_006
     * @tc.desc Verify value above int maximum wraps to -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(0xfffffffe);
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_0700
     * @tc.name testLongToInt3_007
     * @tc.desc Verify value one above int maximum wraps to -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(0x80000000);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_0800
     * @tc.name testLongToInt3_008
     * @tc.desc Verify value at int maximum boundary 2147483647 converts to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(0x7fffffff);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_0900
     * @tc.name testLongToInt3_009
     * @tc.desc Verify value above int maximum wraps to -1412567295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(0xabcdef01);
      expect(result).assertEqual(-1412567295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_1000
     * @tc.name testLongToInt3_010
     * @tc.desc Verify hex literal 0x12345678 converts to int 305419896
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(0x12345678);
      expect(result).assertEqual(305419896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_1100
     * @tc.name testLongToInt3_011
     * @tc.desc Verify zero value converts to int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(0x0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_1200
     * @tc.name testLongToInt3_012
     * @tc.desc Verify hex literal 0x1 converts to int 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(0x1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_1300
     * @tc.name testLongToInt3_013
     * @tc.desc Verify hex literal 0x3f converts to int 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(0x3f);
      expect(result).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_1400
     * @tc.name testLongToInt3_014
     * @tc.desc Verify hex literal 0x7f converts to int 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(0x7f);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_1500
     * @tc.name testLongToInt3_015
     * @tc.desc Verify hex literal 0xff converts to int 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(0xff);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_1600
     * @tc.name testLongToInt3_016
     * @tc.desc Verify hex literal 0x100 converts to int 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(0x100);
      expect(result).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_1700
     * @tc.name testLongToInt3_017
     * @tc.desc Verify hex literal 0xffff converts to int 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(0xffff);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_1800
     * @tc.name testLongToInt3_018
     * @tc.desc Verify binary literal 0b10000000000000000 converts to int 65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(0b10000000000000000);
      expect(result).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_1900
     * @tc.name testLongToInt3_019
     * @tc.desc Verify value 8589934591 above int maximum wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(8589934591);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_2000
     * @tc.name testLongToInt3_020
     * @tc.desc Verify value 8589934593 above int maximum wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(8589934593);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_2100
     * @tc.name testLongToInt3_021
     * @tc.desc Verify value 12884901887 above int maximum wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(12884901887);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_2200
     * @tc.name testLongToInt3_022
     * @tc.desc Verify value at 32-bit boundary wraps to int -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toInt(4294967295)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_2300
     * @tc.name testLongToInt3_023
     * @tc.desc Verify value above int maximum wraps to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toInt(4294967298)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_2400
     * @tc.name testLongToInt3_024
     * @tc.desc Verify value above int maximum wraps to 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toInt(4294967396)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_2500
     * @tc.name testLongToInt3_025
     * @tc.desc Verify in-range positive value 1 converts to int 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toInt(-(-1))).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_2600
     * @tc.name testLongToInt3_026
     * @tc.desc Verify in-range negative value -305419896 converts to int -305419896
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toInt(-305419896)).assertEqual(-305419896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_2700
     * @tc.name testLongToInt3_027
     * @tc.desc Verify multiple -4294967296 of 2^32 wraps to int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toInt(-4294967296)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_2800
     * @tc.name testLongToInt3_028
     * @tc.desc Verify maximum long value truncates to the same int result as reference -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toInt(9223372036854775807)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_2900
     * @tc.name testLongToInt3_029
     * @tc.desc Verify value 0x100000000 truncates to the same int result as reference 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Long.toInt(0x100000000)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_3000
     * @tc.name testLongToInt3_030
     * @tc.desc Verify minimum long value truncates to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(Long.MIN_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT3_3100
     * @tc.name testLongToInt3_031
     * @tc.desc Verify value one below int minimum wraps to 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLongToInt3_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Long.toInt(-2147483649);
      expect(result).assertEqual(2147483647);
    });
  });
}
