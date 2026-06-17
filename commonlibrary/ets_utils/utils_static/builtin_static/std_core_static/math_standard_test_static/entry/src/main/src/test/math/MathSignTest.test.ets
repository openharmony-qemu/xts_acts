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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(-3.14);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathSign003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0300
     * @tc.desc Verify sign method returns one for a positive integral double input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(42.0);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathSign004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0400
     * @tc.desc Verify sign method returns negative one for a negative integral double input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(-42.0);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathSign005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0500
     * @tc.desc Verify sign method preserves positive zero for a positive zero input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathSign006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0600
     * @tc.desc Verify sign method returns one for the smallest positive subnormal double
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(Double.MIN_VALUE);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathSign007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0700
     * @tc.desc Verify sign method returns negative one for the negated smallest positive subnormal double
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(-Double.MIN_VALUE);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathSign008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0800
     * @tc.desc Verify sign method returns one for the largest finite positive double
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(Double.MAX_VALUE);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathSign009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_0900
     * @tc.desc Verify sign method returns negative one for the largest finite negative double
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(-Double.MAX_VALUE);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathSign010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1000
     * @tc.desc Verify sign method propagates NaN for a NaN input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathSign011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1100
     * @tc.desc Verify sign method returns one for positive infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathSign012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1200
     * @tc.desc Verify sign method returns negative one for negative infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(Double.NEGATIVE_INFINITY);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathSign013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1300
     * @tc.desc Verify sign method accepts a number typed helper input that evaluates to a positive value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildPositiveSignNumberFromHelper();
      let result: number = Math.sign(input);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathSign014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1400
     * @tc.desc Verify sign method accepts a number typed helper input that evaluates to a negative value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildNegativeSignNumberFromHelper();
      let result: number = Math.sign(input);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathSign015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1500
     * @tc.desc Verify sign method accepts a widened float positive input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.25);
      let result: double = Math.sign(input);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathSign016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1600
     * @tc.desc Verify sign method accepts a widened float negative input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-0.25);
      let result: double = Math.sign(input);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathSign017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1700
     * @tc.desc Verify sign method accepts a widened byte input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(12);
      let result: double = Math.sign(input);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathSign018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1800
     * @tc.desc Verify sign method accepts a widened short input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-1024);
      let result: double = Math.sign(input);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathSign019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_1900
     * @tc.desc Verify sign method accepts a widened int input at the positive boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MAX_VALUE;
      let result: double = Math.sign(input);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathSign020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2000
     * @tc.desc Verify sign method accepts a widened long input with a negative value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(-10000000000);
      let result: double = Math.sign(input);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathSign021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2100
     * @tc.desc Verify sign method returns one for Math.PI
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(Math.PI);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathSign022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2200
     * @tc.desc Verify sign method returns negative one for the negated Math.PI constant
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(-Math.PI);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathSign023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2300
     * @tc.desc Verify sign method returns one for Math.E
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(Math.E);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathSign024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2400
     * @tc.desc Verify sign method returns negative one for the negated Math.E constant
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sign(-Math.E);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathSign025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2500
     * @tc.desc Verify sign method is odd for mirrored nonzero finite inputs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveResult: double = Math.sign(7.25);
      let negativeResult: double = Math.sign(-7.25);
      expect(positiveResult).assertEqual(1.0);
      expect(negativeResult).assertEqual(-1.0);
      expect(negativeResult).assertEqual(-positiveResult);
    });
    /**
     * @tc.name testMathSign026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2600
     * @tc.desc Verify sign method remains stable when applied repeatedly to its own nonzero result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathSign026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.sign(-8.5);
      let second: double = Math.sign(first);
      expect(first).assertEqual(-1.0);
      expect(second).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathSign027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2700
     * @tc.desc Verify sign method with float negative zero input for negative zero return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.0);
      let dResult: double = Math.sign(inputValue);
      let result: float = Double.toFloat(dResult);
      expect(result).assertEqual(Double.toFloat(-0.0));
      expect(Utils.isNegativeZero(dResult)).assertTrue();
    });
    /**
     * @tc.name testMathSign028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIGN_2800
     * @tc.desc Verify sign method with double negative zero for negative zero return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.0;
      let result: double = Math.sign(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
  });
}
