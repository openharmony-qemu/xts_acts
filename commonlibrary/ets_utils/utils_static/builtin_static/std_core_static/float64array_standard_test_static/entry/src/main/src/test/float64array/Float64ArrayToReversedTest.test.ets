'use static'
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  describe, it, expect, TestType, Size, Level
} from '../../../../hypium/index';

function isF64Arr(obj: Object): boolean {
  return obj instanceof Float64Array;
}

export default function Float64ArrayToReversedTest(): void {
  describe('Float64ArrayToReversedTest', (): void => {

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_0100
     * @tc.name testFloat64ArrayToReversed001
     * @tc.desc Verify toReversed() with no arguments returns reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = arr.toReversed();
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_0200
     * @tc.name testFloat64ArrayToReversed002
     * @tc.desc Verify toReversed returns Float64Array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const threeValue: number = 3;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.toReversed();
      const actVal1 = isF64Arr(result);
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
      expect(result.length).assertEqual(threeValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_0300
     * @tc.name testFloat64ArrayToReversed003
     * @tc.desc Verify toReversed returns different reference from original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.toReversed();
      const expectVal = true;
      expect(result !== arr).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_0400
     * @tc.name testFloat64ArrayToReversed004
     * @tc.desc Verify toReversed result length equals original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = arr.toReversed();
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_0500
     * @tc.name testFloat64ArrayToReversed005
     * @tc.desc Verify toReversed result elements are in reversed order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = arr.toReversed();
      const actVal2 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal2).assertEqual(expectVal);
      const actVal3 = result.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal3).assertEqual(expectVal2);
      const actVal4 = result.$_get(2);
      const expectVal3 = int32MinValue;
      expect(actVal4).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_0600
     * @tc.name testFloat64ArrayToReversed006
     * @tc.desc Verify toReversed does not modify original array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      arr.toReversed();
      const actVal5 = arr.$_get(0);
      const expectVal = pointOne;
      expect(actVal5).assertEqual(expectVal);
      const actVal6 = arr.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal6).assertEqual(expectVal2);
      const actVal7 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal7).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_0700
     * @tc.name testFloat64ArrayToReversed007
     * @tc.desc Verify toReversed does not modify original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const threeValue: number = 3;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      arr.toReversed();
      const expectVal = threeValue;
      expect(arr.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_0800
     * @tc.name testFloat64ArrayToReversed008
     * @tc.desc Verify toReversed does not modify original array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const originalBuffer = arr.buffer;
      arr.toReversed();
      const expectVal = true;
      expect(arr.buffer === originalBuffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_0900
     * @tc.name testFloat64ArrayToReversed009
     * @tc.desc Verify toReversed result buffer is different from original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = arr.toReversed();
      const expectVal = true;
      expect(result.buffer !== arr.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_1000
     * @tc.name testFloat64ArrayToReversed010
     * @tc.desc Verify toReversed on empty array returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array(0);
      const result = arr.toReversed();
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_1100
     * @tc.name testFloat64ArrayToReversed011
     * @tc.desc Verify toReversed on empty array returns new instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const result = arr.toReversed();
      const expectVal = true;
      expect(result !== arr).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_1200
     * @tc.name testFloat64ArrayToReversed012
     * @tc.desc Verify toReversed on empty array returns correct type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array(0);
      const result = arr.toReversed();
      const actVal8 = isF64Arr(result);
      const expectVal = true;
      expect(actVal8).assertEqual(expectVal);
      expect(result.length).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_1300
     * @tc.name testFloat64ArrayToReversed013
     * @tc.desc Verify toReversed on single-element array returns same content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointOne);
      const result = arr.toReversed();
      expect(result.length).assertEqual(oneValue);
      const actVal9 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal9).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_1400
     * @tc.name testFloat64ArrayToReversed014
     * @tc.desc Verify toReversed on single-element array returns new instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive);
      const result = arr.toReversed();
      const expectVal = true;
      expect(result !== arr).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_1500
     * @tc.name testFloat64ArrayToReversed015
     * @tc.desc Verify toReversed on single-element array does not modify original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue);
      arr.toReversed();
      const actVal10 = arr.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal10).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_1600
     * @tc.name testFloat64ArrayToReversed016
     * @tc.desc Verify toReversed on two-element array swaps elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, negativeOne);
      const result = arr.toReversed();
      const actVal11 = result.$_get(0);
      const expectVal = negativeOne;
      expect(actVal11).assertEqual(expectVal);
      const actVal12 = result.$_get(1);
      const expectVal2 = int32MinValue;
      expect(actVal12).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_1700
     * @tc.name testFloat64ArrayToReversed017
     * @tc.desc Verify toReversed on two-element array does not modify original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      arr.toReversed();
      const actVal13 = arr.$_get(0);
      const expectVal = pointOne;
      expect(actVal13).assertEqual(expectVal);
      const actVal14 = arr.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal14).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_1800
     * @tc.name testFloat64ArrayToReversed018
     * @tc.desc Verify toReversed on 5-element array fully reverses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = arr.toReversed();
      const actVal15 = result.$_get(0);
      const expectVal = pointZeroSixTwoFive;
      expect(actVal15).assertEqual(expectVal);
      const actVal16 = result.$_get(1);
      const expectVal2 = pointOneTwoFive;
      expect(actVal16).assertEqual(expectVal2);
      const actVal17 = result.$_get(2);
      const expectVal3 = pointTwoFive;
      expect(actVal17).assertEqual(expectVal3);
      const actVal18 = result.$_get(3);
      const expectVal4 = onePointFive;
      expect(actVal18).assertEqual(expectVal4);
      const actVal19 = result.$_get(4);
      const expectVal5 = pointFive;
      expect(actVal19).assertEqual(expectVal5);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_1900
     * @tc.name testFloat64ArrayToReversed019
     * @tc.desc Verify toReversed on 10-element array fully reverses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const tenValue: number = 10;
      const arr =
        Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue, zeroValue, zeroValue,
          zeroValue, zeroValue, zeroValue);
      const result = arr.toReversed();
      const actVal20 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal20).assertEqual(expectVal);
      const actVal21 = result.$_get(9);
      const expectVal2 = int16MinValue;
      expect(actVal21).assertEqual(expectVal2);
      expect(result.length).assertEqual(tenValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_2000
     * @tc.name testFloat64ArrayToReversed020
     * @tc.desc Verify toReversed on 100-element array has correct length and boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredValue: number = 100;
      const ninetynineValue: number = 99;
      const zeroValue: number = 0;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i = i + 1) {
        arr.$_set(i, i.toDouble());
      }
      const result = arr.toReversed();
      expect(result.length).assertEqual(hundredValue);
      const actVal22 = result.$_get(0);
      const expectVal = ninetynineValue;
      expect(actVal22).assertEqual(expectVal);
      const actVal23 = result.$_get(99);
      const expectVal2 = zeroValue;
      expect(actVal23).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_2100
     * @tc.name testFloat64ArrayToReversed021
     * @tc.desc Verify toReversed with Double.MAX_VALUE element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(onePointZero, doubleMaxValue);
      const result = arr.toReversed();
      const actVal24 = result.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal24).assertEqual(expectVal);
      const actVal25 = result.$_get(1);
      const expectVal2 = onePointZero;
      expect(actVal25).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_2200
     * @tc.name testFloat64ArrayToReversed022
     * @tc.desc Verify toReversed with Double.MIN_VALUE element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const doubleMinValue: number = 5e-324;
      const arr = Float64Array.of(onePointZero, doubleMinValue);
      const result = arr.toReversed();
      const actVal26 = result.$_get(0);
      const expectVal = doubleMinValue;
      expect(actVal26).assertEqual(expectVal);
      const actVal27 = result.$_get(1);
      const expectVal2 = onePointZero;
      expect(actVal27).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_2300
     * @tc.name testFloat64ArrayToReversed023
     * @tc.desc Verify toReversed with NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const nanValue: number = Double.NaN;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, nanValue, threePointZero);
      const result = arr.toReversed();
      const actVal28 = result.$_get(0);
      const expectVal = threePointZero;
      expect(actVal28).assertEqual(expectVal);
      const actVal29 = Number.isNaN(result.$_get(1));
      const expectVal2 = true;
      expect(actVal29).assertEqual(expectVal2);
      const actVal30 = result.$_get(2);
      const expectVal3 = onePointZero;
      expect(actVal30).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_2400
     * @tc.name testFloat64ArrayToReversed024
     * @tc.desc Verify toReversed with Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, positiveInfinity, threePointZero);
      const result = arr.toReversed();
      const actVal31 = result.$_get(0);
      const expectVal = threePointZero;
      expect(actVal31).assertEqual(expectVal);
      const actVal32 = result.$_get(1);
      const expectVal2 = positiveInfinity;
      expect(actVal32).assertEqual(expectVal2);
      const actVal33 = result.$_get(2);
      const expectVal3 = onePointZero;
      expect(actVal33).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_2500
     * @tc.name testFloat64ArrayToReversed025
     * @tc.desc Verify toReversed with -Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, negativeInfinity, threePointZero);
      const result = arr.toReversed();
      const actVal34 = result.$_get(0);
      const expectVal = threePointZero;
      expect(actVal34).assertEqual(expectVal);
      const actVal35 = result.$_get(1);
      const expectVal2 = negativeInfinity;
      expect(actVal35).assertEqual(expectVal2);
      const actVal36 = result.$_get(2);
      const expectVal3 = onePointZero;
      expect(actVal36).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_2600
     * @tc.name testFloat64ArrayToReversed026
     * @tc.desc Verify toReversed with -0.0 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeZero: number = -0.0;
      const threePointZero: number = 3.0;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(onePointZero, negativeZero, threePointZero);
      const result = arr.toReversed();
      const actVal37 = result.$_get(0);
      const expectVal = threePointZero;
      expect(actVal37).assertEqual(expectVal);
      const actVal38 = 1.0 / result.$_get(1);
      const expectVal2 = negativeInfinity;
      expect(actVal38).assertEqual(expectVal2);
      const actVal39 = result.$_get(2);
      const expectVal3 = onePointZero;
      expect(actVal39).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_2700
     * @tc.name testFloat64ArrayToReversed027
     * @tc.desc Verify toReversed with +0.0 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, zeroPointZero, threePointZero);
      const result = arr.toReversed();
      const actVal40 = result.$_get(0);
      const expectVal = threePointZero;
      expect(actVal40).assertEqual(expectVal);
      const actVal41 = result.$_get(1);
      const expectVal2 = zeroPointZero;
      expect(actVal41).assertEqual(expectVal2);
      const actVal42 = result.$_get(2);
      const expectVal3 = onePointZero;
      expect(actVal42).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_2800
     * @tc.name testFloat64ArrayToReversed028
     * @tc.desc Verify toReversed with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const negtwoPointzero: number = -2.0;
      const negthreePointzero: number = -3.0;
      const arr = Float64Array.of(negonePointzero, negtwoPointzero, negthreePointzero);
      const result = arr.toReversed();
      const actVal43 = result.$_get(0);
      const expectVal = negthreePointzero;
      expect(actVal43).assertEqual(expectVal);
      const actVal44 = result.$_get(1);
      const expectVal2 = negtwoPointzero;
      expect(actVal44).assertEqual(expectVal2);
      const actVal45 = result.$_get(2);
      const expectVal3 = negonePointzero;
      expect(actVal45).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_2900
     * @tc.name testFloat64ArrayToReversed029
     * @tc.desc Verify toReversed with decimal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const twoPointseven: number = 2.7;
      const piApprox: number = 3.14;
      const arr = Float64Array.of(onePointFive, twoPointseven, piApprox);
      const result = arr.toReversed();
      const actVal46 = result.$_get(0);
      const expectVal = piApprox;
      expect(actVal46).assertEqual(expectVal);
      const actVal47 = result.$_get(1);
      const expectVal2 = twoPointseven;
      expect(actVal47).assertEqual(expectVal2);
      const actVal48 = result.$_get(2);
      const expectVal3 = onePointFive;
      expect(actVal48).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_3000
     * @tc.name testFloat64ArrayToReversed030
     * @tc.desc Verify toReversed with scientific notation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const sciValue10e3082: number = 1.0e+308;
      const sciValue20e50: number = 2.0e50;
      const arr = Float64Array.of(sciValue10e308, sciValue10e3082, sciValue20e50);
      const result = arr.toReversed();
      const actVal49 = result.$_get(0);
      const expectVal = sciValue20e50;
      expect(actVal49).assertEqual(expectVal);
      const actVal50 = result.$_get(1);
      const expectVal2 = sciValue10e3082;
      expect(actVal50).assertEqual(expectVal2);
      const actVal51 = result.$_get(2);
      const expectVal3 = sciValue10e308;
      expect(actVal51).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_3100
     * @tc.name testFloat64ArrayToReversed031
     * @tc.desc Verify toReversed on array with all identical elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const arr = Float64Array.of(pointOneTwoFive, pointOneTwoFive, pointOneTwoFive, pointOneTwoFive);
      const result = arr.toReversed();
      const actVal52 = result.$_get(0);
      const expectVal = pointOneTwoFive;
      expect(actVal52).assertEqual(expectVal);
      const actVal53 = result.$_get(1);
      const expectVal2 = pointOneTwoFive;
      expect(actVal53).assertEqual(expectVal2);
      const actVal54 = result.$_get(2);
      const expectVal3 = pointOneTwoFive;
      expect(actVal54).assertEqual(expectVal3);
      const actVal55 = result.$_get(3);
      const expectVal4 = pointOneTwoFive;
      expect(actVal55).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_3200
     * @tc.name testFloat64ArrayToReversed032
     * @tc.desc Verify toReversed on array with all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const result = arr.toReversed();
      expect(result.length).assertEqual(threeValue);
      const actVal56 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal56).assertEqual(expectVal);
      const actVal57 = result.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal57).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_3300
     * @tc.name testFloat64ArrayToReversed033
     * @tc.desc Verify toReversed on ascending sequence array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr =
        Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue, zeroValue, zeroValue, zeroValue,
          zeroValue, zeroValue);
      const result = arr.toReversed();
      const actVal58 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal58).assertEqual(expectVal);
      const actVal59 = result.$_get(9);
      const expectVal2 = int32MinValue;
      expect(actVal59).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_3400
     * @tc.name testFloat64ArrayToReversed034
     * @tc.desc Verify toReversed on descending sequence array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue, zeroValue, zeroValue,
        zeroValue, zeroValue, zeroValue);
      const result = arr.toReversed();
      const actVal60 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal60).assertEqual(expectVal);
      const actVal61 = result.$_get(9);
      const expectVal2 = pointOne;
      expect(actVal61).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_3500
     * @tc.name testFloat64ArrayToReversed035
     * @tc.desc Verify toReversed on alternating positive-negative array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const zeroValue: number = 0;
      const arr =
        Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive, zeroValue);
      const result = arr.toReversed();
      const actVal62 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal62).assertEqual(expectVal);
      const actVal63 = result.$_get(1);
      const expectVal2 = pointZeroSixTwoFive;
      expect(actVal63).assertEqual(expectVal2);
      const actVal64 = result.$_get(2);
      const expectVal3 = pointOneTwoFive;
      expect(actVal64).assertEqual(expectVal3);
      const actVal65 = result.$_get(3);
      const expectVal4 = pointTwoFive;
      expect(actVal65).assertEqual(expectVal4);
      const actVal66 = result.$_get(4);
      const expectVal5 = onePointFive;
      expect(actVal66).assertEqual(expectVal5);
      const actVal67 = result.$_get(5);
      const expectVal6 = pointFive;
      expect(actVal67).assertEqual(expectVal6);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_3600
     * @tc.name testFloat64ArrayToReversed036
     * @tc.desc Verify toReversed on array with integer values as doubles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue);
      const result = arr.toReversed();
      const actVal68 = result.$_get(0);
      const expectVal = int8MaxValue;
      expect(actVal68).assertEqual(expectVal);
      const actVal69 = result.$_get(1);
      const expectVal2 = zeroValue;
      expect(actVal69).assertEqual(expectVal2);
      const actVal70 = result.$_get(2);
      const expectVal3 = int8MinValue;
      expect(actVal70).assertEqual(expectVal3);
      const actVal71 = result.$_get(3);
      const expectVal4 = int16MinValue;
      expect(actVal71).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_3700
     * @tc.name testFloat64ArrayToReversed037
     * @tc.desc Verify original array unchanged after multiple toReversed calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      arr.toReversed();
      arr.toReversed();
      arr.toReversed();
      const actVal72 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal72).assertEqual(expectVal);
      const actVal73 = arr.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal73).assertEqual(expectVal2);
      const actVal74 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal74).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_3800
     * @tc.name testFloat64ArrayToReversed038
     * @tc.desc Verify original array elements can be modified independently from result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const num999Pointzero: number = 999.0;
      const num999Value: number = 999;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.toReversed();
      result.$_set(0, num999Pointzero);
      const actVal75 = arr.$_get(0);
      const expectVal = pointOne;
      expect(actVal75).assertEqual(expectVal);
      const actVal76 = result.$_get(0);
      const expectVal2 = num999Value;
      expect(actVal76).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_3900
     * @tc.name testFloat64ArrayToReversed039
     * @tc.desc Verify original array length is unaffected by result modifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const threeValue: number = 3;
      const hundredPointzero: number = 100.0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.toReversed();
      expect(result.length).assertEqual(threeValue);
      arr.$_set(0, hundredPointzero);
      expect(result.length).assertEqual(threeValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_4000
     * @tc.name testFloat64ArrayToReversed040
     * @tc.desc Verify toReversed chained twice returns original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = arr.toReversed().toReversed();
      const actVal77 = result.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal77).assertEqual(expectVal);
      const actVal78 = result.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal78).assertEqual(expectVal2);
      const actVal79 = result.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal79).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_4100
     * @tc.name testFloat64ArrayToReversed041
     * @tc.desc Verify toReversed chained three times returns reversed order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.toReversed().toReversed().toReversed();
      const actVal80 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal80).assertEqual(expectVal);
      const actVal81 = result.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal81).assertEqual(expectVal2);
      const actVal82 = result.$_get(2);
      const expectVal3 = pointOne;
      expect(actVal82).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_4200
     * @tc.name testFloat64ArrayToReversed042
     * @tc.desc Verify toReversed returns mapped-equivalent reversed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.toReversed();
      const actVal83 = result.$_get(0);
      const expectVal = pointTwoFive;
      expect(actVal83).assertEqual(expectVal);
      const actVal84 = result.$_get(1);
      const expectVal2 = onePointFive;
      expect(actVal84).assertEqual(expectVal2);
      const actVal85 = result.$_get(2);
      const expectVal3 = pointFive;
      expect(actVal85).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_4300
     * @tc.name testFloat64ArrayToReversed043
     * @tc.desc Verify toReversed returns selected positive values in reversed order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const arr = Float64Array.of(int8MaxValue, int16MaxValue);
      const result = arr.toReversed();
      expect(result.length).assertEqual(2);
      const actVal86 = result.$_get(0);
      const expectVal = int16MaxValue;
      expect(actVal86).assertEqual(expectVal);
      const actVal87 = result.$_get(1);
      const expectVal2 = int8MaxValue;
      expect(actVal87).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_4400
     * @tc.name testFloat64ArrayToReversed044
     * @tc.desc Verify toReversed returns decimal values in reversed order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.toReversed();
      const actVal88 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal88).assertEqual(expectVal);
      const actVal89 = result.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal89).assertEqual(expectVal2);
      const actVal90 = result.$_get(2);
      const expectVal3 = pointOne;
      expect(actVal90).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_4500
     * @tc.name testFloat64ArrayToReversed045
     * @tc.desc Verify toReversed middle values after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const threeValue: number = 3;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = arr.toReversed();
      expect(result.length).assertEqual(5);
      const actVal91 = result.$_get(1);
      const expectVal = pointOneTwoFive;
      expect(actVal91).assertEqual(expectVal);
      const actVal92 = result.$_get(3);
      const expectVal2 = onePointFive;
      expect(actVal92).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_4600
     * @tc.name testFloat64ArrayToReversed046
     * @tc.desc Verify toReversed middle integer values after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const threeValue: number = 3;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const result = arr.toReversed();
      expect(result.length).assertEqual(5);
      const actVal93 = result.$_get(1);
      const expectVal = int8MaxValue;
      expect(actVal93).assertEqual(expectVal);
      const actVal94 = result.$_get(3);
      const expectVal2 = int8MinValue;
      expect(actVal94).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_4700
     * @tc.name testFloat64ArrayToReversed047
     * @tc.desc Verify toReversed result content differs from original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = arr.toReversed();
      const actVal95 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal95).assertEqual(expectVal);
      const actVal96 = arr.$_get(0);
      const expectVal2 = int32MinValue;
      expect(actVal96).assertEqual(expectVal2);
      const actVal97 = result.$_get(0) !== arr.$_get(0);
      const expectVal3 = true;
      expect(actVal97).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_4800
     * @tc.name testFloat64ArrayToReversed048
     * @tc.desc Verify toReversed on single-element array content same but instance different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = Float64Array.of(pointOne);
      const result = arr.toReversed();
      const actVal98 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal98).assertEqual(expectVal);
      const actVal99 = arr.$_get(0);
      const expectVal2 = pointOne;
      expect(actVal99).assertEqual(expectVal2);
      expect(result !== arr).assertEqual(true);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_4900
     * @tc.name testFloat64ArrayToReversed049
     * @tc.desc Verify toReversed on empty array returns new empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array(0);
      const result = arr.toReversed();
      expect(result.length).assertEqual(zeroValue);
      expect(arr.length).assertEqual(zeroValue);
      expect(result !== arr).assertEqual(true);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_5000
     * @tc.name testFloat64ArrayToReversed050
     * @tc.desc Verify toReversed with floating point precision boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const pointTwo: number = 0.2;
      const pointThree: number = 0.3;
      const arr = Float64Array.of(pointOne, pointTwo, pointThree);
      const result = arr.toReversed();
      const actVal100 = result.$_get(0);
      const expectVal = pointThree;
      expect(actVal100).assertEqual(expectVal);
      const actVal101 = result.$_get(1);
      const expectVal2 = pointTwo;
      expect(actVal101).assertEqual(expectVal2);
      const actVal102 = result.$_get(2);
      const expectVal3 = pointOne;
      expect(actVal102).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_5100
     * @tc.name testFloat64ArrayToReversed051
     * @tc.desc Verify toReversed with Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, maxSafeIntegerValue, threePointZero);
      const result = arr.toReversed();
      const actVal103 = result.$_get(0);
      const expectVal = threePointZero;
      expect(actVal103).assertEqual(expectVal);
      const actVal104 = result.$_get(1);
      const expectVal2 = maxSafeIntegerValue;
      expect(actVal104).assertEqual(expectVal2);
      const actVal105 = result.$_get(2);
      const expectVal3 = onePointZero;
      expect(actVal105).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_5200
     * @tc.name testFloat64ArrayToReversed052
     * @tc.desc Verify toReversed with Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeMaxSafeIntegerValue: number = -9007199254740991.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, negativeMaxSafeIntegerValue, threePointZero);
      const result = arr.toReversed();
      const actVal106 = result.$_get(0);
      const expectVal = threePointZero;
      expect(actVal106).assertEqual(expectVal);
      const actVal107 = result.$_get(1);
      const expectVal2 = negativeMaxSafeIntegerValue;
      expect(actVal107).assertEqual(expectVal2);
      const actVal108 = result.$_get(2);
      const expectVal3 = onePointZero;
      expect(actVal108).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_5300
     * @tc.name testFloat64ArrayToReversed053
     * @tc.desc Verify original array elements unchanged via $_get after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      arr.toReversed();
      const actVal109 = arr.$_get(0);
      const expectVal = pointFive;
      expect(actVal109).assertEqual(expectVal);
      const actVal110 = arr.$_get(1);
      const expectVal2 = onePointFive;
      expect(actVal110).assertEqual(expectVal2);
      const actVal111 = arr.$_get(2);
      const expectVal3 = pointTwoFive;
      expect(actVal111).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_5400
     * @tc.name testFloat64ArrayToReversed054
     * @tc.desc Verify toReversed result elements by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = arr.toReversed();
      const actVal112 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal112).assertEqual(expectVal);
      const actVal113 = result.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal113).assertEqual(expectVal2);
      const actVal114 = result.$_get(2);
      const expectVal3 = int16MinValue;
      expect(actVal114).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_5500
     * @tc.name testFloat64ArrayToReversed055
     * @tc.desc Verify toReversed result contains expected reversed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.toReversed();
      const actVal115 = result.$_get(0);
      const expectVal = threePointZero;
      expect(actVal115).assertEqual(expectVal);
      const actVal116 = result.$_get(2);
      const expectVal2 = onePointZero;
      expect(actVal116).assertEqual(expectVal2);
      expect(result.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_5600
     * @tc.name testFloat64ArrayToReversed056
     * @tc.desc Verify toReversed result has expected positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.toReversed();
      const actVal117 = result.$_get(0);
      const expectVal = threePointZero;
      expect(actVal117).assertEqual(expectVal);
      const actVal118 = result.$_get(1);
      const expectVal2 = twoPointZero;
      expect(actVal118).assertEqual(expectVal2);
      const actVal119 = result.$_get(2);
      const expectVal3 = onePointZero;
      expect(actVal119).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_5700
     * @tc.name testFloat64ArrayToReversed057
     * @tc.desc Verify toReversed result keeps duplicate reversed positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourValue: number = 4;
      const threeValue: number = 3;
      const twoValue: number = 2;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero, twoPointZero, onePointZero);
      const result = arr.toReversed();
      const actVal120 = result.$_get(0);
      const expectVal = onePointZero;
      expect(actVal120).assertEqual(expectVal);
      const actVal121 = result.$_get(1);
      const expectVal2 = twoPointZero;
      expect(actVal121).assertEqual(expectVal2);
      const actVal122 = result.$_get(2);
      const expectVal3 = threePointZero;
      expect(actVal122).assertEqual(expectVal3);
      const actVal123 = result.$_get(3);
      const expectVal4 = twoPointZero;
      expect(actVal123).assertEqual(expectVal4);
      const actVal124 = result.$_get(4);
      const expectVal5 = onePointZero;
      expect(actVal124).assertEqual(expectVal5);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_5800
     * @tc.name testFloat64ArrayToReversed058
     * @tc.desc Verify toReversed places large positive value first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const result = arr.toReversed();
      const actVal125 = result.$_get(0);
      const expectVal = int32MaxValue;
      expect(actVal125).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_5900
     * @tc.name testFloat64ArrayToReversed059
     * @tc.desc Verify toReversed places pi value at expected index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const result = arr.toReversed();
      const actVal126 = result.$_get(1);
      const expectVal = piValue;
      expect(actVal126).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_6000
     * @tc.name testFloat64ArrayToReversed060
     * @tc.desc Verify toReversed places original first value last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = arr.toReversed();
      const actVal127 = result.$_get(4);
      const expectVal = pointFive;
      expect(actVal127).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_6100
     * @tc.name testFloat64ArrayToReversed061
     * @tc.desc Verify toReversed keeps original first value at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const fourValue: number = 4;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const result = arr.toReversed();
      const actVal128 = result.$_get(4);
      const expectVal = int16MinValue;
      expect(actVal128).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_6200
     * @tc.name testFloat64ArrayToReversed062
     * @tc.desc Verify toReversed result has expected sum-equivalent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const negnum2147483649Value: number = -2147483649;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = arr.toReversed();
      const actVal129 = result.$_get(0) + result.$_get(1) + result.$_get(2);
      const expectVal = negnum2147483649Value;
      expect(actVal129).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_6300
     * @tc.name testFloat64ArrayToReversed063
     * @tc.desc Verify toReversed result contains large positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.toReversed();
      const actVal130 = result.$_get(1);
      const expectVal = maxSafeInteger;
      expect(actVal130).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_6400
     * @tc.name testFloat64ArrayToReversed064
     * @tc.desc Verify toReversed result keeps odd-equivalent values first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(oneValue, int32MaxValue);
      const result = arr.toReversed();
      expect(result.length).assertEqual(2);
      const actVal131 = result.$_get(0);
      const expectVal = int32MaxValue;
      expect(actVal131).assertEqual(expectVal);
      const actVal132 = result.$_get(1);
      const expectVal2 = oneValue;
      expect(actVal132).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_6500
     * @tc.name testFloat64ArrayToReversed065
     * @tc.desc Verify toReversed result preserves sum-equivalent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.toReversed();
      const total = result.$_get(0) + result.$_get(1) + result.$_get(2);
      const expectVal = maxSafeInteger;
      expect(total).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_6600
     * @tc.name testFloat64ArrayToReversed066
     * @tc.desc Verify toReversed result preserves fractional sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const twoPointtwofive: number = 2.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.toReversed();
      const total = result.$_get(0) + result.$_get(1) + result.$_get(2);
      const expectVal = twoPointtwofive;
      expect(total).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_6700
     * @tc.name testFloat64ArrayToReversed067
     * @tc.desc Verify toReversed result indexes and values directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = arr.toReversed();
      const actVal133 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal133).assertEqual(expectVal);
      const actVal134 = result.$_get(2);
      const expectVal2 = int16MinValue;
      expect(actVal134).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_6800
     * @tc.name testFloat64ArrayToReversed068
     * @tc.desc Verify toReversed result length and last index directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const twoValue: number = 2;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = arr.toReversed();
      expect(result.length).assertEqual(threeValue);
      const actVal135 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal135).assertEqual(expectVal);
      const actVal136 = result.$_get(2);
      const expectVal2 = int32MinValue;
      expect(actVal136).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_6900
     * @tc.name testFloat64ArrayToReversed069
     * @tc.desc Verify toReversed result default iterator iterates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.toReversed();
      const values: Array<number> = [];
      for (const val of result) {
        values.push(val);
      }
      expect(values[0]).assertEqual(pointTwoFive);
      expect(values[1]).assertEqual(onePointFive);
      expect(values[2]).assertEqual(pointFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_7000
     * @tc.name testFloat64ArrayToReversed070
     * @tc.desc Verify toReversed and reverse produce same result content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr1 = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = arr1.toReversed();
      const actVal137 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal137).assertEqual(expectVal);
      const actVal138 = result.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal138).assertEqual(expectVal2);
      const actVal139 = result.$_get(2);
      const expectVal3 = int16MinValue;
      expect(actVal139).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_7100
     * @tc.name testFloat64ArrayToReversed071
     * @tc.desc Verify toReversed keeps original array state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr1 = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      arr1.toReversed();
      const actVal140 = arr1.$_get(0);
      const expectVal = pointOne;
      expect(actVal140).assertEqual(expectVal);
      const actVal141 = arr1.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal141).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_7200
     * @tc.name testFloat64ArrayToReversed072
     * @tc.desc Verify toReversed result is independent from original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = arr.toReversed();
      const actVal142 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal142).assertEqual(expectVal);
      const actVal143 = arr.$_get(0);
      const expectVal2 = int16MinValue;
      expect(actVal143).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_7300
     * @tc.name testFloat64ArrayToReversed073
     * @tc.desc Verify toReversed result keeps copied-equivalent order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const result = arr.toReversed();
      const actVal144 = result.$_get(0);
      const expectVal = int32MaxValue;
      expect(actVal144).assertEqual(expectVal);
      const actVal145 = result.$_get(1);
      const expectVal2 = oneValue;
      expect(actVal145).assertEqual(expectVal2);
      const actVal146 = result.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal146).assertEqual(expectVal3);
      const actVal147 = arr.$_get(0);
      const expectVal4 = int32MinValue;
      expect(actVal147).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_7400
     * @tc.name testFloat64ArrayToReversed074
     * @tc.desc Verify toReversed result preserves original independence for zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.toReversed();
      const actVal148 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal148).assertEqual(expectVal);
      const actVal149 = result.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal149).assertEqual(expectVal2);
      const actVal150 = result.$_get(2);
      const expectVal3 = pointOne;
      expect(actVal150).assertEqual(expectVal3);
      const actVal151 = arr.$_get(0);
      const expectVal4 = pointOne;
      expect(actVal151).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_7500
     * @tc.name testFloat64ArrayToReversed075
     * @tc.desc Verify toReversed result can be modified via set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const num999Pointzero: number = 999.0;
      const num999Value: number = 999;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.toReversed();
      result.$_set(0, num999Pointzero);
      const actVal152 = result.$_get(0);
      const expectVal = num999Value;
      expect(actVal152).assertEqual(expectVal);
      const actVal153 = arr.$_get(0);
      const expectVal2 = pointFive;
      expect(actVal153).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_7600
     * @tc.name testFloat64ArrayToReversed076
     * @tc.desc Verify toReversed result keeps reversed negative order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = arr.toReversed();
      const actVal154 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal154).assertEqual(expectVal);
      const actVal155 = result.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal155).assertEqual(expectVal2);
      const actVal156 = result.$_get(2);
      const expectVal3 = int16MinValue;
      expect(actVal156).assertEqual(expectVal3);
      const actVal157 = arr.$_get(0);
      const expectVal4 = int16MinValue;
      expect(actVal157).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_7700
     * @tc.name testFloat64ArrayToReversed077
     * @tc.desc Verify toReversed middle result values directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const threeValue: number = 3;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const result = arr.toReversed();
      expect(result.length).assertEqual(5);
      const actVal158 = result.$_get(1);
      const expectVal = oneValue;
      expect(actVal158).assertEqual(expectVal);
      const actVal159 = result.$_get(3);
      const expectVal2 = negativeOne;
      expect(actVal159).assertEqual(expectVal2);
      const actVal160 = result.$_get(0);
      const expectVal3 = int32MaxValue;
      expect(actVal160).assertEqual(expectVal3);
      const actVal161 = arr.$_get(0);
      const expectVal4 = int32MinValue;
      expect(actVal161).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_7800
     * @tc.name testFloat64ArrayToReversed078
     * @tc.desc Verify toReversed middle decimal values directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const threeValue: number = 3;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const result = arr.toReversed();
      expect(result.length).assertEqual(5);
      const actVal162 = result.$_get(1);
      const expectVal = piValue;
      expect(actVal162).assertEqual(expectVal);
      const actVal163 = result.$_get(3);
      const expectVal2 = maxSafeInteger;
      expect(actVal163).assertEqual(expectVal2);
      const actVal164 = arr.$_get(0);
      const expectVal3 = pointOne;
      expect(actVal164).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_7900
     * @tc.name testFloat64ArrayToReversed079
     * @tc.desc Verify toReversed result returns new reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.toReversed();
      expect(result === arr).assertEqual(false);
      const actVal165 = result.$_get(0);
      const expectVal = pointTwoFive;
      expect(actVal165).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_8000
     * @tc.name testFloat64ArrayToReversed080
     * @tc.desc Verify toReversed returns new instance, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const reversed = arr.toReversed();
      expect(arr[0]).assertEqual(int16MinValue);
      expect(arr[2]).assertEqual(zeroValue);
      expect(reversed[0]).assertEqual(zeroValue);
      expect(reversed[2]).assertEqual(int16MinValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_8100
     * @tc.name testFloat64ArrayToReversed081
     * @tc.desc Verify toReversed with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const hexValue55: number = 0x55;
      const eightyfiveValue: number = 85;
      const num255Value: number = 255;
      const arr = Float64Array.of(hexValueFF, hexValueAA, hexValue55);
      const r = arr.toReversed();
      expect(r[0]).assertEqual(eightyfiveValue);
      expect(r[2]).assertEqual(num255Value);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_8200
     * @tc.name testFloat64ArrayToReversed082
     * @tc.desc Verify toReversed with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const binaryValue01010101: number = 0b01010101;
      const eightyfiveValue: number = 85;
      const num255Value: number = 255;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010, binaryValue01010101);
      const r = arr.toReversed();
      expect(r[0]).assertEqual(eightyfiveValue);
      expect(r[2]).assertEqual(num255Value);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_8300
     * @tc.name testFloat64ArrayToReversed083
     * @tc.desc Verify toReversed with Double.NaN element correctly reversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const result = arr.toReversed();
      const actVal166 = result.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal166).assertEqual(expectVal);
      const actVal167 = Number.isNaN(result.$_get(1));
      const expectVal2 = true;
      expect(actVal167).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOREVERSED_8400
     * @tc.name testFloat64ArrayToReversed084
     * @tc.desc Verify toReversed with Infinity elements correctly reversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToReversed084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const result = arr.toReversed();
      const actVal168 = result.$_get(0);
      const expectVal = negativeInfinity;
      expect(actVal168).assertEqual(expectVal);
      const actVal169 = result.$_get(1);
      const expectVal2 = positiveInfinity;
      expect(actVal169).assertEqual(expectVal2);
    })
  });
}
