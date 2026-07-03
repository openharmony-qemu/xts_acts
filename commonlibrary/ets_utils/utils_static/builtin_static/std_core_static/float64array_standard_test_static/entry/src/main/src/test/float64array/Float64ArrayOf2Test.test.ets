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

export default function Float64ArrayOf2Test(): void {
  describe('Float64ArrayOf2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_0100
     * @tc.name testFloat64ArrayOf2001
     * @tc.desc Verify of with one number typed parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const hundredPointfive: number = 100.5;
      const val: number = 100.5;
      const result = Float64Array.of(val);
      expect(result.length).assertEqual(oneValue);
      const actVal1 = result.$_get(0);
      const expectVal = hundredPointfive;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_0200
     * @tc.name testFloat64ArrayOf2002
     * @tc.desc Verify of with two number typed parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const a: number = 1.0;
      const b: number = 2.0;
      const result = Float64Array.of(a, b);
      expect(result.length).assertEqual(twoValue);
      const actVal2 = result.$_get(0);
      const expectVal = onePointZero;
      expect(actVal2).assertEqual(expectVal);
      const actVal3 = result.$_get(1);
      const expectVal2 = twoPointZero;
      expect(actVal3).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_0300
     * @tc.name testFloat64ArrayOf2003
     * @tc.desc Verify of with three number literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const result = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      expect(result.length).assertEqual(threeValue);
      const actVal4 = result.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal4).assertEqual(expectVal);
      const actVal5 = result.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal5).assertEqual(expectVal2);
      const actVal6 = result.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal6).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_0400
     * @tc.name testFloat64ArrayOf2004
     * @tc.desc Verify of with four number literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const fourValue: number = 4;
      const result = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue);
      expect(result.length).assertEqual(fourValue);
      const actVal7 = result.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal7).assertEqual(expectVal);
      const actVal8 = result.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal8).assertEqual(expectVal2);
      const actVal9 = result.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal9).assertEqual(expectVal3);
      const actVal10 = result.$_get(3);
      const expectVal4 = oneValue;
      expect(actVal10).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_0500
     * @tc.name testFloat64ArrayOf2005
     * @tc.desc Verify of with five mixed precision parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const fiveValue: number = 5;
      const result = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      expect(result.length).assertEqual(fiveValue);
      const actVal11 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal11).assertEqual(expectVal);
      const actVal12 = result.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal12).assertEqual(expectVal2);
      const actVal13 = result.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal13).assertEqual(expectVal3);
      const actVal14 = result.$_get(3);
      const expectVal4 = piValue;
      expect(actVal14).assertEqual(expectVal4);
      const actVal15 = result.$_get(4);
      const expectVal5 = tinyNegativeValue;
      expect(actVal15).assertEqual(expectVal5);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_0600
     * @tc.name testFloat64ArrayOf2006
     * @tc.desc Verify of with 0.1 and 0.2 where sum does not equal 0.3 due to floating-point precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const twoValue: number = 2;
      const result = Float64Array.of(pointFive, onePointFive);
      expect(result.length).assertEqual(twoValue);
      const actVal16 = result.$_get(0) + result.$_get(1) === 0.3;
      const expectVal = false;
      expect(actVal16).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_0700
     * @tc.name testFloat64ArrayOf2007
     * @tc.desc Verify of with MAX_VALUE as the second parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const twoValue: number = 2;
      const result = Float64Array.of(int16MinValue, int8MinValue);
      expect(result.length).assertEqual(twoValue);
      const actVal17 = result.$_get(1);
      const expectVal = int8MinValue;
      expect(actVal17).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_0800
     * @tc.name testFloat64ArrayOf2008
     * @tc.desc Verify of with MIN_VALUE as the second parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const result = Float64Array.of(int32MinValue, negativeOne);
      expect(result.length).assertEqual(twoValue);
      const actVal18 = result.$_get(1);
      const expectVal = negativeOne;
      expect(actVal18).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_0900
     * @tc.name testFloat64ArrayOf2009
     * @tc.desc Verify of with 0.0 as the second parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const twoValue: number = 2;
      const result = Float64Array.of(pointOne, maxSafeInteger);
      expect(result.length).assertEqual(twoValue);
      const actVal19 = result.$_get(1);
      const expectVal = maxSafeInteger;
      expect(actVal19).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_1000
     * @tc.name testFloat64ArrayOf2010
     * @tc.desc Verify of with -0.0 as the second parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const twoValue: number = 2;
      const result = Float64Array.of(pointFive, onePointFive);
      expect(result.length).assertEqual(twoValue);
      const actVal20 = result.$_get(1);
      const expectVal = onePointFive;
      expect(actVal20).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_1100
     * @tc.name testFloat64ArrayOf2011
     * @tc.desc Verify of with NaN as the second parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const twoValue: number = 2;
      const result = Float64Array.of(int16MinValue, int8MinValue);
      expect(result.length).assertEqual(twoValue);
      const actVal21 = Number.isNaN(result.$_get(1));
      const expectVal = false;
      expect(actVal21).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_1200
     * @tc.name testFloat64ArrayOf2012
     * @tc.desc Verify of with MAX_VALUE as the third parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const result = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      expect(result.length).assertEqual(threeValue);
      const actVal22 = result.$_get(2);
      const expectVal = zeroValue;
      expect(actVal22).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_1300
     * @tc.name testFloat64ArrayOf2013
     * @tc.desc Verify of with MIN_VALUE as the third parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const threeValue: number = 3;
      const result = Float64Array.of(onePointFive, onePointFive, pointTwoFive);
      expect(result.length).assertEqual(threeValue);
      const actVal23 = result.$_get(2);
      const expectVal = pointTwoFive;
      expect(actVal23).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_1400
     * @tc.name testFloat64ArrayOf2014
     * @tc.desc Verify of with 0.0 as the third parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const result = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      expect(result.length).assertEqual(threeValue);
      const actVal24 = result.$_get(2);
      const expectVal = zeroValue;
      expect(actVal24).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_1500
     * @tc.name testFloat64ArrayOf2015
     * @tc.desc Verify of with NaN as the third parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const result = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      expect(result.length).assertEqual(threeValue);
      const actVal25 = Number.isNaN(result.$_get(2));
      const expectVal = false;
      expect(actVal25).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_1600
     * @tc.name testFloat64ArrayOf2016
     * @tc.desc Verify of with Infinity as the third parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const threeValue: number = 3;
      const result = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      expect(result.length).assertEqual(threeValue);
      const actVal26 = result.$_get(2);
      const expectVal = pointTwoFive;
      expect(actVal26).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_1700
     * @tc.name testFloat64ArrayOf2017
     * @tc.desc Verify of with MAX_VALUE as the fourth parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const fourValue: number = 4;
      const result = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive);
      expect(result.length).assertEqual(fourValue);
      const actVal27 = result.$_get(3);
      const expectVal = pointOneTwoFive;
      expect(actVal27).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_1800
     * @tc.name testFloat64ArrayOf2018
     * @tc.desc Verify of with MIN_VALUE as the fourth parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const fourValue: number = 4;
      const result = Float64Array.of(zeroValue, zeroValue, zeroValue, int8MaxValue);
      expect(result.length).assertEqual(fourValue);
      const actVal28 = result.$_get(3);
      const expectVal = int8MaxValue;
      expect(actVal28).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_1900
     * @tc.name testFloat64ArrayOf2019
     * @tc.desc Verify of with 0.0 as the fourth parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const fourValue: number = 4;
      const result = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue);
      expect(result.length).assertEqual(fourValue);
      const actVal29 = result.$_get(3);
      const expectVal = oneValue;
      expect(actVal29).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_2000
     * @tc.name testFloat64ArrayOf2020
     * @tc.desc Verify of with -0.0 as the fourth parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const fourValue: number = 4;
      const result = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue);
      expect(result.length).assertEqual(fourValue);
      const actVal30 = result.$_get(3);
      const expectVal = piValue;
      expect(actVal30).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_2100
     * @tc.name testFloat64ArrayOf2021
     * @tc.desc Verify of with NaN as the fourth parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const fourValue: number = 4;
      const result = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive);
      expect(result.length).assertEqual(fourValue);
      const actVal31 = Number.isNaN(result.$_get(3));
      const expectVal = false;
      expect(actVal31).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_2200
     * @tc.name testFloat64ArrayOf2022
     * @tc.desc Verify of with Infinity as the fourth parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const fourValue: number = 4;
      const result = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue);
      expect(result.length).assertEqual(fourValue);
      const actVal32 = result.$_get(3);
      const expectVal = int8MaxValue;
      expect(actVal32).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_2300
     * @tc.name testFloat64ArrayOf2023
     * @tc.desc Verify of with MAX_VALUE as the fifth parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const fiveValue: number = 5;
      const result = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      expect(result.length).assertEqual(fiveValue);
      const actVal33 = result.$_get(4);
      const expectVal = int16MaxValue;
      expect(actVal33).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_2400
     * @tc.name testFloat64ArrayOf2024
     * @tc.desc Verify of with MIN_VALUE as the fifth parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const fiveValue: number = 5;
      const result = Float64Array.of(oneValue, oneValue, oneValue, oneValue, int32MaxValue);
      expect(result.length).assertEqual(fiveValue);
      const actVal34 = result.$_get(4);
      const expectVal = int32MaxValue;
      expect(actVal34).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_2500
     * @tc.name testFloat64ArrayOf2025
     * @tc.desc Verify of with 0.0 as the fifth parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const fiveValue: number = 5;
      const result = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      expect(result.length).assertEqual(fiveValue);
      const actVal35 = result.$_get(4);
      const expectVal = tinyNegativeValue;
      expect(actVal35).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_2600
     * @tc.name testFloat64ArrayOf2026
     * @tc.desc Verify of with -0.0 as the fifth parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const fiveValue: number = 5;
      const result = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      expect(result.length).assertEqual(fiveValue);
      const actVal36 = result.$_get(4);
      const expectVal = pointZeroSixTwoFive;
      expect(actVal36).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_2700
     * @tc.name testFloat64ArrayOf2027
     * @tc.desc Verify of with NaN as the fifth parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const fiveValue: number = 5;
      const result = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      expect(result.length).assertEqual(fiveValue);
      const actVal37 = Number.isNaN(result.$_get(4));
      const expectVal = false;
      expect(actVal37).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_2800
     * @tc.name testFloat64ArrayOf2028
     * @tc.desc Verify of with Infinity as the fifth parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const fiveValue: number = 5;
      const result = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      expect(result.length).assertEqual(fiveValue);
      const actVal38 = result.$_get(4);
      const expectVal = int32MaxValue;
      expect(actVal38).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_2900
     * @tc.name testFloat64ArrayOf2029
     * @tc.desc Verify of with six consecutive ascending floating-point values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const sixValue: number = 6;
      const result = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue, zeroValue);
      expect(result.length).assertEqual(sixValue);
      const actVal39 = result.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal39).assertEqual(expectVal);
      const actVal40 = result.$_get(5);
      const expectVal2 = zeroValue;
      expect(actVal40).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_3000
     * @tc.name testFloat64ArrayOf2030
     * @tc.desc Verify of with eight parameters containing various boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const eightValue: number = 8;
      const result =
        Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue, zeroValue, zeroValue,
          zeroValue);
      expect(result.length).assertEqual(eightValue);
      const actVal41 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal41).assertEqual(expectVal);
      const actVal42 = result.$_get(3);
      const expectVal2 = piValue;
      expect(actVal42).assertEqual(expectVal2);
      const actVal43 = Number.isNaN(result.$_get(4));
      const expectVal3 = false;
      expect(actVal43).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_3100
     * @tc.name testFloat64ArrayOf2031
     * @tc.desc Verify of with ten identical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const tenValue: number = 10;
      const result =
        Float64Array.of(zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue,
          zeroValue, zeroValue);
      expect(result.length).assertEqual(tenValue);
      const actVal44 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal44).assertEqual(expectVal);
      const actVal45 = result.$_get(9);
      const expectVal2 = zeroValue;
      expect(actVal45).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_3200
     * @tc.name testFloat64ArrayOf2032
     * @tc.desc Verify of with alternating negative and positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const tenValue: number = 10;
      const result =
        Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue, zeroValue, zeroValue,
          zeroValue, zeroValue, zeroValue);
      expect(result.length).assertEqual(tenValue);
      const actVal46 = result.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal46).assertEqual(expectVal);
      const actVal47 = result.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal47).assertEqual(expectVal2);
      const actVal48 = result.$_get(9);
      const expectVal3 = zeroValue;
      expect(actVal48).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_3300
     * @tc.name testFloat64ArrayOf2033
     * @tc.desc Verify of with different precision decimal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const fiveValue: number = 5;
      const result = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      expect(result.length).assertEqual(fiveValue);
      const actVal49 = result.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal49).assertEqual(expectVal);
      const actVal50 = result.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal50).assertEqual(expectVal2);
      const actVal51 = result.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal51).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_3400
     * @tc.name testFloat64ArrayOf2034
     * @tc.desc Verify of with scientific notation literals 1e2 through 5e2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const fiveValue: number = 5;
      const result = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      expect(result.length).assertEqual(fiveValue);
      const actVal52 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal52).assertEqual(expectVal);
      const actVal53 = result.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal53).assertEqual(expectVal2);
      const actVal54 = result.$_get(4);
      const expectVal3 = tinyNegativeValue;
      expect(actVal54).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_3500
     * @tc.name testFloat64ArrayOf2035
     * @tc.desc Verify of with minimum positive and maximum values together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const twoValue: number = 2;
      const result = Float64Array.of(pointFive, onePointFive);
      expect(result.length).assertEqual(twoValue);
      const actVal55 = result.$_get(0);
      const expectVal = pointFive;
      expect(actVal55).assertEqual(expectVal);
      const actVal56 = result.$_get(1);
      const expectVal2 = onePointFive;
      expect(actVal56).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_3600
     * @tc.name testFloat64ArrayOf2036
     * @tc.desc Verify of with number type variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const one: number = 1.0;
      const two: number = 2.0;
      const result = Float64Array.of(one, two);
      expect(result.length).assertEqual(twoValue);
      const actVal57 = result.$_get(0);
      const expectVal = onePointZero;
      expect(actVal57).assertEqual(expectVal);
      const actVal58 = result.$_get(1);
      const expectVal2 = twoPointZero;
      expect(actVal58).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_3700
     * @tc.name testFloat64ArrayOf2037
     * @tc.desc Verify of with double type variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const hundredPointfive: number = 100.5;
      const num200Pointfive: number = 200.5;
      const a: double = 100.5;
      const b: double = 200.5;
      const result = Float64Array.of(a, b);
      expect(result.length).assertEqual(twoValue);
      const actVal59 = result.$_get(0);
      const expectVal = hundredPointfive;
      expect(actVal59).assertEqual(expectVal);
      const actVal60 = result.$_get(1);
      const expectVal2 = num200Pointfive;
      expect(actVal60).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_3800
     * @tc.name testFloat64ArrayOf2038
     * @tc.desc Verify of with mixed number and double type variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const fiftyPointzero: number = 50.0;
      const num150Pointfive: number = 150.5;
      const n: number = 50.0;
      const d: double = 150.5;
      const result = Float64Array.of(n, d);
      expect(result.length).assertEqual(twoValue);
      const actVal61 = result.$_get(0);
      const expectVal = fiftyPointzero;
      expect(actVal61).assertEqual(expectVal);
      const actVal62 = result.$_get(1);
      const expectVal2 = num150Pointfive;
      expect(actVal62).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_3900
     * @tc.name testFloat64ArrayOf2039
     * @tc.desc Verify of with int type variables converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const tenPointZero: number = 10.0;
      const twentyPointzero: number = 20.0;
      const i1: int = 10;
      const i2: int = 20;
      const result = Float64Array.of(i1, i2);
      expect(result.length).assertEqual(twoValue);
      const actVal63 = result.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal63).assertEqual(expectVal);
      const actVal64 = result.$_get(1);
      const expectVal2 = twentyPointzero;
      expect(actVal64).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_4000
     * @tc.name testFloat64ArrayOf2040
     * @tc.desc Verify of return value elements match the input values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const result = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const actVal65 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal65).assertEqual(expectVal);
      const actVal66 = result.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal66).assertEqual(expectVal2);
      const actVal67 = result.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal67).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_4100
     * @tc.name testFloat64ArrayOf2041
     * @tc.desc Verify two of calls produce arrays with independent buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const result1 = Float64Array.of(pointOne, maxSafeInteger);
      const result2 = Float64Array.of(pointFive, onePointFive);
      const expectVal = false;
      expect(result1.buffer === result2.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_4200
     * @tc.name testFloat64ArrayOf2042
     * @tc.desc Verify of return array elements can be modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const num999Pointzero: number = 999.0;
      const result = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      result.$_set(0, num999Pointzero);
      const actVal68 = result.$_get(0);
      const expectVal = num999Pointzero;
      expect(actVal68).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_4300
     * @tc.name testFloat64ArrayOf2043
     * @tc.desc Verify modifying of return array does not affect the original input values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const tenPointZero: number = 10.0;
      const a: number = 10.0;
      const b: number = 20.0;
      const result = Float64Array.of(a, b);
      result.$_set(0, zeroPointZero);
      const expectVal = tenPointZero;
      expect(a).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_4400
     * @tc.name testFloat64ArrayOf2044
     * @tc.desc Verify of with value exceeding double range saturates to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const positiveInfinity: number = Infinity;
      const overflow: double = 1.7976931348623157e+308 * 2.0;
      const result = Float64Array.of(overflow);
      expect(result.length).assertEqual(oneValue);
      const actVal69 = result.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal69).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_4500
     * @tc.name testFloat64ArrayOf2045
     * @tc.desc Verify of with negative value exceeding double range saturates to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const negativeInfinity: number = -Infinity;
      const overflow: double = -(1.7976931348623157e+308 * 2.0);
      const result = Float64Array.of(overflow);
      expect(result.length).assertEqual(oneValue);
      const actVal70 = result.$_get(0);
      const expectVal = negativeInfinity;
      expect(actVal70).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_4600
     * @tc.name testFloat64ArrayOf2046
     * @tc.desc Verify of with positive zero and negative zero distinguished by division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const twoValue: number = 2;
      const negativeReciprocalInt16Min: number = -0.000030517578125;
      const negativeReciprocalInt8Min: number = -0.0078125;
      const result = Float64Array.of(int16MinValue, int8MinValue);
      expect(result.length).assertEqual(twoValue);
      const actVal71 = 1 / result.$_get(0);
      expect(actVal71)
        .assertEqual(negativeReciprocalInt16Min);
      const actVal72 = 1 / result.$_get(1);
      const expectVal = negativeReciprocalInt8Min;
      expect(actVal72).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_4700
     * @tc.name testFloat64ArrayOf2047
     * @tc.desc Verify of with binary number literal (10) (D8 binary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1010: number = 0b1010;
      const binaryValue1111: number = 0b1111;
      const twoValue: number = 2;
      const tenValue: number = 10;
      const fifteenValue: number = 15;
      const arr = Float64Array.of(binaryValue1010, binaryValue1111);
      expect(arr.length).assertEqual(twoValue);
      expect(arr[0]).assertEqual(tenValue);
      expect(arr[1]).assertEqual(fifteenValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_4800
     * @tc.name testFloat64ArrayOf2048
     * @tc.desc Verify of with integer boundary values (Number.MAX_SAFE_INTEGER) (D5 critical)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const minSafeInteger: number = Number.MIN_SAFE_INTEGER;
      const twoValue: number = 2;
      const maxSafeInteger2: number = 9007199254740991;
      const minSafeInteger2: number = -9007199254740991;
      const arr = Float64Array.of(maxSafeInteger, minSafeInteger);
      expect(arr.length).assertEqual(twoValue);
      expect(arr[0]).assertEqual(maxSafeInteger2);
      expect(arr[1]).assertEqual(minSafeInteger2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_4900
     * @tc.name testFloat64ArrayOf2049
     * @tc.desc Verify of number overload keeps decimal values in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(2.5, 1.5, 3.5);
      expect(a.length).assertEqual(3);
      const actVal73 = a.toString();
      const expectVal = "2.5,1.5,3.5";
      expect(actVal73).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_5000
     * @tc.name testFloat64ArrayOf2050
     * @tc.desc Verify of number overload result can be sorted without changing source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(3.5, 1.5, 2.5);
      const s = a.toSorted();
      const actVal74 = s.toString();
      const expectVal = "1.5,2.5,3.5";
      expect(actVal74).assertEqual(expectVal);
      const actVal75 = a.toString();
      const expectVal2 = "3.5,1.5,2.5";
      expect(actVal75).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_5100
     * @tc.name testFloat64ArrayOf2051
     * @tc.desc Verify of number overload result can be reversed without changing source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(1.5, 2.5, 3.5);
      const r = a.toReversed();
      const actVal76 = r.toString();
      const expectVal = "3.5,2.5,1.5";
      expect(actVal76).assertEqual(expectVal);
      const actVal77 = a.toString();
      const expectVal2 = "1.5,2.5,3.5";
      expect(actVal77).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_5200
     * @tc.name testFloat64ArrayOf2052
     * @tc.desc Verify of number overload preserves subnormal signed pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(Double.MIN_VALUE, -Double.MIN_VALUE);
      expect(a.length).assertEqual(2);
      const actVal78 = a.$_get(0);
      const expectVal = Double.MIN_VALUE;
      expect(actVal78).assertEqual(expectVal);
      const actVal79 = a.$_get(1);
      const expectVal2 = -Double.MIN_VALUE;
      expect(actVal79).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_5300
     * @tc.name testFloat64ArrayOf2053
     * @tc.desc Verify of number overload preserves NaN between finite neighbors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(1.0, NaN, 2.0);
      expect(a.length).assertEqual(3);
      const actVal80 = a.$_get(0);
      const expectVal = 1.0;
      expect(actVal80).assertEqual(expectVal);
      const actVal81 = Number.isNaN(a.$_get(1));
      const expectVal2 = true;
      expect(actVal81).assertEqual(expectVal2);
      const actVal82 = a.$_get(2);
      const expectVal3 = 2.0;
      expect(actVal82).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_5400
     * @tc.name testFloat64ArrayOf2054
     * @tc.desc Verify of number overload stores infinity boundaries in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(-Infinity, 0.0, Infinity);
      expect(a.length).assertEqual(3);
      const actVal83 = a.$_get(0);
      const expectVal = -Infinity;
      expect(actVal83).assertEqual(expectVal);
      const actVal84 = a.$_get(2);
      const expectVal2 = Infinity;
      expect(actVal84).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_5500
     * @tc.name testFloat64ArrayOf2055
     * @tc.desc Verify of number overload creates zero byteOffset array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(9.0, 8.0);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(16);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2_5600
     * @tc.name testFloat64ArrayOf2056
     * @tc.desc Verify of number overload supports immediate indexed rewrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(4.0, 5.0, 6.0);
      a.$_set(1, 50.0);
      const actVal85 = a.toString();
      const expectVal = "4,50,6";
      expect(actVal85).assertEqual(expectVal);
      expect(a.length).assertEqual(3);
    })

  })
}
