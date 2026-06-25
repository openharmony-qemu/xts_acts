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

function buildSqrtNumberFromHelper(): number {
  return 0.25;
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.desc Verify sqrt method returns NaN for representative negative finite double inputs
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.desc Verify sqrt method propagates NaN for a double NaN input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSqrt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sqrt(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSqrt017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1700
     * @tc.desc Verify sqrt method returns positive infinity for a positive infinity double input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSqrt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sqrt(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.name testMathSqrt018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1800
     * @tc.desc Verify sqrt method returns NaN for a negative infinity double input
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.desc Verify sqrt method propagates NaN for a float NaN input
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.desc Verify sqrt method returns positive infinity for a float positive infinity input
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.desc Verify sqrt method returns NaN for a representative negative finite float input
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSqrt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.sqrt(0.5);
      let second: double = Math.sqrt(0.5);
      expect(first).assertEqual(second);
    });
  });
}
