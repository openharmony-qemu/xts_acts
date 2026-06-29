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


export default function mathFroundTest(): void {
  describe('MathFroundTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0100
     * @tc.name testMathFround001
     * @tc.desc Verify fround method with double input 3.7 for expected return 3.700000047683716
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.7;
      let result: double = Math.fround(input);
      expect(result).assertEqual(3.700000047683716);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0200
     * @tc.name testMathFround002
     * @tc.desc Verify fround method with double input 0.618 for expected return 0.6179999709129333
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.618;
      let result: double = Math.fround(input);
      expect(result).assertEqual(0.6179999709129333);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0300
     * @tc.name testMathFround003
     * @tc.desc Verify fround method with double input -3.7 for expected return -3.700000047683716
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -3.7;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-3.700000047683716);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0400
     * @tc.name testMathFround004
     * @tc.desc Verify fround method with double input -0.618 for expected return -0.6179999709129333
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.618;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-0.6179999709129333);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0500
     * @tc.name testMathFround005
     * @tc.desc Verify fround method with double input 5.0 for expected return 5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 5.0;
      let result: double = Math.fround(input);
      expect(result).assertEqual(5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0600
     * @tc.name testMathFround006
     * @tc.desc Verify fround method with double input -5.0 for expected return -5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -5.0;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0700
     * @tc.name testMathFround007
     * @tc.desc Verify fround method with double positive zero input preserves positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.0;
      let result: double = Math.fround(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0800
     * @tc.name testMathFround008
     * @tc.desc Verify fround method with double negative zero input preserves negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.0;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0900
     * @tc.name testMathFround009
     * @tc.desc Verify fround method with double input 2.0000000001 for expected return 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.0000000001;
      let result: double = Math.fround(input);
      expect(result).assertEqual(2.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1000
     * @tc.name testMathFround010
     * @tc.desc Verify fround method with double input 1.9999999999 for expected return 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.9999999999;
      let result: double = Math.fround(input);
      expect(result).assertEqual(2.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1100
     * @tc.name testMathFround011
     * @tc.desc Verify fround method with double input -2.0000000001 for expected return -2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.0000000001;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-2.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1200
     * @tc.name testMathFround012
     * @tc.desc Verify fround method with double input -2.9999999999 for expected return -3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.9999999999;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-3.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1300
     * @tc.name testMathFround013
     * @tc.desc Verify fround method with Double.MAX_VALUE input overflows to Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Double.MAX_VALUE;
      let result: double = Math.fround(input);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1400
     * @tc.name testMathFround014
     * @tc.desc Verify fround method with negative Double.MAX_VALUE input overflows to Double.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -Double.MAX_VALUE;
      let result: double = Math.fround(input);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1500
     * @tc.name testMathFround015
     * @tc.desc Verify fround method with Double.MIN_VALUE input underflows to positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Double.MIN_VALUE;
      let result: double = Math.fround(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1600
     * @tc.name testMathFround016
     * @tc.desc Verify fround method with negative Double.MIN_VALUE input underflows to negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -Double.MIN_VALUE;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1700
     * @tc.name testMathFround017
     * @tc.desc Verify fround method with double input 2147483647.0 for expected return 2147483648.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2147483647.0;
      let result: double = Math.fround(input);
      expect(result).assertEqual(2147483648.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1800
     * @tc.name testMathFround018
     * @tc.desc Verify fround method with double input 0.5 for expected return 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.5;
      let result: double = Math.fround(input);
      expect(result).assertEqual(0.5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1900
     * @tc.name testMathFround019
     * @tc.desc Verify fround method with double input -0.5 for expected return -0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.5;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-0.5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2000
     * @tc.name testMathFround020
     * @tc.desc Verify fround method with Double.NaN input propagates Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = Double.NaN;
      let result: double = Math.fround(nanValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2100
     * @tc.name testMathFround021
     * @tc.desc Verify fround method with Double.POSITIVE_INFINITY input preserves Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infValue: double = Double.POSITIVE_INFINITY;
      let result: double = Math.fround(infValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2200
     * @tc.name testMathFround022
     * @tc.desc Verify fround method with Double.NEGATIVE_INFINITY input preserves Double.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfValue: double = Double.NEGATIVE_INFINITY;
      let result: double = Math.fround(negInfValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2300
     * @tc.name testMathFround023
     * @tc.desc Verify fround method with double variable for correct variable passing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.718;
      let result: double = Math.fround(input);
      expect(result).assertEqual(2.7179999351501465);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2400
     * @tc.name testMathFround024
     * @tc.desc Verify fround is static method callable via Math class name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.5;
      let result: double = Math.fround(input);
      expect(result).assertEqual(1.5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2500
     * @tc.name testMathFround025
     * @tc.desc Verify fround idempotency with repeated same-input calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 3.14159;
      let firstCallResult: double = Math.fround(x);
      let secondCallResult: double = Math.fround(x);
      let thirdCallResult: double = Math.fround(x);
      expect(firstCallResult).assertEqual(3.141590118408203);
      expect(firstCallResult).assertEqual(secondCallResult);
      expect(secondCallResult).assertEqual(thirdCallResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2600
     * @tc.name testMathFround026
     * @tc.desc Verify fround method with widened byte zero input preserves positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(0);
      let result: double = Math.fround(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2700
     * @tc.name testMathFround027
     * @tc.desc Verify fround method with widened byte normal input 12 returns the same integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(12);
      let result: double = Math.fround(input);
      expect(result).assertEqual(12.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2800
     * @tc.name testMathFround028
     * @tc.desc Verify fround method with byte underflow conversion input -129 follows the wrapped byte value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(-129);
      let result: double = Math.fround(input);
      expect(input).assertEqual(Int.toByte(127));
      expect(result).assertEqual(127.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2900
     * @tc.name testMathFround029
     * @tc.desc Verify fround method with widened byte maximum boundary 127 returns the same boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(127);
      let result: double = Math.fround(input);
      expect(result).assertEqual(127.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3000
     * @tc.name testMathFround030
     * @tc.desc Verify fround method with widened byte minimum boundary -128 returns the same boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(-128);
      let result: double = Math.fround(input);
      expect(result).assertEqual(-128.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3100
     * @tc.name testMathFround031
     * @tc.desc Verify fround method with byte overflow conversion input 128 follows the wrapped byte value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(128);
      let result: double = Math.fround(input);
      expect(input).assertEqual(Int.toByte(-128));
      expect(result).assertEqual(-128.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3200
     * @tc.name testMathFround032
     * @tc.desc Verify fround method with widened short zero input preserves positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(0);
      let result: double = Math.fround(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3300
     * @tc.name testMathFround033
     * @tc.desc Verify fround method with widened short normal input 2048 returns the same integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(2048);
      let result: double = Math.fround(input);
      expect(result).assertEqual(2048.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3400
     * @tc.name testMathFround034
     * @tc.desc Verify fround method with short underflow conversion input -32769 follows the wrapped short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-32769);
      let result: double = Math.fround(input);
      expect(input).assertEqual(Int.toShort(32767));
      expect(result).assertEqual(32767.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3500
     * @tc.name testMathFround035
     * @tc.desc Verify fround method with widened short maximum boundary 32767 returns the same boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(32767);
      let result: double = Math.fround(input);
      expect(result).assertEqual(32767.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3600
     * @tc.name testMathFround036
     * @tc.desc Verify fround method with widened short minimum boundary -32768 returns the same boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-32768);
      let result: double = Math.fround(input);
      expect(result).assertEqual(-32768.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3700
     * @tc.name testMathFround037
     * @tc.desc Verify fround method with short mapped value 65535 follows the wrapped short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(65535);
      let result: double = Math.fround(input);
      expect(input).assertEqual(Int.toShort(-1));
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3800
     * @tc.name testMathFround038
     * @tc.desc Verify fround method with int minimum underflow source follows the wrapped maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: int = Int.MIN_VALUE;
      let input: int = minimumValue - 1;
      let result: double = Math.fround(input);
      expect(input).assertEqual(Int.MAX_VALUE);
      expect(result).assertEqual(2147483648.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3900
     * @tc.name testMathFround039
     * @tc.desc Verify fround method with widened int hexadecimal source 0x1234 returns the decimal integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0x1234;
      let result: double = Math.fround(input);
      expect(result).assertEqual(4660.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4000
     * @tc.name testMathFround040
     * @tc.desc Verify fround method with widened int binary source 0b1010 returns the decimal integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0b1010;
      let result: double = Math.fround(input);
      expect(result).assertEqual(10.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4100
     * @tc.name testMathFround041
     * @tc.desc Verify fround method with widened int maximum boundary rounds to nearest float32 integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MAX_VALUE;
      let result: double = Math.fround(input);
      expect(result).assertEqual(2147483648.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4200
     * @tc.name testMathFround042
     * @tc.desc Verify fround method with widened int minimum boundary returns the same float32 boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MIN_VALUE;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-2147483648.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4300
     * @tc.name testMathFround043
     * @tc.desc Verify fround method with int maximum overflow source follows the wrapped minimum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MAX_VALUE + 1;
      let result: double = Math.fround(input);
      expect(input).assertEqual(Int.MIN_VALUE);
      expect(result).assertEqual(-2147483648.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4400
     * @tc.name testMathFround044
     * @tc.desc Verify fround method with widened long zero input preserves positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Int.toLong(0);
      let result: double = Math.fround(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4500
     * @tc.name testMathFround045
     * @tc.desc Verify fround method with long hexadecimal source 0x1234 returns the decimal integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(0x1234);
      let result: double = Math.fround(input);
      expect(result).assertEqual(4660.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4600
     * @tc.name testMathFround046
     * @tc.desc Verify fround method with long minimum underflow source follows the wrapped maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: long = Long.MIN_VALUE;
      let input: long = minimumValue - Int.toLong(1);
      let result: double = Math.fround(input);
      expect(input).assertEqual(Long.MAX_VALUE);
      let expectedValue: double = Long.MAX_VALUE;
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4700
     * @tc.name testMathFround047
     * @tc.desc Verify fround method with Long.MAX_VALUE input returns its nearest float32 double representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.MAX_VALUE;
      let result: double = Math.fround(input);
      let expectedValue: double = Long.MAX_VALUE;
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4800
     * @tc.name testMathFround048
     * @tc.desc Verify fround method with Long.MIN_VALUE input returns its nearest float32 double representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.MIN_VALUE;
      let result: double = Math.fround(input);
      let expectedValue: double = Long.MIN_VALUE;
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4900
     * @tc.name testMathFround049
     * @tc.desc Verify fround method with long overflow-mapped Long.MIN_VALUE source returns its nearest float32 double representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let input: long = maximumValue + Int.toLong(1);
      let result: double = Math.fround(input);
      expect(input).assertEqual(Long.MIN_VALUE);
      let expectedValue: double = Long.MIN_VALUE;
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5000
     * @tc.name testMathFround050
     * @tc.desc Verify fround method with float normal input 3.14 returns the widened float32 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(3.14);
      let expected: double = input;
      let result: double = Math.fround(input);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5100
     * @tc.name testMathFround051
     * @tc.desc Verify fround method with negative Float.MAX_VALUE boundary returns the widened finite boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = -Float.MAX_VALUE;
      let expected: double = input;
      let result: double = Math.fround(input);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5200
     * @tc.name testMathFround052
     * @tc.desc Verify fround method with Float.NEGATIVE_INFINITY input preserves Double.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NEGATIVE_INFINITY;
      let result: double = Math.fround(input);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5300
     * @tc.name testMathFround053
     * @tc.desc Verify fround method with Float.MAX_VALUE boundary returns the widened finite boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.MAX_VALUE;
      let expected: double = input;
      let result: double = Math.fround(input);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5400
     * @tc.name testMathFround054
     * @tc.desc Verify fround method with Float.MIN_VALUE boundary returns the widened minimum float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.MIN_VALUE;
      let expected: double = input;
      let result: double = Math.fround(input);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5500
     * @tc.name testMathFround055
     * @tc.desc Verify fround method with negative Float.MIN_VALUE boundary returns the widened negative minimum float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = -Float.MIN_VALUE;
      let expected: double = input;
      let result: double = Math.fround(input);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5600
     * @tc.name testMathFround056
     * @tc.desc Verify fround method with Float.NaN input propagates Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NaN;
      let result: double = Math.fround(input);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5700
     * @tc.name testMathFround057
     * @tc.desc Verify fround method with Float.POSITIVE_INFINITY input preserves Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.POSITIVE_INFINITY;
      let result: double = Math.fround(input);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5800
     * @tc.name testMathFround058
     * @tc.desc Verify fround method with Math.PI constant input returns nearest float32 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.PI;
      let result: double = Math.fround(input);
      expect(result).assertEqual(3.1415927410125732);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5900
     * @tc.name testMathFround059
     * @tc.desc Verify fround method with Math.SQRT2 constant input returns nearest float32 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.SQRT2;
      let result: double = Math.fround(input);
      expect(result).assertEqual(1.4142135381698608);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6000
     * @tc.name testMathFround060
     * @tc.desc Verify fround method with double 2 power 24 minus one remains exactly representable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 16777215.0;
      let result: double = Math.fround(input);
      expect(result).assertEqual(16777215.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6100
     * @tc.name testMathFround061
     * @tc.desc Verify fround method with double 2 power 24 remains exactly representable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 16777216.0;
      let result: double = Math.fround(input);
      expect(result).assertEqual(16777216.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6200
     * @tc.name testMathFround062
     * @tc.desc Verify fround method with double 2 power 24 plus one rounds to the even float32 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 16777217.0;
      let result: double = Math.fround(input);
      expect(result).assertEqual(16777216.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6300
     * @tc.name testMathFround063
     * @tc.desc Verify fround method rounds a positive subnormal threshold input to Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.0509738482436128e-45;
      let expected: double = Float.MIN_VALUE;
      let result: double = Math.fround(input);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6400
     * @tc.name testMathFround064
     * @tc.desc Verify fround method with a double near Float.MAX_VALUE rounds to the finite float32 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.4028235e38;
      let expected: double = Float.MAX_VALUE;
      let result: double = Math.fround(input);
      expect(result).assertEqual(expected);
    });
  });
}
