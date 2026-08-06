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
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium';
import {
  observeMathPowHexStringConversion,
  observeMathPowNullBaseConversion,
  observeMathPowNullExponentConversion,
  observeMathPowStringConversion
} from './MathPow';
import {
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathPowWithUnion(first: number | string, second: number | string): number {
  const firstValue: number = typeof first === 'number' ? first : Number(first);
  const secondValue: number = typeof second === 'number' ? second : Number(second);
  return Math.pow(firstValue, secondValue);
}

export default function mathPowTest(): void {
  describe('MathPowTest', (): void => {
    /**
     * @tc.name testMathPow001
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_0100
     * @tc.desc Verify positive integer exponent returns exact power
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(2, 3);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testMathPow002
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_0200
     * @tc.desc Verify negative integer exponent returns reciprocal power
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(2, -3);
      expect(result).assertEqual(0.125);
    });

    /**
     * @tc.name testMathPow003
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_0300
     * @tc.desc Verify negative base with odd exponent preserves sign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(-2, 3);
      expect(result).assertEqual(-8);
    });

    /**
     * @tc.name testMathPow004
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_0400
     * @tc.desc Verify negative base with fractional exponent produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(-2, 0.5);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathPow005
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_0500
     * @tc.desc Verify zero exponent returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(0, 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathPow006
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_0600
     * @tc.desc Verify negative zero with odd positive exponent remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(-0, 3);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathPow007
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_0700
     * @tc.desc Verify positive Infinity with negative exponent returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(Infinity, -1);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathPow008
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_0800
     * @tc.desc Verify number union members reach the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathPowWithUnion(2, 3);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testMathPow009
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_0900
     * @tc.desc Verify string union members are normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathPowWithUnion('2', '3');
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testMathPow010
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_1000
     * @tc.desc Verify member-local JavaScript string operands undergo numeric coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathPowStringConversion();
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testMathPow011
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_1100
     * @tc.desc Verify NaN base with nonzero exponent produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(NaN, 2);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathPow012
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_1200
     * @tc.desc Verify NaN exponent with finite base produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(2, NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathPow013
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_1300
     * @tc.desc Verify NaN base with zero exponent returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(NaN, 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathPow014
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_1400
     * @tc.desc Verify negative zero with odd negative exponent returns negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(-0, -3);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathPow015
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_1500
     * @tc.desc Verify negative zero with even negative exponent returns positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(-0, -2);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathPow016
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_1600
     * @tc.desc Verify finite exponentiation overflow returns positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(2, 1024);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathPow017
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_1700
     * @tc.desc Verify finite exponentiation underflow returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(0.5, 1075);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathPow018
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_1800
     * @tc.desc Verify negative Infinity with odd positive exponent remains negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(-Infinity, 3);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathPow019
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_1900
     * @tc.desc Verify negative Infinity with even positive exponent returns positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(-Infinity, 2);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathPow020
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_2000
     * @tc.desc Verify negative Infinity with odd negative exponent returns negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(-Infinity, -3);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathPow021
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_2100
     * @tc.desc Verify positive and negative exponents produce reciprocal results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveExponent: number = Math.pow(5, 2);
      const negativeExponent: number = Math.pow(5, -2);
      const product: number = positiveExponent * negativeExponent;
      expect(product).assertEqual(1);
    });

    /**
     * @tc.name testMathPow022
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_2200
     * @tc.desc Verify decimal exponentiation preserves IEEE 754 rounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(0.2, 2);
      expect(result).assertEqual(0.04000000000000001);
    });

    /**
     * @tc.name testMathPow023
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_2300
     * @tc.desc Verify exponentiation is not commutative for unequal operands
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: number = Math.pow(2, 3);
      const second: number = Math.pow(3, 2);
      expect(first).not().assertEqual(second);
    });

    /**
     * @tc.name testMathPow024
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_2400
     * @tc.desc Verify negative zero with an even positive exponent returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(-0, 2);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathPow025
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_2500
     * @tc.desc Verify positive zero with a negative exponent returns positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(+0, -1);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathPow026
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_2600
     * @tc.desc Verify negative Infinity with an even negative exponent returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(-Infinity, -2);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathPow027
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_2700
     * @tc.desc Verify negative Infinity with a zero exponent returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.pow(-Infinity, 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathPow028
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_2800
     * @tc.desc Verify null in the base position converts to zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathPowNullBaseConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathPow029
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_2900
     * @tc.desc Verify null in the exponent position converts to zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathPowNullExponentConversion();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathPow030
     * @tc.number SUB_BUILTINS_UTIL_MATH_POW_3000
     * @tc.desc Verify a hexadecimal string base converts before exponentiation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathPowHexStringConversion();
      expect(result).assertEqual(8);
    });

  });
}
