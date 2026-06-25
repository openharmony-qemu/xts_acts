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

function buildPowBaseFromHelper(): number {
  return 1.25;
}

function buildPowExponentFromHelper(): number {
  return 3.0;
}

export default function mathPowTest(): void {
  describe('MathPowTest', (): void => {
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
     * @tc.name testMathPow001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0100
     * @tc.desc Verify pow method with a positive integer exponent returns the exact power value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(2.0, 3.0);
      expect(result).assertEqual(8.0);
    });
    /**
     * @tc.name testMathPow002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0200
     * @tc.desc Verify pow method with exponent zero returns one for a finite nonzero base
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(5.0, 0.0);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0300
     * @tc.desc Verify pow method with base one returns one regardless of a finite exponent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(1.0, 100.0);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0400
     * @tc.desc Verify pow method with a negative integer exponent returns the reciprocal power
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(2.0, -3.0);
      expect(result).assertEqual(0.125);
    });
    /**
     * @tc.name testMathPow005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0500
     * @tc.desc Verify pow method with exponent one returns the original finite base
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 7.5;
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(base);
    });
    /**
     * @tc.name testMathPow006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0600
     * @tc.desc Verify pow method with a fractional exponent computes the principal square root for a positive base
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(9.0, 0.5);
      expect(result).assertEqual(3.0);
    });
    /**
     * @tc.name testMathPow007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0700
     * @tc.desc Verify pow method with a negative base and odd integer exponent preserves the negative sign
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(-2.0, 3.0);
      expect(result).assertEqual(-8.0);
    });
    /**
     * @tc.name testMathPow008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0800
     * @tc.desc Verify pow method with a negative base and even integer exponent returns a positive result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(-2.0, 4.0);
      expect(result).assertEqual(16.0);
    });
    /**
     * @tc.name testMathPow009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0900
     * @tc.desc Verify pow method with a negative base and fractional exponent propagates NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(-2.0, 0.5);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1000
     * @tc.desc Verify pow method with a NaN base and nonzero exponent propagates NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.NaN, 2.0);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1100
     * @tc.desc Verify pow method with a NaN exponent and a finite base propagates NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(2.0, Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1200
     * @tc.desc Verify pow method with a NaN base and zero exponent returns one per ECMAScript semantics
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.NaN, 0.0);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1300
     * @tc.desc Verify pow method with positive Infinity base and positive exponent returns positive Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.POSITIVE_INFINITY, 2.0);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.name testMathPow014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1400
     * @tc.desc Verify pow method with positive Infinity base and negative exponent returns positive zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.POSITIVE_INFINITY, -1.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1500
     * @tc.desc Verify pow method with zero base and positive exponent returns positive zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(0.0, 2.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1600
     * @tc.desc Verify pow method with zero base and negative exponent returns positive Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(0.0, -1.0);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.name testMathPow017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1700
     * @tc.desc Verify pow method with zero base and zero exponent returns one per ECMAScript semantics
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(0.0, 0.0);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1800
     * @tc.desc Verify pow method with negative zero base and odd positive exponent returns negative zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(-0.0, 3.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1900
     * @tc.desc Verify pow method with negative zero base and even positive exponent returns positive zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(-0.0, 2.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2000
     * @tc.desc Verify pow method with negative zero base and odd negative exponent returns negative Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(-0.0, -3.0);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.name testMathPow021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2100
     * @tc.desc Verify pow method with negative zero base and even negative exponent returns positive Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(-0.0, -2.0);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.name testMathPow022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2200
     * @tc.desc Verify pow method is not commutative for unequal finite arguments
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftFirst: double = Math.pow(2.0, 3.0);
      let rightFirst: double = Math.pow(3.0, 2.0);
      expect(leftFirst).assertEqual(8.0);
      expect(rightFirst).assertEqual(9.0);
      expect(leftFirst != rightFirst).assertTrue();
    });
    /**
     * @tc.name testMathPow023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2300
     * @tc.desc Verify pow method matches repeated multiplication for a small positive integer exponent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 3.0;
      let exponentResult: double = Math.pow(base, 4.0);
      let repeatedProduct: double = base * base * base * base;
      expect(exponentResult).assertEqual(repeatedProduct);
    });
    /**
     * @tc.name testMathPow024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2400
     * @tc.desc Verify pow method computes reciprocal symmetry between positive and negative exponents
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveExponentResult: double = Math.pow(5.0, 2.0);
      let negativeExponentResult: double = Math.pow(5.0, -2.0);
      expect(positiveExponentResult * negativeExponentResult).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2500
     * @tc.desc Verify pow method with an overflowing exponent returns positive Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(2.0, 1024.0);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.name testMathPow026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2600
     * @tc.desc Verify pow method with a large positive exponent on one-half underflows to positive zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(0.5, 1075.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2700
     * @tc.desc Verify pow method preserves IEEE 754 rounding for decimal base 0.2 squared
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(0.2, 2.0);
      let expected: double = 0.04000000000000001;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathPow028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2800
     * @tc.desc Verify pow method preserves IEEE 754 rounding for decimal base 1.1 cubed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(1.1, 3.0);
      let expected: double = 1.3310000000000004;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathPow029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2900
     * @tc.desc Verify pow method accepts widened byte base input and returns the exact integer power
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: byte = Int.toByte(3);
      let result: double = Math.pow(base, 3.0);
      expect(result).assertEqual(27.0);
    });
    /**
     * @tc.name testMathPow030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3000
     * @tc.desc Verify pow method accepts widened short exponent input and returns the exact power
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exponent: short = Int.toShort(4);
      let result: double = Math.pow(2.0, exponent);
      expect(result).assertEqual(16.0);
    });
    /**
     * @tc.name testMathPow031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3100
     * @tc.desc Verify pow method accepts widened int base input and returns the exact integer power
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 12;
      let result: double = Math.pow(base, 2.0);
      expect(result).assertEqual(144.0);
    });
    /**
     * @tc.name testMathPow032
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3200
     * @tc.desc Verify pow method accepts widened long exponent input and returns the exact power
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exponent: long = Long.toLong(3);
      let result: double = Math.pow(10.0, exponent);
      expect(result).assertEqual(1000.0);
    });
    /**
     * @tc.name testMathPow033
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3300
     * @tc.desc Verify pow method accepts a number typed base variable input and returns the exact finite power
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: number = 2.5;
      let result: number = Math.pow(base, 2.0);
      expect(result).assertEqual(6.25);
    });
    /**
     * @tc.name testMathPow034
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3400
     * @tc.desc Verify pow method accepts helper function number inputs for both base and exponent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: number = buildPowBaseFromHelper();
      let exponent: number = buildPowExponentFromHelper();
      let result: number = Math.pow(base, exponent);
      expect(result).assertEqual(1.953125);
    });
    /**
     * @tc.name testMathPow035
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3500
     * @tc.desc Verify pow method with Math constants returns PI squared over E squared
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathPow035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let piSquared: double = Math.pow(Math.PI, 2.0);
      let eSquared: double = Math.pow(Math.E, 2.0);
      expect(piSquared > eSquared).assertTrue();
    });
    /**
     * @tc.name testMathPow036
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3600
     * @tc.desc Verify pow method with base 1.8 and exponent 4 for expected return within relative tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 1.8;
      let exponent: double = 4.0;
      let result: double = Math.pow(base, exponent);
      let expected: double = 10.497600000000002;
      let relativeDiff: double = Utils.getRelativeDiff(result, expected);
      expect(relativeDiff < 1.0e-15).assertTrue();
    });
  });
}
