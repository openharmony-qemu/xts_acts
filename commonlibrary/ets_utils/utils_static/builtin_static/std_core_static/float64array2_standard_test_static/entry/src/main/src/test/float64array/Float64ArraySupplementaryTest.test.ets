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

export default function Float64ArraySupplementaryTest(): void {
  describe('Float64ArraySupplementaryTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0010
     * @tc.name testFloat64ArraySupplementary001
     * @tc.desc Verify valueOf on empty array returns same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0020
     * @tc.name testFloat64ArraySupplementary002
     * @tc.desc Verify at on empty array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r: number | undefined = arr.at(0);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0030
     * @tc.name testFloat64ArraySupplementary003
     * @tc.desc Verify some on empty array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r: boolean = arr.some((v: number): boolean => v > 0.0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0040
     * @tc.name testFloat64ArraySupplementary004
     * @tc.desc Verify find on empty array does not invoke callback and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let called: int = 0;
      const r: number | undefined = arr.find((v: number): boolean => {
        called++;
        return v > 0.0;
      });
      const actualResult = called;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0050
     * @tc.name testFloat64ArraySupplementary005
     * @tc.desc Verify findIndex on empty array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r: int = arr.findIndex((v: number): boolean => v > 0.0);
      const actualResult = r;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0060
     * @tc.name testFloat64ArraySupplementary006
     * @tc.desc Verify map on empty array returns new empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r: Float64Array = arr.map((v: number): number => v * 2.0);
      const actualLength = r.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0070
     * @tc.name testFloat64ArraySupplementary007
     * @tc.desc Verify filter on empty array returns new empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r: Float64Array = arr.filter((v: number): boolean => v > 0.0);
      const actualLength = r.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0080
     * @tc.name testFloat64ArraySupplementary008
     * @tc.desc Verify every on single element returns true when predicate matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0);
      expect(arr.every((v: number): boolean => v > 0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0090
     * @tc.name testFloat64ArraySupplementary009
     * @tc.desc Verify some on single element returns true when predicate matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0);
      expect(arr.some((v: number): boolean => v === 5.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0100
     * @tc.name testFloat64ArraySupplementary010
     * @tc.desc Verify map on single element returns new array with transformed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0);
      const r: Float64Array = arr.map((v: number): number => v * 2.0);
      const actualLength = r.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 6.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0110
     * @tc.name testFloat64ArraySupplementary011
     * @tc.desc Verify filter on single element returns element when predicate matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(7.0);
      const r: Float64Array = arr.filter((v: number): boolean => v > 0.0);
      const actualLength = r.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 7.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0120
     * @tc.name testFloat64ArraySupplementary012
     * @tc.desc Verify find on single element returns the element when predicate matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(9.0);
      const r: number | undefined = arr.find((v: number): boolean => v > 0.0);
      const actualResult = r;
      const expectedResult: number = 9.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0130
     * @tc.name testFloat64ArraySupplementary013
     * @tc.desc Verify findIndex on single element returns 0 when predicate matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(4.0);
      const r: int = arr.findIndex((v: number): boolean => v > 0.0);
      const actualResult = r;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0140
     * @tc.name testFloat64ArraySupplementary014
     * @tc.desc Verify reverse on single element does not change array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(99.0);
      arr.reverse();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0150
     * @tc.name testFloat64ArraySupplementary015
     * @tc.desc Verify every on single element returns false when predicate fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-1.0);
      expect(arr.every((v: number): boolean => v > 0.0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0160
     * @tc.name testFloat64ArraySupplementary016
     * @tc.desc Verify find on single element returns undefined when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.0);
      const r: number | undefined = arr.find((v: number): boolean => v > 1.0);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0170
     * @tc.name testFloat64ArraySupplementary017
     * @tc.desc Verify sort of two elements orders ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 3.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0180
     * @tc.name testFloat64ArraySupplementary018
     * @tc.desc Verify copyWithin on two elements copies first to second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0);
      arr.copyWithin(1, 0, 1);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 5.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 5.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0190
     * @tc.name testFloat64ArraySupplementary019
     * @tc.desc Verify fill on two elements sets both
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      arr.fill(7.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 7.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 7.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0200
     * @tc.name testFloat64ArraySupplementary020
     * @tc.desc Verify fill partial on two elements fills only first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      arr.fill(9.0, 0, 1);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 9.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0210
     * @tc.name testFloat64ArraySupplementary021
     * @tc.desc Verify find on two elements returns first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0);
      const r: number | undefined = arr.find((v: number): boolean => v > 15.0);
      const actualResult = r;
      const expectedResult: number = 20.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0220
     * @tc.name testFloat64ArraySupplementary022
     * @tc.desc Verify findIndex on two elements returns index of second match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const r: int = arr.findIndex((v: number): boolean => v > 1.0);
      const actualResult = r;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0230
     * @tc.name testFloat64ArraySupplementary023
     * @tc.desc Verify copyWithin with start>end copies nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      arr.copyWithin(0, 2, 1);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0240
     * @tc.name testFloat64ArraySupplementary024
     * @tc.desc Verify $_get at index 0 on 3-element array returns first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0250
     * @tc.name testFloat64ArraySupplementary025
     * @tc.desc Verify $_set at index 0 modifies first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.$_set(0, 99.0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 99.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0260
     * @tc.name testFloat64ArraySupplementary026
     * @tc.desc Verify at at index 0 on 3-element array returns first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const actualResultSecond = arr.at(0);
      const expectedResultSecond: number = 1.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0270
     * @tc.name testFloat64ArraySupplementary027
     * @tc.desc Verify with at index 0 returns new array with modified first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r: Float64Array = arr.with(0, 88.0);
      const actualElement0Second = r.$_get(0);
      const expectedElement0Second: number = 88.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement0Third = arr.$_get(0);
      const expectedElement0Third: number = 1.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0280
     * @tc.name testFloat64ArraySupplementary028
     * @tc.desc Verify $_get at last index returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0290
     * @tc.name testFloat64ArraySupplementary029
     * @tc.desc Verify $_set at last index modifies last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.$_set(2, 77.0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 77.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0300
     * @tc.name testFloat64ArraySupplementary030
     * @tc.desc Verify at at last index returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const actualResultSecond = arr.at(2);
      const expectedResultSecond: number = 3.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0310
     * @tc.name testFloat64ArraySupplementary031
     * @tc.desc Verify with at last index returns new array with modified last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r: Float64Array = arr.with(2, 66.0);
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = 66.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement2Second = arr.$_get(2);
      const expectedElement2Second: number = 3.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0320
     * @tc.name testFloat64ArraySupplementary032
     * @tc.desc Verify forEach modify via alias visible on original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const alias: Float64Array = arr;
      arr.forEach((v: number, i: int): void => {
        alias.$_set(i, v * 10.0);
      });
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 10.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1Second = arr.$_get(1);
      const expectedElement1Second: number = 20.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 30.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0330
     * @tc.name testFloat64ArraySupplementary033
     * @tc.desc Verify map via alias returns new array, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const alias: Float64Array = arr;
      const r: Float64Array = alias.map((v: number): number => v * 2.0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement0Third = r.$_get(0);
      const expectedElement0Third: number = 2.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
      expect(arr.buffer !== r.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0340
     * @tc.name testFloat64ArraySupplementary034
     * @tc.desc Verify filter via alias returns new array, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const alias: Float64Array = arr;
      const r: Float64Array = alias.filter((v: number): boolean => v > 1.0);
      const actualLengthSecond = arr.length;
      const expectedLengthSecond: int = 3;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
      const actualLengthThird = r.length;
      const expectedLengthThird: int = 2;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0350
     * @tc.name testFloat64ArraySupplementary035
     * @tc.desc Verify sort via alias sorts the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const alias: Float64Array = arr;
      alias.sort();
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0360
     * @tc.name testFloat64ArraySupplementary036
     * @tc.desc Verify fill via alias fills the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const alias: Float64Array = arr;
      alias.fill(5.0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 5.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 5.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0370
     * @tc.name testFloat64ArraySupplementary037
     * @tc.desc Verify reverse via alias reverses the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const alias: Float64Array = arr;
      alias.reverse();
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 3.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 1.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0380
     * @tc.name testFloat64ArraySupplementary038
     * @tc.desc Verify set via alias modifies the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const alias: Float64Array = arr;
      const src: Float64Array = Float64Array.of(9.0, 8.0);
      alias.set(src);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 9.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1Second = arr.$_get(1);
      const expectedElement1Second: number = 8.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0390
     * @tc.name testFloat64ArraySupplementary039
     * @tc.desc Verify copyWithin via alias modifies the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const alias: Float64Array = arr;
      alias.copyWithin(0, 2, 4);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 3.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1Second = arr.$_get(1);
      const expectedElement1Second: number = 4.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0400
     * @tc.name testFloat64ArraySupplementary040
     * @tc.desc Verify subarray with OOB end clamps to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, Infinity, -Infinity);
      const sub: Float64Array = arr.subarray(0, 10);
      const actualLengthSecond = sub.length;
      const expectedLengthSecond: int = 3;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0410
     * @tc.name testFloat64ArraySupplementary041
     * @tc.desc Verify slice with both OOB returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, -0.0, Number.MAX_SAFE_INTEGER);
      const sl: Float64Array = arr.slice(10, 20);
      const actualLengthSecond = sl.length;
      const expectedLengthSecond: int = 0;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0420
     * @tc.name testFloat64ArraySupplementary042
     * @tc.desc Verify $_get OOB throws RangeError (contract detail)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      try {
        arr.$_get(1);
        expect().assertFail();
      } catch (e) {
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0430
     * @tc.name testFloat64ArraySupplementary043
     * @tc.desc Verify $_set with maximum int index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      const maxIndex: int = 2147483647;
      try {
        arr.$_set(maxIndex, 1.0);
        expect().assertFail();
      } catch (e) {
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0440
     * @tc.name testFloat64ArraySupplementary044
     * @tc.desc Verify subarray negative end clamps to length + end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const sub: Float64Array = arr.subarray(1, -1);
      const actualLengthSecond = sub.length;
      const expectedLengthSecond: int = 2;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
      const actualElement0Second = sub.$_get(0);
      const expectedElement0Second: number = 2.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1Second = sub.$_get(1);
      const expectedElement1Second: number = 3.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0450
     * @tc.name testFloat64ArraySupplementary045
     * @tc.desc Verify slice with negative start counts from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const sl: Float64Array = arr.slice(-2);
      const actualLengthFourth = sl.length;
      const expectedLengthFourth: int = 2;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualElement0Fourth = sl.$_get(0);
      const expectedElement0Fourth: number = 3.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0460
     * @tc.name testFloat64ArraySupplementary046
     * @tc.desc Verify Double.toInt(NaN) produces zero index without mutating the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r: Float64Array = arr.with(Double.toInt(NaN), 99.0);
      const actualElement0Fourth = r.$_get(0);
      const expectedElement0Fourth: number = 99.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      const actualElement0Fifth = arr.$_get(0);
      const expectedElement0Fifth: number = 1.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
      expect(r.buffer === arr.buffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0470
     * @tc.name testFloat64ArraySupplementary047
     * @tc.desc Verify slice with start > end returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, -Infinity, Number.MIN_VALUE);
      const sl: Float64Array = arr.slice(3, 1);
      const actualLengthFourth = sl.length;
      const expectedLengthFourth: int = 0;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0480
     * @tc.name testFloat64ArraySupplementary048
     * @tc.desc Verify overlapping copy preserves the source element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      arr.copyWithin(0, 1, 4);
      const actualElement0Fourth = arr.$_get(0);
      const expectedElement0Fourth: number = 2.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      const actualElement1Third = arr.$_get(1);
      const expectedElement1Third: number = 3.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement2Third = arr.$_get(2);
      const expectedElement2Third: number = 4.0;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 4.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0490
     * @tc.name testFloat64ArraySupplementary049
     * @tc.desc Verify set with same source and dest does not corrupt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.set(arr);
      const actualElement0Fourth = arr.$_get(0);
      const expectedElement0Fourth: number = 1.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      const actualElement1Third = arr.$_get(1);
      const expectedElement1Third: number = 2.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement2Third = arr.$_get(2);
      const expectedElement2Third: number = 3.0;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0500
     * @tc.name testFloat64ArraySupplementary050
     * @tc.desc Verify sort with NaN only does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, NaN, NaN);
      arr.sort();
      const actualLengthFourth = arr.length;
      const expectedLengthFourth: int = 3;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0510
     * @tc.name testFloat64ArraySupplementary051
     * @tc.desc Verify subarray with both negative returns subset from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const sub: Float64Array = arr.subarray(-3, -1);
      const actualLengthFourth = sub.length;
      const expectedLengthFourth: int = 2;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualElement0Fourth = sub.$_get(0);
      const expectedElement0Fourth: number = 3.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      const actualElement1Third = sub.$_get(1);
      const expectedElement1Third: number = 4.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0520
     * @tc.name testFloat64ArraySupplementary052
     * @tc.desc Verify copyWithin empty range returns the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const returned: Float64Array = arr.copyWithin(0, 0, 0);
      expect(returned === arr).assertTrue();
      const actualElement0Fourth = arr.$_get(0);
      const expectedElement0Fourth: number = 1.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      const actualElement2Third = arr.$_get(2);
      const expectedElement2Third: number = 3.0;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0530
     * @tc.name testFloat64ArraySupplementary053
     * @tc.desc Verify sort with all same values does not change array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 5.0, 5.0);
      arr.sort();
      const actualElement0Fourth = arr.$_get(0);
      const expectedElement0Fourth: number = 5.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      const actualElement1Third = arr.$_get(1);
      const expectedElement1Third: number = 5.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement2Third = arr.$_get(2);
      const expectedElement2Third: number = 5.0;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0540
     * @tc.name testFloat64ArraySupplementary054
     * @tc.desc Verify subarray with negative start beyond clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const sub: Float64Array = arr.subarray(-10, 2);
      const actualLengthFourth = sub.length;
      const expectedLengthFourth: int = 2;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualElement0Fourth = sub.$_get(0);
      const expectedElement0Fourth: number = 1.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0550
     * @tc.name testFloat64ArraySupplementary055
     * @tc.desc Verify map callback index type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idxType: string = '';
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.map((v: number, i: int): number => {
        idxType = typeof i;
        return v;
      });
      const actualResultThird = idxType;
      const expectedResultThird: string = 'int';
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0560
     * @tc.name testFloat64ArraySupplementary056
     * @tc.desc Verify map callback index range covers 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sumIdx: int = 0;
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      arr.map((v: number, i: int): number => {
        sumIdx += i;
        return v;
      });
      const actualResultThird = sumIdx;
      const expectedResultThird: number = 3;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0570
     * @tc.name testFloat64ArraySupplementary057
     * @tc.desc Verify map callback array argument refers to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let refArr: Float64Array | null = null;
      const arr: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, Number.MIN_VALUE, -0.0);
      arr.map((v: number, i: int, a: Float64Array): number => {
        refArr = a;
        return v;
      });
      expect(refArr).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0580
     * @tc.name testFloat64ArraySupplementary058
     * @tc.desc Verify filter callback index type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idxType: string = '';
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.filter((v: number, i: int): boolean => {
        idxType = typeof i;
        return true;
      });
      const actualResultThird = idxType;
      const expectedResultThird: string = 'int';
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0590
     * @tc.name testFloat64ArraySupplementary059
     * @tc.desc Verify filter callback index range covers 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxIdx: int = -1;
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0, 40.0, 50.0);
      arr.filter((v: number, i: int): boolean => {
        maxIdx = i;
        return true;
      });
      const actualResultThird = maxIdx;
      const expectedResultThird: number = 4;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0600
     * @tc.name testFloat64ArraySupplementary060
     * @tc.desc Verify filter callback array argument refers to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let refArr: Float64Array | null = null;
      const arr: Float64Array = Float64Array.of(NaN, Infinity, -0.0);
      arr.filter((v: number, i: int, a: Float64Array): boolean => {
        refArr = a;
        return true;
      });
      expect(refArr).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0610
     * @tc.name testFloat64ArraySupplementary061
     * @tc.desc Verify find callback index type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idxType: string = '';
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.find((v: number, i: int): boolean => {
        idxType = typeof i;
        return false;
      });
      const actualResultThird = idxType;
      const expectedResultThird: string = 'int';
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0620
     * @tc.name testFloat64ArraySupplementary062
     * @tc.desc Verify find callback index range covers 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visited: int = 0;
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      arr.find((v: number, i: int): boolean => {
        visited = i;
        return false;
      });
      const actualResultThird = visited;
      const expectedResultThird: number = 2;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0630
     * @tc.name testFloat64ArraySupplementary063
     * @tc.desc Verify find callback array argument refers to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let refArr: Float64Array | null = null;
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.find((v: number, i: int, a: Float64Array): boolean => {
        refArr = a;
        return false;
      });
      expect(refArr).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0640
     * @tc.name testFloat64ArraySupplementary064
     * @tc.desc Verify forEach callback index type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idxType: string = '';
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.forEach((v: number, i: int): void => {
        idxType = typeof i;
      });
      const actualResultThird = idxType;
      const expectedResultThird: string = 'int';
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0650
     * @tc.name testFloat64ArraySupplementary065
     * @tc.desc Verify forEach callback index range covers 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxIdx: int = -1;
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      arr.forEach((v: number, i: int): void => {
        maxIdx = i;
      });
      const actualResultThird = maxIdx;
      const expectedResultThird: number = 3;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0660
     * @tc.name testFloat64ArraySupplementary066
     * @tc.desc Verify forEach callback array argument refers to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let refArr: Float64Array | null = null;
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        refArr = a;
      });
      expect(refArr).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0670
     * @tc.name testFloat64ArraySupplementary067
     * @tc.desc Verify every callback index type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idxType: string = '';
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.every((v: number, i: int): boolean => {
        idxType = typeof i;
        return true;
      });
      const actualResultThird = idxType;
      const expectedResultThird: string = 'int';
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0680
     * @tc.name testFloat64ArraySupplementary068
     * @tc.desc Verify every callback index range covers 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastIdx: int = -1;
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      arr.every((v: number, i: int): boolean => {
        lastIdx = i;
        return true;
      });
      const actualResultThird = lastIdx;
      const expectedResultThird: number = 2;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0690
     * @tc.name testFloat64ArraySupplementary069
     * @tc.desc Verify every callback array argument refers to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let refArr: Float64Array | null = null;
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.every((v: number, i: int, a: Float64Array): boolean => {
        refArr = a;
        return true;
      });
      expect(refArr).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0700
     * @tc.name testFloat64ArraySupplementary070
     * @tc.desc Verify some callback index type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idxType: string = '';
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.some((v: number, i: int): boolean => {
        idxType = typeof i;
        return false;
      });
      const actualResultFourth = idxType;
      const expectedResultFourth: string = 'int';
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0710
     * @tc.name testFloat64ArraySupplementary071
     * @tc.desc Verify some callback index range covers 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastIdx: int = -1;
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.some((v: number, i: int): boolean => {
        lastIdx = i;
        return false;
      });
      const actualResultFourth = lastIdx;
      const expectedResultFourth: number = 2;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0720
     * @tc.name testFloat64ArraySupplementary072
     * @tc.desc Verify some callback array argument refers to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let refArr: Float64Array | null = null;
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.some((v: number, i: int, a: Float64Array): boolean => {
        refArr = a;
        return false;
      });
      expect(refArr).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0730
     * @tc.name testFloat64ArraySupplementary073
     * @tc.desc Verify findIndex callback index type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idxType: string = '';
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.findIndex((v: number, i: int): boolean => {
        idxType = typeof i;
        return false;
      });
      const actualResultFourth = idxType;
      const expectedResultFourth: string = 'int';
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0740
     * @tc.name testFloat64ArraySupplementary074
     * @tc.desc Verify findIndex callback index range covers 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastIdx: int = -1;
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      arr.findIndex((v: number, i: int): boolean => {
        lastIdx = i;
        return false;
      });
      const actualResultFourth = lastIdx;
      const expectedResultFourth: number = 2;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0750
     * @tc.name testFloat64ArraySupplementary075
     * @tc.desc Verify findIndex callback array argument refers to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let refArr: Float64Array | null = null;
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.findIndex((v: number, i: int, a: Float64Array): boolean => {
        refArr = a;
        return false;
      });
      expect(refArr).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0760
     * @tc.name testFloat64ArraySupplementary076
     * @tc.desc Verify fill works after caught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.$_get(10);
        expect().assertFail();
      } catch (e) {
        const actualNameSecond = e.name;
        const expectedNameSecond: string = 'RangeError';
        expect(actualNameSecond).assertEqual(expectedNameSecond);
      }
      arr.fill(5.0);
      const actualElement0Sixth = arr.$_get(0);
      const expectedElement0Sixth: number = 5.0;
      expect(actualElement0Sixth).assertEqual(expectedElement0Sixth);
      const actualElement2Fourth = arr.$_get(2);
      const expectedElement2Fourth: number = 5.0;
      expect(actualElement2Fourth).assertEqual(expectedElement2Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0770
     * @tc.name testFloat64ArraySupplementary077
     * @tc.desc Verify set works after caught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.$_set(10, 99.0);
        expect().assertFail();
      } catch (e) {
        const actualNameSecond = e.name;
        const expectedNameSecond: string = 'RangeError';
        expect(actualNameSecond).assertEqual(expectedNameSecond);
      }
      const src: Float64Array = Float64Array.of(7.0, 8.0);
      arr.set(src);
      const actualElement0Sixth = arr.$_get(0);
      const expectedElement0Sixth: number = 7.0;
      expect(actualElement0Sixth).assertEqual(expectedElement0Sixth);
      const actualElement1Fourth = arr.$_get(1);
      const expectedElement1Fourth: number = 8.0;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0780
     * @tc.name testFloat64ArraySupplementary078
     * @tc.desc Verify sort works after caught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      try {
        arr.$_get(10);
        expect().assertFail();
      } catch (e) {
        const actualNameSecond = e.name;
        const expectedNameSecond: string = 'RangeError';
        expect(actualNameSecond).assertEqual(expectedNameSecond);
      }
      arr.sort();
      const actualElement0Sixth = arr.$_get(0);
      const expectedElement0Sixth: number = 1.0;
      expect(actualElement0Sixth).assertEqual(expectedElement0Sixth);
      const actualElement2Fourth = arr.$_get(2);
      const expectedElement2Fourth: number = 3.0;
      expect(actualElement2Fourth).assertEqual(expectedElement2Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0790
     * @tc.name testFloat64ArraySupplementary079
     * @tc.desc Verify map works after caught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.$_get(10);
        expect().assertFail();
      } catch (e) {
        const actualNameSecond = e.name;
        const expectedNameSecond: string = 'RangeError';
        expect(actualNameSecond).assertEqual(expectedNameSecond);
      }
      const r: Float64Array = arr.map((v: number): number => v * 2.0);
      const actualElement0Sixth = r.$_get(0);
      const expectedElement0Sixth: number = 2.0;
      expect(actualElement0Sixth).assertEqual(expectedElement0Sixth);
      const actualElement2Fourth = r.$_get(2);
      const expectedElement2Fourth: number = 6.0;
      expect(actualElement2Fourth).assertEqual(expectedElement2Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0800
     * @tc.name testFloat64ArraySupplementary080
     * @tc.desc Verify find works after caught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.$_set(10, 99.0);
        expect().assertFail();
      } catch (e) {
        const actualNameSecond = e.name;
        const expectedNameSecond: string = 'RangeError';
        expect(actualNameSecond).assertEqual(expectedNameSecond);
      }
      const r: number | undefined = arr.find((v: number): boolean => v > 2.0);
      const actualResultFourth = r;
      const expectedResultFourth: number = 3.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0810
     * @tc.name testFloat64ArraySupplementary081
     * @tc.desc Verify filter works after caught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.$_set(10, 99.0);
        expect().assertFail();
      } catch (e) {
        const actualNameSecond = e.name;
        const expectedNameSecond: string = 'RangeError';
        expect(actualNameSecond).assertEqual(expectedNameSecond);
      }
      const r: Float64Array = arr.filter((v: number): boolean => v > 1.0);
      const actualLengthFifth = r.length;
      const expectedLengthFifth: int = 2;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0820
     * @tc.name testFloat64ArraySupplementary082
     * @tc.desc Verify toReversed works after caught exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.$_get(10);
        expect().assertFail();
      } catch (e) {
        const actualNameSecond = e.name;
        const expectedNameSecond: string = 'RangeError';
        expect(actualNameSecond).assertEqual(expectedNameSecond);
      }
      const r: Float64Array = arr.toReversed();
      const actualElement0Sixth = r.$_get(0);
      const expectedElement0Sixth: number = 3.0;
      expect(actualElement0Sixth).assertEqual(expectedElement0Sixth);
      const actualElement2Fourth = r.$_get(2);
      const expectedElement2Fourth: number = 1.0;
      expect(actualElement2Fourth).assertEqual(expectedElement2Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0830
     * @tc.name testFloat64ArraySupplementary083
     * @tc.desc Verify for...of break early stops iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      let count: int = 0;
      for (const v of arr) {
        if (v > 3.0) {
          break;
        }
        count++;
      }
      const actualResultFourth = count;
      const expectedResultFourth: number = 3;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0840
     * @tc.name testFloat64ArraySupplementary084
     * @tc.desc Verify for...of resumes on new loop after break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      let sum1: number = 0.0;
      for (const v of arr) {
        sum1 += v;
        if (v === 2.0) {
          break;
        }
      }
      let sum2: number = 0.0;
      for (const v of arr) {
        sum2 += v;
      }
      const actualResultFourth = sum1;
      const expectedResultFourth: number = 3.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
      const actualResultFifth = sum2;
      const expectedResultFifth: number = 6.0;
      expect(actualResultFifth).assertEqual(expectedResultFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0850
     * @tc.name testFloat64ArraySupplementary085
     * @tc.desc Verify entries.next() after $_set shows updated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.$_set(0, 99.0);
      const iter = arr.entries();
      let r = iter.next();
      const actualResultFourth = r.value![1];
      const expectedResultFourth: number = 99.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
      r = iter.next();
      const actualResultFifth = r.value![1];
      const expectedResultFifth: number = 2.0;
      expect(actualResultFifth).assertEqual(expectedResultFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0860
     * @tc.name testFloat64ArraySupplementary086
     * @tc.desc Verify entries.next() after fill shows updated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.fill(5.0);
      const iter = arr.entries();
      let r = iter.next();
      const actualResultFourth = r.value![1];
      const expectedResultFourth: number = 5.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
      r = iter.next();
      const actualResultFifth = r.value![1];
      const expectedResultFifth: number = 5.0;
      expect(actualResultFifth).assertEqual(expectedResultFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0870
     * @tc.name testFloat64ArraySupplementary087
     * @tc.desc Verify entries.next() after set shows updated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const src: Float64Array = Float64Array.of(7.0, 8.0);
      arr.set(src);
      const iter = arr.entries();
      let r = iter.next();
      const actualResultFourth = r.value![1];
      const expectedResultFourth: number = 7.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
      r = iter.next();
      const actualResultFifth = r.value![1];
      const expectedResultFifth: number = 8.0;
      expect(actualResultFifth).assertEqual(expectedResultFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0880
     * @tc.name testFloat64ArraySupplementary088
     * @tc.desc Verify keys iterator values after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.reverse();
      const iter = arr.keys();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 1;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value;
      const expectedIteratorValueThird: number = 2;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0890
     * @tc.name testFloat64ArraySupplementary089
     * @tc.desc Verify values iterator after sort returns sorted values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      arr.sort();
      const iter = arr.values();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 2.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value;
      const expectedIteratorValueThird: number = 3.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0900
     * @tc.name testFloat64ArraySupplementary090
     * @tc.desc Verify entries iterator done after full iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const iter = arr.entries();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0910
     * @tc.name testFloat64ArraySupplementary091
     * @tc.desc Verify 2 Float64Array views from same ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const firstResult: Float64Array = new Float64Array(buf, 0, 2);
      const secondResult: Float64Array = new Float64Array(buf, 16, 2);
      firstResult.$_set(0, 1.0);
      firstResult.$_set(1, 2.0);
      secondResult.$_set(0, 3.0);
      secondResult.$_set(1, 4.0);
      const actualElement0Sixth = firstResult.$_get(0);
      const expectedElement0Sixth: number = 1.0;
      expect(actualElement0Sixth).assertEqual(expectedElement0Sixth);
      const actualElement1Fourth = firstResult.$_get(1);
      const expectedElement1Fourth: number = 2.0;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
      const actualElement0Seventh = secondResult.$_get(0);
      const expectedElement0Seventh: number = 3.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement1Fifth = secondResult.$_get(1);
      const expectedElement1Fifth: number = 4.0;
      expect(actualElement1Fifth).assertEqual(expectedElement1Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0920
     * @tc.name testFloat64ArraySupplementary092
     * @tc.desc Verify 3 Float64Array views from same ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(48);
      const firstResult: Float64Array = new Float64Array(buf, 0, 2);
      const secondResult: Float64Array = new Float64Array(buf, 16, 2);
      const thirdResult: Float64Array = new Float64Array(buf, 32, 2);
      firstResult.$_set(0, 10.0);
      secondResult.$_set(0, 20.0);
      thirdResult.$_set(0, 30.0);
      const actualElement0Sixth = firstResult.$_get(0);
      const expectedElement0Sixth: number = 10.0;
      expect(actualElement0Sixth).assertEqual(expectedElement0Sixth);
      const actualElement0Seventh = secondResult.$_get(0);
      const expectedElement0Seventh: number = 20.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement0Eighth = thirdResult.$_get(0);
      const expectedElement0Eighth: number = 30.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0930
     * @tc.name testFloat64ArraySupplementary093
     * @tc.desc Verify Int32Array and Float64Array share same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const f64: Float64Array = new Float64Array(buf, 0, 1);
      const i32: Int32Array = new Int32Array(buf, 0, 2);
      f64.$_set(0, 0.0);
      i32.$_set(0, 1);
      i32.$_set(1, 0);
      const actualElement0Ninth = f64.$_get(0);
      const expectedElement0Ninth: number = 4.9406564584124654e-324;
      expect(actualElement0Ninth).assertEqual(expectedElement0Ninth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0940
     * @tc.name testFloat64ArraySupplementary094
     * @tc.desc Verify write via one view visible across another
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const a: Float64Array = new Float64Array(buf, 0, 2);
      const b: Float64Array = new Float64Array(buf, 0, 2);
      a.$_set(0, 42.0);
      const actualElement0Ninth = b.$_get(0);
      const expectedElement0Ninth: number = 42.0;
      expect(actualElement0Ninth).assertEqual(expectedElement0Ninth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0950
     * @tc.name testFloat64ArraySupplementary095
     * @tc.desc Verify byteOffset per view is correct for different offsets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const firstResult: Float64Array = new Float64Array(buf, 0, 2);
      const secondResult: Float64Array = new Float64Array(buf, 16, 2);
      const actualByteOffset = firstResult.byteOffset;
      const expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
      const actualByteOffsetSecond = secondResult.byteOffset;
      const expectedByteOffsetSecond: int = 16;
      expect(actualByteOffsetSecond).assertEqual(expectedByteOffsetSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0960
     * @tc.name testFloat64ArraySupplementary096
     * @tc.desc Verify byteLength per view is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const firstResult: Float64Array = new Float64Array(buf, 0, 2);
      const secondResult: Float64Array = new Float64Array(buf, 16, 2);
      const actualByteLength = firstResult.byteLength;
      const expectedByteLength: int = 16;
      expect(actualByteLength).assertEqual(expectedByteLength);
      const actualByteLengthSecond = secondResult.byteLength;
      const expectedByteLengthSecond: int = 16;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0970
     * @tc.name testFloat64ArraySupplementary097
     * @tc.desc Verify Float64Array and Int32Array write visible across views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const f64: Float64Array = new Float64Array(buf);
      const i32: Int32Array = new Int32Array(buf);
      f64.$_set(0, 0.0);
      i32.$_set(1, 1072693248);
      const actualElement0Ninth = f64.$_get(0);
      const expectedElement0Ninth: number = 1.0;
      expect(actualElement0Ninth).assertEqual(expectedElement0Ninth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0980
     * @tc.name testFloat64ArraySupplementary098
     * @tc.desc Verify Float64Array.name is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      const name: string = arr.name;
      const actualResultSixth = name;
      const expectedResultSixth: string = 'Float64Array';
      expect(actualResultSixth).assertEqual(expectedResultSixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_0990
     * @tc.name testFloat64ArraySupplementary099
     * @tc.desc Verify instance BYTES_PER_ELEMENT is 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const actualBytesPerElement = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElement: int = 8;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_1000
     * @tc.name testFloat64ArraySupplementary100
     * @tc.desc Verify toString renders elements as comma-separated text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const tag: string = arr.toString();
      const actualResultSixth = tag;
      const expectedResultSixth: string = '1,2';
      expect(actualResultSixth).assertEqual(expectedResultSixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_1010
     * @tc.name testFloat64ArraySupplementary101
     * @tc.desc Verify constructor.name equals Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      const cn: string = arr.name;
      const actualResultSixth = cn;
      const expectedResultSixth: string = 'Float64Array';
      expect(actualResultSixth).assertEqual(expectedResultSixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_1020
     * @tc.name testFloat64ArraySupplementary102
     * @tc.desc Verify valueOf returns same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_1030
     * @tc.name testFloat64ArraySupplementary103
     * @tc.desc Verify Float64Array.of result length and byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const actualLengthSixth = arr.length;
      const expectedLengthSixth: int = 2;
      expect(actualLengthSixth).assertEqual(expectedLengthSixth);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 16;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_1040
     * @tc.name testFloat64ArraySupplementary104
     * @tc.desc Verify BYTES_PER_ELEMENT value is 8 as double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      const actualBytesPerElement = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElement: int = 8;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SUPPLEMENTARY_1050
     * @tc.name testFloat64ArraySupplementary105
     * @tc.desc Verify supplementary chain handles critical 1000 element boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySupplementary105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1000);
      arr.$_set(999, Number.MAX_VALUE);
      const tail = arr.subarray(998).filter((v: number): boolean => v > 0.0);
      const actualLengthSixth = tail.length;
      const expectedLengthSixth: int = 1;
      expect(actualLengthSixth).assertEqual(expectedLengthSixth);
      const actualElement0Ninth = tail.$_get(0);
      const expectedElement0Ninth: number = Number.MAX_VALUE;
      expect(actualElement0Ninth).assertEqual(expectedElement0Ninth);
    });
  })
}
