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

function buildNegativeHalfRoundNumberFromHelper(): number {
  return -0.5;
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify round method with a negative fractional input less than one-half rounds toward positive direction
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(-3.3);
      expect(result).assertEqual(-3.0);
    });

    /**
     * @tc.name testMathRound012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1200
     * @tc.desc Verify round method with the smallest positive subnormal returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(Double.MIN_VALUE);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1300
     * @tc.desc Verify round method with the negated smallest positive subnormal returns negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(-Double.MIN_VALUE);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1400
     * @tc.desc Verify round method with Double.NaN input propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1500
     * @tc.desc Verify round method with Double.POSITIVE_INFINITY returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathRound016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1600
     * @tc.desc Verify round method with Double.NEGATIVE_INFINITY returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(Double.NEGATIVE_INFINITY);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathRound017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1700
     * @tc.desc Verify round method is idempotent for repeated calls with the same finite input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.14159;
      let first: double = Math.round(input);
      let second: double = Math.round(input);
      expect(first).assertEqual(3.0);
      expect(first).assertEqual(second);
    });

    /**
     * @tc.name testMathRound018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1800
     * @tc.desc Verify round method accepts a number typed helper input and rounds it to the nearest integer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildRoundNumberFromHelper();
      let result: number = Math.round(input);
      expect(result).assertEqual(3.0);
    });

    /**
     * @tc.name testMathRound019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_1900
     * @tc.desc Verify round method propagates Double.NaN for a widened Float.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NaN;
      let result: double = Math.round(input);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2000
     * @tc.desc Verify round method accepts widened float positive half input and rounds to one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.5);
      let result: double = Math.round(input);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.name testMathRound021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2100
     * @tc.desc Verify round method accepts widened float negative half input and returns negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-0.5);
      let result: double = Math.round(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2200
     * @tc.desc Verify round method accepts a byte hexadecimal source and preserves the integer value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(0x0A);
      let result: double = Math.round(input);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.name testMathRound023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2300
     * @tc.desc Verify round method accepts a byte octal source and preserves the integer value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(0o12);
      let result: double = Math.round(input);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.name testMathRound024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2400
     * @tc.desc Verify round method accepts widened short input and rounds the equivalent integer value unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-1024);
      let result: double = Math.round(input);
      expect(result).assertEqual(-1024.0);
    });

    /**
     * @tc.name testMathRound025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2500
     * @tc.desc Verify round method accepts widened int input and preserves Int.MAX_VALUE exactly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MAX_VALUE;
      let result: double = Math.round(input);
      expect(result).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.name testMathRound026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2600
     * @tc.desc Verify round method rounds both Math.PI and Math.E to three
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let piRounded: double = Math.round(Math.PI);
      let eRounded: double = Math.round(Math.E);
      expect(piRounded).assertEqual(3.0);
      expect(eRounded).assertEqual(3.0);
    });

    /**
     * @tc.name testMathRound027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2700
     * @tc.desc Verify round method accepts widened Float.MAX_VALUE and preserves the finite boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.MAX_VALUE;
      let result: double = Math.round(input);
      expect(result).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.name testMathRound028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2800
     * @tc.desc Verify round method accepts widened Float.MIN_VALUE and returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.MIN_VALUE;
      let result: double = Math.round(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_2900
     * @tc.desc Verify round method accepts widened Int.MIN_VALUE and preserves the integer boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MIN_VALUE;
      let result: double = Math.round(input);
      expect(result).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.name testMathRound030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_3000
     * @tc.desc Verify round method accepts Long.MAX_VALUE and returns its double representation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.MAX_VALUE;
      let result: double = Math.round(input);
      let expectedValue: double = Long.MAX_VALUE;
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testMathRound031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_3100
     * @tc.desc Verify round method accepts helper returned negative half input and returns negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildNegativeHalfRoundNumberFromHelper();
      let result: double = Math.round(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound032
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_3200
     * @tc.desc Verify round method accepts a byte zero source and preserves positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(0);
      let result: double = Math.round(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound033
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_3300
     * @tc.desc Verify round method accepts the byte maximum boundary and preserves it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(127);
      let result: double = Math.round(input);
      expect(result).assertEqual(127.0);
    });

    /**
     * @tc.name testMathRound034
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_3400
     * @tc.desc Verify round method accepts the byte minimum boundary and preserves it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(-128);
      let result: double = Math.round(input);
      expect(result).assertEqual(-128.0);
    });

    /**
     * @tc.name testMathRound035
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_3500
     * @tc.desc Verify round method accepts a byte overflow-mapped source after conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(128);
      let result: double = Math.round(input);
      expect(input).assertEqual(Int.toByte(-128));
      expect(result).assertEqual(-128.0);
    });

    /**
     * @tc.name testMathRound036
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_3600
     * @tc.desc Verify round method accepts a byte underflow-mapped source after conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(-129);
      let result: double = Math.round(input);
      expect(input).assertEqual(Int.toByte(127));
      expect(result).assertEqual(127.0);
    });

    /**
     * @tc.name testMathRound037
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_3700
     * @tc.desc Verify round method accepts a byte negative one marker and preserves it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(-1);
      let result: double = Math.round(input);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathRound038
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_3800
     * @tc.desc Verify round method accepts a short zero source and preserves positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(0);
      let result: double = Math.round(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound039
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_3900
     * @tc.desc Verify round method accepts the short maximum boundary and preserves it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(32767);
      let result: double = Math.round(input);
      expect(result).assertEqual(32767.0);
    });

    /**
     * @tc.name testMathRound040
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_4000
     * @tc.desc Verify round method accepts the short minimum boundary and preserves it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-32768);
      let result: double = Math.round(input);
      expect(result).assertEqual(-32768.0);
    });

    /**
     * @tc.name testMathRound041
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_4100
     * @tc.desc Verify round method accepts a short overflow-mapped source after conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(32768);
      let result: double = Math.round(input);
      expect(input).assertEqual(Int.toShort(-32768));
      expect(result).assertEqual(-32768.0);
    });

    /**
     * @tc.name testMathRound042
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_4200
     * @tc.desc Verify round method accepts a short underflow-mapped source after conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-32769);
      let result: double = Math.round(input);
      expect(input).assertEqual(Int.toShort(32767));
      expect(result).assertEqual(32767.0);
    });

    /**
     * @tc.name testMathRound043
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_4300
     * @tc.desc Verify round method accepts a short hexadecimal source and preserves the integer value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(0x1234);
      let result: double = Math.round(input);
      expect(result).assertEqual(4660.0);
    });

    /**
     * @tc.name testMathRound044
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_4400
     * @tc.desc Verify round method accepts a short octal source and preserves the integer value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(0o7777);
      let result: double = Math.round(input);
      expect(result).assertEqual(4095.0);
    });

    /**
     * @tc.name testMathRound045
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_4500
     * @tc.desc Verify round method accepts a short mapped unsigned maximum as negative one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(65535);
      let result: double = Math.round(input);
      expect(input).assertEqual(Int.toShort(-1));
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathRound046
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_4600
     * @tc.desc Verify round method accepts int zero and preserves positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0;
      let result: double = Math.round(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound047
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_4700
     * @tc.desc Verify round method accepts an int overflow-mapped source after arithmetic conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: int = Int.MAX_VALUE;
      let input: int = maximumValue + 1;
      let result: double = Math.round(input);
      expect(input).assertEqual(Int.MIN_VALUE);
      expect(result).assertEqual(-2147483648.0);
    });

    /**
     * @tc.name testMathRound048
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_4800
     * @tc.desc Verify round method accepts an int underflow-mapped source after arithmetic conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: int = Int.MIN_VALUE;
      let input: int = minimumValue - 1;
      let result: double = Math.round(input);
      expect(input).assertEqual(Int.MAX_VALUE);
      expect(result).assertEqual(2147483647.0);
    });

    /**
     * @tc.name testMathRound049
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_4900
     * @tc.desc Verify round method accepts a hexadecimal int source value and preserves it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0x1234;
      let result: double = Math.round(input);
      expect(result).assertEqual(4660.0);
    });

    /**
     * @tc.name testMathRound050
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_5000
     * @tc.desc Verify round method accepts a binary int source value and preserves it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0b1010;
      let result: double = Math.round(input);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.name testMathRound051
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_5100
     * @tc.desc Verify round method accepts an octal int source value and preserves it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0o123;
      let result: double = Math.round(input);
      expect(result).assertEqual(83.0);
    });

    /**
     * @tc.name testMathRound052
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_5200
     * @tc.desc Verify round method accepts an int negative one marker source value and preserves it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = -1;
      let result: double = Math.round(input);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathRound053
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_5300
     * @tc.desc Verify round method accepts long zero and preserves positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Int.toLong(0);
      let result: double = Math.round(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound054
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_5400
     * @tc.desc Verify round method accepts Long.MIN_VALUE and returns its double representation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.MIN_VALUE;
      let result: double = Math.round(input);
      let expectedValue: double = Long.MIN_VALUE;
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testMathRound055
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_5500
     * @tc.desc Verify round method accepts a long overflow-mapped Long.MIN_VALUE source and returns its double representation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let input: long = maximumValue + Int.toLong(1);
      let result: double = Math.round(input);
      expect(input).assertEqual(Long.MIN_VALUE);
      let expectedValue: double = Long.MIN_VALUE;
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testMathRound056
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_5600
     * @tc.desc Verify round method accepts a long underflow-mapped Long.MAX_VALUE source and returns its double representation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: long = Long.MIN_VALUE;
      let input: long = minimumValue - Int.toLong(1);
      let result: double = Math.round(input);
      expect(input).assertEqual(Long.MAX_VALUE);
      let expectedValue: double = Long.MAX_VALUE;
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testMathRound057
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_5700
     * @tc.desc Verify round method accepts a long negative one marker source value and preserves it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Int.toLong(-1);
      let result: double = Math.round(input);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathRound058
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_5800
     * @tc.desc Verify round method accepts a hexadecimal long source value and preserves it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(0x1234);
      let result: double = Math.round(input);
      expect(result).assertEqual(4660.0);
    });

    /**
     * @tc.name testMathRound059
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_5900
     * @tc.desc Verify round method accepts a long octal source and preserves the integer value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(0o123);
      let result: double = Math.round(input);
      expect(result).assertEqual(83.0);
    });

    /**
     * @tc.name testMathRound060
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_6000
     * @tc.desc Verify round method accepts widened float positive zero and preserves positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(0.0);
      let result: double = Math.round(input);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound061
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_6100
     * @tc.desc Verify round method accepts widened float negative zero and preserves negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-0.0);
      let result: double = Math.round(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound062
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_6200
     * @tc.desc Verify round method accepts a normal positive float source and rounds it down
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(3.14);
      let result: double = Math.round(input);
      expect(result).assertEqual(3.0);
    });

    /**
     * @tc.name testMathRound063
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_6300
     * @tc.desc Verify round method accepts a negative float fractional source and rounds away from zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(-3.7);
      let result: double = Math.round(input);
      expect(result).assertEqual(-4.0);
    });

    /**
     * @tc.name testMathRound064
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_6400
     * @tc.desc Verify round method accepts widened negative Float.MAX_VALUE and preserves the finite boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = -Float.MAX_VALUE;
      let result: double = Math.round(input);
      expect(result).assertEqual(-Float.MAX_VALUE);
    });

    /**
     * @tc.name testMathRound065
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_6500
     * @tc.desc Verify round method accepts widened Float.POSITIVE_INFINITY and returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.POSITIVE_INFINITY;
      let result: double = Math.round(input);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathRound066
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_6600
     * @tc.desc Verify round method accepts widened Float.NEGATIVE_INFINITY and returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Float.NEGATIVE_INFINITY;
      let result: double = Math.round(input);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathRound067
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_6700
     * @tc.desc Verify round method accepts widened negative Float.MIN_VALUE and returns negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = -Float.MIN_VALUE;
      let result: double = Math.round(input);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound068
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_6800
     * @tc.desc Verify round method accepts a float overflowed source as Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(Float.MAX_VALUE * 10.0);
      let result: double = Math.round(input);
      expect(input).assertEqual(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathRound069
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_6900
     * @tc.desc Verify round method accepts a float underflowed source as positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(Float.MIN_VALUE / 10.0);
      let result: double = Math.round(input);
      expect(input).assertEqual(Double.toFloat(0.0));
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound070
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_7000
     * @tc.desc Verify round method accepts Double.MAX_VALUE and preserves the finite boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(Double.MAX_VALUE);
      expect(result).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.name testMathRound071
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_7100
     * @tc.desc Verify round method accepts -Double.MAX_VALUE and preserves the finite negative boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(-Double.MAX_VALUE);
      expect(result).assertEqual(-Double.MAX_VALUE);
    });

    /**
     * @tc.name testMathRound072
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_7200
     * @tc.desc Verify round method accepts a double overflowed source as Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Double.MAX_VALUE * 2.0;
      let result: double = Math.round(input);
      expect(input).assertEqual(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathRound073
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_7300
     * @tc.desc Verify round method accepts a double underflowed source as positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Double.MIN_VALUE / 2.0;
      let result: double = Math.round(input);
      expect(input).assertEqual(0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound074
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_7400
     * @tc.desc Verify round method accepts a negative double underflowed source as negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -Double.MIN_VALUE / 2.0;
      let result: double = Math.round(input);
      expect(input).assertEqual(-0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound075
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_7500
     * @tc.desc Verify round method accepts a double scientific notation source and preserves the integer part
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.0e6 + 0.4;
      let result: double = Math.round(input);
      expect(result).assertEqual(1000000.0);
    });

    /**
     * @tc.name testMathRound076
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_7600
     * @tc.desc Verify round method with positive one and one-half rounds upward to two
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(1.5);
      expect(result).assertEqual(2.0);
    });

    /**
     * @tc.name testMathRound077
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_7700
     * @tc.desc Verify round method with negative one and one-half rounds toward positive direction
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(-1.5);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathRound078
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_7800
     * @tc.desc Verify round method with a positive value just below one-half returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(0.49999999999999994);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathRound079
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_7900
     * @tc.desc Verify round method with a negative value just below negative one-half returns negative one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.round(-0.5000000000000001);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathRound080
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_8000
     * @tc.desc Verify round method accepts Math.max expression source and rounds the selected value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.max(2.49, 2.5);
      let result: double = Math.round(input);
      expect(result).assertEqual(3.0);
    });

    /**
     * @tc.name testMathRound081
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ROUND_8100
     * @tc.desc Verify round method accepts Math.min expression source and rounds the selected value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.min(-2.49, -2.5);
      let result: double = Math.round(input);
      expect(result).assertEqual(-2.0);
    });
  });
}
