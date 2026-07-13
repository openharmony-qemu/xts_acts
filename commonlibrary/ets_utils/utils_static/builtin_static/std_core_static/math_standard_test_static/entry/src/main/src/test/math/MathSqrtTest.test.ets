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

function assertApproxDoubleResult(result: double, expected: double): void {
  let diff: double = Utils.getAbsDiff(result, expected);
  expect(Utils.isFiniteValue(result)).assertTrue();
  expect(diff < 1.0e-12).assertTrue();
}

function assertApproxFloatResult(result: float, expected: double): void {
  let expectedFloat: float = Double.toFloat(expected);
  let diff: double = Utils.getAbsDiff(result, expectedFloat);
  expect(Utils.isFiniteFloat(result)).assertTrue();
  expect(diff < 1.0e-5).assertTrue();
}

function assertFiniteDoubleRange(result: double, lowerBound: double, upperBound: double): void {
  expect(Utils.isFiniteValue(result)).assertTrue();
  expect(result > lowerBound).assertTrue();
  expect(result < upperBound).assertTrue();
}

function buildSqrtNumberFromHelper(): number {
  return 0.25;
}

function buildSqrtFloatMinimumFromHelper(): number {
  return Float.MIN_VALUE;
}

export default function mathSqrtTest(): void {
  describe('MathSqrtTest', (): void => {
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
     * @tc.name testMathSqrt001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0100
     * @tc.desc Verify sqrt method preserves positive zero for a positive zero double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sqrt(0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSqrt002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0200
     * @tc.desc Verify sqrt method preserves negative zero for a negative zero double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sqrt(-0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSqrt003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0300
     * @tc.desc Verify sqrt method preserves positive zero for a positive zero float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.0);
      let dResult: double = Math.sqrt(input);
      let result: float = Double.toFloat(dResult);
      expect(dResult).assertEqual(0.0);
      expect(result).assertEqual(Double.toFloat(0.0));
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSqrt004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0400
     * @tc.desc Verify sqrt method preserves negative zero for a negative zero float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-0.0);
      let dResult: double = Math.sqrt(input);
      let result: float = Double.toFloat(dResult);
      expect(dResult).assertEqual(-0.0);
      expect(result).assertEqual(Double.toFloat(-0.0));
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSqrt005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0500
     * @tc.desc Verify sqrt method returns exact integer roots for representative perfect squares
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.sqrt(1.0)).assertEqual(1.0);
      expect(Math.sqrt(4.0)).assertEqual(2.0);
      expect(Math.sqrt(9.0)).assertEqual(3.0);
      expect(Math.sqrt(25.0)).assertEqual(5.0);
      expect(Math.sqrt(100.0)).assertEqual(10.0);
    });
    /**
     * @tc.name testMathSqrt006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0600
     * @tc.desc Verify sqrt method returns one-half for the finite quarter input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sqrt(0.25);
      assertApproxDoubleResult(result, 0.5);
    });
    /**
     * @tc.name testMathSqrt007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0700
     * @tc.desc Verify sqrt method returns square-root-one-half for the finite one-half input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sqrt(0.5);
      assertApproxDoubleResult(result, Math.SQRT1_2);
    });
    /**
     * @tc.name testMathSqrt008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0800
     * @tc.desc Verify sqrt method returns square-root-two for the finite input two
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sqrt(2.0);
      assertApproxDoubleResult(result, Math.SQRT2);
    });
    /**
     * @tc.name testMathSqrt009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0900
     * @tc.desc Verify sqrt method returns the expected finite value for the Math.PI constant input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sqrt(Math.PI);
      assertApproxDoubleResult(result, 1.7724538509055159);
    });
    /**
     * @tc.name testMathSqrt010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1000
     * @tc.desc Verify sqrt method preserves the smallest positive subnormal magnitude as a positive finite value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sqrt(Double.MIN_VALUE);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 0.0).assertTrue();
      assertApproxDoubleResult(result, 2.2227587494850775e-162);
    });
    /**
     * @tc.name testMathSqrt011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1100
     * @tc.desc Verify sqrt method returns the expected largest finite boundary root for Double.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sqrt(Double.MAX_VALUE);
      let expected: double = 1.3407807929942596e+154;
      let relativeDiff: double = Utils.getRelativeDiff(result, expected);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(relativeDiff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSqrt012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1200
     * @tc.desc Verify sqrt method is monotonic for ordered non-negative finite double inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smaller: double = Math.sqrt(2.0);
      let larger: double = Math.sqrt(3.0);
      expect(smaller < larger).assertTrue();
    });
    /**
     * @tc.name testMathSqrt013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1300
     * @tc.desc Verify sqrt method composes back to the original non-negative value when squared
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.0;
      let root: double = Math.sqrt(input);
      let squared: double = root * root;
      let diff: double = Utils.getAbsDiff(squared, input);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSqrt014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1400
     * @tc.desc Verify sqrt method returns the magnitude when applied to a squared finite value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -12.5;
      let result: double = Math.sqrt(input * input);
      assertApproxDoubleResult(result, 12.5);
    });
    /**
     * @tc.name testMathSqrt015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1500
     * @tc.desc Verify sqrt method returns Double.NaN for representative negative finite double inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Utils.isNaNValue(Math.sqrt(-0.5))).assertTrue();
      expect(Utils.isNaNValue(Math.sqrt(-1.0))).assertTrue();
      expect(Utils.isNaNValue(Math.sqrt(-100.0))).assertTrue();
    });
    /**
     * @tc.name testMathSqrt016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1600
     * @tc.desc Verify sqrt method propagates Double.NaN for a Double.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sqrt(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSqrt017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1700
     * @tc.desc Verify sqrt method returns Double.POSITIVE_INFINITY for a Double.POSITIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sqrt(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.name testMathSqrt018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1800
     * @tc.desc Verify sqrt method returns Double.NaN for a Double.NEGATIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sqrt(Double.NEGATIVE_INFINITY);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSqrt019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1900
     * @tc.desc Verify sqrt method accepts a number typed helper input that evaluates to one-quarter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildSqrtNumberFromHelper();
      let result: number = Math.sqrt(input);
      let diff: number = Utils.getAbsDiff(result, 0.5);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSqrt020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2000
     * @tc.desc Verify sqrt method accepts a widened float finite input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.5);
      let dResult: double = Math.sqrt(input);
      let result: float = Double.toFloat(dResult);
      expect(Utils.isFiniteValue(dResult)).assertTrue();
      assertApproxFloatResult(result, Math.SQRT1_2);
    });
    /**
     * @tc.name testMathSqrt021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2100
     * @tc.desc Verify sqrt method propagates Double.NaN for a Float.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NaN;
      let dResult: double = Math.sqrt(input);
      let result: float = Double.toFloat(dResult);
      expect(Utils.isNaNValue(dResult)).assertTrue();
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.name testMathSqrt022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2200
     * @tc.desc Verify sqrt method returns Double.POSITIVE_INFINITY for a Float.POSITIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.POSITIVE_INFINITY;
      let dResult: double = Math.sqrt(input);
      let result: float = Double.toFloat(dResult);
      expect(dResult).assertEqual(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });
    /**
     * @tc.name testMathSqrt023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2300
     * @tc.desc Verify sqrt method returns Double.NaN for a representative negative finite float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-0.5);
      let dResult: double = Math.sqrt(input);
      let result: float = Double.toFloat(dResult);
      expect(Utils.isNaNValue(dResult)).assertTrue();
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.name testMathSqrt024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2400
     * @tc.desc Verify sqrt method accepts a widened byte input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(1);
      let result: double = Math.sqrt(input);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathSqrt025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2500
     * @tc.desc Verify sqrt method accepts a widened short input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(4);
      let result: double = Math.sqrt(input);
      expect(result).assertEqual(2.0);
    });
    /**
     * @tc.name testMathSqrt026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2600
     * @tc.desc Verify sqrt method accepts a widened int input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 9;
      let result: double = Math.sqrt(input);
      expect(result).assertEqual(3.0);
    });
    /**
     * @tc.name testMathSqrt027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2700
     * @tc.desc Verify sqrt method accepts a widened long input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(16);
      let result: double = Math.sqrt(input);
      expect(result).assertEqual(4.0);
    });
    /**
     * @tc.name testMathSqrt028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2800
     * @tc.desc Verify sqrt method remains stable across repeated calls with the same finite input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.sqrt(0.5);
      let second: double = Math.sqrt(0.5);
      expect(first).assertEqual(second);
    });

    /**
     * @tc.name testMathSqrt029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2900
     * @tc.desc Verify sqrt method accepts widened Float.MAX_VALUE and returns a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.MAX_VALUE;
      let result: double = Math.sqrt(input);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 0.0).assertTrue();
    });

    /**
     * @tc.name testMathSqrt030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3000
     * @tc.desc Verify sqrt method returns Double.NaN for a widened Float.NEGATIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NEGATIVE_INFINITY;
      let result: double = Math.sqrt(input);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3100
     * @tc.desc Verify sqrt method accepts widened Int.MAX_VALUE and returns a finite positive boundary root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MAX_VALUE;
      let result: double = Math.sqrt(input);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 46340.0).assertTrue();
      expect(result < 46341.0).assertTrue();
    });

    /**
     * @tc.name testMathSqrt032
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3200
     * @tc.desc Verify sqrt method accepts helper returned Float.MIN_VALUE and returns a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildSqrtFloatMinimumFromHelper();
      let result: double = Math.sqrt(input);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 0.0).assertTrue();
    });

    /**
     * @tc.name testMathSqrt033
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3300
     * @tc.desc Verify sqrt method accepts widened Long.MAX_VALUE and returns a finite positive large boundary root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.MAX_VALUE;
      let result: double = Math.sqrt(input);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 3037000499.0).assertTrue();
      expect(result < 3037000500.0).assertTrue();
    });

    /**
     * @tc.name testMathSqrt034
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3400
     * @tc.desc Verify sqrt method preserves positive zero for a byte zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0);
      let result: double = Math.sqrt(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt035
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3500
     * @tc.desc Verify sqrt method accepts the byte maximum boundary input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 11.0, 12.0);
    });

    /**
     * @tc.name testMathSqrt036
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3600
     * @tc.desc Verify sqrt method returns Double.NaN for the byte minimum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt037
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3700
     * @tc.desc Verify sqrt method returns Double.NaN for a byte overflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(128);
      let result: double = Math.sqrt(inputValue);
      expect(inputValue).assertEqual(Int.toByte(-128));
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt038
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3800
     * @tc.desc Verify sqrt method accepts a byte underflow conversion input as a positive finite root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-129);
      let result: double = Math.sqrt(inputValue);
      expect(inputValue).assertEqual(Int.toByte(127));
      assertFiniteDoubleRange(result, 11.0, 12.0);
    });

    /**
     * @tc.name testMathSqrt039
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3900
     * @tc.desc Verify sqrt method accepts a byte hexadecimal source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0x0A);
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 3.0, 4.0);
    });

    /**
     * @tc.name testMathSqrt040
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4000
     * @tc.desc Verify sqrt method accepts a byte octal source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0o12);
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 3.0, 4.0);
    });

    /**
     * @tc.name testMathSqrt041
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4100
     * @tc.desc Verify sqrt method accepts a normal byte source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(12);
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 3.0, 4.0);
    });

    /**
     * @tc.name testMathSqrt042
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4200
     * @tc.desc Verify sqrt method returns Double.NaN for a byte negative marker source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-1);
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt043
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4300
     * @tc.desc Verify sqrt method accepts a byte representative source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(99);
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 9.0, 10.0);
    });

    /**
     * @tc.name testMathSqrt044
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4400
     * @tc.desc Verify sqrt method preserves positive zero for a short zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: double = Math.sqrt(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt045
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4500
     * @tc.desc Verify sqrt method accepts the short maximum boundary input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 181.0, 182.0);
    });

    /**
     * @tc.name testMathSqrt046
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4600
     * @tc.desc Verify sqrt method returns Double.NaN for the short minimum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt047
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4700
     * @tc.desc Verify sqrt method returns Double.NaN for a short overflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32768);
      let result: double = Math.sqrt(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-32768));
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt048
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4800
     * @tc.desc Verify sqrt method accepts a short underflow conversion input as a positive finite root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32769);
      let result: double = Math.sqrt(inputValue);
      expect(inputValue).assertEqual(Int.toShort(32767));
      assertFiniteDoubleRange(result, 181.0, 182.0);
    });

    /**
     * @tc.name testMathSqrt049
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4900
     * @tc.desc Verify sqrt method returns Double.NaN for a short unsigned upper mapping source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(65535);
      let result: double = Math.sqrt(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-1));
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt050
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5000
     * @tc.desc Verify sqrt method accepts a short hexadecimal source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0x7FF);
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 45.0, 46.0);
    });

    /**
     * @tc.name testMathSqrt051
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5100
     * @tc.desc Verify sqrt method accepts a short octal source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0o7777);
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 63.0, 64.0);
    });

    /**
     * @tc.name testMathSqrt052
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5200
     * @tc.desc Verify sqrt method accepts a positive short representative input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(2048);
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 45.0, 46.0);
    });

    /**
     * @tc.name testMathSqrt053
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5300
     * @tc.desc Verify sqrt method accepts a normal short source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(100);
      let result: double = Math.sqrt(inputValue);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.name testMathSqrt054
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5400
     * @tc.desc Verify sqrt method preserves positive zero for an int zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0;
      let result: double = Math.sqrt(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt055
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5500
     * @tc.desc Verify sqrt method returns Double.NaN for an int negative marker source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = -1;
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt056
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5600
     * @tc.desc Verify sqrt method returns Double.NaN for the int minimum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE;
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt057
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5700
     * @tc.desc Verify sqrt method accepts an int value just below maximum as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE - 1;
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 46340.0, 46341.0);
    });

    /**
     * @tc.name testMathSqrt058
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5800
     * @tc.desc Verify sqrt method returns Double.NaN for an int value just above minimum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE + 1;
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt059
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5900
     * @tc.desc Verify sqrt method returns Double.NaN for an int overflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: int = Int.MAX_VALUE;
      let inputValue: int = maximumValue + 1;
      let result: double = Math.sqrt(inputValue);
      expect(inputValue).assertEqual(Int.MIN_VALUE);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt060
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6000
     * @tc.desc Verify sqrt method accepts an int underflow conversion input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: int = Int.MIN_VALUE;
      let inputValue: int = minimumValue - 1;
      let result: double = Math.sqrt(inputValue);
      expect(inputValue).assertEqual(Int.MAX_VALUE);
      assertFiniteDoubleRange(result, 46340.0, 46341.0);
    });

    /**
     * @tc.name testMathSqrt061
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6100
     * @tc.desc Verify sqrt method accepts an int hexadecimal source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0x1234;
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 68.0, 69.0);
    });

    /**
     * @tc.name testMathSqrt062
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6200
     * @tc.desc Verify sqrt method accepts an int binary source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0b1010;
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 3.0, 4.0);
    });

    /**
     * @tc.name testMathSqrt063
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6300
     * @tc.desc Verify sqrt method accepts an int octal source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0o123;
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 9.0, 10.0);
    });

    /**
     * @tc.name testMathSqrt064
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6400
     * @tc.desc Verify sqrt method accepts a positive int representative threshold input as an exact root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 1000000;
      let result: double = Math.sqrt(inputValue);
      expect(result).assertEqual(1000.0);
    });

    /**
     * @tc.name testMathSqrt065
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6500
     * @tc.desc Verify sqrt method accepts a normal int source input as an exact root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 10000;
      let result: double = Math.sqrt(inputValue);
      expect(result).assertEqual(100.0);
    });

    /**
     * @tc.name testMathSqrt066
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6600
     * @tc.desc Verify sqrt method accepts a positive int one input as an exact root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 1;
      let result: double = Math.sqrt(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSqrt067
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6700
     * @tc.desc Verify sqrt method accepts a positive int value near maximum as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 2147483646;
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 46340.0, 46341.0);
    });

    /**
     * @tc.name testMathSqrt068
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6800
     * @tc.desc Verify sqrt method preserves positive zero for a long zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(0);
      let result: double = Math.sqrt(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt069
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6900
     * @tc.desc Verify sqrt method returns Double.NaN for a long negative marker source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(-1);
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt070
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_7000
     * @tc.desc Verify sqrt method returns Double.NaN for Long.MIN_VALUE input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt071
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_7100
     * @tc.desc Verify sqrt method accepts Long.MAX_VALUE minus one as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE - Int.toLong(1);
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 3037000499.0, 3037000500.0);
    });

    /**
     * @tc.name testMathSqrt072
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_7200
     * @tc.desc Verify sqrt method returns Double.NaN for Long.MIN_VALUE plus one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE + Int.toLong(1);
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt073
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_7300
     * @tc.desc Verify sqrt method returns Double.NaN for a long overflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let inputValue: long = maximumValue + Int.toLong(1);
      let result: double = Math.sqrt(inputValue);
      expect(inputValue).assertEqual(Long.MIN_VALUE);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt074
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_7400
     * @tc.desc Verify sqrt method accepts a long underflow conversion input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: long = Long.MIN_VALUE;
      let inputValue: long = minimumValue - Int.toLong(1);
      let result: double = Math.sqrt(inputValue);
      expect(inputValue).assertEqual(Long.MAX_VALUE);
      assertFiniteDoubleRange(result, 3037000499.0, 3037000500.0);
    });

    /**
     * @tc.name testMathSqrt075
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_7500
     * @tc.desc Verify sqrt method accepts a long hexadecimal source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(0x1234);
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 68.0, 69.0);
    });

    /**
     * @tc.name testMathSqrt076
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_7600
     * @tc.desc Verify sqrt method accepts a long octal source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(0o123);
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 9.0, 10.0);
    });

    /**
     * @tc.name testMathSqrt077
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_7700
     * @tc.desc Verify sqrt method accepts a positive long representative input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(10000000000);
      let result: double = Math.sqrt(inputValue);
      expect(result).assertEqual(100000.0);
    });

    /**
     * @tc.name testMathSqrt078
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_7800
     * @tc.desc Verify sqrt method accepts a normal long source input as an exact root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(100);
      let result: double = Math.sqrt(inputValue);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.name testMathSqrt079
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_7900
     * @tc.desc Verify sqrt method accepts a positive long one input as an exact root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(1);
      let result: double = Math.sqrt(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSqrt080
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_8000
     * @tc.desc Verify sqrt method returns Double.NaN for a negative long representative source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(-10000000000);
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt081
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_8100
     * @tc.desc Verify sqrt method accepts a normal float source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(3.14);
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 1.7, 1.8);
    });

    /**
     * @tc.name testMathSqrt082
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_8200
     * @tc.desc Verify sqrt method returns Double.NaN for a negative float representative fractional source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-99.99);
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt083
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_8300
     * @tc.desc Verify sqrt method accepts direct Float.MAX_VALUE as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 0.0).assertTrue();
    });

    /**
     * @tc.name testMathSqrt084
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_8400
     * @tc.desc Verify sqrt method accepts direct Float.MIN_VALUE as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 0.0).assertTrue();
    });

    /**
     * @tc.name testMathSqrt085
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_8500
     * @tc.desc Verify sqrt method returns Double.NaN for negative Float.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MIN_VALUE;
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt086
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_8600
     * @tc.desc Verify sqrt method accepts a float overflowed source value as Float.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MAX_VALUE * 10.0);
      let result: double = Math.sqrt(inputValue);
      expect(inputValue).assertEqual(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSqrt087
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_8700
     * @tc.desc Verify sqrt method preserves positive zero for a float underflowed source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MIN_VALUE / 10.0);
      let result: double = Math.sqrt(inputValue);
      expect(inputValue).assertEqual(Double.toFloat(0.0));
      expect(Utils.isPositiveZero(inputValue)).assertTrue();
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt088
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_8800
     * @tc.desc Verify sqrt method preserves negative zero for a negative float underflowed source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-Float.MIN_VALUE / 10.0);
      let result: double = Math.sqrt(inputValue);
      expect(inputValue).assertEqual(Double.toFloat(-0.0));
      expect(Utils.isNegativeZero(inputValue)).assertTrue();
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt089
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_8900
     * @tc.desc Verify sqrt method accepts a float scientific notation source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0e3);
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 31.0, 32.0);
    });

    /**
     * @tc.name testMathSqrt090
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_9000
     * @tc.desc Verify sqrt method accepts a float representative fractional source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(99.99);
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 9.0, 10.0);
    });

    /**
     * @tc.name testMathSqrt091
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_9100
     * @tc.desc Verify sqrt method accepts a double representative fractional source input as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 999999.99;
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 999.0, 1000.0);
    });

    /**
     * @tc.name testMathSqrt092
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_9200
     * @tc.desc Verify sqrt method returns Double.NaN for a negative double representative fractional source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -888.88;
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt093
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_9300
     * @tc.desc Verify sqrt method accepts a double overflowed source expression as Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE * 2.0;
      let result: double = Math.sqrt(inputValue);
      expect(inputValue).assertEqual(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSqrt094
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_9400
     * @tc.desc Verify sqrt method preserves positive zero for a double underflowed source expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE / 2.0;
      let result: double = Math.sqrt(inputValue);
      expect(inputValue).assertEqual(0.0);
      expect(Utils.isPositiveZero(inputValue)).assertTrue();
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt095
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_9500
     * @tc.desc Verify sqrt method preserves negative zero for a negative double underflowed source expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE / 2.0;
      let result: double = Math.sqrt(inputValue);
      expect(inputValue).assertEqual(-0.0);
      expect(Utils.isNegativeZero(inputValue)).assertTrue();
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt096
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_9600
     * @tc.desc Verify sqrt method accepts the double safe integer boundary as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 9007199254740991.0;
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 94906265.0, 94906266.0);
    });

    /**
     * @tc.name testMathSqrt097
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_9700
     * @tc.desc Verify sqrt method accepts the double power-of-two precision boundary as a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 9007199254740992.0;
      let result: double = Math.sqrt(inputValue);
      assertFiniteDoubleRange(result, 94906265.0, 94906266.0);
    });

    /**
     * @tc.name testMathSqrt098
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_9800
     * @tc.desc Verify sqrt method accepts a double scientific notation source input as an exact root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0e6;
      let result: double = Math.sqrt(inputValue);
      expect(result).assertEqual(1000.0);
    });

    /**
     * @tc.name testMathSqrt099
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_9900
     * @tc.desc Verify sqrt method returns Double.NaN for negative Double.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE;
      let result: double = Math.sqrt(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSqrt100
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_10000
     * @tc.desc Verify sqrt method accepts a double value strictly above the power-of-two precision boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 9007199254740996.0;
      let result: double = Math.sqrt(inputValue);
      assertApproxDoubleResult(result, 94906265.62425157);
    });
  });
}
