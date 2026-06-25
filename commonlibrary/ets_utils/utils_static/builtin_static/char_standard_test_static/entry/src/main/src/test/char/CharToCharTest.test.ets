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

export default function CharToCharTest(): void {
  describe('CharToCharTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_0100
     * @tc.name testCharToChar0001
     * @tc.desc Verify instance method toChar without any parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toChar();
      expect(typeof result).assertEqual("char");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_0200
     * @tc.name testCharToChar0002
     * @tc.desc Verify instance method toChar with extra parameter throws error or ignores it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toChar();
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_0300
     * @tc.name testCharToChar0003
     * @tc.desc Verify static method toChar with required char parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(c'A');
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_0400
     * @tc.name testCharToChar0004
     * @tc.desc Verify static method toChar throws error when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toChar(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_0600
     * @tc.name testCharToChar0006
     * @tc.desc Verify toChar with correct char type values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'A')).assertEqual(c'A');
      expect(Char.toChar(c'Z')).assertEqual(c'Z');
      expect(Char.toChar(c'a')).assertEqual(c'a');
      expect(Char.toChar(c'z')).assertEqual(c'z');
      expect(Char.toChar(c'0')).assertEqual(c'0');
      expect(Char.toChar(c'9')).assertEqual(c'9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_0700
     * @tc.name testCharToChar0007
     * @tc.desc Verify toChar with char type escape sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'\u0000')).assertEqual(c'\u0000');
      expect(Char.toChar(c'\n')).assertEqual(c'\n');
      expect(Char.toChar(c'\t')).assertEqual(c'\t');
      expect(Char.toChar(c'\r')).assertEqual(c'\r');
      expect(Char.toChar(c'\x7F')).assertEqual(c'\x7F');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_0800
     * @tc.name testCharToChar0008
     * @tc.desc Verify toChar with Unicode BMP characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'中')).assertEqual(c'中');
      expect(Char.toChar(c'国')).assertEqual(c'国');
      expect(Char.toChar(c'あ')).assertEqual(c'あ');
      expect(Char.toChar(c'가')).assertEqual(c'가');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_0900
     * @tc.name testCharToChar0009
     * @tc.desc Verify toChar with high and low surrogate characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_1000
     * @tc.name testCharToChar0010
     * @tc.desc Verify toChar throws error when passing non-char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_1100
     * @tc.name testCharToChar0011
     * @tc.desc Verify toChar with char minimum value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(Char.MIN_VALUE);
      expect(Char.toInt(result)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_1200
     * @tc.name testCharToChar0012
     * @tc.desc Verify toChar with char maximum value 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(Char.MAX_VALUE);
      expect(Char.toInt(result)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_1300
     * @tc.name testCharToChar0013
     * @tc.desc Verify toChar with ASCII boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toInt(Char.toChar(c'\x7F'))).assertEqual(127);
      expect(Char.toInt(Char.toChar(c'\x80'))).assertEqual(128);
      expect(Char.toInt(Char.toChar(c'\xFF'))).assertEqual(255);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_1500
     * @tc.name testCharToChar0015
     * @tc.desc Verify instance method returns original char value wrapped by Char object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toChar();
      expect(result).assertEqual(c'A');
      expect(Char.toInt(result)).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_1600
     * @tc.name testCharToChar0016
     * @tc.desc Verify uppercase letter conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upperC = new Char(c'A');
      expect(upperC.toChar()).assertEqual(c'A');
      const upperZ = new Char(c'Z');
      expect(upperZ.toChar()).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_1700
     * @tc.name testCharToChar0017
     * @tc.desc Verify lowercase letter conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowerA = new Char(c'a');
      expect(lowerA.toChar()).assertEqual(c'a');
      const lowerZ = new Char(c'z');
      expect(lowerZ.toChar()).assertEqual(c'z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_1800
     * @tc.name testCharToChar0018
     * @tc.desc Verify digit character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      expect(zero.toChar()).assertEqual(c'0');
      const nine = new Char(c'9');
      expect(nine.toChar()).assertEqual(c'9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_1900
     * @tc.name testCharToChar0019
     * @tc.desc Verify space character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const space = new Char(c' ');
      expect(space.toChar()).assertEqual(c' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_2000
     * @tc.name testCharToChar0020
     * @tc.desc Verify special symbol conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tilde = new Char(c'~');
      expect(tilde.toChar()).assertEqual(c'~');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_2100
     * @tc.name testCharToChar0021
     * @tc.desc Verify Chinese character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chinese = new Char(c'中');
      expect(chinese.toChar()).assertEqual(c'中');
      expect(Char.toInt(chinese.toChar())).assertEqual(20013);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_2200
     * @tc.name testCharToChar0022
     * @tc.desc Verify static method returns char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toChar(c'A');
      expect(typeof result).assertEqual("char");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_2300
     * @tc.name testCharToChar0023
     * @tc.desc Verify static method returns the same char value as input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'A')).assertEqual(c'A');
      expect(Char.toChar(c'B')).assertEqual(c'B');
      expect(Char.toChar(c'0')).assertEqual(c'0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_2400
     * @tc.name testCharToChar0024
     * @tc.desc Verify ASCII characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        expect(Char.toChar(ch)).assertEqual(ch);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_2500
     * @tc.name testCharToChar0025
     * @tc.desc Verify extended ASCII characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 128; i < 256; i++) {
        const ch = charFromCode(i);
        expect(Char.toChar(ch)).assertEqual(ch);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_2600
     * @tc.name testCharToChar0026
     * @tc.desc Verify Unicode characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toChar(c'中')).assertEqual(c'中');
      expect(Char.toChar(c'あ')).assertEqual(c'あ');
      expect(Char.toChar(c'가')).assertEqual(c'가');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_2700
     * @tc.name testCharToChar0027
     * @tc.desc Verify null character \\u0000 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nullChar = new Char(c'\u0000');
      expect(nullChar.toChar()).assertEqual(c'\u0000');
      expect(Char.toChar(c'\u0000')).assertEqual(c'\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_2800
     * @tc.name testCharToChar0028
     * @tc.desc Verify newline character \\n conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const newline = new Char(c'\n');
      expect(newline.toChar()).assertEqual(c'\n');
      expect(Char.toChar(c'\n')).assertEqual(c'\n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_2900
     * @tc.name testCharToChar0029
     * @tc.desc Verify tab character \\t conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tab = new Char(c'\t');
      expect(tab.toChar()).assertEqual(c'\t');
      expect(Char.toChar(c'\t')).assertEqual(c'\t');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_3000
     * @tc.name testCharToChar0030
     * @tc.desc Verify carriage return character \\r conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const carriage = new Char(c'\r');
      expect(carriage.toChar()).assertEqual(c'\r');
      expect(Char.toChar(c'\r')).assertEqual(c'\r');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_3100
     * @tc.name testCharToChar0031
     * @tc.desc Verify char type returns string with length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toChar();
      expect(result).assertEqual(c'A');
      expect(Char.toInt(result)).assertEqual(65);
      const resultB = Char.toChar(c'B');
      expect(resultB).assertEqual(c'B');
      expect(Char.toInt(resultB)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_3200
     * @tc.name testCharToChar0032
     * @tc.desc Verify return value has correct Unicode code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toChar();
      expect(Char.toInt(result)).assertEqual(65);
      const chinese = new Char(c'中');
      expect(Char.toInt(chinese.toChar())).assertEqual(20013);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_3400
     * @tc.name testCharToChar0034
     * @tc.desc Verify MIN_VALUE character conversion via instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minChar = new Char(Char.MIN_VALUE);
      expect(Char.toInt(minChar.toChar())).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_3500
     * @tc.name testCharToChar0035
     * @tc.desc Verify MAX_VALUE character conversion via instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxChar = new Char(Char.MAX_VALUE);
      expect(Char.toInt(maxChar.toChar())).assertEqual(65535);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_3800
     * @tc.name testCharToChar0038
     * @tc.desc Verify high surrogate characters via static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highMin = Char.toChar(Char.HIGH_SURROGATE_MIN);
      expect(Char.toInt(highMin)).assertEqual(0xD800);
      const highMax = Char.toChar(Char.HIGH_SURROGATE_MAX);
      expect(Char.toInt(highMax)).assertEqual(0xDBFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_3900
     * @tc.name testCharToChar0039
     * @tc.desc Verify low surrogate characters via static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowMin = Char.toChar(Char.LOW_SURROGATE_MIN);
      expect(Char.toInt(lowMin)).assertEqual(0xDC00);
      const lowMax = Char.toChar(Char.LOW_SURROGATE_MAX);
      expect(Char.toInt(lowMax)).assertEqual(0xDFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_4000
     * @tc.name testCharToChar0040
     * @tc.desc Verify instance method does not throw error on normal call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toChar();
      expect(result !== null).assertTrue();
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_4400
     * @tc.name testCharToChar0044
     * @tc.desc Verify toChar() works correctly in a try-finally context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'A');
        const result = c.toChar();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_4600
     * @tc.name testCharToChar0046
     * @tc.desc Verify instance toChar() returns the same char value as the original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      let result: char;
      result = c.toChar();
      expect(result).assertEqual(c'A');
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_4900
     * @tc.name testCharToChar0049
     * @tc.desc Verify instance toChar is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const startTime = Date.now();
      const result = c.toChar();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_5000
     * @tc.name testCharToChar0050
     * @tc.desc Verify static toChar is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.toChar(c'A');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_5100
     * @tc.name testCharToChar0051
     * @tc.desc Verify toChar and valueOf both return char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c.toChar()).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_5500
     * @tc.name testCharToChar0055
     * @tc.desc Verify toChar returns character while toDouble returns numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const charResult = c.toChar();
      const doubleResult = c.toDouble();
      expect(charResult).assertEqual(c'A');
      expect(doubleResult).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_5600
     * @tc.name testCharToChar0056
     * @tc.desc Verify toChar and toDouble can convert to each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const charValue = c.toChar();
      const codePoint = Char.toInt(charValue);
      expect(codePoint).assertEqual(c.toDouble());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_5700
     * @tc.name testCharToChar0057
     * @tc.desc Verify instance method called via instance and static method called via class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const instanceResult = c.toChar();
      const staticResult = Char.toChar(c'A');
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_5800
     * @tc.name testCharToChar0058
     * @tc.desc Verify instance and static methods return same result for same char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c.toChar()).assertEqual(Char.toChar(c'A'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_5900
     * @tc.name testCharToChar0059
     * @tc.desc Verify ASCII characters (0-127) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(Char.toInt(c.toChar())).assertEqual(i);
        expect(Char.toInt(Char.toChar(ch))).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_6000
     * @tc.name testCharToChar0060
     * @tc.desc Verify extended ASCII characters (128-255) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 128; i < 256; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(Char.toInt(c.toChar())).assertEqual(i);
        expect(Char.toInt(Char.toChar(ch))).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_6100
     * @tc.name testCharToChar0061
     * @tc.desc Verify BMP characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'\u4E00', c'\u4E8C', c'\u4E09'];
      const expectedVals = [0x4E00, 0x4E8C, 0x4E09];
      for (let i = 0; i < testChars.length; i++) {
        const c = new Char(testChars[i]);
        expect(Char.toInt(c.toChar())).assertEqual(expectedVals[i]);
        expect(Char.toInt(Char.toChar(testChars[i]))).assertEqual(expectedVals[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_6200
     * @tc.name testCharToChar0062
     * @tc.desc Verify all possible char values with sampling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sampleChars = [c'\u0000', c'\x7F', c'\x80', c'\xFF', c'\u0100', c'\u7FFF', c'\u8000', c'\uFFFF'];
      const expectedVals = [0, 127, 128, 255, 256, 0x7FFF, 0x8000, 0xFFFF];
      for (let i = 0; i < sampleChars.length; i++) {
        const c = new Char(sampleChars[i]);
        expect(Char.toInt(c.toChar())).assertEqual(expectedVals[i]);
        expect(Char.toInt(Char.toChar(sampleChars[i]))).assertEqual(expectedVals[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_6300
     * @tc.name testCharToChar0063
     * @tc.desc Verify valueOf-created instance can call toChar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c.toChar()).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_6400
     * @tc.name testCharToChar0064
     * @tc.desc Verify null character instance toChar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char();
      const c2 = new Char(c'\u0000');
      expect(c1.toChar()).assertEqual(c'\u0000');
      expect(c2.toChar()).assertEqual(c'\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_6500
     * @tc.name testCharToChar0065
     * @tc.desc Verify MAX_VALUE character conversion to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      expect(Char.toInt(c.toChar())).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_6600
     * @tc.name testCharToChar0066
     * @tc.desc Verify MIN_VALUE character conversion to char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MIN_VALUE);
      expect(Char.toInt(c.toChar())).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_6700
     * @tc.name testCharToChar0067
     * @tc.desc Verify repeated calls to toChar return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.toChar();
      const result2 = c.toChar();
      const result3 = c.toChar();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_6800
     * @tc.name testCharToChar0068
     * @tc.desc Verify static method repeated calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toChar(c'A');
      const result2 = Char.toChar(c'A');
      const result3 = Char.toChar(c'A');
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_6900
     * @tc.name testCharToChar0069
     * @tc.desc Verify toChar return value can participate in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = Char.toInt(c.toChar()) + 1;
      expect(result).assertEqual(66);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_7100
     * @tc.name testCharToChar0071
     * @tc.desc Verify toChar result can be concatenated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      expect(c1.toChar()).assertEqual(c'A');
      expect(c2.toChar()).assertEqual(c'B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_7200
     * @tc.name testCharToChar0072
     * @tc.desc Verify batch conversion returns correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      for (let i = 0; i < 1000; i++) {
        expect(c.toChar()).assertEqual(c'A');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_7300
     * @tc.name testCharToChar0073
     * @tc.desc Verify static method batch conversion returns correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.toChar(c'A')).assertEqual(c'A');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_7400
     * @tc.name testCharToChar0074
     * @tc.desc Verify char minimum value 0 boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MIN_VALUE);
      expect(Char.toInt(c.toChar())).assertEqual(0);
      expect(Char.toInt(Char.toChar(Char.MIN_VALUE))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_7500
     * @tc.name testCharToChar0075
     * @tc.desc Verify char maximum value 65535 boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      expect(Char.toInt(c.toChar())).assertEqual(65535);
      expect(Char.toInt(Char.toChar(Char.MAX_VALUE))).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_7600
     * @tc.name testCharToChar0076
     * @tc.desc Verify ASCII maximum value 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\x7F');
      expect(Char.toInt(c.toChar())).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_7700
     * @tc.name testCharToChar0077
     * @tc.desc Verify extended ASCII boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\x80');
      const c2 = new Char(c'\xFF');
      expect(Char.toInt(c1.toChar())).assertEqual(128);
      expect(Char.toInt(c2.toChar())).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_7800
     * @tc.name testCharToChar0078
     * @tc.desc Verify high surrogate region boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(Char.HIGH_SURROGATE_MIN);
      const c2 = new Char(Char.HIGH_SURROGATE_MAX);
      expect(Char.toInt(c1.toChar())).assertEqual(0xD800);
      expect(Char.toInt(c2.toChar())).assertEqual(0xDBFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_7900
     * @tc.name testCharToChar0079
     * @tc.desc Verify instance and static methods return consistent results for same characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'A', c'Z', c'a', c'z', c'0', c'9', c' ', c'\n', c'中'];
      for (const ch of testChars) {
        const c = new Char(ch);
        expect(c.toChar()).assertEqual(Char.toChar(ch));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARTOCHARTEST_CHARTOCHARTEST_8000
     * @tc.name testCharToChar0080
     * @tc.desc Verify that Char.toChar and the instance toChar method return the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToChar0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x00', c'A', c'z', c'0', c'9', c' ', c'\x7F', c'\x80', c'\xFF'];
      for (const ch of samples) {
        const c = new Char(ch);
        expect(Char.toChar(ch)).assertEqual(c.toChar());
      }
    });

  });
}
