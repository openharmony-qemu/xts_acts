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

export default function IntToCharTest(): void {
  describe('IntToCharTest', (): void => {
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
     * @tc.number INT_TO_CHAR_CHK_0100
     * @tc.name testIntToChar0001
     * @tc.desc Verify toChar accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.toChar();
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_0200
     * @tc.name testIntToChar0002
     * @tc.desc Verify toChar returns correct char value (no parameters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.toChar()).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_0300
     * @tc.name testIntToChar0003
     * @tc.desc Verify toChar returns converted char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.toChar();
      expect(result).assertEqual(c'A');
      expect(typeof result).assertEqual("char");
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_0400
     * @tc.name testIntToChar0004
     * @tc.desc Verify return value is char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(66);
      const result = a.toChar();
      expect(result).assertEqual(c'B');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_0500
     * @tc.name testIntToChar0005
     * @tc.desc Verify uppercase letters A-Z conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.toChar()).assertEqual(c'A');

      const b = new Int(90);
      expect(b.toChar()).assertEqual(c'Z');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_0600
     * @tc.name testIntToChar0006
     * @tc.desc Verify lowercase letters a-z conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(97);
      expect(a.toChar()).assertEqual(c'a');

      const b = new Int(122);
      expect(b.toChar()).assertEqual(c'z');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_0700
     * @tc.name testIntToChar0007
     * @tc.desc Verify digit characters 0-9 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Int(48);
      expect(zero.toChar()).assertEqual(c'0');

      const nine = new Int(57);
      expect(nine.toChar()).assertEqual(c'9');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_0800
     * @tc.name testIntToChar0008
     * @tc.desc Verify space character (32) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const space = new Int(32);
      expect(space.toChar()).assertEqual(c' ');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_0900
     * @tc.name testIntToChar0009
     * @tc.desc Verify newline character (10) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const newline = new Int(10);
      expect(newline.toChar()).assertEqual(c'\n');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_1000
     * @tc.name testIntToChar0010
     * @tc.desc Verify tab character (9) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tab = new Int(9);
      expect(tab.toChar()).assertEqual(c'\t');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_1100
     * @tc.name testIntToChar0011
     * @tc.desc Verify carriage return character (13) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const carriage = new Int(13);
      expect(carriage.toChar()).assertEqual(c'\r');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_1200
     * @tc.name testIntToChar0012
     * @tc.desc Verify char minimum value (0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const result = a.toChar();
      const code: int = result.toInt();
      expect(code).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_1300
     * @tc.name testIntToChar0013
     * @tc.desc Verify char maximum value (65535)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65535);
      const result = a.toChar();
      const code: int = result.toInt();
      expect(code).assertEqual(65535);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_1400
     * @tc.name testIntToChar0014
     * @tc.desc Verify negative number handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1);
      const result = a.toChar();
      const code: int = result.toInt();
      expect(code >= 0).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_1500
     * @tc.name testIntToChar0015
     * @tc.desc Verify large value exceeding char range handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65536);
      const result = a.toChar();
      const code: int = result.toInt();
      expect(code <= 65535).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_1600
     * @tc.name testIntToChar0016
     * @tc.desc Verify Basic Multilingual Plane character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0x4F60);
      const result = a.toChar();
      const code: int = result.toInt();
      expect(code).assertEqual(0x4F60);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_1700
     * @tc.name testIntToChar0017
     * @tc.desc Verify Latin extended character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0xC9);
      const result = a.toChar();
      const code: int = result.toInt();
      expect(code).assertEqual(0xC9);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_1800
     * @tc.name testIntToChar0018
     * @tc.desc Verify control characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nulCode: int = new Int(0).toChar().toInt();
      expect(nulCode).assertEqual(0);

      const belCode: int = new Int(7).toChar().toInt();
      expect(belCode).assertEqual(7);

      const escCode: int = new Int(27).toChar().toInt();
      expect(escCode).assertEqual(27);

      const delCode: int = new Int(127).toChar().toInt();
      expect(delCode).assertEqual(127);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_1900
     * @tc.name testIntToChar0019
     * @tc.desc Verify return value is string type with single character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.toChar();
      expect(typeof result).assertEqual("char");
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_2000
     * @tc.name testIntToChar0020
     * @tc.desc Verify char syntax using c'...' notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch: char = c'A';
      const result: char = new Int(66).toChar();
      expect(ch).assertEqual(c'A');
      expect(result).assertEqual(c'B');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_2200
     * @tc.name testIntToChar0022
     * @tc.desc Verify toChar does not change original Int instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const original = a.toInt();
      const result = a.toChar();
      expect(a.toInt()).assertEqual(original);
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_2300
     * @tc.name testIntToChar0023
     * @tc.desc Verify instance toChar matches static toChar result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result1 = a.toChar();
      const result2 = Int.toChar(65);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_2400
     * @tc.name testIntToChar0024
     * @tc.desc Verify toChar return value can be used in further operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const ch = a.toChar();
      const str = "Hello " + ch.toString();
      expect(str).assertEqual("Hello A");
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_2500
     * @tc.name testIntToChar0025
     * @tc.desc Verify string operations after toChar conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(88);
      const ch = a.toChar();
      const s: string = ch.toString();
      const result = s.toUpperCase();
      expect(result).assertEqual("X");
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_2600
     * @tc.name testIntToChar0026
     * @tc.desc Verify same value multiple conversions produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result1 = a.toChar();
      const result2 = a.toChar();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_2700
     * @tc.name testIntToChar0027
     * @tc.desc Verify different instances with same value produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Int(66);
      const a2 = new Int(66);
      expect(a1.toChar()).assertEqual(a2.toChar());
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_2800
     * @tc.name testIntToChar0028
     * @tc.desc Verify conversion after arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(60);
      const b = new Int(5);
      const result = a.add(b).toChar();
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_2900
     * @tc.name testIntToChar0029
     * @tc.desc Verify character encoding conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0x4F60);
      const ch = a.toChar();
      const code: int = ch.toInt();
      expect(code).assertEqual(0x4F60);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_3000
     * @tc.name testIntToChar0030
     * @tc.desc Verify toString returns numeric string while toChar returns character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.toChar()).assertEqual(c'A');
      expect(a.toString()).assertEqual("65");
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_3100
     * @tc.name testIntToChar0031
     * @tc.desc Verify toByte returns numeric value while toChar returns character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const ch = a.toChar();
      const b = a.toByte();
      expect(ch).assertEqual(c'A');
      expect(b).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_3200
     * @tc.name testIntToChar0032
     * @tc.desc Verify toChar in character processing scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const codes: int[] = [72, 101, 108, 108, 111];
      let str = "";
      codes.forEach((code: int): void => {
        str += new Int(code).toChar().toString();
      });
      expect(str).assertEqual("Hello");
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_3300
     * @tc.name testIntToChar0033
     * @tc.desc Verify character encoding conversion in encryption scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Int(65);
      const ch = original.toChar();
      const code: int = ch.toInt();
      expect(code).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_3400
     * @tc.name testIntToChar0034
     * @tc.desc Verify character type checking after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const digit = new Int(48);
      const ch = digit.toChar();
      expect(ch >= c'0' && ch <= c'9').assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_3500
     * @tc.name testIntToChar0035
     * @tc.desc Verify BMP characters (0-65535) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0x0041);
      expect(a.toChar()).assertEqual(c'A');

      const bCode: int = new Int(0x0416).toChar().toInt();
      expect(bCode).assertEqual(0x0416);

      const cCode: int = new Int(0x4E2D).toChar().toInt();
      expect(cCode).assertEqual(0x4E2D);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_3600
     * @tc.name testIntToChar0036
     * @tc.desc Verify special Unicode characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const copyrightCode: int = new Int(0xA9).toChar().toInt();
      expect(copyrightCode).assertEqual(0xA9);

      const trademarkCode: int = new Int(0xAE).toChar().toInt();
      expect(trademarkCode).assertEqual(0xAE);

      const microCode: int = new Int(0xB5).toChar().toInt();
      expect(microCode).assertEqual(0xB5);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_3700
     * @tc.name testIntToChar0037
     * @tc.desc Verify standard escape sequences conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const newline = new Int(10);
      expect(newline.toChar()).assertEqual(c'\n');

      const tab = new Int(9);
      expect(tab.toChar()).assertEqual(c'\t');

      const carriage = new Int(13);
      expect(carriage.toChar()).assertEqual(c'\r');

      const backslash = new Int(92);
      expect(backslash.toChar()).assertEqual(c'\\');

      const singleQuote = new Int(39);
      expect(singleQuote.toChar()).assertEqual(c'\'');

      const doubleQuote = new Int(34);
      expect(doubleQuote.toChar()).assertEqual(c'\"');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_3800
     * @tc.name testIntToChar0038
     * @tc.desc Verify hexadecimal escape format conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const del = new Int(0x7F);
      expect(del.toChar()).assertEqual(c'\x7F');

      const nul = new Int(0x00);
      expect(nul.toChar()).assertEqual(c'\x00');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_3900
     * @tc.name testIntToChar0039
     * @tc.desc Verify Unicode escape format conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nullChar = new Int(0);
      expect(nullChar.toChar()).assertEqual(c'\u0000');

      const aChar = new Int(0x0041);
      expect(aChar.toChar()).assertEqual(c'\u0041');

      const chineseChar = new Int(0x4E2D);
      expect(chineseChar.toChar()).assertEqual(c'\u4E2D');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_4000
     * @tc.name testIntToChar0040
     * @tc.desc Verify multiple toChar calls performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      let result = "";
      for (let i = 0; i < 1000; i++) {
        result += a.toChar().toString();
      }
      expect(result.length).assertEqual(1000);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_4400
     * @tc.name testIntToChar0044
     * @tc.desc Verify return value conforms to char type characteristics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(66);
      const result = a.toChar();
      expect(typeof result).assertEqual("char");
      expect(result).assertEqual(c'B');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_4700
     * @tc.name testIntToChar0047
     * @tc.desc Verify documentation example output A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      console.info(a.toChar().toString());
      expect(a.toChar()).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_4800
     * @tc.name testIntToChar0048
     * @tc.desc Verify character comparison after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(66);
      const aCode: int = a.toChar().toInt();
      const bCode: int = b.toChar().toInt();
      expect(aCode).assertLess(bCode);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_4900
     * @tc.name testIntToChar0049
     * @tc.desc Verify character concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(72);
      const b = new Int(105);
      const result: string = a.toChar().toString() + b.toChar().toString();
      expect(result).assertEqual("Hi");
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_5000
     * @tc.name testIntToChar0050
     * @tc.desc Verify valid character range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = new Int(0);
      const max = new Int(65535);

      const minCode: int = min.toChar().toInt();
      const maxCode: int = max.toChar().toInt();

      expect(minCode).assertEqual(0);
      expect(maxCode).assertEqual(65535);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_5100
     * @tc.name testIntToChar0051
     * @tc.desc Verify out of range handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negative = new Int(-1);
      const ch = negative.toChar();
      const code: int = ch.toInt();
      expect(code >= 0).assertTrue();

      const tooBig = new Int(65536);
      const tooBigChar = tooBig.toChar();
      const tooBigCode: int = tooBigChar.toInt();
      expect(tooBigCode <= 65535).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_5200
     * @tc.name testIntToChar0052
     * @tc.desc Verify ASCII characters (0-127) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 32; i <= 126; i++) {
        const a = new Int(i);
        const ch = a.toChar();
        const code: int = ch.toInt();
        expect(code).assertEqual(i);
      }
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_5300
     * @tc.name testIntToChar0053
     * @tc.desc Verify extended ASCII (128-255) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(169);
      const ch = a.toChar();
      const code: int = ch.toInt();
      expect(code).assertEqual(169);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_5400
     * @tc.name testIntToChar0054
     * @tc.desc Verify character array construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const codes: int[] = [65, 66, 67, 68, 69];
      const chars: char[] = codes.map((code: int): char => new Int(code).toChar());
      expect(chars.length).assertEqual(5);
      expect(chars[0]).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_5500
     * @tc.name testIntToChar0055
     * @tc.desc Verify uppercase and lowercase conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowerA = new Int(97);
      const upperA = new Int(65);

      const lower = lowerA.toChar();
      const upper = upperA.toChar();

      expect(lower).assertEqual(c'a');
      expect(upper).assertEqual(c'A');
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_5600
     * @tc.name testIntToChar0056
     * @tc.desc Verify toChar then convert back to number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = 65;
      const a = new Int(original);
      const ch = a.toChar();
      const back: int = ch.toInt();
      expect(back).assertEqual(original);
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_5700
     * @tc.name testIntToChar0057
     * @tc.desc Verify string methods after toChar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(97);
      const ch = a.toChar();
      const s: string = ch.toString();
      expect(s.toUpperCase()).assertEqual("A");
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_5800
     * @tc.name testIntToChar0058
     * @tc.desc Verify character validation methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const digit = new Int(49);
      const ch = digit.toChar();

      const isDigit = ch >= c'0' && ch <= c'9';
      expect(isDigit).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_5900
     * @tc.name testIntToChar0059
     * @tc.desc Verify batch conversion to character array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: int[] = [72, 69, 76, 76, 79];
      let word = "";
      numbers.forEach((n: int): void => {
        word += new Int(n).toChar().toString();
      });
      expect(word).assertEqual("HELLO");
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_6000
     * @tc.name testIntToChar0060
     * @tc.desc Verify invalid character code handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const invalid = new Int(-100);
      const ch = invalid.toChar();
      const code: int = ch.toInt();
      expect(code >= 0).assertTrue();

      const invalidHigh = new Int(0x110000);
      const invalidHighChar = invalidHigh.toChar();
      const invalidHighCode: int = invalidHighChar.toInt();
      expect(invalidHighCode <= 65535).assertTrue();
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_6100
     * @tc.name testIntToChar0061
     * @tc.desc Verify instance toChar matches static toChar in all cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [0, 65, 97, 48, 10, 65535];
      testValues.forEach((v: int): void => {
        const a = new Int(v);
        expect(a.toChar()).assertEqual(Int.toChar(v));
      });
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_6200
     * @tc.name testIntToChar0062
     * @tc.desc Verify toChar result comparison with equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(65);
      expect(a.toChar()).assertEqual(b.toChar());
    });

    /**
     * @tc.number INT_TO_CHAR_CHK_6300
     * @tc.name testIntToChar0063
     * @tc.desc Verify Basic Multilingual Plane support
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToChar0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const latin = new Int(0x0041);
      expect(latin.toChar()).assertEqual(c'A');

      const greekCode: int = new Int(0x03B1).toChar().toInt();
      expect(greekCode).assertEqual(0x03B1);

      const cyrillicCode: int = new Int(0x0430).toChar().toInt();
      expect(cyrillicCode).assertEqual(0x0430);

      const cjkCode: int = new Int(0x4E00).toChar().toInt();
      expect(cjkCode).assertEqual(0x4E00);
    });
  });
}
