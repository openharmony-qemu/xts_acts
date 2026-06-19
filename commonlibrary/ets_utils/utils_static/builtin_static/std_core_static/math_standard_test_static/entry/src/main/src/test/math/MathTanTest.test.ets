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

function buildTanNumberFromHelper(): number {
  return Math.PI / 6.0;
}

export default function mathTanTest(): void {
  describe('MathTanTest', (): void => {
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
     * @tc.name testMathTan001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0100
     * @tc.desc Verify tan method preserves positive zero for a positive zero double input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tan(0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathTan002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0200
     * @tc.desc Verify tan method preserves negative zero for a negative zero double input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tan(-0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathTan003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0300
     * @tc.desc Verify tan method returns one over square-root-three for the PI over six standard angle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tan(Math.PI / 6.0);
      assertApproxDoubleResult(result, 0.5773502691896257);
    });
    /**
     * @tc.name testMathTan004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0400
     * @tc.desc Verify tan method returns one for the PI over four standard angle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tan(Math.PI / 4.0);
      assertApproxDoubleResult(result, 1.0);
    });
    /**
     * @tc.name testMathTan005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0500
     * @tc.desc Verify tan method returns square-root-three for the PI over three standard angle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tan(Math.PI / 3.0);
      assertApproxDoubleResult(result, 1.7320508075688772);
    });
    /**
     * @tc.name testMathTan006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0600
     * @tc.desc Verify tan method returns a near-zero value for PI
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tan(Math.PI);
      expect(result > -1.0e-10).assertTrue();
      expect(result < 1.0e-10).assertTrue();
    });
    /**
     * @tc.name testMathTan007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0700
     * @tc.desc Verify tan method returns negative one for three PI over four
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tan(3.0 * Math.PI / 4.0);
      let diff: double = Utils.getAbsDiff(result, -1.0);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.name testMathTan008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0800
     * @tc.desc Verify tan method returns one again after adding one full period
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tan(5.0 * Math.PI / 4.0);
      let diff: double = Utils.getAbsDiff(result, 1.0);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.name testMathTan009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0900
     * @tc.desc Verify tan method is odd for mirrored finite double inputs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveResult: double = Math.tan(0.5);
      let negativeResult: double = Math.tan(-0.5);
      let diff: double = Utils.getAbsDiff(negativeResult, -positiveResult);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathTan010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1000
     * @tc.desc Verify tan method is periodic across inputs separated by PI
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
    */
    it('testMathTan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3;
      let baseAngleResult: double = Math.tan(x);
      let shiftedAngleResult: double = Math.tan(x + Math.PI);
      let diff: double = Utils.getAbsDiff(baseAngleResult, shiftedAngleResult);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.name testMathTan011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1100
     * @tc.desc Verify tan method follows the small-angle approximation for a tiny positive double input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.0e-10;
      let result: double = Math.tan(input);
      let diff: double = Utils.getAbsDiff(result, input);
      expect(result > 0.0).assertTrue();
      expect(diff < 1.0e-20).assertTrue();
    });
    /**
     * @tc.name testMathTan012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1200
     * @tc.desc Verify tan method keeps an extremely large finite input finite after argument reduction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tan(1000000.0);
      assertApproxDoubleResult(result, -0.373624453987599);
    });
    /**
     * @tc.name testMathTan013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1300
     * @tc.desc Verify tan method produces a large positive value just to the left of PI over two
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.PI / 2.0 - 1.0e-6;
      let result: double = Math.tan(input);
      expect(result > 1000.0).assertTrue();
    });
    /**
     * @tc.name testMathTan014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1400
     * @tc.desc Verify tan method produces a large negative value just to the right of PI over two
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.PI / 2.0 + 1.0e-6;
      let result: double = Math.tan(input);
      expect(result < -1000.0).assertTrue();
    });
    /**
     * @tc.name testMathTan015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1500
     * @tc.desc Verify tan method produces opposite large signs around negative PI over two
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftResult: double = Math.tan(-Math.PI / 2.0 - 1.0e-6);
      let rightResult: double = Math.tan(-Math.PI / 2.0 + 1.0e-6);
      expect(leftResult > 1000.0).assertTrue();
      expect(rightResult < -1000.0).assertTrue();
    });
    /**
     * @tc.name testMathTan016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1600
     * @tc.desc Verify tan method stays within tolerance of sine divided by cosine for a regular finite angle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5;
      let tangent: double = Math.tan(x);
      let ratio: double = Math.sin(x) / Math.cos(x);
      let diff: double = Utils.getAbsDiff(tangent, ratio);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathTan017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1700
     * @tc.desc Verify tan method stays within tolerance of the double-angle identity for a finite input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3;
      let lhs: double = Math.tan(2.0 * x);
      let tx: double = Math.tan(x);
      let rhs: double = 2.0 * tx / (1.0 - tx * tx);
      let diff: double = Utils.getAbsDiff(lhs, rhs);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.name testMathTan018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1800
     * @tc.desc Verify tan method stays within tolerance of the sum-angle identity for two finite inputs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
    */
    it('testMathTan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstAngle: double = 0.2;
      let secondAngle: double = 0.3;
      let lhs: double = Math.tan(firstAngle + secondAngle);
      let firstAngleTan: double = Math.tan(firstAngle);
      let secondAngleTan: double = Math.tan(secondAngle);
      let rhs: double = (firstAngleTan + secondAngleTan) / (1.0 - firstAngleTan * secondAngleTan);
      let diff: double = Utils.getAbsDiff(lhs, rhs);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.name testMathTan019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1900
     * @tc.desc Verify tan method propagates NaN for a double NaN input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tan(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathTan020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2000
     * @tc.desc Verify tan method returns NaN for positive and negative infinity inputs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Utils.isNaNValue(Math.tan(Double.POSITIVE_INFINITY))).assertTrue();
      expect(Utils.isNaNValue(Math.tan(Double.NEGATIVE_INFINITY))).assertTrue();
    });
    /**
     * @tc.name testMathTan021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2100
     * @tc.desc Verify tan method accepts a number typed helper input that evaluates to PI over six
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildTanNumberFromHelper();
      let result: number = Math.tan(input);
      let diff: number = Utils.getAbsDiff(result, 0.5773502691896257);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathTan022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2200
     * @tc.desc Verify tan method accepts a widened float finite input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.27);
      let dResult: double = Math.tan(input);
      let result: float = Double.toFloat(dResult);
      expect(Utils.isFiniteValue(dResult)).assertTrue();
      assertApproxFloatResult(result, 0.2767581474256426);
    });
    /**
     * @tc.name testMathTan023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2300
     * @tc.desc Verify tan method preserves negative zero for a widened float negative zero input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-0.0);
      let dResult: double = Math.tan(input);
      let result: float = Double.toFloat(dResult);
      expect(dResult).assertEqual(-0.0);
      expect(result).assertEqual(Double.toFloat(-0.0));
      expect(Utils.isNegativeZero(dResult)).assertTrue();
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathTan024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2400
     * @tc.desc Verify tan method propagates NaN for a widened float NaN input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NaN;
      let dResult: double = Math.tan(input);
      let result: float = Double.toFloat(dResult);
      expect(Utils.isNaNValue(dResult)).assertTrue();
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.name testMathTan025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2500
     * @tc.desc Verify tan method returns NaN for a widened float positive infinity input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.POSITIVE_INFINITY;
      let dResult: double = Math.tan(input);
      let result: float = Double.toFloat(dResult);
      expect(Utils.isNaNValue(dResult)).assertTrue();
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.name testMathTan026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2600
     * @tc.desc Verify tan method accepts a widened byte input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(1);
      let result: double = Math.tan(input);
      assertApproxDoubleResult(result, 1.5574077246549023);
    });
    /**
     * @tc.name testMathTan027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2700
     * @tc.desc Verify tan method accepts a widened short input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-1);
      let result: double = Math.tan(input);
      assertApproxDoubleResult(result, -1.5574077246549023);
    });
    /**
     * @tc.name testMathTan028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2800
     * @tc.desc Verify tan method accepts a widened int input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 2;
      let result: double = Math.tan(input);
      assertApproxDoubleResult(result, -2.185039863261519);
    });
    /**
     * @tc.name testMathTan029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2900
     * @tc.desc Verify tan method accepts a widened long input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(-2);
      let result: double = Math.tan(input);
      assertApproxDoubleResult(result, 2.185039863261519);
    });
    /**
     * @tc.name testMathTan030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3000
     * @tc.desc Verify tan method remains stable across repeated calls with the same finite input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTan030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.tan(0.4);
      let second: double = Math.tan(0.4);
      expect(first).assertEqual(second);
    });
  });
}
