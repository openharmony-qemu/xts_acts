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
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function LongToStringRadixTest(): void {
  describe('LongToStringRadixTest', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const RADIX_VAL: long = 255;
    const RADIX_2: int = 2;
    const RADIX_3: int = 3;
    const RADIX_4: int = 4;
    const RADIX_5: int = 5;
    const RADIX_6: int = 6;
    const RADIX_7: int = 7;
    const RADIX_8: int = 8;
    const RADIX_9: int = 9;
    const RADIX_10: int = 10;
    const RADIX_11: int = 11;
    const RADIX_12: int = 12;
    const RADIX_13: int = 13;
    const RADIX_14: int = 14;
    const RADIX_15: int = 15;
    const RADIX_16: int = 16;
    const RADIX_17: int = 17;
    const RADIX_18: int = 18;
    const RADIX_19: int = 19;
    const RADIX_20: int = 20;
    const RADIX_21: int = 21;
    const RADIX_22: int = 22;
    const RADIX_23: int = 23;
    const RADIX_24: int = 24;
    const RADIX_25: int = 25;
    const RADIX_26: int = 26;
    const RADIX_27: int = 27;
    const RADIX_28: int = 28;
    const RADIX_29: int = 29;
    const RADIX_30: int = 30;
    const RADIX_31: int = 31;
    const RADIX_32: int = 32;
    const RADIX_33: int = 33;
    const RADIX_34: int = 34;
    const RADIX_35: int = 35;
    const RADIX_36: int = 36;

    const RADIX_STR_2: string = "11111111";
    const RADIX_STR_3: string = "100110";
    const RADIX_STR_4: string = "3333";
    const RADIX_STR_5: string = "2010";
    const RADIX_STR_6: string = "1103";
    const RADIX_STR_7: string = "513";
    const RADIX_STR_8: string = "377";
    const RADIX_STR_9: string = "313";
    const RADIX_STR_10: string = "255";
    const RADIX_STR_11: string = "212";
    const RADIX_STR_12: string = "193";
    const RADIX_STR_13: string = "168";
    const RADIX_STR_14: string = "143";
    const RADIX_STR_15: string = "120";
    const RADIX_STR_16: string = "ff";
    const RADIX_STR_17: string = "f0";
    const RADIX_STR_18: string = "e3";
    const RADIX_STR_19_LOW: string = "d";
    const RADIX_STR_19_HIGH: string = "8";

    const RADIX_STR_20: string = "cf";
    const RADIX_STR_21: string = "c3";
    const RADIX_STR_22: string = "bd";
    const RADIX_STR_23: string = "b2";
    const RADIX_STR_24: string = "af";
    const RADIX_STR_25: string = "a5";
    const RADIX_STR_26: string = "9l";
    const RADIX_STR_27: string = "9c";
    const RADIX_STR_28: string = "93";
    const RADIX_STR_29: string = "8n";
    const RADIX_STR_30: string = "8f";
    const RADIX_STR_31: string = "87";
    const RADIX_STR_32: string = "7v";
    const RADIX_STR_33: string = "7o";
    const RADIX_STR_34: string = "7h";
    const RADIX_STR_35: string = "7a";
    const RADIX_STR_36: string = "73";

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_0100
     * @tc.name testLongToStringRadix001
     * @tc.desc Verify new Long(255).toString(2) returns "11111111"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_2);
      expect(result).assertEqual(RADIX_STR_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_0200
     * @tc.name testLongToStringRadix002
     * @tc.desc Verify new Long(255).toString(3) returns "100110"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_3);
      expect(result).assertEqual(RADIX_STR_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_0300
     * @tc.name testLongToStringRadix003
     * @tc.desc Verify new Long(255).toString(4) returns "3333"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_4);
      expect(result).assertEqual(RADIX_STR_4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_0400
     * @tc.name testLongToStringRadix004
     * @tc.desc Verify new Long(255).toString(5) returns "2010"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_5);
      expect(result).assertEqual(RADIX_STR_5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_0500
     * @tc.name testLongToStringRadix005
     * @tc.desc Verify new Long(255).toString(6) returns "1103"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_6);
      expect(result).assertEqual(RADIX_STR_6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_0600
     * @tc.name testLongToStringRadix006
     * @tc.desc Verify new Long(255).toString(7) returns "513"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_7);
      expect(result).assertEqual(RADIX_STR_7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_0700
     * @tc.name testLongToStringRadix007
     * @tc.desc Verify new Long(255).toString(8) returns "377"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_8);
      expect(result).assertEqual(RADIX_STR_8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_0800
     * @tc.name testLongToStringRadix008
     * @tc.desc Verify new Long(255).toString(9) returns "313"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_9);
      expect(result).assertEqual(RADIX_STR_9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_0900
     * @tc.name testLongToStringRadix009
     * @tc.desc Verify new Long(255).toString(10) returns "255"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_10);
      expect(result).assertEqual(RADIX_STR_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_1000
     * @tc.name testLongToStringRadix010
     * @tc.desc Verify new Long(255).toString(11) returns "212"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_11);
      expect(result).assertEqual(RADIX_STR_11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_1100
     * @tc.name testLongToStringRadix011
     * @tc.desc Verify new Long(255).toString(12) returns "193"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_12);
      expect(result).assertEqual(RADIX_STR_12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_1200
     * @tc.name testLongToStringRadix012
     * @tc.desc Verify new Long(255).toString(13) returns "168"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_13);
      expect(result).assertEqual(RADIX_STR_13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_1300
     * @tc.name testLongToStringRadix013
     * @tc.desc Verify new Long(255).toString(14) returns "143"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_14);
      expect(result).assertEqual(RADIX_STR_14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_1400
     * @tc.name testLongToStringRadix014
     * @tc.desc Verify new Long(255).toString(15) returns "120"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_15);
      expect(result).assertEqual(RADIX_STR_15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_1500
     * @tc.name testLongToStringRadix015
     * @tc.desc Verify new Long(255).toString(16) returns "ff"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_16);
      expect(result).assertEqual(RADIX_STR_16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_1600
     * @tc.name testLongToStringRadix016
     * @tc.desc Verify new Long(255).toString(17) returns "f0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_17);
      expect(result).assertEqual(RADIX_STR_17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_1700
     * @tc.name testLongToStringRadix017
     * @tc.desc Verify new Long(255).toString(18) returns "e3"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_18);
      expect(result).assertEqual(RADIX_STR_18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_1800
     * @tc.name testLongToStringRadix018
     * @tc.desc Verify new Long(255).toString(19) returns exact "d & 8" (13*19 + 8 = 255)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_19);
      expect(result).assertEqual(RADIX_STR_19_LOW + RADIX_STR_19_HIGH);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_1900
     * @tc.name testLongToStringRadix019
     * @tc.desc Verify new Long(255).toString(20) returns "cf"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_20);
      expect(result).assertEqual(RADIX_STR_20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_2000
     * @tc.name testLongToStringRadix020
     * @tc.desc Verify new Long(255).toString(21) returns "c3"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_21);
      expect(result).assertEqual(RADIX_STR_21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_2100
     * @tc.name testLongToStringRadix021
     * @tc.desc Verify new Long(255).toString(22) returns "bd"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_22);
      expect(result).assertEqual(RADIX_STR_22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_2200
     * @tc.name testLongToStringRadix022
     * @tc.desc Verify new Long(255).toString(23) returns "b2"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_23);
      expect(result).assertEqual(RADIX_STR_23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_2300
     * @tc.name testLongToStringRadix023
     * @tc.desc Verify new Long(255).toString(24) returns "af"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_24);
      expect(result).assertEqual(RADIX_STR_24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_2400
     * @tc.name testLongToStringRadix024
     * @tc.desc Verify new Long(255).toString(25) returns "a5"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_25);
      expect(result).assertEqual(RADIX_STR_25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_2500
     * @tc.name testLongToStringRadix025
     * @tc.desc Verify new Long(255).toString(26) returns "9l"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_26);
      expect(result).assertEqual(RADIX_STR_26);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_2600
     * @tc.name testLongToStringRadix026
     * @tc.desc Verify new Long(255).toString(27) returns "9c"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_27);
      expect(result).assertEqual(RADIX_STR_27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_2700
     * @tc.name testLongToStringRadix027
     * @tc.desc Verify new Long(255).toString(28) returns "93"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_28);
      expect(result).assertEqual(RADIX_STR_28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_2800
     * @tc.name testLongToStringRadix028
     * @tc.desc Verify new Long(255).toString(29) returns "8n"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_29);
      expect(result).assertEqual(RADIX_STR_29);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_2900
     * @tc.name testLongToStringRadix029
     * @tc.desc Verify new Long(255).toString(30) returns "8f"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_30);
      expect(result).assertEqual(RADIX_STR_30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_3000
     * @tc.name testLongToStringRadix030
     * @tc.desc Verify new Long(255).toString(31) returns "87"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_31);
      expect(result).assertEqual(RADIX_STR_31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_3100
     * @tc.name testLongToStringRadix031
     * @tc.desc Verify new Long(255).toString(32) returns "7v"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_32);
      expect(result).assertEqual(RADIX_STR_32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_3200
     * @tc.name testLongToStringRadix032
     * @tc.desc Verify new Long(255).toString(33) returns "7o"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_33);
      expect(result).assertEqual(RADIX_STR_33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_3300
     * @tc.name testLongToStringRadix033
     * @tc.desc Verify new Long(255).toString(34) returns "7h"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_34);
      expect(result).assertEqual(RADIX_STR_34);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_3400
     * @tc.name testLongToStringRadix034
     * @tc.desc Verify new Long(255).toString(35) returns "7a"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_35);
      expect(result).assertEqual(RADIX_STR_35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_3500
     * @tc.name testLongToStringRadix035
     * @tc.desc Verify new Long(255).toString(36) returns "73"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      const result: string = value.toString(RADIX_36);
      expect(result).assertEqual(RADIX_STR_36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_3600
     * @tc.name testLongToStringRadix036
     * @tc.desc Verify negative value toString with radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: Long = new Long(-10);
      const result1: string = value1.toString(RADIX_2);
      expect(result1).assertEqual("-1010");
      const value2: Long = new Long(-10);
      const result2: string = value2.toString(RADIX_16);
      expect(result2).assertEqual("-a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_3700
     * @tc.name testLongToStringRadix037
     * @tc.desc Verify zero and large value toString with radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroVal: Long = new Long(0);
      expect(zeroVal.toString(RADIX_2)).assertEqual("0");
      expect(zeroVal.toString(RADIX_16)).assertEqual("0");
      const maxVal: Long = new Long(Long.MAX_VALUE);
      expect(maxVal.toString(RADIX_16)).assertEqual("7fffffffffffffff");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_3800
     * @tc.name testLongToStringRadix038
     * @tc.desc Verify radix=1 throws RangeError (below minimum valid radix 2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      try {
        value.toString(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_3900
     * @tc.name testLongToStringRadix039
     * @tc.desc Verify radix=37 throws RangeError (above maximum valid radix 36)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      try {
        value.toString(37);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_4000
     * @tc.name testLongToStringRadix040
     * @tc.desc Verify radix=-1 throws RangeError (negative radix invalid)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(RADIX_VAL);
      try {
        value.toString(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TO_STRING_RADIX_4100
     * @tc.name testLongToStringRadix041
     * @tc.desc Verify new Long(Long.MIN_VALUE).toString(10) returns a negative-prefixed string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToStringRadix041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MIN_VALUE);
      const result: string = value.toString(RADIX_10);
      expect(typeof result).assertEqual('string');
      expect(result.indexOf("-")).assertEqual(0);
    });
  });
}
