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

export default function float64ArrayIndexOfTest(): void {
  describe('Float64ArrayIndexOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0010
     * @tc.name testFloat64ArrayIndexOf001
     * @tc.desc Verify indexOf with single parameter finds first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const idx = arr.indexOf(onePointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFirst = arr.indexOf(int32MinValue);
      const expectVal2 = zeroValue;
      expect(idxFirst).assertEqual(expectVal2);
      let searchInt: int = -2147483648;
      const idxInt = arr.indexOf(searchInt);
      const expectVal3 = zeroValue;
      expect(idxInt).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0020
     * @tc.name testFloat64ArrayIndexOf002
     * @tc.desc Verify indexOf with single parameter finds middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const idx = arr.indexOf(twoPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxMid = arr.indexOf(maxSafeInteger);
      const expectVal2 = oneValue;
      expect(idxMid).assertEqual(expectVal2);
      let searchInt: int = 0;
      const idxIntVar = arr.indexOf(searchInt);
      const expectVal3 = twoValue;
      expect(idxIntVar).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0030
     * @tc.name testFloat64ArrayIndexOf003
     * @tc.desc Verify indexOf with single parameter finds last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const threePointZero: number = 3.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const idx = arr.indexOf(threePointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxLast = arr.indexOf(pointTwoFive);
      const expectVal2 = twoValue;
      expect(idxLast).assertEqual(expectVal2);
      let searchNum: number = 1.5;
      const idxNumVar = arr.indexOf(searchNum);
      const expectVal3 = oneValue;
      expect(idxNumVar).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0040
     * @tc.name testFloat64ArrayIndexOf004
     * @tc.desc Verify indexOf with fromIndex=1 finds element at or after index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const int8MinValue: number = -128;
      const oneValue: number = 1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const idx = arr.indexOf(twoPointZero, 1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(int8MinValue, 1);
      const expectVal2 = oneValue;
      expect(idxFound).assertEqual(expectVal2);
      let fromIdx: int = 1;
      const idxVar2 = arr.indexOf(int8MinValue, fromIdx);
      const expectVal3 = oneValue;
      expect(idxVar2).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0050
     * @tc.name testFloat64ArrayIndexOf005
     * @tc.desc Verify indexOf with fromIndex=2 finds element at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const threePointZero: number = 3.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const idx = arr.indexOf(threePointZero, 2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(zeroValue, 2);
      const expectVal2 = twoValue;
      expect(idxFound).assertEqual(expectVal2);
      let searchInt: int = 0;
      let fromIdx: int = 2;
      const idxBothInt = arr.indexOf(searchInt, fromIdx);
      const expectVal3 = twoValue;
      expect(idxBothInt).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0060
     * @tc.name testFloat64ArrayIndexOf006
     * @tc.desc Verify indexOf with fromIndex=3 out of bounds returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const idx = arr.indexOf(onePointZero, 3);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0070
     * @tc.name testFloat64ArrayIndexOf007
     * @tc.desc Verify indexOf with fromIndex=-1 finds element at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const twoValue: number = 2;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const idxFound = arr.indexOf(pointTwoFive, -1);
      const expectVal = twoValue;
      expect(idxFound).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0080
     * @tc.name testFloat64ArrayIndexOf008
     * @tc.desc Verify indexOf with fromIndex=-2 searches from second-to-last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const idx = arr.indexOf(twoPointZero, -2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(zeroValue, -2);
      const expectVal2 = twoValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0090
     * @tc.name testFloat64ArrayIndexOf009
     * @tc.desc Verify indexOf with fromIndex=-3 equals searching from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const idx = arr.indexOf(onePointZero, -3);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(int32MinValue, -3);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0100
     * @tc.name testFloat64ArrayIndexOf010
     * @tc.desc Verify indexOf with fromIndex=-4 out of bounds returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const idx = arr.indexOf(onePointZero, -4);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0110
     * @tc.name testFloat64ArrayIndexOf011
     * @tc.desc Verify indexOf with searchElement as positive float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const twoPointFive: number = 2.5;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const idx = arr.indexOf(twoPointFive);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(pointFive);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0120
     * @tc.name testFloat64ArrayIndexOf012
     * @tc.desc Verify indexOf with searchElement as negative float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negtwoPointfive: number = -2.5;
      const negativeOne: number = -1;
      const int8MinValue: number = -128;
      const oneValue: number = 1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const idx = arr.indexOf(negtwoPointfive);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(int8MinValue);
      const expectVal2 = oneValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0130
     * @tc.name testFloat64ArrayIndexOf013
     * @tc.desc Verify indexOf with searchElement as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const zeroPointZero: number = 0.0;
      const twoValue: number = 2;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const idx = arr.indexOf(zeroPointZero);
      const expectVal = twoValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0140
     * @tc.name testFloat64ArrayIndexOf014
     * @tc.desc Verify indexOf with searchElement as negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const negativeZero: number = -0.0;
      const twoValue: number = 2;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const idx = arr.indexOf(negativeZero);
      const expectVal = twoValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0150
     * @tc.name testFloat64ArrayIndexOf015
     * @tc.desc Verify indexOf with searchElement NaN returns -1 since NaN does not match any value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const nanValue: number = NaN;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const idx = arr.indexOf(nanValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0160
     * @tc.name testFloat64ArrayIndexOf016
     * @tc.desc Verify indexOf with searchElement Infinity returns -1 when not in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const positiveInfinity: number = Infinity;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const idx = arr.indexOf(positiveInfinity);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0170
     * @tc.name testFloat64ArrayIndexOf017
     * @tc.desc Verify indexOf with searchElement -Infinity returns -1 when not in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeInfinity: number = -Infinity;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const idx = arr.indexOf(negativeInfinity);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0180
     * @tc.name testFloat64ArrayIndexOf018
     * @tc.desc Verify indexOf with searchElement as MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const idx = arr.indexOf(doubleMaxValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0190
     * @tc.name testFloat64ArrayIndexOf019
     * @tc.desc Verify indexOf with searchElement as MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const doubleMinValue: number = 5e-324;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const idx = arr.indexOf(doubleMinValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0200
     * @tc.name testFloat64ArrayIndexOf020
     * @tc.desc Verify indexOf with searchElement as MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const idx = arr.indexOf(maxSafeIntegerValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0210
     * @tc.name testFloat64ArrayIndexOf021
     * @tc.desc Verify indexOf with searchElement as very negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negnum999999Pointninenine: number = -999999.99;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const idx = arr.indexOf(negnum999999Pointninenine);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0220
     * @tc.name testFloat64ArrayIndexOf022
     * @tc.desc Verify indexOf returns -1 when searchElement not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const fourPointZero: number = 4.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const idx = arr.indexOf(fourPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0230
     * @tc.name testFloat64ArrayIndexOf023
     * @tc.desc Verify indexOf with searchElement as scientific notation 1.0e+308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const sciValue10e308: number = 1.0e+308;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const idx = arr.indexOf(sciValue10e308);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0240
     * @tc.name testFloat64ArrayIndexOf024
     * @tc.desc Verify indexOf with searchElement as scientific notation 1.0e-308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const sciValue10e308: number = 1.0e-308;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const idx = arr.indexOf(sciValue10e308);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0250
     * @tc.name testFloat64ArrayIndexOf025
     * @tc.desc Verify indexOf with 0.1+0.2 precision boundary does not match 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const pointOne: number = 0.1;
      const pointTwo: number = 0.2;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const idx = arr.indexOf(pointOne + pointTwo);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0260
     * @tc.name testFloat64ArrayIndexOf026
     * @tc.desc Verify indexOf with duplicate values returns first occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointOne, zeroValue, zeroValue, piValue);
      const idx = arr.indexOf(twoPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxDup = arr.indexOf(zeroValue);
      const expectVal2 = oneValue;
      expect(idxDup).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0270
     * @tc.name testFloat64ArrayIndexOf027
     * @tc.desc Verify indexof(5.0) with [0.125, 0.125, 0.125, 0.125] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const fivePointZero: number = 5.0;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOneTwoFive, pointOneTwoFive, pointOneTwoFive, pointOneTwoFive);
      const idx = arr.indexOf(fivePointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxSame = arr.indexOf(pointOneTwoFive);
      const expectVal2 = zeroValue;
      expect(idxSame).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0280
     * @tc.name testFloat64ArrayIndexOf028
     * @tc.desc Verify indexOf with fromIndex=0 finds first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const idx = arr.indexOf(onePointZero, 0);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(int16MinValue, 0);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0290
     * @tc.name testFloat64ArrayIndexOf029
     * @tc.desc Verify indexOf with fromIndex=1 skips the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const idx = arr.indexOf(onePointZero, 1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(negativeOne, 1);
      const expectVal2 = oneValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0300
     * @tc.name testFloat64ArrayIndexOf030
     * @tc.desc Verify indexOf with fromIndex=100 large out of bounds returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const idx = arr.indexOf(onePointZero, 100);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0310
     * @tc.name testFloat64ArrayIndexOf031
     * @tc.desc Verify indexOf with fromIndex=-1000 very large negative returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const idx = arr.indexOf(onePointZero, -1000);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(int16MinValue, -1000);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0320
     * @tc.name testFloat64ArrayIndexOf032
     * @tc.desc Verify indexOf with fromIndex as decimal 2.9 truncated to integer 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const threePointZero: number = 3.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const idx = arr.indexOf(threePointZero, 2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(zeroValue, 2);
      const expectVal2 = twoValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0330
     * @tc.name testFloat64ArrayIndexOf033
     * @tc.desc Verify indexOf with fromIndex as negative decimal -2.9 truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const idx = arr.indexOf(twoPointZero, -2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(zeroValue, -2);
      const expectVal2 = twoValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0340
     * @tc.name testFloat64ArrayIndexOf034
     * @tc.desc Verify indexOf with fromIndex as INT_MAX out of bounds returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const idx = arr.indexOf(onePointZero, 2147483647);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0350
     * @tc.name testFloat64ArrayIndexOf035
     * @tc.desc Verify indexOf with fromIndex as INT_MIN out of bounds returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const idx = arr.indexOf(onePointZero, -2147483647);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(int16MinValue, -2147483647);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0360
     * @tc.name testFloat64ArrayIndexOf036
     * @tc.desc Verify indexOf fromIndex=0 and fromIndex=-length produce the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const idx1 = arr.indexOf(onePointZero, 0);
      const idx2 = arr.indexOf(onePointZero, -3);
      const expectVal = idx2;
      expect(idx1).assertEqual(expectVal);
      const idxF1 = arr.indexOf(int32MinValue, 0);
      const idxF2 = arr.indexOf(int32MinValue, -3);
      const expectVal2 = idxF2;
      expect(idxF1).assertEqual(expectVal2);
      const expectVal3 = zeroValue;
      expect(idxF1).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0370
     * @tc.name testFloat64ArrayIndexOf037
     * @tc.desc Verify indexOf with fromIndex=1 finds first duplicate from that position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointOne, zeroValue, zeroValue, piValue);
      const idx = arr.indexOf(twoPointZero, 1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxDup = arr.indexOf(zeroValue, 1);
      const expectVal2 = oneValue;
      expect(idxDup).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0380
     * @tc.name testFloat64ArrayIndexOf038
     * @tc.desc Verify indexOf with fromIndex=2 finds second duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = Float64Array.of(pointFive, pointTwoFive, pointTwoFive, pointOneTwoFive);
      const idx = arr.indexOf(twoPointZero, 2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxDup2 = arr.indexOf(pointTwoFive, 2);
      const expectVal2 = twoValue;
      expect(idxDup2).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0390
     * @tc.name testFloat64ArrayIndexOf039
     * @tc.desc Verify indexOf returns non-negative integer when element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const int8MinValue: number = -128;
      const oneValue: number = 1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const idx = arr.indexOf(twoPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(int8MinValue);
      const expectVal2 = oneValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0400
     * @tc.name testFloat64ArrayIndexOf040
     * @tc.desc Verify indexOf returns -1 when element not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const fillValue99: number = 99.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const idx = arr.indexOf(fillValue99);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0410
     * @tc.name testFloat64ArrayIndexOf041
     * @tc.desc Verify indexOf on empty array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array(0);
      const idx = arr.indexOf(onePointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0420
     * @tc.name testFloat64ArrayIndexOf042
     * @tc.desc Verify indexOf return value is an integer type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const idx = arr.indexOf(twoPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(pointOne);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
      expect(typeof idxFound).assertEqual('int');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0430
     * @tc.name testFloat64ArrayIndexOf043
     * @tc.desc Verify indexOf with duplicate values returns first occurrence position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointFive, pointOneTwoFive, pointOneTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const idx = arr.indexOf(twoPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxDup = arr.indexOf(pointOneTwoFive);
      const expectVal2 = oneValue;
      expect(idxDup).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0440
     * @tc.name testFloat64ArrayIndexOf044
     * @tc.desc Verify indexof(7.0) with [0, 0, 0] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const sevenPointZero: number = 7.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const idx = arr.indexOf(sevenPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxZero = arr.indexOf(zeroValue);
      const expectVal2 = zeroValue;
      expect(idxZero).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0450
     * @tc.name testFloat64ArrayIndexOf045
     * @tc.desc Verify indexOf on single-element array found returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const fillValue42: number = 42.0;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue);
      const idx = arr.indexOf(fillValue42);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(int32MinValue);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0460
     * @tc.name testFloat64ArrayIndexOf046
     * @tc.desc Verify indexOf on single-element array not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroPointZero: number = 0.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne);
      const idx = arr.indexOf(zeroPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0470
     * @tc.name testFloat64ArrayIndexOf047
     * @tc.desc Verify indexOf with fromIndex=5 out of bounds on single element array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive);
      const idx = arr.indexOf(onePointZero, 5);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0480
     * @tc.name testFloat64ArrayIndexOf048
     * @tc.desc Verify indexOf with negative fromIndex out of bounds on single element returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue);
      const idx = arr.indexOf(onePointZero, -5);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0490
     * @tc.name testFloat64ArrayIndexOf049
     * @tc.desc Verify indexOf on large array with fromIndex 10000 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array(1000);
      arr.$_set(0, onePointZero);
      const idx = arr.indexOf(onePointZero, 10000);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0500
     * @tc.name testFloat64ArrayIndexOf050
     * @tc.desc Verify indexOf on large array with negative fromIndex clamped to 0 finds tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const num999Value: number = 999;
      const arr = new Float64Array(1000);
      arr.$_set(999, onePointZero);
      const idx = arr.indexOf(onePointZero, -10000);
      const expectVal = num999Value;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0510
     * @tc.name testFloat64ArrayIndexOf051
     * @tc.desc Verify indexOf with NaN in array does not match NaN search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const nanValue: number = NaN;
      const negativeOne: number = -1;
      const arr = Float64Array.of(zeroValue, -1, zeroValue);
      const idx = arr.indexOf(nanValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0520
     * @tc.name testFloat64ArrayIndexOf052
     * @tc.desc Verify indexOf finds normal value in array containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const idx = arr.indexOf(onePointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(pointOne);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0530
     * @tc.name testFloat64ArrayIndexOf053
     * @tc.desc Verify indexOf with fromIndex=1 skips first element searching for first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const idx = arr.indexOf(onePointZero, 1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(onePointFive, 1);
      const expectVal2 = oneValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0540
     * @tc.name testFloat64ArrayIndexOf054
     * @tc.desc Verify indexOf with fromIndex=-2 searches from second-to-last skipping first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const idx = arr.indexOf(onePointZero, -2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(zeroValue, -2);
      const expectVal2 = twoValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0550
     * @tc.name testFloat64ArrayIndexOf055
     * @tc.desc Verify indexOf with fromIndex=2 skips middle element when searching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const idx = arr.indexOf(twoPointZero, 2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(zeroValue, 2);
      const expectVal2 = twoValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0560
     * @tc.name testFloat64ArrayIndexOf056
     * @tc.desc Verify indexOf matches +0.0 against +0.0 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const zeroPointZero: number = 0.0;
      const twoValue: number = 2;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const idx = arr.indexOf(zeroPointZero);
      const expectVal = twoValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0570
     * @tc.name testFloat64ArrayIndexOf057
     * @tc.desc Verify indexOf with +0.0 matches -0.0 element since +0 equals -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const zeroPointZero: number = 0.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const idx = arr.indexOf(zeroPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0580
     * @tc.name testFloat64ArrayIndexOf058
     * @tc.desc Verify indexOf matches -Infinity at correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negativeInfinity: number = -Infinity;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const idx = arr.indexOf(negativeInfinity);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0590
     * @tc.name testFloat64ArrayIndexOf059
     * @tc.desc Verify indexOf matches Infinity at correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const positiveInfinity: number = Infinity;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const idx = arr.indexOf(positiveInfinity);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0600
     * @tc.name testFloat64ArrayIndexOf060
     * @tc.desc Verify indexOf finds MAX_VALUE at correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const oneValue: number = 1;
      const max: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(zeroPointZero, max, -max);
      const idx = arr.indexOf(max);
      const expectVal = oneValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0610
     * @tc.name testFloat64ArrayIndexOf061
     * @tc.desc Verify indexOf finds negative MAX_VALUE at correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const twoValue: number = 2;
      const max: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(zeroPointZero, max, -max);
      const idx = arr.indexOf(-max);
      const expectVal = twoValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0620
     * @tc.name testFloat64ArrayIndexOf062
     * @tc.desc Verify indexOf finds MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeMaxSafeIntegerValue: number = -9007199254740991.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const idx = arr.indexOf(negativeMaxSafeIntegerValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0630
     * @tc.name testFloat64ArrayIndexOf063
     * @tc.desc Verify indexOf with repeated elements fromIndex=0 returns first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const idx = arr.indexOf(twoPointZero, 0);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFirst = arr.indexOf(zeroValue, 0);
      const expectVal2 = zeroValue;
      expect(idxFirst).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0640
     * @tc.name testFloat64ArrayIndexOf064
     * @tc.desc Verify indexOf with repeated elements fromIndex=1 returns second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointTwoFive, pointTwoFive, pointTwoFive);
      const idx = arr.indexOf(twoPointZero, 1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxSecond = arr.indexOf(pointTwoFive, 1);
      const expectVal2 = oneValue;
      expect(idxSecond).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0650
     * @tc.name testFloat64ArrayIndexOf065
     * @tc.desc Verify indexOf with repeated elements fromIndex=2 returns third
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const idx = arr.indexOf(twoPointZero, 2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxThird = arr.indexOf(zeroValue, 2);
      const expectVal2 = twoValue;
      expect(idxThird).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0660
     * @tc.name testFloat64ArrayIndexOf066
     * @tc.desc Verify indexOf with repeated elements fromIndex=3 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const idx = arr.indexOf(twoPointZero, 3);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0670
     * @tc.name testFloat64ArrayIndexOf067
     * @tc.desc Verify indexOf with repeated elements fromIndex=-1 returns last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const idx = arr.indexOf(twoPointZero, -1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxLast = arr.indexOf(zeroValue, -1);
      const expectVal2 = twoValue;
      expect(idxLast).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0680
     * @tc.name testFloat64ArrayIndexOf068
     * @tc.desc Verify indexOf with repeated elements fromIndex=-2 returns second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointTwoFive, pointTwoFive, pointTwoFive);
      const idx = arr.indexOf(twoPointZero, -2);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxSecond = arr.indexOf(pointTwoFive, -2);
      const expectVal2 = oneValue;
      expect(idxSecond).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0690
     * @tc.name testFloat64ArrayIndexOf069
     * @tc.desc Verify indexOf with repeated elements fromIndex=-3 returns first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const idx = arr.indexOf(twoPointZero, -3);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFirst = arr.indexOf(zeroValue, -3);
      const expectVal2 = zeroValue;
      expect(idxFirst).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0700
     * @tc.name testFloat64ArrayIndexOf070
     * @tc.desc Verify indexOf with repeated elements fromIndex=-4 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const idx = arr.indexOf(twoPointZero, -4);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0710
     * @tc.name testFloat64ArrayIndexOf071
     * @tc.desc Verify indexOf on empty array with NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const negativeOne: number = -1;
      const arr = new Float64Array(0);
      const idx = arr.indexOf(nanValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0720
     * @tc.name testFloat64ArrayIndexOf072
     * @tc.desc Verify indexOf on empty array with Infinity returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeOne: number = -1;
      const arr = new Float64Array(0);
      const idx = arr.indexOf(positiveInfinity);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0730
     * @tc.name testFloat64ArrayIndexOf073
     * @tc.desc Verify indexOf on single-element array with fromIndex=1 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const fillValue42: number = 42.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne);
      const idx = arr.indexOf(fillValue42, 1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0740
     * @tc.name testFloat64ArrayIndexOf074
     * @tc.desc Verify indexOf on single-element array with fromIndex=-1 finds element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const fillValue42: number = 42.0;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointFive);
      const idx = arr.indexOf(fillValue42, -1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(pointFive, -1);
      const expectVal2 = zeroValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0750
     * @tc.name testFloat64ArrayIndexOf075
     * @tc.desc Verify indexOf on single NaN element returns -1 because NaN does not match NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const nanValue: number = NaN;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue);
      const idx = arr.indexOf(nanValue);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0760
     * @tc.name testFloat64ArrayIndexOf076
     * @tc.desc Verify indexOf finds first element in large array of 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroValue: number = 0;
      const arr = new Float64Array(1000);
      arr.$_set(0, onePointZero);
      const idx = arr.indexOf(onePointZero);
      const expectVal = zeroValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0770
     * @tc.name testFloat64ArrayIndexOf077
     * @tc.desc Verify indexOf finds last element in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const num999Value: number = 999;
      const arr = new Float64Array(1000);
      arr.$_set(999, onePointZero);
      const idx = arr.indexOf(onePointZero);
      const expectVal = num999Value;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0780
     * @tc.name testFloat64ArrayIndexOf078
     * @tc.desc Verify indexOf finds middle element in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const num500Value: number = 500;
      const arr = new Float64Array(1000);
      arr.$_set(500, onePointZero);
      const idx = arr.indexOf(onePointZero);
      const expectVal = num500Value;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0790
     * @tc.name testFloat64ArrayIndexOf079
     * @tc.desc Verify indexOf with fromIndex=500 finds last element in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const num999Value: number = 999;
      const arr = new Float64Array(1000);
      arr.$_set(999, onePointZero);
      const idx = arr.indexOf(onePointZero, 500);
      const expectVal = num999Value;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0800
     * @tc.name testFloat64ArrayIndexOf080
     * @tc.desc Verify indexOf with fromIndex=500 skips first element in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array(1000);
      arr.$_set(0, onePointZero);
      const idx = arr.indexOf(onePointZero, 500);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0810
     * @tc.name testFloat64ArrayIndexOf081
     * @tc.desc Verify indexOf with fromIndex=-500 finds last element in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const num999Value: number = 999;
      const arr = new Float64Array(1000);
      arr.$_set(999, onePointZero);
      const idx = arr.indexOf(onePointZero, -500);
      const expectVal = num999Value;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0820
     * @tc.name testFloat64ArrayIndexOf082
     * @tc.desc Verify indexOf with fromIndex=-1000 finds first element in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroValue: number = 0;
      const arr = new Float64Array(1000);
      arr.$_set(0, onePointZero);
      const idx = arr.indexOf(onePointZero, -1000);
      const expectVal = zeroValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0830
     * @tc.name testFloat64ArrayIndexOf083
     * @tc.desc Verify indexOf with fromIndex below negative length clamps to 0 and finds first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroValue: number = 0;
      const arr = new Float64Array(1000);
      arr.$_set(0, onePointZero);
      const idx = arr.indexOf(onePointZero, -1001);
      const expectVal = zeroValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0840
     * @tc.name testFloat64ArrayIndexOf084
     * @tc.desc Verify indexOf finds first of all identical elements in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const zeroValue: number = 0;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i = i + 1) {
        arr.$_set(i, sevenPointZero);
      }
      const idx = arr.indexOf(sevenPointZero);
      const expectVal = zeroValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0850
     * @tc.name testFloat64ArrayIndexOf085
     * @tc.desc Verify indexOf with fromIndex=50 finds element in all-identical large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const fiftyValue: number = 50;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i = i + 1) {
        arr.$_set(i, sevenPointZero);
      }
      const idx = arr.indexOf(sevenPointZero, 50);
      const expectVal = fiftyValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0860
     * @tc.name testFloat64ArrayIndexOf086
     * @tc.desc Verify indexOf finds normal value in array with mixed boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const num123Pointfourfivesix: number = 123.456;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const negnum888Pointeighteight: number = -888.88;
      const fiveValue: number = 5;
      const sixValue: number = 6;
      const arr =
        Float64Array.of(int32MinValue, -1, zeroValue, oneValue, int32MaxValue, -888.88, num123Pointfourfivesix,
          zeroValue, zeroValue);
      const idx = arr.indexOf(twoPointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxSpecial = arr.indexOf(negnum888Pointeighteight);
      const expectVal2 = fiveValue;
      expect(idxSpecial).assertEqual(expectVal2);
      const idxNormal = arr.indexOf(num123Pointfourfivesix);
      const expectVal3 = sixValue;
      expect(idxNormal).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0870
     * @tc.name testFloat64ArrayIndexOf087
     * @tc.desc Verify indexOf with fromIndex=3 finds value in mixed boundary array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const sciValue10e6: number = 1.0e6;
      const num999999Pointninenine: number = 999999.99;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const fiveValue: number = 5;
      const sixValue: number = 6;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue, sciValue10e6,
        num999999Pointninenine, zeroValue, zeroValue);
      const idx = arr.indexOf(twoPointZero, 3);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxSci = arr.indexOf(sciValue10e6, 3);
      const expectVal2 = fiveValue;
      expect(idxSci).assertEqual(expectVal2);
      const idxAmount = arr.indexOf(num999999Pointninenine, 3);
      const expectVal3 = sixValue;
      expect(idxAmount).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0880
     * @tc.name testFloat64ArrayIndexOf088
     * @tc.desc Verify indexOf with fromIndex=-4 finds value in mixed boundary array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const threeValue: number = 3;
      const arr =
        Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive, zeroValue,
          zeroValue);
      const idx = arr.indexOf(twoPointZero, -4);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.indexOf(pointOneTwoFive, -4);
      const expectVal2 = threeValue;
      expect(idxFound).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_INDEXOF_0890
     * @tc.name testFloat64ArrayIndexOf089
     * @tc.desc Verify indexOf finds Infinity in mixed boundary array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIndexOf089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const positiveInfinity: number = Infinity;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue, int8MaxValue, int16MaxValue, zeroValue, zeroValue);
      const idx = arr.indexOf(positiveInfinity);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    })
  })
}
