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

export default function float64ArrayLastIndexOf2Test(): void {
  describe('Float64ArrayLastIndexOf2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_0100
     * @tc.name testFloat64ArrayLastIndexOf2001
     * @tc.desc Verify lastIndexOf with interval repeated elements fromIndex=0 finds first occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-1e-100, 9007199254740991, -1e-100, 3.141592653589793, -1e-100);
      const idx = arr.lastIndexOf(1.0, 0);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(-1e-100, 0);
      const expectVal2 = 0;
      expect(idxFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_0200
     * @tc.name testFloat64ArrayLastIndexOf2002
     * @tc.desc Verify lastIndexOf with interval repeated elements fromIndex=2 finds last occurrence within range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.0625, 1.5, 0.0625, 0.125, 0.0625);
      const idx = arr.lastIndexOf(1.0, 2);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxDup2 = arr.lastIndexOf(0.0625, 2);
      const expectVal2 = 2;
      expect(idxDup2).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_0300
     * @tc.name testFloat64ArrayLastIndexOf2003
     * @tc.desc Verify lastIndexOf with interval repeated elements fromIndex=4 finds last occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(32767, -128, 32767, 127, 32767);
      const idx = arr.lastIndexOf(1.0, 4);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxLast = arr.lastIndexOf(32767, 4);
      const expectVal2 = 4;
      expect(idxLast).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_0400
     * @tc.name testFloat64ArrayLastIndexOf2004
     * @tc.desc Verify lastIndexOf with interval repeated elements fromIndex=3 finds last within range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([2147483647, -1, 2147483647, 1, 2147483647, -2, -3]);
      const idx = arr.lastIndexOf(1.0, 3);
      const expectVal = 3;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_0500
     * @tc.name testFloat64ArrayLastIndexOf2005
     * @tc.desc Verify lastIndexOf with interval repeated elements fromIndex=1 skips later occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0001, 0.5, 1.0001, 0.25, 1.0001]);
      const idx = arr.lastIndexOf(2.0, 1);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxEarly = arr.lastIndexOf(1.0001, 1);
      const expectVal2 = 0;
      expect(idxEarly).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_0600
     * @tc.name testFloat64ArrayLastIndexOf2006
     * @tc.desc Verify lastIndexOf with fromIndex=-5 skipping elements in 5-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 0.2, 0.3, 0.4, 0.5]);
      const idx = arr.lastIndexOf(2.0, -5);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxFirst = arr.lastIndexOf(0.1, -5);
      const expectVal2 = 0;
      expect(idxFirst).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_0700
     * @tc.name testFloat64ArrayLastIndexOf2007
     * @tc.desc Verify lastIndexOf with fromIndex=-6 out of bounds in 5-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 0.2, 0.3, 0.4, 0.5]);
      const idx = arr.lastIndexOf(1.0, -6);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_0800
     * @tc.name testFloat64ArrayLastIndexOf2008
     * @tc.desc Verify lastIndexOf with descending values finds correct rightmost index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(3.0, 2.0, 1.0, 0.0);
      const idx = arr.lastIndexOf(1.0);
      const expectVal = 2;
      expect(idx).assertEqual(expectVal);
      const idxZero = arr.lastIndexOf(0.0);
      const expectVal2 = 3;
      expect(idxZero).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_0900
     * @tc.name testFloat64ArrayLastIndexOf2009
     * @tc.desc Verify lastIndexOf with ascending values finds correct rightmost index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-1.0, 0.0, 1.0, 2.0, 3.0]);
      const idx = arr.lastIndexOf(2.0);
      const expectVal = 3;
      expect(idx).assertEqual(expectVal);
      const idxMax = arr.lastIndexOf(3.0);
      const expectVal2 = 4;
      expect(idxMax).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_1000
     * @tc.name testFloat64ArrayLastIndexOf2010
     * @tc.desc Verify lastIndexOf with fromIndex providing int typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.5, 1.0, 1.5, 2.0);
      let fromIdx: int = 2;
      const idx = arr.lastIndexOf(1.0, fromIdx);
      const expectVal = 1;
      expect(idx).assertEqual(expectVal);
      let searchNum: number = 2.0;
      const idxNum = arr.lastIndexOf(searchNum, fromIdx);
      const expectVal2 = -1;
      expect(idxNum).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_1100
     * @tc.name testFloat64ArrayLastIndexOf2011
     * @tc.desc Verify lastIndexOf with int typed searchElement and fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10, 20, 30, 40, 50);
      let searchInt: int = 30;
      let fromIdx: int = 4;
      const idx = arr.lastIndexOf(searchInt, fromIdx);
      const expectVal = 2;
      expect(idx).assertEqual(expectVal);
      let searchMiss: int = 100;
      const idxMiss = arr.lastIndexOf(searchMiss);
      const expectVal2 = -1;
      expect(idxMiss).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_1200
     * @tc.name testFloat64ArrayLastIndexOf2012
     * @tc.desc Verify lastIndexOf with number typed searchElement fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([3.14, 2.71, 1.41, 0.57]);
      let searchNum: number = 2.71;
      let fromIdx: int = 0;
      const idx = arr.lastIndexOf(searchNum, fromIdx);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      let searchFirst: number = 3.14;
      const idxFirst = arr.lastIndexOf(searchFirst, fromIdx);
      const expectVal2 = 0;
      expect(idxFirst).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_1300
     * @tc.name testFloat64ArrayLastIndexOf2013
     * @tc.desc Verify lastIndexOf with fromIndex=-2 searches backward correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-3.0, -2.0, -1.0, 0.0]);
      const idx = arr.lastIndexOf(2.0, -2);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(-1.0, -2);
      const expectVal2 = 2;
      expect(idxFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_1400
     * @tc.name testFloat64ArrayLastIndexOf2014
     * @tc.desc Verify lastIndexOf with fromIndex=-1 finds last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.0, -999.99, 123.456]);
      const idx = arr.lastIndexOf(999.0, -1);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxLast = arr.lastIndexOf(123.456, -1);
      const expectVal2 = 2;
      expect(idxLast).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_1500
     * @tc.name testFloat64ArrayLastIndexOf2015
     * @tc.desc Verify lastIndexOf with fromIndex large positive searches from end for matching value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const idx = arr.lastIndexOf(2.0, 10);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(2147483647, 10);
      const expectVal2 = 4;
      expect(idxFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_1600
     * @tc.name testFloat64ArrayLastIndexOf2016
     * @tc.desc Verify lastIndexOf with fromIndex=1 in 2-element array finds first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991]);
      const idx = arr.lastIndexOf(1.0, 1);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxFirst = arr.lastIndexOf(0.1, 1);
      const expectVal2 = 0;
      expect(idxFirst).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_1700
     * @tc.name testFloat64ArrayLastIndexOf2017
     * @tc.desc Verify lastIndexOf with fromIndex=0 finds only element at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const idx = arr.lastIndexOf(2.0, 0);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxFirst = arr.lastIndexOf(0.5, 0);
      const expectVal2 = 0;
      expect(idxFirst).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_1800
     * @tc.name testFloat64ArrayLastIndexOf2018
     * @tc.desc Verify lastIndexOf on 2-element array with both params int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-32768, -128);
      const idx = arr.lastIndexOf(2.0);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(-128);
      const expectVal2 = 1;
      expect(idxFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_1900
     * @tc.name testFloat64ArrayLastIndexOf2019
     * @tc.desc Verify lastIndexOf with all negative values finds rightmost
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-1.1, -2.2, -3.3, -2.2, -1.1);
      const idx = arr.lastIndexOf(1.0);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxNeg = arr.lastIndexOf(-2.2);
      const expectVal2 = 3;
      expect(idxNeg).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_2000
     * @tc.name testFloat64ArrayLastIndexOf2020
     * @tc.desc Verify lastIndexOf with alternating positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-1.0, 2.0, -3.0, 4.0, -5.0);
      const idx = arr.lastIndexOf(0.0);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxPos = arr.lastIndexOf(4.0);
      const expectVal2 = 3;
      expect(idxPos).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_2100
     * @tc.name testFloat64ArrayLastIndexOf2021
     * @tc.desc Verify lastIndexOf with large and small mixed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0e+100, -1.0e-100, 1.0e+100, -1.0e-100);
      const idx = arr.lastIndexOf(0.0);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxLarge = arr.lastIndexOf(1.0e+100);
      const expectVal2 = 2;
      expect(idxLarge).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_2200
     * @tc.name testFloat64ArrayLastIndexOf2022
     * @tc.desc Verify lastIndexOf with Infinity in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.0, Infinity, -Infinity, 0.0);
      const idx = arr.lastIndexOf(Infinity);
      const expectVal = 1;
      expect(idx).assertEqual(expectVal);
      const idxNInf = arr.lastIndexOf(-Infinity);
      const expectVal2 = 2;
      expect(idxNInf).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_2300
     * @tc.name testFloat64ArrayLastIndexOf2023
     * @tc.desc Verify lastIndexOf with -0.0 and +0.0 in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-0.0, 1.0, 0.0, -1.0]);
      const idx = arr.lastIndexOf(2.0);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxPosZero = arr.lastIndexOf(0.0);
      const expectVal2 = 2;
      expect(idxPosZero).assertEqual(expectVal2);
      const idxNegZero = arr.lastIndexOf(-0.0);
      const expectVal3 = 2;
      expect(idxNegZero).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_2400
     * @tc.name testFloat64ArrayLastIndexOf2024
     * @tc.desc Verify lastIndexOf with fromIndex past length still searches entire array backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const idx = arr.lastIndexOf(2.0, 100);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(0, 100);
      const expectVal2 = 2;
      expect(idxFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_2500
     * @tc.name testFloat64ArrayLastIndexOf2025
     * @tc.desc Verify lastIndexOf with searchElement as large positive float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0e+50, 3.0, 2.0e+50, 5.0);
      const idx = arr.lastIndexOf(2.0);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxLarge = arr.lastIndexOf(2.0e+50);
      const expectVal2 = 3;
      expect(idxLarge).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_2600
     * @tc.name testFloat64ArrayLastIndexOf2026
     * @tc.desc Verify lastIndexOf with searchElement as negative large float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-1.0, -2.0e+50, -3.0, -2.0e+50, -5.0]);
      const idx = arr.lastIndexOf(-2.0);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxLarge = arr.lastIndexOf(-2.0e+50);
      const expectVal2 = 3;
      expect(idxLarge).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_2700
     * @tc.name testFloat64ArrayLastIndexOf2027
     * @tc.desc Verify lastIndexOf handles duplicate MIN_VALUE in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const idx = arr.lastIndexOf(5e-324);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_2800
     * @tc.name testFloat64ArrayLastIndexOf2028
     * @tc.desc Verify lastIndexOf with fromIndex=1 finds last occurrence in 3-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0, 0, 0]);
      const idx = arr.lastIndexOf(2.0, 1);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(0, 1);
      const expectVal2 = 1;
      expect(idxFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_2900
     * @tc.name testFloat64ArrayLastIndexOf2029
     * @tc.desc Verify lastIndexOf with large array containing only one matching value at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(500);
      for (let i: int = 0; i < 499; i = i + 1) {
        arr.$_set(i, 0.0);
      }
      arr.$_set(499, 42.0);
      const idx = arr.lastIndexOf(42.0);
      const expectVal = 499;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_3000
     * @tc.name testFloat64ArrayLastIndexOf2030
     * @tc.desc Verify lastIndexOf with large array with only one match at beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(500);
      arr.$_set(0, 99.0);
      for (let i: int = 1; i < 500; i = i + 1) {
        arr.$_set(i, 0.0);
      }
      const idx = arr.lastIndexOf(99.0);
      const expectVal = 0;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_3100
     * @tc.name testFloat64ArrayLastIndexOf2031
     * @tc.desc Verify lastIndexOf with float precision 0.1+0.2 vs 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 0.2, 0.3, 0.4]);
      const idx = arr.lastIndexOf(0.1 + 0.2);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_3200
     * @tc.name testFloat64ArrayLastIndexOf2032
     * @tc.desc Verify lastIndexOf with 0.1+0.2 stored in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1 + 0.2, 1.0, 2.0]);
      const idx = arr.lastIndexOf(0.1 + 0.2);
      const expectVal = 0;
      expect(idx).assertEqual(expectVal);
      const idxNotFound = arr.lastIndexOf(0.3);
      const expectVal2 = -1;
      expect(idxNotFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_3300
     * @tc.name testFloat64ArrayLastIndexOf2033
     * @tc.desc Verify lastIndexOf with all same element in long array using fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1000);
      for (let i: int = 0; i < 1000; i = i + 1) {
        arr.$_set(i, 5.0);
      }
      const idx = arr.lastIndexOf(5.0, 0);
      const expectVal = 0;
      expect(idx).assertEqual(expectVal);
      const idxMid = arr.lastIndexOf(5.0, 500);
      const expectVal2 = 500;
      expect(idxMid).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_3400
     * @tc.name testFloat64ArrayLastIndexOf2034
     * @tc.desc Verify lastIndexOf with fromIndex=-200 in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1000);
      arr.$_set(100, 7.0);
      arr.$_set(800, 7.0);
      const idx = arr.lastIndexOf(7.0, -200);
      const expectVal = 800;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_3500
     * @tc.name testFloat64ArrayLastIndexOf2035
     * @tc.desc Verify lastIndexOf with fromIndex=-900 finds element at index 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1000);
      arr.$_set(100, 7.0);
      arr.$_set(800, 7.0);
      const idx = arr.lastIndexOf(7.0, -900);
      const expectVal = 100;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_3600
     * @tc.name testFloat64ArrayLastIndexOf2036
     * @tc.desc Verify lastIndexOf with fromIndex negative beyond length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(100);
      arr.$_set(50, 7.0);
      const idx = arr.lastIndexOf(7.0, -200);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_3700
     * @tc.name testFloat64ArrayLastIndexOf2037
     * @tc.desc Verify lastIndexOf with hex literal search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0xFF, 0xAA, 0xF0, 0xAA, 0x55);
      const idx = arr.lastIndexOf(0xAA);
      const expectVal = 3;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_3800
     * @tc.name testFloat64ArrayLastIndexOf2038
     * @tc.desc Verify lastIndexOf with binary literal search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0b11111111, 0b10101010, 0b01010101, 0b10101010]);
      const idx = arr.lastIndexOf(0b10101010);
      const expectVal = 3;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_3900
     * @tc.name testFloat64ArrayLastIndexOf2039
     * @tc.desc Verify lastIndexOf with mixed hex values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0x1A, 0x2B, 0x3C, 0x4D]);
      const idx = arr.lastIndexOf(2.0);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(0x3C);
      const expectVal2 = 2;
      expect(idxFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_4000
     * @tc.name testFloat64ArrayLastIndexOf2040
     * @tc.desc Verify lastIndexOf with Double.NaN and Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(Double.NaN, Double.POSITIVE_INFINITY);
      const idxNaN = arr.lastIndexOf(Double.NaN);
      const expectVal = -1;
      expect(idxNaN).assertEqual(expectVal);
      const idxInf = arr.lastIndexOf(Double.POSITIVE_INFINITY);
      const expectVal2 = 1;
      expect(idxInf).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_4100
     * @tc.name testFloat64ArrayLastIndexOf2041
     * @tc.desc Verify lastIndexOf with Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([Double.NEGATIVE_INFINITY, -0.0]);
      const idxNInf = arr.lastIndexOf(Double.NEGATIVE_INFINITY);
      const expectVal = 0;
      expect(idxNInf).assertEqual(expectVal);
      const idxNegZero = arr.lastIndexOf(-0.0);
      const expectVal2 = 1;
      expect(idxNegZero).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_4200
     * @tc.name testFloat64ArrayLastIndexOf2042
     * @tc.desc Verify lastIndexOf with Double.MIN_VALUE and Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([Double.MAX_VALUE, Double.MIN_VALUE, Double.MAX_VALUE]);
      const idxMax = arr.lastIndexOf(Double.MAX_VALUE);
      const expectVal = 2;
      expect(idxMax).assertEqual(expectVal);
      const idxMin = arr.lastIndexOf(Double.MIN_VALUE);
      const expectVal2 = 1;
      expect(idxMin).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_4300
     * @tc.name testFloat64ArrayLastIndexOf2043
     * @tc.desc Verify lastIndexOf with fromIndex=0 on multi-element finds only index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([3.14, 2.71, 3.14, 1.41]);
      const idx = arr.lastIndexOf(3.14, 0);
      const expectVal = 0;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_4400
     * @tc.name testFloat64ArrayLastIndexOf2044
     * @tc.desc Verify lastIndexOf with fromIndex=1 finds value at index 1 but not index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 3.14, 2.0, 3.14, 3.0]);
      const idx = arr.lastIndexOf(3.14, 1);
      const expectVal = 1;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_4500
     * @tc.name testFloat64ArrayLastIndexOf2045
     * @tc.desc Verify lastIndexOf with fromIndex=2 includes indices 0-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const idx = arr.lastIndexOf(2.0, 2);
      const expectVal = 1;
      expect(idx).assertEqual(expectVal);
      const idxNotFound = arr.lastIndexOf(4.0, 2);
      const expectVal2 = -1;
      expect(idxNotFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_4600
     * @tc.name testFloat64ArrayLastIndexOf2046
     * @tc.desc Verify lastIndexOf with fromIndex=3 finds value at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 2.0, 1.0]);
      const idx = arr.lastIndexOf(2.0, 3);
      const expectVal = 3;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_4700
     * @tc.name testFloat64ArrayLastIndexOf2047
     * @tc.desc Verify lastIndexOf with number type variable and fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 2.5, 3.5]);
      let searchNum: number = 2.5;
      let fromIdx: int = 2;
      const idx = arr.lastIndexOf(searchNum, fromIdx);
      const expectVal = 2;
      expect(idx).assertEqual(expectVal);
      let searchMiss: number = 5.0;
      const idxMiss = arr.lastIndexOf(searchMiss, fromIdx);
      const expectVal2 = -1;
      expect(idxMiss).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_4800
     * @tc.name testFloat64ArrayLastIndexOf2048
     * @tc.desc Verify lastIndexOf with negative fromIndex -3 on 5-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0, 30.0, 40.0, 50.0);
      const idx = arr.lastIndexOf(20.0, -3);
      const expectVal = 1;
      expect(idx).assertEqual(expectVal);
      const idxMid = arr.lastIndexOf(30.0, -3);
      const expectVal2 = 2;
      expect(idxMid).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_4900
     * @tc.name testFloat64ArrayLastIndexOf2049
     * @tc.desc Verify lastIndexOf with duplicate values in mixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.1, 2.2, 3.3, 2.2, 1.1, 0.0]);
      const idx = arr.lastIndexOf(2.2);
      const expectVal = 3;
      expect(idx).assertEqual(expectVal);
      const idxFirst = arr.lastIndexOf(1.1);
      const expectVal2 = 4;
      expect(idxFirst).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_5000
     * @tc.name testFloat64ArrayLastIndexOf2050
     * @tc.desc Verify lastIndexOf with fromIndex=-1 on 1-element array via int variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([42.0]);
      let searchInt: int = 42;
      let fromIdx: int = -1;
      const idx = arr.lastIndexOf(searchInt, fromIdx);
      const expectVal = 0;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_5100
     * @tc.name testFloat64ArrayLastIndexOf2051
     * @tc.desc Verify lastIndexOf with searchElement as number variable not in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      let searchNum: number = 999.99;
      const idx = arr.lastIndexOf(searchNum);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_5200
     * @tc.name testFloat64ArrayLastIndexOf2052
     * @tc.desc Verify lastIndexOf with fromIndex=2 using int variable search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-32768, -128, 0, 127);
      let searchInt: int = -128;
      let fromIdx: int = 3;
      const idx = arr.lastIndexOf(searchInt, fromIdx);
      const expectVal = 1;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_5300
     * @tc.name testFloat64ArrayLastIndexOf2053
     * @tc.desc Verify lastIndexOf with searchElement as number variable fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.5, 1.5, 0.25, 1.5);
      let searchNum: number = 1.5;
      let fromIdx: int = 0;
      const idx = arr.lastIndexOf(searchNum, fromIdx);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_5400
     * @tc.name testFloat64ArrayLastIndexOf2054
     * @tc.desc Verify lastIndexOf with fromIndex=1 finds value at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      let searchNum: number = -1;
      let fromIdx: int = 1;
      const idx = arr.lastIndexOf(searchNum, fromIdx);
      const expectVal = 1;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_5500
     * @tc.name testFloat64ArrayLastIndexOf2055
     * @tc.desc Verify lastIndexOf with fromIndex past length using int fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      let fromIdx: int = 100;
      const idx = arr.lastIndexOf(1.0, fromIdx);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      const idxFound = arr.lastIndexOf(0, fromIdx);
      const expectVal2 = 2;
      expect(idxFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_5600
     * @tc.name testFloat64ArrayLastIndexOf2056
     * @tc.desc Verify lastIndexOf with fromIndex negative beyond length via int variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      let fromIdx: int = -100;
      const idx = arr.lastIndexOf(1.0, fromIdx);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_5700
     * @tc.name testFloat64ArrayLastIndexOf2057
     * @tc.desc Verify lastIndexOf return value type for non-existent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const idx = arr.lastIndexOf(99.0);
      const expectVal = -1;
      expect(idx).assertEqual(expectVal);
      expect(typeof idx).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_5800
     * @tc.name testFloat64ArrayLastIndexOf2058
     * @tc.desc Verify lastIndexOf with multiple different duplicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0, 1, 0, 2, 0, 3, 0]);
      const idx = arr.lastIndexOf(0);
      const expectVal = 6;
      expect(idx).assertEqual(expectVal);
      const idxOne = arr.lastIndexOf(1);
      const expectVal2 = 1;
      expect(idxOne).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_5900
     * @tc.name testFloat64ArrayLastIndexOf2059
     * @tc.desc Verify lastIndexOf where all elements are distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([3.14, 2.71, 1.41, 0.57, -1.1]);
      const idx = arr.lastIndexOf(2.71);
      const expectVal = 1;
      expect(idx).assertEqual(expectVal);
      const idxNotFound = arr.lastIndexOf(9.99);
      const expectVal2 = -1;
      expect(idxNotFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_6000
     * @tc.name testFloat64ArrayLastIndexOf2060
     * @tc.desc Verify lastIndexOf on subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new Float64Array(6);
      buf.$_set(0, 1.0);
      buf.$_set(1, 2.0);
      buf.$_set(2, 3.0);
      buf.$_set(3, 2.0);
      buf.$_set(4, 3.0);
      buf.$_set(5, 4.0);
      const sub = buf.subarray(1, 4);
      const idx = sub.lastIndexOf(2.0);
      const expectVal = 2;
      expect(idx).assertEqual(expectVal);
      const idxNotFound = sub.lastIndexOf(4.0);
      const expectVal2 = -1;
      expect(idxNotFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_6100
     * @tc.name testFloat64ArrayLastIndexOf2061
     * @tc.desc Verify lastIndexOf with octal literal 0o10 search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(0o10, 0o20, 0o10);
      const idx = arr.lastIndexOf(0o10);
      const expectVal = 2;
      expect(idx).assertEqual(expectVal);
      const idxNotFound = arr.lastIndexOf(0o30);
      const expectVal2 = negativeOne;
      expect(idxNotFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_6200
     * @tc.name testFloat64ArrayLastIndexOf2062
     * @tc.desc Verify lastIndexOf does not mutate the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const threeValue: number = 3;
      const arr = Float64Array.of(1.0, twoPointZero, 3.0);
      const lenBefore: int = arr.length;
      arr.lastIndexOf(twoPointZero);
      expect(arr.length).assertEqual(lenBefore);
      expect(arr.length).assertEqual(threeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_6300
     * @tc.name testFloat64ArrayLastIndexOf2063
     * @tc.desc Verify lastIndexOf on empty array with fromIndex=0 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array(0);
      const idx = arr.lastIndexOf(onePointZero, 0);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_6400
     * @tc.name testFloat64ArrayLastIndexOf2064
     * @tc.desc Verify lastIndexOf on empty array with fromIndex=-1 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array(0);
      const idx = arr.lastIndexOf(onePointZero, -1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_6500
     * @tc.name testFloat64ArrayLastIndexOf2065
     * @tc.desc Verify lastIndexOf on empty array with fromIndex negative out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array(0);
      const idx = arr.lastIndexOf(onePointZero, -5);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_6600
     * @tc.name testFloat64ArrayLastIndexOf2066
     * @tc.desc Verify lastIndexOf on zero-initialized array searching non-zero returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array(5);
      const idx = arr.lastIndexOf(onePointZero);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_6700
     * @tc.name testFloat64ArrayLastIndexOf2067
     * @tc.desc Verify lastIndexOf on zero-initialized array with fromIndex=2 finds 0.0 at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = new Float64Array(5);
      const idx = arr.lastIndexOf(zeroPointZero, 2);
      const expectVal = twoValue;
      expect(idx).assertEqual(expectVal);
      const idxNotFound = arr.lastIndexOf(onePointZero, 2);
      const expectVal2 = negativeOne;
      expect(idxNotFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_6800
     * @tc.name testFloat64ArrayLastIndexOf2068
     * @tc.desc Verify lastIndexOf on zero-initialized array with fromIndex=-3 finds 0.0 at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const twoValue: number = 2;
      const arr = new Float64Array(5);
      const idx = arr.lastIndexOf(zeroPointZero, -3);
      const expectVal = twoValue;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_6900
     * @tc.name testFloat64ArrayLastIndexOf2069
     * @tc.desc Verify lastIndexOf on empty array with fromIndex=1 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeOne: number = -1;
      const arr = new Float64Array(0);
      const idx = arr.lastIndexOf(onePointZero, 1);
      const expectVal = negativeOne;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_7000
     * @tc.name testFloat64ArrayLastIndexOf2070
     * @tc.desc Verify lastIndexOf on 4-repeated elements with fromIndex=2 and -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const twoValue: number = 2;
      const arr = Float64Array.of(fivePointZero, fivePointZero, fivePointZero, fivePointZero);
      const idx = arr.lastIndexOf(fivePointZero, 2);
      const expectVal = twoValue;
      expect(idx).assertEqual(expectVal);
      const idxNeg = arr.lastIndexOf(fivePointZero, -2);
      const expectVal2 = twoValue;
      expect(idxNeg).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_7100
     * @tc.name testFloat64ArrayLastIndexOf2071
     * @tc.desc Verify lastIndexOf on 5-repeated elements with fromIndex=-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const twoValue: number = 2;
      const arr = Float64Array.of(sevenPointZero, sevenPointZero, sevenPointZero, sevenPointZero, sevenPointZero);
      const idx = arr.lastIndexOf(sevenPointZero, -3);
      const expectVal = twoValue;
      expect(idx).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_7200
     * @tc.name testFloat64ArrayLastIndexOf2072
     * @tc.desc Verify lastIndexOf in array with NaN and 0.0 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const threeValue: number = 3;
      const negativeOne: number = -1;
      const nanValue: number = NaN;
      const arr = Float64Array.of(nanValue, zeroPointZero, nanValue, zeroPointZero);
      const idx = arr.lastIndexOf(zeroPointZero);
      const expectVal = threeValue;
      expect(idx).assertEqual(expectVal);
      const idxNaN = arr.lastIndexOf(nanValue);
      const expectVal2 = negativeOne;
      expect(idxNaN).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_7300
     * @tc.name testFloat64ArrayLastIndexOf2073
     * @tc.desc Verify lastIndexOf for Infinity and -Infinity in arrays with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const nanValue: number = NaN;
      const twoValue: number = 2;
      const arrInf = new Float64Array([positiveInfinity, nanValue, positiveInfinity]);
      const idxInf = arrInf.lastIndexOf(positiveInfinity);
      const expectVal = twoValue;
      expect(idxInf).assertEqual(expectVal);
      const arrNInf = new Float64Array([negativeInfinity, nanValue, negativeInfinity]);
      const idxNInf = arrNInf.lastIndexOf(negativeInfinity);
      const expectVal2 = twoValue;
      expect(idxNInf).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_7400
     * @tc.name testFloat64ArrayLastIndexOf2074
     * @tc.desc Verify lastIndexOf with Double.MAX_VALUE, MIN_VALUE and NaN in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: number = Double.MAX_VALUE;
      const minVal: number = Double.MIN_VALUE;
      const nanValue: number = Double.NaN;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const negativeOne: number = -1;
      const arr = Float64Array.of(maxVal, minVal, maxVal, nanValue);
      const idxMax = arr.lastIndexOf(maxVal);
      const expectVal = twoValue;
      expect(idxMax).assertEqual(expectVal);
      const idxMin = arr.lastIndexOf(minVal);
      const expectVal2 = oneValue;
      expect(idxMin).assertEqual(expectVal2);
      const idxNaN = arr.lastIndexOf(nanValue);
      const expectVal3 = negativeOne;
      expect(idxNaN).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_7500
     * @tc.name testFloat64ArrayLastIndexOf2075
     * @tc.desc Verify lastIndexOf with MAX_SAFE_INTEGER, MIN_SAFE_INTEGER and NaN in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafe: number = 9007199254740991;
      const minSafe: number = -9007199254740991;
      const nanValue: number = NaN;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const negativeOne: number = -1;
      const arr = new Float64Array([maxSafe, minSafe, maxSafe, nanValue]);
      const idxMin = arr.lastIndexOf(minSafe);
      const expectVal = oneValue;
      expect(idxMin).assertEqual(expectVal);
      const idxMax = arr.lastIndexOf(maxSafe);
      const expectVal2 = twoValue;
      expect(idxMax).assertEqual(expectVal2);
      const idxNaN = arr.lastIndexOf(nanValue);
      const expectVal3 = negativeOne;
      expect(idxNaN).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_7600
     * @tc.name testFloat64ArrayLastIndexOf2076
     * @tc.desc Verify lastIndexOf with +0.0, -0.0 and NaN in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const nanValue: number = NaN;
      const twoValue: number = 2;
      const negativeOne: number = -1;
      const arr = Float64Array.of(zeroPointZero, -0.0, zeroPointZero, nanValue);
      const idxPosZero = arr.lastIndexOf(zeroPointZero);
      const expectVal = twoValue;
      expect(idxPosZero).assertEqual(expectVal);
      const idxNaN = arr.lastIndexOf(nanValue);
      const expectVal2 = negativeOne;
      expect(idxNaN).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_7700
     * @tc.name testFloat64ArrayLastIndexOf2077
     * @tc.desc Verify lastIndexOf with fromIndex narrowing search to single element matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const negativeOne: number = 1;
      const arr = new Float64Array([1.0, twoPointZero, threePointZero]);
      const idx = arr.lastIndexOf(threePointZero, 2);
      const expectVal = 2;
      expect(idx).assertEqual(expectVal);
      const idxNotFound = arr.lastIndexOf(twoPointZero, 2);
      const expectVal2 = negativeOne;
      expect(idxNotFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_7800
     * @tc.name testFloat64ArrayLastIndexOf2078
     * @tc.desc Verify lastIndexOf with fromIndex negative narrowing search to single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(onePointZero, twoPointZero, 3.0);
      const idx = arr.lastIndexOf(onePointZero, -3);
      const expectVal = 0;
      expect(idx).assertEqual(expectVal);
      const idxNotFound = arr.lastIndexOf(twoPointZero, -3);
      const expectVal2 = negativeOne;
      expect(idxNotFound).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_7900
     * @tc.name testFloat64ArrayLastIndexOf2079
     * @tc.desc Verify lastIndexOf with fromIndex=-length searches whole array, -length-1 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(onePointZero, 2.0, 3.0);
      const idx = arr.lastIndexOf(onePointZero, -3);
      const expectVal = 0;
      expect(idx).assertEqual(expectVal);
      const idxEmpty = arr.lastIndexOf(onePointZero, -4);
      const expectVal2 = -1;
      expect(idxEmpty).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_LASTINDEXOF2_8000
     * @tc.name testFloat64ArrayLastIndexOf2080
     * @tc.desc Verify lastIndexOf with fromIndex at length and large positive index searches whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayLastIndexOf2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(1.0, 2.0, threePointZero);
      const idx = arr.lastIndexOf(threePointZero, 3);
      const expectVal = 2;
      expect(idx).assertEqual(expectVal);
      const idxLarge = arr.lastIndexOf(threePointZero, 100);
      const expectVal2 = 2;
      expect(idxLarge).assertEqual(expectVal2);
    });
  })
}
