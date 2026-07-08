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

function charFromCode(code: number): char {
  return Int.toChar(Double.toInt(code));
}

export default function CharToDoubleStaticTest():void {
  describe('CharToDoubleStaticTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_0100
     * @tc.name testCharToDoubleStatic0001
     * @tc.desc Verify that one char parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(c'A');
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_0200
     * @tc.name testCharToDoubleStatic0002
     * @tc.desc Verify that calling without parameter throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toDouble(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_0400
     * @tc.name testCharToDoubleStatic0004
     * @tc.desc Verify ASCII letter characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toDouble(c'A')).assertEqual(65);
      expect(Char.toDouble(c'Z')).assertEqual(90);
      expect(Char.toDouble(c'a')).assertEqual(97);
      expect(Char.toDouble(c'z')).assertEqual(122);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_0500
     * @tc.name testCharToDoubleStatic0005
     * @tc.desc Verify digit characters 0-9 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toDouble(c'0')).assertEqual(48);
      expect(Char.toDouble(c'9')).assertEqual(57);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_0600
     * @tc.name testCharToDoubleStatic0006
     * @tc.desc Verify special characters and space conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toDouble(c' ')).assertEqual(32);
      expect(Char.toDouble(c'!')).assertEqual(33);
      expect(Char.toDouble(c'~')).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_0700
     * @tc.name testCharToDoubleStatic0007
     * @tc.desc Verify escape characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toDouble(c'\u0000')).assertEqual(0);
      expect(Char.toDouble(c'\n')).assertEqual(10);
      expect(Char.toDouble(c'\t')).assertEqual(9);
      expect(Char.toDouble(c'\r')).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_0800
     * @tc.name testCharToDoubleStatic0008
     * @tc.desc Verify boundary values within char range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toDouble(Char.MIN_VALUE)).assertEqual(0);
      expect(Char.toDouble(c'\x7F')).assertEqual(127);
      expect(Char.toDouble(Char.MAX_VALUE)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_0900
     * @tc.name testCharToDoubleStatic0009
     * @tc.desc Verify that passing non-char type throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toDouble(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }

      try {
        const result = Char.toDouble(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_1000
     * @tc.name testCharToDoubleStatic0010
     * @tc.desc Verify char minimum value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(Char.MIN_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_1100
     * @tc.name testCharToDoubleStatic0011
     * @tc.desc Verify char maximum value 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(Char.MAX_VALUE);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_1200
     * @tc.name testCharToDoubleStatic0012
     * @tc.desc Verify return value is double type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(c'A');
      expect(typeof result).assertEqual("number");
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_1300
     * @tc.name testCharToDoubleStatic0013
     * @tc.desc Verify ASCII characters convert correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        expect(Char.toDouble(ch)).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_1400
     * @tc.name testCharToDoubleStatic0014
     * @tc.desc Verify uppercase letter converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toDouble(c'A')).assertEqual(65);
      expect(Number.isInteger(Char.toDouble(c'A'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_1500
     * @tc.name testCharToDoubleStatic0015
     * @tc.desc Verify lowercase letter converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toDouble(c'z')).assertEqual(122);
      expect(Number.isInteger(Char.toDouble(c'z'))).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_1700
     * @tc.name testCharToDoubleStatic0017
     * @tc.desc Verify space character converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toDouble(c' ')).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_1800
     * @tc.name testCharToDoubleStatic0018
     * @tc.desc Verify special symbol converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toDouble(c'~')).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_1900
     * @tc.name testCharToDoubleStatic0019
     * @tc.desc Verify Chinese character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toDouble(c'中')).assertEqual(20013);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_2000
     * @tc.name testCharToDoubleStatic0020
     * @tc.desc Verify emoji character via surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toDouble(Char.HIGH_SURROGATE_MIN)).assertEqual(0xD800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_2100
     * @tc.name testCharToDoubleStatic0021
     * @tc.desc Verify null character u0000 converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(c'\u0000');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_2200
     * @tc.name testCharToDoubleStatic0022
     * @tc.desc Verify newline character n converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(c'\n');
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_2300
     * @tc.name testCharToDoubleStatic0023
     * @tc.desc Verify tab character t converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(c'\t');
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_2400
     * @tc.name testCharToDoubleStatic0024
     * @tc.desc Verify carriage return r converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(c'\r');
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_2500
     * @tc.name testCharToDoubleStatic0025
     * @tc.desc Verify high surrogate minimum conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(Char.HIGH_SURROGATE_MIN);
      expect(result).assertEqual(0xD800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_2600
     * @tc.name testCharToDoubleStatic0026
     * @tc.desc Verify high surrogate maximum conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(Char.HIGH_SURROGATE_MAX);
      expect(result).assertEqual(0xDBFF);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_2800
     * @tc.name testCharToDoubleStatic0028
     * @tc.desc Verify return value is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(c'A');
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_2900
     * @tc.name testCharToDoubleStatic0029
     * @tc.desc Verify return value is finite number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(c'A');
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_3000
     * @tc.name testCharToDoubleStatic0030
     * @tc.desc Verify return value is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(c'A');
      expect(Number.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_3100
     * @tc.name testCharToDoubleStatic0031
     * @tc.desc Verify return value is not Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(c'A');
      expect(Number.isFinite(result)).assertTrue();
      expect(result !== Number.POSITIVE_INFINITY).assertTrue();
      expect(result !== Number.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_3200
     * @tc.name testCharToDoubleStatic0032
     * @tc.desc Verify ASCII range characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x00', c'A', c'z', c'\x7F'];
      const expected = [0, 65, 122, 127];
      for (let idx = 0; idx < samples.length; idx++) {
        const result = Char.toDouble(samples[idx]);
        expect(result).assertEqual(expected[idx]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_3300
     * @tc.name testCharToDoubleStatic0033
     * @tc.desc Verify extended ASCII characters 128-255 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 128; i < 256; i++) {
        const ch = charFromCode(i);
        expect(Char.toDouble(ch)).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_3400
     * @tc.name testCharToDoubleStatic0034
     * @tc.desc Verify multiple conversions return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.toDouble(c'A')).assertEqual(65);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_3500
     * @tc.name testCharToDoubleStatic0035
     * @tc.desc Verify normal call does not throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(c'A');
      expect(result !== null).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_3700
     * @tc.name testCharToDoubleStatic0037
     * @tc.desc Verify finally block always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.toDouble(c'A');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_4000
     * @tc.name testCharToDoubleStatic0040
     * @tc.desc Verify Char instance has toDouble method without parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      let instanceResult: number;
      instanceResult = c.toDouble();
      const staticResult = Char.toDouble(c'A');
      expect(typeof instanceResult).assertEqual("number");
      expect(typeof staticResult).assertEqual("number");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_4100
     * @tc.name testCharToDoubleStatic0041
     * @tc.desc Verify toDouble is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.toDouble(c'A');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_4200
     * @tc.name testCharToDoubleStatic0042
     * @tc.desc Verify static method requires parameter while instance method does not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const staticResult = Char.toDouble(c'A');
      const instanceResult = c.toDouble();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_4300
     * @tc.name testCharToDoubleStatic0043
     * @tc.desc Verify same character returns same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(Char.toDouble(c'A')).assertEqual(c.toDouble());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_4400
     * @tc.name testCharToDoubleStatic0044
     * @tc.desc Verify toDouble and toInt return same number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleResult = Char.toDouble(c'A');
      const intResult = Char.toInt(c'A');
      expect(typeof doubleResult === "number" || typeof doubleResult === "double").assertTrue();
      expect(typeof intResult === "number" || typeof intResult === "int").assertTrue();
      expect(doubleResult).assertEqual(intResult);
      expect(doubleResult).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_4500
     * @tc.name testCharToDoubleStatic0045
     * @tc.desc Verify ASCII characters conversion results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        expect(Char.toDouble(ch)).assertEqual(Char.toInt(ch));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_4600
     * @tc.name testCharToDoubleStatic0046
     * @tc.desc Verify double is 64-bit and float is 32-bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleResult = Char.toDouble(c'A');
      const floatResult = Char.toFloat(c'A');
      expect(doubleResult).assertEqual(floatResult);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_4800
     * @tc.name testCharToDoubleStatic0048
     * @tc.desc Verify static method can convert any char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toDouble(c'A')).assertEqual(65);
      const c = new Char(c'A');
      expect(c.toDouble()).assertEqual(65);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_5000
     * @tc.name testCharToDoubleStatic0050
     * @tc.desc Verify extended ASCII characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\x80', c'\xC0', c'\xFF'];
      for (const ch of samples) {
        const result = Char.toDouble(ch);
        expect(result).assertEqual(Char.toInt(ch));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_5100
     * @tc.name testCharToDoubleStatic0051
     * @tc.desc Verify Unicode character converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(c'中');
      expect(result).assertEqual(20013);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_5200
     * @tc.name testCharToDoubleStatic0052
     * @tc.desc Verify minimum character value to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(Char.MIN_VALUE);
      expect(result).assertEqual(0);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_5300
     * @tc.name testCharToDoubleStatic0053
     * @tc.desc Verify maximum character value to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(Char.MAX_VALUE);
      expect(result).assertEqual(65535);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_5400
     * @tc.name testCharToDoubleStatic0054
     * @tc.desc Verify repeated calls to toDouble return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toDouble(c'A');
      const result2 = Char.toDouble(c'A');
      const result3 = Char.toDouble(c'A');
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_5600
     * @tc.name testCharToDoubleStatic0056
     * @tc.desc Verify small integers can be represented exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\u0000', c'A', c'\uFFFF', Char.MAX_VALUE];
      for (const ch of samples) {
        const result = Char.toDouble(ch);
        expect(Number.isFinite(result)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_5700
     * @tc.name testCharToDoubleStatic0057
     * @tc.desc Verify toDouble result can participate in floating point operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(c'A') * 1.5;
      expect(result).assertEqual(97.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_5800
     * @tc.name testCharToDoubleStatic0058
     * @tc.desc Verify double precision is sufficient for small integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(c'A');
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_5900
     * @tc.name testCharToDoubleStatic0059
     * @tc.desc Verify toDouble return value can be used in operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(c'A') + 0.5;
      expect(result).assertEqual(65.5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_6100
     * @tc.name testCharToDoubleStatic0061
     * @tc.desc Verify various conversion methods return consistent results for ASCII characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toDouble(c'A')).assertEqual(Char.toInt(c'A'));
      expect(Char.toDouble(c'A')).assertEqual(Char.toLong(c'A'));
      expect(Char.toDouble(c'A')).assertEqual(Char.toShort(c'A'));
      expect(Char.toDouble(c'A')).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_6200
     * @tc.name testCharToDoubleStatic0062
     * @tc.desc Verify double is suitable for high precision floating point operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleValue = Char.toDouble(c'A');
      const result = doubleValue / 2.0;
      expect(result).assertEqual(32.5);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TODOUBLESTATICTEST_6500
     * @tc.name testCharToDoubleStatic0065
     * @tc.desc Verify all char values are within double precision range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToDoubleStatic0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toDouble(Char.MAX_VALUE);
      expect(Number.isFinite(result)).assertTrue();
    });
  });
}
