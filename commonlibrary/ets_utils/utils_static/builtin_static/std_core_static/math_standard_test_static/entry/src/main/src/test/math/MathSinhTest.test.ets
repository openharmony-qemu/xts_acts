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

function assertApproxFloatResult(result: float, expected: double): void {
  let expectedFloat: float = Double.toFloat(expected);
  let diff: double = Utils.getAbsDiff(result, expectedFloat);
  expect(Utils.isFiniteFloat(result)).assertTrue();
  expect(diff < 1.0e-5).assertTrue();
}

function assertApproxDoubleResult(result: double, expected: double): void {
  let relativeDiff: double = Utils.getRelativeDiff(result, expected);
  expect(relativeDiff < 1.0e-12).assertTrue();
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(-0.5);
      assertApproxDoubleResult(result, -0.5210953054937474);
    });

    /**
     * @tc.name testMathSinh007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0700
     * @tc.desc Verify sinh method returns the expected finite value for a positive double input of one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(-1.0);
      assertApproxDoubleResult(result, -1.1752011936438014);
    });

    /**
     * @tc.name testMathSinh009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0900
     * @tc.desc Verify sinh method returns the expected finite value for a positive double input of two
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(-2.0);
      assertApproxDoubleResult(result, -3.626860407847019);
    });

    /**
     * @tc.name testMathSinh011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1100
     * @tc.desc Verify sinh method follows the small-angle approximation for a tiny positive double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify sinh method overflows to Double.POSITIVE_INFINITY for a large positive double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(1000.0);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1800
     * @tc.desc Verify sinh method overflows to Double.NEGATIVE_INFINITY for a large negative double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(-1000.0);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1900
     * @tc.desc Verify sinh method propagates Double.NaN for a Double.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSinh020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2000
     * @tc.desc Verify sinh method returns Double.POSITIVE_INFINITY for a Double.POSITIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2100
     * @tc.desc Verify sinh method returns Double.NEGATIVE_INFINITY for a Double.NEGATIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify sinh method overflows to Float.POSITIVE_INFINITY for a large positive float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify sinh method overflows to Float.NEGATIVE_INFINITY for a large negative float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify sinh method propagates Float.NaN for a Float.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify sinh method returns the expected reference value for the Math.PI constant input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sinh(Math.PI);
      assertApproxDoubleResult(result, 11.548739357257746);
    });

    /**
     * @tc.name testMathSinh032
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3200
     * @tc.desc Verify sinh method remains stable across repeated calls with the same finite input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.sinh(0.5);
      let second: double = Math.sinh(0.5);
      expect(first).assertEqual(second);
    });

    /**
     * @tc.name testMathSinh033
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3300
     * @tc.desc Verify sinh method preserves positive zero for a byte zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0);
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSinh034
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3400
     * @tc.desc Verify sinh method accepts the byte maximum boundary input and returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh035
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3500
     * @tc.desc Verify sinh method accepts the byte minimum boundary input and returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh036
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3600
     * @tc.desc Verify sinh method accepts a byte overflow conversion input and returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127 + 1);
      let result: double = Math.sinh(inputValue);
      expect(inputValue).assertEqual(Int.toByte(-128));
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh037
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3700
     * @tc.desc Verify sinh method accepts a byte underflow conversion input and returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128 - 1);
      let result: double = Math.sinh(inputValue);
      expect(inputValue).assertEqual(Int.toByte(127));
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh038
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3800
     * @tc.desc Verify sinh method accepts a byte hexadecimal source input and keeps a finite result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0x0A);
      let result: double = Math.sinh(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 0.0).assertTrue();
    });

    /**
     * @tc.name testMathSinh039
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3900
     * @tc.desc Verify sinh method preserves positive zero for a short zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSinh040
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4000
     * @tc.desc Verify sinh method accepts the short maximum boundary input and returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh041
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4100
     * @tc.desc Verify sinh method accepts the short minimum boundary input and returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh042
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4200
     * @tc.desc Verify sinh method accepts a short overflow conversion input and returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767 + 1);
      let result: double = Math.sinh(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-32768));
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh043
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4300
     * @tc.desc Verify sinh method accepts a short underflow conversion input and returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768 - 1);
      let result: double = Math.sinh(inputValue);
      expect(inputValue).assertEqual(Int.toShort(32767));
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh044
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4400
     * @tc.desc Verify sinh method accepts a short hexadecimal source input and returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0x1234);
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh045
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4500
     * @tc.desc Verify sinh method preserves positive zero for an int zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0;
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSinh046
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4600
     * @tc.desc Verify sinh method accepts a positive int one input and matches the explicit float overload result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 1;
      let result: double = Math.sinh(inputValue);
      let expected: double = Math.sinh(Double.toFloat(1.0));
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name testMathSinh047
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4700
     * @tc.desc Verify sinh method accepts a negative int one input and matches the explicit float overload result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = -1;
      let result: double = Math.sinh(inputValue);
      let expected: double = Math.sinh(Double.toFloat(-1.0));
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name testMathSinh048
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4800
     * @tc.desc Verify sinh method accepts the int maximum boundary input and returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE;
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh049
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4900
     * @tc.desc Verify sinh method accepts the int minimum boundary input and returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE;
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh050
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5000
     * @tc.desc Verify sinh method accepts an int value just below maximum and returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE - 1;
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh051
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5100
     * @tc.desc Verify sinh method accepts an int value just above minimum and returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE + 1;
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh052
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5200
     * @tc.desc Verify sinh method accepts an int overflow conversion input and returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: int = Int.MAX_VALUE;
      let inputValue: int = maximumValue + 1;
      let result: double = Math.sinh(inputValue);
      expect(inputValue).assertEqual(Int.MIN_VALUE);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh053
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5300
     * @tc.desc Verify sinh method accepts an int underflow conversion input and returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: int = Int.MIN_VALUE;
      let inputValue: int = minimumValue - 1;
      let result: double = Math.sinh(inputValue);
      expect(inputValue).assertEqual(Int.MAX_VALUE);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh054
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5400
     * @tc.desc Verify sinh method accepts an int binary source input and keeps a finite result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0b1010;
      let result: double = Math.sinh(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 0.0).assertTrue();
    });

    /**
     * @tc.name testMathSinh055
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5500
     * @tc.desc Verify sinh method accepts a negative int octal source input and returns a finite negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = -0o123;
      let result: double = Math.sinh(inputValue);
      let expected: double = Math.sinh(Double.toFloat(-83.0));
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result < 0.0).assertTrue();
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name testMathSinh056
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5600
     * @tc.desc Verify sinh method preserves positive zero for a long zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(0);
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSinh057
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5700
     * @tc.desc Verify sinh method accepts a positive long one input and matches the explicit float overload result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(1);
      let result: double = Math.sinh(inputValue);
      let expected: double = Math.sinh(Double.toFloat(1.0));
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name testMathSinh058
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5800
     * @tc.desc Verify sinh method accepts a negative long one input and matches the explicit float overload result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(-1);
      let result: double = Math.sinh(inputValue);
      let expected: double = Math.sinh(Double.toFloat(-1.0));
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name testMathSinh059
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5900
     * @tc.desc Verify sinh method accepts the long maximum boundary input and returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE;
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh060
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6000
     * @tc.desc Verify sinh method accepts Long.MIN_VALUE input and returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh061
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6100
     * @tc.desc Verify sinh method accepts Long.MAX_VALUE minus one and returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE - Int.toLong(1);
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh062
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6200
     * @tc.desc Verify sinh method accepts Long.MIN_VALUE plus one and returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE + Int.toLong(1);
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh063
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6300
     * @tc.desc Verify sinh method accepts a long overflow conversion input and returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let inputValue: long = maximumValue + Int.toLong(1);
      let result: double = Math.sinh(inputValue);
      expect(inputValue).assertEqual(Long.MIN_VALUE);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh064
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6400
     * @tc.desc Verify sinh method accepts a long underflow conversion input and returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: long = Long.MIN_VALUE;
      let inputValue: long = minimumValue - Int.toLong(1);
      let result: double = Math.sinh(inputValue);
      expect(inputValue).assertEqual(Long.MAX_VALUE);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh065
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6500
     * @tc.desc Verify sinh method accepts a long hexadecimal source input and returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(0x1234);
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh066
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6600
     * @tc.desc Verify sinh method accepts the float maximum boundary input and returns Float.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      let result: float = Math.sinh(inputValue);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh067
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6700
     * @tc.desc Verify sinh method accepts the negative float maximum boundary input and returns Float.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MAX_VALUE;
      let result: float = Math.sinh(inputValue);
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh068
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6800
     * @tc.desc Verify sinh method preserves the float minimum positive boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: float = Math.sinh(inputValue);
      expect(result).assertEqual(Float.MIN_VALUE);
      expect(result > Double.toFloat(0.0)).assertTrue();
    });

    /**
     * @tc.name testMathSinh069
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6900
     * @tc.desc Verify sinh method preserves the negative float minimum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MIN_VALUE;
      let result: float = Math.sinh(inputValue);
      expect(result).assertEqual(-Float.MIN_VALUE);
      expect(result < Double.toFloat(0.0)).assertTrue();
    });

    /**
     * @tc.name testMathSinh070
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_7000
     * @tc.desc Verify sinh method returns Float.POSITIVE_INFINITY for a Float.POSITIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.POSITIVE_INFINITY;
      let result: float = Math.sinh(inputValue);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh071
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_7100
     * @tc.desc Verify sinh method returns Float.NEGATIVE_INFINITY for a Float.NEGATIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NEGATIVE_INFINITY;
      let result: float = Math.sinh(inputValue);
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh072
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_7200
     * @tc.desc Verify sinh method accepts a float source overflowed to Float.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MAX_VALUE * 10.0);
      let result: float = Math.sinh(inputValue);
      expect(inputValue).assertEqual(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh073
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_7300
     * @tc.desc Verify sinh method preserves positive zero for a float source underflowed to zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MIN_VALUE / 10.0);
      let result: float = Math.sinh(inputValue);
      expect(inputValue).assertEqual(Double.toFloat(0.0));
      expect(result).assertEqual(Double.toFloat(0.0));
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSinh074
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_7400
     * @tc.desc Verify sinh method preserves negative zero for a float source underflowed to negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-Float.MIN_VALUE / 10.0);
      let result: float = Math.sinh(inputValue);
      expect(inputValue).assertEqual(Double.toFloat(-0.0));
      expect(result).assertEqual(Double.toFloat(-0.0));
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSinh075
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_7500
     * @tc.desc Verify sinh method accepts Double.MAX_VALUE and returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE;
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh076
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_7600
     * @tc.desc Verify sinh method accepts negative Double.MAX_VALUE and returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MAX_VALUE;
      let result: double = Math.sinh(inputValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathSinh077
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_7700
     * @tc.desc Verify sinh method preserves positive zero for a double source underflowed to zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE / 2.0;
      let result: double = Math.sinh(inputValue);
      expect(inputValue).assertEqual(0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSinh078
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_7800
     * @tc.desc Verify sinh method preserves negative zero for a double source underflowed to negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE / 2.0;
      let result: double = Math.sinh(inputValue);
      expect(inputValue).assertEqual(-0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSinh079
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_7900
     * @tc.desc Verify sinh method accepts a helper returned positive value plus SQRT1_2 expression within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: number = buildSinhNumberFromHelper() + Math.SQRT1_2;
      let result: number = Math.sinh(inputValue);
      assertApproxDoubleResult(result, 1.5223675154960941);
    });

    /**
     * @tc.name testMathSinh080
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_8000
     * @tc.desc Verify sinh method accepts a helper returned negative value minus SQRT1_2 expression within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: number = -buildSinhNumberFromHelper() - Math.SQRT1_2;
      let result: number = Math.sinh(inputValue);
      assertApproxDoubleResult(result, -1.5223675154960941);
    });

    /**
     * @tc.name testMathSinh081
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_8100
     * @tc.desc Verify sinh method remains odd for Math.max mirrored expression sources
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInput: double = Math.max(0.25, 0.75);
      let negativeInput: double = -Math.max(0.25, 0.75);
      let positiveResult: double = Math.sinh(positiveInput);
      let negativeResult: double = Math.sinh(negativeInput);
      let diff: double = Utils.getAbsDiff(negativeResult, -positiveResult);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.name testMathSinh082
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_8200
     * @tc.desc Verify sinh method accepts a Math.min expression source and returns the expected reference value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Math.min(-1.25, 2.0);
      let result: double = Math.sinh(inputValue);
      assertApproxDoubleResult(result, -1.6019190803008256);
    });

    /**
     * @tc.name testMathSinh083
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_8300
     * @tc.desc Verify sinh method matches the exponential definition for a negative fractional double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.75;
      let result: double = Math.sinh(inputValue);
      let expected: double = (Math.exp(inputValue) - Math.exp(-inputValue)) / 2.0;
      assertApproxDoubleResult(result, expected);
    });

    /**
     * @tc.name testMathSinh084
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_8400
     * @tc.desc Verify sinh method keeps odd symmetry for mirrored finite double inputs within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInput: double = 3.0;
      let negativeInput: double = -3.0;
      let positiveResult: double = Math.sinh(positiveInput);
      let negativeResult: double = Math.sinh(negativeInput);
      assertApproxDoubleResult(positiveResult, 10.017874927409903);
      assertApproxDoubleResult(negativeResult, -positiveResult);
    });

  });
}
