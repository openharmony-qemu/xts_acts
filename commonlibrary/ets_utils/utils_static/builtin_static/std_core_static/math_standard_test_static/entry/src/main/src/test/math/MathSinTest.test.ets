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

function buildSinNumberFromHelper(): number {
  return Math.PI / 6.0;
}

export default function mathSinTest(): void {
  describe('MathSinTest', (): void => {
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
     * @tc.name testMathSin001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0100
     * @tc.desc Verify sin method preserves positive zero for a positive zero input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0200
     * @tc.desc Verify sin method preserves negative zero for a negative zero input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(-0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0300
     * @tc.desc Verify sin method returns one-half for the PI over six standard angle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Math.PI / 6.0);
      let diff: double = Utils.getAbsDiff(result, 0.5);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSin004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0400
     * @tc.desc Verify sin method returns square-root-one-half for the PI over four standard angle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Math.PI / 4.0);
      let diff: double = Utils.getAbsDiff(result, Math.SQRT1_2);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSin005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0500
     * @tc.desc Verify sin method returns one for the PI over two standard angle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Math.PI / 2.0);
      let diff: double = Utils.getAbsDiff(result, 1.0);
      expect(diff < 1.0e-15).assertTrue();
    });
    /**
     * @tc.name testMathSin006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0600
     * @tc.desc Verify sin method returns a near-zero value for PI
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Math.PI);
      expect(result > -1.0e-15).assertTrue();
      expect(result < 1.0e-15).assertTrue();
    });
    /**
     * @tc.name testMathSin007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0700
     * @tc.desc Verify sin method returns negative one for three PI over two
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(1.5 * Math.PI);
      let diff: double = Utils.getAbsDiff(result, -1.0);
      expect(diff < 1.0e-15).assertTrue();
    });
    /**
     * @tc.name testMathSin008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0800
     * @tc.desc Verify sin method returns a near-zero value after one full period
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(2.0 * Math.PI);
      expect(result > -1.0e-15).assertTrue();
      expect(result < 1.0e-15).assertTrue();
    });
    /**
     * @tc.name testMathSin009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0900
     * @tc.desc Verify sin method returns negative one-half for the negated PI over six standard angle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(-Math.PI / 6.0);
      let diff: double = Utils.getAbsDiff(result, -0.5);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSin010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1000
     * @tc.desc Verify sin method is odd for mirrored nonzero finite inputs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveResult: double = Math.sin(0.5);
      let negativeResult: double = Math.sin(-0.5);
      let diff: double = Utils.getAbsDiff(negativeResult, -positiveResult);
      expect(diff < 1.0e-15).assertTrue();
    });
    /**
     * @tc.name testMathSin011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1100
     * @tc.desc Verify sin method is periodic across inputs separated by two PI
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
    */
    it('testMathSin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.7;
      let baseAngleResult: double = Math.sin(x);
      let shiftedAngleResult: double = Math.sin(x + 2.0 * Math.PI);
      let diff: double = Utils.getAbsDiff(baseAngleResult, shiftedAngleResult);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSin012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1200
     * @tc.desc Verify sin method with cosine keeps the Pythagorean sum of squares within tolerance of one
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.7;
      let sine: double = Math.sin(x);
      let cosine: double = Math.cos(x);
      let sum: double = sine * sine + cosine * cosine;
      let diff: double = Utils.getAbsDiff(sum, 1.0);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSin013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1300
     * @tc.desc Verify sin method follows the small-angle approximation for a tiny finite input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.0e-8;
      let result: double = Math.sin(input);
      let diff: double = Utils.getAbsDiff(result, input);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSin014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1400
     * @tc.desc Verify sin method preserves the smallest positive subnormal magnitude
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Double.MIN_VALUE);
      let diff: double = Utils.getAbsDiff(result, Double.MIN_VALUE);
      expect(diff == 0.0).assertTrue();
      expect(result > 0.0).assertTrue();
    });
    /**
     * @tc.name testMathSin015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1500
     * @tc.desc Verify sin method keeps an extremely large finite input within the closed range from minus one to one
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Double.MAX_VALUE);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result >= -1.0).assertTrue();
      expect(result <= 1.0).assertTrue();
    });
    /**
     * @tc.name testMathSin016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1600
     * @tc.desc Verify sin method propagates NaN for a NaN input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1700
     * @tc.desc Verify sin method returns NaN for positive infinity input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Double.POSITIVE_INFINITY);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1800
     * @tc.desc Verify sin method returns NaN for negative infinity input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Double.NEGATIVE_INFINITY);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1900
     * @tc.desc Verify sin method accepts a number typed helper input that evaluates to PI over six
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildSinNumberFromHelper();
      let result: number = Math.sin(input);
      let diff: number = Utils.getAbsDiff(result, 0.5);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSin020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_2000
     * @tc.desc Verify sin method accepts a widened float finite input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.5);
      let result: double = Math.sin(input);
      let diff: double = Utils.getAbsDiff(result, 0.479425538604203);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.name testMathSin021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_2100
     * @tc.desc Verify sin method preserves negative zero for a widened float negative zero input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-0.0);
      let result: double = Math.sin(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_2200
     * @tc.desc Verify sin method propagates NaN for a widened float NaN input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NaN;
      let result: double = Math.sin(input);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_2300
     * @tc.desc Verify sin method returns NaN for a widened float positive infinity input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.POSITIVE_INFINITY;
      let result: double = Math.sin(input);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_2400
     * @tc.desc Verify sin method accepts a widened byte input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(1);
      let result: double = Math.sin(input);
      let diff: double = Utils.getAbsDiff(result, 0.8414709848078965);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSin025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_2500
     * @tc.desc Verify sin method accepts a widened short input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-1);
      let result: double = Math.sin(input);
      let diff: double = Utils.getAbsDiff(result, -0.8414709848078965);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSin026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_2600
     * @tc.desc Verify sin method accepts a widened int input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 2;
      let result: double = Math.sin(input);
      let diff: double = Utils.getAbsDiff(result, 0.9092974268256817);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSin027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_2700
     * @tc.desc Verify sin method accepts a widened long input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(-2);
      let result: double = Math.sin(input);
      let diff: double = Utils.getAbsDiff(result, -0.9092974268256817);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSin028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_2800
     * @tc.desc Verify sin method returns the expected value for the Math.E constant input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Math.E);
      let diff: double = Utils.getAbsDiff(result, 0.41078129050290885);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSin029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_2900
     * @tc.desc Verify sin method supports degree to radian conversion for a thirty degree input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let radians: double = 30.0 * Math.PI / 180.0;
      let result: double = Math.sin(radians);
      let diff: double = Utils.getAbsDiff(result, 0.5);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSin030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_3000
     * @tc.desc Verify sin method remains stable across repeated calls with the same finite input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.sin(0.5);
      let second: double = Math.sin(0.5);
      expect(first).assertEqual(second);
    });
  });
}
