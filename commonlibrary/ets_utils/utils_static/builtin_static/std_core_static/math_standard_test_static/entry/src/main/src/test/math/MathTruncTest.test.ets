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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.desc Verify trunc method propagates NaN for a double NaN input
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTrunc017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.trunc(Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathTrunc018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1800
     * @tc.desc Verify trunc method leaves positive and negative infinity unchanged
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
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
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathTrunc030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: long = Long.toLong(1234567890123);
      let result: double = Math.trunc(input);
      expect(result).assertEqual(1234567890123.0);
    });
  });
}
