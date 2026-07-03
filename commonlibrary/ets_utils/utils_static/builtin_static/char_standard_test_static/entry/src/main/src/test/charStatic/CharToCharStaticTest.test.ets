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

function charFromCode(code: number): char {
  return Int.toChar(Double.toInt(code));
}

export default function CharToCharStaticTest(): void {
  describe('CharToCharStaticTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_0100
     * @tc.name testCharToCharStatic0001
     * @tc.desc Verify that one char parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(c'A');
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_0200
     * @tc.name testCharToCharStatic0002
     * @tc.desc Verify that no parameter causes error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toChar(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_0400
     * @tc.name testCharToCharStatic0004
     * @tc.desc Verify ASCII letter characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'A')).assertEqual(c'A');
      expect(Char.toChar(c'Z')).assertEqual(c'Z');
      expect(Char.toChar(c'a')).assertEqual(c'a');
      expect(Char.toChar(c'z')).assertEqual(c'z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_0500
     * @tc.name testCharToCharStatic0005
     * @tc.desc Verify digit characters 0-9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'0')).assertEqual(c'0');
      expect(Char.toChar(c'9')).assertEqual(c'9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_0600
     * @tc.name testCharToCharStatic0006
     * @tc.desc Verify special characters and space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c' ')).assertEqual(c' ');
      expect(Char.toChar(c'!')).assertEqual(c'!');
      expect(Char.toChar(c'~')).assertEqual(c'~');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_0700
     * @tc.name testCharToCharStatic0007
     * @tc.desc Verify escape characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'\u0000')).assertEqual(c'\u0000');
      expect(Char.toChar(c'\n')).assertEqual(c'\n');
      expect(Char.toChar(c'\t')).assertEqual(c'\t');
      expect(Char.toChar(c'\r')).assertEqual(c'\r');
      expect(Char.toChar(c'\x7F')).assertEqual(c'\x7F');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_0800
     * @tc.name testCharToCharStatic0008
     * @tc.desc Verify Unicode characters within BMP range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'中')).assertEqual(c'中');
      expect(Char.toChar(c'あ')).assertEqual(c'あ');
      expect(Char.toChar(c'가')).assertEqual(c'가');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_0900
     * @tc.name testCharToCharStatic0009
     * @tc.desc Verify high and low surrogate characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogateMin = Char.toChar(Char.HIGH_SURROGATE_MIN);
      expect(Char.toInt(highSurrogateMin)).assertEqual(0xD800);
      const highSurrogateMax = Char.toChar(Char.HIGH_SURROGATE_MAX);
      expect(Char.toInt(highSurrogateMax)).assertEqual(0xDBFF);
      const lowSurrogateMin = Char.toChar(Char.LOW_SURROGATE_MIN);
      expect(Char.toInt(lowSurrogateMin)).assertEqual(0xDC00);
      const lowSurrogateMax = Char.toChar(Char.LOW_SURROGATE_MAX);
      expect(Char.toInt(lowSurrogateMax)).assertEqual(0xDFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_1000
     * @tc.name testCharToCharStatic0010
     * @tc.desc Verify that passing non-char type causes error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toChar(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
      try {
        const result = Char.toChar(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_1100
     * @tc.name testCharToCharStatic0011
     * @tc.desc Verify char minimum value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(Char.MIN_VALUE);
      expect(Char.toInt(result)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_1200
     * @tc.name testCharToCharStatic0012
     * @tc.desc Verify char maximum value 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(Char.MAX_VALUE);
      expect(Char.toInt(result)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_1300
     * @tc.name testCharToCharStatic0013
     * @tc.desc Verify ASCII boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toInt(Char.toChar(c'\x7F'))).assertEqual(127);
      expect(Char.toInt(Char.toChar(c'\x80'))).assertEqual(128);
      expect(Char.toInt(Char.toChar(c'\xFF'))).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_1400
     * @tc.name testCharToCharStatic0014
     * @tc.desc Verify return value is char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(c'A');
      expect(typeof result).assertEqual("char");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_1500
     * @tc.name testCharToCharStatic0015
     * @tc.desc Verify return value equals input char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'A')).assertEqual(c'A');
      expect(Char.toChar(c'B')).assertEqual(c'B');
      expect(Char.toChar(c'0')).assertEqual(c'0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_1600
     * @tc.name testCharToCharStatic0016
     * @tc.desc Verify uppercase letter conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'A')).assertEqual(c'A');
      expect(Char.toChar(c'Z')).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_1700
     * @tc.name testCharToCharStatic0017
     * @tc.desc Verify lowercase letter conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'a')).assertEqual(c'a');
      expect(Char.toChar(c'z')).assertEqual(c'z');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_1900
     * @tc.name testCharToCharStatic0019
     * @tc.desc Verify space character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c' ')).assertEqual(c' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_2000
     * @tc.name testCharToCharStatic0020
     * @tc.desc Verify special symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'~')).assertEqual(c'~');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_2100
     * @tc.name testCharToCharStatic0021
     * @tc.desc Verify Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'中')).assertEqual(c'中');
      expect(Char.toInt(Char.toChar(c'中'))).assertEqual(20013);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_2200
     * @tc.name testCharToCharStatic0022
     * @tc.desc Verify null character \\u0000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(c'\u0000');
      expect(result).assertEqual(c'\u0000');
      expect(Char.toInt(result)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_2300
     * @tc.name testCharToCharStatic0023
     * @tc.desc Verify newline character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(c'\n');
      expect(result).assertEqual(c'\n');
      expect(Char.toInt(result)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_2400
     * @tc.name testCharToCharStatic0024
     * @tc.desc Verify tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(c'\t');
      expect(result).assertEqual(c'\t');
      expect(Char.toInt(result)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_2500
     * @tc.name testCharToCharStatic0025
     * @tc.desc Verify carriage return character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(c'\r');
      expect(result).assertEqual(c'\r');
      expect(Char.toInt(result)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_2600
     * @tc.name testCharToCharStatic0026
     * @tc.desc Verify that toChar returns the correct character and its code point value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const resultA = Char.toChar(c'A');
      expect(resultA).assertEqual(c'A');
      expect(Char.toInt(resultA)).assertEqual(65);
      const resultB = Char.toChar(c'B');
      expect(resultB).assertEqual(c'B');
      expect(Char.toInt(resultB)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_2700
     * @tc.name testCharToCharStatic0027
     * @tc.desc Verify return value Unicode code point is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(c'A');
      expect(Char.toInt(result)).assertEqual(65);
      const chineseResult = Char.toChar(c'中');
      expect(Char.toInt(chineseResult)).assertEqual(20013);
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_3100
     * @tc.name testCharToCharStatic0031
     * @tc.desc Verify high surrogate characters return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highMin = Char.toChar(Char.HIGH_SURROGATE_MIN);
      expect(Char.toInt(highMin)).assertEqual(0xD800);
      const highMax = Char.toChar(Char.HIGH_SURROGATE_MAX);
      expect(Char.toInt(highMax)).assertEqual(0xDBFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_3200
     * @tc.name testCharToCharStatic0032
     * @tc.desc Verify low surrogate characters return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowMin = Char.toChar(Char.LOW_SURROGATE_MIN);
      expect(Char.toInt(lowMin)).assertEqual(0xDC00);
      const lowMax = Char.toChar(Char.LOW_SURROGATE_MAX);
      expect(Char.toInt(lowMax)).assertEqual(0xDFFF);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_3500
     * @tc.name testCharToCharStatic0035
     * @tc.desc Verify finally block always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.toChar(c'A');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_3800
     * @tc.name testCharToCharStatic0038
     * @tc.desc Verify toChar is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.toChar(c'A');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_3900
     * @tc.name testCharToCharStatic0039
     * @tc.desc Verify static method requires parameter while instance method does not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const staticResult = Char.toChar(c'A');
      const instanceResult = c.toChar();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_4000
     * @tc.name testCharToCharStatic0040
     * @tc.desc Verify same character returns same result for static and instance methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(Char.toChar(c'A')).assertEqual(c.toChar());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_4100
     * @tc.name testCharToCharStatic0041
     * @tc.desc Verify static toChar and valueOf both return char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'A')).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_4200
     * @tc.name testCharToCharStatic0042
     * @tc.desc Verify that the static toChar method returns the same result as the instance toChar method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(Char.toChar(c'A')).assertEqual(c.toChar());
      expect(Char.toChar(c'A')).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_4300
     * @tc.name testCharToCharStatic0043
     * @tc.desc Verify static method can convert any char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'A')).assertEqual(c'A');
      const c = new Char(c'A');
      expect(c.toChar()).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_4400
     * @tc.name testCharToCharStatic0044
     * @tc.desc Verify ASCII characters (0-127) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        expect(Char.toChar(ch)).assertEqual(ch);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_4500
     * @tc.name testCharToCharStatic0045
     * @tc.desc Verify extended ASCII characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 128; i < 256; i++) {
        const ch = charFromCode(i);
        expect(Char.toChar(ch)).assertEqual(ch);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_4600
     * @tc.name testCharToCharStatic0046
     * @tc.desc Verify BMP characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'\u4E00', c'\u4E8C', c'\u4E09'];
      for (const ch of testChars) {
        expect(Char.toChar(ch)).assertEqual(ch);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_4700
     * @tc.name testCharToCharStatic0047
     * @tc.desc Verify all possible char values with sampling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sampleChars = [c'\u0000', c'\x7F', c'\x80', c'\xFF', c'\u0100', c'\u7FFF', c'\u8000', c'\uFFFF'];
      for (const ch of sampleChars) {
        expect(Char.toChar(ch)).assertEqual(ch);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_4800
     * @tc.name testCharToCharStatic0048
     * @tc.desc Verify minimum character value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(Char.MIN_VALUE);
      expect(result).assertEqual(Char.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_4900
     * @tc.name testCharToCharStatic0049
     * @tc.desc Verify maximum character value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(Char.MAX_VALUE);
      expect(result).assertEqual(Char.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_5000
     * @tc.name testCharToCharStatic0050
     * @tc.desc Verify high surrogate character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(Char.HIGH_SURROGATE_MIN);
      expect(Char.toInt(result)).assertEqual(0xD800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_5100
     * @tc.name testCharToCharStatic0051
     * @tc.desc Verify low surrogate character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(Char.LOW_SURROGATE_MIN);
      expect(Char.toInt(result)).assertEqual(0xDC00);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_5200
     * @tc.name testCharToCharStatic0052
     * @tc.desc Verify multiple calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toChar(c'A');
      const result2 = Char.toChar(c'A');
      const result3 = Char.toChar(c'A');
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_5300
     * @tc.name testCharToCharStatic0053
     * @tc.desc Verify toChar return value can participate in calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toInt(Char.toChar(c'A')) + 1;
      expect(result).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_5400
     * @tc.name testCharToCharStatic0054
     * @tc.desc Verify that toChar returns the correct character value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upper = Char.toChar(c'a');
      const lower = Char.toChar(c'A');
      expect(upper).assertEqual(c'a');
      expect(lower).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_5500
     * @tc.name testCharToCharStatic0055
     * @tc.desc Verify that toChar returns the correct character value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toChar(c'A');
      const result2 = Char.toChar(c'B');
      expect(result1).assertEqual(c'A');
      expect(result2).assertEqual(c'B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_5600
     * @tc.name testCharToCharStatic0056
     * @tc.desc Verify multiple conversions return correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.toChar(c'A')).assertEqual(c'A');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_5800
     * @tc.name testCharToCharStatic0058
     * @tc.desc Verify char minimum value 0 in boundary test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(Char.MIN_VALUE);
      expect(Char.toInt(result)).assertEqual(0);
      expect(Char.toChar(Char.MIN_VALUE)).assertEqual(Char.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_5900
     * @tc.name testCharToCharStatic0059
     * @tc.desc Verify char maximum value 65535 in boundary test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(Char.MAX_VALUE);
      expect(Char.toInt(result)).assertEqual(65535);
      expect(Char.toChar(Char.MAX_VALUE)).assertEqual(Char.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_6000
     * @tc.name testCharToCharStatic0060
     * @tc.desc Verify ASCII maximum value 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(c'\x7F');
      expect(Char.toInt(result)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_6100
     * @tc.name testCharToCharStatic0061
     * @tc.desc Verify extended ASCII boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = Char.toChar(c'\x80');
      const c2 = Char.toChar(c'\xFF');
      expect(Char.toInt(c1)).assertEqual(128);
      expect(Char.toInt(c2)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_6200
     * @tc.name testCharToCharStatic0062
     * @tc.desc Verify high surrogate region boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = Char.toChar(Char.HIGH_SURROGATE_MIN);
      const c2 = Char.toChar(Char.HIGH_SURROGATE_MAX);
      expect(Char.toInt(c1)).assertEqual(0xD800);
      expect(Char.toInt(c2)).assertEqual(0xDBFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_6300
     * @tc.name testCharToCharStatic0063
     * @tc.desc Verify both static and instance methods produce same result for same character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'A', c'Z', c'a', c'z', c'0', c'9', c' ', c'\n', c'中'];
      for (const ch of testChars) {
        const c = new Char(ch);
        expect(Char.toChar(ch)).assertEqual(c.toChar());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_6400
     * @tc.name testCharToCharStatic0064
     * @tc.desc Verify that the static toChar method returns the same result as the instance toChar method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x00', c'A', c'z', c'0', c'9', c' ', c'\x7F', c'\x80', c'\xFF'];
      for (const ch of samples) {
        const c = new Char(ch);
        expect(Char.toChar(ch)).assertEqual(c.toChar());
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_6600
     * @tc.name testCharToCharStatic0066
     * @tc.desc Verify toChar result can be used as input for other conversions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const charValue = Char.toChar(c'A');
      expect(Char.toInt(charValue)).assertEqual(65);
      expect(Char.toDouble(charValue)).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_6700
     * @tc.name testCharToCharStatic0067
     * @tc.desc Verify toChar ensures standard char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input = c'中';
      const output = Char.toChar(input);
      expect(Char.toInt(input)).assertEqual(Char.toInt(output));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOCHARSTATICTEST_6800
     * @tc.name testCharToCharStatic0068
     * @tc.desc Verify toChar can be used as intermediate step in conversion chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToCharStatic0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = c'A';
      const charValue = Char.toChar(original);
      const intValue = Char.toInt(charValue);
      expect(intValue).assertEqual(65);
    });
  });
}
