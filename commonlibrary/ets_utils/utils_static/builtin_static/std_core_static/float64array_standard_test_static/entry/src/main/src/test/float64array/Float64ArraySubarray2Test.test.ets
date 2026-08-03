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

export default function Float64ArraySubarray2Test(): void {
  describe('Float64ArraySubarray2Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_0100
     * @tc.name testFloat64ArraySubarray2001
     * @tc.desc Verify subarray(1, 4) array[5] returns Float64Array instance and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const sub = arr.subarray(1, 4);
      let isF64: boolean = false;
      let o: Object = sub as Object;
      if (o instanceof Float64Array) {
        isF64 = true;
      }
      const expectVal = true;
      expect(isF64).assertEqual(expectVal);
      const threeValue: number = 3;
      const maxSafeInteger: number = 9007199254740991;
      expect(sub.length).assertEqual(threeValue);
      expect(sub.$_get(0)).assertEqual(maxSafeInteger);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_0200
     * @tc.name testFloat64ArraySubarray2002
     * @tc.desc Verify subarray(1, 4) with [0.5, 1.5, 0.25, 0.125, 0.0625] parent buffer equals child buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const sub = arr.subarray(1, 4);
      let o1: Object = arr.buffer as Object;
      let o2: Object = sub.buffer as Object;
      expect(o1).assertEqual(o2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_0300
     * @tc.name testFloat64ArraySubarray2003
     * @tc.desc Verify subarray(1, 4) child modifies index 0 reflects in parent index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      const sub = arr.subarray(1, 4);
      sub.$_set(0, fillValue99);
      const actVal1 = arr.$_get(1);
      const expectVal = fillValue99;
      expect(actVal1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_0400
     * @tc.name testFloat64ArraySubarray2004
     * @tc.desc Verify subarray(1, 4) parent array modification reflects in child view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightyeightPointzero: number = 88.0;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const sub = arr.subarray(1, 4);
      arr.$_set(1, eightyeightPointzero);
      const actVal2 = sub.$_get(0);
      const expectVal = eightyeightPointzero;
      expect(actVal2).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_0500
     * @tc.name testFloat64ArraySubarray2005
     * @tc.desc Verify subarray(1, 4) over mixed numeric values returns max safe and pi elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const piValue: number = 3.141592653589793;
      const arr = new Float64Array([0.1, maxSafeInteger, 0, piValue, -1e-100]);
      const sub = arr.subarray(1, 4);
      const actVal3 = sub.$_get(0);
      const expectVal = maxSafeInteger;
      expect(actVal3).assertEqual(expectVal);
      const actVal4 = sub.$_get(2);
      const expectVal2 = piValue;
      expect(actVal4).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_0600
     * @tc.name testFloat64ArraySubarray2006
     * @tc.desc Verify Subarray2 begin-only view over int16 sequence returns four values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const threeValue: number = 3;
      const arr = new Float64Array([-32768, int8MinValue, 0, 127]);
      const sub = arr.subarray(1);
      expect(sub.length).assertEqual(threeValue);
      const actVal5 = sub.$_get(0);
      const expectVal = int8MinValue;
      expect(actVal5).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_0700
     * @tc.name testFloat64ArraySubarray2007
     * @tc.desc Verify subarray(0, 2) with [-2147483648, -1, 0, 1] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = new Float64Array([int32MinValue, negativeOne, 0, 1]);
      const sub = arr.subarray(0, 2);
      expect(sub.length).assertEqual(twoValue);
      const actVal6 = sub.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal6).assertEqual(expectVal);
      const actVal7 = sub.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal7).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_0800
     * @tc.name testFloat64ArraySubarray2008
     * @tc.desc Verify subarray(0, 1) with [-32768] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const oneValue: number = 1;
      const arr = Float64Array.of(int16MinValue);
      const sub = arr.subarray(0, 1);
      expect(sub.length).assertEqual(oneValue);
      const actVal8 = sub.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal8).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_0900
     * @tc.name testFloat64ArraySubarray2009
     * @tc.desc Verify subarray(0, 1) with [-2147483648, -1] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const oneValue: number = 1;
      const arr = Float64Array.of(int32MinValue, -1);
      const sub = arr.subarray(0, 1);
      expect(sub.length).assertEqual(oneValue);
      const actVal9 = sub.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal9).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_1000
     * @tc.name testFloat64ArraySubarray2010
     * @tc.desc Verify Subarray2 middle large-array span returns twenty elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyValue: number = 20;
      const fiftyValue: number = 50;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      const sub = arr.subarray(50, 70);
      expect(sub.length).assertEqual(twentyValue);
      const actVal10 = sub.$_get(0);
      const expectVal = fiftyValue;
      expect(actVal10).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_1100
     * @tc.name testFloat64ArraySubarray2011
     * @tc.desc Verify Subarray2 first two mixed scalar values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const sub = arr.subarray(0, 2);
      const actVal11 = sub.$_get(1);
      const expectVal = maxSafeInteger;
      expect(actVal11).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_1200
     * @tc.name testFloat64ArraySubarray2012
     * @tc.desc Verify subarray(0, 2) with [0.5, 1.5, 0.25] element values and not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const sub = arr.subarray(0, 2);
      expect(sub.$_get(1)).assertEqual(onePointFive);
      const actVal12 = Number.isNaN(sub.$_get(1));
      const expectVal = false;
      expect(actVal12).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_1300
     * @tc.name testFloat64ArraySubarray2013
     * @tc.desc Verify subarray(0, 2) over int16 and int8 values returns second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const arr = new Float64Array([-32768, int8MinValue, 0]);
      const sub = arr.subarray(0, 2);
      const actVal13 = sub.$_get(1);
      const expectVal = int8MinValue;
      expect(actVal13).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_1400
     * @tc.name testFloat64ArraySubarray2014
     * @tc.desc Verify Subarray2 int32 prefix exposes first two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, negativeOne, 0);
      const sub = arr.subarray(0, 2);
      const actVal14 = sub.$_get(1);
      const expectVal = negativeOne;
      expect(actVal14).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_1500
     * @tc.name testFloat64ArraySubarray2015
     * @tc.desc Verify Subarray2 mixed decimal prefix exposes max safe value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = new Float64Array([pointOne, maxSafeInteger]);
      const sub = arr.subarray(0, 2);
      const actVal15 = sub.$_get(0);
      const expectVal = pointOne;
      expect(actVal15).assertEqual(expectVal);
      const actVal16 = sub.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal16).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_1600
     * @tc.name testFloat64ArraySubarray2016
     * @tc.desc Verify Subarray2 fractional middle window returns 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(0.5, onePointFive, pointTwoFive);
      const sub = arr.subarray(1, 3);
      const actVal17 = sub.$_get(0);
      const expectVal = onePointFive;
      expect(actVal17).assertEqual(expectVal);
      const actVal18 = sub.$_get(1);
      const expectVal2 = pointTwoFive;
      expect(actVal18).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_1700
     * @tc.name testFloat64ArraySubarray2017
     * @tc.desc Verify Subarray2 int16 middle window returns -128 and 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768, int8MinValue, zeroValue]);
      const sub = arr.subarray(1, 3);
      const actVal19 = sub.$_get(0);
      const expectVal = int8MinValue;
      expect(actVal19).assertEqual(expectVal);
      const actVal20 = sub.$_get(1);
      const expectVal2 = zeroValue;
      expect(actVal20).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_1800
     * @tc.name testFloat64ArraySubarray2018
     * @tc.desc Verify Subarray2 first int32 element window length one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = new Float64Array([int32MinValue, -1, 0]);
      const sub = arr.subarray(0, 1);
      const actVal21 = sub.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal21).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_1900
     * @tc.name testFloat64ArraySubarray2019
     * @tc.desc Verify Subarray2 first decimal element window length one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = Float64Array.of(pointOne, 9007199254740991);
      const sub = arr.subarray(0, 1);
      const actVal22 = sub.$_get(0);
      const expectVal = pointOne;
      expect(actVal22).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_2000
     * @tc.name testFloat64ArraySubarray2020
     * @tc.desc Verify subarray(0, 1) with [0.5] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = new Float64Array([pointFive]);
      const sub = arr.subarray(0, 1);
      const actVal23 = sub.$_get(0);
      const expectVal = pointFive;
      expect(actVal23).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_2100
     * @tc.name testFloat64ArraySubarray2021
     * @tc.desc Verify subarray() with [0.5, 1.5, 0.25] returns typed view and not Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const sub = arr.subarray();
      let isArr: boolean = false;
      let o: Object = sub as Object;
      if (o instanceof Array) {
        isArr = true;
      }
      const expectVal = false;
      expect(isArr).assertEqual(expectVal);
      const threeValue: number = 3;
      const pointFive: number = 0.5;
      expect(sub.length).assertEqual(threeValue);
      expect(sub.$_get(0)).assertEqual(pointFive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_2200
     * @tc.name testFloat64ArraySubarray2022
     * @tc.desc Verify subarray(2, 5) with [-32768, -128, 0, 127, 32767] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const int16MaxValue: number = 32767;
      const arr = Float64Array.of(-32768, -128, zeroValue, 127, int16MaxValue);
      const sub = arr.subarray(2, 5);
      const actVal24 = sub.$_get(0);
      const expectVal = zeroValue;
      expect(actVal24).assertEqual(expectVal);
      const actVal25 = sub.$_get(2);
      const expectVal2 = int16MaxValue;
      expect(actVal25).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_2300
     * @tc.name testFloat64ArraySubarray2023
     * @tc.desc Verify Subarray2 no-end int32 view keeps full source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = new Float64Array([int32MinValue, -1, zeroValue]);
      const sub = arr.subarray(0);
      const actVal26 = sub.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal26).assertEqual(expectVal);
      const actVal27 = sub.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal27).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_2400
     * @tc.name testFloat64ArraySubarray2024
     * @tc.desc Verify Subarray2 no-end mixed scalar view skips first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const piValue: number = 3.141592653589793;
      const arr = new Float64Array([0.1, maxSafeInteger, 0, piValue]);
      const sub = arr.subarray(1);
      const actVal28 = sub.$_get(0);
      const expectVal = maxSafeInteger;
      expect(actVal28).assertEqual(expectVal);
      const actVal29 = sub.$_get(2);
      const expectVal2 = piValue;
      expect(actVal29).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_2500
     * @tc.name testFloat64ArraySubarray2025
     * @tc.desc Verify subarray(-3, -1) with [0.5, 1.5, 0.25, 0.125] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = new Float64Array([0.5, onePointFive, pointTwoFive, 0.125]);
      const sub = arr.subarray(-3, -1);
      const actVal30 = sub.$_get(0);
      const expectVal = onePointFive;
      expect(actVal30).assertEqual(expectVal);
      const actVal31 = sub.$_get(1);
      const expectVal2 = pointTwoFive;
      expect(actVal31).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_2600
     * @tc.name testFloat64ArraySubarray2026
     * @tc.desc Verify subarray returns empty view when normalized begin meets end zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const sub = arr.subarray(-4, 0);
      const expectVal = zeroValue;
      expect(sub.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_2700
     * @tc.name testFloat64ArraySubarray2027
     * @tc.desc Verify subarray() with [0.1, 9007199254740991, 0, 3.141592653589793] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const piValue: number = 3.141592653589793;
      const fourValue: number = 4;
      const arr = Float64Array.of(pointOne, 9007199254740991, 0, piValue);
      const sub = arr.subarray();
      const actVal32 = sub.$_get(0);
      const expectVal = pointOne;
      expect(actVal32).assertEqual(expectVal);
      const actVal33 = sub.$_get(3);
      const expectVal2 = piValue;
      expect(actVal33).assertEqual(expectVal2);
      expect(sub.length).assertEqual(fourValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_2800
     * @tc.name testFloat64ArraySubarray2028
     * @tc.desc Verify subarray negative begin -3 to end returns last three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const sub = arr.subarray(-3);
      const expectVal = threeValue;
      expect(sub.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_2900
     * @tc.name testFloat64ArraySubarray2029
     * @tc.desc Verify subarray negative begin -4 end -1 returns three-element view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const sub = arr.subarray(-4, -1);
      const expectVal = threeValue;
      expect(sub.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_3000
     * @tc.name testFloat64ArraySubarray2030
     * @tc.desc Verify subarray(0, 1) with [-32768, -128, 0] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const oneValue: number = 1;
      const arr = Float64Array.of(int16MinValue, -128, 0);
      const sub = arr.subarray(0, 1);
      expect(sub.length).assertEqual(oneValue);
      const actVal34 = sub.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal34).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_3100
     * @tc.name testFloat64ArraySubarray2031
     * @tc.desc Verify subarray returns empty view when both negative bounds clamp before start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const sub = arr.subarray(-10, -5);
      const expectVal = zeroValue;
      expect(sub.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_3200
     * @tc.name testFloat64ArraySubarray2032
     * @tc.desc Verify subarray clamps far negative begin and far positive end to full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const sub = arr.subarray(-100, 100);
      const expectVal = threeValue;
      expect(sub.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_3300
     * @tc.name testFloat64ArraySubarray2033
     * @tc.desc Verify subarray clamps oversized end and starts from index one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const int8MaxValue: number = 127;
      const threeValue: number = 3;
      const arr = new Float64Array([-32768, int8MinValue, 0, int8MaxValue]);
      const sub = arr.subarray(1, 100);
      expect(sub.length).assertEqual(threeValue);
      const actVal35 = sub.$_get(0);
      const expectVal = int8MinValue;
      expect(actVal35).assertEqual(expectVal);
      const actVal36 = sub.$_get(2);
      const expectVal2 = int8MaxValue;
      expect(actVal36).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_3400
     * @tc.name testFloat64ArraySubarray2034
     * @tc.desc Verify subarray begin 2 to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourValue: number = 24;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const sub = arr.subarray(2);
      const expectVal = twentyfourValue;
      expect(sub.byteLength).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_3500
     * @tc.name testFloat64ArraySubarray2035
     * @tc.desc Verify subarray begin 3 to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourValue: number = 24;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const sub = arr.subarray(3);
      const expectVal = twentyfourValue;
      expect(sub.byteOffset).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_3600
     * @tc.name testFloat64ArraySubarray2036
     * @tc.desc Verify subarray(1, 3) with [-32768, -128, 0, 127] parent array elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const int8MaxValue: number = 127;
      const arr = Float64Array.of(int16MinValue, int8MinValue, 0, int8MaxValue);
      const sub = arr.subarray(1, 3);
      const actVal37 = arr.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal37).assertEqual(expectVal);
      const actVal38 = arr.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal38).assertEqual(expectVal2);
      const actVal39 = arr.$_get(3);
      const expectVal3 = int8MaxValue;
      expect(actVal39).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_3700
     * @tc.name testFloat64ArraySubarray2037
     * @tc.desc Verify subarray(1, 4) with [0.5, 1.5, 0.25, 0.125, 0.0625] child buffer equals parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const sub = arr.subarray(1, 4);
      let o1: Object = sub.buffer as Object;
      let o2: Object = arr.buffer as Object;
      expect(o1).assertEqual(o2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_3800
     * @tc.name testFloat64ArraySubarray2038
     * @tc.desc Verify subarray(1, 4) child modifies index 1 reflects in parent index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightyeightPointzero: number = 88.0;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      const sub = arr.subarray(1, 4);
      sub.$_set(1, eightyeightPointzero);
      const actVal40 = arr.$_get(2);
      const expectVal = eightyeightPointzero;
      expect(actVal40).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_3900
     * @tc.name testFloat64ArraySubarray2039
     * @tc.desc Verify Subarray2 int32 prefix window covers first three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue77: number = 77.0;
      const arr = new Float64Array([-2147483648, -1, 0, 1]);
      const sub = arr.subarray(0, 3);
      arr.$_set(1, fillValue77);
      const actVal41 = sub.$_get(1);
      const expectVal = fillValue77;
      expect(actVal41).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_4000
     * @tc.name testFloat64ArraySubarray2040
     * @tc.desc Verify Subarray2 trailing window from array5 reads zero and max int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixtysixPointzero: number = 66.0;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const sub = arr.subarray(2, 5);
      arr.$_set(4, sixtysixPointzero);
      const actVal42 = sub.$_get(2);
      const expectVal = sixtysixPointzero;
      expect(actVal42).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_4100
     * @tc.name testFloat64ArraySubarray2041
     * @tc.desc Verify Subarray2 fractional prefix window returns three values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointZero: number = 20.0;
      const thirtyPointZero: number = 30.0;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const sub = arr.subarray(0, 3);
      sub.$_set(0, tenPointZero);
      sub.$_set(1, twentyPointZero);
      sub.$_set(2, thirtyPointZero);
      const actVal43 = arr.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal43).assertEqual(expectVal);
      const actVal44 = arr.$_get(1);
      const expectVal2 = twentyPointZero;
      expect(actVal44).assertEqual(expectVal2);
      const actVal45 = arr.$_get(2);
      const expectVal3 = thirtyPointZero;
      expect(actVal45).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_4200
     * @tc.name testFloat64ArraySubarray2042
     * @tc.desc Verify subarray(1, 3) child modification reflects in parent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negfivePointfive: number = -5.5;
      const arr = Float64Array.of(-32768, -128, 0, 127);
      const sub = arr.subarray(1, 3);
      sub.$_set(0, negfivePointfive);
      const actVal46 = arr.$_get(1);
      const expectVal = negfivePointfive;
      expect(actVal46).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_4300
     * @tc.name testFloat64ArraySubarray2043
     * @tc.desc Verify Subarray2 int32 prefix window validates zero at tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const sub = arr.subarray(0, 3);
      sub.$_set(0, doubleMaxValue);
      const actVal47 = arr.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal47).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_4400
     * @tc.name testFloat64ArraySubarray2044
     * @tc.desc Verify Subarray2 mixed scalar prefix window validates zero at tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const sub = arr.subarray(0, 3);
      sub.$_set(0, doubleMinValue);
      const actVal48 = arr.$_get(0);
      const expectVal = doubleMinValue;
      expect(actVal48).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_4500
     * @tc.name testFloat64ArraySubarray2045
     * @tc.desc Verify subarray(0, 3) with [0.5, 1.5, 0.25] element values and Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const sub = arr.subarray(0, 3);
      sub.$_set(0, negativeInfinity);
      const actVal49 = arr.$_get(0);
      const expectVal = negativeInfinity;
      expect(actVal49).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_4600
     * @tc.name testFloat64ArraySubarray2046
     * @tc.desc Verify subarray write of NaN through view reflects in parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = new Float64Array([-32768, -128, 0]);
      const sub = arr.subarray(0, 3);
      sub.$_set(0, nanValue);
      const actVal50 = Number.isNaN(arr.$_get(0));
      const expectVal = true;
      expect(actVal50).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_4700
     * @tc.name testFloat64ArraySubarray2047
     * @tc.desc Verify Subarray2 negative bounds select middle int32 window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const sub = arr.subarray(-3, -1);
      arr.$_set(2, fillValue99);
      const actVal51 = sub.$_get(0);
      const expectVal = fillValue99;
      expect(actVal51).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_4800
     * @tc.name testFloat64ArraySubarray2048
     * @tc.desc Verify Subarray2 oversized end shares buffer on mixed scalar array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue77: number = 77.0;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793);
      const sub = arr.subarray(0, 100);
      arr.$_set(3, fillValue77);
      const actVal52 = sub.$_get(3);
      const expectVal = fillValue77;
      expect(actVal52).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_4900
     * @tc.name testFloat64ArraySubarray2049
     * @tc.desc Verify overlapping subarray views share buffer updates for fractional values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightyeightPointzero: number = 88.0;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const sub1 = arr.subarray(0, 3);
      const sub2 = arr.subarray(2, 5);
      sub1.$_set(2, eightyeightPointzero);
      const actVal53 = sub2.$_get(0);
      const expectVal = eightyeightPointzero;
      expect(actVal53).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_5000
     * @tc.name testFloat64ArraySubarray2050
     * @tc.desc Verify Subarray2 overlapping int16 views share first shifted update
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue55: number = 55.0;
      const sixtysixPointzero: number = 66.0;
      const arr = Float64Array.of(-32768, -128, 0, 127);
      const sub1 = arr.subarray(0, 2);
      const sub2 = arr.subarray(1, 3);
      const sub3 = arr.subarray(2, 4);
      sub1.$_set(1, fillValue55);
      const actVal54 = sub2.$_get(0);
      const expectVal = fillValue55;
      expect(actVal54).assertEqual(expectVal);
      sub3.$_set(0, sixtysixPointzero);
      const actVal55 = sub2.$_get(1);
      const expectVal2 = sixtysixPointzero;
      expect(actVal55).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_5100
     * @tc.name testFloat64ArraySubarray2051
     * @tc.desc Verify nested subarray of subarray modification reflects in root parent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const sub1 = arr.subarray(1, 4);
      const sub2 = sub1.subarray(0, 2);
      sub2.$_set(0, fillValue99);
      const actVal56 = arr.$_get(1);
      const expectVal = fillValue99;
      expect(actVal56).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_5200
     * @tc.name testFloat64ArraySubarray2052
     * @tc.desc Verify Subarray2 wide window from array5 returns four values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue77: number = 77.0;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const sub1 = arr.subarray(0, 4);
      const sub2 = sub1.subarray(1, 3);
      sub2.$_set(1, fillValue77);
      const actVal57 = sub1.$_get(2);
      const expectVal = fillValue77;
      expect(actVal57).assertEqual(expectVal);
      const actVal58 = arr.$_get(2);
      const expectVal2 = fillValue77;
      expect(actVal58).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_5300
     * @tc.name testFloat64ArraySubarray2053
     * @tc.desc Verify Subarray2 final single-element window returns int16 max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MaxValue: number = 32767;
      const oneValue: number = 1;
      const arr = new Float64Array([-32768, -128, 0, 127, int16MaxValue]);
      const sub = arr.subarray(4, 5);
      expect(sub.length).assertEqual(oneValue);
      const actVal59 = sub.$_get(0);
      const expectVal = int16MaxValue;
      expect(actVal59).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_5400
     * @tc.name testFloat64ArraySubarray2054
     * @tc.desc Verify subarray(0, 1) with [-2147483648, -1, 0] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const oneValue: number = 1;
      const arr = new Float64Array([int32MinValue, -1, 0]);
      const sub = arr.subarray(0, 1);
      expect(sub.length).assertEqual(oneValue);
      const actVal60 = sub.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal60).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_5500
     * @tc.name testFloat64ArraySubarray2055
     * @tc.desc Verify subarray on empty array returns empty view for positive range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array(0);
      const sub = arr.subarray(1, 2);
      const expectVal = zeroValue;
      expect(sub.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_5600
     * @tc.name testFloat64ArraySubarray2056
     * @tc.desc Verify subarray(0) with [-2147483648] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const oneValue: number = 1;
      const arr = new Float64Array([int32MinValue]);
      const sub = arr.subarray(0);
      expect(sub.length).assertEqual(oneValue);
      const actVal61 = sub.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal61).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_5700
     * @tc.name testFloat64ArraySubarray2057
     * @tc.desc Verify subarray returns empty view when negative begin normalizes after end zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1);
      const sub = arr.subarray(-1, 0);
      const expectVal = zeroValue;
      expect(sub.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_5800
     * @tc.name testFloat64ArraySubarray2058
     * @tc.desc Verify subarray(-1) with [0.5] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const oneValue: number = 1;
      const arr = new Float64Array([pointFive]);
      const sub = arr.subarray(-1);
      expect(sub.length).assertEqual(oneValue);
      const actVal62 = sub.$_get(0);
      const expectVal = pointFive;
      expect(actVal62).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_5900
     * @tc.name testFloat64ArraySubarray2059
     * @tc.desc Verify subarray returns empty view for explicit zero-length range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768]);
      const sub = arr.subarray(0, 0);
      const expectVal = zeroValue;
      expect(sub.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_6000
     * @tc.name testFloat64ArraySubarray2060
     * @tc.desc Verify Subarray2 first half large-array view length fifty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiftyValue: number = 50;
      const zeroValue: number = 0;
      const fortynineValue: number = 49;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      const sub = arr.subarray(0, 50);
      expect(sub.length).assertEqual(fiftyValue);
      const actVal63 = sub.$_get(0);
      const expectVal = zeroValue;
      expect(actVal63).assertEqual(expectVal);
      const actVal64 = sub.$_get(49);
      const expectVal2 = fortynineValue;
      expect(actVal64).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_6100
     * @tc.name testFloat64ArraySubarray2061
     * @tc.desc Verify Subarray2 second half large-array view starts at fifty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiftyValue: number = 50;
      const ninetynineValue: number = 99;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      const sub = arr.subarray(50, 100);
      expect(sub.length).assertEqual(fiftyValue);
      const actVal65 = sub.$_get(0);
      const expectVal = fiftyValue;
      expect(actVal65).assertEqual(expectVal);
      const actVal66 = sub.$_get(49);
      const expectVal2 = ninetynineValue;
      expect(actVal66).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_6200
     * @tc.name testFloat64ArraySubarray2062
     * @tc.desc Verify Subarray2 middle window large-array view starts at twenty five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiftyValue: number = 50;
      const twentyfiveValue: number = 25;
      const seventyfourValue: number = 74;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      const sub = arr.subarray(25, 75);
      expect(sub.length).assertEqual(fiftyValue);
      const actVal67 = sub.$_get(0);
      const expectVal = twentyfiveValue;
      expect(actVal67).assertEqual(expectVal);
      const actVal68 = sub.$_get(49);
      const expectVal2 = seventyfourValue;
      expect(actVal68).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_6300
     * @tc.name testFloat64ArraySubarray2063
     * @tc.desc Verify Subarray2 negative bounds select middle large-array window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfiveValue: number = 25;
      const fiftyValue: number = 50;
      const seventyfourValue: number = 74;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      const sub = arr.subarray(-50, -25);
      expect(sub.length).assertEqual(twentyfiveValue);
      const actVal69 = sub.$_get(0);
      const expectVal = fiftyValue;
      expect(actVal69).assertEqual(expectVal);
      const actVal70 = sub.$_get(24);
      const expectVal2 = seventyfourValue;
      expect(actVal70).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_6400
     * @tc.name testFloat64ArraySubarray2064
     * @tc.desc Verify subarray(10, 20) with 100 elements element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      const sub = arr.subarray(10, 20);
      sub.$_set(0, num999Pointzero);
      const actVal71 = arr.$_get(10);
      const expectVal = num999Pointzero;
      expect(actVal71).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_6500
     * @tc.name testFloat64ArraySubarray2065
     * @tc.desc Verify Subarray2 int32 boundary prefix includes min negative and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = new Float64Array([int32MinValue, -1, 0, 1, 2147483647]);
      const result = arr.subarray(0, 3);
      const expectVal = int32MinValue;
      expect(result[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_6600
     * @tc.name testFloat64ArraySubarray2066
     * @tc.desc Verify subarray(undefined, 3) array[5] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne, 9007199254740991, 0, 3.141592653589793, -1e-100]);
      const result = arr.subarray(undefined, 3);
      const expectVal = pointOne;
      expect(result[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_6700
     * @tc.name testFloat64ArraySubarray2067
     * @tc.desc Verify subarray with int range values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const arr = new Float64Array([0.5, onePointFive, pointTwoFive, pointOneTwoFive, 0.0625]);
      const sub = arr.subarray(1, 4);
      expect(sub[0]).assertEqual(onePointFive);
      expect(sub[1]).assertEqual(pointTwoFive);
      expect(sub[2]).assertEqual(pointOneTwoFive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_6800
     * @tc.name testFloat64ArraySubarray2068
     * @tc.desc Verify subarray with short range values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const arr = Float64Array.of(-32768, int8MinValue, zeroValue, int8MaxValue, 32767);
      const sub = arr.subarray(1, 4);
      expect(sub[0]).assertEqual(int8MinValue);
      expect(sub[1]).assertEqual(zeroValue);
      expect(sub[2]).assertEqual(int8MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_6900
     * @tc.name testFloat64ArraySubarray2069
     * @tc.desc Verify subarray with float precision values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(-2147483648, negativeOne, zeroValue, oneValue, 2147483647);
      const sub = arr.subarray(1, 4);
      expect(sub[0]).assertEqual(negativeOne);
      expect(sub[1]).assertEqual(zeroValue);
      expect(sub[2]).assertEqual(oneValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUBARRAY_2_7000
     * @tc.name testFloat64ArraySubarray2070
     * @tc.desc Verify subarray with double range values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySubarray2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const nanValue: number = NaN;
      const positiveInfinity: number = Infinity;
      const precisionSumValue: number =
        0.30000000000000004;
      const arr = Float64Array.of(pointOne, maxSafeInteger, pointOne + 0.2, nanValue, positiveInfinity);
      const sub = arr.subarray(1, 4);
      expect(sub[0]).assertEqual(maxSafeInteger);
      expect(sub[1]).assertEqual(precisionSumValue);
      expect(sub[2]).assertNaN();
    });

  })
}

