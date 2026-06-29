'use static'

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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';


export default function mathFloorTest(): void {
  describe('MathFloorTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    })
    afterAll((): void => {
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0100
     * @tc.name testMathFloor001
     * @tc.desc Verify floor method with double input 3.7 for expected return 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.7;
      let result: double = Math.floor(input);
      expect(result).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0200
     * @tc.name testMathFloor002
     * @tc.desc Verify floor method with double input 0.618 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.618;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0300
     * @tc.name testMathFloor003
     * @tc.desc Verify floor method with double input -3.7 for expected return -4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -3.7;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0400
     * @tc.name testMathFloor004
     * @tc.desc Verify floor method with double input -0.618 for expected return -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.618;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0500
     * @tc.name testMathFloor005
     * @tc.desc Verify floor method with double input 5.0 for expected return 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 5.0;
      let result: double = Math.floor(input);
      expect(result).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0600
     * @tc.name testMathFloor006
     * @tc.desc Verify floor method with double input -5.0 for expected return -5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -5.0;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0700
     * @tc.name testMathFloor007
     * @tc.desc Verify floor method with double input 0.0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.0;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0800
     * @tc.name testMathFloor008
     * @tc.desc Verify floor method with double negative zero input preserves negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.0;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0900
     * @tc.name testMathFloor009
     * @tc.desc Verify floor method with double input 2.0000000001 for expected return 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.0000000001;
      let result: double = Math.floor(input);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1000
     * @tc.name testMathFloor010
     * @tc.desc Verify floor method with double input 1.9999999999 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.9999999999;
      let result: double = Math.floor(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1100
     * @tc.name testMathFloor011
     * @tc.desc Verify floor method with double input -2.0000000001 for expected return -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.0000000001;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1200
     * @tc.name testMathFloor012
     * @tc.desc Verify floor method with double input -2.9999999999 for expected return -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.9999999999;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1300
     * @tc.name testMathFloor013
     * @tc.desc Verify floor method with Double.MIN_VALUE input returns positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Double.MIN_VALUE;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1400
     * @tc.name testMathFloor014
     * @tc.desc Verify floor method with negative Double.MIN_VALUE input returns negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -Double.MIN_VALUE;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1500
     * @tc.name testMathFloor015
     * @tc.desc Verify floor method with double input 2147483647.0 for expected return 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2147483647.0;
      let result: double = Math.floor(input);
      expect(result).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1600
     * @tc.name testMathFloor016
     * @tc.desc Verify floor method with Double.NaN input returns Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = Double.NaN;
      let result: double = Math.floor(nanValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1700
     * @tc.name testMathFloor017
     * @tc.desc Verify floor method with Double.POSITIVE_INFINITY input returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infValue: double = Double.POSITIVE_INFINITY;
      let result: double = Math.floor(infValue);
      expect(result).assertEqual(infValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1800
     * @tc.name testMathFloor018
     * @tc.desc Verify floor method with Double.NEGATIVE_INFINITY input returns Double.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfValue: double = Double.NEGATIVE_INFINITY;
      let result: double = Math.floor(negInfValue);
      expect(result).assertEqual(negInfValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1900
     * @tc.name testMathFloor019
     * @tc.desc Verify floor method with double variable for correct variable passing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.718;
      let result: double = Math.floor(input);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2000
     * @tc.name testMathFloor020
     * @tc.desc Verify floor idempotency with repeated same-input calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 3.14159;
      let firstCallResult: double = Math.floor(x);
      let secondCallResult: double = Math.floor(x);
      let thirdCallResult: double = Math.floor(x);
      expect(firstCallResult).assertEqual(3);
      expect(firstCallResult).assertEqual(secondCallResult);
      expect(secondCallResult).assertEqual(thirdCallResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2100
     * @tc.name testMathFloor021
     * @tc.desc Verify floor return value is not greater than representative inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveFractionInput: double = 3.14;
      let negativeFractionInput: double = -3.14;
      let largeFractionInput: double = 100.001;
      expect(Math.floor(positiveFractionInput) <= positiveFractionInput).assertTrue();
      expect(Math.floor(negativeFractionInput) <= negativeFractionInput).assertTrue();
      expect(Math.floor(largeFractionInput) <= largeFractionInput).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2200
     * @tc.name testMathFloor022
     * @tc.desc Verify floor returns integer unchanged for integer inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveIntegerInput: double = 5.0;
      let negativeIntegerInput: double = -5.0;
      let largeIntegerInput: double = 100.0;
      expect(Math.floor(positiveIntegerInput)).assertEqual(positiveIntegerInput);
      expect(Math.floor(negativeIntegerInput)).assertEqual(negativeIntegerInput);
      expect(Math.floor(largeIntegerInput)).assertEqual(largeIntegerInput);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2300
     * @tc.name testMathFloor023
     * @tc.desc Verify floor method with Math.E constant input for expected return 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.E;
      let result: double = Math.floor(input);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2400
     * @tc.name testMathFloor024
     * @tc.desc Verify floor method with Math.PI constant input for expected return 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.PI;
      let result: double = Math.floor(input);
      expect(result).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2500
     * @tc.name testMathFloor025
     * @tc.desc Verify floor method with Math.SQRT2 constant input for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.SQRT2;
      let result: double = Math.floor(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2600
     * @tc.name testMathFloor026
     * @tc.desc Verify floor method with widened byte zero input preserves positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(0);
      let result: double = Math.floor(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2700
     * @tc.name testMathFloor027
     * @tc.desc Verify floor method with widened byte normal input 12 returns the same integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(12);
      let result: double = Math.floor(input);
      expect(result).assertEqual(12.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2800
     * @tc.name testMathFloor028
     * @tc.desc Verify floor method with widened byte negative marker input returns the same marker value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(-1);
      let result: double = Math.floor(input);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2900
     * @tc.name testMathFloor029
     * @tc.desc Verify floor method with widened byte maximum boundary 127 returns the same boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(127);
      let result: double = Math.floor(input);
      expect(result).assertEqual(127.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3000
     * @tc.name testMathFloor030
     * @tc.desc Verify floor method with widened byte minimum boundary -128 returns the same boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(-128);
      let result: double = Math.floor(input);
      expect(result).assertEqual(-128.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3100
     * @tc.name testMathFloor031
     * @tc.desc Verify floor method with byte overflow conversion input 128 follows the wrapped byte value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(128);
      let result: double = Math.floor(input);
      expect(input).assertEqual(Int.toByte(-128));
      expect(result).assertEqual(-128.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3200
     * @tc.name testMathFloor032
     * @tc.desc Verify floor method with widened short zero input preserves positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(0);
      let result: double = Math.floor(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3300
     * @tc.name testMathFloor033
     * @tc.desc Verify floor method with widened short normal input 2048 returns the same integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(2048);
      let result: double = Math.floor(input);
      expect(result).assertEqual(2048.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3400
     * @tc.name testMathFloor034
     * @tc.desc Verify floor method with widened short negative marker input returns the same marker value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-1);
      let result: double = Math.floor(input);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3500
     * @tc.name testMathFloor035
     * @tc.desc Verify floor method with widened short maximum boundary 32767 returns the same boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(32767);
      let result: double = Math.floor(input);
      expect(result).assertEqual(32767.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3600
     * @tc.name testMathFloor036
     * @tc.desc Verify floor method with widened short minimum boundary -32768 returns the same boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-32768);
      let result: double = Math.floor(input);
      expect(result).assertEqual(-32768.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3700
     * @tc.name testMathFloor037
     * @tc.desc Verify floor method with short mapped value 65535 follows the wrapped short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(65535);
      let result: double = Math.floor(input);
      expect(input).assertEqual(Int.toShort(-1));
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3800
     * @tc.name testMathFloor038
     * @tc.desc Verify floor method with widened int zero input preserves positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3900
     * @tc.name testMathFloor039
     * @tc.desc Verify floor method with widened int hexadecimal source 0x1234 returns the decimal integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0x1234;
      let result: double = Math.floor(input);
      expect(result).assertEqual(4660.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4000
     * @tc.name testMathFloor040
     * @tc.desc Verify floor method with widened int binary source 0b1010 returns the decimal integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0b1010;
      let result: double = Math.floor(input);
      expect(result).assertEqual(10.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4100
     * @tc.name testMathFloor041
     * @tc.desc Verify floor method with widened int maximum boundary returns the same boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MAX_VALUE;
      let result: double = Math.floor(input);
      expect(result).assertEqual(2147483647.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4200
     * @tc.name testMathFloor042
     * @tc.desc Verify floor method with widened int minimum boundary returns the same boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MIN_VALUE;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-2147483648.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4300
     * @tc.name testMathFloor043
     * @tc.desc Verify floor method with int maximum overflow source follows the wrapped minimum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MAX_VALUE + 1;
      let result: double = Math.floor(input);
      expect(input).assertEqual(Int.MIN_VALUE);
      expect(result).assertEqual(-2147483648.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4400
     * @tc.name testMathFloor044
     * @tc.desc Verify floor method with widened long zero input preserves positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Int.toLong(0);
      let result: double = Math.floor(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4500
     * @tc.name testMathFloor045
     * @tc.desc Verify floor method with widened long negative marker input returns the same marker value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(-1);
      let result: double = Math.floor(input);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4600
     * @tc.name testMathFloor046
     * @tc.desc Verify floor method with long hexadecimal source 0x1234 returns the decimal integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(0x1234);
      let result: double = Math.floor(input);
      expect(result).assertEqual(4660.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4700
     * @tc.name testMathFloor047
     * @tc.desc Verify floor method with Long.MAX_VALUE input returns its double representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.MAX_VALUE;
      let result: double = Math.floor(input);
      let expectedValue: double = Long.MAX_VALUE;
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4800
     * @tc.name testMathFloor048
     * @tc.desc Verify floor method with Long.MIN_VALUE input returns its double representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.MIN_VALUE;
      let result: double = Math.floor(input);
      let expectedValue: double = Long.MIN_VALUE;
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4900
     * @tc.name testMathFloor049
     * @tc.desc Verify floor method with long overflow-mapped Long.MIN_VALUE source returns its double representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let input: long = maximumValue + Int.toLong(1);
      let result: double = Math.floor(input);
      expect(input).assertEqual(Long.MIN_VALUE);
      let expectedValue: double = Long.MIN_VALUE;
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5000
     * @tc.name testMathFloor050
     * @tc.desc Verify floor method with long underflow-mapped Long.MAX_VALUE source returns its double representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: long = Long.MIN_VALUE;
      let input: long = minimumValue - Int.toLong(1);
      let result: double = Math.floor(input);
      expect(input).assertEqual(Long.MAX_VALUE);
      let expectedValue: double = Long.MAX_VALUE;
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5100
     * @tc.name testMathFloor051
     * @tc.desc Verify floor method with widened float normal input 3.14 returns the lower integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(3.14);
      let result: double = Math.floor(input);
      expect(result).assertEqual(3.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5200
     * @tc.name testMathFloor052
     * @tc.desc Verify floor method with widened negative float normal input returns the lower integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-3.14);
      let result: double = Math.floor(input);
      expect(result).assertEqual(-4.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5300
     * @tc.name testMathFloor053
     * @tc.desc Verify floor method with widened negative Float.MAX_VALUE boundary remains unchanged after promotion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = -Float.MAX_VALUE;
      let expected: double = input;
      let result: double = Math.floor(input);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5400
     * @tc.name testMathFloor054
     * @tc.desc Verify floor method with widened Float.MAX_VALUE boundary remains unchanged after promotion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.MAX_VALUE;
      let expected: double = input;
      let result: double = Math.floor(input);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5500
     * @tc.name testMathFloor055
     * @tc.desc Verify floor method with widened Float.MIN_VALUE boundary returns positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.MIN_VALUE;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5600
     * @tc.name testMathFloor056
     * @tc.desc Verify floor method with widened negative Float.MIN_VALUE boundary returns negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = -Float.MIN_VALUE;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5700
     * @tc.name testMathFloor057
     * @tc.desc Verify floor method with widened Float.NaN input propagates Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NaN;
      let result: double = Math.floor(input);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5800
     * @tc.name testMathFloor058
     * @tc.desc Verify floor method with widened Float.POSITIVE_INFINITY input preserves Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.POSITIVE_INFINITY;
      let result: double = Math.floor(input);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5900
     * @tc.name testMathFloor059
     * @tc.desc Verify floor method with widened Float.NEGATIVE_INFINITY input preserves Double.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NEGATIVE_INFINITY;
      let result: double = Math.floor(input);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_6000
     * @tc.name testMathFloor060
     * @tc.desc Verify floor method with Double.MAX_VALUE boundary remains unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Double.MAX_VALUE;
      let result: double = Math.floor(input);
      expect(result).assertEqual(Double.MAX_VALUE);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_6100
     * @tc.name testMathFloor061
     * @tc.desc Verify floor method with negative Double.MAX_VALUE boundary remains unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -Double.MAX_VALUE;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-Double.MAX_VALUE);
    });
  });
}
