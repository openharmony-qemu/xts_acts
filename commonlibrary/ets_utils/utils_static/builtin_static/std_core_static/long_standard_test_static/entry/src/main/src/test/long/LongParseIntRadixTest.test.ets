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
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function LongParseIntRadixTest(): void {
  describe('LongParseIntRadixTest', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const PARSE_STR_10: string = "10";
    const PARSE_STR_NEG_10: string = "-10";
    const PARSE_STR_NEG_FF: string = "-ff";
    const PARSE_2: int = 2;
    const PARSE_3: int = 3;
    const PARSE_4: int = 4;
    const PARSE_5: int = 5;
    const PARSE_6: int = 6;
    const PARSE_7: int = 7;
    const PARSE_8: int = 8;
    const PARSE_9: int = 9;
    const PARSE_10: int = 10;
    const PARSE_11: int = 11;
    const PARSE_12: int = 12;
    const PARSE_13: int = 13;
    const PARSE_14: int = 14;
    const PARSE_15: int = 15;
    const PARSE_16: int = 16;
    const PARSE_17: int = 17;
    const PARSE_18: int = 18;
    const PARSE_19: int = 19;
    const PARSE_20: int = 20;
    const PARSE_21: int = 21;
    const PARSE_22: int = 22;
    const PARSE_23: int = 23;
    const PARSE_24: int = 24;
    const PARSE_25: int = 25;
    const PARSE_26: int = 26;
    const PARSE_27: int = 27;
    const PARSE_28: int = 28;
    const PARSE_29: int = 29;
    const PARSE_30: int = 30;
    const PARSE_31: int = 31;
    const PARSE_32: int = 32;
    const PARSE_33: int = 33;
    const PARSE_34: int = 34;
    const PARSE_35: int = 35;
    const PARSE_36: int = 36;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_0100
     * @tc.name testLongParseIntRadix001
     * @tc.desc Verify Long.parseInt("10", 2) returns 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_0200
     * @tc.name testLongParseIntRadix002
     * @tc.desc Verify Long.parseInt("10", 3) returns 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_0300
     * @tc.name testLongParseIntRadix003
     * @tc.desc Verify Long.parseInt("10", 4) returns 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_0400
     * @tc.name testLongParseIntRadix004
     * @tc.desc Verify Long.parseInt("10", 5) returns 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_5);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_0500
     * @tc.name testLongParseIntRadix005
     * @tc.desc Verify Long.parseInt("10", 6) returns 6
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_6);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_0600
     * @tc.name testLongParseIntRadix006
     * @tc.desc Verify Long.parseInt("10", 7) returns 7
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_7);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_0700
     * @tc.name testLongParseIntRadix007
     * @tc.desc Verify Long.parseInt("10", 8) returns 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_8);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_0800
     * @tc.name testLongParseIntRadix008
     * @tc.desc Verify Long.parseInt("10", 9) returns 9
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_9);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_0900
     * @tc.name testLongParseIntRadix009
     * @tc.desc Verify Long.parseInt("10", 10) returns 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_10);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_1000
     * @tc.name testLongParseIntRadix010
     * @tc.desc Verify Long.parseInt("10", 11) returns 11
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_11);
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_1100
     * @tc.name testLongParseIntRadix011
     * @tc.desc Verify Long.parseInt("10", 12) returns 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_12);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_1200
     * @tc.name testLongParseIntRadix012
     * @tc.desc Verify Long.parseInt("10", 13) returns 13
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_13);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_1300
     * @tc.name testLongParseIntRadix013
     * @tc.desc Verify Long.parseInt("10", 14) returns 14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_14);
      expect(result).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_1400
     * @tc.name testLongParseIntRadix014
     * @tc.desc Verify Long.parseInt("10", 15) returns 15
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_15);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_1500
     * @tc.name testLongParseIntRadix015
     * @tc.desc Verify Long.parseInt("10", 16) returns 16
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_16);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_1600
     * @tc.name testLongParseIntRadix016
     * @tc.desc Verify Long.parseInt("10", 17) returns 17
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_17);
      expect(result).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_1700
     * @tc.name testLongParseIntRadix017
     * @tc.desc Verify Long.parseInt("10", 18) returns 18
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_18);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_1800
     * @tc.name testLongParseIntRadix018
     * @tc.desc Verify Long.parseInt("10", 19) returns 19
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_19);
      expect(result).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_1900
     * @tc.name testLongParseIntRadix019
     * @tc.desc Verify Long.parseInt("10", 20) returns 20
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_20);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_2000
     * @tc.name testLongParseIntRadix020
     * @tc.desc Verify Long.parseInt("10", 21) returns 21
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_21);
      expect(result).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_2100
     * @tc.name testLongParseIntRadix021
     * @tc.desc Verify Long.parseInt("10", 22) returns 22
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_22);
      expect(result).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_2200
     * @tc.name testLongParseIntRadix022
     * @tc.desc Verify Long.parseInt("10", 23) returns 23
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_23);
      expect(result).assertEqual(23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_2300
     * @tc.name testLongParseIntRadix023
     * @tc.desc Verify Long.parseInt("10", 24) returns 24
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_24);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_2400
     * @tc.name testLongParseIntRadix024
     * @tc.desc Verify Long.parseInt("10", 25) returns 25
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_25);
      expect(result).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_2500
     * @tc.name testLongParseIntRadix025
     * @tc.desc Verify Long.parseInt("10", 26) returns 26
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_26);
      expect(result).assertEqual(26);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_2600
     * @tc.name testLongParseIntRadix026
     * @tc.desc Verify Long.parseInt("10", 27) returns 27
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_27);
      expect(result).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_2700
     * @tc.name testLongParseIntRadix027
     * @tc.desc Verify Long.parseInt("10", 28) returns 28
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_28);
      expect(result).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_2800
     * @tc.name testLongParseIntRadix028
     * @tc.desc Verify Long.parseInt("10", 29) returns 29
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_29);
      expect(result).assertEqual(29);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_2900
     * @tc.name testLongParseIntRadix029
     * @tc.desc Verify Long.parseInt("10", 30) returns 30
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_30);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_3000
     * @tc.name testLongParseIntRadix030
     * @tc.desc Verify Long.parseInt("10", 31) returns 31
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_31);
      expect(result).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_3100
     * @tc.name testLongParseIntRadix031
     * @tc.desc Verify Long.parseInt("10", 32) returns 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_32);
      expect(result).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_3200
     * @tc.name testLongParseIntRadix032
     * @tc.desc Verify Long.parseInt("10", 33) returns 33
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_33);
      expect(result).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_3300
     * @tc.name testLongParseIntRadix033
     * @tc.desc Verify Long.parseInt("10", 34) returns 34
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_34);
      expect(result).assertEqual(34);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_3400
     * @tc.name testLongParseIntRadix034
     * @tc.desc Verify Long.parseInt("10", 35) returns 35
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_35);
      expect(result).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_3500
     * @tc.name testLongParseIntRadix035
     * @tc.desc Verify Long.parseInt("10", 36) returns 36
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_10, PARSE_36);
      expect(result).assertEqual(36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_3600
     * @tc.name testLongParseIntRadix036
     * @tc.desc Verify Long.parseInt("-10", 10) returns -10 (negative decimal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_NEG_10, PARSE_10);
      expect(result).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_3700
     * @tc.name testLongParseIntRadix037
     * @tc.desc Verify Long.parseInt("-10", 16) returns -16 (negative hex digits)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_NEG_10, PARSE_16);
      expect(result).assertEqual(-16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_3800
     * @tc.name testLongParseIntRadix038
     * @tc.desc Verify Long.parseInt("-ff", 16) returns -255 (negative hex with letters)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(PARSE_STR_NEG_FF, PARSE_16);
      expect(result).assertEqual(-255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_3900
     * @tc.name testLongParseIntRadix039
     * @tc.desc Verify Long.parseInt(Long.MAX_VALUE.toString(), 10) returns Long.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(Long.MAX_VALUE.toString(), PARSE_10);
      expect(result).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_4000
     * @tc.name testLongParseIntRadix040
     * @tc.desc Verify Long.parseInt(Long.MIN_VALUE.toString(), 10) returns Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(Long.MIN_VALUE.toString(), PARSE_10);
      expect(result).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_4100
     * @tc.name testLongParseIntRadix041
     * @tc.desc Verify Long.parseInt("9223372036854775808", 10) — MAX+1 overflow throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt("9223372036854775808", PARSE_10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_4200
     * @tc.name testLongParseIntRadix042
     * @tc.desc Verify Long.parseInt("-9223372036854775809", 10) — MIN-1 underflow throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt("-9223372036854775809", PARSE_10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_4300
     * @tc.name testLongParseIntRadix043
     * @tc.desc Verify Long.parseInt("9", 8) — digit '9' is not valid in octal radix, throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt("9", PARSE_8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_4400
     * @tc.name testLongParseIntRadix044
     * @tc.desc Verify Long.parseInt("ff", 10) — letters are not valid in decimal radix, throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt("ff", PARSE_10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_4500
     * @tc.name testLongParseIntRadix045
     * @tc.desc Verify Long.parseInt("z", 16) — letter 'z' exceeds hex radix range, throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt("z", PARSE_16);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_4600
     * @tc.name testLongParseIntRadix046
     * @tc.desc Verify Long.parseInt("10", 1) — radix below valid lower bound (2), throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt(PARSE_STR_10, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_4700
     * @tc.name testLongParseIntRadix047
     * @tc.desc Verify Long.parseInt("10", 37) — radix above valid upper bound (36), throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt(PARSE_STR_10, 37);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_4800
     * @tc.name testLongParseIntRadix048
     * @tc.desc Verify Long.parseInt("10", -1) — negative radix is invalid, throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt(PARSE_STR_10, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_4900
     * @tc.name testLongParseIntRadix049
     * @tc.desc Verify Long.parseInt("", 10) — empty string throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt("", PARSE_10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_5000
     * @tc.name testLongParseIntRadix050
     * @tc.desc Verify Long.parseInt("10.5", 10) prefix-parses up to the decimal point and returns 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt("10.5", PARSE_10);
      expect(result).assertEqual(10 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_5100
     * @tc.name testLongParseIntRadix051
     * @tc.desc Verify Long.parseInt("abc", 10) — pure letters under decimal radix, throws an error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Long.parseInt("abc", PARSE_10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_PARSE_INT_RADIX_5200
     * @tc.name testLongParseIntRadix052
     * @tc.desc Verify Long.parseInt(" 10", 10) skips the leading whitespace and returns 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongParseIntRadix052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Long.parseInt(" 10", PARSE_10);
      expect(result).assertEqual(10 as long);
    });

  });
}
