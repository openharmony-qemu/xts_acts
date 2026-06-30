'use static'
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0010
     * @tc.name testParseInt001
     * @tc.desc Verify parseInt with 1 parameter parses "42"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("42");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0020
     * @tc.name testParseInt002
     * @tc.desc Verify parseInt with 2 parameters (s + int radix) parses hex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("2a", 16);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0030
     * @tc.name testParseInt003
     * @tc.desc Verify parseInt with 2 parameters (s + number radix) parses hex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("2a", 16.0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0040
     * @tc.name testParseInt004
     * @tc.desc Verify parseInt("-42") returns -42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("-42");
      expect(result).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0050
     * @tc.name testParseInt005
     * @tc.desc Verify parseInt("") returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0060
     * @tc.name testParseInt006
     * @tc.desc Verify parseInt("   ") returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("   ");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0070
     * @tc.name testParseInt007
     * @tc.desc Verify parseInt("0xFF") returns 255 hex parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("0xFF");
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0080
     * @tc.name testParseInt008
     * @tc.desc Verify parseInt("3.14") returns 3 truncating decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("3.14");
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0090
     * @tc.name testParseInt009
     * @tc.desc Verify parseInt("1e3") returns 1 for scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("1e3");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0100
     * @tc.name testParseInt010
     * @tc.desc Verify parseInt("FF", 16) returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("FF", 16);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0110
     * @tc.name testParseInt011
     * @tc.desc Verify parseInt("abc") returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("abc");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0120
     * @tc.name testParseInt012
     * @tc.desc Verify parseInt("@#$") returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("@#$");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0130
     * @tc.name testParseInt013
     * @tc.desc Verify parseInt with radix=2 parses binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("1010", 2);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0140
     * @tc.name testParseInt014
     * @tc.desc Verify parseInt with radix=8 parses oct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("77", 8);
      expect(result).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0150
     * @tc.name testParseInt015
     * @tc.desc Verify parseInt with radix=36 parses zz
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("zz", 36);
      expect(result).assertEqual(1295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0160
     * @tc.name testParseInt016
     * @tc.desc Verify parseInt with radix=0 uses default rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("42", 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0170
     * @tc.name testParseInt017
     * @tc.desc Verify parseInt with radix=1 returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("1", 1);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0180
     * @tc.name testParseInt018
     * @tc.desc Verify parseInt with radix=37 returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("1", 37);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0190
     * @tc.name testParseInt019
     * @tc.desc Verify parseInt with radix=-1 returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("42", -1);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0200
     * @tc.name testParseInt020
     * @tc.desc Verify parseInt("1A", 16) returns 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("1A", 16);
      expect(result).assertEqual(26);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0210
     * @tc.name testParseInt021
     * @tc.desc Verify parseInt("102", 2) returns 2 (truncates invalid digit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("102", 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0220
     * @tc.name testParseInt022
     * @tc.desc Verify parseInt("0xFF", 10) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("0xFF", 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0230
     * @tc.name testParseInt023
     * @tc.desc Verify parseInt("9007199254740991") equals Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("9007199254740991");
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0240
     * @tc.name testParseInt024
     * @tc.desc Verify parseInt with consecutive calls returns expected parsed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r1: number = parseInt("42");
      let r2: number = parseInt("2a", 16);
      let r3: number = parseInt("abc");
      expect(r1).assertEqual(42);
      expect(r2).assertEqual(42);
      expect(isNaN(r3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0250
     * @tc.name testParseInt025
     * @tc.desc Verify parseInt("9", 8) returns NaN (digit out of range)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("9", 8);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0260
     * @tc.name testParseInt026
     * @tc.desc Verify parseInt("z", 36) returns 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("z", 36);
      expect(result).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0270
     * @tc.name testParseInt027
     * @tc.desc Verify parseInt("0b101") with binary prefix returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("0b101");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0280
     * @tc.name testParseInt028
     * @tc.desc Verify parseInt("0o77") with octal prefix returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("0o77");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0290
     * @tc.name testParseInt029
     * @tc.desc Verify parseInt("abc42") returns NaN (letter-prefix mixed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("abc42");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0300
     * @tc.name testParseInt030
     * @tc.desc Verify parseInt fullwidth digits returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("\uFF11\uFF12\uFF13");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0310
     * @tc.name testParseInt031
     * @tc.desc Verify parseInt("102", 3) with radix=3 returns 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("102", 3);
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0320
     * @tc.name testParseInt032
     * @tc.desc Verify parseInt with radix=2.5 truncates radix to 2 and returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("10", 2.5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0330
     * @tc.name testParseInt033
     * @tc.desc Verify parseInt near Number.MIN_SAFE_INTEGER boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("-9007199254740991");
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0340
     * @tc.name testParseInt034
     * @tc.desc Verify parseInt("9007199254740993") loses precision above safe integer boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("9007199254740993");
      expect(result).assertEqual(9007199254740992);
      expect(isSafeInteger(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0350
     * @tc.name testParseInt035
     * @tc.desc Verify parseInt returns NaN for nonnumeric prefix with radix 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseInt("case54", 10);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0360
     * @tc.name testParseInt036
     * @tc.desc Verify parseInt parses minimum int decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("-2147483648", 10);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0370
     * @tc.name testParseInt037
     * @tc.desc Verify parseInt parses maximum int decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("2147483647", 10);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0380
     * @tc.name testParseInt038
     * @tc.desc Verify parseInt parses max int hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("7fffffff", 16);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0390
     * @tc.name testParseInt039
     * @tc.desc Verify parseInt truncates at digit outside base 7 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("67", 7);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0400
     * @tc.name testParseInt040
     * @tc.desc Verify parseInt truncates at invalid alphabetic digit in base 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("c9", 12);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0410
     * @tc.name testParseInt041
     * @tc.desc Verify parseInt parses base 35 highest valid lowercase digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("y", 35);
      expect(result).assertEqual(34);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0420
     * @tc.name testParseInt042
     * @tc.desc Verify parseInt returns NaN when first digit is outside base 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("z", 35);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0430
     * @tc.name testParseInt043
     * @tc.desc Verify parseInt returns NaN for leading decimal point before digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt(".75", 10);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0440
     * @tc.name testParseInt044
     * @tc.desc Verify parseInt returns NaN for zero width space before digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("\u200B42", 10);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0450
     * @tc.name testParseInt045
     * @tc.desc Verify parseInt returns NaN for Arabic-Indic digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("佟佗伲", 10);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0460
     * @tc.name testParseInt046
     * @tc.desc Verify parseInt returns NaN for Japanese text prefix before digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("銉嗐偣銉?23", 10);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0470
     * @tc.name testParseInt047
     * @tc.desc Verify parseInt returns NaN for digit d outside base 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("d", 13);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0480
     * @tc.name testParseInt048
     * @tc.desc Verify parseInt returns NaN for digit v outside base 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("v", 31);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0490
     * @tc.name testParseInt049
     * @tc.desc Verify parseInt parses explicit plus sign before decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("+42", 10);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0500
     * @tc.name testParseInt050
     * @tc.desc Verify parseInt parses mixed leading whitespace before negative digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("\r\n\t-15", 10);
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0510
     * @tc.name testParseInt051
     * @tc.desc Verify parseInt default radix handles negative hexadecimal prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("-0xF");
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0520
     * @tc.name testParseInt052
     * @tc.desc Verify parseInt explicit radix handles uppercase hexadecimal prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("0X10", 16);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0530
     * @tc.name testParseInt053
     * @tc.desc Verify parseInt truncates fractional radix before parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("101", 2.9);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0540
     * @tc.name testParseInt054
     * @tc.desc Verify parseInt accepts uppercase alphabetic digit in radix 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("G", 17);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0550
     * @tc.name testParseInt055
     * @tc.desc Verify parseInt truncates before numeric separator character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("12_34", 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0560
     * @tc.name testParseInt056
     * @tc.desc Verify parseInt parses nonbreaking space before decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("\u00A042", 10);
      expect(result).assertEqual(42);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0570
     * @tc.name testParseInt057
     * @tc.desc Verify parseInt default radix parses plus hexadecimal prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("+0xF");
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0580
     * @tc.name testParseInt058
     * @tc.desc Verify parseInt default radix parses plus uppercase hexadecimal prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("+0Xf");
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0590
     * @tc.name testParseInt059
     * @tc.desc Verify parseInt radix zero parses hexadecimal prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("0x10", 0);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0600
     * @tc.name testParseInt060
     * @tc.desc Verify parseInt radix zero parses leading zero decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("010", 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0610
     * @tc.name testParseInt061
     * @tc.desc Verify parseInt radix eight parses leading zero octal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("010", 8);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0620
     * @tc.name testParseInt062
     * @tc.desc Verify parseInt parses leading zeros before decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("00010", 10);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0630
     * @tc.name testParseInt063
     * @tc.desc Verify parseInt parses signed digits before text suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("   +0012px", 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0640
     * @tc.name testParseInt064
     * @tc.desc Verify parseInt parses form feed whitespace before decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("\f15", 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0650
     * @tc.name testParseInt065
     * @tc.desc Verify parseInt parses digits before newline suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("15\n", 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0660
     * @tc.name testParseInt066
     * @tc.desc Verify parseInt radix two parses three binary digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("101", 2);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0670
     * @tc.name testParseInt067
     * @tc.desc Verify parseInt radix two parses all one bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("111", 2);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0680
     * @tc.name testParseInt068
     * @tc.desc Verify parseInt radix three parses base three hundred
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("100", 3);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0690
     * @tc.name testParseInt069
     * @tc.desc Verify parseInt radix thirty six parses uppercase highest digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("Z", 36);
      expect(result).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0700
     * @tc.name testParseInt070
     * @tc.desc Verify parseInt radix thirty five parses uppercase highest valid digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("Y", 35);
      expect(result).assertEqual(34);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0710
     * @tc.name testParseInt071
     * @tc.desc Verify parseInt radix from Number NaN uses default decimal parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("10", Number.NaN);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0720
     * @tc.name testParseInt072
     * @tc.desc Verify parseInt radix from positive infinity uses default decimal parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("10", Number.POSITIVE_INFINITY);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0730
     * @tc.name testParseInt073
     * @tc.desc Verify parseInt radix from negative infinity uses default decimal parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("10", Number.NEGATIVE_INFINITY);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0740
     * @tc.name testParseInt074
     * @tc.desc Verify parseInt parses negative decimal with explicit radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("-15", 10);
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0750
     * @tc.name testParseInt075
     * @tc.desc Verify parseInt parses hexadecimal just above signed int max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("80000000", 16);
      expect(result).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0760
     * @tc.name testParseInt076
     * @tc.desc Verify parseInt parses negative hexadecimal signed int min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("-80000000", 16);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0770
     * @tc.name testParseInt077
     * @tc.desc Verify parseInt parses eight hexadecimal f digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("ffffffff", 16);
      expect(result).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0780
     * @tc.name testParseInt078
     * @tc.desc Verify parseInt parses large hexadecimal power boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("10000000000000", 16);
      expect(result).assertEqual(4503599627370496);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0790
     * @tc.name testParseInt079
     * @tc.desc Verify parseInt radix eleven accepts mixed case alphabetic digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("Aa", 11);
      expect(result).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0800
     * @tc.name testParseInt080
     * @tc.desc Verify parseInt radix seventeen accepts lowercase g digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("g", 17);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0810
     * @tc.name testParseInt081
     * @tc.desc Verify parseInt truncates before minus sign after digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("1-2", 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0820
     * @tc.name testParseInt082
     * @tc.desc Verify parseInt truncates before plus sign after digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("1+2", 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0830
     * @tc.name testParseInt083
     * @tc.desc Verify parseInt explicit radix sixteen returns NaN for prefix only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("0x", 16);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0840
     * @tc.name testParseInt084
     * @tc.desc Verify parseInt explicit radix sixteen truncates invalid prefixed digit to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("0xg", 16);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0850
     * @tc.name testParseInt085
     * @tc.desc Verify parseInt radix two returns NaN for invalid first digit two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("2", 2);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0860
     * @tc.name testParseInt086
     * @tc.desc Verify parseInt radix two truncates after first valid digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("12", 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0870
     * @tc.name testParseInt087
     * @tc.desc Verify parseInt radix eight returns NaN for invalid first digit eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("8", 8);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0880
     * @tc.name testParseInt088
     * @tc.desc Verify parseInt radix eight truncates after first valid digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("78", 8);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0890
     * @tc.name testParseInt089
     * @tc.desc Verify parseInt radix ten truncates at decimal point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("12.99", 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0900
     * @tc.name testParseInt090
     * @tc.desc Verify parseInt radix ten truncates at exponent marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("12e3", 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0910
     * @tc.name testParseInt091
     * @tc.desc Verify parseInt radix ten truncates at underscore separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("1_000", 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0920
     * @tc.name testParseInt092
     * @tc.desc Verify parseInt radix ten truncates at comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("1,000", 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0930
     * @tc.name testParseInt093
     * @tc.desc Verify parseInt returns NaN for fullwidth decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("\uFF11\uFF12", 10);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0940
     * @tc.name testParseInt094
     * @tc.desc Verify parseInt returns NaN for Arabic Indic decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("\u0661\u0662", 10);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0950
     * @tc.name testParseInt095
     * @tc.desc Verify parseInt parses numeric prefix before Chinese suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("42\u6D4B\u8BD5", 10);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0960
     * @tc.name testParseInt096
     * @tc.desc Verify parseInt parses numeric prefix before Japanese suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("42\u30C6\u30B9\u30C8", 10);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0970
     * @tc.name testParseInt097
     * @tc.desc Verify parseInt parses numeric prefix before emoji escape suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("42\uD83D\uDE00", 10);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0980
     * @tc.name testParseInt098
     * @tc.desc Verify parseInt truncates before slash after digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("12/34", 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_0990
     * @tc.name testParseInt099
     * @tc.desc Verify parseInt truncates before colon after digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("12:34", 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_INT_1000
     * @tc.name testParseInt100
     * @tc.desc Verify parseInt returns NaN for underscore prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseInt100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseInt("_42", 10);
      expect(isNaN(result)).assertTrue();
    });

  });
}
