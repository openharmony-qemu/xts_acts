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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify tan method propagates Double.NaN for a Double.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.tan(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathTan020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2000
     * @tc.desc Verify tan method returns Double.NaN for Double.POSITIVE_INFINITY and Double.NEGATIVE_INFINITY inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify tan method propagates Double.NaN for a widened Float.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify tan method returns Double.NaN for a widened Float.POSITIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.tan(0.4);
      let second: double = Math.tan(0.4);
      expect(first).assertEqual(second);
    });

    /**
     * @tc.name testMathTan031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3100
     * @tc.desc Verify tan method preserves positive zero for a byte zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0);
      let result: double = Math.tan(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTan032
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3200
     * @tc.desc Verify tan method returns the reference value for the byte maximum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 4.185891831851989);
    });

    /**
     * @tc.name testMathTan033
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3300
     * @tc.desc Verify tan method returns the reference value for the byte minimum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 1.0406148914328552);
    });

    /**
     * @tc.name testMathTan034
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3400
     * @tc.desc Verify tan method returns the reference value for a byte overflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(128);
      let result: double = Math.tan(inputValue);
      expect(inputValue).assertEqual(Int.toByte(-128));
      assertApproxDoubleResult(result, 1.0406148914328552);
    });

    /**
     * @tc.name testMathTan035
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3500
     * @tc.desc Verify tan method returns the reference value for a byte underflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-129);
      let result: double = Math.tan(inputValue);
      expect(inputValue).assertEqual(Int.toByte(127));
      assertApproxDoubleResult(result, 4.185891831851989);
    });

    /**
     * @tc.name testMathTan036
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3600
     * @tc.desc Verify tan method returns the reference value for a byte hexadecimal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0x0A);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 0.6483608274590867);
    });

    /**
     * @tc.name testMathTan037
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3700
     * @tc.desc Verify tan method returns the reference value for a byte octal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0o12);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 0.6483608274590867);
    });

    /**
     * @tc.name testMathTan038
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3800
     * @tc.desc Verify tan method returns the reference value for a normal byte source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(12);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -0.6358599286615807);
    });

    /**
     * @tc.name testMathTan039
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3900
     * @tc.desc Verify tan method accepts a byte negative marker source input within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-1);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -1.5574077246549023);
    });

    /**
     * @tc.name testMathTan040
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4000
     * @tc.desc Verify tan method returns the reference value for a byte representative source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(99);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -25.092534979676543);
    });

    /**
     * @tc.name testMathTan041
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4100
     * @tc.desc Verify tan method preserves positive zero for a short zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: double = Math.tan(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTan042
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4200
     * @tc.desc Verify tan method returns the reference value for the short maximum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 0.19089234430221488);
    });

    /**
     * @tc.name testMathTan043
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4300
     * @tc.desc Verify tan method returns the reference value for the short minimum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -2.4879651793076247);
    });

    /**
     * @tc.name testMathTan044
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4400
     * @tc.desc Verify tan method returns the reference value for a short overflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32768);
      let result: double = Math.tan(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-32768));
      assertApproxDoubleResult(result, -2.4879651793076247);
    });

    /**
     * @tc.name testMathTan045
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4500
     * @tc.desc Verify tan method returns the reference value for a short underflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32769);
      let result: double = Math.tan(inputValue);
      expect(inputValue).assertEqual(Int.toShort(32767));
      assertApproxDoubleResult(result, 0.19089234430221488);
    });

    /**
     * @tc.name testMathTan046
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4600
     * @tc.desc Verify tan method accepts a short unsigned upper mapping source input within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(65535);
      let result: double = Math.tan(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-1));
      assertApproxDoubleResult(result, -1.5574077246549023);
    });

    /**
     * @tc.name testMathTan047
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4700
     * @tc.desc Verify tan method returns the reference value for a short hexadecimal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0x7FF);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -3.8776938134850445);
    });

    /**
     * @tc.name testMathTan048
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4800
     * @tc.desc Verify tan method returns the reference value for a short octal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0o7777);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 15.12400361393254);
    });

    /**
     * @tc.name testMathTan049
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4900
     * @tc.desc Verify tan method returns the reference value for a positive short representative input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(2048);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -0.32962587674399735);
    });

    /**
     * @tc.name testMathTan050
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5000
     * @tc.desc Verify tan method returns the reference value for a normal short source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(100);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -0.5872139151569291);
    });

    /**
     * @tc.name testMathTan051
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5100
     * @tc.desc Verify tan method preserves positive zero for an int zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0;
      let result: double = Math.tan(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTan052
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5200
     * @tc.desc Verify tan method accepts an int negative marker source input within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = -1;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -1.5574077246549023);
    });

    /**
     * @tc.name testMathTan053
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5300
     * @tc.desc Verify tan method returns the reference value for the int minimum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 4.084289455298593);
    });

    /**
     * @tc.name testMathTan054
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5400
     * @tc.desc Verify tan method returns the reference value for the int maximum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 1.052377963735134);
    });

    /**
     * @tc.name testMathTan055
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5500
     * @tc.desc Verify tan method returns the reference value for an int value just below maximum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE - 1;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -0.19137297761576905);
    });

    /**
     * @tc.name testMathTan056
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5600
     * @tc.desc Verify tan method returns the reference value for an int value just above minimum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE + 1;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -1.052377963735134);
    });

    /**
     * @tc.name testMathTan057
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5700
     * @tc.desc Verify tan method returns the reference value for an int overflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: int = Int.MAX_VALUE;
      let inputValue: int = maximumValue + 1;
      let result: double = Math.tan(inputValue);
      expect(inputValue).assertEqual(Int.MIN_VALUE);
      assertApproxDoubleResult(result, 4.084289455298593);
    });

    /**
     * @tc.name testMathTan058
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5800
     * @tc.desc Verify tan method returns the reference value for an int underflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: int = Int.MIN_VALUE;
      let inputValue: int = minimumValue - 1;
      let result: double = Math.tan(inputValue);
      expect(inputValue).assertEqual(Int.MAX_VALUE);
      assertApproxDoubleResult(result, 1.052377963735134);
    });

    /**
     * @tc.name testMathTan059
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5900
     * @tc.desc Verify tan method returns the reference value for an int hexadecimal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0x1234;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 1.6211961246673752);
    });

    /**
     * @tc.name testMathTan060
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6000
     * @tc.desc Verify tan method returns the reference value for an int binary source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0b1010;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 0.6483608274590867);
    });

    /**
     * @tc.name testMathTan061
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6100
     * @tc.desc Verify tan method returns the reference value for an int octal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0o123;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 3.880596310384246);
    });

    /**
     * @tc.name testMathTan062
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6200
     * @tc.desc Verify tan method accepts a positive int representative threshold input within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 1000000;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -0.373624453987599);
    });

    /**
     * @tc.name testMathTan063
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6300
     * @tc.desc Verify tan method returns the reference value for a normal int source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 10000;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 0.32097113462381477);
    });

    /**
     * @tc.name testMathTan064
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6400
     * @tc.desc Verify tan method accepts a positive int one input within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 1;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 1.5574077246549023);
    });

    /**
     * @tc.name testMathTan065
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6500
     * @tc.desc Verify tan method preserves positive zero for a long zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(0);
      let result: double = Math.tan(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTan066
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6600
     * @tc.desc Verify tan method accepts a long negative marker source input within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(-1);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -1.5574077246549023);
    });

    /**
     * @tc.name testMathTan067
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6700
     * @tc.desc Verify tan method returns a large negative finite value for Long.MIN_VALUE input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: double = Math.tan(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result < -80.0).assertTrue();
      expect(result > -90.0).assertTrue();
    });

    /**
     * @tc.name testMathTan068
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6800
     * @tc.desc Verify tan method returns a large positive finite value for the long maximum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE;
      let result: double = Math.tan(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 80.0).assertTrue();
      expect(result < 90.0).assertTrue();
    });

    /**
     * @tc.name testMathTan069
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6900
     * @tc.desc Verify tan method remains stable for Long.MAX_VALUE minus one after double rounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE - Int.toLong(1);
      let result: double = Math.tan(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 80.0).assertTrue();
      expect(result < 90.0).assertTrue();
    });

    /**
     * @tc.name testMathTan070
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7000
     * @tc.desc Verify tan method remains stable for Long.MIN_VALUE plus one after double rounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE + Int.toLong(1);
      let result: double = Math.tan(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result < -80.0).assertTrue();
      expect(result > -90.0).assertTrue();
    });

    /**
     * @tc.name testMathTan071
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7100
     * @tc.desc Verify tan method returns the minimum-boundary behavior after long overflow conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let inputValue: long = maximumValue + Int.toLong(1);
      let result: double = Math.tan(inputValue);
      expect(inputValue).assertEqual(Long.MIN_VALUE);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result < -80.0).assertTrue();
      expect(result > -90.0).assertTrue();
    });

    /**
     * @tc.name testMathTan072
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7200
     * @tc.desc Verify tan method returns the maximum-boundary behavior after long underflow conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: long = Long.MIN_VALUE;
      let inputValue: long = minimumValue - Int.toLong(1);
      let result: double = Math.tan(inputValue);
      expect(inputValue).assertEqual(Long.MAX_VALUE);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 80.0).assertTrue();
      expect(result < 90.0).assertTrue();
    });

    /**
     * @tc.name testMathTan073
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7300
     * @tc.desc Verify tan method returns the reference value for a long hexadecimal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(0x1234);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 1.6211961246673752);
    });

    /**
     * @tc.name testMathTan074
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7400
     * @tc.desc Verify tan method returns the reference value for a long octal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(0o123);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 3.880596310384246);
    });

    /**
     * @tc.name testMathTan075
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7500
     * @tc.desc Verify tan method returns the reference value for a positive long representative input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(10000000000);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -0.5583496378112419);
    });

    /**
     * @tc.name testMathTan076
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7600
     * @tc.desc Verify tan method accepts a positive long one input within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(1);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 1.5574077246549023);
    });

    /**
     * @tc.name testMathTan077
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7700
     * @tc.desc Verify tan method returns the mirrored reference value for a negative long representative input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(-10000000000);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 0.5583496378112419);
    });

    /**
     * @tc.name testMathTan078
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7800
     * @tc.desc Verify tan method preserves positive zero for a float zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.0);
      let result: double = Math.tan(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTan079
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7900
     * @tc.desc Verify tan method returns the float-rounded reference value for a normal float source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(3.14);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -0.0015925500319664656);
    });

    /**
     * @tc.name testMathTan080
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8000
     * @tc.desc Verify tan method returns the mirrored float-rounded reference value for a negative fractional source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-99.99);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 0.6007449139346368);
    });

    /**
     * @tc.name testMathTan081
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8100
     * @tc.desc Verify tan method returns a finite reference value for direct Float.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -0.6117979498342481);
    });

    /**
     * @tc.name testMathTan082
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8200
     * @tc.desc Verify tan method preserves Float.MIN_VALUE for the smallest positive float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: double = Math.tan(inputValue);
      expect(result).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.name testMathTan083
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8300
     * @tc.desc Verify tan method preserves negative Float.MIN_VALUE for the smallest negative float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MIN_VALUE;
      let result: double = Math.tan(inputValue);
      expect(result).assertEqual(-Float.MIN_VALUE);
    });

    /**
     * @tc.name testMathTan084
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8400
     * @tc.desc Verify tan method returns Double.NaN for a widened Float.NEGATIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NEGATIVE_INFINITY;
      let result: double = Math.tan(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathTan085
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8500
     * @tc.desc Verify tan method returns Double.NaN for a float overflowed source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MAX_VALUE * 10.0);
      let result: double = Math.tan(inputValue);
      expect(inputValue).assertEqual(Float.POSITIVE_INFINITY);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathTan086
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8600
     * @tc.desc Verify tan method preserves positive zero for a float underflowed source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MIN_VALUE / 10.0);
      let result: double = Math.tan(inputValue);
      expect(inputValue).assertEqual(Double.toFloat(0.0));
      expect(Utils.isPositiveZero(inputValue)).assertTrue();
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTan087
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8700
     * @tc.desc Verify tan method preserves negative zero for a negative float underflowed source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-Float.MIN_VALUE / 10.0);
      let result: double = Math.tan(inputValue);
      expect(inputValue).assertEqual(Double.toFloat(-0.0));
      expect(Utils.isNegativeZero(inputValue)).assertTrue();
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTan088
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8800
     * @tc.desc Verify tan method returns the reference value for a float scientific notation source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0e3);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 1.4703241557027187);
    });

    /**
     * @tc.name testMathTan089
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8900
     * @tc.desc Verify tan method returns the float-rounded reference value for a representative fractional source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(99.99);
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -0.6007449139346368);
    });

    /**
     * @tc.name testMathTan090
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_9000
     * @tc.desc Verify tan method returns the reference value for a double representative fractional source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 999999.99;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -0.3850635268027442);
    });

    /**
     * @tc.name testMathTan091
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_9100
     * @tc.desc Verify tan method returns the reference value for a negative double representative fractional source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -888.88;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 0.1930675735830329);
    });

    /**
     * @tc.name testMathTan092
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_9200
     * @tc.desc Verify tan method returns a finite reference-near value for direct Double.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -0.004962015874444894);
    });

    /**
     * @tc.name testMathTan093
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_9300
     * @tc.desc Verify tan method preserves Double.MIN_VALUE for the smallest positive double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE;
      let result: double = Math.tan(inputValue);
      expect(result).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.name testMathTan094
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_9400
     * @tc.desc Verify tan method preserves negative Double.MIN_VALUE for the smallest negative double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE;
      let result: double = Math.tan(inputValue);
      expect(result).assertEqual(-Double.MIN_VALUE);
    });

    /**
     * @tc.name testMathTan095
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_9500
     * @tc.desc Verify tan method returns Double.NaN for a double overflowed source expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE * 2.0;
      let result: double = Math.tan(inputValue);
      expect(inputValue).assertEqual(Double.POSITIVE_INFINITY);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathTan096
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_9600
     * @tc.desc Verify tan method preserves positive zero for a double underflowed source expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE / 2.0;
      let result: double = Math.tan(inputValue);
      expect(inputValue).assertEqual(0.0);
      expect(Utils.isPositiveZero(inputValue)).assertTrue();
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTan097
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_9700
     * @tc.desc Verify tan method preserves negative zero for a negative double underflowed source expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE / 2.0;
      let result: double = Math.tan(inputValue);
      expect(inputValue).assertEqual(-0.0);
      expect(Utils.isNegativeZero(inputValue)).assertTrue();
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTan098
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_9800
     * @tc.desc Verify tan method returns the reference value for the double safe integer boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 9007199254740991.0;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, 0.01395068194141697);
    });

    /**
     * @tc.name testMathTan099
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_9900
     * @tc.desc Verify tan method accepts a double scientific notation source input within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0e6;
      let result: double = Math.tan(inputValue);
      assertApproxDoubleResult(result, -0.373624453987599);
    });
  });
}
