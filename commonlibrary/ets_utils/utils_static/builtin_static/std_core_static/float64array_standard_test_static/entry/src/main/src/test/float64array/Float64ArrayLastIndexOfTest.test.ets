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

export default function float64ArrayLastIndexOfTest(): void {
  describe('Float64ArrayLastIndexOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_0100
     * @tc.name testFloat64ArrayLastIndexOf001
     * @tc.desc Verify lastIndexOf with single parameter finds last occurrence of unique element at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const fivePointZero: number = 5.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const idx = arr.lastIndexOf(fivePointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(zeroValue);
      const expectVal2 = twoValue;
      expect(idxFound).assertEqual(expectVal2);
      let searchNum: number = 0;
      const idxNumVar = arr.lastIndexOf(searchNum);
      const expectVal3 = twoValue;
      expect(idxNumVar).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_0200
     * @tc.name testFloat64ArrayLastIndexOf002
     * @tc.desc Verify lastIndexOf with single parameter finds unique element in middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const idx = arr.lastIndexOf(twoPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxMid = arr.lastIndexOf(maxSafeInteger);
      const expectVal2 = oneValue;
      expect(idxMid).assertEqual(expectVal2);
      let searchInt: int = 0;
      const idxIntVar = arr.lastIndexOf(searchInt);
      const expectVal3 = twoValue;
      expect(idxIntVar).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_0300
     * @tc.name testFloat64ArrayLastIndexOf003
     * @tc.desc Verify lastIndexOf with single parameter finds unique element at beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const threePointZero: number = 3.0;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointFive, 1.5, 0.25);
      const idx = arr.lastIndexOf(threePointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFirst = arr.lastIndexOf(pointFive);
      const expectVal2 = zeroValue;
      expect(idxFirst).assertEqual(expectVal2);
      let searchNum: number = 1.5;
      const idxNumVar = arr.lastIndexOf(searchNum);
      const expectVal3 = oneValue;
      expect(idxNumVar).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_0400
     * @tc.name testFloat64ArrayLastIndexOf004
     * @tc.desc Verify lastIndexOf with fromIndex=1 finds element at or before index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const int8MinValue: number = -128;
      const oneValue: number = 1;
      const arr = new Float64Array([-32768, -128, 0]);
      const idx = arr.lastIndexOf(twoPointZero, 1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(int8MinValue, 1);
      const expectVal2 = oneValue;
      expect(idxFound).assertEqual(expectVal2);
      let fromIdx: int = 1;
      const idxVar2 = arr.lastIndexOf(int8MinValue, fromIdx);
      const expectVal3 = oneValue;
      expect(idxVar2).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_0500
     * @tc.name testFloat64ArrayLastIndexOf005
     * @tc.desc Verify lastIndexOf with fromIndex=2 finds element at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const threePointZero: number = 3.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const idx = arr.lastIndexOf(threePointZero, 2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(zeroValue, 2);
      const expectVal2 = twoValue;
      expect(idxFound).assertEqual(expectVal2);
      let searchInt: int = 0;
      let fromIdx: int = 2;
      const idxBothInt = arr.lastIndexOf(searchInt, fromIdx);
      const expectVal3 = twoValue;
      expect(idxBothInt).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_0600
     * @tc.name testFloat64ArrayLastIndexOf006
     * @tc.desc Verify lastIndexOf with fromIndex=3 out of bounds searches from last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const idx = arr.lastIndexOf(onePointZero, 3);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_0700
     * @tc.name testFloat64ArrayLastIndexOf007
     * @tc.desc Verify lastIndexOf with fromIndex=-1 searches from last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const threePointZero: number = 3.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const oneValue: number = 1;
      const arr = Float64Array.of(0.5, 1.5, pointTwoFive);
      const idx = arr.lastIndexOf(threePointZero, -1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(pointTwoFive, -1);
      const expectVal2 = twoValue;
      expect(idxFound).assertEqual(expectVal2);
      let searchNum: number = 1.5;
      let fromIdx: int = -1;
      const idxNumFrom = arr.lastIndexOf(searchNum, fromIdx);
      const expectVal3 = oneValue;
      expect(idxNumFrom).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_0800
     * @tc.name testFloat64ArrayLastIndexOf008
     * @tc.desc Verify lastIndexOf with fromIndex=-2 searches from second-to-last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const int8MinValue: number = -128;
      const oneValue: number = 1;
      const arr = new Float64Array([-32768, -128, 0]);
      const idx = arr.lastIndexOf(twoPointZero, -2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(int8MinValue, -2);
      const expectVal2 = oneValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_0900
     * @tc.name testFloat64ArrayLastIndexOf009
     * @tc.desc Verify lastIndexOf with fromIndex=-3 equals searching from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([int32MinValue, -1, zeroValue]);
      const idx = arr.lastIndexOf(onePointZero, -3);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(int32MinValue, -3);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_1000
     * @tc.name testFloat64ArrayLastIndexOf010
     * @tc.desc Verify lastIndexOf with fromIndex=-4 out of bounds returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const idx = arr.lastIndexOf(onePointZero, -4);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_1100
     * @tc.name testFloat64ArrayLastIndexOf011
     * @tc.desc Verify lastIndexOf with searchElement as positive float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const twoPointFive: number = 2.5;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointFive, 1.5, 0.25);
      const idx = arr.lastIndexOf(twoPointFive);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(pointFive);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_1200
     * @tc.name testFloat64ArrayLastIndexOf012
     * @tc.desc Verify lastIndexOf with searchElement as negative float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negtwoPointfive: number = -2.5;
      const negativeOne: number = -1;
      const int8MinValue: number = -128;
      const oneValue: number = 1;
      const arr = new Float64Array([-32768, -128, 0]);
      const idx = arr.lastIndexOf(negtwoPointfive);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(int8MinValue);
      const expectVal2 = oneValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_1300
     * @tc.name testFloat64ArrayLastIndexOf013
     * @tc.desc Verify lastIndexOf with searchElement as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const twoValue: number = 2;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const idx = arr.lastIndexOf(zeroPointZero);
      const expectVal = twoValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_1400
     * @tc.name testFloat64ArrayLastIndexOf014
     * @tc.desc Verify lastIndexOf with searchElement as negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const twoValue: number = 2;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const idx = arr.lastIndexOf(negativeZero);
      const expectVal = twoValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_1500
     * @tc.name testFloat64ArrayLastIndexOf015
     * @tc.desc Verify lastIndexOf with searchElement NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const idx = arr.lastIndexOf(nanValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_1600
     * @tc.name testFloat64ArrayLastIndexOf016
     * @tc.desc Verify lastIndexOf with searchElement Infinity returns -1 when not in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, 0]);
      const idx = arr.lastIndexOf(positiveInfinity);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_1700
     * @tc.name testFloat64ArrayLastIndexOf017
     * @tc.desc Verify lastIndexOf with searchElement -Infinity returns -1 when not in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const idx = arr.lastIndexOf(negativeInfinity);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_1800
     * @tc.name testFloat64ArrayLastIndexOf018
     * @tc.desc Verify lastIndexOf with searchElement as MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const negativeOne: number = -1;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const idx = arr.lastIndexOf(doubleMaxValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_1900
     * @tc.name testFloat64ArrayLastIndexOf019
     * @tc.desc Verify lastIndexOf with searchElement as MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const idx = arr.lastIndexOf(doubleMinValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_2000
     * @tc.name testFloat64ArrayLastIndexOf020
     * @tc.desc Verify lastIndexOf with searchElement as MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, 0]);
      const idx = arr.lastIndexOf(maxSafeIntegerValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_2100
     * @tc.name testFloat64ArrayLastIndexOf021
     * @tc.desc Verify lastIndexOf with searchElement as very negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum999999Pointninenine: number = -999999.99;
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const idx = arr.lastIndexOf(negnum999999Pointninenine);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_2200
     * @tc.name testFloat64ArrayLastIndexOf022
     * @tc.desc Verify lastIndexOf returns -1 when searchElement not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourPointZero: number = 4.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const idx = arr.lastIndexOf(fourPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_2300
     * @tc.name testFloat64ArrayLastIndexOf023
     * @tc.desc Verify lastIndexOf with searchElement as scientific notation 1.0e+308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e+308;
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const idx = arr.lastIndexOf(sciValue10e308);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_2400
     * @tc.name testFloat64ArrayLastIndexOf024
     * @tc.desc Verify lastIndexOf with searchElement as scientific notation 1.0e-308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, 0]);
      const idx = arr.lastIndexOf(sciValue10e308);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_2500
     * @tc.name testFloat64ArrayLastIndexOf025
     * @tc.desc Verify lastIndexOf with 0.1+0.2 precision boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const pointTwo: number = 0.2;
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const idx = arr.lastIndexOf(pointOne + pointTwo);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_2600
     * @tc.name testFloat64ArrayLastIndexOf026
     * @tc.desc Verify lastIndexOf with duplicate values returns rightmost occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = new Float64Array([0.1, zeroValue, zeroValue, 3.141592653589793]);
      const idx = arr.lastIndexOf(twoPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxDup = arr.lastIndexOf(zeroValue);
      const expectVal2 = twoValue;
      expect(idxDup).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_2700
     * @tc.name testFloat64ArrayLastIndexOf027
     * @tc.desc Verify lastIndexOf with all identical elements returns rightmost index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const fivePointZero: number = 5.0;
      const negativeOne: number = -1;
      const threeValue: number = 3;
      const arr = new Float64Array([pointOneTwoFive, pointOneTwoFive, pointOneTwoFive, pointOneTwoFive]);
      const idx = arr.lastIndexOf(fivePointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxSame = arr.lastIndexOf(pointOneTwoFive);
      const expectVal2 = threeValue;
      expect(idxSame).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_2800
     * @tc.name testFloat64ArrayLastIndexOf028
     * @tc.desc Verify lastIndexOf with fromIndex=0 finds element at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([int16MinValue, -128, zeroValue]);
      const idx = arr.lastIndexOf(onePointZero, 0);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(int16MinValue, 0);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_2900
     * @tc.name testFloat64ArrayLastIndexOf029
     * @tc.desc Verify lastIndexOf with fromIndex=1 skips index 2 when searching backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const idx = arr.lastIndexOf(onePointZero, 1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(negativeOne, 1);
      const expectVal2 = oneValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_3000
     * @tc.name testFloat64ArrayLastIndexOf030
     * @tc.desc Verify lastIndexOf with fromIndex=100 large out of bounds searches from last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const idx = arr.lastIndexOf(onePointZero, 100);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_3100
     * @tc.name testFloat64ArrayLastIndexOf031
     * @tc.desc Verify lastIndexOf with fromIndex=-1000 very large negative returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, 0]);
      const idx = arr.lastIndexOf(onePointZero, -1000);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_3200
     * @tc.name testFloat64ArrayLastIndexOf032
     * @tc.desc Verify lastIndexOf with fromIndex as decimal 2.9 truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const threePointZero: number = 3.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const idx = arr.lastIndexOf(threePointZero, 2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(zeroValue, 2);
      const expectVal2 = twoValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_3300
     * @tc.name testFloat64ArrayLastIndexOf033
     * @tc.desc Verify lastIndexOf with fromIndex as negative decimal -2.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const idx = arr.lastIndexOf(twoPointZero, -2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(maxSafeInteger, -2);
      const expectVal2 = oneValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_3400
     * @tc.name testFloat64ArrayLastIndexOf034
     * @tc.desc Verify lastIndexOf with fromIndex as INT_MAX out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const idx = arr.lastIndexOf(onePointZero, 2147483647);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_3500
     * @tc.name testFloat64ArrayLastIndexOf035
     * @tc.desc Verify lastIndexOf with fromIndex as INT_MIN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, 0]);
      const idx = arr.lastIndexOf(onePointZero, -2147483647);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_3600
     * @tc.name testFloat64ArrayLastIndexOf036
     * @tc.desc Verify lastIndexOf fromIndex=0 and fromIndex=-length are equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const arr = new Float64Array([int32MinValue, -1, zeroValue]);
      const idx1 = arr.lastIndexOf(onePointZero, 0);
      const idx2 = arr.lastIndexOf(onePointZero, -3);
      const expectVal = idx2;
      expect(idx1).assertEqual(expectVal);
      const idxF1 = arr.lastIndexOf(int32MinValue, 0);
      const idxF2 = arr.lastIndexOf(int32MinValue, -3);
      const expectVal2 = idxF2;
      expect(idxF1).assertEqual(expectVal2);
      const expectVal3 = zeroValue;
      expect(idxF1).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_3700
     * @tc.name testFloat64ArrayLastIndexOf037
     * @tc.desc Verify lastIndexOf with fromIndex=1 finds last duplicate from that position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const arr = new Float64Array([0.1, zeroValue, zeroValue, 3.141592653589793]);
      const idx = arr.lastIndexOf(twoPointZero, 1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxDup = arr.lastIndexOf(zeroValue, 1);
      const expectVal2 = oneValue;
      expect(idxDup).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_3800
     * @tc.name testFloat64ArrayLastIndexOf038
     * @tc.desc Verify lastIndexOf with fromIndex=2 finds last occurrence within range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = Float64Array.of(0.5, pointTwoFive, pointTwoFive, 0.125);
      const idx = arr.lastIndexOf(twoPointZero, 2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxDup2 = arr.lastIndexOf(pointTwoFive, 2);
      const expectVal2 = twoValue;
      expect(idxDup2).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_3900
     * @tc.name testFloat64ArrayLastIndexOf039
     * @tc.desc Verify lastIndexOf returns non-negative integer when element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const int8MinValue: number = -128;
      const oneValue: number = 1;
      const arr = new Float64Array([-32768, -128, 0]);
      const idx = arr.lastIndexOf(twoPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(int8MinValue);
      const expectVal2 = oneValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_4000
     * @tc.name testFloat64ArrayLastIndexOf040
     * @tc.desc Verify lastIndexOf returns -1 when element not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const idx = arr.lastIndexOf(fillValue99);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_4100
     * @tc.name testFloat64ArrayLastIndexOf041
     * @tc.desc Verify lastIndexOf on empty array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array(0);
      const idx = arr.lastIndexOf(onePointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_4200
     * @tc.name testFloat64ArrayLastIndexOf042
     * @tc.desc Verify lastIndexOf return value is an integer type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, 9007199254740991, zeroValue);
      const idx = arr.lastIndexOf(twoPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(pointOne);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
      expect(typeof idxFound).assertEqual('int');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_4300
     * @tc.name testFloat64ArrayLastIndexOf043
     * @tc.desc Verify lastIndexOf with duplicate values returns rightmost position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const threeValue: number = 3;
      const arr = Float64Array.of(0.5, pointOneTwoFive, pointOneTwoFive, pointOneTwoFive, 0.0625);
      const idx = arr.lastIndexOf(twoPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxDup = arr.lastIndexOf(pointOneTwoFive);
      const expectVal2 = threeValue;
      expect(idxDup).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_4400
     * @tc.name testFloat64ArrayLastIndexOf044
     * @tc.desc Verify lastIndexOf with all zero elements returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const sevenPointZero: number = 7.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const idx = arr.lastIndexOf(sevenPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxZero = arr.lastIndexOf(zeroValue);
      const expectVal2 = twoValue;
      expect(idxZero).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_4500
     * @tc.name testFloat64ArrayLastIndexOf045
     * @tc.desc Verify lastIndexOf on single-element array found returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const fillValue42: number = 42.0;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = new Float64Array([int32MinValue]);
      const idx = arr.lastIndexOf(fillValue42);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(int32MinValue);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_4600
     * @tc.name testFloat64ArrayLastIndexOf046
     * @tc.desc Verify lastIndexOf on single-element array not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(0.1);
      const idx = arr.lastIndexOf(zeroPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_4700
     * @tc.name testFloat64ArrayLastIndexOf047
     * @tc.desc Verify lastIndexOf with fromIndex=5 out of bounds on single element returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5]);
      const idx = arr.lastIndexOf(onePointZero, 5);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_4800
     * @tc.name testFloat64ArrayLastIndexOf048
     * @tc.desc Verify lastIndexOf with negative fromIndex out of bounds on single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768]);
      const idx = arr.lastIndexOf(onePointZero, -5);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_4900
     * @tc.name testFloat64ArrayLastIndexOf049
     * @tc.desc Verify lastIndexOf on large array with fromIndex 10000 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroValue: number = 0;
      const arr = new Float64Array(1000);
      arr.$_set(0, onePointZero);
      const idx = arr.lastIndexOf(onePointZero, 10000);
      const expectVal = zeroValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_5000
     * @tc.name testFloat64ArrayLastIndexOf050
     * @tc.desc Verify lastIndexOf on large array with negative fromIndex -10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array(1000);
      arr.$_set(999, onePointZero);
      const idx = arr.lastIndexOf(onePointZero, -10000);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_5100
     * @tc.name testFloat64ArrayLastIndexOf051
     * @tc.desc Verify lastIndexOf with NaN in array does not match NaN search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const nanValue: number = NaN;
      const negativeOne: number = -1;
      const arr = new Float64Array([zeroValue, -1, zeroValue]);
      const idx = arr.lastIndexOf(nanValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_5200
     * @tc.name testFloat64ArrayLastIndexOf052
     * @tc.desc Verify lastIndexOf finds normal value in array containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, 9007199254740991, zeroValue);
      const idx = arr.lastIndexOf(onePointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(pointOne);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_5300
     * @tc.name testFloat64ArrayLastIndexOf053
     * @tc.desc Verify lastIndexOf with fromIndex=1 excludes index 2 when searching backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const arr = new Float64Array([0.5, onePointFive, 0.25]);
      const idx = arr.lastIndexOf(onePointZero, 1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(onePointFive, 1);
      const expectVal2 = oneValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_5400
     * @tc.name testFloat64ArrayLastIndexOf054
     * @tc.desc Verify lastIndexOf with fromIndex=-2 searches from second-to-last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const int8MinValue: number = -128;
      const oneValue: number = 1;
      const arr = new Float64Array([-32768, -128, 0]);
      const idx = arr.lastIndexOf(onePointZero, -2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(int8MinValue, -2);
      const expectVal2 = oneValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_5500
     * @tc.name testFloat64ArrayLastIndexOf055
     * @tc.desc Verify lastIndexOf with fromIndex=2 skips indices 0-1 when searching backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const idx = arr.lastIndexOf(twoPointZero, 2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(zeroValue, 2);
      const expectVal2 = twoValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_5600
     * @tc.name testFloat64ArrayLastIndexOf056
     * @tc.desc Verify lastIndexOf matches +0.0 against +0.0 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const twoValue: number = 2;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const idx = arr.lastIndexOf(zeroPointZero);
      const expectVal = twoValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_5700
     * @tc.name testFloat64ArrayLastIndexOf057
     * @tc.desc Verify lastIndexOf with +0.0 does not match -0.0 element when array has -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const idx = arr.lastIndexOf(zeroPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_5800
     * @tc.name testFloat64ArrayLastIndexOf058
     * @tc.desc Verify lastIndexOf with -Infinity not in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, 0]);
      const idx = arr.lastIndexOf(negativeInfinity);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_5900
     * @tc.name testFloat64ArrayLastIndexOf059
     * @tc.desc Verify lastIndexOf with Infinity not in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const idx = arr.lastIndexOf(positiveInfinity);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_6000
     * @tc.name testFloat64ArrayLastIndexOf060
     * @tc.desc Verify lastIndexOf finds MAX_VALUE at correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const max: number = 1.7976931348623157e+308;
      const arr = new Float64Array([0.0, max, -max]);
      const idx = arr.lastIndexOf(max);
      const expectVal = oneValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_6100
     * @tc.name testFloat64ArrayLastIndexOf061
     * @tc.desc Verify lastIndexOf finds negative MAX_VALUE at correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const max: number = 1.7976931348623157e+308;
      const arr = new Float64Array([0.0, max, -max]);
      const idx = arr.lastIndexOf(-max);
      const expectVal = twoValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_6200
     * @tc.name testFloat64ArrayLastIndexOf062
     * @tc.desc Verify lastIndexOf with MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeMaxSafeIntegerValue: number = -9007199254740991.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const idx = arr.lastIndexOf(negativeMaxSafeIntegerValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_6300
     * @tc.name testFloat64ArrayLastIndexOf063
     * @tc.desc Verify lastIndexOf with repeated elements fromIndex=0 returns first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const idx = arr.lastIndexOf(twoPointZero, 0);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFirst = arr.lastIndexOf(zeroValue, 0);
      const expectVal2 = zeroValue;
      expect(idxFirst).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_6400
     * @tc.name testFloat64ArrayLastIndexOf064
     * @tc.desc Verify lastIndexOf with repeated elements fromIndex=1 returns rightmost within range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const arr = new Float64Array([pointTwoFive, pointTwoFive, pointTwoFive]);
      const idx = arr.lastIndexOf(twoPointZero, 1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxEnd = arr.lastIndexOf(pointTwoFive, 1);
      const expectVal2 = oneValue;
      expect(idxEnd).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_6500
     * @tc.name testFloat64ArrayLastIndexOf065
     * @tc.desc Verify lastIndexOf with repeated elements fromIndex=2 returns last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const idx = arr.lastIndexOf(twoPointZero, 2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxLast = arr.lastIndexOf(zeroValue, 2);
      const expectVal2 = twoValue;
      expect(idxLast).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_6600
     * @tc.name testFloat64ArrayLastIndexOf066
     * @tc.desc Verify lastIndexOf with repeated elements fromIndex=3 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const idx = arr.lastIndexOf(twoPointZero, 3);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_6700
     * @tc.name testFloat64ArrayLastIndexOf067
     * @tc.desc Verify lastIndexOf with repeated elements fromIndex=-1 returns last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const idx = arr.lastIndexOf(twoPointZero, -1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxLast = arr.lastIndexOf(zeroValue, -1);
      const expectVal2 = twoValue;
      expect(idxLast).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_6800
     * @tc.name testFloat64ArrayLastIndexOf068
     * @tc.desc Verify lastIndexOf with repeated elements fromIndex=-2 returns second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const arr = new Float64Array([pointTwoFive, pointTwoFive, pointTwoFive]);
      const idx = arr.lastIndexOf(twoPointZero, -2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxMid = arr.lastIndexOf(pointTwoFive, -2);
      const expectVal2 = oneValue;
      expect(idxMid).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_6900
     * @tc.name testFloat64ArrayLastIndexOf069
     * @tc.desc Verify lastIndexOf with repeated elements fromIndex=-3 returns first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const idx = arr.lastIndexOf(twoPointZero, -3);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFirst = arr.lastIndexOf(zeroValue, -3);
      const expectVal2 = zeroValue;
      expect(idxFirst).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_7000
     * @tc.name testFloat64ArrayLastIndexOf070
     * @tc.desc Verify lastIndexOf with repeated elements fromIndex=-4 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const idx = arr.lastIndexOf(twoPointZero, -4);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_7100
     * @tc.name testFloat64ArrayLastIndexOf071
     * @tc.desc Verify lastIndexOf on empty array with NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const negativeOne: number = -1;
      const arr = new Float64Array(0);
      const idx = arr.lastIndexOf(nanValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_7200
     * @tc.name testFloat64ArrayLastIndexOf072
     * @tc.desc Verify lastIndexOf on empty array with Infinity returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeOne: number = -1;
      const arr = new Float64Array(0);
      const idx = arr.lastIndexOf(positiveInfinity);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_7300
     * @tc.name testFloat64ArrayLastIndexOf073
     * @tc.desc Verify lastIndexOf on single-element array with fromIndex=1 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(0.1);
      const idx = arr.lastIndexOf(fillValue42, 1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_7400
     * @tc.name testFloat64ArrayLastIndexOf074
     * @tc.desc Verify lastIndexOf on single-element array with fromIndex=-1 finds element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const fillValue42: number = 42.0;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = new Float64Array([pointFive]);
      const idx = arr.lastIndexOf(fillValue42, -1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(pointFive, -1);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_7500
     * @tc.name testFloat64ArrayLastIndexOf075
     * @tc.desc Verify lastIndexOf on single NaN element returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768]);
      const idx = arr.lastIndexOf(nanValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_7600
     * @tc.name testFloat64ArrayLastIndexOf076
     * @tc.desc Verify lastIndexOf finds last element in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const num999Value: number = 999;
      const arr = new Float64Array(1000);
      arr.$_set(999, onePointZero);
      const idx = arr.lastIndexOf(onePointZero);
      const expectVal = num999Value;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_7700
     * @tc.name testFloat64ArrayLastIndexOf077
     * @tc.desc Verify lastIndexOf finds first element in large array from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroValue: number = 0;
      const arr = new Float64Array(1000);
      arr.$_set(0, onePointZero);
      const idx = arr.lastIndexOf(onePointZero);
      const expectVal = zeroValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_7800
     * @tc.name testFloat64ArrayLastIndexOf078
     * @tc.desc Verify lastIndexOf finds middle element in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const num500Value: number = 500;
      const arr = new Float64Array(1000);
      arr.$_set(500, onePointZero);
      const idx = arr.lastIndexOf(onePointZero);
      const expectVal = num500Value;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_7900
     * @tc.name testFloat64ArrayLastIndexOf079
     * @tc.desc Verify lastIndexOf with fromIndex=500 finds element in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array(1000);
      arr.$_set(999, onePointZero);
      const idx = arr.lastIndexOf(onePointZero, 500);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_8000
     * @tc.name testFloat64ArrayLastIndexOf080
     * @tc.desc Verify lastIndexOf with fromIndex=500 finds element at index 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const num300Value: number = 300;
      const arr = new Float64Array(1000);
      arr.$_set(300, onePointZero);
      const idx = arr.lastIndexOf(onePointZero, 500);
      const expectVal = num300Value;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_8100
     * @tc.name testFloat64ArrayLastIndexOf081
     * @tc.desc Verify lastIndexOf with fromIndex=-500 finds last element in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array(1000);
      arr.$_set(999, onePointZero);
      const idx = arr.lastIndexOf(onePointZero, -500);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_8200
     * @tc.name testFloat64ArrayLastIndexOf082
     * @tc.desc Verify lastIndexOf with fromIndex=-1000 finds first element in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroValue: number = 0;
      const arr = new Float64Array(1000);
      arr.$_set(0, onePointZero);
      const idx = arr.lastIndexOf(onePointZero, -1000);
      const expectVal = zeroValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_8300
     * @tc.name testFloat64ArrayLastIndexOf083
     * @tc.desc Verify lastIndexOf with fromIndex=-1001 out of bounds in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array(1000);
      arr.$_set(0, onePointZero);
      const idx = arr.lastIndexOf(onePointZero, -1001);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_8400
     * @tc.name testFloat64ArrayLastIndexOf084
     * @tc.desc Verify lastIndexOf finds last of all identical elements in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const ninetynineValue: number = 99;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i = i + 1) {
        arr.$_set(i, sevenPointZero);
      }
      const idx = arr.lastIndexOf(sevenPointZero);
      const expectVal = ninetynineValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_8500
     * @tc.name testFloat64ArrayLastIndexOf085
     * @tc.desc Verify lastIndexOf with fromIndex=50 finds last element in all-identical large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const fiftyValue: number = 50;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i = i + 1) {
        arr.$_set(i, sevenPointZero);
      }
      const idx = arr.lastIndexOf(sevenPointZero, 50);
      const expectVal = fiftyValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_8600
     * @tc.name testFloat64ArrayLastIndexOf086
     * @tc.desc Verify lastIndexOf finds value in array with mixed boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const num123Pointfourfivesix: number = 123.456;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const negnum888Pointeighteight: number = -888.88;
      const fiveValue: number = 5;
      const sixValue: number = 6;
      const arr =
        Float64Array.of(-2147483648, -1, zeroValue, 1, 2147483647, -888.88, num123Pointfourfivesix,
          zeroValue, zeroValue);
      const idx = arr.lastIndexOf(twoPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxSpecial = arr.lastIndexOf(negnum888Pointeighteight);
      const expectVal2 = fiveValue;
      expect(idxSpecial).assertEqual(expectVal2);
      const idxNormal = arr.lastIndexOf(num123Pointfourfivesix);
      const expectVal3 = sixValue;
      expect(idxNormal).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_8700
     * @tc.name testFloat64ArrayLastIndexOf087
     * @tc.desc Verify lastIndexOf with fromIndex=3 in mixed boundary array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const sciValue10e6: number = 1.0e6;
      const num999999Pointninenine: number = 999999.99;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const arr =
        new Float64Array([0.1, 9007199254740991, zeroValue, 3.141592653589793, -1e-100, sciValue10e6, num999999Pointninenine,
          zeroValue, zeroValue]);
      const idx = arr.lastIndexOf(twoPointZero, 3);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxSci = arr.lastIndexOf(sciValue10e6, 3);
      const expectVal2 = negativeOne;
      expect(idxSci).assertEqual(expectVal2);
      const idxAmount = arr.lastIndexOf(num999999Pointninenine, 3);
      const expectVal3 = negativeOne;
      expect(idxAmount).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_8800
     * @tc.name testFloat64ArrayLastIndexOf088
     * @tc.desc Verify lastIndexOf with fromIndex=-4 in mixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const threeValue: number = 3;
      const arr =
        new Float64Array([0.5, 1.5, 0.25, pointOneTwoFive, 0.0625, zeroValue,
          zeroValue]);
      const idx = arr.lastIndexOf(twoPointZero, -4);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(pointOneTwoFive, -4);
      const expectVal2 = threeValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_8900
     * @tc.name testFloat64ArrayLastIndexOf089
     * @tc.desc Verify lastIndexOf finds Infinity not in mixed boundary array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const positiveInfinity: number = Infinity;
      const negativeOne: number = -1;
      const arr = Float64Array.of(-32768, -128, zeroValue, 127, 32767, zeroValue, zeroValue);
      const idx = arr.lastIndexOf(positiveInfinity);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_9000
     * @tc.name testFloat64ArrayLastIndexOf090
     * @tc.desc Verify lastIndexOf finds -Infinity not in mixed boundary array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const negativeInfinity: number = -Infinity;
      const negativeOne: number = -1;
      const arr = new Float64Array([-2147483648, -1, zeroValue, 1, 2147483647, zeroValue, zeroValue]);
      const idx = arr.lastIndexOf(negativeInfinity);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_9100
     * @tc.name testFloat64ArrayLastIndexOf091
     * @tc.desc Verify lastIndexOf returns -1 for NaN search in mixed boundary array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const nanValue: number = NaN;
      const negativeOne: number = -1;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue, 3.141592653589793, -1e-100, zeroValue, zeroValue);
      const idx = arr.lastIndexOf(nanValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_9200
     * @tc.name testFloat64ArrayLastIndexOf092
     * @tc.desc Verify lastIndexOf fromIndex=5 in mixed boundary array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const negativeInfinity: number = -Infinity;
      const negativeOne: number = -1;
      const arr =
        Float64Array.of(0.5, 1.5, 0.25, 0.125, 0.0625, zeroValue,
          zeroValue);
      const idx = arr.lastIndexOf(negativeInfinity, 5);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_9300
     * @tc.name testFloat64ArrayLastIndexOf093
     * @tc.desc Verify lastIndexOf fromIndex=-3 searching NaN in mixed boundary array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const nanValue: number = NaN;
      const negativeOne: number = -1;
      const arr = Float64Array.of(-32768, -128, zeroValue, 127, 32767, zeroValue, zeroValue);
      const idx = arr.lastIndexOf(nanValue, -3);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_9400
     * @tc.name testFloat64ArrayLastIndexOf094
     * @tc.desc Verify lastIndexOf with searchElement as 1e0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const sciValue1e0: number = 1e0;
      const negativeOne: number = -1;
      const arr = new Float64Array([int32MinValue, -1, zeroValue]);
      const idx = arr.lastIndexOf(sciValue1e0);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(int32MinValue);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_9500
     * @tc.name testFloat64ArrayLastIndexOf095
     * @tc.desc Verify lastIndexOf with searchElement as 1e-323
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e323: number = 1.0e-323;
      const negativeOne: number = -1;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const idx = arr.lastIndexOf(sciValue10e323);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_9600
     * @tc.name testFloat64ArrayLastIndexOf096
     * @tc.desc Verify lastIndexOf with searchElement as negative scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negsciValue1e2: number = -1e2;
      const negativeOne: number = -1;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const idx = arr.lastIndexOf(negsciValue1e2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_9700
     * @tc.name testFloat64ArrayLastIndexOf097
     * @tc.desc Verify lastIndexOf with searchElement as float 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointFive: number = 2.5;
      const negativeOne: number = -1;
      const arr = new Float64Array([-32768, -128, 0]);
      const idx = arr.lastIndexOf(twoPointFive);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF_9800
     * @tc.name testFloat64ArrayLastIndexOf098
     * @tc.desc Verify lastIndexOf with searchElement as negative float -2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negtwoPointfive: number = -2.5;
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const idx = arr.lastIndexOf(negtwoPointfive);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })
  })
}
