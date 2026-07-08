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
} from '@ohos/hypium-binary/src/main/indexStatic';
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(-2.0, 4.0);
      expect(result).assertEqual(16.0);
    });
    /**
     * @tc.name testMathPow009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0900
     * @tc.desc Verify pow method with a negative base and fractional exponent propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(-2.0, 0.5);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1000
     * @tc.desc Verify pow method with a Double.NaN base and nonzero exponent propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.NaN, 2.0);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1100
     * @tc.desc Verify pow method with a Double.NaN exponent and a finite base propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(2.0, Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1200
     * @tc.desc Verify pow method with a Double.NaN base and zero exponent returns one per ECMAScript semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.NaN, 0.0);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1300
     * @tc.desc Verify pow method with Double.POSITIVE_INFINITY base and positive exponent returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.POSITIVE_INFINITY, 2.0);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.name testMathPow014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1400
     * @tc.desc Verify pow method with Double.POSITIVE_INFINITY base and negative exponent returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify pow method with zero base and negative exponent returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify pow method with negative zero base and odd negative exponent returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(-0.0, -3.0);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.name testMathPow021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2100
     * @tc.desc Verify pow method with negative zero base and even negative exponent returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftFirst: double = Math.pow(2.0, 3.0);
      let rightFirst: double = Math.pow(3.0, 2.0);
      expect(leftFirst).assertEqual(8.0);
      expect(rightFirst).assertEqual(9.0);
      expect(leftFirst !== rightFirst).assertTrue();
    });
    /**
     * @tc.name testMathPow023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2300
     * @tc.desc Verify pow method matches repeated multiplication for a small positive integer exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify pow method with an overflowing exponent returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
    /**
     * @tc.name testMathPow037
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3700
     * @tc.desc Verify pow method accepts a byte zero base and returns positive zero for a positive exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: byte = Int.toByte(0);
      let result: double = Math.pow(base, 3.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow038
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3800
     * @tc.desc Verify pow method accepts a normal byte base and returns the exact square
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: byte = Int.toByte(12);
      let result: double = Math.pow(base, 2.0);
      expect(result).assertEqual(144.0);
    });
    /**
     * @tc.name testMathPow039
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3900
     * @tc.desc Verify pow method accepts the byte maximum boundary as a base
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: byte = Int.toByte(127);
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(127.0);
    });
    /**
     * @tc.name testMathPow040
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4000
     * @tc.desc Verify pow method accepts the byte minimum boundary as a base
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: byte = Int.toByte(-128);
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(-128.0);
    });
    /**
     * @tc.name testMathPow041
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4100
     * @tc.desc Verify pow method accepts a byte overflow-mapped base after conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: byte = Int.toByte(128);
      let result: double = Math.pow(base, 2.0);
      expect(base).assertEqual(Int.toByte(-128));
      expect(result).assertEqual(16384.0);
    });
    /**
     * @tc.name testMathPow042
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4200
     * @tc.desc Verify pow method accepts a byte underflow-mapped base after conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: byte = Int.toByte(-129);
      let result: double = Math.pow(base, 2.0);
      expect(base).assertEqual(Int.toByte(127));
      expect(result).assertEqual(16129.0);
    });
    /**
     * @tc.name testMathPow043
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4300
     * @tc.desc Verify pow method accepts a byte negative one marker base with an odd exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: byte = Int.toByte(-1);
      let result: double = Math.pow(base, 3.0);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathPow044
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4400
     * @tc.desc Verify pow method accepts a byte zero exponent and returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exponent: byte = Int.toByte(0);
      let result: double = Math.pow(2.0, exponent);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow045
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4500
     * @tc.desc Verify pow method accepts a short zero exponent and returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exponent: short = Int.toShort(0);
      let result: double = Math.pow(9.0, exponent);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow046
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4600
     * @tc.desc Verify pow method accepts a normal short exponent and returns the exact power
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exponent: short = Int.toShort(5);
      let result: double = Math.pow(2.0, exponent);
      expect(result).assertEqual(32.0);
    });
    /**
     * @tc.name testMathPow047
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4700
     * @tc.desc Verify pow method accepts the short maximum boundary exponent with base one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exponent: short = Int.toShort(32767);
      let result: double = Math.pow(1.0, exponent);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow048
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4800
     * @tc.desc Verify pow method accepts the short minimum boundary exponent with base one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exponent: short = Int.toShort(-32768);
      let result: double = Math.pow(1.0, exponent);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow049
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4900
     * @tc.desc Verify pow method accepts a short overflow-mapped exponent after conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exponent: short = Int.toShort(32768);
      let result: double = Math.pow(1.0, exponent);
      expect(exponent).assertEqual(Int.toShort(-32768));
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow050
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5000
     * @tc.desc Verify pow method accepts a short underflow-mapped exponent after conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exponent: short = Int.toShort(-32769);
      let result: double = Math.pow(1.0, exponent);
      expect(exponent).assertEqual(Int.toShort(32767));
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow051
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5100
     * @tc.desc Verify pow method accepts a short positive base value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: short = Int.toShort(2048);
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(2048.0);
    });
    /**
     * @tc.name testMathPow052
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5200
     * @tc.desc Verify pow method accepts a short mapped unsigned maximum as negative one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: short = Int.toShort(65535);
      let result: double = Math.pow(base, 3.0);
      expect(base).assertEqual(Int.toShort(-1));
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathPow053
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5300
     * @tc.desc Verify pow method accepts an int zero base and returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 0;
      let result: double = Math.pow(base, 3.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow054
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5400
     * @tc.desc Verify pow method accepts the int maximum boundary as a base
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = Int.MAX_VALUE;
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(2147483647.0);
    });
    /**
     * @tc.name testMathPow055
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5500
     * @tc.desc Verify pow method accepts the int minimum boundary as a base
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = Int.MIN_VALUE;
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(-2147483648.0);
    });
    /**
     * @tc.name testMathPow056
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5600
     * @tc.desc Verify pow method accepts an int overflow-mapped base after arithmetic conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: int = Int.MAX_VALUE;
      let base: int = maximumValue + 1;
      let result: double = Math.pow(base, 1.0);
      expect(base).assertEqual(Int.MIN_VALUE);
      expect(result).assertEqual(-2147483648.0);
    });
    /**
     * @tc.name testMathPow057
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5700
     * @tc.desc Verify pow method accepts an int underflow-mapped base after arithmetic conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: int = Int.MIN_VALUE;
      let base: int = minimumValue - 1;
      let result: double = Math.pow(base, 1.0);
      expect(base).assertEqual(Int.MAX_VALUE);
      expect(result).assertEqual(2147483647.0);
    });
    /**
     * @tc.name testMathPow058
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5800
     * @tc.desc Verify pow method accepts a hexadecimal int source as a base
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 0x1234;
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(4660.0);
    });
    /**
     * @tc.name testMathPow059
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5900
     * @tc.desc Verify pow method accepts a binary int source as an exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exponent: int = 0b1010;
      let result: double = Math.pow(2.0, exponent);
      expect(result).assertEqual(1024.0);
    });
    /**
     * @tc.name testMathPow060
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6000
     * @tc.desc Verify pow method accepts an octal int source as a base
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 0o123;
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(83.0);
    });
    /**
     * @tc.name testMathPow061
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6100
     * @tc.desc Verify pow method accepts an int large positive base value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 1000000;
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(1000000.0);
    });
    /**
     * @tc.name testMathPow062
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6200
     * @tc.desc Verify pow method accepts an int negative one marker with an odd exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = -1;
      let result: double = Math.pow(base, 5.0);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathPow063
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6300
     * @tc.desc Verify pow method accepts an int exact square above signed int range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 65536;
      let result: double = Math.pow(base, 2.0);
      expect(result).assertEqual(4294967296.0);
    });
    /**
     * @tc.name testMathPow064
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6400
     * @tc.desc Verify pow method accepts a long zero base and returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: long = Int.toLong(0);
      let result: double = Math.pow(base, 3.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow065
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6500
     * @tc.desc Verify pow method accepts a long large positive base value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: long = Long.toLong(10000000000);
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(10000000000.0);
    });
    /**
     * @tc.name testMathPow066
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6600
     * @tc.desc Verify pow method accepts the long maximum boundary with a zero exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: long = Long.MAX_VALUE;
      let result: double = Math.pow(base, 0.0);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow067
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6700
     * @tc.desc Verify pow method accepts the Long.MIN_VALUE boundary with a zero exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: long = Long.MIN_VALUE;
      let result: double = Math.pow(base, 0.0);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow068
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6800
     * @tc.desc Verify pow method accepts a long overflow-mapped base after arithmetic conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let base: long = maximumValue + Int.toLong(1);
      let result: double = Math.pow(base, 0.0);
      expect(base).assertEqual(Long.MIN_VALUE);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow069
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6900
     * @tc.desc Verify pow method accepts a long underflow-mapped base after arithmetic conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: long = Long.MIN_VALUE;
      let base: long = minimumValue - Int.toLong(1);
      let result: double = Math.pow(base, 0.0);
      expect(base).assertEqual(Long.MAX_VALUE);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow070
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7000
     * @tc.desc Verify pow method accepts a long negative one marker with an odd exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: long = Int.toLong(-1);
      let result: double = Math.pow(base, 3.0);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathPow071
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7100
     * @tc.desc Verify pow method accepts a negative long large base value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: long = Long.toLong(-10000000000);
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(-10000000000.0);
    });
    /**
     * @tc.name testMathPow072
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7200
     * @tc.desc Verify pow method accepts a float positive zero base and returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = Double.toFloat(0.0);
      let result: double = Math.pow(base, 3.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow073
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7300
     * @tc.desc Verify pow method accepts a float negative zero base and returns negative zero for an odd exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = Double.toFloat(-0.0);
      let result: double = Math.pow(base, 3.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow074
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7400
     * @tc.desc Verify pow method accepts a normal float base and preserves it for exponent one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = Double.toFloat(3.14);
      let expected: double = base;
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.name testMathPow075
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7500
     * @tc.desc Verify pow method accepts a negative float fractional base and preserves it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = Double.toFloat(-99.99);
      let expected: double = base;
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.name testMathPow076
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7600
     * @tc.desc Verify pow method accepts the Float.MAX_VALUE boundary and preserves it for exponent one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = Float.MAX_VALUE;
      let expected: double = Float.MAX_VALUE;
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.name testMathPow077
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7700
     * @tc.desc Verify pow method accepts the Float.MIN_VALUE boundary and preserves it for exponent one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = Float.MIN_VALUE;
      let expected: double = Float.MIN_VALUE;
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.name testMathPow078
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7800
     * @tc.desc Verify pow method accepts a Float.POSITIVE_INFINITY base with a negative exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = Float.POSITIVE_INFINITY;
      let result: double = Math.pow(base, -1.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow079
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7900
     * @tc.desc Verify pow method accepts a Float.NEGATIVE_INFINITY base with an odd positive exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = Float.NEGATIVE_INFINITY;
      let result: double = Math.pow(base, 3.0);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.name testMathPow080
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_8000
     * @tc.desc Verify pow method accepts a Float.NaN base and zero exponent returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = Float.NaN;
      let result: double = Math.pow(base, 0.0);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow081
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_8100
     * @tc.desc Verify pow method accepts a Float.NaN exponent and propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exponent: float = Float.NaN;
      let result: double = Math.pow(2.0, exponent);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow082
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_8200
     * @tc.desc Verify pow method accepts a float overflowed base as Float.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = Double.toFloat(Float.MAX_VALUE * 10.0);
      let result: double = Math.pow(base, -1.0);
      expect(base).assertEqual(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow083
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_8300
     * @tc.desc Verify pow method accepts a float underflowed base as positive zero with a negative exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = Double.toFloat(Float.MIN_VALUE / 10.0);
      let result: double = Math.pow(base, -1.0);
      expect(base).assertEqual(Double.toFloat(0.0));
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.name testMathPow084
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_8400
     * @tc.desc Verify pow method accepts a positive float fractional base and preserves it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = Double.toFloat(99.99);
      let expected: double = base;
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.name testMathPow085
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_8500
     * @tc.desc Verify pow method accepts the Double.MAX_VALUE boundary and preserves it for exponent one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.MAX_VALUE, 1.0);
      expect(result).assertEqual(Double.MAX_VALUE);
    });
    /**
     * @tc.name testMathPow086
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_8600
     * @tc.desc Verify pow method with Double.MAX_VALUE squared overflows to Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.MAX_VALUE, 2.0);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.name testMathPow087
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_8700
     * @tc.desc Verify pow method accepts the Double.MIN_VALUE boundary and preserves it for exponent one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.MIN_VALUE, 1.0);
      expect(result).assertEqual(Double.MIN_VALUE);
    });
    /**
     * @tc.name testMathPow088
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_8800
     * @tc.desc Verify pow method with Double.MIN_VALUE squared underflows to positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.MIN_VALUE, 2.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow089
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_8900
     * @tc.desc Verify pow method with Double.NEGATIVE_INFINITY base and odd positive exponent returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.NEGATIVE_INFINITY, 3.0);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.name testMathPow090
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_9000
     * @tc.desc Verify pow method with Double.NEGATIVE_INFINITY base and even positive exponent returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.NEGATIVE_INFINITY, 2.0);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.name testMathPow091
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_9100
     * @tc.desc Verify pow method with Double.NEGATIVE_INFINITY base and odd negative exponent returns negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.NEGATIVE_INFINITY, -3.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow092
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_9200
     * @tc.desc Verify pow method with Double.NEGATIVE_INFINITY base and even negative exponent returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.NEGATIVE_INFINITY, -2.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathPow093
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_9300
     * @tc.desc Verify pow method with Double.POSITIVE_INFINITY base and zero exponent returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.POSITIVE_INFINITY, 0.0);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathPow094
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_9400
     * @tc.desc Verify pow method accepts a positive double fractional base and preserves it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 999999.99;
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(base);
    });
    /**
     * @tc.name testMathPow095
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_9500
     * @tc.desc Verify pow method accepts a double scientific notation base
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 1.0e3;
      let result: double = Math.pow(base, 2.0);
      expect(result).assertEqual(1000000.0);
    });
    /**
     * @tc.name testMathPow096
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_9600
     * @tc.desc Verify pow method accepts a double safe-integer precision boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 9007199254740991.0;
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(base);
    });
    /**
     * @tc.name testMathPow097
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_9700
     * @tc.desc Verify pow method accepts a Math.max expression as a base source
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = Math.max(2.0, 3.0);
      let result: double = Math.pow(base, 2.0);
      expect(result).assertEqual(9.0);
    });
    /**
     * @tc.name testMathPow098
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_9800
     * @tc.desc Verify pow method accepts a negative double safe-integer boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = -9007199254740991.0;
      let result: double = Math.pow(base, 1.0);
      expect(result).assertEqual(base);
    });
    /**
     * @tc.name testMathPow099
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_9900
     * @tc.desc Verify pow method with a negative finite base and even negative exponent returns a reciprocal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathPow099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(-2.0, -2.0);
      expect(result).assertEqual(0.25);
    });
  });
}
