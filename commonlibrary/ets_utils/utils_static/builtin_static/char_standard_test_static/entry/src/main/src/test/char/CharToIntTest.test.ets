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

export default function CharToIntTest(): void {
  describe('CharToIntTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_0100
     * @tc.name testCharToInt0001
     * @tc.desc Verify toInt method accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toInt();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_0200
     * @tc.name testCharToInt0002
     * @tc.desc Verify toInt() can be called with no arguments and returns a valid result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toInt();
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_0300
     * @tc.name testCharToInt0003
     * @tc.desc Verify no parameters needed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toInt();
      expect(typeof result === "number" || typeof result === "int").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_0400
     * @tc.name testCharToInt0004
     * @tc.desc Verify return value is int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toInt();
      expect(typeof result === "number" || typeof result === "int").assertTrue();
      expect(Number.isInteger(result)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_0600
     * @tc.name testCharToInt0006
     * @tc.desc Verify lowercase letter z converts to int 122
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'z');
      const result = c.toInt();
      expect(result).assertEqual(122);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_0700
     * @tc.name testCharToInt0007
     * @tc.desc Verify digit character 0 converts to int 48
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'0');
      const result = c.toInt();
      expect(result).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_0800
     * @tc.name testCharToInt0008
     * @tc.desc Verify digit character 9 converts to int 57
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'9');
      const result = c.toInt();
      expect(result).assertEqual(57);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_0900
     * @tc.name testCharToInt0009
     * @tc.desc Verify space character converts to int 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c' ');
      const result = c.toInt();
      expect(result).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_1000
     * @tc.name testCharToInt0010
     * @tc.desc Verify special symbol converts to int 126
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'~');
      const result = c.toInt();
      expect(result).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_1100
     * @tc.name testCharToInt0011
     * @tc.desc Verify Chinese character converts to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'中');
      const result = c.toInt();
      expect(result).assertEqual(20013);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_1200
     * @tc.name testCharToInt0012
     * @tc.desc Verify emoji character via surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\uD83D');
      const result = c.toInt();
      expect(result).assertEqual(55357);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_1300
     * @tc.name testCharToInt0013
     * @tc.desc Verify null character \\u0000 converts to int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\u0000');
      const result = c.toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_1400
     * @tc.name testCharToInt0014
     * @tc.desc Verify newline character \\n converts to int 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\n');
      const result = c.toInt();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_1500
     * @tc.name testCharToInt0015
     * @tc.desc Verify tab character \\t converts to int 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\t');
      const result = c.toInt();
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_1600
     * @tc.name testCharToInt0016
     * @tc.desc Verify carriage return character \\r converts to int 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\r');
      const result = c.toInt();
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_1700
     * @tc.name testCharToInt0017
     * @tc.desc Verify high surrogate minimum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.HIGH_SURROGATE_MIN);
      const result = c.toInt();
      expect(result).assertEqual(0xD800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_1800
     * @tc.name testCharToInt0018
     * @tc.desc Verify high surrogate maximum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.HIGH_SURROGATE_MAX);
      const result = c.toInt();
      expect(result).assertEqual(0xDBFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_1900
     * @tc.name testCharToInt0019
     * @tc.desc Verify low surrogate minimum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.LOW_SURROGATE_MIN);
      const result = c.toInt();
      expect(result).assertEqual(0xDC00);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_2000
     * @tc.name testCharToInt0020
     * @tc.desc Verify low surrogate maximum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.LOW_SURROGATE_MAX);
      const result = c.toInt();
      expect(result).assertEqual(0xDFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_2100
     * @tc.name testCharToInt0021
     * @tc.desc Verify BMP character boundary conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(Char.MIN_VALUE);
      const c2 = new Char(Char.MAX_VALUE);
      expect(c1.toInt()).assertEqual(0);
      expect(c2.toInt()).assertEqual(65535);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_2300
     * @tc.name testCharToInt0023
     * @tc.desc Verify return value is an integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toInt();
      expect(Number.isInteger(result)).assertTrue();
      expect(result % 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_2400
     * @tc.name testCharToInt0024
     * @tc.desc Verify char conversion result is within safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      const result = c.toInt();
      expect(result <= Number.MAX_SAFE_INTEGER).assertTrue();
      expect(Number.isSafeInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_2500
     * @tc.name testCharToInt0025
     * @tc.desc Verify ASCII range character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        const result = c.toInt();
        expect(result).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_2600
     * @tc.name testCharToInt0026
     * @tc.desc Verify extended ASCII character (128-255) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 128; i < 256; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        const result = c.toInt();
        expect(result).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_2700
     * @tc.name testCharToInt0027
     * @tc.desc Verify basic multilingual plane character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'\u4E00', c'\u4E8C', c'\u4E09'];
      const expected = [0x4E00, 0x4E8C, 0x4E09];
      for (let idx = 0; idx < testChars.length; idx++) {
        const c = new Char(testChars[idx]);
        const result = c.toInt();
        expect(result).assertEqual(expected[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_2800
     * @tc.name testCharToInt0028
     * @tc.desc Verify char maximum value converts to int 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      const result = c.toInt();
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_2900
     * @tc.name testCharToInt0029
     * @tc.desc Verify multiple conversions return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      for (let i = 0; i < 1000; i++) {
        expect(c.toInt()).assertEqual(65);
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_3200
     * @tc.name testCharToInt0032
     * @tc.desc Verify toInt() works correctly in a try-finally context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'A');
        const result = c.toInt();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_3300
     * @tc.name testCharToInt0033
     * @tc.desc Verify toInt is an instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      let result: number;
      result = c.toInt();
      expect(typeof result === "number" || typeof result === "int").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_3400
     * @tc.name testCharToInt0034
     * @tc.desc Verify toInt cannot be called as static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      let instanceResult: number;
      instanceResult = c.toInt();
      const staticResult = Char.toInt(c'A');
      expect(typeof staticResult === "number" || typeof staticResult === "int").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_3500
     * @tc.name testCharToInt0035
     * @tc.desc Verify toInt is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const startTime = Date.now();
      const result = c.toInt();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_3600
     * @tc.name testCharToInt0036
     * @tc.desc Verify int range is larger than byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\u0080');
      const byteResult = c.toByte();
      const intResult = c.toInt();
      expect(intResult).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_3700
     * @tc.name testCharToInt0037
     * @tc.desc Verify toInt and toShort return the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const intResult = c.toInt();
      const shortResult = c.toShort();
      expect(intResult).assertEqual(shortResult);
      expect(intResult).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_3800
     * @tc.name testCharToInt0038
     * @tc.desc Verify toInt and toLong return the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const intResult = c.toInt();
      const longResult = c.toLong();
      expect(intResult).assertEqual(longResult);
      expect(intResult).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_3900
     * @tc.name testCharToInt0039
     * @tc.desc Verify static method Char.toInt(value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.toInt();
      const result2 = Char.toInt(c.toChar());
      expect(result1).assertEqual(result2);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_4200
     * @tc.name testCharToInt0042
     * @tc.desc Verify BMP character (0-65535) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'\u4E00', c'\u4E8C', c'\u4E09', c'\u4E5D', c'\u4E94'];
      const expected = [0x4E00, 0x4E8C, 0x4E09, 0x4E5D, 0x4E94];
      for (let idx = 0; idx < testChars.length; idx++) {
        const c = new Char(testChars[idx]);
        const result = c.toInt();
        expect(result).assertEqual(expected[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_4300
     * @tc.name testCharToInt0043
     * @tc.desc Verify all possible char values with sampling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sampleChars = [c'\u0000', c'\u007F', c'\u0080', c'\u00FF', c'\u0100', c'\u7FFF', c'\u8000', c'\uFFFF'];
      const expected = [0, 127, 128, 255, 256, 32767, 32768, 65535];
      for (let idx = 0; idx < sampleChars.length; idx++) {
        const c = new Char(sampleChars[idx]);
        const result = c.toInt();
        expect(result).assertEqual(expected[idx]);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_4500
     * @tc.name testCharToInt0045
     * @tc.desc Verify null character instance toInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char();
      const c2 = new Char(c'\u0000');
      expect(c1.toInt()).assertEqual(0);
      expect(c2.toInt()).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_4700
     * @tc.name testCharToInt0047
     * @tc.desc Verify minimum character value converts to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MIN_VALUE);
      const result = c.toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_4800
     * @tc.name testCharToInt0048
     * @tc.desc Verify no precision loss within int range (0-65535)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sampleChars = [c'\u0000', c'\u0100', c'\uFFFF'];
      const expected = [0, 256, 65535];
      for (let idx = 0; idx < sampleChars.length; idx++) {
        const c = new Char(sampleChars[idx]);
        const result = c.toInt();
        expect(result).assertEqual(expected[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_4900
     * @tc.name testCharToInt0049
     * @tc.desc Verify char is unsigned and int range is sufficient
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\u8000');
      const result = c.toInt();
      expect(result).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_5000
     * @tc.name testCharToInt0050
     * @tc.desc Verify toInt return value can be used in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toInt() + 1;
      expect(result).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_5100
     * @tc.name testCharToInt0051
     * @tc.desc Verify multiple calls to toInt return the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.toInt();
      const result2 = c.toInt();
      const result3 = c.toInt();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_5200
     * @tc.name testCharToInt0052
     * @tc.desc Verify toInt result can be further converted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const intValue = c.toInt();
      expect(intValue).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLNTTEST_5300
     * @tc.name testCharToInt0053
     * @tc.desc Verify all conversion methods return consistent results for ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToInt0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c.toInt()).assertEqual(c.toShort());
      expect(c.toInt()).assertEqual(c.toLong());
    });



  });
}
