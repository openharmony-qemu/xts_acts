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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.desc Verify tanh method is odd for mirrored finite double inputs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveResult: double = Math.tanh(0.75);
      let negativeResult: double = Math.tanh(-0.75);
      let diff: double = Utils.getAbsDiff(negativeResult, -positiveResult);
      expect(diff < 1.0e-5).assertTrue();
    });

    /**
     * @tc.name testMathTanh014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1400
     * @tc.desc Verify tanh method is monotonic for ordered positive finite inputs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smaller: double = Math.tanh(0.5);
      let larger: double = Math.tanh(1.5);
      expect(smaller < larger).assertTrue();
    });

    /**
     * @tc.name testMathTanh015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1500
     * @tc.desc Verify tanh method matches the exponential definition for a moderate finite input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.25;
      let lhs: double = Math.tanh(input);
      let positiveExp: double = Math.exp(input);
      let negativeExp: double = Math.exp(-input);
      let rhs: double = (positiveExp - negativeExp) / (positiveExp + negativeExp);
      let diff: double = Utils.getAbsDiff(lhs, rhs);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathTanh016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1600
     * @tc.desc Verify tanh method produces a positive finite value for the Math.PI constant input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tanh(Math.PI);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 0.99).assertTrue();
      expect(result < 1.0).assertTrue();
    });

    /**
     * @tc.name testMathTanh017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1700
     * @tc.desc Verify tanh method propagates NaN for a double NaN input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tanh(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathTanh018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1800
     * @tc.desc Verify tanh method returns one for a positive infinity input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tanh(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathTanh019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1900
     * @tc.desc Verify tanh method returns minus one for a negative infinity input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tanh(Double.NEGATIVE_INFINITY);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathTanh020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2000
     * @tc.desc Verify tanh method accepts a number typed helper input that evaluates to one-half
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildTanhNumberFromHelper();
      let result: number = Math.tanh(input);
      let diff: number = Utils.getAbsDiff(result, 0.46211715726000974);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathTanh021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2100
     * @tc.desc Verify tanh method accepts a widened float finite input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.5);
      let result: float = Math.tanh(input);
      assertApproxFloatResult(result, 0.46211715726000974);
    });

    /**
     * @tc.name testMathTanh022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2200
     * @tc.desc Verify tanh method saturates to one for a large positive float input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(100.0);
      let result: float = Math.tanh(input);
      expect(result).assertEqual(Double.toFloat(1.0));
    });

    /**
     * @tc.name testMathTanh023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2300
     * @tc.desc Verify tanh method saturates to minus one for a large negative float input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-100.0);
      let result: float = Math.tanh(input);
      expect(result).assertEqual(Double.toFloat(-1.0));
    });

    /**
     * @tc.name testMathTanh024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2400
     * @tc.desc Verify tanh method propagates NaN for a float NaN input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NaN;
      let result: float = Math.tanh(input);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });

    /**
     * @tc.name testMathTanh025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2500
     * @tc.desc Verify tanh method returns one for a float positive infinity input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.POSITIVE_INFINITY;
      let result: float = Math.tanh(input);
      expect(result).assertEqual(Double.toFloat(1.0));
    });

    /**
     * @tc.name testMathTanh026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2600
     * @tc.desc Verify tanh method returns minus one for a float negative infinity input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NEGATIVE_INFINITY;
      let result: float = Math.tanh(input);
      expect(result).assertEqual(Double.toFloat(-1.0));
    });

    /**
     * @tc.name testMathTanh027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2700
     * @tc.desc Verify tanh method accepts a widened byte input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(1);
      let result: double = Math.tanh(input);
      let expected: double = Math.tanh(1.0);
      assertApproxDoubleResult(result, expected);
    });

    /**
     * @tc.name testMathTanh028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2800
     * @tc.desc Verify tanh method accepts a widened short input and preserves the expected sign after widening
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-1);
      let result: double = Math.tanh(input);
      expect(result < 0.0).assertTrue();
    });

    /**
     * @tc.name testMathTanh029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2900
     * @tc.desc Verify tanh method accepts a widened int input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 2;
      let result: double = Math.tanh(input);
      let expected: double = Math.tanh(2.0);
      assertApproxDoubleResult(result, expected);
    });

    /**
     * @tc.name testMathTanh030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3000
     * @tc.desc Verify tanh method accepts a widened long input and preserves the expected sign after widening
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(-2);
      let result: double = Math.tanh(input);
      expect(result < 0.0).assertTrue();
    });

    /**
     * @tc.name testMathTanh031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3100
     * @tc.desc Verify tanh method remains stable across repeated calls with the same finite input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTanh031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.tanh(0.5);
      let second: double = Math.tanh(0.5);
      expect(first).assertEqual(second);
    });
  });
}
