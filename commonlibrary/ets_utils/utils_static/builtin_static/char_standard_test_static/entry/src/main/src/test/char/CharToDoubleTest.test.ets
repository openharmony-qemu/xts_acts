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

export default function CharToDoubleTest(): void {
  describe('CharToDoubleTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_0100
     * @tc.name testCharToDouble0001
     * @tc.desc Verify toDouble method accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toDouble();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_0200
     * @tc.name testCharToDouble0002
     * @tc.desc Verify toDouble ignores or throws error when passing parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toDouble();
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_0300
     * @tc.name testCharToDouble0003
     * @tc.desc Verify toDouble requires no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toDouble();
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_0400
     * @tc.name testCharToDouble0004
     * @tc.desc Verify return value is double type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toDouble();
      expect(typeof result).assertEqual("number");
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_0500
     * @tc.name testCharToDouble0005
     * @tc.desc Verify uppercase letter A converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toDouble();
      expect(result).assertEqual(65);
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_0600
     * @tc.name testCharToDouble0006
     * @tc.desc Verify lowercase letter z converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'z');
      const result = c.toDouble();
      expect(result).assertEqual(122);
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_0700
     * @tc.name testCharToDouble0007
     * @tc.desc Verify digit character 0 converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'0');
      const result = c.toDouble();
      expect(result).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_0800
     * @tc.name testCharToDouble0008
     * @tc.desc Verify digit character 9 converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'9');
      const result = c.toDouble();
      expect(result).assertEqual(57);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_0900
     * @tc.name testCharToDouble0009
     * @tc.desc Verify space character converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c' ');
      const result = c.toDouble();
      expect(result).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_1000
     * @tc.name testCharToDouble0010
     * @tc.desc Verify special symbol converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'~');
      const result = c.toDouble();
      expect(result).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_1100
     * @tc.name testCharToDouble0011
     * @tc.desc Verify Chinese character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'中');
      const result = c.toDouble();
      expect(result).assertEqual(20013);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_1200
     * @tc.name testCharToDouble0012
     * @tc.desc Verify emoji character conversion via surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\uD83D');
      const result = c.toDouble();
      expect(result).assertEqual(55357);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_1300
     * @tc.name testCharToDouble0013
     * @tc.desc Verify null character u0000 converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\u0000');
      const result = c.toDouble();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_1400
     * @tc.name testCharToDouble0014
     * @tc.desc Verify newline character converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\n');
      const result = c.toDouble();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_1500
     * @tc.name testCharToDouble0015
     * @tc.desc Verify tab character converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\t');
      const result = c.toDouble();
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_1600
     * @tc.name testCharToDouble0016
     * @tc.desc Verify carriage return character converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\r');
      const result = c.toDouble();
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_1700
     * @tc.name testCharToDouble0017
     * @tc.desc Verify high surrogate minimum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.HIGH_SURROGATE_MIN);
      const result = c.toDouble();
      expect(result).assertEqual(0xD800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_1800
     * @tc.name testCharToDouble0018
     * @tc.desc Verify high surrogate maximum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.HIGH_SURROGATE_MAX);
      const result = c.toDouble();
      expect(result).assertEqual(0xDBFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_1900
     * @tc.name testCharToDouble0019
     * @tc.desc Verify low surrogate minimum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.LOW_SURROGATE_MIN);
      const result = c.toDouble();
      expect(result).assertEqual(0xDC00);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_2000
     * @tc.name testCharToDouble0020
     * @tc.desc Verify low surrogate maximum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.LOW_SURROGATE_MAX);
      const result = c.toDouble();
      expect(result).assertEqual(0xDFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_2100
     * @tc.name testCharToDouble0021
     * @tc.desc Verify char maximum value converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      const result = c.toDouble();
      expect(result).assertEqual(65535);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_2300
     * @tc.name testCharToDouble0023
     * @tc.desc Verify return value is a finite number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toDouble();
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_2400
     * @tc.name testCharToDouble0024
     * @tc.desc Verify return value is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toDouble();
      expect(Number.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_2500
     * @tc.name testCharToDouble0025
     * @tc.desc Verify return value is not Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toDouble();
      expect(Number.isFinite(result)).assertTrue();
      expect(result !== Number.POSITIVE_INFINITY).assertTrue();
      expect(result !== Number.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_2600
     * @tc.name testCharToDouble0026
     * @tc.desc Verify ASCII range character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(c.toDouble()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_2700
     * @tc.name testCharToDouble0027
     * @tc.desc Verify extended ASCII character (128-255) conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 128; i < 256; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(c.toDouble()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_2800
     * @tc.name testCharToDouble0028
     * @tc.desc Verify multiple conversions return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      for (let i = 0; i < 1000; i++) {
        expect(c.toDouble()).assertEqual(65);
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_3100
     * @tc.name testCharToDouble0031
     * @tc.desc Verify toDouble() works correctly in a try-finally context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'A');
        const result = c.toDouble();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_3200
     * @tc.name testCharToDouble0032
     * @tc.desc Verify toDouble is an instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      let result: number;
      result = c.toDouble();
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_3300
     * @tc.name testCharToDouble0033
     * @tc.desc Verify instance toDouble() returns the numeric code point value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      let result: number;
      result = c.toDouble();
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_3400
     * @tc.name testCharToDouble0034
     * @tc.desc Verify toDouble is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const startTime = Date.now();
      const result = c.toDouble();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_3500
     * @tc.name testCharToDouble0035
     * @tc.desc Verify toDouble and toInt return same number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const doubleResult = c.toDouble();
      const intResult = c.toInt();
      expect(typeof doubleResult === "number" || typeof doubleResult === "double").assertTrue();
      expect(typeof intResult === "number" || typeof intResult === "int").assertTrue();
      expect(doubleResult).assertEqual(intResult);
      expect(doubleResult).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_3600
     * @tc.name testCharToDouble0036
     * @tc.desc Verify ASCII character conversion results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(c.toDouble()).assertEqual(c.toInt());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_3700
     * @tc.name testCharToDouble0037
     * @tc.desc Verify double is 64-bit and float is 32-bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const floatResult = c.toFloat();
      const doubleResult = c.toDouble();
      expect(floatResult).assertEqual(doubleResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_3900
     * @tc.name testCharToDouble0039
     * @tc.desc Verify static method Char.toDouble(value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.toDouble();
      const result2 = Char.toDouble(c.toChar());
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_4300
     * @tc.name testCharToDouble0043
     * @tc.desc Verify toDouble returns the numeric value of Unicode code points across the full BMP range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sampleChars = [c'\u0000', c'\u007F', c'\u0080', c'\u00FF', c'\u0100', c'\u7FFF', c'\u8000', c'\uFFFF'];
      const expectedVals = [0, 127, 128, 255, 256, 32767, 32768, 65535];
      for (let idx = 0; idx < sampleChars.length; idx++) {
        const c = new Char(sampleChars[idx]);
        expect(c.toDouble()).assertEqual(expectedVals[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_4500
     * @tc.name testCharToDouble0045
     * @tc.desc Verify null character instance toDouble
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char();
      const c2 = new Char(c'\u0000');
      expect(c1.toDouble()).assertEqual(0);
      expect(c2.toDouble()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_4600
     * @tc.name testCharToDouble0046
     * @tc.desc Verify maximum character value converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      const result = c.toDouble();
      expect(result).assertEqual(65535);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_4700
     * @tc.name testCharToDouble0047
     * @tc.desc Verify minimum character value converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MIN_VALUE);
      const result = c.toDouble();
      expect(result).assertEqual(0);
      expect(Number.isFinite(result)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_4900
     * @tc.name testCharToDouble0049
     * @tc.desc Verify small integers can be precisely represented
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sampleChars = [c'\u0000', c'\uFFFF', Char.MAX_VALUE];
      for (const ch of sampleChars) {
        const c = new Char(ch);
        expect(Number.isFinite(c.toDouble())).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_5000
     * @tc.name testCharToDouble0050
     * @tc.desc Verify double can represent large integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      const result = c.toDouble();
      expect(result).assertEqual(65535);
      expect(Number.isSafeInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_5100
     * @tc.name testCharToDouble0051
     * @tc.desc Verify toDouble result can participate in floating point operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toDouble() * 1.5;
      expect(result).assertEqual(97.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_5200
     * @tc.name testCharToDouble0052
     * @tc.desc Verify floating point division operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toDouble() / 2.0;
      expect(result).assertEqual(32.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_5300
     * @tc.name testCharToDouble0053
     * @tc.desc Verify double precision is sufficient for small integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toDouble();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_5400
     * @tc.name testCharToDouble0054
     * @tc.desc Verify double supports high precision calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\uFFFF');
      const c2 = new Char(c'A');
      const result = c1.toDouble() + c2.toDouble();
      expect(result).assertEqual(65600);
      expect(Number.isSafeInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_5500
     * @tc.name testCharToDouble0055
     * @tc.desc Verify toDouble return value can participate in operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toDouble() + 0.5;
      expect(result).assertEqual(65.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_5600
     * @tc.name testCharToDouble0056
     * @tc.desc Verify multiple calls to toDouble return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.toDouble();
      const result2 = c.toDouble();
      const result3 = c.toDouble();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_5700
     * @tc.name testCharToDouble0057
     * @tc.desc Verify ASCII character various conversion methods are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c.toDouble()).assertEqual(c.toInt());
      expect(c.toDouble()).assertEqual(c.toLong());
      expect(c.toDouble()).assertEqual(c.toShort());
      expect(c.toDouble()).assertEqual(c.toFloat());
      expect(c.toDouble()).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_5800
     * @tc.name testCharToDouble0058
     * @tc.desc Verify double is suitable for high precision numerical operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      const doubleValue = c.toDouble();
      const result = doubleValue * 2;
      expect(result).assertEqual(131070);
      expect(Number.isSafeInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_5900
     * @tc.name testCharToDouble0059
     * @tc.desc Verify double precision is higher than float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const floatValue = c.toFloat();
      const doubleValue = c.toDouble();
      expect(floatValue).assertEqual(doubleValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_6000
     * @tc.name testCharToDouble0060
     * @tc.desc Verify char minimum value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MIN_VALUE);
      const result = c.toDouble();
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_6200
     * @tc.name testCharToDouble0062
     * @tc.desc Verify all char values are within double precision range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      const result = c.toDouble();
      expect(Number.isFinite(result)).assertTrue();
      expect(result <= Number.MAX_SAFE_INTEGER).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_6300
     * @tc.name testCharToDouble0063
     * @tc.desc Verify double representable numerical range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toDouble();
      expect(result > Number.MIN_SAFE_INTEGER).assertTrue();
      expect(result < Number.MAX_SAFE_INTEGER).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_6400
     * @tc.name testCharToDouble0064
     * @tc.desc Verify all char values are within safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      const result = c.toDouble();
      expect(result <= Number.MAX_SAFE_INTEGER).assertTrue();
      expect(Number.isSafeInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLETEST_6500
     * @tc.name testCharToDouble0065
     * @tc.desc Verify char to double conversion does not lose precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDouble0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sampleChars = [c'\u0000', c'\uFFFF', Char.MAX_VALUE];
      const expectedVals = [0, 65535, 65535];
      for (let idx = 0; idx < sampleChars.length; idx++) {
        const c = new Char(sampleChars[idx]);
        expect(c.toDouble()).assertEqual(expectedVals[idx]);
      }
    });
  });
}
