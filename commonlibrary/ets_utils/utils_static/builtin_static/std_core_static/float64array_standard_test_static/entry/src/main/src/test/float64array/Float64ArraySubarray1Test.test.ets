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

export default function Float64ArraySubarray1Test(): void {
  describe('Float64ArraySubarray1Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_0100
     * @tc.name testFloat64ArraySubarray1001
     * @tc.desc Verify subarray with no parameters returns full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const pointZeroSixTwoFive: number = 0.0625;
      const fiveValue: number = 5;
      const arr = new Float64Array([pointFive, 1.5, 0.25, 0.125, pointZeroSixTwoFive]);
      const view = arr.subarray();
      expect(view.length).assertEqual(fiveValue);
      const actVal1 = view.$_get(0);
      const expectVal = pointFive;
      expect(actVal1).assertEqual(expectVal);
      const actVal2 = view.$_get(4);
      const expectVal2 = pointZeroSixTwoFive;
      expect(actVal2).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_0200
     * @tc.name testFloat64ArraySubarray1002
     * @tc.desc Verify subarray(2) with [-32768, -128, 0, 127, 32767] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const int16MaxValue: number = 32767;
      const threeValue: number = 3;
      const arr = Float64Array.of(-32768, -128, zeroValue, 127, int16MaxValue);
      const view = arr.subarray(2);
      expect(view.length).assertEqual(threeValue);
      const actVal3 = view.$_get(0);
      const expectVal = zeroValue;
      expect(actVal3).assertEqual(expectVal);
      const actVal4 = view.$_get(2);
      const expectVal2 = int16MaxValue;
      expect(actVal4).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_0300
     * @tc.name testFloat64ArraySubarray1003
     * @tc.desc Verify subarray(1, 4) with [-2147483648, -1, 0, 1, 2147483647] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const threeValue: number = 3;
      const arr = Float64Array.of(-2147483648, negativeOne, 0, oneValue, 2147483647);
      const view = arr.subarray(1, 4);
      expect(view.length).assertEqual(threeValue);
      const actVal5 = view.$_get(0);
      const expectVal = negativeOne;
      expect(actVal5).assertEqual(expectVal);
      const actVal6 = view.$_get(2);
      const expectVal2 = oneValue;
      expect(actVal6).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_0400
     * @tc.name testFloat64ArraySubarray1004
     * @tc.desc Verify subarray begin 0 returns full length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const fiveValue: number = 5;
      const arr = new Float64Array([pointOne, 9007199254740991, 0, 3.141592653589793, -1e-100]);
      const view = arr.subarray(0);
      expect(view.length).assertEqual(fiveValue);
      const actVal7 = view.$_get(0);
      const expectVal = pointOne;
      expect(actVal7).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_0500
     * @tc.name testFloat64ArraySubarray1005
     * @tc.desc Verify subarray begin 3 returns last 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const twoValue: number = 2;
      const arr = Float64Array.of(0.5, 1.5, 0.25, pointOneTwoFive, pointZeroSixTwoFive);
      const view = arr.subarray(3);
      expect(view.length).assertEqual(twoValue);
      const actVal8 = view.$_get(0);
      const expectVal = pointOneTwoFive;
      expect(actVal8).assertEqual(expectVal);
      const actVal9 = view.$_get(1);
      const expectVal2 = pointZeroSixTwoFive;
      expect(actVal9).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_0600
     * @tc.name testFloat64ArraySubarray1006
     * @tc.desc Verify subarray begin -2 returns last 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = new Float64Array([-2147483648, -1, 0, oneValue, 2147483647]);
      const view = arr.subarray(-2);
      expect(view.length).assertEqual(twoValue);
      const actVal10 = view.$_get(0);
      const expectVal = oneValue;
      expect(actVal10).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_0700
     * @tc.name testFloat64ArraySubarray1007
     * @tc.desc Verify subarray(0, 3) array[5] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = new Float64Array([0.1, 9007199254740991, zeroValue, 3.141592653589793, -1e-100]);
      const view = arr.subarray(0, 3);
      expect(view.length).assertEqual(threeValue);
      const actVal11 = view.$_get(2);
      const expectVal = zeroValue;
      expect(actVal11).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_0800
     * @tc.name testFloat64ArraySubarray1008
     * @tc.desc Verify subarray(0, -1) with [0.5, 1.5, 0.25, 0.125, 0.0625] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const fourValue: number = 4;
      const arr = Float64Array.of(0.5, 1.5, 0.25, pointOneTwoFive, 0.0625);
      const view = arr.subarray(0, -1);
      expect(view.length).assertEqual(fourValue);
      const actVal12 = view.$_get(3);
      const expectVal = pointOneTwoFive;
      expect(actVal12).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_0900
     * @tc.name testFloat64ArraySubarray1009
     * @tc.desc Verify subarray(1, 4) array[5] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const view = arr.subarray(1, 4);
      view.$_set(0, fillValue99);
      const actVal13 = arr.$_get(1);
      const expectVal = fillValue99;
      expect(actVal13).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_1000
     * @tc.name testFloat64ArraySubarray1010
     * @tc.desc Verify subarray on single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const oneValue: number = 1;
      const arr = Float64Array.of(int16MinValue);
      const view = arr.subarray(0, 1);
      expect(view.length).assertEqual(oneValue);
      const actVal14 = view.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal14).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_1100
     * @tc.name testFloat64ArraySubarray1011
     * @tc.desc Verify subarray(0, 2) with [-2147483648, -1, 0] returns Float64Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const view = arr.subarray(0, 2);
      let isF64: boolean = false;
      let o: Object = view as Object;
      if (o instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_1200
     * @tc.name testFloat64ArraySubarray1012
     * @tc.desc Verify subarray(1, 4) with 5 elements length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      const view = arr.subarray(1, 4);
      expect(view.length).assertEqual(threeValue);
      const actVal15 = view.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal15).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_1300
     * @tc.name testFloat64ArraySubarray1013
     * @tc.desc Verify subarray(0, 2) with [-32768, -128, 0] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const arr = new Float64Array([-32768, int8MinValue, 0]);
      const view = arr.subarray(0, 2);
      const actVal16 = view.$_get(1);
      const expectVal = int8MinValue;
      expect(actVal16).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_1400
     * @tc.name testFloat64ArraySubarray1014
     * @tc.desc Verify subarray preserves NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const view = arr.subarray(0, 2);
      const actVal17 = Number.isNaN(view.$_get(1));
      const expectVal = false;
      expect(actVal17).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_1500
     * @tc.name testFloat64ArraySubarray1015
     * @tc.desc Verify subarray(0, 2) with [0.1, 9007199254740991, 0] element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const view = arr.subarray(0, 2);
      const actVal18 = view.$_get(1);
      const expectVal = maxSafeInteger;
      expect(actVal18).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_1600
     * @tc.name testFloat64ArraySubarray1016
     * @tc.desc Verify subarray(50, 60) with 100 elements length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenValue: number = 10;
      const fiftyValue: number = 50;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      const view = arr.subarray(50, 60);
      expect(view.length).assertEqual(tenValue);
      const actVal19 = view.$_get(0);
      const expectVal = fiftyValue;
      expect(actVal19).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_1700
     * @tc.name testFloat64ArraySubarray1017
     * @tc.desc Verify subarray(-1) with [0.1, 9007199254740991, 0] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const view = arr.subarray(-1);
      expect(view.length).assertEqual(oneValue);
      const actVal20 = view.$_get(0);
      const expectVal = zeroValue;
      expect(actVal20).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_1800
     * @tc.name testFloat64ArraySubarray1018
     * @tc.desc Verify subarray with negative begin and end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const twoValue: number = 2;
      const arr = Float64Array.of(0.5, 1.5, pointTwoFive, pointOneTwoFive, 0.0625);
      const view = arr.subarray(-3, -1);
      expect(view.length).assertEqual(twoValue);
      const actVal21 = view.$_get(0);
      const expectVal = pointTwoFive;
      expect(actVal21).assertEqual(expectVal);
      const actVal22 = view.$_get(1);
      const expectVal2 = pointOneTwoFive;
      expect(actVal22).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_1900
     * @tc.name testFloat64ArraySubarray1019
     * @tc.desc Verify subarray with begin positive end negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const arr = Float64Array.of(-32768, int8MinValue, zeroValue, 127, 32767);
      const view = arr.subarray(1, -2);
      expect(view.length).assertEqual(twoValue);
      const actVal23 = view.$_get(0);
      const expectVal = int8MinValue;
      expect(actVal23).assertEqual(expectVal);
      const actVal24 = view.$_get(1);
      const expectVal2 = zeroValue;
      expect(actVal24).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_2000
     * @tc.name testFloat64ArraySubarray1020
     * @tc.desc Verify subarray end beyond length clamped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const arr = Float64Array.of(-2147483648, negativeOne, zeroValue);
      const view = arr.subarray(1, 10);
      expect(view.length).assertEqual(twoValue);
      const actVal25 = view.$_get(0);
      const expectVal = negativeOne;
      expect(actVal25).assertEqual(expectVal);
      const actVal26 = view.$_get(1);
      const expectVal2 = zeroValue;
      expect(actVal26).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_2100
     * @tc.name testFloat64ArraySubarray1021
     * @tc.desc Verify subarray begin negative end positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const twoValue: number = 2;
      const arr = new Float64Array([pointOne, maxSafeInteger, 0]);
      const view = arr.subarray(-5, 2);
      expect(view.length).assertEqual(twoValue);
      const actVal27 = view.$_get(0);
      const expectVal = pointOne;
      expect(actVal27).assertEqual(expectVal);
      const actVal28 = view.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal28).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_2200
     * @tc.name testFloat64ArraySubarray1022
     * @tc.desc Verify subarray write to view affects original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125]);
      const view = arr.subarray(1);
      view.$_set(0, fillValue99);
      const actVal29 = arr.$_get(1);
      const expectVal = fillValue99;
      expect(actVal29).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_2300
     * @tc.name testFloat64ArraySubarray1023
     * @tc.desc Verify subarray(1, 3) with [-32768, -128, 0, 127] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const arr = Float64Array.of(-32768, -128, 0, 127);
      const view = arr.subarray(1, 3);
      arr.$_set(1, fillValue99);
      const actVal30 = view.$_get(0);
      const expectVal = fillValue99;
      expect(actVal30).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_2400
     * @tc.name testFloat64ArraySubarray1024
     * @tc.desc Verify subarray view shares same buffer with original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const view = arr.subarray();
      let s: boolean = false;
      let o1: Object = arr.buffer as Object;
      let o2: Object = view.buffer as Object;
      s = o1 === o2;
      const expectVal = true;
      expect(s).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_2500
     * @tc.name testFloat64ArraySubarray1025
     * @tc.desc Verify subarray on array of size 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const threeValue: number = 3;
      const sevenValue: number = 7;
      const arr = new Float64Array(10);
      for (let i: int = 0; i < 10; i++) {
        arr.$_set(i, i);
      }
      const view = arr.subarray(3, 8);
      expect(view.length).assertEqual(fiveValue);
      const actVal31 = view.$_get(0);
      const expectVal = threeValue;
      expect(actVal31).assertEqual(expectVal);
      const actVal32 = view.$_get(4);
      const expectVal2 = sevenValue;
      expect(actVal32).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_2600
     * @tc.name testFloat64ArraySubarray1026
     * @tc.desc Verify subarray with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768, int8MinValue, zeroValue, 127]);
      const view = arr.subarray(1, 3);
      const actVal33 = view.$_get(0);
      const expectVal = int8MinValue;
      expect(actVal33).assertEqual(expectVal);
      const actVal34 = view.$_get(1);
      const expectVal2 = zeroValue;
      expect(actVal34).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_2700
     * @tc.name testFloat64ArraySubarray1027
     * @tc.desc Verify subarray preserves negative zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = new Float64Array([int32MinValue, negativeOne, 0]);
      const view = arr.subarray(0, 2);
      const actVal35 = view.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal35).assertEqual(expectVal);
      const actVal36 = view.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal36).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_2800
     * @tc.name testFloat64ArraySubarray1028
     * @tc.desc Verify subarray(0, 2) with [0.1, 9007199254740991, 0] elements at all indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = new Float64Array([pointOne, maxSafeInteger, 0]);
      const view = arr.subarray(0, 2);
      const actVal37 = view.$_get(0);
      const expectVal = pointOne;
      expect(actVal37).assertEqual(expectVal);
      const actVal38 = view.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal38).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_2900
     * @tc.name testFloat64ArraySubarray1029
     * @tc.desc Verify subarray begin length-1 returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointZeroSixTwoFive: number = 0.0625;
      const oneValue: number = 1;
      const arr = Float64Array.of(0.5, 1.5, 0.25, 0.125, pointZeroSixTwoFive);
      const view = arr.subarray(4);
      expect(view.length).assertEqual(oneValue);
      const actVal39 = view.$_get(0);
      const expectVal = pointZeroSixTwoFive;
      expect(actVal39).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_3000
     * @tc.name testFloat64ArraySubarray1030
     * @tc.desc Verify subarray end -2 excludes last 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793);
      const view = arr.subarray(0, -2);
      const expectVal = twoValue;
      expect(view.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_3100
     * @tc.name testFloat64ArraySubarray1031
     * @tc.desc Verify subarray end INT_MIN returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const view = arr.subarray(0, -2147483648);
      const expectVal = zeroValue;
      expect(view.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_3200
     * @tc.name testFloat64ArraySubarray1032
     * @tc.desc Verify subarray(0, 2) with [0.5, 1.5, 0.25] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive, 1.5, 0.25);
      const view = arr.subarray(0, 2);
      const actVal40 = view.$_get(0);
      const expectVal = pointFive;
      expect(actVal40).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_3300
     * @tc.name testFloat64ArraySubarray1033
     * @tc.desc Verify subarray(0, 3) with [-32768, -128, 0] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue, -128, 0);
      const view = arr.subarray(0, 3);
      const actVal41 = view.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal41).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_3400
     * @tc.name testFloat64ArraySubarray1034
     * @tc.desc Verify subarray(1, 3) with [-2147483648, -1, 0] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, negativeOne, 0);
      const view = arr.subarray(1, 3);
      const actVal42 = view.$_get(0);
      const expectVal = negativeOne;
      expect(actVal42).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_3500
     * @tc.name testFloat64ArraySubarray1035
     * @tc.desc Verify subarray(1, 4) with [0.5, 1.5, 0.25, 0.125] returns Float64Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125]);
      const view = arr.subarray(1, 4);
      let isF64: boolean = false;
      let o: Object = view as Object;
      if (o instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_3600
     * @tc.name testFloat64ArraySubarray1036
     * @tc.desc Verify subarray(1, 3) with [-2147483648, -1, 0, 1] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const arr = new Float64Array([-2147483648, -1, 0, 1]);
      const view = arr.subarray(1, 3);
      view.$_set(0, fillValue99);
      const actVal43 = arr.$_get(1);
      const expectVal = fillValue99;
      expect(actVal43).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_3700
     * @tc.name testFloat64ArraySubarray1037
     * @tc.desc Verify subarray(1, 3) with [0.1, 9007199254740991, 0, 3.141592653589793] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightyeightPointzero: number = 88.0;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793);
      const view = arr.subarray(1, 3);
      arr.$_set(2, eightyeightPointzero);
      const actVal44 = view.$_get(1);
      const expectVal = eightyeightPointzero;
      expect(actVal44).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_3800
     * @tc.name testFloat64ArraySubarray1038
     * @tc.desc Verify subarray(0, 3) with [0.5, 1.5, 0.25, 0.125] shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125]);
      const sub1 = arr.subarray(0, 3);
      const sub2 = arr.subarray(1, 4);
      let s: boolean = false;
      let o1: Object = sub1.buffer as Object;
      let o2: Object = sub2.buffer as Object;
      s = o1 === o2;
      const expectVal = true;
      expect(s).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_3900
     * @tc.name testFloat64ArraySubarray1039
     * @tc.desc Verify multiple subarray views share same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-32768, -128, 0, 127);
      const sub1 = arr.subarray(0, 2);
      const sub2 = arr.subarray(2, 4);
      let s: boolean = false;
      let o1: Object = sub1.buffer as Object;
      let o2: Object = sub2.buffer as Object;
      s = o1 === o2;
      const expectVal = true;
      expect(s).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_4000
     * @tc.name testFloat64ArraySubarray1040
     * @tc.desc Verify subarray length independent of original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const fourValue: number = 4;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793);
      const view = arr.subarray(1, 3);
      expect(view.length).assertEqual(twoValue);
      expect(arr.length).assertEqual(fourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_4100
     * @tc.name testFloat64ArraySubarray1041
     * @tc.desc Verify subarray empty view shares same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const view = arr.subarray(0, 0);
      let s: boolean = false;
      let o1: Object = arr.buffer as Object;
      let o2: Object = view.buffer as Object;
      s = o1 === o2;
      const expectVal = true;
      expect(s).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_4200
     * @tc.name testFloat64ArraySubarray1042
     * @tc.desc Verify subarray(a) with [0.1, 9007199254740991, 0] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const a: int = -1;
      const view = arr.subarray(a);
      const actVal45 = view.$_get(0);
      const expectVal = zeroValue;
      expect(actVal45).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_4300
     * @tc.name testFloat64ArraySubarray1043
     * @tc.desc Verify subarray on slice result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      const sl = arr.slice(0, 3);
      const view = sl.subarray(0, 2);
      const expectVal = twoValue;
      expect(view.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_4400
     * @tc.name testFloat64ArraySubarray1044
     * @tc.desc Verify subarray(2) with [-2147483648, -1, 0, 1, 2147483647] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(-2147483648, -1, zeroValue, 1, 2147483647);
      const view = arr.subarray(2);
      const actVal46 = view.$_get(0);
      const expectVal = zeroValue;
      expect(actVal46).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_4500
     * @tc.name testFloat64ArraySubarray1045
     * @tc.desc Verify subarray without arguments returns full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const sub = values.subarray();
      expect(sub.length).assertEqual(threeValue);
      expect(sub.buffer).assertEqual(values.buffer);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_4600
     * @tc.name testFloat64ArraySubarray1046
     * @tc.desc Verify subarray(begin=1, end=3) returns subview
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const twoValue: number = 2;
      const values = Float64Array.of(-32768, int8MinValue, 0);
      const sub = values.subarray(1, 3);
      expect(sub.length).assertEqual(twoValue);
      expect(sub[0]).assertEqual(int8MinValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_4700
     * @tc.name testFloat64ArraySubarray1047
     * @tc.desc Verify subarray single argument begin=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const values = new Float64Array([-2147483648, -1, 0]);
      const sub = values.subarray(1);
      const expectVal = twoValue;
      expect(sub.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_4800
     * @tc.name testFloat64ArraySubarray1048
     * @tc.desc Verify subarray begin negative counts from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const twoValue: number = 2;
      const values = new Float64Array([0.1, maxSafeInteger, 0]);
      const sub = values.subarray(-2);
      expect(sub.length).assertEqual(twoValue);
      expect(sub[0]).assertEqual(maxSafeInteger);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_4900
     * @tc.name testFloat64ArraySubarray1049
     * @tc.desc Verify subarray end negative counts from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const sub = values.subarray(0, -1);
      const expectVal = twoValue;
      expect(sub.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_5000
     * @tc.name testFloat64ArraySubarray1050
     * @tc.desc Verify subarray view shares buffer modifications affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const values = new Float64Array([-32768, -128, 0]);
      const sub = values.subarray(1, 3);
      sub[0] = 999.0;
      const expectVal = num999Pointzero;
      expect(values[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_5100
     * @tc.name testFloat64ArraySubarray1051
     * @tc.desc Verify subarray begin out of bounds clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array([-2147483648, -1]);
      const sub = values.subarray(5);
      const expectVal = zeroValue;
      expect(sub.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_5200
     * @tc.name testFloat64ArraySubarray1052
     * @tc.desc Verify subarray end out of bounds clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const values = Float64Array.of(0.1, 9007199254740991);
      const sub = values.subarray(0, 100);
      const expectVal = twoValue;
      expect(sub.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_5300
     * @tc.name testFloat64ArraySubarray1053
     * @tc.desc Verify subarray begin=-5 out of bounds clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const values = new Float64Array([-32768, -128]);
      const sub = values.subarray(-5);
      const expectVal = twoValue;
      expect(sub.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_5400
     * @tc.name testFloat64ArraySubarray1054
     * @tc.desc Verify subarray(0, 2) with [-2147483648, -1, 0] child modifies parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num888Pointzero: number = 888.0;
      const values = new Float64Array([-2147483648, -1, 0]);
      const sub = values.subarray(0, 2);
      sub[1] = 888.0;
      const expectVal = num888Pointzero;
      expect(values[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_5500
     * @tc.name testFloat64ArraySubarray1055
     * @tc.desc Verify subarray(1, 3) with [0.1, 9007199254740991, 0] parent modifies child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num777Pointzero: number = 777.0;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const sub = values.subarray(1, 3);
      values[1] = 777.0;
      const expectVal = num777Pointzero;
      expect(sub[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_5600
     * @tc.name testFloat64ArraySubarray1056
     * @tc.desc Verify subarray(1, 3) with [0.5, 1.5, 0.25] child modifies parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const parent = new Float64Array([0.5, 1.5, 0.25]);
      const child = parent.subarray(1, 3);
      child[0] = 999.0;
      const expectVal = num999Pointzero;
      expect(parent[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_5700
     * @tc.name testFloat64ArraySubarray1057
     * @tc.desc Verify subarray(1, 3) with [-32768, -128, 0] parent modifies child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num888Pointzero: number = 888.0;
      const parent = new Float64Array([-32768, -128, 0]);
      const child = parent.subarray(1, 3);
      parent[1] = 888.0;
      const expectVal = num888Pointzero;
      expect(child[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_5800
     * @tc.name testFloat64ArraySubarray1058
     * @tc.desc Verify multi-level subarray view sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num777Pointzero: number = 777.0;
      const parent = Float64Array.of(-2147483648, -1, 0, 1);
      const child1 = parent.subarray(1, 4);
      const child2 = child1.subarray(1, 3);
      child2[0] = 777.0;
      const expectVal = num777Pointzero;
      expect(parent[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_5900
     * @tc.name testFloat64ArraySubarray1059
     * @tc.desc Verify subarray view buffer equals parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array(new ArrayBuffer(24), 0, 3);
      const child = parent.subarray(1, 3);
      const expectVal = parent.buffer;
      expect(child.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_6000
     * @tc.name testFloat64ArraySubarray1060
     * @tc.desc Verify multiple subviews simultaneous modifications affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num500Pointzero: number = 500.0;
      const num600Pointzero: number = 600.0;
      const parent = new Float64Array([0.1, 9007199254740991, 0]);
      const view1 = parent.subarray(0, 2);
      const view2 = parent.subarray(1, 3);
      view1[1] = 500.0;
      expect(view2[0]).assertEqual(num500Pointzero);
      view2[1] = 600.0;
      expect(parent[2]).assertEqual(num600Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_6100
     * @tc.name testFloat64ArraySubarray1061
     * @tc.desc Verify subarray(0, 3) with [0.5, 1.5, 0.25, 0.125, 0.0625] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive, 1.5, 0.25, 0.125, 0.0625);
      const result = arr.subarray(0, 3);
      const expectVal = pointFive;
      expect(result[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_6200
     * @tc.name testFloat64ArraySubarray1062
     * @tc.desc Verify subarray(undefined, 3) with [-32768, -128, 0, 127, 32767] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = new Float64Array([int16MinValue, -128, 0, 127, 32767]);
      const result = arr.subarray(undefined, 3);
      const expectVal = int16MinValue;
      expect(result[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_6300
     * @tc.name testFloat64ArraySubarray1063
     * @tc.desc Verify subarray negative check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const sub = arr.subarray(1, 3);
      expect(sub[0] === 2.0).assertFalse();
      expect(sub[0] === 1.0).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_6400
     * @tc.name testFloat64ArraySubarray1064
     * @tc.desc Verify subarray with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const hexValue55: number = 0x55;
      const hexValue00: number = 0x00;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const twoValue: number = 2;
      const arr = Float64Array.of(hexValueFF, hexValueAA, hexValue55, hexValue00);
      const s = arr.subarray(0, 2);
      expect(s[0]).assertEqual(num255Value);
      expect(s[1]).assertEqual(num170Pointzero);
      expect(s.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_6500
     * @tc.name testFloat64ArraySubarray1065
     * @tc.desc Verify subarray with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const binaryValue01010101: number = 0b01010101;
      const binaryValue00000000: number = 0b00000000;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const twoValue: number = 2;
      const arr = new Float64Array([binaryValue11111111, binaryValue10101010, binaryValue01010101, binaryValue00000000]);
      const s = arr.subarray(0, 2);
      expect(s[0]).assertEqual(num255Value);
      expect(s[1]).assertEqual(num170Pointzero);
      expect(s.length).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_6600
     * @tc.name testFloat64ArraySubarray1066
     * @tc.desc Verify subarray with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const s = arr.subarray(0, 1);
      expect(s.length).assertEqual(1);
      const actVal47 = Number.isNaN(s[0]);
      const expectVal = true;
      expect(actVal47).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_6700
     * @tc.name testFloat64ArraySubarray1067
     * @tc.desc Verify subarray with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const s = arr.subarray(0, 1);
      expect(s.length).assertEqual(1);
      expect(s[0]).assertEqual(positiveInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_6800
     * @tc.name testFloat64ArraySubarray1068
     * @tc.desc Verify subarray with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const s = arr.subarray(0, 2);
      expect(s.length).assertEqual(2);
      expect(s[0]).assertEqual(doubleMinValue);
      expect(s[1]).assertEqual(doubleMaxValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_1_6900
     * @tc.name testFloat64ArraySubarray1069
     * @tc.desc Verify empty subarray view has correct byteOffset at start position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125]);
      const view = arr.subarray(2, 2);
      expect(view.length).assertEqual(0);
      expect(view.byteOffset).assertEqual(16);
      expect(view.buffer).assertEqual(arr.buffer);
    })

  })
}

