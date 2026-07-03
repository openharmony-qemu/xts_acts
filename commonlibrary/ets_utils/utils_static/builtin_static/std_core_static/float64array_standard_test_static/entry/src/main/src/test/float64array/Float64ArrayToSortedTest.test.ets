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
import Utils from '../Util.test';

export default function Float64ArrayToSortedTest(): void {
  describe('Float64ArrayToSortedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_0100
     * @tc.name testFloat64ArrayToSorted001
     * @tc.desc Verify return value type is Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const twentyfourValue: number = 24;
      const arr = new Float64Array([3.0, 1.0, 2.0]);
      const sorted = arr.toSorted();
      expect(sorted.BYTES_PER_ELEMENT).assertEqual(eightValue);
      expect(sorted.byteLength).assertEqual(twentyfourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_0200
     * @tc.name testFloat64ArrayToSorted002
     * @tc.desc Verify return value is a new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([3.0, 1.0, 2.0]);
      const sorted = arr.toSorted();
      const expectVal = true;
      expect(sorted !== arr).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_0300
     * @tc.name testFloat64ArrayToSorted003
     * @tc.desc Verify return value and original array have different references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const sorted = arr.toSorted();
      const expectVal = true;
      expect(sorted !== arr).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_0400
     * @tc.name testFloat64ArrayToSorted004
     * @tc.desc Verify return value buffer differs from original array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([4.0, 2.0, 6.0]);
      const sorted = arr.toSorted();
      const expectVal = true;
      expect(sorted.buffer !== arr.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_0500
     * @tc.name testFloat64ArrayToSorted005
     * @tc.desc Verify original array element 0 remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const arr = new Float64Array([threePointZero, 1.0, 2.0]);
      arr.toSorted();
      const expectVal = threePointZero;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_0600
     * @tc.name testFloat64ArrayToSorted006
     * @tc.desc Verify original array element 1 remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array([3.0, onePointZero, 2.0]);
      arr.toSorted();
      const expectVal = onePointZero;
      expect(arr[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_0700
     * @tc.name testFloat64ArrayToSorted007
     * @tc.desc Verify original array element 2 remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const arr = new Float64Array([3.0, 1.0, twoPointZero]);
      arr.toSorted();
      const expectVal = twoPointZero;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_0800
     * @tc.name testFloat64ArrayToSorted008
     * @tc.desc Verify all original array elements remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninePointZero: number = 9.0;
      const threePointZero: number = 3.0;
      const sevenPointZero: number = 7.0;
      const onePointZero: number = 1.0;
      const fivePointZero: number = 5.0;
      const arr = new Float64Array([ninePointZero, threePointZero, sevenPointZero, onePointZero, fivePointZero]);
      arr.toSorted();
      expect(arr[0]).assertEqual(ninePointZero);
      expect(arr[1]).assertEqual(threePointZero);
      expect(arr[2]).assertEqual(sevenPointZero);
      expect(arr[3]).assertEqual(onePointZero);
      expect(arr[4]).assertEqual(fivePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_0900
     * @tc.name testFloat64ArrayToSorted009
     * @tc.desc Verify sorted array returns same order for already sorted array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const arr = new Float64Array([onePointZero, twoPointZero, threePointZero, fourPointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(onePointZero);
      expect(sorted[1]).assertEqual(twoPointZero);
      expect(sorted[2]).assertEqual(threePointZero);
      expect(sorted[3]).assertEqual(fourPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_1000
     * @tc.name testFloat64ArrayToSorted010
     * @tc.desc Verify reverse order array sorts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourPointZero: number = 4.0;
      const threePointZero: number = 3.0;
      const twoPointZero: number = 2.0;
      const onePointZero: number = 1.0;
      const arr = new Float64Array([fourPointZero, threePointZero, twoPointZero, onePointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(onePointZero);
      expect(sorted[1]).assertEqual(twoPointZero);
      expect(sorted[2]).assertEqual(threePointZero);
      expect(sorted[3]).assertEqual(fourPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_1100
     * @tc.name testFloat64ArrayToSorted011
     * @tc.desc Verify unordered array sorts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const twoPointZero: number = 2.0;
      const eightPointZero: number = 8.0;
      const onePointZero: number = 1.0;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([fivePointZero, twoPointZero, eightPointZero, onePointZero, ninePointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(onePointZero);
      expect(sorted[1]).assertEqual(twoPointZero);
      expect(sorted[2]).assertEqual(fivePointZero);
      expect(sorted[3]).assertEqual(eightPointZero);
      expect(sorted[4]).assertEqual(ninePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_1200
     * @tc.name testFloat64ArrayToSorted012
     * @tc.desc Verify sorting correctly with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negthreePointzero: number = -3.0;
      const onePointZero: number = 1.0;
      const negonePointzero: number = -1.0;
      const fivePointZero: number = 5.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array([negthreePointzero, onePointZero, negonePointzero, fivePointZero, zeroPointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(negthreePointzero);
      expect(sorted[1]).assertEqual(negonePointzero);
      expect(sorted[2]).assertEqual(zeroPointZero);
      expect(sorted[3]).assertEqual(onePointZero);
      expect(sorted[4]).assertEqual(fivePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_1300
     * @tc.name testFloat64ArrayToSorted013
     * @tc.desc Verify sorting correctly with decimal numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const twoPointsevenone: number = 2.71;
      const onePointfourone: number = 1.41;
      const pointFive: number = 0.5;
      const arr = new Float64Array([piApprox, twoPointsevenone, onePointfourone, pointFive]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(pointFive);
      expect(sorted[1]).assertEqual(onePointfourone);
      expect(sorted[2]).assertEqual(twoPointsevenone);
      expect(sorted[3]).assertEqual(piApprox);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_1400
     * @tc.name testFloat64ArrayToSorted014
     * @tc.desc Verify sorting correctly with duplicate elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = new Float64Array([threePointZero, onePointZero, threePointZero, twoPointZero, threePointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(onePointZero);
      expect(sorted[1]).assertEqual(twoPointZero);
      expect(sorted[2]).assertEqual(threePointZero);
      expect(sorted[3]).assertEqual(threePointZero);
      expect(sorted[4]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_1500
     * @tc.name testFloat64ArrayToSorted015
     * @tc.desc Verify sorting correctly with zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const negonePointzero: number = -1.0;
      const onePointZero: number = 1.0;
      const negativeZero: number = -0.0;
      const arr = new Float64Array([zeroPointZero, negonePointzero, onePointZero, negativeZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(negonePointzero);
      expect(sorted[1]).assertEqual(negativeZero);
      expect(sorted[2]).assertEqual(zeroPointZero);
      expect(sorted[3]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_1600
     * @tc.name testFloat64ArrayToSorted016
     * @tc.desc Verify sorting correctly with large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num1000000Pointzero: number = 1000000.0;
      const onePointZero: number = 1.0;
      const num500000Pointzero: number = 500000.0;
      const num250000Pointzero: number = 250000.0;
      const arr = new Float64Array([num1000000Pointzero, onePointZero, num500000Pointzero, num250000Pointzero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(onePointZero);
      expect(sorted[1]).assertEqual(num250000Pointzero);
      expect(sorted[2]).assertEqual(num500000Pointzero);
      expect(sorted[3]).assertEqual(num1000000Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_1700
     * @tc.name testFloat64ArrayToSorted017
     * @tc.desc Verify sorting correctly with extremely small numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e10: number = 1.0e-10;
      const sciValue50e15: number = 5.0e-15;
      const sciValue20e12: number = 2.0e-12;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array([sciValue10e10, sciValue50e15, sciValue20e12, zeroPointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(zeroPointZero);
      expect(sorted[1]).assertEqual(sciValue50e15);
      expect(sorted[2]).assertEqual(sciValue20e12);
      expect(sorted[3]).assertEqual(sciValue10e10);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_1800
     * @tc.name testFloat64ArrayToSorted018
     * @tc.desc Verify sorting correctly with extremely large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e100: number = 1.0e+100;
      const sciValue50e50: number = 5.0e+50;
      const sciValue20e75: number = 2.0e+75;
      const sciValue10e25: number = 1.0e+25;
      const arr = new Float64Array([sciValue10e100, sciValue50e50, sciValue20e75, sciValue10e25]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(sciValue10e25);
      expect(sorted[1]).assertEqual(sciValue50e50);
      expect(sorted[2]).assertEqual(sciValue20e75);
      expect(sorted[3]).assertEqual(sciValue10e100);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_1900
     * @tc.name testFloat64ArrayToSorted019
     * @tc.desc Verify sorting correctly with mixed positive and negative large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negsciValue10e50: number = -1.0e+50;
      const sciValue10e50: number = 1.0e+50;
      const negsciValue50e25: number = -5.0e+25;
      const sciValue50e25: number = 5.0e+25;
      const arr = new Float64Array([negsciValue10e50, sciValue10e50, negsciValue50e25, sciValue50e25]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(negsciValue10e50);
      expect(sorted[1]).assertEqual(negsciValue50e25);
      expect(sorted[2]).assertEqual(sciValue50e25);
      expect(sorted[3]).assertEqual(sciValue10e50);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_2000
     * @tc.name testFloat64ArrayToSorted020
     * @tc.desc Verify empty array returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array();
      const sorted = arr.toSorted();
      const expectVal = zeroValue;
      expect(sorted.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_2100
     * @tc.name testFloat64ArrayToSorted021
     * @tc.desc Verify empty array returns new instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      const sorted = arr.toSorted();
      const expectVal = true;
      expect(sorted !== arr).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_2200
     * @tc.name testFloat64ArrayToSorted022
     * @tc.desc Verify empty array returns different buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      const sorted = arr.toSorted();
      const expectVal = true;
      expect(sorted.buffer !== arr.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_2300
     * @tc.name testFloat64ArrayToSorted023
     * @tc.desc Verify single positive element returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const oneValue: number = 1;
      const arr = new Float64Array([fillValue42]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(oneValue);
      expect(sorted[0]).assertEqual(fillValue42);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_2400
     * @tc.name testFloat64ArrayToSorted024
     * @tc.desc Verify single negative element returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negfortytwoPointzero: number = -42.0;
      const arr = new Float64Array([negfortytwoPointzero]);
      const sorted = arr.toSorted();
      const expectVal = negfortytwoPointzero;
      expect(sorted[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_2500
     * @tc.name testFloat64ArrayToSorted025
     * @tc.desc Verify single zero element returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array([zeroPointZero]);
      const sorted = arr.toSorted();
      const expectVal = zeroPointZero;
      expect(sorted[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_2600
     * @tc.name testFloat64ArrayToSorted026
     * @tc.desc Verify two sorted elements return same order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = new Float64Array([onePointZero, twoPointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(onePointZero);
      expect(sorted[1]).assertEqual(twoPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_2700
     * @tc.name testFloat64ArrayToSorted027
     * @tc.desc Verify two reverse-ordered elements return swapped order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const onePointZero: number = 1.0;
      const arr = new Float64Array([twoPointZero, onePointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(onePointZero);
      expect(sorted[1]).assertEqual(twoPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_2800
     * @tc.name testFloat64ArrayToSorted028
     * @tc.desc Verify two identical elements return same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const arr = new Float64Array([fivePointZero, fivePointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(fivePointZero);
      expect(sorted[1]).assertEqual(fivePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_2900
     * @tc.name testFloat64ArrayToSorted029
     * @tc.desc Verify sorting correctly with Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const onePointZero: number = 1.0;
      const negativeInfinity: number = -Infinity;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array([positiveInfinity, onePointZero, negativeInfinity, zeroPointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(negativeInfinity);
      expect(sorted[1]).assertEqual(zeroPointZero);
      expect(sorted[2]).assertEqual(onePointZero);
      expect(sorted[3]).assertEqual(positiveInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_3000
     * @tc.name testFloat64ArrayToSorted030
     * @tc.desc Verify sorting correctly with multiple Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const onePointZero: number = 1.0;
      const negativeInfinity: number = -Infinity;
      const arr = new Float64Array([positiveInfinity, positiveInfinity, onePointZero, negativeInfinity]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(negativeInfinity);
      expect(sorted[1]).assertEqual(onePointZero);
      expect(sorted[2]).assertEqual(positiveInfinity);
      expect(sorted[3]).assertEqual(positiveInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_3100
     * @tc.name testFloat64ArrayToSorted031
     * @tc.desc Verify sorting with NaN puts NaN at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const threePointZero: number = 3.0;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = new Float64Array([nanValue, threePointZero, onePointZero, twoPointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(onePointZero);
      expect(sorted[1]).assertEqual(twoPointZero);
      expect(sorted[2]).assertEqual(threePointZero);
      const actVal1 = Number.isNaN(sorted[3]);
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_3200
     * @tc.name testFloat64ArrayToSorted032
     * @tc.desc Verify sorting with multiple NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const twoPointZero: number = 2.0;
      const onePointZero: number = 1.0;
      const arr = new Float64Array([nanValue, nanValue, twoPointZero, onePointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(onePointZero);
      expect(sorted[1]).assertEqual(twoPointZero);
      const actVal2 = Number.isNaN(sorted[2]);
      const expectVal = true;
      expect(actVal2).assertEqual(expectVal);
      const actVal3 = Number.isNaN(sorted[3]);
      const expectVal2 = true;
      expect(actVal3).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_3300
     * @tc.name testFloat64ArrayToSorted033
     * @tc.desc Verify sorting with only NaN returns same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = new Float64Array([nanValue]);
      const sorted = arr.toSorted();
      const actVal4 = Number.isNaN(sorted[0]);
      const expectVal = true;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_3400
     * @tc.name testFloat64ArrayToSorted034
     * @tc.desc Verify sorting with only Infinity returns same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = new Float64Array([positiveInfinity]);
      const sorted = arr.toSorted();
      const expectVal = positiveInfinity;
      expect(sorted[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_3500
     * @tc.name testFloat64ArrayToSorted035
     * @tc.desc Verify sorting with only -Infinity returns same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = new Float64Array([negativeInfinity]);
      const sorted = arr.toSorted();
      const expectVal = negativeInfinity;
      expect(sorted[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_3600
     * @tc.name testFloat64ArrayToSorted036
     * @tc.desc Verify sorting with positive and negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const negativeZero: number = -0.0;
      const onePointZero: number = 1.0;
      const negonePointzero: number = -1.0;
      const arr = new Float64Array([+zeroPointZero, negativeZero, onePointZero, negonePointzero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(negonePointzero);
      expect(sorted[1]).assertEqual(negativeZero);
      expect(sorted[2]).assertEqual(+zeroPointZero);
      expect(sorted[3]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_3700
     * @tc.name testFloat64ArrayToSorted037
     * @tc.desc Verify sorting with Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const onePointZero: number = 1.0;
      const pointFive: number = 0.5;
      const arr = new Float64Array([doubleMaxValue, onePointZero, pointFive]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(pointFive);
      expect(sorted[1]).assertEqual(onePointZero);
      expect(sorted[2]).assertEqual(doubleMaxValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_3800
     * @tc.name testFloat64ArrayToSorted038
     * @tc.desc Verify sorting with Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue50e324: number = 5.0e-324;
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array([sciValue50e324, onePointZero, zeroPointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(zeroPointZero);
      expect(sorted[1]).assertEqual(sciValue50e324);
      expect(sorted[2]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_3900
     * @tc.name testFloat64ArrayToSorted039
     * @tc.desc Verify sorting with mixed MAX_VALUE and MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const sciValue50e324: number = 5.0e-324;
      const negsciValue17976931348623157e308: number = -1.7976931348623157e+308;
      const arr = new Float64Array([doubleMaxValue, sciValue50e324, negsciValue17976931348623157e308]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(negsciValue17976931348623157e308);
      expect(sorted[1]).assertEqual(sciValue50e324);
      expect(sorted[2]).assertEqual(doubleMaxValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_4000
     * @tc.name testFloat64ArrayToSorted040
     * @tc.desc Verify original array can call toSorted again after first call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const onePointZero: number = 1.0;
      const arr = new Float64Array([threePointZero, onePointZero, 2.0]);
      const sorted1 = arr.toSorted();
      const sorted2 = arr.toSorted();
      expect(sorted1[0]).assertEqual(onePointZero);
      expect(sorted2[0]).assertEqual(onePointZero);
      expect(arr[0]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_4100
     * @tc.name testFloat64ArrayToSorted041
     * @tc.desc Verify consecutive toSorted calls return different new arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array([2.0, onePointZero]);
      const s1 = arr.toSorted();
      const s2 = arr.toSorted();
      expect(s1 !== s2).assertTrue();
      expect(s1[0]).assertEqual(onePointZero);
      expect(s2[0]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_4200
     * @tc.name testFloat64ArrayToSorted042
     * @tc.desc Verify modifying return value does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const num999Pointzero: number = 999.0;
      const arr = new Float64Array([threePointZero, 1.0, 2.0]);
      const sorted = arr.toSorted();
      sorted[0] = 999.0;
      expect(arr[0]).assertEqual(threePointZero);
      expect(sorted[0]).assertEqual(num999Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_4300
     * @tc.name testFloat64ArrayToSorted043
     * @tc.desc Verify original array can be modified after toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const num999Pointzero: number = 999.0;
      const arr = new Float64Array([3.0, onePointZero, 2.0]);
      const sorted = arr.toSorted();
      arr[0] = 999.0;
      expect(arr[0]).assertEqual(num999Pointzero);
      expect(sorted[0]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_4400
     * @tc.name testFloat64ArrayToSorted044
     * @tc.desc Verify toSorted orders unordered elements ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const twoPointZero: number = 2.0;
      const eightPointZero: number = 8.0;
      const onePointZero: number = 1.0;
      const arr1 = new Float64Array([fivePointZero, twoPointZero, eightPointZero, onePointZero]);
      const sorted = arr1.toSorted();
      expect(sorted[0]).assertEqual(onePointZero);
      expect(sorted[1]).assertEqual(twoPointZero);
      expect(sorted[2]).assertEqual(fivePointZero);
      expect(sorted[3]).assertEqual(eightPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_4500
     * @tc.name testFloat64ArrayToSorted045
     * @tc.desc Verify toSorted orders negative numbers ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negfivePointzero: number = -5.0;
      const tenPointZero: number = 10.0;
      const negonePointzero: number = -1.0;
      const zeroPointZero: number = 0.0;
      const arr1 = new Float64Array([negfivePointzero, tenPointZero, negonePointzero, zeroPointZero]);
      const sorted = arr1.toSorted();
      expect(sorted[0]).assertEqual(negfivePointzero);
      expect(sorted[1]).assertEqual(negonePointzero);
      expect(sorted[2]).assertEqual(zeroPointZero);
      expect(sorted[3]).assertEqual(tenPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_4600
     * @tc.name testFloat64ArrayToSorted046
     * @tc.desc Verify toSorted orders decimal elements ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const twoPointsevenone: number = 2.71;
      const onePointfourone: number = 1.41;
      const arr1 = new Float64Array([piApprox, twoPointsevenone, onePointfourone]);
      const sorted = arr1.toSorted();
      expect(sorted[0]).assertEqual(onePointfourone);
      expect(sorted[1]).assertEqual(twoPointsevenone);
      expect(sorted[2]).assertEqual(piApprox);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_4700
     * @tc.name testFloat64ArrayToSorted047
     * @tc.desc Verify toSorted orders Infinity values ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const zeroPointZero: number = 0.0;
      const arr1 = new Float64Array([positiveInfinity, negativeInfinity, zeroPointZero]);
      const sorted = arr1.toSorted();
      expect(sorted[0]).assertEqual(negativeInfinity);
      expect(sorted[1]).assertEqual(zeroPointZero);
      expect(sorted[2]).assertEqual(positiveInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_4800
     * @tc.name testFloat64ArrayToSorted048
     * @tc.desc Verify toSorted preserves already sorted order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr1 = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const sorted = arr1.toSorted();
      expect(sorted[0]).assertEqual(onePointZero);
      expect(sorted[1]).assertEqual(twoPointZero);
      expect(sorted[2]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_4900
     * @tc.name testFloat64ArrayToSorted049
     * @tc.desc Verify toSorted orders reverse input ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const twoPointZero: number = 2.0;
      const onePointZero: number = 1.0;
      const arr1 = new Float64Array([threePointZero, twoPointZero, onePointZero]);
      const sorted = arr1.toSorted();
      expect(sorted[0]).assertEqual(onePointZero);
      expect(sorted[1]).assertEqual(twoPointZero);
      expect(sorted[2]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_5000
     * @tc.name testFloat64ArrayToSorted050
     * @tc.desc Verify toSorted puts NaN after ordered numeric elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const twoPointZero: number = 2.0;
      const onePointZero: number = 1.0;
      const arr1 = new Float64Array([nanValue, twoPointZero, onePointZero]);
      const sorted = arr1.toSorted();
      expect(sorted[0]).assertEqual(onePointZero);
      expect(sorted[1]).assertEqual(twoPointZero);
      const actVal5 = Number.isNaN(sorted[2]);
      const expectVal = true;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_5100
     * @tc.name testFloat64ArrayToSorted051
     * @tc.desc Verify sorting 10-element unordered array correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninePointZero: number = 9.0;
      const threePointZero: number = 3.0;
      const sevenPointZero: number = 7.0;
      const onePointZero: number = 1.0;
      const fivePointZero: number = 5.0;
      const twoPointZero: number = 2.0;
      const eightPointZero: number = 8.0;
      const fourPointZero: number = 4.0;
      const sixPointZero: number = 6.0;
      const zeroPointZero: number = 0.0;
      const arr =
        new Float64Array([ninePointZero, threePointZero, sevenPointZero, onePointZero, fivePointZero, twoPointZero,
          eightPointZero, fourPointZero, sixPointZero, zeroPointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(zeroPointZero);
      expect(sorted[1]).assertEqual(onePointZero);
      expect(sorted[2]).assertEqual(twoPointZero);
      expect(sorted[3]).assertEqual(threePointZero);
      expect(sorted[4]).assertEqual(fourPointZero);
      expect(sorted[5]).assertEqual(fivePointZero);
      expect(sorted[6]).assertEqual(sixPointZero);
      expect(sorted[7]).assertEqual(sevenPointZero);
      expect(sorted[8]).assertEqual(eightPointZero);
      expect(sorted[9]).assertEqual(ninePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_5200
     * @tc.name testFloat64ArrayToSorted052
     * @tc.desc Verify sorting 50-element ascending array remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr =
        new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0,
          18.0, 19.0, 20.0, 21.0, 22.0, 23.0, 24.0, 25.0, 26.0, 27.0, 28.0, 29.0, 30.0, 31.0, 32.0, 33.0, 34.0, 35.0,
          36.0, 37.0, 38.0, 39.0, 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0]);
      const sorted = arr.toSorted();
      for (let i: int = 0; i < 50; i++) {
        const expectVal = i + onePointZero;
        expect(sorted[i]).assertEqual(expectVal);
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_5300
     * @tc.name testFloat64ArrayToSorted053
     * @tc.desc Verify sorting 100 identical elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const values =
        [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
          1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
          1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
          1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
          1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0];
      const arr = new Float64Array(values);
      const sorted = arr.toSorted();
      for (let i: int = 0; i < 100; i++) {
        const expectVal = onePointZero;
        expect(sorted[i]).assertEqual(expectVal);
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_5400
     * @tc.name testFloat64ArrayToSorted054
     * @tc.desc Verify toSorted returns sorted element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = new Float64Array([threePointZero, onePointZero, twoPointZero]);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(onePointZero);
      expect(result[1]).assertEqual(twoPointZero);
      expect(result[2]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_5500
     * @tc.name testFloat64ArrayToSorted055
     * @tc.desc Verify chained call with $_get after toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array([3.0, onePointZero, 2.0]);
      const first = arr.toSorted().$_get(0);
      const expectVal = onePointZero;
      expect(first).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_5600
     * @tc.name testFloat64ArrayToSorted056
     * @tc.desc Verify toSorted middle elements after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const threePointZero: number = 3.0;
      const twoPointZero: number = 2.0;
      const twoValue: number = 2;
      const arr = new Float64Array([fivePointZero, threePointZero, 1.0, 4.0, twoPointZero]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(fivePointZero);
      expect(sorted[1]).assertEqual(twoPointZero);
      expect(sorted[2]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_5700
     * @tc.name testFloat64ArrayToSorted057
     * @tc.desc Verify chained call with forEach after toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixPointZero: number = 6.0;
      const arr = new Float64Array([3.0, 1.0, 2.0]);
      let sum = 0.0;
      arr.toSorted().forEach((val: number): void => {
        sum += val;
      })

      const expectVal = sixPointZero;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_5800
     * @tc.name testFloat64ArrayToSorted058
     * @tc.desc Verify toSorted preserves sorted order for mapped-equivalent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const sixPointZero: number = 6.0;
      const arr = new Float64Array([twoPointZero, fourPointZero, sixPointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(twoPointZero);
      expect(sorted[1]).assertEqual(fourPointZero);
      expect(sorted[2]).assertEqual(sixPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_5900
     * @tc.name testFloat64ArrayToSorted059
     * @tc.desc Verify toSorted orders values greater than two in source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const fivePointZero: number = 5.0;
      const threeValue: number = 3;
      const arr = new Float64Array([threePointZero, fourPointZero, fivePointZero]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(threeValue);
      expect(sorted[0]).assertEqual(threePointZero);
      expect(sorted[1]).assertEqual(fourPointZero);
      expect(sorted[2]).assertEqual(fivePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_6000
     * @tc.name testFloat64ArrayToSorted060
     * @tc.desc Verify toSorted orders first value greater than three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const fourPointZero: number = 4.0;
      const arr = new Float64Array([fivePointZero, 3.0, 1.0, fourPointZero, 2.0]);
      const sorted = arr.toSorted();
      expect(sorted[3]).assertEqual(fourPointZero);
      expect(sorted[4]).assertEqual(fivePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_6100
     * @tc.name testFloat64ArrayToSorted061
     * @tc.desc Verify toSorted keeps all positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = new Float64Array([onePointZero, twoPointZero, threePointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(onePointZero);
      expect(sorted[1]).assertEqual(twoPointZero);
      expect(sorted[2]).assertEqual(threePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_6200
     * @tc.name testFloat64ArrayToSorted062
     * @tc.desc Verify toSorted puts positive value after negatives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negthreePointzero: number = -3.0;
      const negonePointzero: number = -1.0;
      const twoPointZero: number = 2.0;
      const arr = new Float64Array([negthreePointzero, negonePointzero, twoPointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(negthreePointzero);
      expect(sorted[1]).assertEqual(negonePointzero);
      expect(sorted[2]).assertEqual(twoPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_6300
     * @tc.name testFloat64ArrayToSorted063
     * @tc.desc Verify sorting with int boundary value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num2147483647Pointzero: number = 2147483647.0;
      const onePointZero: number = 1.0;
      const negnum2147483648Pointzero: number = -2147483648.0;
      const arr = new Float64Array([num2147483647Pointzero, onePointZero, negnum2147483648Pointzero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(negnum2147483648Pointzero);
      expect(sorted[1]).assertEqual(onePointZero);
      expect(sorted[2]).assertEqual(num2147483647Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_6400
     * @tc.name testFloat64ArrayToSorted064
     * @tc.desc Verify sorting with Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const onePointZero: number = 1.0;
      const negativeMaxSafeIntegerValue: number = -9007199254740991.0;
      const arr = new Float64Array([maxSafeIntegerValue, onePointZero, negativeMaxSafeIntegerValue]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(negativeMaxSafeIntegerValue);
      expect(sorted[1]).assertEqual(onePointZero);
      expect(sorted[2]).assertEqual(maxSafeIntegerValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_6500
     * @tc.name testFloat64ArrayToSorted065
     * @tc.desc Verify sorting with mixed scientific notation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e50: number = 1.0e+50;
      const sciValue20e50: number = 2.0e-50;
      const sciValue30e25: number = 3.0e+25;
      const sciValue40e25: number = 4.0e-25;
      const arr = new Float64Array([sciValue10e50, sciValue20e50, sciValue30e25, sciValue40e25]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(sciValue20e50);
      expect(sorted[1]).assertEqual(sciValue40e25);
      expect(sorted[2]).assertEqual(sciValue30e25);
      expect(sorted[3]).assertEqual(sciValue10e50);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_6600
     * @tc.name testFloat64ArrayToSorted066
     * @tc.desc Verify sorting with hexadecimal literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const hexValue1: number = 0x1;
      const hexValueFF: number = 0xFF;
      const hexValue0: number = 0x0;
      const zeroPointZero: number = 0.0;
      const onePointZero: number = 1.0;
      const sixteenPointzero: number = 16.0;
      const num255Pointzero: number = 255.0;
      const arr = new Float64Array([hexValue10, hexValue1, hexValueFF, hexValue0]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(zeroPointZero);
      expect(sorted[1]).assertEqual(onePointZero);
      expect(sorted[2]).assertEqual(sixteenPointzero);
      expect(sorted[3]).assertEqual(num255Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_6700
     * @tc.name testFloat64ArrayToSorted067
     * @tc.desc Verify sorting with octal literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const onePointZero: number = 1.0;
      const eightPointZero: number = 8.0;
      const sixtythreePointzero: number = 63.0;
      const arr = new Float64Array([0o10, 0o1, 0o77, 0o0]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(zeroPointZero);
      expect(sorted[1]).assertEqual(onePointZero);
      expect(sorted[2]).assertEqual(eightPointZero);
      expect(sorted[3]).assertEqual(sixtythreePointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_6800
     * @tc.name testFloat64ArrayToSorted068
     * @tc.desc Verify sorting with binary literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1000: number = 0b1000;
      const binaryValue1: number = 0b1;
      const binaryValue1111: number = 0b1111;
      const binaryValue0: number = 0b0;
      const zeroPointZero: number = 0.0;
      const onePointZero: number = 1.0;
      const eightPointZero: number = 8.0;
      const fifteenPointzero: number = 15.0;
      const arr = new Float64Array([binaryValue1000, binaryValue1, binaryValue1111, binaryValue0]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(zeroPointZero);
      expect(sorted[1]).assertEqual(onePointZero);
      expect(sorted[2]).assertEqual(eightPointZero);
      expect(sorted[3]).assertEqual(fifteenPointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_6900
     * @tc.name testFloat64ArrayToSorted069
     * @tc.desc Verify sorting distinguishes negative zero and positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array([negativeZero, +zeroPointZero]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(negativeZero);
      expect(sorted[1]).assertEqual(+zeroPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_7000
     * @tc.name testFloat64ArrayToSorted070
     * @tc.desc Verify sorting with overflow boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const sciValue17976931348623156e308: number = 1.7976931348623156e+308;
      const arr = new Float64Array([doubleMaxValue, sciValue17976931348623156e308]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(sciValue17976931348623156e308);
      expect(sorted[1]).assertEqual(doubleMaxValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_7100
     * @tc.name testFloat64ArrayToSorted071
     * @tc.desc Verify sorting with precision critical value 0.1+0.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointThree: number = 0.3;
      const pointOne: number = 0.1;
      const pointTwo: number = 0.2;
      const precisionSumValue: number =
        0.30000000000000004;
      const arr = new Float64Array([pointThree, pointOne + pointTwo, pointTwo, pointOne]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(pointOne);
      expect(sorted[1]).assertEqual(pointTwo);
      expect(sorted[2]).assertEqual(pointThree);
      expect(sorted[3]).assertEqual(precisionSumValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_7200
     * @tc.name testFloat64ArrayToSorted072
     * @tc.desc Verify sorting with extremely small positive number 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue50e324: number = 5.0e-324;
      const zeroPointZero: number = 0.0;
      const sciValue10e323: number = 1.0e-323;
      const arr = new Float64Array([sciValue50e324, zeroPointZero, sciValue10e323]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(zeroPointZero);
      expect(sorted[1]).assertEqual(sciValue50e324);
      expect(sorted[2]).assertEqual(sciValue10e323);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_7300
     * @tc.name testFloat64ArrayToSorted073
     * @tc.desc Verify toSorted returns new instance, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = new Float64Array([int32MinValue, -1, zeroValue]);
      const sorted = arr.toSorted();
      expect(arr[0]).assertEqual(int32MinValue);
      expect(sorted[0]).assertEqual(int32MinValue);
      expect(sorted[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_7400
     * @tc.name testFloat64ArrayToSorted074
     * @tc.desc Verify toSorted with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const hexValue55: number = 0x55;
      const fillValue85: number = 85.0;
      const num255Value: number = 255;
      const arr = new Float64Array([hexValueFF, hexValueAA, hexValue55]);
      const s = arr.toSorted();
      expect(s[0]).assertEqual(fillValue85);
      expect(s[2]).assertEqual(num255Value);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_7500
     * @tc.name testFloat64ArrayToSorted075
     * @tc.desc Verify toSorted with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const binaryValue01010101: number = 0b01010101;
      const fillValue85: number = 85.0;
      const num255Value: number = 255;
      const arr = new Float64Array([binaryValue11111111, binaryValue10101010, binaryValue01010101]);
      const s = arr.toSorted();
      expect(s[0]).assertEqual(fillValue85);
      expect(s[2]).assertEqual(num255Value);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_7600
     * @tc.name testFloat64ArrayToSorted076
     * @tc.desc Verify tosorted with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const doubleMaxValue2: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(doubleMaxValue2);
      const actVal6 = Number.isNaN(sorted[1]);
      const expectVal = true;
      expect(actVal6).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_7700
     * @tc.name testFloat64ArrayToSorted077
     * @tc.desc Verify tosorted with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(negativeInfinity);
      expect(sorted[1]).assertEqual(positiveInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_7800
     * @tc.name testFloat64ArrayToSorted078
     * @tc.desc Verify toSorted on offset view sorts only visible elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new ArrayBuffer(40);
      const p = new Float64Array(b);
      p.$_set(0, 100.0);
      p.$_set(1, 3.0);
      p.$_set(2, 1.0);
      p.$_set(3, 2.0);
      p.$_set(4, 200.0);
      const s = new Float64Array(b, 8, 3).toSorted();
      const actVal7 = s.toString();
      const expectVal = "1,2,3";
      expect(actVal7).assertEqual(expectVal);
      const actVal8 = p.$_get(0);
      const expectVal2 = 100.0;
      expect(actVal8).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_7900
     * @tc.name testFloat64ArrayToSorted079
     * @tc.desc Verify toSorted from offset view returns zero byteOffset copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new ArrayBuffer(32);
      const v = new Float64Array(b, 8, 2);
      v.$_set(0, 4.0);
      v.$_set(1, 1.0);
      const s = v.toSorted();
      expect(s.byteOffset).assertEqual(0);
      expect(s.length).assertEqual(2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_8000
     * @tc.name testFloat64ArrayToSorted080
     * @tc.desc Verify toSorted result mutation does not change source view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(3.0, 1.0, 2.0);
      const s = a.toSorted();
      s.$_set(0, 99.0);
      const actVal9 = a.$_get(0);
      const expectVal = 3.0;
      expect(actVal9).assertEqual(expectVal);
      const actVal10 = s.$_get(0);
      const expectVal2 = 99.0;
      expect(actVal10).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_8100
     * @tc.name testFloat64ArrayToSorted081
     * @tc.desc Verify toSorted result is stable after source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(3.0, 1.0, 2.0);
      const s = a.toSorted();
      a.$_set(1, 100.0);
      const actVal11 = s.toString();
      const expectVal = "1,2,3";
      expect(actVal11).assertEqual(expectVal);
      const actVal12 = a.$_get(1);
      const expectVal2 = 100.0;
      expect(actVal12).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_8200
     * @tc.name testFloat64ArrayToSorted082
     * @tc.desc Verify toSorted preserves duplicate values in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Float64Array([2.0, 1.0, 2.0, 1.0]).toSorted();
      const actVal13 = s.toString();
      const expectVal = "1,1,2,2";
      expect(actVal13).assertEqual(expectVal);
      expect(s.length).assertEqual(4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_8300
     * @tc.name testFloat64ArrayToSorted083
     * @tc.desc Verify toSorted orders negative and positive subnormal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = Float64Array.of(Double.MIN_VALUE, -Double.MIN_VALUE, 0.0).toSorted();
      const actVal14 = s.$_get(0);
      const expectVal = -Double.MIN_VALUE;
      expect(actVal14).assertEqual(expectVal);
      const actVal15 = s.$_get(1);
      const expectVal2 = 0.0;
      expect(actVal15).assertEqual(expectVal2);
      const actVal16 = s.$_get(2);
      const expectVal3 = Double.MIN_VALUE;
      expect(actVal16).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_8400
     * @tc.name testFloat64ArrayToSorted084
     * @tc.desc Verify toSorted orders max min and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Float64Array([Double.MAX_VALUE, 0.0, -Double.MAX_VALUE]).toSorted();
      const actVal17 = s.$_get(0);
      const expectVal = -Double.MAX_VALUE;
      expect(actVal17).assertEqual(expectVal);
      const actVal18 = s.$_get(1);
      const expectVal2 = 0.0;
      expect(actVal18).assertEqual(expectVal2);
      const actVal19 = s.$_get(2);
      const expectVal3 = Double.MAX_VALUE;
      expect(actVal19).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_8500
     * @tc.name testFloat64ArrayToSorted085
     * @tc.desc Verify toSorted on reverse ordered input keeps original reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(4.0, 3.0, 2.0, 1.0);
      const s = a.toSorted();
      const actVal20 = s.toString();
      const expectVal = "1,2,3,4";
      expect(actVal20).assertEqual(expectVal);
      const actVal21 = a.toString();
      const expectVal2 = "4,3,2,1";
      expect(actVal21).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_8600
     * @tc.name testFloat64ArrayToSorted086
     * @tc.desc Verify toSorted on single element returns same value in independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(7.0);
      const s = a.toSorted();
      s.$_set(0, 70.0);
      const actVal22 = a.$_get(0);
      const expectVal = 7.0;
      expect(actVal22).assertEqual(expectVal);
      const actVal23 = s.$_get(0);
      const expectVal2 = 70.0;
      expect(actVal23).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_8700
     * @tc.name testFloat64ArrayToSorted087
     * @tc.desc Verify toSorted on empty array returns empty copy metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Float64Array(0).toSorted();
      expect(s.length).assertEqual(0);
      expect(s.byteLength).assertEqual(0);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_8800
     * @tc.name testFloat64ArrayToSorted088
     * @tc.desc Verify toSorted after fill keeps repeated filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array(3);
      a.fill(6.0);
      const s = a.toSorted();
      const actVal24 = s.toString();
      const expectVal = "6,6,6";
      expect(actVal24).assertEqual(expectVal);
      const actVal25 = a.toString();
      const expectVal2 = "6,6,6";
      expect(actVal25).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSORTED_8900
     * @tc.name testFloat64ArrayToSorted089
     * @tc.desc Verify toSorted on offset view does not rewrite parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToSorted089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new ArrayBuffer(32);
      const p = new Float64Array(b);
      p.$_set(0, 9.0);
      p.$_set(1, 4.0);
      p.$_set(2, 1.0);
      p.$_set(3, 8.0);
      const s = new Float64Array(b, 8, 2).toSorted();
      const actVal26 = s.toString();
      const expectVal = "1,4";
      expect(actVal26).assertEqual(expectVal);
      const actVal27 = p.toString();
      const expectVal2 = "9,4,1,8";
      expect(actVal27).assertEqual(expectVal2);
    })

  })
}
