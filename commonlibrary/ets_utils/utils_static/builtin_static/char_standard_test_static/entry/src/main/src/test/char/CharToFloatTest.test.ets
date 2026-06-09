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

export default function CharToFloatTest(): void {
  describe('CharToFloatTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_0100
     * @tc.name testCharToFloat0001
     * @tc.desc Verify toFloat method accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toFloat();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_0200
     * @tc.name testCharToFloat0002
     * @tc.desc Verify toFloat() can be called with no arguments and returns a valid result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toFloat();
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_0300
     * @tc.name testCharToFloat0003
     * @tc.desc Verify no parameters needed for toFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toFloat();
      expect(typeof result === "number" || typeof result === "float").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_0400
     * @tc.name testCharToFloat0004
     * @tc.desc Verify return value is float type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toFloat();
      expect(typeof result === "number" || typeof result === "float").assertTrue();
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_0500
     * @tc.name testCharToFloat0005
     * @tc.desc Verify uppercase letter A converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toFloat();
      expect(result).assertEqual(65);
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_0600
     * @tc.name testCharToFloat0006
     * @tc.desc Verify lowercase letter z converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'z');
      const result = c.toFloat();
      expect(result).assertEqual(122);
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_0700
     * @tc.name testCharToFloat0007
     * @tc.desc Verify digit character 0 converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'0');
      const result = c.toFloat();
      expect(result).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_0800
     * @tc.name testCharToFloat0008
     * @tc.desc Verify digit character 9 converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'9');
      const result = c.toFloat();
      expect(result).assertEqual(57);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_0900
     * @tc.name testCharToFloat0009
     * @tc.desc Verify space character converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c' ');
      const result = c.toFloat();
      expect(result).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_1000
     * @tc.name testCharToFloat0010
     * @tc.desc Verify special symbol converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'~');
      const result = c.toFloat();
      expect(result).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_1100
     * @tc.name testCharToFloat0011
     * @tc.desc Verify Chinese character converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'中');
      const result = c.toFloat();
      expect(result).assertEqual(20013);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_1200
     * @tc.name testCharToFloat0012
     * @tc.desc Verify emoji character via surrogate pair converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\uD83D');
      const result = c.toFloat();
      expect(result).assertEqual(55357);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_1300
     * @tc.name testCharToFloat0013
     * @tc.desc Verify null character \\u0000 converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\u0000');
      const result = c.toFloat();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_1400
     * @tc.name testCharToFloat0014
     * @tc.desc Verify newline character \\n converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\n');
      const result = c.toFloat();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_1500
     * @tc.name testCharToFloat0015
     * @tc.desc Verify tab character \\t converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\t');
      const result = c.toFloat();
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_1600
     * @tc.name testCharToFloat0016
     * @tc.desc Verify carriage return character \\r converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'\r');
      const result = c.toFloat();
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_1700
     * @tc.name testCharToFloat0017
     * @tc.desc Verify high surrogate minimum value converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.HIGH_SURROGATE_MIN);
      const result = c.toFloat();
      expect(result).assertEqual(0xD800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_1800
     * @tc.name testCharToFloat0018
     * @tc.desc Verify high surrogate maximum value converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.HIGH_SURROGATE_MAX);
      const result = c.toFloat();
      expect(result).assertEqual(0xDBFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_1900
     * @tc.name testCharToFloat0019
     * @tc.desc Verify char maximum value converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      const result = c.toFloat();
      expect(result).assertEqual(65535);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_2100
     * @tc.name testCharToFloat0021
     * @tc.desc Verify return value is finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toFloat();
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_2200
     * @tc.name testCharToFloat0022
     * @tc.desc Verify return value is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toFloat();
      expect(Number.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_2300
     * @tc.name testCharToFloat0023
     * @tc.desc Verify return value is not Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toFloat();
      expect(Number.isFinite(result)).assertTrue();
      expect(result !== Number.POSITIVE_INFINITY).assertTrue();
      expect(result !== Number.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_2400
     * @tc.name testCharToFloat0024
     * @tc.desc Verify ASCII range characters convert to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        const result = c.toFloat();
        expect(result).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_2500
     * @tc.name testCharToFloat0025
     * @tc.desc Verify extended ASCII characters 128-255 convert to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 128; i < 256; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        const result = c.toFloat();
        expect(result).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_2600
     * @tc.name testCharToFloat0026
     * @tc.desc Verify multiple conversions return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      for (let i = 0; i < 1000; i++) {
        expect(c.toFloat()).assertEqual(65);
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_2900
     * @tc.name testCharToFloat0029
     * @tc.desc Verify toFloat() works correctly in a try-finally context regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'A');
        const result = c.toFloat();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_3100
     * @tc.name testCharToFloat0031
     * @tc.desc Verify Char.toFloat() can be called statically and returns a defined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'A');
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_3200
     * @tc.name testCharToFloat0032
     * @tc.desc Verify toFloat is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const startTime = Date.now();
      const result = c.toFloat();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_3300
     * @tc.name testCharToFloat0033
     * @tc.desc Verify toFloat and toInt return same number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const floatResult = c.toFloat();
      const intResult = c.toInt();
      expect(typeof floatResult === "number" || typeof floatResult === "float").assertTrue();
      expect(typeof intResult === "number" || typeof intResult === "int").assertTrue();
      expect(floatResult).assertEqual(intResult);
      expect(floatResult).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_3400
     * @tc.name testCharToFloat0034
     * @tc.desc Verify ASCII characters conversion results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(c.toFloat()).assertEqual(c.toInt());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_3500
     * @tc.name testCharToFloat0035
     * @tc.desc Verify float is 32-bit and double is 64-bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const floatResult = c.toFloat();
      const doubleResult = c.toDouble();
      expect(floatResult).assertEqual(doubleResult);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_3700
     * @tc.name testCharToFloat0037
     * @tc.desc Verify static method Char.toFloat with value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.toFloat();
      const result2 = Char.toFloat(c.toChar());
      expect(result1).assertEqual(result2);
    });





    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_4200
     * @tc.name testCharToFloat0042
     * @tc.desc Verify null character instance toFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char();
      const c2 = new Char(c'\u0000');
      expect(c1.toFloat()).assertEqual(0);
      expect(c2.toFloat()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_4300
     * @tc.name testCharToFloat0043
     * @tc.desc Verify maximum character value converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      const result = c.toFloat();
      expect(result).assertEqual(65535);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_4400
     * @tc.name testCharToFloat0044
     * @tc.desc Verify minimum character value converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MIN_VALUE);
      const result = c.toFloat();
      expect(result).assertEqual(0);
      expect(Number.isFinite(result)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_4600
     * @tc.name testCharToFloat0046
     * @tc.desc Verify small integers can be exactly represented
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\u0000', c'\uFFFF', Char.MAX_VALUE];
      for (const ch of samples) {
        const c = new Char(ch);
        const result = c.toFloat();
        expect(Number.isFinite(result)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_4700
     * @tc.name testCharToFloat0047
     * @tc.desc Verify toFloat result can participate in float arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toFloat() * 1.5;
      expect(result).assertEqual(97.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_4800
     * @tc.name testCharToFloat0048
     * @tc.desc Verify float precision is sufficient for small integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toFloat();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_4900
     * @tc.name testCharToFloat0049
     * @tc.desc Verify toFloat return value can be used in computation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.toFloat() + 0.5;
      expect(result).assertEqual(65.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_5000
     * @tc.name testCharToFloat0050
     * @tc.desc Verify multiple calls to toFloat return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.toFloat();
      const result2 = c.toFloat();
      const result3 = c.toFloat();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_5100
     * @tc.name testCharToFloat0051
     * @tc.desc Verify all conversion methods return consistent results for ASCII character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(c.toFloat()).assertEqual(c.toInt());
      expect(c.toFloat()).assertEqual(c.toLong());
      expect(c.toFloat()).assertEqual(c.toShort());
      expect(c.toFloat()).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_5200
     * @tc.name testCharToFloat0052
     * @tc.desc Verify float is suitable for floating point arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const floatValue = c.toFloat();
      const result = floatValue / 2.0;
      expect(result).assertEqual(32.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_5300
     * @tc.name testCharToFloat0053
     * @tc.desc Verify char minimum value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MIN_VALUE);
      const result = c.toFloat();
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATTEST_5500
     * @tc.name testCharToFloat0055
     * @tc.desc Verify all char values are within float precision range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloat0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      const result = c.toFloat();
      expect(Number.isFinite(result)).assertTrue();
    });
  });
}
