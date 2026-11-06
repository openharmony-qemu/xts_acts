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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import Utils from './../Util.test';

export default function GlobalParseIntTest(): void {
  describe('GlobalParseIntTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0100
     * @tc.name testParseInt001
     * @tc.desc Verify parseInt with 2 parameters (s + number radix) parses hex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("2a", 16.0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0200
     * @tc.name testParseInt002
     * @tc.desc Verify parseInt("-42") returns -42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("-42");
      expect(result).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0300
     * @tc.name testParseInt003
     * @tc.desc Verify parseInt("0xFF") returns 255 hex parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("0xFF");
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0400
     * @tc.name testParseInt004
     * @tc.desc Verify parseInt with radix=2 parses binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("1010", 2);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0500
     * @tc.name testParseInt005
     * @tc.desc Verify parseInt with radix=1 returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("1", 1);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0600
     * @tc.name testParseInt006
     * @tc.desc Verify parseInt("1A", 16) returns 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("1A", 16);
      expect(result).assertEqual(26);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0700
     * @tc.name testParseInt007
     * @tc.desc Verify parseInt("102", 2) returns 2 (truncates invalid digit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("102", 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0800
     * @tc.name testParseInt008
     * @tc.desc Verify parseInt("9007199254740991") equals Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("9007199254740991");
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0900
     * @tc.name testParseInt009
     * @tc.desc Verify parseInt with consecutive calls returns expected parsed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r1: number = parseInt("42");
      let r2: number = parseInt("2a", 16);
      let r3: number = parseInt("abc");
      expect(r1).assertEqual(42);
      expect(r2).assertEqual(42);
      expect(isNaN(r3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_1000
     * @tc.name testParseInt010
     * @tc.desc Verify parseInt("0b101") with binary prefix returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("0b101");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_1100
     * @tc.name testParseInt011
     * @tc.desc Verify parseInt fullwidth digits returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("\uFF11\uFF12\uFF13");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_1200
     * @tc.name testParseInt012
     * @tc.desc Verify parseInt("102", 3) with radix=3 returns 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("102", 3);
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_1300
     * @tc.name testParseInt013
     * @tc.desc Verify parseInt near Number.MIN_SAFE_INTEGER boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("-9007199254740991");
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_1400
     * @tc.name testParseInt014
     * @tc.desc Verify parseInt("9007199254740993") loses precision above safe integer boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("9007199254740993");
      expect(result).assertEqual(9007199254740992);
      expect(isSafeInteger(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_1500
     * @tc.name testParseInt015
     * @tc.desc Verify parseInt returns NaN for nonnumeric prefix with radix 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("case54", 10);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_1600
     * @tc.name testParseInt016
     * @tc.desc Verify parseInt parses minimum int decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("-2147483648", 10);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_1700
     * @tc.name testParseInt017
     * @tc.desc Verify parseInt parses maximum int decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("2147483647", 10);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_1800
     * @tc.name testParseInt018
     * @tc.desc Verify parseInt parses max int hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("7fffffff", 16);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_1900
     * @tc.name testParseInt019
     * @tc.desc Verify parseInt truncates at digit outside base 7 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("67", 7);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_2000
     * @tc.name testParseInt020
     * @tc.desc Verify parseInt truncates at invalid alphabetic digit in base 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("c9", 12);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_2100
     * @tc.name testParseInt021
     * @tc.desc Verify parseInt parses base 35 highest valid lowercase digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("y", 35);
      expect(result).assertEqual(34);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_2200
     * @tc.name testParseInt022
     * @tc.desc Verify parseInt returns NaN when first digit is outside base 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("z", 35);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_2300
     * @tc.name testParseInt023
     * @tc.desc Verify parseInt returns NaN for zero width space before digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("\u200B42", 10);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_2400
     * @tc.name testParseInt024
     * @tc.desc Verify parseInt returns NaN for Arabic-Indic digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("佟佗伲", 10);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_2500
     * @tc.name testParseInt025
     * @tc.desc Verify parseInt returns NaN for Japanese text prefix before digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("銉嗐偣銉?23", 10);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_2600
     * @tc.name testParseInt026
     * @tc.desc Verify parseInt returns NaN for digit d outside base 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("d", 13);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_2700
     * @tc.name testParseInt027
     * @tc.desc Verify parseInt returns NaN for digit v outside base 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("v", 31);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_2800
     * @tc.name testParseInt028
     * @tc.desc Verify parseInt parses explicit plus sign before decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("+42", 10);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_2900
     * @tc.name testParseInt029
     * @tc.desc Verify parseInt parses mixed leading whitespace before negative digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("\r\n\t-15", 10);
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_3000
     * @tc.name testParseInt030
     * @tc.desc Verify parseInt default radix handles negative hexadecimal prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("-0xF");
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_3100
     * @tc.name testParseInt031
     * @tc.desc Verify parseInt explicit radix handles uppercase hexadecimal prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("0X10", 16);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_3200
     * @tc.name testParseInt032
     * @tc.desc Verify parseInt truncates fractional radix before parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("101", 2.9);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_3300
     * @tc.name testParseInt033
     * @tc.desc Verify parseInt accepts uppercase alphabetic digit in radix 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("G", 17);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_3400
     * @tc.name testParseInt034
     * @tc.desc Verify parseInt parses nonbreaking space before decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("\u00A042", 10);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_3500
     * @tc.name testParseInt035
     * @tc.desc Verify parseInt default radix parses plus hexadecimal prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("+0xF");
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_3600
     * @tc.name testParseInt036
     * @tc.desc Verify parseInt default radix parses plus uppercase hexadecimal prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("+0Xf");
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_3700
     * @tc.name testParseInt037
     * @tc.desc Verify parseInt radix zero parses hexadecimal prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("0x10", 0);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_3800
     * @tc.name testParseInt038
     * @tc.desc Verify parseInt radix zero parses leading zero decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("010", 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_3900
     * @tc.name testParseInt039
     * @tc.desc Verify parseInt radix eight parses leading zero octal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("010", 8);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_4000
     * @tc.name testParseInt040
     * @tc.desc Verify parseInt parses leading zeros before decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("00010", 10);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_4100
     * @tc.name testParseInt041
     * @tc.desc Verify parseInt parses signed digits before text suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("   +0012px", 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_4200
     * @tc.name testParseInt042
     * @tc.desc Verify parseInt parses digits before newline suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("15\n", 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_4300
     * @tc.name testParseInt043
     * @tc.desc Verify parseInt radix three parses base three hundred
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("100", 3);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_4400
     * @tc.name testParseInt044
     * @tc.desc Verify parseInt radix thirty six parses uppercase highest digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("Z", 36);
      expect(result).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_4500
     * @tc.name testParseInt045
     * @tc.desc Verify parseInt radix thirty five parses uppercase highest valid digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("Y", 35);
      expect(result).assertEqual(34);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_4600
     * @tc.name testParseInt046
     * @tc.desc Verify parseInt parses negative decimal with explicit radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("-15", 10);
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_4700
     * @tc.name testParseInt047
     * @tc.desc Verify parseInt parses hexadecimal just above signed int max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("80000000", 16);
      expect(result).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_4800
     * @tc.name testParseInt048
     * @tc.desc Verify parseInt parses negative hexadecimal signed int min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("-80000000", 16);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_4900
     * @tc.name testParseInt049
     * @tc.desc Verify parseInt parses eight hexadecimal f digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("ffffffff", 16);
      expect(result).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_5000
     * @tc.name testParseInt050
     * @tc.desc Verify parseInt parses large hexadecimal power boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("10000000000000", 16);
      expect(result).assertEqual(4503599627370496);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_5100
     * @tc.name testParseInt051
     * @tc.desc Verify parseInt radix seventeen accepts lowercase g digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("g", 17);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_5200
     * @tc.name testParseInt052
     * @tc.desc Verify parseInt truncates before minus sign after digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("1-2", 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_5300
     * @tc.name testParseInt053
     * @tc.desc Verify parseInt truncates before plus sign after digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("1+2", 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_5400
     * @tc.name testParseInt054
     * @tc.desc Verify parseInt explicit radix sixteen truncates invalid prefixed digit to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("0xg", 16);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_5500
     * @tc.name testParseInt055
     * @tc.desc Verify parseInt radix two truncates after first valid digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("12", 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_5600
     * @tc.name testParseInt056
     * @tc.desc Verify parseInt radix eight truncates after first valid digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("78", 8);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_5700
     * @tc.name testParseInt057
     * @tc.desc Verify parseInt radix ten truncates at exponent marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("12e3", 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_5800
     * @tc.name testParseInt058
     * @tc.desc Verify parseInt radix ten truncates at underscore separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("1_000", 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_5900
     * @tc.name testParseInt059
     * @tc.desc Verify parseInt radix ten truncates at comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("1,000", 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_6000
     * @tc.name testParseInt060
     * @tc.desc Verify parseInt returns NaN for fullwidth decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("\uFF11\uFF12", 10);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_6100
     * @tc.name testParseInt061
     * @tc.desc Verify parseInt returns NaN for Arabic Indic decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("\u0661\u0662", 10);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_6200
     * @tc.name testParseInt062
     * @tc.desc Verify parseInt parses numeric prefix before Chinese suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("42\u6D4B\u8BD5", 10);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_6300
     * @tc.name testParseInt063
     * @tc.desc Verify parseInt parses numeric prefix before Japanese suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("42\u30C6\u30B9\u30C8", 10);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_6400
     * @tc.name testParseInt064
     * @tc.desc Verify parseInt parses numeric prefix before emoji escape suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("42\uD83D\uDE00", 10);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_6500
     * @tc.name testParseInt065
     * @tc.desc Verify parseInt truncates before slash after digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("12/34", 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_6600
     * @tc.name testParseInt066
     * @tc.desc Verify parseInt truncates before colon after digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("12:34", 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_6700
     * @tc.name testParseInt067
     * @tc.desc Verify parseInt returns NaN for underscore prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("_42", 10);
      expect(isNaN(result)).assertTrue();
    });

  });
}
