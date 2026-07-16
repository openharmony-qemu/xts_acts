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

function buildSinNumberFromHelper(): number {
  return Math.PI / 6.0;
}

function expectSinReference(actual: double, expected: double, tolerance: double): void {
  let difference: double = Utils.getAbsDiff(actual, expected);
  expect(difference < tolerance).assertTrue();
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Double.MIN_VALUE);
      let diff: double = Utils.getAbsDiff(result, Double.MIN_VALUE);
      expect(diff).assertEqual(0.0);
      expect(result > 0.0).assertTrue();
    });
    /**
     * @tc.name testMathSin015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1500
     * @tc.desc Verify sin method returns a finite reference-near value for an extremely large finite input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Double.MAX_VALUE);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expectSinReference(result, 0.004961954789184062, 1.0e-12);
    });
    /**
     * @tc.name testMathSin016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1600
     * @tc.desc Verify sin method propagates Double.NaN for a Double.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1700
     * @tc.desc Verify sin method returns Double.NaN for Double.POSITIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Double.POSITIVE_INFINITY);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1800
     * @tc.desc Verify sin method returns Double.NaN for Double.NEGATIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify sin method propagates Double.NaN for a widened Float.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify sin method returns Double.NaN for a widened Float.POSITIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.sin(0.5);
      let second: double = Math.sin(0.5);
      expect(first).assertEqual(second);
    });
    /**
     * @tc.name testMathSin031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_3100
     * @tc.desc Verify sin method preserves positive zero for a byte zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0);
      let result: double = Math.sin(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin032
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_3200
     * @tc.desc Verify sin method returns the reference value for the byte maximum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, 0.972630067242408, 1.0e-12);
    });
    /**
     * @tc.name testMathSin033
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_3300
     * @tc.desc Verify sin method returns the reference value for the byte minimum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.7210377105017316, 1.0e-12);
    });
    /**
     * @tc.name testMathSin034
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_3400
     * @tc.desc Verify sin method returns the reference value for a byte overflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127 + 1);
      let result: double = Math.sin(inputValue);
      expect(inputValue).assertEqual(Int.toByte(-128));
      expectSinReference(result, -0.7210377105017316, 1.0e-12);
    });
    /**
     * @tc.name testMathSin035
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_3500
     * @tc.desc Verify sin method returns the reference value for a byte underflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128 - 1);
      let result: double = Math.sin(inputValue);
      expect(inputValue).assertEqual(Int.toByte(127));
      expectSinReference(result, 0.972630067242408, 1.0e-12);
    });
    /**
     * @tc.name testMathSin036
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_3600
     * @tc.desc Verify sin method returns the reference value for a byte hexadecimal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0x0A);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.5440211108893698, 1.0e-12);
    });
    /**
     * @tc.name testMathSin037
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_3700
     * @tc.desc Verify sin method returns the reference value for a byte octal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0o12);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.5440211108893698, 1.0e-12);
    });
    /**
     * @tc.name testMathSin038
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_3800
     * @tc.desc Verify sin method returns the reference value for a positive byte representative input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(99);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.9992068341863537, 1.0e-12);
    });
    /**
     * @tc.name testMathSin039
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_3900
     * @tc.desc Verify sin method preserves positive zero for a short zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: double = Math.sin(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin040
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_4000
     * @tc.desc Verify sin method returns the reference value for the short maximum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, 0.18750655394138943, 1.0e-12);
    });
    /**
     * @tc.name testMathSin041
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_4100
     * @tc.desc Verify sin method returns the reference value for the short minimum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.9278563334139247, 1.0e-12);
    });
    /**
     * @tc.name testMathSin042
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_4200
     * @tc.desc Verify sin method returns the reference value for a short overflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767 + 1);
      let result: double = Math.sin(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-32768));
      expectSinReference(result, -0.9278563334139247, 1.0e-12);
    });
    /**
     * @tc.name testMathSin043
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_4300
     * @tc.desc Verify sin method returns the reference value for a short underflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768 - 1);
      let result: double = Math.sin(inputValue);
      expect(inputValue).assertEqual(Int.toShort(32767));
      expectSinReference(result, 0.18750655394138943, 1.0e-12);
    });
    /**
     * @tc.name testMathSin044
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_4400
     * @tc.desc Verify sin method returns the reference value for a short hexadecimal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0x1234);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.8511093205849777, 1.0e-12);
    });
    /**
     * @tc.name testMathSin045
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_4500
     * @tc.desc Verify sin method returns the reference value for a short octal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0o7777);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.9978212103769744, 1.0e-12);
    });
    /**
     * @tc.name testMathSin046
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_4600
     * @tc.desc Verify sin method returns the reference value for a positive short representative input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(2048);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.31305701279012343, 1.0e-12);
    });
    /**
     * @tc.name testMathSin047
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_4700
     * @tc.desc Verify sin method preserves positive zero for an int zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0;
      let result: double = Math.sin(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin048
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_4800
     * @tc.desc Verify sin method returns the reference value for the int maximum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE;
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.7249165551445563, 1.0e-12);
    });
    /**
     * @tc.name testMathSin049
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_4900
     * @tc.desc Verify sin method returns the reference value for the int minimum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE;
      let result: double = Math.sin(inputValue);
      expectSinReference(result, 0.9713101757929392, 1.0e-12);
    });
    /**
     * @tc.name testMathSin050
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_5000
     * @tc.desc Verify sin method returns the reference value for an int value just below maximum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE - 1;
      let result: double = Math.sin(inputValue);
      expectSinReference(result, 0.18796200317975467, 1.0e-12);
    });
    /**
     * @tc.name testMathSin051
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_5100
     * @tc.desc Verify sin method returns the reference value for an int value just above minimum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE + 1;
      let result: double = Math.sin(inputValue);
      expectSinReference(result, 0.7249165551445563, 1.0e-12);
    });
    /**
     * @tc.name testMathSin052
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_5200
     * @tc.desc Verify sin method returns the reference value for an int overflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: int = Int.MAX_VALUE;
      let inputValue: int = maximumValue + 1;
      let result: double = Math.sin(inputValue);
      expect(inputValue).assertEqual(Int.MIN_VALUE);
      expectSinReference(result, 0.9713101757929392, 1.0e-12);
    });
    /**
     * @tc.name testMathSin053
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_5300
     * @tc.desc Verify sin method returns the reference value for an int underflow conversion input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: int = Int.MIN_VALUE;
      let inputValue: int = minimumValue - 1;
      let result: double = Math.sin(inputValue);
      expect(inputValue).assertEqual(Int.MAX_VALUE);
      expectSinReference(result, -0.7249165551445563, 1.0e-12);
    });
    /**
     * @tc.name testMathSin054
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_5400
     * @tc.desc Verify sin method returns the reference value for an int hexadecimal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0x1234;
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.8511093205849777, 1.0e-12);
    });
    /**
     * @tc.name testMathSin055
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_5500
     * @tc.desc Verify sin method returns the reference value for an int binary source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0b1010;
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.5440211108893698, 1.0e-12);
    });
    /**
     * @tc.name testMathSin056
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_5600
     * @tc.desc Verify sin method returns the reference value for a negative int octal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = -0o123;
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.9683644611001854, 1.0e-12);
    });
    /**
     * @tc.name testMathSin057
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_5700
     * @tc.desc Verify sin method returns the reference value for a positive int representative threshold input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 1000000;
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.34999350217129294, 1.0e-12);
    });
    /**
     * @tc.name testMathSin058
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_5800
     * @tc.desc Verify sin method preserves positive zero for a long zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(0);
      let result: double = Math.sin(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin059
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_5900
     * @tc.desc Verify sin method returns a finite positive value near one for the long maximum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE;
      let result: double = Math.sin(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 0.9999).assertTrue();
      expect(result < 1.0).assertTrue();
    });
    /**
     * @tc.name testMathSin060
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_6000
     * @tc.desc Verify sin method returns a finite negative value near minus one for Long.MIN_VALUE input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: double = Math.sin(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result < -0.9999).assertTrue();
      expect(result > -1.0).assertTrue();
    });
    /**
     * @tc.name testMathSin061
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_6100
     * @tc.desc Verify sin method remains stable for Long.MAX_VALUE minus one after double rounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE - Int.toLong(1);
      let result: double = Math.sin(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 0.9999).assertTrue();
      expect(result < 1.0).assertTrue();
    });
    /**
     * @tc.name testMathSin062
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_6200
     * @tc.desc Verify sin method remains stable for Long.MIN_VALUE plus one after double rounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE + Int.toLong(1);
      let result: double = Math.sin(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result < -0.9999).assertTrue();
      expect(result > -1.0).assertTrue();
    });
    /**
     * @tc.name testMathSin063
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_6300
     * @tc.desc Verify sin method returns the negative minimum-boundary behavior after long overflow conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let inputValue: long = maximumValue + Int.toLong(1);
      let result: double = Math.sin(inputValue);
      expect(inputValue).assertEqual(Long.MIN_VALUE);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result < -0.9999).assertTrue();
      expect(result > -1.0).assertTrue();
    });
    /**
     * @tc.name testMathSin064
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_6400
     * @tc.desc Verify sin method returns the positive maximum-boundary behavior after long underflow conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: long = Long.MIN_VALUE;
      let inputValue: long = minimumValue - Int.toLong(1);
      let result: double = Math.sin(inputValue);
      expect(inputValue).assertEqual(Long.MAX_VALUE);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result > 0.9999).assertTrue();
      expect(result < 1.0).assertTrue();
    });
    /**
     * @tc.name testMathSin065
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_6500
     * @tc.desc Verify sin method returns the reference value for a long hexadecimal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(0x1234);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.8511093205849777, 1.0e-12);
    });
    /**
     * @tc.name testMathSin066
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_6600
     * @tc.desc Verify sin method returns the reference value for a positive long representative input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(10000000000);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.4875060250875107, 1.0e-12);
    });
    /**
     * @tc.name testMathSin067
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_6700
     * @tc.desc Verify sin method preserves positive zero for a float zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.0);
      let result: double = Math.sin(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin068
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_6800
     * @tc.desc Verify sin method returns a finite reference-near value for the float maximum boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      let result: double = Math.sin(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expectSinReference(result, -0.5218765233336585, 1.0e-12);
    });
    /**
     * @tc.name testMathSin069
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_6900
     * @tc.desc Verify sin method preserves the float minimum positive boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: double = Math.sin(inputValue);
      expect(result).assertEqual(Float.MIN_VALUE);
      expect(result > 0.0).assertTrue();
    });
    /**
     * @tc.name testMathSin070
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_7000
     * @tc.desc Verify sin method preserves the negative float minimum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MIN_VALUE;
      let result: double = Math.sin(inputValue);
      expect(result).assertEqual(-Float.MIN_VALUE);
      expect(result < 0.0).assertTrue();
    });
    /**
     * @tc.name testMathSin071
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_7100
     * @tc.desc Verify sin method returns Double.NaN for a Float.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NaN;
      let result: double = Math.sin(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin072
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_7200
     * @tc.desc Verify sin method returns Double.NaN for a Float.POSITIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.POSITIVE_INFINITY;
      let result: double = Math.sin(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin073
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_7300
     * @tc.desc Verify sin method returns Double.NaN for a Float.NEGATIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NEGATIVE_INFINITY;
      let result: double = Math.sin(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin074
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_7400
     * @tc.desc Verify sin method returns the reference value for a float scientific input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0e3);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, 0.8268795405320025, 1.0e-12);
    });
    /**
     * @tc.name testMathSin075
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_7500
     * @tc.desc Verify sin method returns the mirrored reference value for a negative float scientific input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1.0e3);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.8268795405320025, 1.0e-12);
    });
    /**
     * @tc.name testMathSin076
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_7600
     * @tc.desc Verify sin method returns the float-rounded reference value for a fractional input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(99.99);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.5149651992440838, 1.0e-9);
    });
    /**
     * @tc.name testMathSin077
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_7700
     * @tc.desc Verify sin method returns the mirrored float-rounded reference value for a negative fractional input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-99.99);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, 0.5149651992440838, 1.0e-9);
    });
    /**
     * @tc.name testMathSin078
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_7800
     * @tc.desc Verify sin method preserves positive zero for a double zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0;
      let result: double = Math.sin(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin079
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_7900
     * @tc.desc Verify sin method preserves negative zero for a double negative zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.0;
      let result: double = Math.sin(inputValue);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin080
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_8000
     * @tc.desc Verify sin method returns the reference value for a double scientific input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0e6;
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.34999350217129294, 1.0e-12);
    });
    /**
     * @tc.name testMathSin081
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_8100
     * @tc.desc Verify sin method returns the mirrored reference value for a negative double scientific input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0e6;
      let result: double = Math.sin(inputValue);
      expectSinReference(result, 0.34999350217129294, 1.0e-12);
    });
    /**
     * @tc.name testMathSin082
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_8200
     * @tc.desc Verify sin method returns the reference value for a positive double boundary near 2^53
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 9007199254740991.0;
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.013949324588032911, 1.0e-12);
    });
    /**
     * @tc.name testMathSin083
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_8300
     * @tc.desc Verify sin method returns the reference value for a double boundary near 2^53 plus one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 9007199254740992.0;
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.848925964814655, 1.0e-12);
    });
    /**
     * @tc.name testMathSin084
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_8400
     * @tc.desc Verify sin method returns the mirrored reference value for a negative double boundary near 2^53
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -9007199254740991.0;
      let result: double = Math.sin(inputValue);
      expectSinReference(result, 0.013949324588032911, 1.0e-12);
    });
    /**
     * @tc.name testMathSin085
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_8500
     * @tc.desc Verify sin method returns the reference value for a helper value plus E expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: number = buildSinNumberFromHelper() + Math.E;
      let result: number = Math.sin(inputValue);
      expectSinReference(result, -0.10011992441860794, 1.0e-12);
    });
    /**
     * @tc.name testMathSin086
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_8600
     * @tc.desc Verify sin method returns the reference value for a helper value plus SQRT1_2 expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: number = buildSinNumberFromHelper() + Math.SQRT1_2;
      let result: number = Math.sin(inputValue);
      expectSinReference(result, 0.9427243910179129, 1.0e-12);
    });
    /**
     * @tc.name testMathSin087
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_8700
     * @tc.desc Verify sin method returns negative one-half for a helper returned negative value expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: number = -buildSinNumberFromHelper();
      let result: number = Math.sin(inputValue);
      let diff: number = Utils.getAbsDiff(result, -0.5);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.name testMathSin088
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_8800
     * @tc.desc Verify sin method returns the reference value for a helper negative value minus SQRT1_2 expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: number = -buildSinNumberFromHelper() - Math.SQRT1_2;
      let result: number = Math.sin(inputValue);
      expectSinReference(result, -0.9427243910179129, 1.0e-12);
    });
    /**
     * @tc.name testMathSin089
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_8900
     * @tc.desc Verify sin method accepts a double positive underflow source and preserves positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE / 2.0;
      let result: double = Math.sin(inputValue);
      expect(inputValue).assertEqual(0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin090
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_9000
     * @tc.desc Verify sin method accepts a double negative underflow source and preserves negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE / 2.0;
      let result: double = Math.sin(inputValue);
      expect(inputValue).assertEqual(-0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin091
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_9100
     * @tc.desc Verify sin method returns Double.NaN for a double source overflowed to Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE * 2.0;
      let result: double = Math.sin(inputValue);
      expect(inputValue).assertEqual(Double.POSITIVE_INFINITY);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin092
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_9200
     * @tc.desc Verify sin method returns Double.NaN for a double source overflowed to Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MAX_VALUE * 2.0;
      let result: double = Math.sin(inputValue);
      expect(inputValue).assertEqual(Double.NEGATIVE_INFINITY);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSin093
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_9300
     * @tc.desc Verify sin method returns the reference value for a Math.max expression source
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Math.max(-2.0, 1.25);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, 0.9489846193555862, 1.0e-12);
    });
    /**
     * @tc.name testMathSin094
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_9400
     * @tc.desc Verify sin method returns the reference value for a Math.min expression source
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Math.min(-1.25, 2.0);
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.9489846193555862, 1.0e-12);
    });
    /**
     * @tc.name testMathSin095
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_9500
     * @tc.desc Verify sin method remains odd for Math.max mirrored expression sources
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInput: double = Math.max(0.25, 0.75);
      let negativeInput: double = -Math.max(0.25, 0.75);
      let positiveResult: double = Math.sin(positiveInput);
      let negativeResult: double = Math.sin(negativeInput);
      let diff: double = Utils.getAbsDiff(negativeResult, -positiveResult);
      expect(diff < 1.0e-15).assertTrue();
    });
    /**
     * @tc.name testMathSin096
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_9600
     * @tc.desc Verify sin method remains periodic for a positive shifted period expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 12345.0 + 2.0 * Math.PI;
      let result: double = Math.sin(inputValue);
      let baseResult: double = Math.sin(12345.0);
      let difference: double = Utils.getAbsDiff(result, baseResult);
      expect(difference < 1.0e-10).assertTrue();
    });
    /**
     * @tc.name testMathSin097
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_9700
     * @tc.desc Verify sin method remains periodic for a negative shifted period expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -12345.0 - 2.0 * Math.PI;
      let result: double = Math.sin(inputValue);
      let baseResult: double = Math.sin(-12345.0);
      let difference: double = Utils.getAbsDiff(result, baseResult);
      expect(difference < 1.0e-10).assertTrue();
    });
    /**
     * @tc.name testMathSin098
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_9800
     * @tc.desc Verify sin method returns the reference value for a positive double representative fractional input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 999999.99;
      let result: double = Math.sin(inputValue);
      expectSinReference(result, -0.35934336780146314, 1.0e-12);
    });
    /**
     * @tc.name testMathSin099
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_9900
     * @tc.desc Verify sin method returns the mirrored reference value for a negative double representative fractional input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -999999.99;
      let result: double = Math.sin(inputValue);
      expectSinReference(result, 0.35934336780146314, 1.0e-12);
    });
  });
}
