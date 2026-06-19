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

function assertApproxFloatResult(result: float, expected: double): void {
  let expectedFloat: float = Double.toFloat(expected);
  let diff: double = Utils.getAbsDiff(result, expectedFloat);
  expect(Utils.isFiniteFloat(result)).assertTrue();
  expect(diff < 1.0e-5).assertTrue();
}

function buildSinhNumberFromHelper(): number {
  return 0.5;
}

export default function mathSinhTest(): void {
  describe('MathSinhTest', (): void => {
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
     * @tc.name testMathSinh001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0100
     * @tc.desc Verify sinh method preserves positive zero for a positive zero double input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSinh002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0200
     * @tc.desc Verify sinh method preserves negative zero for a negative zero double input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(-0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSinh003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0300
     * @tc.desc Verify sinh method preserves positive zero for a positive zero float input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.0);
      let result: float = Math.sinh(input);
      expect(result).assertEqual(Double.toFloat(0.0));
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSinh004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0400
     * @tc.desc Verify sinh method preserves negative zero for a negative zero float input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-0.0);
      let result: float = Math.sinh(input);
      expect(result).assertEqual(Double.toFloat(-0.0));
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSinh005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0500
     * @tc.desc Verify sinh method returns the expected finite value for a positive double input of one-half
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.5;
      let result: double = Math.sinh(input);
      let expected: double = (Math.exp(input) - Math.exp(-input)) / 2.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathSinh006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0600
     * @tc.desc Verify sinh method returns the expected finite value for a negative double input of one-half
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(-0.5);
      let diff: double = Utils.getAbsDiff(result, -0.5210953054937474);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathSinh007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0700
     * @tc.desc Verify sinh method returns the expected finite value for a positive double input of one
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.0;
      let result: double = Math.sinh(input);
      let expected: double = (Math.exp(input) - Math.exp(-input)) / 2.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathSinh008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0800
     * @tc.desc Verify sinh method returns the expected finite value for a negative double input of one
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(-1.0);
      let diff: double = Utils.getAbsDiff(result, -1.1752011936438014);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathSinh009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0900
     * @tc.desc Verify sinh method returns the expected finite value for a positive double input of two
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.0;
      let result: double = Math.sinh(input);
      let expected: double = (Math.exp(input) - Math.exp(-input)) / 2.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathSinh010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1000
     * @tc.desc Verify sinh method returns the expected finite value for a negative double input of two
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(-2.0);
      let diff: double = Utils.getAbsDiff(result, -3.626860407847019);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathSinh011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1100
     * @tc.desc Verify sinh method follows the small-angle approximation for a tiny positive double input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.0e-8;
      let result: double = Math.sinh(input);
      let diff: double = Utils.getAbsDiff(result, input);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathSinh012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1200
     * @tc.desc Verify sinh method follows the small-angle approximation for a tiny negative double input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -1.0e-8;
      let result: double = Math.sinh(input);
      let diff: double = Utils.getAbsDiff(result, input);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathSinh013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1300
     * @tc.desc Verify sinh method preserves the smallest positive subnormal magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(Double.MIN_VALUE);
      expect(result).assertEqual(Double.MIN_VALUE);
      expect(result > 0.0).assertTrue();
    });

    /**
     * @tc.name testMathSinh014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1400
     * @tc.desc Verify sinh method is odd for mirrored finite double inputs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveResult: double = Math.sinh(1.25);
      let negativeResult: double = Math.sinh(-1.25);
      let diff: double = Utils.getAbsDiff(negativeResult, -positiveResult);
      expect(diff < 1.0e-5).assertTrue();
    });

    /**
     * @tc.name testMathSinh015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1500
     * @tc.desc Verify sinh method is monotonic for ordered positive finite inputs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smaller: double = Math.sinh(1.0);
      let larger: double = Math.sinh(2.0);
      expect(smaller < larger).assertTrue();
    });

    /**
     * @tc.name testMathSinh016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1600
     * @tc.desc Verify sinh method matches the exponential definition for a moderate finite input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.0;
      let lhs: double = Math.sinh(input);
      let rhs: double = (Math.exp(input) - Math.exp(-input)) / 2.0;
      let diff: double = Utils.getAbsDiff(lhs, rhs);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathSinh017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1700
     * @tc.desc Verify sinh method overflows to positive infinity for a large positive double input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(1000.0);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1800
     * @tc.desc Verify sinh method overflows to negative infinity for a large negative double input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(-1000.0);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1900
     * @tc.desc Verify sinh method propagates NaN for a double NaN input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSinh020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2000
     * @tc.desc Verify sinh method returns positive infinity for a positive infinity double input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2100
     * @tc.desc Verify sinh method returns negative infinity for a negative infinity double input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(Double.NEGATIVE_INFINITY);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2200
     * @tc.desc Verify sinh method accepts a number typed helper input that evaluates to one-half
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildSinhNumberFromHelper();
      let result: number = Math.sinh(input);
      let diff: number = Utils.getAbsDiff(result, 0.5210953054937474);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathSinh023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2300
     * @tc.desc Verify sinh method accepts a widened float finite input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.5);
      let result: float = Math.sinh(input);
      assertApproxFloatResult(result, 0.5210953054937474);
    });

    /**
     * @tc.name testMathSinh024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2400
     * @tc.desc Verify sinh method overflows to positive infinity for a large positive float input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(100.0);
      let result: float = Math.sinh(input);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2500
     * @tc.desc Verify sinh method overflows to negative infinity for a large negative float input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-100.0);
      let result: float = Math.sinh(input);
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2600
     * @tc.desc Verify sinh method propagates NaN for a float NaN input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NaN;
      let result: float = Math.sinh(input);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });

    /**
     * @tc.name testMathSinh027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2700
     * @tc.desc Verify sinh method accepts a widened byte input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(1);
      let result: double = Math.sinh(input);
      let expected: double = Math.sinh(1.0);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathSinh028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2800
     * @tc.desc Verify sinh method accepts a widened short input and preserves the expected sign after widening
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-1);
      let result: double = Math.sinh(input);
      expect(result < 0.0).assertTrue();
    });

    /**
     * @tc.name testMathSinh029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2900
     * @tc.desc Verify sinh method accepts a widened int input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 2;
      let result: double = Math.sinh(input);
      let expected: double = Math.sinh(2.0);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathSinh030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3000
     * @tc.desc Verify sinh method accepts a widened long input and preserves the expected sign after widening
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(-2);
      let result: double = Math.sinh(input);
      expect(result < 0.0).assertTrue();
    });

    /**
     * @tc.name testMathSinh031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3100
     * @tc.desc Verify sinh method produces a positive finite value for the Math.PI constant input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(Math.PI);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > Math.PI).assertTrue();
    });

    /**
     * @tc.name testMathSinh032
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3200
     * @tc.desc Verify sinh method remains stable across repeated calls with the same finite input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSinh032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.sinh(0.5);
      let second: double = Math.sinh(0.5);
      expect(first).assertEqual(second);
    });
  });
}
