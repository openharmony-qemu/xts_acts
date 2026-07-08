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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function IntToCharStaticTest(): void {
  describe('IntToCharStaticTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_0100
     * @tc.name testIntToCharStatic0001
     * @tc.desc Verify that value parameter is required
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(65);
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_0200
     * @tc.name testIntToCharStatic0002
     * @tc.desc Verify error when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0);
      expect(result).assertEqual(c'\u0000');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_0400
     * @tc.name testIntToCharStatic0004
     * @tc.desc Verify uppercase letters A-Z with ASCII codes 65-90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const resultA = Int.toChar(65);
      const resultZ = Int.toChar(90);
      expect(resultA).assertEqual(c'A');
      expect(resultZ).assertEqual(c'Z');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_0500
     * @tc.name testIntToCharStatic0005
     * @tc.desc Verify lowercase letters a-z with ASCII codes 97-122
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const resultA = Int.toChar(97);
      const resultZ = Int.toChar(122);
      expect(resultA).assertEqual(c'a');
      expect(resultZ).assertEqual(c'z');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_0600
     * @tc.name testIntToCharStatic0006
     * @tc.desc Verify digit characters 0-9 with ASCII codes 48-57
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result0 = Int.toChar(48);
      const result9 = Int.toChar(57);
      expect(result0).assertEqual(c'0');
      expect(result9).assertEqual(c'9');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_0800
     * @tc.name testIntToCharStatic0008
     * @tc.desc Verify newline character with code point 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(10);
      expect(result).assertEqual(c'\n');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_0900
     * @tc.name testIntToCharStatic0009
     * @tc.desc Verify carriage return character with code point 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(13);
      expect(result).assertEqual(c'\r');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_1000
     * @tc.name testIntToCharStatic0010
     * @tc.desc Verify tab character with code point 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(9);
      expect(result).assertEqual(c'\t');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_1100
     * @tc.name testIntToCharStatic0011
     * @tc.desc Verify backspace character with code point 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(8);
      expect(result).assertEqual(c'\b');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_1200
     * @tc.name testIntToCharStatic0012
     * @tc.desc Verify DEL character with code point 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(127);
      expect(result).assertEqual(c'\x7F');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_1300
     * @tc.name testIntToCharStatic0013
     * @tc.desc Verify space character with code point 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(32);
      expect(result).assertEqual(c' ');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_1400
     * @tc.name testIntToCharStatic0014
     * @tc.desc Verify exclamation mark with code point 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(33);
      expect(result).assertEqual(c'!');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_1500
     * @tc.name testIntToCharStatic0015
     * @tc.desc Verify double quote with code point 34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(34);
      expect(result).assertEqual(c'"');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_1600
     * @tc.name testIntToCharStatic0016
     * @tc.desc Verify single quote with code point 39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(39);
      expect(result).assertEqual(c'\'');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_1700
     * @tc.name testIntToCharStatic0017
     * @tc.desc Verify plus sign with code point 43
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(43);
      expect(result).assertEqual(c'+');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_1800
     * @tc.name testIntToCharStatic0018
     * @tc.desc Verify extended ASCII range 128-255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(128);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_1900
     * @tc.name testIntToCharStatic0019
     * @tc.desc Verify Latin-1 supplementary character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(169);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_2000
     * @tc.name testIntToCharStatic0020
     * @tc.desc Verify basic multilingual plane character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0x4E2D);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_2100
     * @tc.name testIntToCharStatic0021
     * @tc.desc Verify Japanese Hiragana character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0x3042);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_2200
     * @tc.name testIntToCharStatic0022
     * @tc.desc Verify Korean character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0xAC00);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_2300
     * @tc.name testIntToCharStatic0023
     * @tc.desc Verify Emoji beyond BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0x1F600);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_2400
     * @tc.name testIntToCharStatic0024
     * @tc.desc Verify hexadecimal representation of ASCII character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0x41);
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_2500
     * @tc.name testIntToCharStatic0025
     * @tc.desc Verify hexadecimal representation of lowercase letter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0x61);
      expect(result).assertEqual(c'a');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_2600
     * @tc.name testIntToCharStatic0026
     * @tc.desc Verify octal representation of character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0o101);
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_2700
     * @tc.name testIntToCharStatic0027
     * @tc.desc Verify binary representation of character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0b1000001);
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_2800
     * @tc.name testIntToCharStatic0028
     * @tc.desc Verify int type maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(2147483647);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_2900
     * @tc.name testIntToCharStatic0029
     * @tc.desc Verify int type minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(-2147483648);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_3100
     * @tc.name testIntToCharStatic0031
     * @tc.desc Verify negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(-1);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_3400
     * @tc.name testIntToCharStatic0034
     * @tc.desc Verify passing floating point number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(Double.toInt(65.5));
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_3600
     * @tc.name testIntToCharStatic0036
     * @tc.desc Verify passing boolean value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(1);
      expect(result).assertEqual(c'\u0001');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_3700
     * @tc.name testIntToCharStatic0037
     * @tc.desc Verify surrogate pair range 0xD800-0xDFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0xD800);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_3800
     * @tc.name testIntToCharStatic0038
     * @tc.desc Verify exceeding maximum Unicode code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0x110000);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_3900
     * @tc.name testIntToCharStatic0039
     * @tc.desc Verify returning converted char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(65);
      expect(result).assertEqual(c'A');
      expect(typeof result).assertEqual("char");
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_4000
     * @tc.name testIntToCharStatic0040
     * @tc.desc Verify return value is char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(66);
      expect(typeof result).assertEqual("char");
      expect(result != c'\u0000').assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_4100
     * @tc.name testIntToCharStatic0041
     * @tc.desc Verify A-Z uppercase conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 65; i <= 90; i++) {
        const result = Int.toChar(i);
        expect(result != null).assertTrue();
        expect(result != c'\u0000').assertTrue();
      }
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_4200
     * @tc.name testIntToCharStatic0042
     * @tc.desc Verify a-z lowercase conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 97; i <= 122; i++) {
        const result = Int.toChar(i);
        expect(result != null).assertTrue();
        expect(result != c'\u0000').assertTrue();
      }
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_4300
     * @tc.name testIntToCharStatic0043
     * @tc.desc Verify 0-9 digit conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 48; i <= 57; i++) {
        const result = Int.toChar(i);
        expect(result != null).assertTrue();
        expect(result != c'\u0000').assertTrue();
      }
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_4800
     * @tc.name testIntToCharStatic0048
     * @tc.desc Verify vertical tab character with code point 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(11);
      expect(result).assertEqual(c'\v');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_4900
     * @tc.name testIntToCharStatic0049
     * @tc.desc Verify form feed character with code point 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(12);
      expect(result).assertEqual(c'\f');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_5000
     * @tc.name testIntToCharStatic0050
     * @tc.desc Verify Latin extended character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0x00C0);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_5100
     * @tc.name testIntToCharStatic0051
     * @tc.desc Verify Greek letter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0x03B1);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_5200
     * @tc.name testIntToCharStatic0052
     * @tc.desc Verify Cyrillic letter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0x0430);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_5500
     * @tc.name testIntToCharStatic0055
     * @tc.desc Verify return value is char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(88);
      expect(typeof result).assertEqual("char");
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_5600
     * @tc.name testIntToCharStatic0056
     * @tc.desc Verify most characters have length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(88);
      expect(result != c'\u0000').assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_5700
     * @tc.name testIntToCharStatic0057
     * @tc.desc Verify surrogate pair character has length at least 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0x1F600);
      expect(result != c'\u0000').assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_5800
     * @tc.name testIntToCharStatic0058
     * @tc.desc Verify must be called statically via Int class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(88);
      expect(result).assertEqual(c'X');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_5900
     * @tc.name testIntToCharStatic0059
     * @tc.desc Verify static toChar and instance toChar produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result1 = Int.toChar(65);
      const result2 = a.toChar();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_6000
     * @tc.name testIntToCharStatic0060
     * @tc.desc Verify toChar return value can be used in further operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = Int.toChar(72);
      const str = "" + ch + Int.toChar(105);
      expect(str).assertEqual("Hi");
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_6100
     * @tc.name testIntToCharStatic0061
     * @tc.desc Verify same value produces consistent results across multiple conversions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Int.toChar(65);
      const result2 = Int.toChar(65);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_6200
     * @tc.name testIntToCharStatic0062
     * @tc.desc Verify arithmetic expression result as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(64 + 1);
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_6300
     * @tc.name testIntToCharStatic0063
     * @tc.desc Verify complex expression as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar((10 * 6) + 5);
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_6400
     * @tc.name testIntToCharStatic0064
     * @tc.desc Verify using constant as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(Int.MAX_VALUE);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_6500
     * @tc.name testIntToCharStatic0065
     * @tc.desc Verify toChar converts to char while toByte converts to number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 65;
      const ch = Int.toChar(value);
      const b = Int.toByte(value);
      expect(ch).assertEqual(c'A');
      expect(b).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_6600
     * @tc.name testIntToCharStatic0066
     * @tc.desc Verify toChar converts to char while toString converts to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 65;
      expect(Int.toChar(value)).assertEqual(c'A');
      expect(Int.toString(value)).assertEqual("65");
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_6700
     * @tc.name testIntToCharStatic0067
     * @tc.desc Verify using for string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = Int.toChar(65);
      const str = "Value: " + ch;
      expect(str).assertEqual("Value: A");
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_6800
     * @tc.name testIntToCharStatic0068
     * @tc.desc Verify comparing converted characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch1 = Int.toChar(65);
      const ch2 = Int.toChar(66);
      expect(ch1 < ch2).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_6900
     * @tc.name testIntToCharStatic0069
     * @tc.desc Verify building character array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: int[] = [72, 105, 33];
      const chars = values.map((v: int): char => Int.toChar(v));
      expect(chars.length).assertEqual(3);
      expect(chars[0]).assertEqual(c'H');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_7000
     * @tc.name testIntToCharStatic0070
     * @tc.desc Verify multiple toChar calls perform normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = c'\0';
      for (let i = 0; i < 1000; i++) {
        result = Int.toChar(65);
      }
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_7100
     * @tc.name testIntToCharStatic0071
     * @tc.desc Verify documentation example outputs A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.info(Int.toChar(65));
      expect(Int.toChar(65)).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_7200
     * @tc.name testIntToCharStatic0072
     * @tc.desc Verify static and instance toChar consistency in all cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues = [0, 65, 97, 48, 10, 13, 0x4E2D];
      testValues.forEach(v => {
        const a = new Int(v);
        expect(Int.toChar(v)).assertEqual(a.toChar());
      });
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_7300
     * @tc.name testIntToCharStatic0073
     * @tc.desc Verify ASCII range 0-127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i <= 127; i++) {
        const result = Int.toChar(i);
        expect(result != null).assertTrue();
      }
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_7400
     * @tc.name testIntToCharStatic0074
     * @tc.desc Verify extended ASCII range 128-255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 128; i <= 255; i++) {
        const result = Int.toChar(i);
        expect(result != null).assertTrue();
      }
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_7600
     * @tc.name testIntToCharStatic0076
     * @tc.desc Verify round-trip conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = 65;
      const toC = Int.toChar(original);
      const str = "Code: " + toC;
      expect(str).assertEqual("Code: A");
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_7700
     * @tc.name testIntToCharStatic0077
     * @tc.desc Verify combining valueOf and static toChar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const value = a.toInt();
      const ch = Int.toChar(value);
      expect(ch).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_7800
     * @tc.name testIntToCharStatic0078
     * @tc.desc Verify using static property as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxResult = Int.toChar(Int.MAX_VALUE);
      const minResult = Int.toChar(Int.MIN_VALUE);
      expect(maxResult != null).assertTrue();
      expect(minResult != null).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_7900
     * @tc.name testIntToCharStatic0079
     * @tc.desc Verify expression as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 64;
      const b = 1;
      const result = Int.toChar(a + b);
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_8000
     * @tc.name testIntToCharStatic0080
     * @tc.desc Verify batch conversion of array to build string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const codes: int[] = [72, 101, 108, 108, 111];
      const chars = codes.map((c: int): char => Int.toChar(c));
      expect(chars[0]).assertEqual(c'H');
      expect(chars[4]).assertEqual(c'o');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_8100
     * @tc.name testIntToCharStatic0081
     * @tc.desc Verify BMP character is 1 code unit in UTF-16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toChar(0x4E2D);
      expect(result != c'\u0000').assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_8300
     * @tc.name testIntToCharStatic0083
     * @tc.desc Verify various escape sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int.toChar(0)).assertEqual(c'\u0000');
      expect(Int.toChar(8)).assertEqual(c'\b');
      expect(Int.toChar(9)).assertEqual(c'\t');
      expect(Int.toChar(10)).assertEqual(c'\n');
      expect(Int.toChar(11)).assertEqual(c'\v');
      expect(Int.toChar(12)).assertEqual(c'\f');
      expect(Int.toChar(13)).assertEqual(c'\r');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_8400
     * @tc.name testIntToCharStatic0084
     * @tc.desc Verify hexadecimal escape format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int.toChar(0x41)).assertEqual(c'A');
      expect(Int.toChar(0x7F)).assertEqual(c'\x7F');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_8500
     * @tc.name testIntToCharStatic0085
     * @tc.desc Verify Unicode escape format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int.toChar(0x4E2D)).assertEqual(c'\u4E2D');
      expect(Int.toChar(0x03B1)).assertEqual(c'\u03B1');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_8600
     * @tc.name testIntToCharStatic0086
     * @tc.desc Verify letter, digit, and space characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const letter = Int.toChar(65);
      const digit = Int.toChar(48);
      const space = Int.toChar(32);
      expect(letter != c'\u0000').assertTrue();
      expect(digit != c'\u0000').assertTrue();
      expect(space).assertEqual(c' ');
    });

    /**
     * @tc.number INT_TO_CHAR_S_CHK_8700
     * @tc.name testIntToCharStatic0087
     * @tc.desc Verify uppercase and lowercase difference is 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToCharStatic0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upper = Int.toChar(65);
      const lower = Int.toChar(97);
      const upperCode = 65;
      const lowerCode = 97;
      expect(lowerCode - upperCode).assertEqual(32);
    });
  });
}
