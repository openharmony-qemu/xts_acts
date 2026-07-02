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

function buildPositiveSignNumberFromHelper(): number {
  return 2.718;
}

function buildNegativeSignNumberFromHelper(): number {
  return -2.718;
}

export default function mathSignTest(): void {
  describe('MathSignTest', (): void => {
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
     * @tc.name testMathSign001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0100
     * @tc.desc Verify sign method returns one for a positive fractional double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(3.14);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0200
     * @tc.desc Verify sign method returns negative one for a negative fractional double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(-3.14);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0300
     * @tc.desc Verify sign method preserves positive zero for a positive zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSign004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0400
     * @tc.desc Verify sign method returns one for the smallest positive subnormal double
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(Double.MIN_VALUE);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0500
     * @tc.desc Verify sign method returns negative one for the negated smallest positive subnormal double
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(-Double.MIN_VALUE);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0600
     * @tc.desc Verify sign method returns one for the largest finite positive double
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(Double.MAX_VALUE);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0700
     * @tc.desc Verify sign method returns negative one for the largest finite negative double
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(-Double.MAX_VALUE);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0800
     * @tc.desc Verify sign method propagates Double.NaN for a Double.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathSign009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0900
     * @tc.desc Verify sign method returns one for Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1000
     * @tc.desc Verify sign method returns negative one for Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(Double.NEGATIVE_INFINITY);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1100
     * @tc.desc Verify sign method accepts a number typed helper input that evaluates to a positive value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildPositiveSignNumberFromHelper();
      let result: number = Math.sign(input);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1200
     * @tc.desc Verify sign method accepts a number typed helper input that evaluates to a negative value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildNegativeSignNumberFromHelper();
      let result: number = Math.sign(input);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1300
     * @tc.desc Verify sign method accepts a widened float positive input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.25);
      let result: double = Math.sign(input);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1400
     * @tc.desc Verify sign method accepts a widened float negative input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-0.25);
      let result: double = Math.sign(input);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1500
     * @tc.desc Verify sign method accepts a widened int input at the positive boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MAX_VALUE;
      let result: double = Math.sign(input);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1600
     * @tc.desc Verify sign method returns one for Math.PI
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(Math.PI);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1700
     * @tc.desc Verify sign method returns negative one for the negated Math.PI constant
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(-Math.PI);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1800
     * @tc.desc Verify sign method is odd for mirrored nonzero finite inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveResult: double = Math.sign(7.25);
      let negativeResult: double = Math.sign(-7.25);
      expect(positiveResult).assertEqual(1.0);
      expect(negativeResult).assertEqual(-1.0);
      expect(negativeResult).assertEqual(-positiveResult);
    });

    /**
     * @tc.name testMathSign019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1900
     * @tc.desc Verify sign method remains stable when applied repeatedly to its own nonzero result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.sign(-8.5);
      let second: double = Math.sign(first);
      expect(first).assertEqual(-1.0);
      expect(second).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2000
     * @tc.desc Verify sign method with float negative zero input for negative zero return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.0);
      let dResult: double = Math.sign(inputValue);
      let result: float = Double.toFloat(dResult);
      expect(result).assertEqual(Double.toFloat(-0.0));
      expect(Utils.isNegativeZero(dResult)).assertTrue();
    });

    /**
     * @tc.name testMathSign021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2100
     * @tc.desc Verify sign method with double negative zero for negative zero return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.0;
      let result: double = Math.sign(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSign022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2200
     * @tc.desc Verify sign method accepts a widened float maximum input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2300
     * @tc.desc Verify sign method accepts a widened float minimum positive input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2400
     * @tc.desc Verify sign method propagates Double.NaN for a Float.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NaN;
      let result: double = Math.sign(inputValue);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.name testMathSign025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2500
     * @tc.desc Verify sign method accepts a widened int minimum input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2600
     * @tc.desc Verify sign method accepts a widened long maximum input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2700
     * @tc.desc Verify sign method preserves positive zero for a byte zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSign028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2800
     * @tc.desc Verify sign method returns one for a positive byte one input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(1);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2900
     * @tc.desc Verify sign method returns negative one for a negative byte one input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-1);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_3000
     * @tc.desc Verify sign method returns one for the byte maximum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_3100
     * @tc.desc Verify sign method returns negative one for the byte minimum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign032
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_3200
     * @tc.desc Verify sign method returns negative one for byte overflow input 128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowedValue: byte = Int.toByte(127 + 1);
      let result: double = Math.sign(overflowedValue);
      expect(overflowedValue).assertEqual(Int.toByte(-128));
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign033
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_3300
     * @tc.desc Verify sign method returns one for byte underflow input -129
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let underflowedValue: byte = Int.toByte(-128 - 1);
      let result: double = Math.sign(underflowedValue);
      expect(underflowedValue).assertEqual(Int.toByte(127));
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign034
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_3400
     * @tc.desc Verify sign method returns one for a byte hexadecimal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0x0A);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign035
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_3500
     * @tc.desc Verify sign method returns one for a byte octal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0o12);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign036
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_3600
     * @tc.desc Verify sign method preserves positive zero for a short zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSign037
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_3700
     * @tc.desc Verify sign method returns one for a positive short one input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(1);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign038
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_3800
     * @tc.desc Verify sign method returns negative one for a negative short one input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-1);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign039
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_3900
     * @tc.desc Verify sign method returns one for the short maximum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign040
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_4000
     * @tc.desc Verify sign method returns negative one for the short minimum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign041
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_4100
     * @tc.desc Verify sign method returns negative one for short overflow input 32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowedValue: short = Int.toShort(32767 + 1);
      let result: double = Math.sign(overflowedValue);
      expect(overflowedValue).assertEqual(Int.toShort(-32768));
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign042
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_4200
     * @tc.desc Verify sign method returns one for short underflow input -32769
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let underflowedValue: short = Int.toShort(-32768 - 1);
      let result: double = Math.sign(underflowedValue);
      expect(underflowedValue).assertEqual(Int.toShort(32767));
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign043
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_4300
     * @tc.desc Verify sign method returns one for a short hexadecimal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0x1234);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign044
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_4400
     * @tc.desc Verify sign method returns one for a short octal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0o7777);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign045
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_4500
     * @tc.desc Verify sign method preserves positive zero for an int zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSign046
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_4600
     * @tc.desc Verify sign method returns one for a positive int one input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 1;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign047
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_4700
     * @tc.desc Verify sign method returns negative one for a negative int one input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = -1;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign048
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_4800
     * @tc.desc Verify sign method returns negative one for int overflow from maximum plus one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: int = Int.MAX_VALUE;
      let overflowedValue: int = maximumValue + 1;
      let result: double = Math.sign(overflowedValue);
      expect(overflowedValue).assertEqual(Int.MIN_VALUE);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign049
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_4900
     * @tc.desc Verify sign method returns one for int underflow from minimum minus one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: int = Int.MIN_VALUE;
      let underflowedValue: int = minimumValue - 1;
      let result: double = Math.sign(underflowedValue);
      expect(underflowedValue).assertEqual(Int.MAX_VALUE);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign050
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_5000
     * @tc.desc Verify sign method returns one for an int hexadecimal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0x1234;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign051
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_5100
     * @tc.desc Verify sign method returns one for an int binary source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0b1010;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign052
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_5200
     * @tc.desc Verify sign method returns negative one for a negative int octal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = -0o123;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign053
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_5300
     * @tc.desc Verify sign method preserves positive zero for a long zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(0);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSign054
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_5400
     * @tc.desc Verify sign method returns one for a positive long one input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(1);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign055
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_5500
     * @tc.desc Verify sign method returns negative one for a negative long one input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(-1);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign056
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_5600
     * @tc.desc Verify sign method returns negative one for Long.MIN_VALUE input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign057
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_5700
     * @tc.desc Verify sign method returns negative one for long overflow from maximum plus one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let overflowedValue: long = maximumValue + Int.toLong(1);
      let result: double = Math.sign(overflowedValue);
      expect(overflowedValue).assertEqual(Long.MIN_VALUE);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign058
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_5800
     * @tc.desc Verify sign method returns one for long underflow from minimum minus one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: long = Long.MIN_VALUE;
      let underflowedValue: long = minimumValue - Int.toLong(1);
      let result: double = Math.sign(underflowedValue);
      expect(underflowedValue).assertEqual(Long.MAX_VALUE);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign059
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_5900
     * @tc.desc Verify sign method returns one for a long hexadecimal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(0x1234);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign060
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_6000
     * @tc.desc Verify sign method returns one for a long octal source input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(0o123);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign061
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_6100
     * @tc.desc Verify sign method preserves positive zero for a float zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.0);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSign062
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_6200
     * @tc.desc Verify sign method returns negative one for the negative float minimum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MIN_VALUE;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign063
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_6300
     * @tc.desc Verify sign method returns one for a float source overflowed to Float.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MAX_VALUE * 10.0);
      let result: double = Math.sign(inputValue);
      expect(inputValue).assertEqual(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign064
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_6400
     * @tc.desc Verify sign method preserves positive zero for a float source underflowed to zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MIN_VALUE / 10.0);
      let result: double = Math.sign(inputValue);
      expect(inputValue).assertEqual(Double.toFloat(0.0));
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSign065
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_6500
     * @tc.desc Verify sign method returns negative one for the negative float maximum boundary input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MAX_VALUE;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign066
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_6600
     * @tc.desc Verify sign method preserves negative zero for a float source underflowed to negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-Float.MIN_VALUE / 10.0);
      let result: double = Math.sign(inputValue);
      expect(inputValue).assertEqual(Double.toFloat(-0.0));
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSign067
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_6700
     * @tc.desc Verify sign method returns one for Float.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.POSITIVE_INFINITY;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign068
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_6800
     * @tc.desc Verify sign method returns negative one for Float.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NEGATIVE_INFINITY;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign069
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_6900
     * @tc.desc Verify sign method returns one for a positive float scientific input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0e3);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign070
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_7000
     * @tc.desc Verify sign method returns negative one for a negative float scientific input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1.0e3);
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign071
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_7100
     * @tc.desc Verify sign method preserves positive zero for a double source underflowed to zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE / 2.0;
      let result: double = Math.sign(inputValue);
      expect(inputValue).assertEqual(0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSign072
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_7200
     * @tc.desc Verify sign method preserves negative zero for a double source underflowed to negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE / 2.0;
      let result: double = Math.sign(inputValue);
      expect(inputValue).assertEqual(-0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathSign073
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_7300
     * @tc.desc Verify sign method returns one for a positive double scientific input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0e6;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign074
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_7400
     * @tc.desc Verify sign method returns negative one for a negative double scientific input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0e6;
      let result: double = Math.sign(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathSign075
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_7500
     * @tc.desc Verify sign method returns one for a helper returned positive value expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: number = buildPositiveSignNumberFromHelper() + Math.SQRT1_2;
      let result: number = Math.sign(inputValue);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathSign076
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_7600
     * @tc.desc Verify sign method returns negative one for a helper returned negative value expression
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: number = buildNegativeSignNumberFromHelper() - Math.SQRT1_2;
      let result: number = Math.sign(inputValue);
      expect(result).assertEqual(-1.0);
    });
  });
}
