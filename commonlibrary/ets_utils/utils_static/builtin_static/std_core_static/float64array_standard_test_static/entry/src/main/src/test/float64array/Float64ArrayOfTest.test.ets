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

export default function Float64ArrayOfTest(): void {
  describe('Float64ArrayOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_0100
     * @tc.name testFloat64ArrayOf001
     * @tc.desc Verify of with NaN element stores NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const result = Float64Array.of(-2147483648);
      expect(result.length).assertEqual(oneValue);
      const actVal1 = Number.isNaN(result.$_get(0));
      const expectVal = false;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_0200
     * @tc.name testFloat64ArrayOf002
     * @tc.desc Verify of with positive Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const oneValue: number = 1;
      const result = Float64Array.of(pointOne);
      expect(result.length).assertEqual(oneValue);
      const actVal2 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_0300
     * @tc.name testFloat64ArrayOf003
     * @tc.desc Verify of with negative Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const oneValue: number = 1;
      const result = Float64Array.of(pointFive);
      expect(result.length).assertEqual(oneValue);
      const actVal3 = result.$_get(0);
      const expectVal = pointFive;
      expect(actVal3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_0400
     * @tc.name testFloat64ArrayOf004
     * @tc.desc Verify of with NaN and positive Infinity elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const twoValue: number = 2;
      const result = Float64Array.of(-32768, int8MinValue);
      expect(result.length).assertEqual(twoValue);
      const actVal4 = Number.isNaN(result.$_get(0));
      const expectVal = false;
      expect(actVal4).assertEqual(expectVal);
      const actVal5 = result.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal5).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_0500
     * @tc.name testFloat64ArrayOf005
     * @tc.desc Verify of with positive and negative Infinity elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const result = Float64Array.of(int32MinValue, negativeOne);
      expect(result.length).assertEqual(twoValue);
      const actVal6 = result.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal6).assertEqual(expectVal);
      const actVal7 = result.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal7).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_0600
     * @tc.name testFloat64ArrayOf006
     * @tc.desc Verify of with NaN positive Infinity and negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const result = Float64Array.of(0.1, 9007199254740991, 0);
      expect(result.length).assertEqual(threeValue);
      const actVal8 = Number.isNaN(result.$_get(0));
      const expectVal = false;
      expect(actVal8).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_0700
     * @tc.name testFloat64ArrayOf007
     * @tc.desc Verify of with negative zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const oneValue: number = 1;
      const result = Float64Array.of(int16MinValue);
      expect(result.length).assertEqual(oneValue);
      const actVal9 = result.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal9).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_0800
     * @tc.name testFloat64ArrayOf008
     * @tc.desc Verify of with zero and positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const twoValue: number = 2;
      const result = Float64Array.of(pointOne, 9007199254740991);
      expect(result.length).assertEqual(twoValue);
      const actVal10 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal10).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_0900
     * @tc.name testFloat64ArrayOf009
     * @tc.desc Verify of with negative zero and negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const twoValue: number = 2;
      const result = Float64Array.of(pointFive, 1.5);
      expect(result.length).assertEqual(twoValue);
      const actVal11 = result.$_get(0);
      const expectVal = pointFive;
      expect(actVal11).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_1000
     * @tc.name testFloat64ArrayOf010
     * @tc.desc Verify of with Number.MIN_VALUE the smallest positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const oneValue: number = 1;
      const result = Float64Array.of(int32MinValue);
      expect(result.length).assertEqual(oneValue);
      const actVal12 = result.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal12).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_1100
     * @tc.name testFloat64ArrayOf011
     * @tc.desc Verify of with MAX_VALUE and MIN_VALUE together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const twoValue: number = 2;
      const result = Float64Array.of(pointOne, maxSafeInteger);
      expect(result.length).assertEqual(twoValue);
      const actVal13 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal13).assertEqual(expectVal);
      const actVal14 = result.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal14).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_1200
     * @tc.name testFloat64ArrayOf012
     * @tc.desc Verify of with MAX_VALUE MIN_VALUE and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const result = Float64Array.of(0.5, 1.5, 0.25);
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_1300
     * @tc.name testFloat64ArrayOf013
     * @tc.desc Verify of with MAX_SAFE_INTEGER and MIN_SAFE_INTEGER together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const result = Float64Array.of(0.1, 9007199254740991);
      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_1400
     * @tc.name testFloat64ArrayOf014
     * @tc.desc Verify of with MAX_SAFE_INTEGER plus one beyond safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const result = Float64Array.of(0.5);
      const expectVal = oneValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_1500
     * @tc.name testFloat64ArrayOf015
     * @tc.desc Verify of with 0.1+0.2 floating-point precision where result is not exactly 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const result = Float64Array.of(0.1 + 0.2);
      expect(result.length).assertEqual(oneValue);
      const actVal15 = result.$_get(0) === 0.3;
      const expectVal = false;
      expect(actVal15).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_1600
     * @tc.name testFloat64ArrayOf016
     * @tc.desc Verify of with 0.1 and 0.2 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const twoValue: number = 2;
      const result = Float64Array.of(int16MinValue, int8MinValue);
      expect(result.length).assertEqual(twoValue);
      const actVal16 = result.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal16).assertEqual(expectVal);
      const actVal17 = result.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal17).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_1700
     * @tc.name testFloat64ArrayOf017
     * @tc.desc Verify of with decimal precision boundary values 0.1 0.2 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const result = Float64Array.of(-2147483648, -1, zeroValue);
      expect(result.length).assertEqual(threeValue);
      const actVal18 = result.$_get(2);
      const expectVal = zeroValue;
      expect(actVal18).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_1800
     * @tc.name testFloat64ArrayOf018
     * @tc.desc Verify of with mixed scientific notation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const result = Float64Array.of(0.1, 9007199254740991, 0);
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_1900
     * @tc.name testFloat64ArrayOf019
     * @tc.desc Verify of with multiple negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const threeValue: number = 3;
      const result = Float64Array.of(-32768, int8MinValue, 0);
      expect(result.length).assertEqual(threeValue);
      const actVal19 = result.$_get(1);
      const expectVal = int8MinValue;
      expect(actVal19).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2000
     * @tc.name testFloat64ArrayOf020
     * @tc.desc Verify of with mixed positive negative and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const result = Float64Array.of(pointOne, 9007199254740991, zeroValue);
      expect(result.length).assertEqual(threeValue);
      const actVal20 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal20).assertEqual(expectVal);
      const actVal21 = result.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal21).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2100
     * @tc.name testFloat64ArrayOf021
     * @tc.desc Verify of with integer literals automatically converted to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const threeValue: number = 3;
      const result = Float64Array.of(pointFive, 1.5, 0.25);
      expect(result.length).assertEqual(threeValue);
      const actVal22 = result.$_get(0);
      const expectVal = pointFive;
      expect(actVal22).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2200
     * @tc.name testFloat64ArrayOf022
     * @tc.desc Verify of with zero integer zero floating-point and negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const threeValue: number = 3;
      const result = Float64Array.of(-2147483648, negativeOne, 0);
      expect(result.length).assertEqual(threeValue);
      const actVal23 = result.$_get(1);
      const expectVal = negativeOne;
      expect(actVal23).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2300
     * @tc.name testFloat64ArrayOf023
     * @tc.desc Verify of return array elements are in correct order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const result = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const actVal24 = result.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal24).assertEqual(expectVal);
      const actVal25 = result.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal25).assertEqual(expectVal2);
      const actVal26 = result.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal26).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2400
     * @tc.name testFloat64ArrayOf024
     * @tc.desc Verify of with double variables creates independent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      let a: double = 1.0;
      let b: double = 2.0;
      const result = Float64Array.of(a, b);
      a = 999.0;
      const actVal27 = result.$_get(0);
      const expectVal = onePointZero;
      expect(actVal27).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2500
     * @tc.name testFloat64ArrayOf025
     * @tc.desc Verify of with double variable parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const onePointZero: number = 1.0;
      const one: double = 1.0;
      const two: double = 2.0;
      const result = Float64Array.of(one, two);
      expect(result.length).assertEqual(twoValue);
      const actVal28 = result.$_get(0);
      const expectVal = onePointZero;
      expect(actVal28).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2600
     * @tc.name testFloat64ArrayOf026
     * @tc.desc Verify of with double variables containing NaN and Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const nanVal: double = NaN;
      const infVal: double = Infinity;
      const result = Float64Array.of(nanVal, infVal);
      expect(result.length).assertEqual(twoValue);
      const actVal29 = Number.isNaN(result.$_get(0));
      const expectVal = true;
      expect(actVal29).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2700
     * @tc.name testFloat64ArrayOf027
     * @tc.desc Verify of with double variables containing MAX_VALUE and MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const maxVal: double = 1.7976931348623157e+308;
      const minVal: double = 5e-324;
      const result = Float64Array.of(maxVal, minVal);
      expect(result.length).assertEqual(twoValue);
      const actVal30 = result.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal30).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2800
     * @tc.name testFloat64ArrayOf028
     * @tc.desc Verify of with 10 different values in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const tenValue: number = 10;
      const result =
        Float64Array.of(-32768, -128, zeroValue, 127, 32767, zeroValue, zeroValue,
          zeroValue, zeroValue, zeroValue);
      expect(result.length).assertEqual(tenValue);
      const actVal31 = result.$_get(5);
      const expectVal = zeroValue;
      expect(actVal31).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_2900
     * @tc.name testFloat64ArrayOf029
     * @tc.desc Verify of with 20 different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twentyValue: number = 20;
      const result =
        Float64Array.of(-2147483648, -1, zeroValue, 1, 2147483647, zeroValue, zeroValue, zeroValue,
          zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue,
          zeroValue, zeroValue);
      expect(result.length).assertEqual(twentyValue);
      const actVal32 = result.$_get(19);
      const expectVal = zeroValue;
      expect(actVal32).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_3000
     * @tc.name testFloat64ArrayOf030
     * @tc.desc Verify of with 50 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const fiftyValue: number = 50;
      const result =
        Float64Array.of(0.1, 9007199254740991, zeroValue, 3.141592653589793, -1e-100, zeroValue, zeroValue,
          zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue,
          zeroValue, zeroValue,
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      expect(result.length).assertEqual(fiftyValue);
      const actVal33 = result.$_get(25);
      const expectVal = zeroValue;
      expect(actVal33).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_3100
     * @tc.name testFloat64ArrayOf031
     * @tc.desc Verify of with all zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointZeroSixTwoFive: number = 0.0625;
      const fiveValue: number = 5;
      const result = Float64Array.of(pointZeroSixTwoFive, pointZeroSixTwoFive, pointZeroSixTwoFive, pointZeroSixTwoFive,
        pointZeroSixTwoFive);
      expect(result.length).assertEqual(fiveValue);
      const actVal34 = result.$_get(0);
      const expectVal = pointZeroSixTwoFive;
      expect(actVal34).assertEqual(expectVal);
      const actVal35 = result.$_get(4);
      const expectVal2 = pointZeroSixTwoFive;
      expect(actVal35).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_3200
     * @tc.name testFloat64ArrayOf032
     * @tc.desc Verify of with all identical non-zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MaxValue: number = 127;
      const fourValue: number = 4;
      const result = Float64Array.of(int8MaxValue, int8MaxValue, int8MaxValue, int8MaxValue);
      expect(result.length).assertEqual(fourValue);
      const actVal36 = result.$_get(0);
      const expectVal = int8MaxValue;
      expect(actVal36).assertEqual(expectVal);
      const actVal37 = result.$_get(3);
      const expectVal2 = int8MaxValue;
      expect(actVal37).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_3300
     * @tc.name testFloat64ArrayOf033
     * @tc.desc Verify of with all negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const fiveValue: number = 5;
      const result = Float64Array.of(-2147483648, -1, zeroValue, 1, 2147483647);
      expect(result.length).assertEqual(fiveValue);
      const actVal38 = result.$_get(2);
      const expectVal = zeroValue;
      expect(actVal38).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_3400
     * @tc.name testFloat64ArrayOf034
     * @tc.desc Verify of with ascending sequence values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const tenValue: number = 10;
      const result =
        Float64Array.of(0.1, 9007199254740991, zeroValue, 3.141592653589793, -1e-100, zeroValue, zeroValue,
          zeroValue, zeroValue, zeroValue);
      expect(result.length).assertEqual(tenValue);
      const actVal39 = result.$_get(9);
      const expectVal = zeroValue;
      expect(actVal39).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_3500
     * @tc.name testFloat64ArrayOf035
     * @tc.desc Verify of with descending sequence values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const zeroValue: number = 0;
      const tenValue: number = 10;
      const result =
        Float64Array.of(pointFive, 1.5, 0.25, 0.125, 0.0625, zeroValue,
          zeroValue, zeroValue, zeroValue, zeroValue);
      expect(result.length).assertEqual(tenValue);
      const actVal40 = result.$_get(0);
      const expectVal = pointFive;
      expect(actVal40).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_3600
     * @tc.name testFloat64ArrayOf036
     * @tc.desc Verify of with alternating positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int16MaxValue: number = 32767;
      const sixValue: number = 6;
      const result = Float64Array.of(-32768, int8MinValue, zeroValue, 127, int16MaxValue, zeroValue);
      expect(result.length).assertEqual(sixValue);
      const actVal41 = result.$_get(1);
      const expectVal = int8MinValue;
      expect(actVal41).assertEqual(expectVal);
      const actVal42 = result.$_get(4);
      const expectVal2 = int16MaxValue;
      expect(actVal42).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_3700
     * @tc.name testFloat64ArrayOf037
     * @tc.desc Verify of with NaN at middle position between valid numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const result = Float64Array.of(-2147483648, -1, 0);
      expect(result.length).assertEqual(threeValue);
      const actVal43 = Number.isNaN(result.$_get(1));
      const expectVal = false;
      expect(actVal43).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_3800
     * @tc.name testFloat64ArrayOf038
     * @tc.desc Verify of with single element returns length 1 and byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const eightValue: number = 8;
      const result = Float64Array.of(0.5);
      expect(result.length).assertEqual(oneValue);
      expect(result.byteLength).assertEqual(eightValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_3900
     * @tc.name testFloat64ArrayOf039
     * @tc.desc Verify of with two elements returns length 2 and byteLength 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const sixteenValue: number = 16;
      const result = Float64Array.of(-32768, -128);
      expect(result.length).assertEqual(twoValue);
      expect(result.byteLength).assertEqual(sixteenValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_4000
     * @tc.name testFloat64ArrayOf040
     * @tc.desc Verify of with three elements returns length 3 and byteLength 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const twentyfourValue: number = 24;
      const result = Float64Array.of(-2147483648, -1, 0);
      expect(result.length).assertEqual(threeValue);
      expect(result.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_4100
     * @tc.name testFloat64ArrayOf041
     * @tc.desc Verify of with no arguments (D4 boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of();
      const expectVal = zeroValue;
      expect(arr.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_4200
     * @tc.name testFloat64ArrayOf042
     * @tc.desc Verify of with large values negative (D7 two-way)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      expect(arr.length).assertEqual(threeValue);
      const actVal44 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal44).assertEqual(expectVal);
      const actVal45 = arr.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal45).assertEqual(expectVal2);
      const actVal46 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal46).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_4300
     * @tc.name testFloat64ArrayOf043
     * @tc.desc Verify of with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const arr = Float64Array.of(hexValueFF, hexValueAA);
      expect(arr[0]).assertEqual(num255Value);
      expect(arr[1]).assertEqual(num170Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_4400
     * @tc.name testFloat64ArrayOf044
     * @tc.desc Verify of with binary literal (D8 binary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010);
      expect(arr[0]).assertEqual(num255Value);
      expect(arr[1]).assertEqual(num170Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_4500
     * @tc.name testFloat64ArrayOf045
     * @tc.desc Verify of with Double.NaN (D5 critical)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const actVal47 = Number.isNaN(arr[0]);
      const expectVal = true;
      expect(actVal47).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_4600
     * @tc.name testFloat64ArrayOf046
     * @tc.desc Verify of with Double.POSITIVE_INFINITY (D5 critical)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const expectVal = true;
      expect(arr[0] > 0.0).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_4700
     * @tc.name testFloat64ArrayOf047
     * @tc.desc Verify of with Double.MIN_VALUE/MAX_VALUE (D5 critical)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      expect(arr[0] > 0.0).assertTrue();
      expect(arr[1] > 0.0).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_4800
     * @tc.name testFloat64ArrayOf048
     * @tc.desc Verify of result from mixed small integers is mutable and ordered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(2, 4, 6);
      a.$_set(1, 40.0);
      expect(a.length).assertEqual(3);
      const actVal48 = a.toString();
      const expectVal = "2,40,6";
      expect(actVal48).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_4900
     * @tc.name testFloat64ArrayOf049
     * @tc.desc Verify of with octal literal stores decimal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(0o10, 0o17);
      expect(a.length).assertEqual(2);
      const actVal49 = a.$_get(0);
      const expectVal = 8.0;
      expect(actVal49).assertEqual(expectVal);
      const actVal50 = a.$_get(1);
      const expectVal2 = 15.0;
      expect(actVal50).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_5000
     * @tc.name testFloat64ArrayOf050
     * @tc.desc Verify of with signed integer extremes preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(-2147483648, 2147483647);
      expect(a.length).assertEqual(2);
      const actVal51 = a.$_get(0);
      const expectVal = -2147483648.0;
      expect(actVal51).assertEqual(expectVal);
      const actVal52 = a.$_get(1);
      const expectVal2 = 2147483647.0;
      expect(actVal52).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_5100
     * @tc.name testFloat64ArrayOf051
     * @tc.desc Verify of with arithmetic number expressions stores evaluated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(0.1 + 0.2, 0.3 + 0.4);
      expect(a.length).assertEqual(2);
      const actVal53 = a.$_get(0);
      const expectVal = 0.30000000000000004;
      expect(actVal53).assertEqual(expectVal);
      const actVal54 = a.$_get(1);
      const expectVal2 = 0.7;
      expect(actVal54).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_5200
     * @tc.name testFloat64ArrayOf052
     * @tc.desc Verify of created array is independent from later copied array mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Float64Array.of(1.0, 2.0);
      const copy = new Float64Array(source);
      copy.$_set(0, 10.0);
      const actVal55 = source.$_get(0);
      const expectVal = 1.0;
      expect(actVal55).assertEqual(expectVal);
      const actVal56 = copy.$_get(0);
      const expectVal2 = 10.0;
      expect(actVal56).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_5300
     * @tc.name testFloat64ArrayOf053
     * @tc.desc Verify of can feed subarray with correct local values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Float64Array.of(5.0, 6.0, 7.0, 8.0).subarray(1, 3);
      expect(v.length).assertEqual(2);
      const actVal57 = v.toString();
      const expectVal = "6,7";
      expect(actVal57).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_5400
     * @tc.name testFloat64ArrayOf054
     * @tc.desc Verify of with repeated fractional values preserves every slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(1.25, 1.25, 1.25);
      a.$_set(1, 2.5);
      expect(a.length).assertEqual(3);
      const actVal58 = a.$_get(0);
      const expectVal = 1.25;
      expect(actVal58).assertEqual(expectVal);
      const actVal59 = a.$_get(1);
      const expectVal2 = 2.5;
      expect(actVal59).assertEqual(expectVal2);
      const actVal60 = a.$_get(2);
      const expectVal3 = 1.25;
      expect(actVal60).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_OF_5500
     * @tc.name testFloat64ArrayOf055
     * @tc.desc Verify of with negative fractional values preserves sign and order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(-1.5, -2.5, 3.5);
      expect(a.length).assertEqual(3);
      const actVal61 = a.$_get(0);
      const expectVal = -1.5;
      expect(actVal61).assertEqual(expectVal);
      const actVal62 = a.$_get(2);
      const expectVal2 = 3.5;
      expect(actVal62).assertEqual(expectVal2);
    })

  })
}
