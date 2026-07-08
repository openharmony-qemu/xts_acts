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

function assertFiniteDoubleWithinUnit(result: double): void {
  expect(Utils.isFiniteValue(result)).assertTrue();
  expect(result >= -1.0).assertTrue();
  expect(result <= 1.0).assertTrue();
}

function assertPositiveTanhSaturation(result: double): void {
  expect(result).assertEqual(1.0);
}

function assertNegativeTanhSaturation(result: double): void {
  expect(result).assertEqual(-1.0);
}

function buildTanhExpectedFromDefinition(input: double): double {
  let positiveExp: double = Math.exp(input);
  let negativeExp: double = Math.exp(-input);
  return (positiveExp - negativeExp) / (positiveExp + negativeExp);
}

function buildTanhNumberFromHelper(): number {
  return 0.5;
}

export default function mathTanhTest(): void {
  describe('MathTanhTest', (): void => {
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
     * @tc.name testMathTanh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0100
     * @tc.desc Verify tanh method preserves positive zero for a positive zero double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tanh(0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTanh002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0200
     * @tc.desc Verify tanh method preserves negative zero for a negative zero double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tanh(-0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTanh003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0300
     * @tc.desc Verify tanh method preserves positive zero for a positive zero float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.0);
      let result: float = Math.tanh(input);
      expect(result).assertEqual(Double.toFloat(0.0));
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTanh004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0400
     * @tc.desc Verify tanh method preserves negative zero for a negative zero float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-0.0);
      let result: float = Math.tanh(input);
      expect(result).assertEqual(Double.toFloat(-0.0));
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTanh005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0500
     * @tc.desc Verify tanh method returns the expected finite value for a positive double input of one-half
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.5;
      let result: double = Math.tanh(input);
      let expected: double = buildTanhExpectedFromDefinition(input);
      assertApproxDoubleResult(result, expected);
    });

    /**
     * @tc.name testMathTanh006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0600
     * @tc.desc Verify tanh method returns the expected finite value for a positive double input of one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.0;
      let result: double = Math.tanh(input);
      let expected: double = buildTanhExpectedFromDefinition(input);
      assertApproxDoubleResult(result, expected);
    });

    /**
     * @tc.name testMathTanh007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0700
     * @tc.desc Verify tanh method returns the expected finite value for a positive double input of two and one-half
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.5;
      let result: double = Math.tanh(input);
      let expected: double = buildTanhExpectedFromDefinition(input);
      assertApproxDoubleResult(result, expected);
    });

    /**
     * @tc.name testMathTanh008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0800
     * @tc.desc Verify tanh method saturates near one for a large positive finite double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 10.0;
      let result: double = Math.tanh(input);
      let expected: double = buildTanhExpectedFromDefinition(input);
      assertApproxDoubleResult(result, expected);
      expect(result < 1.0).assertTrue();
    });

    /**
     * @tc.name testMathTanh009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0900
     * @tc.desc Verify tanh method saturates exactly to one for a very large positive finite double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tanh(1000.0);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathTanh010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1000
     * @tc.desc Verify tanh method follows the small-angle approximation for a tiny positive double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.0e-10;
      let result: double = Math.tanh(input);
      let relativeDiff: double = Utils.getRelativeDiff(result, input);
      expect(relativeDiff < 1.0e-12).assertTrue();
      expect(result > 0.0).assertTrue();
    });

    /**
     * @tc.name testMathTanh011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1100
     * @tc.desc Verify tanh method preserves the smallest positive subnormal magnitude
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tanh(Double.MIN_VALUE);
      expect(result).assertEqual(Double.MIN_VALUE);
      expect(result > 0.0).assertTrue();
    });

    /**
     * @tc.name testMathTanh012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1200
     * @tc.desc Verify tanh method stays within the closed interval from minus one to one for the largest finite double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tanh(Double.MAX_VALUE);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathTanh013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1300
     * @tc.desc Verify tanh method accepts negative Double.MAX_VALUE as a saturated negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MAX_VALUE;
      let result: double = Math.tanh(inputValue);
      assertNegativeTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1400
     * @tc.desc Verify tanh method is odd for mirrored finite double inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveResult: double = Math.tanh(0.75);
      let negativeResult: double = Math.tanh(-0.75);
      let diff: double = Utils.getAbsDiff(negativeResult, -positiveResult);
      expect(diff < 1.0e-5).assertTrue();
    });

    /**
     * @tc.name testMathTanh015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1500
     * @tc.desc Verify tanh method is monotonic for ordered positive finite inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smaller: double = Math.tanh(0.5);
      let larger: double = Math.tanh(1.5);
      expect(smaller < larger).assertTrue();
    });

    /**
     * @tc.name testMathTanh016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1600
     * @tc.desc Verify tanh method matches the exponential definition for a moderate finite input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.25;
      let lhs: double = Math.tanh(input);
      let positiveExp: double = Math.exp(input);
      let negativeExp: double = Math.exp(-input);
      let rhs: double = (positiveExp - negativeExp) / (positiveExp + negativeExp);
      let diff: double = Utils.getAbsDiff(lhs, rhs);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathTanh017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1700
     * @tc.desc Verify tanh method produces a positive finite value for the Math.PI constant input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tanh(Math.PI);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 0.99).assertTrue();
      expect(result < 1.0).assertTrue();
    });

    /**
     * @tc.name testMathTanh018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1800
     * @tc.desc Verify tanh method propagates Double.NaN for a Double.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tanh(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathTanh019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1900
     * @tc.desc Verify tanh method returns one for a Double.POSITIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tanh(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathTanh020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2000
     * @tc.desc Verify tanh method returns minus one for a Double.NEGATIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tanh(Double.NEGATIVE_INFINITY);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathTanh021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2100
     * @tc.desc Verify tanh method accepts a number typed helper input that evaluates to one-half
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildTanhNumberFromHelper();
      let result: number = Math.tanh(input);
      let diff: number = Utils.getAbsDiff(result, 0.46211715726000974);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathTanh022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2200
     * @tc.desc Verify tanh method accepts a widened float finite input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.5);
      let result: float = Math.tanh(input);
      assertApproxFloatResult(result, 0.46211715726000974);
    });

    /**
     * @tc.name testMathTanh023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2300
     * @tc.desc Verify tanh method saturates to one for a large positive float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(100.0);
      let result: float = Math.tanh(input);
      expect(result).assertEqual(Double.toFloat(1.0));
    });

    /**
     * @tc.name testMathTanh024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2400
     * @tc.desc Verify tanh method saturates to minus one for a large negative float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-100.0);
      let result: float = Math.tanh(input);
      expect(result).assertEqual(Double.toFloat(-1.0));
    });

    /**
     * @tc.name testMathTanh025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2500
     * @tc.desc Verify tanh method propagates Float.NaN for a Float.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NaN;
      let result: float = Math.tanh(input);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });

    /**
     * @tc.name testMathTanh026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2600
     * @tc.desc Verify tanh method returns one for a Float.POSITIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.POSITIVE_INFINITY;
      let result: float = Math.tanh(input);
      expect(result).assertEqual(Double.toFloat(1.0));
    });

    /**
     * @tc.name testMathTanh027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2700
     * @tc.desc Verify tanh method returns minus one for a Float.NEGATIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NEGATIVE_INFINITY;
      let result: float = Math.tanh(input);
      expect(result).assertEqual(Double.toFloat(-1.0));
    });

    /**
     * @tc.name testMathTanh028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2800
     * @tc.desc Verify tanh method accepts a widened byte input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(1);
      let result: double = Math.tanh(input);
      let expected: double = Math.tanh(1.0);
      assertApproxDoubleResult(result, expected);
    });

    /**
     * @tc.name testMathTanh029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2900
     * @tc.desc Verify tanh method accepts a widened short input and preserves the expected sign after widening
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-1);
      let result: double = Math.tanh(input);
      expect(result < 0.0).assertTrue();
    });

    /**
     * @tc.name testMathTanh030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3000
     * @tc.desc Verify tanh method accepts a widened int input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 2;
      let result: double = Math.tanh(input);
      let expected: double = Math.tanh(2.0);
      assertApproxDoubleResult(result, expected);
    });

    /**
     * @tc.name testMathTanh031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3100
     * @tc.desc Verify tanh method accepts a widened long input and preserves the expected sign after widening
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(-2);
      let result: double = Math.tanh(input);
      expect(result < 0.0).assertTrue();
    });

    /**
     * @tc.name testMathTanh032
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3200
     * @tc.desc Verify tanh method remains stable across repeated calls with the same finite input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.tanh(0.5);
      let second: double = Math.tanh(0.5);
      expect(first).assertEqual(second);
    });

    /**
     * @tc.name testMathTanh033
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3300
     * @tc.desc Verify tanh method preserves positive zero for a byte zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0);
      let result: double = Math.tanh(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTanh034
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3400
     * @tc.desc Verify tanh method accepts the byte maximum boundary input as a saturated positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      let result: double = Math.tanh(inputValue);
      assertPositiveTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh035
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3500
     * @tc.desc Verify tanh method accepts the byte minimum boundary input as a saturated negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: double = Math.tanh(inputValue);
      assertNegativeTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh036
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3600
     * @tc.desc Verify tanh method accepts a byte overflow conversion input as a saturated negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(128);
      let result: double = Math.tanh(inputValue);
      expect(inputValue).assertEqual(Int.toByte(-128));
      assertNegativeTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh037
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3700
     * @tc.desc Verify tanh method accepts a byte underflow conversion input as a saturated positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-129);
      let result: double = Math.tanh(inputValue);
      expect(inputValue).assertEqual(Int.toByte(127));
      assertPositiveTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh038
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3800
     * @tc.desc Verify tanh method accepts a byte hexadecimal source input as a finite result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0x0A);
      let result: double = Math.tanh(inputValue);
      assertFiniteDoubleWithinUnit(result);
    });

    /**
     * @tc.name testMathTanh039
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3900
     * @tc.desc Verify tanh method returns a negative finite result for a byte negative marker input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-1);
      let result: double = Math.tanh(inputValue);
      expect(result < 0.0).assertTrue();
      expect(result > -1.0).assertTrue();
    });

    /**
     * @tc.name testMathTanh040
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4000
     * @tc.desc Verify tanh method preserves positive zero for a short zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: double = Math.tanh(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTanh041
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4100
     * @tc.desc Verify tanh method accepts the short maximum boundary input as a saturated positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: double = Math.tanh(inputValue);
      assertPositiveTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh042
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4200
     * @tc.desc Verify tanh method accepts the short minimum boundary input as a saturated negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      let result: double = Math.tanh(inputValue);
      assertNegativeTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh043
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4300
     * @tc.desc Verify tanh method accepts a short overflow conversion input as a saturated negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32768);
      let result: double = Math.tanh(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-32768));
      assertNegativeTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh044
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4400
     * @tc.desc Verify tanh method accepts a short underflow conversion input as a saturated positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32769);
      let result: double = Math.tanh(inputValue);
      expect(inputValue).assertEqual(Int.toShort(32767));
      assertPositiveTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh045
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4500
     * @tc.desc Verify tanh method accepts a short unsigned upper mapping source input as mapped negative one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(65535);
      let result: float = Math.tanh(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-1));
      assertApproxFloatResult(result, -0.7615941559557649);
    });

    /**
     * @tc.name testMathTanh046
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4600
     * @tc.desc Verify tanh method accepts a short hexadecimal source input as a finite result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0x7FF);
      let result: double = Math.tanh(inputValue);
      assertFiniteDoubleWithinUnit(result);
    });

    /**
     * @tc.name testMathTanh047
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4700
     * @tc.desc Verify tanh method preserves positive zero for an int zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0;
      let result: double = Math.tanh(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTanh048
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4800
     * @tc.desc Verify tanh method returns a negative finite result for an int negative marker input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = -1;
      let result: double = Math.tanh(inputValue);
      expect(result < 0.0).assertTrue();
      expect(result > -1.0).assertTrue();
    });

    /**
     * @tc.name testMathTanh049
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4900
     * @tc.desc Verify tanh method accepts the int minimum boundary input as a saturated negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE;
      let result: double = Math.tanh(inputValue);
      assertNegativeTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh050
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5000
     * @tc.desc Verify tanh method accepts the int maximum boundary input as a saturated positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE;
      let result: double = Math.tanh(inputValue);
      assertPositiveTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh051
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5100
     * @tc.desc Verify tanh method accepts an int value just below maximum as a saturated positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE - 1;
      let result: double = Math.tanh(inputValue);
      assertPositiveTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh052
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5200
     * @tc.desc Verify tanh method accepts an int value just above minimum as a saturated negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE + 1;
      let result: double = Math.tanh(inputValue);
      assertNegativeTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh053
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5300
     * @tc.desc Verify tanh method accepts an int overflow conversion input as a saturated negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: int = Int.MAX_VALUE;
      let inputValue: int = maximumValue + 1;
      let result: double = Math.tanh(inputValue);
      expect(inputValue).assertEqual(Int.MIN_VALUE);
      assertNegativeTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh054
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5400
     * @tc.desc Verify tanh method accepts an int underflow conversion input as a saturated positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: int = Int.MIN_VALUE;
      let inputValue: int = minimumValue - 1;
      let result: double = Math.tanh(inputValue);
      expect(inputValue).assertEqual(Int.MAX_VALUE);
      assertPositiveTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh055
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5500
     * @tc.desc Verify tanh method accepts an int binary source input as a finite result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0b1010;
      let result: double = Math.tanh(inputValue);
      assertFiniteDoubleWithinUnit(result);
    });

    /**
     * @tc.name testMathTanh056
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5600
     * @tc.desc Verify tanh method accepts a positive int one input as a finite result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 1;
      let result: double = Math.tanh(inputValue);
      assertApproxDoubleResult(result, Math.tanh(1.0));
    });

    /**
     * @tc.name testMathTanh057
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5700
     * @tc.desc Verify tanh method preserves positive zero for a long zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(0);
      let result: double = Math.tanh(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTanh058
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5800
     * @tc.desc Verify tanh method returns a negative finite result for a long negative marker input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(-1);
      let result: double = Math.tanh(inputValue);
      expect(result < 0.0).assertTrue();
      expect(result > -1.0).assertTrue();
    });

    /**
     * @tc.name testMathTanh059
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5900
     * @tc.desc Verify tanh method accepts Long.MIN_VALUE input as a saturated negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: double = Math.tanh(inputValue);
      assertNegativeTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh060
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6000
     * @tc.desc Verify tanh method accepts the long maximum boundary input as a saturated positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE;
      let result: double = Math.tanh(inputValue);
      assertPositiveTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh061
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6100
     * @tc.desc Verify tanh method accepts Long.MAX_VALUE minus one as a saturated positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE - Int.toLong(1);
      let result: double = Math.tanh(inputValue);
      assertPositiveTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh062
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6200
     * @tc.desc Verify tanh method accepts Long.MIN_VALUE plus one as a saturated negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE + Int.toLong(1);
      let result: double = Math.tanh(inputValue);
      assertNegativeTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh063
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6300
     * @tc.desc Verify tanh method accepts a long overflow conversion input as a saturated negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let inputValue: long = maximumValue + Int.toLong(1);
      let result: double = Math.tanh(inputValue);
      expect(inputValue).assertEqual(Long.MIN_VALUE);
      assertNegativeTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh064
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6400
     * @tc.desc Verify tanh method accepts a long underflow conversion input as a saturated positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: long = Long.MIN_VALUE;
      let inputValue: long = minimumValue - Int.toLong(1);
      let result: double = Math.tanh(inputValue);
      expect(inputValue).assertEqual(Long.MAX_VALUE);
      assertPositiveTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh065
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6500
     * @tc.desc Verify tanh method accepts a long hexadecimal source input as a finite result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(0x1234);
      let result: double = Math.tanh(inputValue);
      assertFiniteDoubleWithinUnit(result);
    });

    /**
     * @tc.name testMathTanh066
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6600
     * @tc.desc Verify tanh method accepts a positive long one input as a finite result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(1);
      let result: double = Math.tanh(inputValue);
      assertApproxDoubleResult(result, Math.tanh(1.0));
    });

    /**
     * @tc.name testMathTanh067
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6700
     * @tc.desc Verify tanh method accepts direct Float.MAX_VALUE as a saturated positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      let result: double = Math.tanh(inputValue);
      assertPositiveTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh068
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6800
     * @tc.desc Verify tanh method accepts direct negative Float.MAX_VALUE as a saturated negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MAX_VALUE;
      let result: double = Math.tanh(inputValue);
      assertNegativeTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh069
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6900
     * @tc.desc Verify tanh method preserves Float.MIN_VALUE for the smallest positive float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: double = Math.tanh(inputValue);
      expect(result).assertEqual(Double.toFloat(Float.MIN_VALUE));
    });

    /**
     * @tc.name testMathTanh070
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_7000
     * @tc.desc Verify tanh method preserves negative Float.MIN_VALUE for the smallest negative float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MIN_VALUE;
      let result: double = Math.tanh(inputValue);
      expect(result).assertEqual(Double.toFloat(-Float.MIN_VALUE));
    });

    /**
     * @tc.name testMathTanh071
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_7100
     * @tc.desc Verify tanh method accepts a float overflowed source value as a saturated positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MAX_VALUE * 10.0);
      let result: double = Math.tanh(inputValue);
      expect(inputValue).assertEqual(Float.POSITIVE_INFINITY);
      assertPositiveTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh072
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_7200
     * @tc.desc Verify tanh method preserves positive zero for a float underflowed source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MIN_VALUE / 10.0);
      let result: double = Math.tanh(inputValue);
      expect(inputValue).assertEqual(Double.toFloat(0.0));
      expect(Utils.isPositiveZero(inputValue)).assertTrue();
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTanh073
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_7300
     * @tc.desc Verify tanh method preserves negative zero for a negative float underflowed source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-Float.MIN_VALUE / 10.0);
      let result: double = Math.tanh(inputValue);
      expect(inputValue).assertEqual(Double.toFloat(-0.0));
      expect(Utils.isNegativeZero(inputValue)).assertTrue();
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTanh074
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_7400
     * @tc.desc Verify tanh method preserves negative Double.MIN_VALUE for the smallest negative double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE;
      let result: double = Math.tanh(inputValue);
      expect(result).assertEqual(-Double.MIN_VALUE);
    });

    /**
     * @tc.name testMathTanh075
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_7500
     * @tc.desc Verify tanh method returns one for a double overflowed source expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE * 2.0;
      let result: double = Math.tanh(inputValue);
      expect(inputValue).assertEqual(Double.POSITIVE_INFINITY);
      assertPositiveTanhSaturation(result);
    });

    /**
     * @tc.name testMathTanh076
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_7600
     * @tc.desc Verify tanh method preserves positive zero for a double underflowed source expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE / 2.0;
      let result: double = Math.tanh(inputValue);
      expect(inputValue).assertEqual(0.0);
      expect(Utils.isPositiveZero(inputValue)).assertTrue();
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTanh077
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_7700
     * @tc.desc Verify tanh method preserves negative zero for a negative double underflowed source expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE / 2.0;
      let result: double = Math.tanh(inputValue);
      expect(inputValue).assertEqual(-0.0);
      expect(Utils.isNegativeZero(inputValue)).assertTrue();
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
  });
}
