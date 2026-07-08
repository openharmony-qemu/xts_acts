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

function buildTruncNumberFromHelper(): number {
  return 2.718;
}

export default function mathTruncTest(): void {
  describe('MathTruncTest', (): void => {
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
     * @tc.name testMathTrunc001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0100
     * @tc.desc Verify trunc method removes the positive fractional part toward zero for a representative finite double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(3.7);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathTrunc002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0200
     * @tc.desc Verify trunc method removes the negative fractional part toward zero for a representative finite double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(-3.7);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.name testMathTrunc003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0300
     * @tc.desc Verify trunc method returns positive zero for a positive fractional double input whose magnitude is less than one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(0.618);
      expect(result).assertEqual(0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTrunc004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0400
     * @tc.desc Verify trunc method returns negative zero for a negative fractional double input whose magnitude is less than one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(-0.618);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTrunc005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0500
     * @tc.desc Verify trunc method preserves positive zero for a positive zero double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTrunc006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0600
     * @tc.desc Verify trunc method preserves negative zero for a negative zero double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(-0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTrunc007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0700
     * @tc.desc Verify trunc method leaves a positive integral double input unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(5.0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name testMathTrunc008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0800
     * @tc.desc Verify trunc method leaves a negative integral double input unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(-5.0);
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.name testMathTrunc009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0900
     * @tc.desc Verify trunc method removes only the fractional tail for a positive double input just above an integer boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(2.0000000001);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name testMathTrunc010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1000
     * @tc.desc Verify trunc method stays below the next integer for a positive double input just under that boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(1.9999999999);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathTrunc011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1100
     * @tc.desc Verify trunc method moves toward zero for a negative double input just below an integral boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(-2.0000000001);
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.name testMathTrunc012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1200
     * @tc.desc Verify trunc method moves toward zero for a negative double input just above the next lower integer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(-2.9999999999);
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.name testMathTrunc013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1300
     * @tc.desc Verify trunc method returns positive zero for the smallest positive subnormal double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(Double.MIN_VALUE);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTrunc014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1400
     * @tc.desc Verify trunc method returns negative zero for the smallest negative subnormal double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(-Double.MIN_VALUE);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTrunc015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1500
     * @tc.desc Verify trunc method leaves the largest finite positive double input unchanged and finite
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(Double.MAX_VALUE);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.name testMathTrunc016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1600
     * @tc.desc Verify trunc method leaves the largest finite negative double input unchanged and finite
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(-Double.MAX_VALUE);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(result).assertEqual(-Double.MAX_VALUE);
    });

    /**
     * @tc.name testMathTrunc017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1700
     * @tc.desc Verify trunc method propagates Double.NaN for a Double.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathTrunc018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1800
     * @tc.desc Verify trunc method leaves Double.POSITIVE_INFINITY and Double.NEGATIVE_INFINITY unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.trunc(Double.POSITIVE_INFINITY)).assertEqual(Double.POSITIVE_INFINITY);
      expect(Math.trunc(Double.NEGATIVE_INFINITY)).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathTrunc019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1900
     * @tc.desc Verify trunc method matches floor for a positive finite double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.PI;
      let result: double = Math.trunc(input);
      expect(result).assertEqual(Math.floor(input));
    });

    /**
     * @tc.name testMathTrunc020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2000
     * @tc.desc Verify trunc method matches ceil for a negative finite double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -Math.PI;
      let result: double = Math.trunc(input);
      expect(result).assertEqual(Math.ceil(input));
    });

    /**
     * @tc.name testMathTrunc021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2100
     * @tc.desc Verify trunc method is odd for mirrored finite double inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveResult: double = Math.trunc(2.75);
      let negativeResult: double = Math.trunc(-2.75);
      expect(negativeResult).assertEqual(-positiveResult);
    });

    /**
     * @tc.name testMathTrunc022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2200
     * @tc.desc Verify trunc method is monotonic nondecreasing for ordered positive finite inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smaller: double = Math.trunc(1.1);
      let larger: double = Math.trunc(2.1);
      expect(smaller < larger).assertTrue();
    });

    /**
     * @tc.name testMathTrunc023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2300
     * @tc.desc Verify trunc method is idempotent when applied repeatedly to the same finite input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.trunc(3.14159);
      let second: double = Math.trunc(first);
      expect(first).assertEqual(3);
      expect(second).assertEqual(first);
    });

    /**
     * @tc.name testMathTrunc024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2400
     * @tc.desc Verify trunc method accepts a number typed helper input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = buildTruncNumberFromHelper();
      let result: number = Math.trunc(input);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name testMathTrunc025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2500
     * @tc.desc Verify trunc method accepts a widened positive float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = 3.7f;
      let result: float = Double.toFloat(Math.trunc(input));
      expect(result).assertEqual(Double.toFloat(3.0));
    });

    /**
     * @tc.name testMathTrunc026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2600
     * @tc.desc Verify trunc method accepts a widened negative float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = -2.7f;
      let result: float = Double.toFloat(Math.trunc(input));
      expect(result).assertEqual(Double.toFloat(-2.0));
    });

    /**
     * @tc.name testMathTrunc027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2700
     * @tc.desc Verify trunc method accepts a widened byte input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: byte = Int.toByte(7);
      let result: double = Math.trunc(input);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.name testMathTrunc028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2800
     * @tc.desc Verify trunc method accepts a widened short input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: short = Int.toShort(-7);
      let result: double = Math.trunc(input);
      expect(result).assertEqual(-7);
    });

    /**
     * @tc.name testMathTrunc029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2900
     * @tc.desc Verify trunc method accepts a widened int input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MAX_VALUE;
      let result: double = Math.trunc(input);
      expect(result).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.name testMathTrunc030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3000
     * @tc.desc Verify trunc method accepts a widened long input whose value remains exactly representable as a double
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(1234567890123);
      let result: double = Math.trunc(input);
      expect(result).assertEqual(1234567890123.0);
    });

    /**
     * @tc.name testMathTrunc031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3100
     * @tc.desc Verify trunc method preserves positive zero for a byte zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0);
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTrunc032
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3200
     * @tc.desc Verify trunc method leaves the byte maximum boundary input unchanged after widening
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(127.0);
    });

    /**
     * @tc.name testMathTrunc033
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3300
     * @tc.desc Verify trunc method leaves the byte minimum boundary input unchanged after widening
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(-128.0);
    });

    /**
     * @tc.name testMathTrunc034
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3400
     * @tc.desc Verify trunc method preserves positive zero for a short zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTrunc035
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3500
     * @tc.desc Verify trunc method leaves the short maximum boundary input unchanged after widening
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(32767.0);
    });

    /**
     * @tc.name testMathTrunc036
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3600
     * @tc.desc Verify trunc method leaves the short minimum boundary input unchanged after widening
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(-32768.0);
    });

    /**
     * @tc.name testMathTrunc037
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3700
     * @tc.desc Verify trunc method preserves positive zero for an int zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0;
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTrunc038
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3800
     * @tc.desc Verify trunc method leaves the int minimum boundary input unchanged after widening
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE;
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.name testMathTrunc039
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3900
     * @tc.desc Verify trunc method accepts an int value just below maximum unchanged after widening
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE - 1;
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(2147483646.0);
    });

    /**
     * @tc.name testMathTrunc040
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4000
     * @tc.desc Verify trunc method accepts an int value just above minimum unchanged after widening
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE + 1;
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(-2147483647.0);
    });

    /**
     * @tc.name testMathTrunc041
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4100
     * @tc.desc Verify trunc method accepts an int overflow conversion input as the mapped minimum int value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: int = Int.MAX_VALUE;
      let inputValue: int = maximumValue + 1;
      let result: double = Math.trunc(inputValue);
      expect(inputValue).assertEqual(Int.MIN_VALUE);
      expect(result).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.name testMathTrunc042
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4200
     * @tc.desc Verify trunc method accepts an int underflow conversion input as the mapped maximum int value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: int = Int.MIN_VALUE;
      let inputValue: int = minimumValue - 1;
      let result: double = Math.trunc(inputValue);
      expect(inputValue).assertEqual(Int.MAX_VALUE);
      expect(result).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.name testMathTrunc043
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4300
     * @tc.desc Verify trunc method preserves positive zero for a long zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(0);
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTrunc044
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4400
     * @tc.desc Verify trunc method leaves Long.MIN_VALUE input unchanged after widening
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: double = Math.trunc(inputValue);
      let expectedValue: double = inputValue;
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testMathTrunc045
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4500
     * @tc.desc Verify trunc method leaves the long maximum boundary input unchanged after widening
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE;
      let result: double = Math.trunc(inputValue);
      let expectedValue: double = inputValue;
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testMathTrunc046
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4600
     * @tc.desc Verify trunc method accepts a long overflow conversion input as the mapped minimum long value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let inputValue: long = maximumValue + Int.toLong(1);
      let result: double = Math.trunc(inputValue);
      let expectedValue: double = Long.MIN_VALUE;
      expect(inputValue).assertEqual(Long.MIN_VALUE);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testMathTrunc047
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4700
     * @tc.desc Verify trunc method accepts a long underflow conversion input as the mapped maximum long value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: long = Long.MIN_VALUE;
      let inputValue: long = minimumValue - Int.toLong(1);
      let result: double = Math.trunc(inputValue);
      let expectedValue: double = Long.MAX_VALUE;
      expect(inputValue).assertEqual(Long.MAX_VALUE);
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testMathTrunc048
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4800
     * @tc.desc Verify trunc method preserves positive zero for a float zero input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.0);
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTrunc049
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4900
     * @tc.desc Verify trunc method removes the fractional part from a normal float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(3.14);
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(3.0);
    });

    /**
     * @tc.name testMathTrunc050
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5000
     * @tc.desc Verify trunc method leaves Float.MAX_VALUE unchanged after widening
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      let result: double = Math.trunc(inputValue);
      let expectedValue: double = inputValue;
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testMathTrunc051
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5100
     * @tc.desc Verify trunc method returns positive zero for the smallest positive float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTrunc052
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5200
     * @tc.desc Verify trunc method returns negative zero for the smallest negative float input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MIN_VALUE;
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathTrunc053
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5300
     * @tc.desc Verify trunc method returns Double.POSITIVE_INFINITY for a Float.POSITIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.POSITIVE_INFINITY;
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathTrunc054
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5400
     * @tc.desc Verify trunc method returns Double.NEGATIVE_INFINITY for a Float.NEGATIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NEGATIVE_INFINITY;
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name testMathTrunc055
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5500
     * @tc.desc Verify trunc method leaves a large double above the safe integer boundary unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 9007199254740992.0;
      let result: double = Math.trunc(inputValue);
      expect(result).assertEqual(9007199254740992.0);
    });

    /**
     * @tc.name testMathTrunc056
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5600
     * @tc.desc Verify trunc method propagates Double.NaN for a widened Float.NaN input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NaN;
      let result: double = Math.trunc(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
  });
}
