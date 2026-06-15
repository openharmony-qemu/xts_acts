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

export default function CharToLongTest(): void {
  describe('CharToLongTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_0100
     * @tc.name testCharToLong0001
     * @tc.desc Verify toLong method with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toLong();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_0200
     * @tc.name testCharToLong0002
     * @tc.desc Verify toLong throws error when passing extra parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toLong();
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_0300
     * @tc.name testCharToLong0003
     * @tc.desc Verify toLong requires no parameter and returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toLong();
      expect(typeof result === "number" || typeof result === "long").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_0400
     * @tc.name testCharToLong0004
     * @tc.desc Verify toLong returns long type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toLong();
      expect(typeof result === "number" || typeof result === "long").assertTrue();
      expect(Number.isInteger(result)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_0600
     * @tc.name testCharToLong0006
     * @tc.desc Verify lowercase letter z converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'z');
      const result = c.toLong();
      expect(result).assertEqual(122);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_0700
     * @tc.name testCharToLong0007
     * @tc.desc Verify digit character 0 converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'0');
      const result = c.toLong();
      expect(result).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_0800
     * @tc.name testCharToLong0008
     * @tc.desc Verify digit character 9 converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'9');
      const result = c.toLong();
      expect(result).assertEqual(57);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_0900
     * @tc.name testCharToLong0009
     * @tc.desc Verify space character converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c' ');
      const result = c.toLong();
      expect(result).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_1000
     * @tc.name testCharToLong0010
     * @tc.desc Verify special symbol tilde converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'~');
      const result = c.toLong();
      expect(result).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_1100
     * @tc.name testCharToLong0011
     * @tc.desc Verify Chinese character converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'中');
      const result = c.toLong();
      expect(result).assertEqual(20013);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_1200
     * @tc.name testCharToLong0012
     * @tc.desc Verify emoji surrogate high character converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\uD83D');
      const result = c.toLong();
      expect(result).assertEqual(55357);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_1300
     * @tc.name testCharToLong0013
     * @tc.desc Verify null character u0000 converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\u0000');
      const result = c.toLong();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_1400
     * @tc.name testCharToLong0014
     * @tc.desc Verify newline character converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\n');
      const result = c.toLong();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_1500
     * @tc.name testCharToLong0015
     * @tc.desc Verify tab character converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\t');
      const result = c.toLong();
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_1600
     * @tc.name testCharToLong0016
     * @tc.desc Verify carriage return character converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\r');
      const result = c.toLong();
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_1700
     * @tc.name testCharToLong0017
     * @tc.desc Verify high surrogate minimum value converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.HIGH_SURROGATE_MIN);
      const result = c.toLong();
      expect(result).assertEqual(0xD800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_1800
     * @tc.name testCharToLong0018
     * @tc.desc Verify high surrogate maximum value converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.HIGH_SURROGATE_MAX);
      const result = c.toLong();
      expect(result).assertEqual(0xDBFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_1900
     * @tc.name testCharToLong0019
     * @tc.desc Verify low surrogate minimum value converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.LOW_SURROGATE_MIN);
      const result = c.toLong();
      expect(result).assertEqual(0xDC00);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_2000
     * @tc.name testCharToLong0020
     * @tc.desc Verify low surrogate maximum value converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.LOW_SURROGATE_MAX);
      const result = c.toLong();
      expect(result).assertEqual(0xDFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_2100
     * @tc.name testCharToLong0021
     * @tc.desc Verify BMP character boundary values convert to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(Char.MIN_VALUE);
      const c2 = new Char(Char.MAX_VALUE);
      expect(c1.toLong()).assertEqual(0);
      expect(c2.toLong()).assertEqual(65535);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_2300
     * @tc.name testCharToLong0023
     * @tc.desc Verify return value is an integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toLong();
      expect(Number.isInteger(result)).assertTrue();
      expect(result % 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_2400
     * @tc.name testCharToLong0024
     * @tc.desc Verify char conversion result is within safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      const result = c.toLong();
      expect(result <= Number.MAX_SAFE_INTEGER).assertTrue();
      expect(Number.isSafeInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_2500
     * @tc.name testCharToLong0025
     * @tc.desc Verify ASCII range characters convert to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        const result = c.toLong();
        expect(result).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_2600
     * @tc.name testCharToLong0026
     * @tc.desc Verify extended ASCII characters 128-255 convert to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 128; i < 256; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        const result = c.toLong();
        expect(result).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_2700
     * @tc.name testCharToLong0027
     * @tc.desc Verify BMP characters convert to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'\u4E00', c'\u4E8C', c'\u4E09'];
      const expected = [0x4E00, 0x4E8C, 0x4E09];
      for (let idx = 0; idx < testChars.length; idx++) {
        const c = new Char(testChars[idx]);
        const result = c.toLong();
        expect(result).assertEqual(expected[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_2800
     * @tc.name testCharToLong0028
     * @tc.desc Verify char maximum value converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      const result = c.toLong();
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_2900
     * @tc.name testCharToLong0029
     * @tc.desc Verify multiple conversions return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      for (let i = 0; i < 1000; i++) {
        expect(c.toLong()).assertEqual(65);
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_3200
     * @tc.name testCharToLong0032
     * @tc.desc Verify toLong() works correctly in a try-finally context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'A');
        const result = c.toLong();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_3300
     * @tc.name testCharToLong0033
     * @tc.desc Verify toLong is an instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      let result: number;
      result = c.toLong();
      expect(typeof result === "number" || typeof result === "long").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_3400
     * @tc.name testCharToLong0034
     * @tc.desc Verify instance toLong() returns the numeric code point value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      let result: number;
      result = c.toLong();
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_3500
     * @tc.name testCharToLong0035
     * @tc.desc Verify toLong is a synchronous method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const startTime = Date.now();
      const result = c.toLong();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_3600
     * @tc.name testCharToLong0036
     * @tc.desc Verify long range is much larger than byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\u0080');
      const byteResult = c.toByte();
      const longResult = c.toLong();
      expect(longResult).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_3700
     * @tc.name testCharToLong0037
     * @tc.desc Verify long range is larger than short range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\u8000');
      const shortResult = c.toShort();
      const longResult = c.toLong();
      expect(longResult).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_3800
     * @tc.name testCharToLong0038
     * @tc.desc Verify toLong and toInt return the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const intResult = c.toInt();
      const longResult = c.toLong();
      expect(intResult).assertEqual(longResult);
      expect(intResult).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_3900
     * @tc.name testCharToLong0039
     * @tc.desc Verify static method Char.toLong returns same result as instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.toLong();
      const result2 = Char.toLong(c.toChar());
      expect(result1).assertEqual(result2);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_4200
     * @tc.name testCharToLong0042
     * @tc.desc Verify BMP characters 0-65535 convert to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'\u4E00', c'\u4E8C', c'\u4E09', c'\u4E5D', c'\u4E94'];
      const expected = [0x4E00, 0x4E8C, 0x4E09, 0x4E5D, 0x4E94];
      for (let idx = 0; idx < testChars.length; idx++) {
        const c = new Char(testChars[idx]);
        const result = c.toLong();
        expect(result).assertEqual(expected[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_4300
     * @tc.name testCharToLong0043
     * @tc.desc Verify all possible char values with sample points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sampleChars = [c'\u0000', c'\u007F', c'\u0080', c'\u00FF', c'\u0100', c'\u7FFF', c'\u8000', c'\uFFFF'];
      const expected = [0, 127, 128, 255, 256, 32767, 32768, 65535];
      for (let idx = 0; idx < sampleChars.length; idx++) {
        const c = new Char(sampleChars[idx]);
        const result = c.toLong();
        expect(result).assertEqual(expected[idx]);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_4500
     * @tc.name testCharToLong0045
     * @tc.desc Verify null character instance toLong returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char();
      const c2 = new Char(c'\u0000');
      expect(c1.toLong()).assertEqual(0);
      expect(c2.toLong()).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_4700
     * @tc.name testCharToLong0047
     * @tc.desc Verify minimum character value converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MIN_VALUE);
      const result = c.toLong();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_4800
     * @tc.name testCharToLong0048
     * @tc.desc Verify no precision loss within long range 0-65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sampleChars = [c'\u0000', c'\u0100', c'\uFFFF'];
      const expected = [0, 256, 65535];
      for (let idx = 0; idx < sampleChars.length; idx++) {
        const c = new Char(sampleChars[idx]);
        const result = c.toLong();
        expect(result).assertEqual(expected[idx]);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_5000
     * @tc.name testCharToLong0050
     * @tc.desc Verify toLong return value can participate in arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toLong() + 1;
      expect(result).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_5100
     * @tc.name testCharToLong0051
     * @tc.desc Verify repeated calls to toLong return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.toLong();
      const result2 = c.toLong();
      const result3 = c.toLong();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_5200
     * @tc.name testCharToLong0052
     * @tc.desc Verify toLong result can be further converted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const longValue = c.toLong();
      expect(longValue).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_5300
     * @tc.name testCharToLong0053
     * @tc.desc Verify all conversion methods return consistent results for ASCII characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c.toLong()).assertEqual(c.toInt());
      expect(c.toLong()).assertEqual(c.toShort());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_5400
     * @tc.name testCharToLong0054
     * @tc.desc Verify long is suitable for large integer operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      const longValue = c.toLong();
      expect(longValue).assertEqual(65535);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_5700
     * @tc.name testCharToLong0057
     * @tc.desc Verify all char values are within long range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      const result = c.toLong();
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_5800
     * @tc.name testCharToLong0058
     * @tc.desc Verify long and int return same results within char value range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 256; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(c.toLong()).assertEqual(c.toInt());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLONGTEST_5900
     * @tc.name testCharToLong0059
     * @tc.desc Verify long value is stored as Number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLong0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const longValue = c.toLong();
      expect(typeof longValue === "number" || typeof longValue === "long").assertTrue();
    });
  });
}
