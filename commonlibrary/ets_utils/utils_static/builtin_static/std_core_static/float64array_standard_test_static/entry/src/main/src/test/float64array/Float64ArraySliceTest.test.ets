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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

function isF64Arr(obj: Object): boolean {
  return obj instanceof Float64Array;
}

export default function Float64ArraySliceTest(): void {
  describe('Float64ArraySliceTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_0100
     * @tc.name testFloat64ArraySlice001
     * @tc.desc Verify slice with no parameters returns a complete copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const fiveValue: number = 5;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const result = original.slice();
      expect(result.length).assertEqual(fiveValue);
      const actVal1 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal1).assertEqual(expectVal);
      const actVal2 = result.$_get(4);
      const expectVal2 = tinyNegativeValue;
      expect(actVal2).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_0200
     * @tc.name testFloat64ArraySlice002
     * @tc.desc Verify slice with single begin parameter returns elements from begin to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const threeValue: number = 3;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = original.slice(2);
      expect(result.length).assertEqual(threeValue);
      const actVal3 = result.$_get(0);
      const expectVal = pointTwoFive;
      expect(actVal3).assertEqual(expectVal);
      const actVal4 = result.$_get(2);
      const expectVal2 = pointZeroSixTwoFive;
      expect(actVal4).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_0300
     * @tc.name testFloat64ArraySlice003
     * @tc.desc Verify slice with begin and end parameters returns specified range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const threeValue: number = 3;
      const original = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const result = original.slice(1, 4);
      expect(result.length).assertEqual(threeValue);
      const actVal5 = result.$_get(0);
      const expectVal = int8MinValue;
      expect(actVal5).assertEqual(expectVal);
      const actVal6 = result.$_get(2);
      const expectVal2 = int8MaxValue;
      expect(actVal6).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_0400
     * @tc.name testFloat64ArraySlice004
     * @tc.desc Verify slice with begin=0 returns elements from start to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const threeValue: number = 3;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const result = original.slice(0, 3);
      expect(result.length).assertEqual(threeValue);
      const actVal7 = result.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal7).assertEqual(expectVal);
      const actVal8 = result.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal8).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_0500
     * @tc.name testFloat64ArraySlice005
     * @tc.desc Verify slice with begin=1 returns elements from index 1 to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const fourValue: number = 4;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const result = original.slice(1, 5);
      expect(result.length).assertEqual(fourValue);
      const actVal9 = result.$_get(0);
      const expectVal = maxSafeInteger;
      expect(actVal9).assertEqual(expectVal);
      const actVal10 = result.$_get(3);
      const expectVal2 = tinyNegativeValue;
      expect(actVal10).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_0600
     * @tc.name testFloat64ArraySlice006
     * @tc.desc Verify slice with begin=length-1 returns a single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const oneValue: number = 1;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = original.slice(4, 5);
      expect(result.length).assertEqual(oneValue);
      const actVal11 = result.$_get(0);
      const expectVal = pointZeroSixTwoFive;
      expect(actVal11).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_0700
     * @tc.name testFloat64ArraySlice007
     * @tc.desc Verify slice with begin as a very large positive number out of bounds returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = original.slice(1000, 1001);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_0800
     * @tc.name testFloat64ArraySlice008
     * @tc.desc Verify slice with begin=-1 starts from the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const oneValue: number = 1;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = original.slice(-1, 5);
      expect(result.length).assertEqual(oneValue);
      const actVal12 = result.$_get(0);
      const expectVal = pointZeroSixTwoFive;
      expect(actVal12).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_0900
     * @tc.name testFloat64ArraySlice009
     * @tc.desc Verify slice with begin=-2 starts from the second-to-last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const twoValue: number = 2;
      const original = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const result = original.slice(-2, 5);
      expect(result.length).assertEqual(twoValue);
      const actVal13 = result.$_get(0);
      const expectVal = int8MaxValue;
      expect(actVal13).assertEqual(expectVal);
      const actVal14 = result.$_get(1);
      const expectVal2 = int16MaxValue;
      expect(actVal14).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_1000
     * @tc.name testFloat64ArraySlice010
     * @tc.desc Verify slice with begin=-length starts from the beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const fiveValue: number = 5;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const result = original.slice(-5, 5);
      expect(result.length).assertEqual(fiveValue);
      const actVal15 = result.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal15).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_1100
     * @tc.name testFloat64ArraySlice011
     * @tc.desc Verify slice with begin=-(length+1) out of bounds is clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const threeValue: number = 3;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const result = original.slice(-6, 3);
      expect(result.length).assertEqual(threeValue);
      const actVal16 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal16).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_1200
     * @tc.name testFloat64ArraySlice012
     * @tc.desc Verify slice with begin as very large negative out of bounds is clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const twoValue: number = 2;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = original.slice(-1000, 2);
      expect(result.length).assertEqual(twoValue);
      const actVal17 = result.$_get(0);
      const expectVal = pointFive;
      expect(actVal17).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_1300
     * @tc.name testFloat64ArraySlice013
     * @tc.desc Verify slice with begin=1.5 truncated to integer 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const twoValue: number = 2;
      const original = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const result = original.slice(1, 3);
      expect(result.length).assertEqual(twoValue);
      const actVal18 = result.$_get(0);
      const expectVal = int8MinValue;
      expect(actVal18).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_1400
     * @tc.name testFloat64ArraySlice014
     * @tc.desc Verify slice with end=1 returns the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const oneValue: number = 1;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const result = original.slice(0, 1);
      expect(result.length).assertEqual(oneValue);
      const actVal19 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal19).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_1500
     * @tc.name testFloat64ArraySlice015
     * @tc.desc Verify slice with end=length returns a complete copy to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const fiveValue: number = 5;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = original.slice(0, 5);
      expect(result.length).assertEqual(fiveValue);
      const actVal20 = result.$_get(0);
      const expectVal = pointFive;
      expect(actVal20).assertEqual(expectVal);
      const actVal21 = result.$_get(4);
      const expectVal2 = pointZeroSixTwoFive;
      expect(actVal21).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_1600
     * @tc.name testFloat64ArraySlice016
     * @tc.desc Verify slice with end=length+1 out of bounds is clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const fiveValue: number = 5;
      const original = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const result = original.slice(0, 6);
      expect(result.length).assertEqual(fiveValue);
      const actVal22 = result.$_get(4);
      const expectVal = int16MaxValue;
      expect(actVal22).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_1700
     * @tc.name testFloat64ArraySlice017
     * @tc.desc Verify slice with end as very large positive out of bounds is clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = original.slice(0, 1000);
      expect(result.length).assertEqual(threeValue);
      const actVal23 = result.$_get(2);
      const expectVal = zeroValue;
      expect(actVal23).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_1800
     * @tc.name testFloat64ArraySlice018
     * @tc.desc Verify slice with end=-1 excludes the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const fourValue: number = 4;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const result = original.slice(0, -1);
      expect(result.length).assertEqual(fourValue);
      const actVal24 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal24).assertEqual(expectVal);
      const actVal25 = result.$_get(3);
      const expectVal2 = piValue;
      expect(actVal25).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_1900
     * @tc.name testFloat64ArraySlice019
     * @tc.desc Verify slice with end=-2 excludes the last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const threeValue: number = 3;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = original.slice(0, -2);
      expect(result.length).assertEqual(threeValue);
      const actVal26 = result.$_get(0);
      const expectVal = pointFive;
      expect(actVal26).assertEqual(expectVal);
      const actVal27 = result.$_get(2);
      const expectVal2 = pointTwoFive;
      expect(actVal27).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2000
     * @tc.name testFloat64ArraySlice020
     * @tc.desc Verify slice with end=-(length+1) out of bounds is clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const result = original.slice(0, -6);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2100
     * @tc.name testFloat64ArraySlice021
     * @tc.desc Verify slice with end as very large negative out of bounds is clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = original.slice(0, -1000);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2200
     * @tc.name testFloat64ArraySlice022
     * @tc.desc Verify slice with begin=0 end=2 returns the first two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const twoValue: number = 2;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = original.slice(0, 2);
      expect(result.length).assertEqual(twoValue);
      const actVal28 = result.$_get(0);
      const expectVal = pointFive;
      expect(actVal28).assertEqual(expectVal);
      const actVal29 = result.$_get(1);
      const expectVal2 = onePointFive;
      expect(actVal29).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2300
     * @tc.name testFloat64ArraySlice023
     * @tc.desc Verify slice with begin=2 end=5 returns the last three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const threeValue: number = 3;
      const original = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const result = original.slice(2, 5);
      expect(result.length).assertEqual(threeValue);
      const actVal30 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal30).assertEqual(expectVal);
      const actVal31 = result.$_get(2);
      const expectVal2 = int16MaxValue;
      expect(actVal31).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2400
     * @tc.name testFloat64ArraySlice024
     * @tc.desc Verify slice with begin=2 end=3 returns a single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const result = original.slice(2, 3);
      expect(result.length).assertEqual(oneValue);
      const actVal32 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal32).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2500
     * @tc.name testFloat64ArraySlice025
     * @tc.desc Verify slice with begin=-3 end=-1 returns the two middle elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const twoValue: number = 2;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const result = original.slice(-3, -1);
      expect(result.length).assertEqual(twoValue);
      const actVal33 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal33).assertEqual(expectVal);
      const actVal34 = result.$_get(1);
      const expectVal2 = oneValue;
      expect(actVal34).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2600
     * @tc.name testFloat64ArraySlice026
     * @tc.desc Verify slice with begin=-4 end=-2 returns two middle elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const twoValue: number = 2;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const result = original.slice(-4, -2);
      expect(result.length).assertEqual(twoValue);
      const actVal35 = result.$_get(0);
      const expectVal = maxSafeInteger;
      expect(actVal35).assertEqual(expectVal);
      const actVal36 = result.$_get(1);
      const expectVal2 = zeroValue;
      expect(actVal36).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2700
     * @tc.name testFloat64ArraySlice027
     * @tc.desc Verify slice with begin=1 end=-1 returns elements excluding first and last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const threeValue: number = 3;
      const original = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const result = original.slice(1, -1);
      expect(result.length).assertEqual(threeValue);
      const actVal37 = result.$_get(0);
      const expectVal = int8MinValue;
      expect(actVal37).assertEqual(expectVal);
      const actVal38 = result.$_get(2);
      const expectVal2 = int8MaxValue;
      expect(actVal38).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2800
     * @tc.name testFloat64ArraySlice028
     * @tc.desc Verify slice with negative begin and positive end mixed signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const result = original.slice(-2, 4);
      expect(result.length).assertEqual(oneValue);
      const actVal39 = result.$_get(0);
      const expectVal = oneValue;
      expect(actVal39).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2900
     * @tc.name testFloat64ArraySlice029
     * @tc.desc Verify slice on single-element array without parameters returns a copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const oneValue: number = 1;
      const original = Float64Array.of(pointOne);
      const result = original.slice();
      expect(result.length).assertEqual(oneValue);
      const actVal40 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal40).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_3000
     * @tc.name testFloat64ArraySlice030
     * @tc.desc Verify slice(0,1) on single-element array returns a copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const oneValue: number = 1;
      const original = Float64Array.of(pointFive);
      const result = original.slice(0, 1);
      expect(result.length).assertEqual(oneValue);
      const actVal41 = result.$_get(0);
      const expectVal = pointFive;
      expect(actVal41).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_3100
     * @tc.name testFloat64ArraySlice031
     * @tc.desc Verify slice(-1,1) on single-element array returns the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const oneValue: number = 1;
      const original = Float64Array.of(int32MinValue);
      const result = original.slice(-1, 1);
      expect(result.length).assertEqual(oneValue);
      const actVal42 = result.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal42).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_3200
     * @tc.name testFloat64ArraySlice032
     * @tc.desc Verify slice(0,2) on two-element array returns all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const twoValue: number = 2;
      const original = Float64Array.of(pointOne, maxSafeInteger);
      const result = original.slice(0, 2);
      expect(result.length).assertEqual(twoValue);
      const actVal43 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal43).assertEqual(expectVal);
      const actVal44 = result.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal44).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_3300
     * @tc.name testFloat64ArraySlice033
     * @tc.desc Verify slice(1,2) on two-element array returns the second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const oneValue: number = 1;
      const original = Float64Array.of(pointFive, onePointFive);
      const result = original.slice(1, 2);
      expect(result.length).assertEqual(oneValue);
      const actVal45 = result.$_get(0);
      const expectVal = onePointFive;
      expect(actVal45).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_3400
     * @tc.name testFloat64ArraySlice034
     * @tc.desc Verify slice(-2,-1) on two-element array returns the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const oneValue: number = 1;
      const original = Float64Array.of(int16MinValue, int8MinValue);
      const result = original.slice(-2, -1);
      expect(result.length).assertEqual(oneValue);
      const actVal46 = result.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal46).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_3500
     * @tc.name testFloat64ArraySlice035
     * @tc.desc Verify slice with begin=2.999 truncated to integer 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const twoValue: number = 2;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const result = original.slice(2, 4);
      expect(result.length).assertEqual(twoValue);
      const actVal47 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal47).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_3600
     * @tc.name testFloat64ArraySlice036
     * @tc.desc Verify slice with begin as Number.MAX_SAFE_INTEGER a very large positive out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = original.slice(2147483647, 2147483646);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_3700
     * @tc.name testFloat64ArraySlice037
     * @tc.desc Verify slice with begin as -Number.MAX_SAFE_INTEGER very large negative clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const twoValue: number = 2;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = original.slice(-2147483646, 2);
      expect(result.length).assertEqual(twoValue);
      const actVal48 = result.$_get(0);
      const expectVal = pointFive;
      expect(actVal48).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_3800
     * @tc.name testFloat64ArraySlice038
     * @tc.desc Verify slice returns a new array with buffer independent from original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const num999Pointzero: number = 999.0;
      const original = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = original.slice();
      result.$_set(0, num999Pointzero);
      const actVal49 = original.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal49).assertEqual(expectVal);
      const actVal50 = result.$_get(0);
      const expectVal2 = num999Pointzero;
      expect(actVal50).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_3900
     * @tc.name testFloat64ArraySlice039
     * @tc.desc Verify slice copy has the same element values as original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const result = original.slice(1, 4);
      const actVal51 = result.$_get(0);
      const expectVal = negativeOne;
      expect(actVal51).assertEqual(expectVal);
      const actVal52 = result.$_get(1);
      const expectVal2 = zeroValue;
      expect(actVal52).assertEqual(expectVal2);
      const actVal53 = result.$_get(2);
      const expectVal3 = oneValue;
      expect(actVal53).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_4000
     * @tc.name testFloat64ArraySlice040
     * @tc.desc Verify original array modification does not affect the slice copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const num999Pointzero: number = 999.0;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = original.slice();
      original.$_set(0, num999Pointzero);
      const actVal54 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal54).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_4100
     * @tc.name testFloat64ArraySlice041
     * @tc.desc Verify slice copy buffer is independent from the original buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenValue: number = 16;
      const buffer = new ArrayBuffer(48);
      const original = new Float64Array(buffer, 8, 5);
      const result = original.slice(1, 3);
      const expectVal = sixteenValue;
      expect(result.byteLength).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_4200
     * @tc.name testFloat64ArraySlice042
     * @tc.desc Verify slice with begin=-3 starts from the third element from the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const threeValue: number = 3;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = original.slice(-3);
      expect(result.length).assertEqual(threeValue);
      const actVal55 = result.$_get(0);
      const expectVal = pointTwoFive;
      expect(actVal55).assertEqual(expectVal);
      const actVal56 = result.$_get(2);
      const expectVal2 = pointZeroSixTwoFive;
      expect(actVal56).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_4300
     * @tc.name testFloat64ArraySlice043
     * @tc.desc Verify slice with begin=-4 end=-1 returns three middle elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const threeValue: number = 3;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const result = original.slice(-4, -1);
      expect(result.length).assertEqual(threeValue);
      const actVal57 = result.$_get(0);
      const expectVal = negativeOne;
      expect(actVal57).assertEqual(expectVal);
      const actVal58 = result.$_get(2);
      const expectVal2 = oneValue;
      expect(actVal58).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_4400
     * @tc.name testFloat64ArraySlice044
     * @tc.desc Verify slice with begin=-3 end=-2 returns a single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const oneValue: number = 1;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const result = original.slice(-3, -2);
      expect(result.length).assertEqual(oneValue);
      const actVal59 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal59).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_4500
     * @tc.name testFloat64ArraySlice045
     * @tc.desc Verify slice with begin out of bounds positive returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const zeroValue: number = 0;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = original.slice(10, 15);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_4600
     * @tc.name testFloat64ArraySlice046
     * @tc.desc Verify slice with begin=0 end out of bounds positive clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const fiveValue: number = 5;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const result = original.slice(0, 100);
      expect(result.length).assertEqual(fiveValue);
      const actVal60 = result.$_get(4);
      const expectVal = int32MaxValue;
      expect(actVal60).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_4700
     * @tc.name testFloat64ArraySlice047
     * @tc.desc Verify slice with begin=2 end out of bounds positive clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const threeValue: number = 3;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const result = original.slice(2, 100);
      expect(result.length).assertEqual(threeValue);
      const actVal61 = result.$_get(2);
      const expectVal = tinyNegativeValue;
      expect(actVal61).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_4800
     * @tc.name testFloat64ArraySlice048
     * @tc.desc Verify slice with negative begin out of bounds and positive end out of bounds returns all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const threeValue: number = 3;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = original.slice(-100, 100);
      expect(result.length).assertEqual(threeValue);
      const actVal62 = result.$_get(0);
      const expectVal = pointFive;
      expect(actVal62).assertEqual(expectVal);
      const actVal63 = result.$_get(2);
      const expectVal2 = pointTwoFive;
      expect(actVal63).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_4900
     * @tc.name testFloat64ArraySlice049
     * @tc.desc Verify slice with positive begin out of bounds and negative end out of bounds returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const original = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const result = original.slice(100, -100);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_5000
     * @tc.name testFloat64ArraySlice050
     * @tc.desc Verify slice with begin=100 end=50 both out of bounds positive returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const zeroValue: number = 0;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = original.slice(100, 50);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_5100
     * @tc.name testFloat64ArraySlice051
     * @tc.desc Verify slice with begin=-100 end=-50 both negative out of bounds returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const original = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = original.slice(-100, -50);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_5200
     * @tc.name testFloat64ArraySlice052
     * @tc.desc Verify slice does not throw even when parameters are out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      try {
        const result = original.slice(1000, 2000);
        expect(result.length).assertEqual(zeroValue);
      } catch (e) {
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_5300
     * @tc.name testFloat64ArraySlice053
     * @tc.desc Verify slice does not throw when both parameters are negative out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      try {
        const result = original.slice(-1000, -500);
        expect(result.length).assertEqual(zeroValue);
      } catch (e) {
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_5400
     * @tc.name testFloat64ArraySlice054
     * @tc.desc Verify slice does not throw when mixed out of bounds parameters are used
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const threeValue: number = 3;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      try {
        const result = original.slice(-100, 100);
        expect(result.length).assertEqual(threeValue);
      } catch (e) {
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_5500
     * @tc.name testFloat64ArraySlice055
     * @tc.desc Verify slice does not throw when begin greater than end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const original = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      try {
        const result = original.slice(5, 2);
        expect(result.length).assertEqual(zeroValue);
      } catch (e) {
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_5600
     * @tc.name testFloat64ArraySlice056
     * @tc.desc Verify slice with begin as a very large positive number out of bounds returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = original.slice(2147483647, 2147483647);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_5700
     * @tc.name testFloat64ArraySlice057
     * @tc.desc Verify slice with begin as a very large negative number clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = original.slice(-2147483647, 2);
      expect(result.length).assertEqual(twoValue);
      const actVal64 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal64).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_5800
     * @tc.name testFloat64ArraySlice058
     * @tc.desc Verify slice with end as a very large positive number clamped to length returns all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const fiveValue: number = 5;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = original.slice(0, 2147483647);
      expect(result.length).assertEqual(fiveValue);
      const actVal65 = result.$_get(4);
      const expectVal = pointZeroSixTwoFive;
      expect(actVal65).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_5900
     * @tc.name testFloat64ArraySlice059
     * @tc.desc Verify slice with begin=2147483647 INT_MAX out of bounds returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const original = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = original.slice(2147483647, 2147483645);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_6000
     * @tc.name testFloat64ArraySlice060
     * @tc.desc Verify slice with begin=-2147483648 INT_MIN clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = original.slice(-2147483647, 2);
      expect(result.length).assertEqual(twoValue);
      const actVal66 = result.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal66).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_6100
     * @tc.name testFloat64ArraySlice061
     * @tc.desc Verify slice with begin=0o3 octal literal equal to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const twoValue: number = 2;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const result = original.slice(0o3, 5);
      expect(result.length).assertEqual(twoValue);
      const actVal67 = result.$_get(0);
      const expectVal = piValue;
      expect(actVal67).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_6200
     * @tc.name testFloat64ArraySlice062
     * @tc.desc Verify slice with end=0x4 hexadecimal literal equal to 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const fourValue: number = 4;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = original.slice(0, 0x4);
      expect(result.length).assertEqual(fourValue);
      const actVal68 = result.$_get(3);
      const expectVal = pointOneTwoFive;
      expect(actVal68).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_6300
     * @tc.name testFloat64ArraySlice063
     * @tc.desc Verify slice with array containing zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const original = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const result = original.slice(1, 2);
      expect(result.length).assertEqual(oneValue);
      const actVal69 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal69).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_6400
     * @tc.name testFloat64ArraySlice064
     * @tc.desc Verify slice with array containing Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = original.slice(1, 2);
      expect(result.length).assertEqual(oneValue);
      const actVal70 = result.$_get(0) === Infinity;
      const expectVal = false;
      expect(actVal70).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_6500
     * @tc.name testFloat64ArraySlice065
     * @tc.desc Verify slice with array containing negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const oneValue: number = 1;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = original.slice(1, 2);
      expect(result.length).assertEqual(oneValue);
      const actVal71 = result.$_get(0);
      const expectVal = onePointFive;
      expect(actVal71).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_6600
     * @tc.name testFloat64ArraySlice066
     * @tc.desc Verify slice with array containing Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const original = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = original.slice(1, 2);
      expect(result.length).assertEqual(oneValue);
      const actVal72 = result.$_get(0);
      const expectVal = int8MinValue;
      expect(actVal72).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_6700
     * @tc.name testFloat64ArraySlice067
     * @tc.desc Verify slice with array containing minimum positive value 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = original.slice(1, 2);
      expect(result.length).assertEqual(oneValue);
      const actVal73 = result.$_get(0);
      const expectVal = negativeOne;
      expect(actVal73).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_6800
     * @tc.name testFloat64ArraySlice068
     * @tc.desc Verify slice with array where all elements are the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piValue: number = 3.141592653589793;
      const twoValue: number = 2;
      const original = Float64Array.of(piValue, piValue, piValue, piValue);
      const result = original.slice(1, 3);
      expect(result.length).assertEqual(twoValue);
      const actVal74 = result.$_get(0);
      const expectVal = piValue;
      expect(actVal74).assertEqual(expectVal);
      const actVal75 = result.$_get(1);
      const expectVal2 = piValue;
      expect(actVal75).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_6900
     * @tc.name testFloat64ArraySlice069
     * @tc.desc Verify original array elements are unchanged after slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const original = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const result = original.slice(1, 4);
      const actVal76 = original.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal76).assertEqual(expectVal);
      const actVal77 = original.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal77).assertEqual(expectVal2);
      const actVal78 = original.$_get(4);
      const expectVal3 = int16MaxValue;
      expect(actVal78).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_7000
     * @tc.name testFloat64ArraySlice070
     * @tc.desc Verify multiple slices on the same original array do not mutate it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const fiveValue: number = 5;
      const twoValue: number = 2;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const r1 = original.slice(0, 2);
      const r2 = original.slice(2, 4);
      const r3 = original.slice(1, 3);
      expect(original.length).assertEqual(fiveValue);
      expect(r1.length).assertEqual(twoValue);
      expect(r2.length).assertEqual(twoValue);
      expect(r3.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_7100
     * @tc.name testFloat64ArraySlice071
     * @tc.desc Verify slice with array containing negative Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = original.slice(1, 2);
      expect(result.length).assertEqual(oneValue);
      const actVal79 = result.$_get(0);
      const expectVal = maxSafeInteger;
      expect(actVal79).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_7200
     * @tc.name testFloat64ArraySlice072
     * @tc.desc Verify slice with array containing NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const oneValue: number = 1;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = original.slice(1, 2);
      expect(result.length).assertEqual(oneValue);
      const actVal80 = Number.isNaN(result.$_get(0));
      const expectVal = false;
      expect(actVal80).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_7300
     * @tc.name testFloat64ArraySlice073
     * @tc.desc Verify slice with array containing Number.MAX_SAFE_INTEGER value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const threePointZero: number = 3.0;
      const oneValue: number = 1;
      const original = Float64Array.of(onePointZero, maxSafeInteger, threePointZero);
      const result = original.slice(1, 2);
      expect(result.length).assertEqual(oneValue);
      const actVal81 = result.$_get(0);
      const expectVal = maxSafeInteger;
      expect(actVal81).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_7400
     * @tc.name testFloat64ArraySlice074
     * @tc.desc Verify slice with array containing negative Number.MAX_SAFE_INTEGER value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const threePointZero: number = 3.0;
      const oneValue: number = 1;
      const original = Float64Array.of(onePointZero, -maxSafeInteger, threePointZero);
      const result = original.slice(1, 2);
      expect(result.length).assertEqual(oneValue);
      const actVal82 = result.$_get(0);
      const expectVal = -maxSafeInteger;
      expect(actVal82).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_7500
     * @tc.name testFloat64ArraySlice075
     * @tc.desc Verify slice with array containing all special values Infinity -Infinity NaN MAX_VALUE MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const sixValue: number = 6;
      const original = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue, zeroValue);
      const result = original.slice(0, 6);
      expect(result.length).assertEqual(sixValue);
      const actVal83 = result.$_get(0) === Infinity;
      const expectVal = false;
      expect(actVal83).assertEqual(expectVal);
      const actVal84 = result.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal84).assertEqual(expectVal2);
      const actVal85 = Number.isNaN(result.$_get(2));
      const expectVal3 = false;
      expect(actVal85).assertEqual(expectVal3);
      const actVal86 = result.$_get(3);
      const expectVal4 = int8MaxValue;
      expect(actVal86).assertEqual(expectVal4);
      const actVal87 = result.$_get(4);
      const expectVal5 = int16MaxValue;
      expect(actVal87).assertEqual(expectVal5);
      const actVal88 = result.$_get(5);
      const expectVal6 = zeroValue;
      expect(actVal88).assertEqual(expectVal6);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_7600
     * @tc.name testFloat64ArraySlice076
     * @tc.desc Verify slice without arguments returns full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const values = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const sliced = values.slice();
      expect(sliced.length).assertEqual(threeValue);
      expect(sliced[0]).assertEqual(int32MinValue);
      expect(sliced === values).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_7700
     * @tc.name testFloat64ArraySlice077
     * @tc.desc Verify slice(begin=0, end=2) returns subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const sliced = values.slice(0, 2);
      expect(sliced.length).assertEqual(twoValue);
      expect(sliced[0]).assertEqual(pointOne);
      expect(sliced[1]).assertEqual(maxSafeInteger);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_7800
     * @tc.name testFloat64ArraySlice078
     * @tc.desc Verify slice(begin=1, end=3) returns subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const twoValue: number = 2;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const sliced = values.slice(1, 3);
      expect(sliced.length).assertEqual(twoValue);
      expect(sliced[0]).assertEqual(onePointFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_7900
     * @tc.name testFloat64ArraySlice079
     * @tc.desc Verify slice single argument begin=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const values = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const sliced = values.slice(1);
      const expectVal = twoValue;
      expect(sliced.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_8000
     * @tc.name testFloat64ArraySlice080
     * @tc.desc Verify slice begin negative counts from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const values = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const sliced = values.slice(-2);
      expect(sliced.length).assertEqual(twoValue);
      expect(sliced[0]).assertEqual(negativeOne);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_8100
     * @tc.name testFloat64ArraySlice081
     * @tc.desc Verify slice end negative counts from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const sliced = values.slice(0, -1);
      expect(sliced.length).assertEqual(twoValue);
      expect(sliced[1]).assertEqual(maxSafeInteger);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_8200
     * @tc.name testFloat64ArraySlice082
     * @tc.desc Verify slice both begin and end negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const twoValue: number = 2;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive);
      const sliced = values.slice(-3, -1);
      expect(sliced.length).assertEqual(twoValue);
      expect(sliced[0]).assertEqual(onePointFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_8300
     * @tc.name testFloat64ArraySlice083
     * @tc.desc Verify slice begin out of bounds returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const values = Float64Array.of(int16MinValue, int8MinValue);
      const sliced = values.slice(5);
      const expectVal = zeroValue;
      expect(sliced.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_8400
     * @tc.name testFloat64ArraySlice084
     * @tc.desc Verify slice end out of bounds clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const values = Float64Array.of(int32MinValue, negativeOne);
      const sliced = values.slice(0, 100);
      const expectVal = twoValue;
      expect(sliced.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_8500
     * @tc.name testFloat64ArraySlice085
     * @tc.desc Verify slice begin=-5 out of bounds clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const twoValue: number = 2;
      const values = Float64Array.of(pointFive, onePointFive);
      const sliced = values.slice(-5);
      const expectVal = twoValue;
      expect(sliced.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_8600
     * @tc.name testFloat64ArraySlice086
     * @tc.desc Verify slice returns new array original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const values = Float64Array.of(int16MinValue, int8MinValue);
      const sliced = values.slice(0, 1);
      values[0] = 999.0;
      const expectVal = int16MinValue;
      expect(sliced[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_8700
     * @tc.name testFloat64ArraySlice087
     * @tc.desc Verify slice result negative check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const sliced = arr.slice(1, 3);
      expect(sliced[0] === 2.0).assertEqual(false);
      expect(sliced[0] === 1.0).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_8800
     * @tc.name testFloat64ArraySlice088
     * @tc.desc Verify slice with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const hexValue55: number = 0x55;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const twoValue: number = 2;
      const arr = Float64Array.of(hexValueFF, hexValueAA, hexValue55);
      const s = arr.slice(0, 2);
      expect(s[0]).assertEqual(num255Value);
      expect(s[1]).assertEqual(num170Pointzero);
      expect(s.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_8900
     * @tc.name testFloat64ArraySlice089
     * @tc.desc Verify slice with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const binaryValue01010101: number = 0b01010101;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const twoValue: number = 2;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010, binaryValue01010101);
      const s = arr.slice(0, 2);
      expect(s[0]).assertEqual(num255Value);
      expect(s[1]).assertEqual(num170Pointzero);
      expect(s.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_9000
     * @tc.name testFloat64ArraySlice090
     * @tc.desc Verify slice with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const twoValue: number = 2;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const s = arr.slice(0, 2);
      const actVal89 = Number.isNaN(s[0]);
      const expectVal = true;
      expect(actVal89).assertEqual(expectVal);
      expect(s[1]).assertEqual(doubleMaxValue);
      expect(s.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_9100
     * @tc.name testFloat64ArraySlice091
     * @tc.desc Verify slice with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const twoValue: number = 2;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const s = arr.slice(0, 2);
      expect(s[0]).assertEqual(positiveInfinity);
      expect(s[1]).assertEqual(negativeInfinity);
      expect(s.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_9200
     * @tc.name testFloat64ArraySlice092
     * @tc.desc Verify slice with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const twoValue: number = 2;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const s = arr.slice(0, 2);
      expect(s[0]).assertEqual(doubleMinValue);
      expect(s[1]).assertEqual(doubleMaxValue);
      expect(s.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_9300
     * @tc.name testFloat64ArraySlice093
     * @tc.desc Verify slice with begin=-0 treated as 0 returns full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0, 30.0);
      const s = arr.slice(-0);
      expect(s.length).assertEqual(3);
      const actVal90 = s.$_get(0);
      const expectVal = 10.0;
      expect(actVal90).assertEqual(expectVal);
      const actVal91 = s.$_get(2);
      const expectVal2 = 30.0;
      expect(actVal91).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_9400
     * @tc.name testFloat64ArraySlice094
     * @tc.desc Verify slice with end=-0 treated as 0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0, 30.0);
      const s = arr.slice(0, -0);
      const expectVal = 0;
      expect(s.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_9500
     * @tc.name testFloat64ArraySlice095
     * @tc.desc Verify slice with begin=-0 end=2 treated as slice(0,2) returns first two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0, 30.0);
      const s = arr.slice(-0, 2);
      expect(s.length).assertEqual(2);
      const actVal92 = s.$_get(0);
      const expectVal = 10.0;
      expect(actVal92).assertEqual(expectVal);
      const actVal93 = s.$_get(1);
      const expectVal2 = 20.0;
      expect(actVal93).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_9600
     * @tc.name testFloat64ArraySlice096
     * @tc.desc Verify slice with begin=-0 end=-0 treated as slice(0,0) returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0, 30.0);
      const s = arr.slice(-0, -0);
      const expectVal = 0;
      expect(s.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_9700
     * @tc.name testFloat64ArraySlice097
     * @tc.desc Verify slice with begin=1 end=-0 treated as slice(1,0) returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0, 30.0);
      const s = arr.slice(1, -0);
      const expectVal = 0;
      expect(s.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_9800
     * @tc.name testFloat64ArraySlice098
     * @tc.desc Verify slice with large array 10000 elements performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array(10000);
      for (let i: int = 0; i < 10000; i++) {
        arr.$_set(i, i + oneValue);
      }
      const s = arr.slice(0, 10000);
      expect(s.length).assertEqual(10000);
      const actVal94 = s.$_get(0);
      const expectVal = oneValue;
      expect(actVal94).assertEqual(expectVal);
      const actVal95 = s.$_get(9999);
      const expectVal2 = 10000.0;
      expect(actVal95).assertEqual(expectVal2);
    })

  })
}
