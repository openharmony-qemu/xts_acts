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

function buildRoundNumberFromHelper(): number {
  return 2.718;
}

export default function mathRoundTest(): void {
  describe('MathRoundTest', (): void => {
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
     * @tc.name testMathRound001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_0100
     * @tc.desc Verify round method with a positive fractional input greater than one-half rounds up
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(3.7);
      expect(result).assertEqual(4.0);
    });
    /**
     * @tc.name testMathRound002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_0200
     * @tc.desc Verify round method with a positive fractional input less than one-half rounds down
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(3.3);
      expect(result).assertEqual(3.0);
    });
    /**
     * @tc.name testMathRound003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_0300
     * @tc.desc Verify round method with a negative fractional input greater in magnitude than one-half rounds away from zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(-3.7);
      expect(result).assertEqual(-4.0);
    });
    /**
     * @tc.name testMathRound004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_0400
     * @tc.desc Verify round method with a negative fractional input less in magnitude than one-half rounds toward negative zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(-0.25);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathRound005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_0500
     * @tc.desc Verify round method keeps a positive integral double unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 5.0;
      let result: double = Math.round(input);
      expect(result).assertEqual(input);
    });
    /**
     * @tc.name testMathRound006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_0600
     * @tc.desc Verify round method keeps a negative integral double unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -5.0;
      let result: double = Math.round(input);
      expect(result).assertEqual(input);
    });
    /**
     * @tc.name testMathRound007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_0700
     * @tc.desc Verify round method with positive zero preserves positive zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathRound008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_0800
     * @tc.desc Verify round method with negative zero preserves negative zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(-0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathRound009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_0900
     * @tc.desc Verify round method with positive one-half rounds to positive one
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(0.5);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathRound010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1000
     * @tc.desc Verify round method with negative one-half rounds to negative zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(-0.5);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathRound011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1100
     * @tc.desc Verify round method rounds a large positive finite value with fractional part to the next integer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(99999.999);
      expect(result).assertEqual(100000.0);
    });
    /**
     * @tc.name testMathRound012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1200
     * @tc.desc Verify round method rounds a large negative finite value according to the nearest integer rule
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(-99999.001);
      expect(result).assertEqual(-99999.0);
    });
    /**
     * @tc.name testMathRound013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1300
     * @tc.desc Verify round method preserves an extremely large positive finite value that has no fractional precision left
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1e+100;
      let result: double = Math.round(input);
      expect(result).assertEqual(input);
    });
    /**
     * @tc.name testMathRound014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1400
     * @tc.desc Verify round method preserves an extremely large negative finite value that has no fractional precision left
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -1e+100;
      let result: double = Math.round(input);
      expect(result).assertEqual(input);
    });
    /**
     * @tc.name testMathRound015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1500
     * @tc.desc Verify round method with the smallest positive subnormal returns positive zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(Double.MIN_VALUE);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathRound016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1600
     * @tc.desc Verify round method with the negated smallest positive subnormal returns negative zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(-Double.MIN_VALUE);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathRound017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1700
     * @tc.desc Verify round method with NaN input propagates NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathRound018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1800
     * @tc.desc Verify round method with positive Infinity returns positive Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.name testMathRound019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1900
     * @tc.desc Verify round method with negative Infinity returns negative Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(Double.NEGATIVE_INFINITY);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.name testMathRound020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2000
     * @tc.desc Verify round method is idempotent for repeated calls with the same finite input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.14159;
      let first: double = Math.round(input);
      let second: double = Math.round(input);
      expect(first).assertEqual(3.0);
      expect(first).assertEqual(second);
    });
    /**
     * @tc.name testMathRound021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2100
     * @tc.desc Verify round method accepts a number typed helper input and rounds it to the nearest integer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildRoundNumberFromHelper();
      let result: number = Math.round(input);
      expect(result).assertEqual(3.0);
    });
    /**
     * @tc.name testMathRound022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2200
     * @tc.desc Verify round method accepts widened float input and rounds it through the double result path
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NaN;
      let result: double = Math.round(input);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathRound023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2300
     * @tc.desc Verify round method accepts widened float positive half input and rounds to one
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.5);
      let result: double = Math.round(input);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathRound024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2400
     * @tc.desc Verify round method accepts widened float negative half input and returns negative zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-0.5);
      let result: double = Math.round(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathRound025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2500
     * @tc.desc Verify round method accepts widened byte input and rounds the equivalent integer value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(12);
      let result: double = Math.round(input);
      expect(result).assertEqual(12.0);
    });
    /**
     * @tc.name testMathRound026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2600
     * @tc.desc Verify round method accepts widened short input and rounds the equivalent integer value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-1024);
      let result: double = Math.round(input);
      expect(result).assertEqual(-1024.0);
    });
    /**
     * @tc.name testMathRound027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2700
     * @tc.desc Verify round method accepts widened int input and preserves Int.MAX_VALUE exactly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MAX_VALUE;
      let result: double = Math.round(input);
      expect(result).assertEqual(Int.MAX_VALUE);
    });
    /**
     * @tc.name testMathRound028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2800
     * @tc.desc Verify round method accepts widened long input and rounds the equivalent integer value unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(10000000000);
      let result: double = Math.round(input);
      expect(result).assertEqual(10000000000.0);
    });
    /**
     * @tc.name testMathRound029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2900
     * @tc.desc Verify round method rounds both Math.PI and Math.E to three
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathRound029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let piRounded: double = Math.round(Math.PI);
      let eRounded: double = Math.round(Math.E);
      expect(piRounded).assertEqual(3.0);
      expect(eRounded).assertEqual(3.0);
    });
  });
}
