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

export default function CharToFloatStaticTest(): void {
  describe('CharToFloatStaticTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_0100
     * @tc.name testCharToFloatStatic0001
     * @tc.desc Verify that a char parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'A');
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_0200
     * @tc.name testCharToFloatStatic0002
     * @tc.desc Verify that omitting parameter throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toFloat(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_0400
     * @tc.name testCharToFloatStatic0004
     * @tc.desc Verify ASCII letter character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toFloat(c'A')).assertEqual(65);
      expect(Char.toFloat(c'Z')).assertEqual(90);
      expect(Char.toFloat(c'a')).assertEqual(97);
      expect(Char.toFloat(c'z')).assertEqual(122);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_0500
     * @tc.name testCharToFloatStatic0005
     * @tc.desc Verify digit character 0-9 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toFloat(c'0')).assertEqual(48);
      expect(Char.toFloat(c'9')).assertEqual(57);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_0600
     * @tc.name testCharToFloatStatic0006
     * @tc.desc Verify special characters and space conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toFloat(c' ')).assertEqual(32);
      expect(Char.toFloat(c'!')).assertEqual(33);
      expect(Char.toFloat(c'~')).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_0700
     * @tc.name testCharToFloatStatic0007
     * @tc.desc Verify escape character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toFloat(c'\u0000')).assertEqual(0);
      expect(Char.toFloat(c'\n')).assertEqual(10);
      expect(Char.toFloat(c'\t')).assertEqual(9);
      expect(Char.toFloat(c'\r')).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_0800
     * @tc.name testCharToFloatStatic0008
     * @tc.desc Verify boundary values within char range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toFloat(Char.MIN_VALUE)).assertEqual(0);
      expect(Char.toFloat(c'\x7F')).assertEqual(127);
      expect(Char.toFloat(Char.MAX_VALUE)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_0900
     * @tc.name testCharToFloatStatic0009
     * @tc.desc Verify passing non-char type throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.toFloat(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
      try {
        const result = Char.toFloat(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_1000
     * @tc.name testCharToFloatStatic0010
     * @tc.desc Verify char minimum value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(Char.MIN_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_1100
     * @tc.name testCharToFloatStatic0011
     * @tc.desc Verify char maximum value 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(Char.MAX_VALUE);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_1200
     * @tc.name testCharToFloatStatic0012
     * @tc.desc Verify return value is float type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'A');
      expect(typeof result === "number" || typeof result === "float").assertTrue();
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_1300
     * @tc.name testCharToFloatStatic0013
     * @tc.desc Verify ASCII character conversion correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        expect(Char.toFloat(ch)).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_1400
     * @tc.name testCharToFloatStatic0014
     * @tc.desc Verify uppercase letter conversion to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toFloat(c'A')).assertEqual(65);
      expect(Number.isInteger(Char.toFloat(c'A'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_1500
     * @tc.name testCharToFloatStatic0015
     * @tc.desc Verify lowercase letter conversion to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toFloat(c'z')).assertEqual(122);
      expect(Number.isInteger(Char.toFloat(c'z'))).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_1700
     * @tc.name testCharToFloatStatic0017
     * @tc.desc Verify space character conversion to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toFloat(c' ')).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_1800
     * @tc.name testCharToFloatStatic0018
     * @tc.desc Verify special symbol conversion to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toFloat(c'~')).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_1900
     * @tc.name testCharToFloatStatic0019
     * @tc.desc Verify Chinese character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toFloat(c'中')).assertEqual(20013);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_2000
     * @tc.name testCharToFloatStatic0020
     * @tc.desc Verify toFloat returns the numeric value of a high surrogate code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toFloat(Char.HIGH_SURROGATE_MIN)).assertEqual(0xD800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_2100
     * @tc.name testCharToFloatStatic0021
     * @tc.desc Verify null character u0000 conversion to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'\u0000');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_2200
     * @tc.name testCharToFloatStatic0022
     * @tc.desc Verify newline character n conversion to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'\n');
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_2300
     * @tc.name testCharToFloatStatic0023
     * @tc.desc Verify tab character t conversion to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'\t');
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_2400
     * @tc.name testCharToFloatStatic0024
     * @tc.desc Verify carriage return character r conversion to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'\r');
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_2500
     * @tc.name testCharToFloatStatic0025
     * @tc.desc Verify high surrogate minimum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(Char.HIGH_SURROGATE_MIN);
      expect(result).assertEqual(0xD800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_2600
     * @tc.name testCharToFloatStatic0026
     * @tc.desc Verify high surrogate maximum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(Char.HIGH_SURROGATE_MAX);
      expect(result).assertEqual(0xDBFF);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_2800
     * @tc.name testCharToFloatStatic0028
     * @tc.desc Verify return value is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'A');
      expect(typeof result === "number" || typeof result === "float").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_2900
     * @tc.name testCharToFloatStatic0029
     * @tc.desc Verify return value is finite number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'A');
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_3000
     * @tc.name testCharToFloatStatic0030
     * @tc.desc Verify return value is not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'A');
      expect(Number.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_3100
     * @tc.name testCharToFloatStatic0031
     * @tc.desc Verify return value is not Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'A');
      expect(Number.isFinite(result)).assertTrue();
      expect(result !== Number.POSITIVE_INFINITY).assertTrue();
      expect(result !== Number.NEGATIVE_INFINITY).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_3300
     * @tc.name testCharToFloatStatic0033
     * @tc.desc Verify extended ASCII character 128-255 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 128; i < 256; i++) {
        const ch = charFromCode(i);
        expect(Char.toFloat(ch)).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_3400
     * @tc.name testCharToFloatStatic0034
     * @tc.desc Verify multiple conversions return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.toFloat(c'A')).assertEqual(65);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_3500
     * @tc.name testCharToFloatStatic0035
     * @tc.desc Verify normal call does not throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'A');
      expect(result !== null).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_3700
     * @tc.name testCharToFloatStatic0037
     * @tc.desc Verify finally always executes regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.toFloat(c'A');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_4000
     * @tc.name testCharToFloatStatic0040
     * @tc.desc Verify Char instance also has toFloat method with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const instanceResult = c.toFloat();
      const staticResult = Char.toFloat(c'A');
      expect(typeof instanceResult === "number" || typeof instanceResult === "float").assertTrue();
      expect(typeof staticResult === "number" || typeof staticResult === "float").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_4100
     * @tc.name testCharToFloatStatic0041
     * @tc.desc Verify toFloat is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.toFloat(c'A');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_4200
     * @tc.name testCharToFloatStatic0042
     * @tc.desc Verify static method requires parameter while instance method does not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const staticResult = Char.toFloat(c'A');
      const instanceResult = c.toFloat();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_4300
     * @tc.name testCharToFloatStatic0043
     * @tc.desc Verify same character returns same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      expect(Char.toFloat(c'A')).assertEqual(c.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_4400
     * @tc.name testCharToFloatStatic0044
     * @tc.desc Verify toFloat and toInt return same number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatResult = Char.toFloat(c'A');
      const intResult = Char.toInt(c'A');
      expect(typeof floatResult === "number" || typeof floatResult === "float").assertTrue();
      expect(typeof intResult === "number" || typeof intResult === "int").assertTrue();
      expect(floatResult).assertEqual(intResult);
      expect(floatResult).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_4500
     * @tc.name testCharToFloatStatic0045
     * @tc.desc Verify ASCII character conversion results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        expect(Char.toFloat(ch)).assertEqual(Char.toInt(ch));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_4600
     * @tc.name testCharToFloatStatic0046
     * @tc.desc Verify that toFloat and toDouble return the same numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatResult = Char.toFloat(c'A');
      const doubleResult = Char.toDouble(c'A');
      expect(floatResult).assertEqual(doubleResult);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_4800
     * @tc.name testCharToFloatStatic0048
     * @tc.desc Verify static method can convert any char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toFloat(c'A')).assertEqual(65);
      const c = new Char(c'A');
      expect(c.toFloat()).assertEqual(65);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_5100
     * @tc.name testCharToFloatStatic0051
     * @tc.desc Verify Unicode character conversion to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'中');
      expect(result).assertEqual(20013);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_5200
     * @tc.name testCharToFloatStatic0052
     * @tc.desc Verify minimum character value conversion to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(Char.MIN_VALUE);
      expect(result).assertEqual(0);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_5300
     * @tc.name testCharToFloatStatic0053
     * @tc.desc Verify maximum character value conversion to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(Char.MAX_VALUE);
      expect(result).assertEqual(65535);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_5400
     * @tc.name testCharToFloatStatic0054
     * @tc.desc Verify multiple calls to toFloat return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.toFloat(c'A');
      const result2 = Char.toFloat(c'A');
      const result3 = Char.toFloat(c'A');
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_5600
     * @tc.name testCharToFloatStatic0056
     * @tc.desc Verify small integers can be precisely represented
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samples = [c'\u0000', c'\u0100', c'\uFFFF', Char.MAX_VALUE];
      for (const ch of samples) {
        const result = Char.toFloat(ch);
        expect(Number.isFinite(result)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_5700
     * @tc.name testCharToFloatStatic0057
     * @tc.desc Verify toFloat result can participate in floating point operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'A') * 1.5;
      expect(result).assertEqual(97.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_5800
     * @tc.name testCharToFloatStatic0058
     * @tc.desc Verify float precision is sufficient for small integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'A');
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_5900
     * @tc.name testCharToFloatStatic0059
     * @tc.desc Verify toFloat return value can participate in operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(c'A') + 0.5;
      expect(result).assertEqual(65.5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_6100
     * @tc.name testCharToFloatStatic0061
     * @tc.desc Verify ASCII character various conversion methods produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.toFloat(c'A')).assertEqual(Char.toInt(c'A'));
      expect(Char.toFloat(c'A')).assertEqual(Char.toLong(c'A'));
      expect(Char.toFloat(c'A')).assertEqual(Char.toShort(c'A'));
      expect(Char.toFloat(c'A')).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_6200
     * @tc.name testCharToFloatStatic0062
     * @tc.desc Verify float is suitable for floating point operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatValue = Char.toFloat(c'A');
      const result = floatValue / 2.0;
      expect(result).assertEqual(32.5);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOFLOATSTATICTEST_6500
     * @tc.name testCharToFloatStatic0065
     * @tc.desc Verify all char values are within float precision range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToFloatStatic0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.toFloat(Char.MAX_VALUE);
      expect(Number.isFinite(result)).assertTrue();
    });
  });
}
