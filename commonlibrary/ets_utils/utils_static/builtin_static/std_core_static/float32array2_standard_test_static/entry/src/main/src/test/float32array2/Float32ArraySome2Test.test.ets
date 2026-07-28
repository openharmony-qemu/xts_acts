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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float32ArraySome2Test(): void {
  describe('Float32ArraySome2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_0100
     * @tc.name testFloat32ArraySomeTwo001
     * @tc.desc Verify some(element>0) on [1,2,3] returns true (typeof boolean)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_0200
     * @tc.name testFloat32ArraySomeTwo002
     * @tc.desc Verify some(element>10) on [1,2,3] returns false (typeof boolean)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_0300
     * @tc.name testFloat32ArraySomeTwo003
     * @tc.desc Verify some on empty array returns false (typeof boolean)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_0400
     * @tc.name testFloat32ArraySomeTwo004
     * @tc.desc Verify some(element>5) on [10,1,1] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 1.0, 1.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_0500
     * @tc.name testFloat32ArraySomeTwo005
     * @tc.desc Verify some(element>5) on [1,1,10] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 1.0, 10.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_0600
     * @tc.name testFloat32ArraySomeTwo006
     * @tc.desc Verify some(isNaN) on [1,NaN,2] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, Number.NaN, 2.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => isNaN(element));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_0700
     * @tc.name testFloat32ArraySomeTwo007
     * @tc.desc Verify some(element===+Infinity) on [1,Inf,2] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, Number.POSITIVE_INFINITY, 2.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element === Number.POSITIVE_INFINITY);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_0800
     * @tc.name testFloat32ArraySomeTwo008
     * @tc.desc Verify some(element>5) on [10,1,2] returns true as first element 10 satisfies condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 1.0, 2.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_0900
     * @tc.name testFloat32ArraySomeTwo009
     * @tc.desc Verify some(element>5) on [1,2,10] returns true as last element 10 satisfies condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 10.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_1000
     * @tc.name testFloat32ArraySomeTwo010
     * @tc.desc Verify some(element>5) on [1,10,2] returns true as middle element 10 satisfies condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 10.0, 2.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_1100
     * @tc.name testFloat32ArraySomeTwo011
     * @tc.desc Verify some(element>5) on [1,1,1,9,1] returns true as element at index 3 satisfies condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 1.0, 1.0, 9.0, 1.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_1200
     * @tc.name testFloat32ArraySomeTwo012
     * @tc.desc Verify some(element>5) on single element [7] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([7.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_1300
     * @tc.name testFloat32ArraySomeTwo013
     * @tc.desc Verify NaN Number.isNaN true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, Number.NaN, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => isNaN(element));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_1400
     * @tc.name testFloat32ArraySomeTwo014
     * @tc.desc Verify +Infinity true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, Number.POSITIVE_INFINITY, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element === Number.POSITIVE_INFINITY);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_1500
     * @tc.name testFloat32ArraySomeTwo015
     * @tc.desc Verify -Infinity true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, Number.NEGATIVE_INFINITY, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element === Number.NEGATIVE_INFINITY);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_1600
     * @tc.name testFloat32ArraySomeTwo016
     * @tc.desc Verify +0 === 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 0, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_1700
     * @tc.name testFloat32ArraySomeTwo017
     * @tc.desc Verify -0 1/x<0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, -0, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element === 0 && 1 / element < 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_1800
     * @tc.name testFloat32ArraySomeTwo018
     * @tc.desc Verify Float32.MAX >1e38 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 3.4028234663852886e+38, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 1e38);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_1900
     * @tc.name testFloat32ArraySomeTwo019
     * @tc.desc Verify Float32.MIN_VALUE 0<x<1e-38 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 1.401298464324817e-45, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 0 && element < 1e-38);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_2000
     * @tc.name testFloat32ArraySomeTwo020
     * @tc.desc Verify Float32.MIN_NORMAL true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 1.1754943508222875e-38, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element >= 1.1754943508222875e-38 && element < 1e-37);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_2100
     * @tc.name testFloat32ArraySomeTwo021
     * @tc.desc Verify 16777216 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 16777216, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element === 16777216);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_2200
     * @tc.name testFloat32ArraySomeTwo022
     * @tc.desc Verify 0.1 !== 0.1 due to float32 precision, some() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.1, 0.2, 0.3]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element === 0.1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_2300
     * @tc.name testFloat32ArraySomeTwo023
     * @tc.desc Verify <0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, -5.0, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element < 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_2400
     * @tc.name testFloat32ArraySomeTwo024
     * @tc.desc Verify <0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([2.0, 4.0, -1.0, 6.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element < 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_2500
     * @tc.name testFloat32ArraySomeTwo025
     * @tc.desc Verify some(element>0) on empty array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_2600
     * @tc.name testFloat32ArraySomeTwo026
     * @tc.desc Verify some(element>5) on [5] returns false (strict inequality)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_2700
     * @tc.name testFloat32ArraySomeTwo027
     * @tc.desc Verify 0 >0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0, 0, 0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_2800
     * @tc.name testFloat32ArraySomeTwo028
     * @tc.desc Verify some(element<0) on [1,2,3] returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element < 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_2900
     * @tc.name testFloat32ArraySomeTwo029
     * @tc.desc Verify NaN === NaN false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, Number.NaN, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element === Number.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_3000
     * @tc.name testFloat32ArraySomeTwo030
     * @tc.desc Verify some(element>100) on [1..8] returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_3100
     * @tc.name testFloat32ArraySomeTwo031
     * @tc.desc Verify NaN >0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Number.NaN]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_3200
     * @tc.name testFloat32ArraySomeTwo032
     * @tc.desc Verify NaN <0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Number.NaN]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element < 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_3300
     * @tc.name testFloat32ArraySomeTwo033
     * @tc.desc Verify some() returns false when comparing Infinity with < operator (Infinity is not less than Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Number.POSITIVE_INFINITY, Number.POSITIVE_INFINITY]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element < Number.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_3400
     * @tc.name testFloat32ArraySomeTwo034
     * @tc.desc Verify some(isFinite) returns true when array contains a finite element among Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Number.POSITIVE_INFINITY, 5.0, Number.NEGATIVE_INFINITY]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => isFinite(element));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_3500
     * @tc.name testFloat32ArraySomeTwo035
     * @tc.desc Verify some() returns true when comparing NaN with !== operator (NaN is not equal to itself)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, Number.NaN, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element !== element);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_3600
     * @tc.name testFloat32ArraySomeTwo036
     * @tc.desc Verify some() returns true when element is subnormal value 1.0e-45 greater than 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0e-45]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_3700
     * @tc.name testFloat32ArraySomeTwo037
     * @tc.desc Verify some() callback receives correct index parameter (index===2 returns true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => index === 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_3800
     * @tc.name testFloat32ArraySomeTwo038
     * @tc.desc Verify some() returns false when index condition is not met (index===99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => index === 99);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_3900
     * @tc.name testFloat32ArraySomeTwo039
     * @tc.desc Verify some() callback receives correct array reference (array.length===4 returns true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => array.length === 4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_4000
     * @tc.name testFloat32ArraySomeTwo040
     * @tc.desc Verify some() returns false when array.length===99 (condition not met)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => array.length === 99);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_4100
     * @tc.name testFloat32ArraySomeTwo041
     * @tc.desc Verify some() returns true when element exceeds float32 max range (>1.7e38)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0e+38, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 1.7e+38);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_4200
     * @tc.name testFloat32ArraySomeTwo042
     * @tc.desc Verify some() returns false when element is -0 (not greater than 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-0, -0, -0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_4300
     * @tc.name testFloat32ArraySomeTwo043
     * @tc.desc Verify some() with epsilon comparison returns true when element approximately equals 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.1, 0.2, 0.3]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => Math.abs(element - 0.3) < 1e-6);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_4400
     * @tc.name testFloat32ArraySomeTwo044
     * @tc.desc Verify some() with Number.isInteger returns true when array contains integer element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.5, 1.5, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => Number.isInteger(element));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_4500
     * @tc.name testFloat32ArraySomeTwo045
     * @tc.desc Verify some() with Number.isInteger returns false when array has no integer element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.5, 1.5, 2.5]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => Number.isInteger(element));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_4600
     * @tc.name testFloat32ArraySomeTwo046
     * @tc.desc Verify some(return false) on [1,2,3] returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_4700
     * @tc.name testFloat32ArraySomeTwo047
     * @tc.desc Verify some(return true) on [1,2,3] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_4800
     * @tc.name testFloat32ArraySomeTwo048
     * @tc.desc Verify some(return true) on [42] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([42.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_4900
     * @tc.name testFloat32ArraySomeTwo049
     * @tc.desc Verify some(return true) on empty array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_5000
     * @tc.name testFloat32ArraySomeTwo050
     * @tc.desc Verify some() on subarray returns false when no element matches predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = parent.subarray(0, 2);
      const result: boolean = view.some((element: number, index: int, array: Float32Array): boolean => element > 4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_5100
     * @tc.name testFloat32ArraySomeTwo051
     * @tc.desc Verify subarray true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float32Array = new Float32Array([1.0, 5.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = parent.subarray(0, 2);
      const result: boolean = view.some((element: number, index: int, array: Float32Array): boolean => element > 4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_5200
     * @tc.name testFloat32ArraySomeTwo052
     * @tc.desc Verify some(element>5) on [5,5,5] returns false as none exceeds 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0, 5.0, 5.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_5300
     * @tc.name testFloat32ArraySomeTwo053
     * @tc.desc Verify some(element===5) on [5,5,5] returns true as all elements equal 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0, 5.0, 5.0]);
      const result: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element === 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_5400
     * @tc.name testFloat32ArraySomeTwo054
     * @tc.desc Verify some(element>5) on [10,1,2] does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 1.0, 2.0]);
      const lenBefore = arr.length;
      arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_5500
     * @tc.name testFloat32ArraySomeTwo055
     * @tc.desc Verify some() does not mutate array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const lenBefore = arr.length;
      arr.some((element: number, index: int, array: Float32Array): boolean => array.length === 3);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_5600
     * @tc.name testFloat32ArraySomeTwo056
     * @tc.desc Verify some() does not mutate byteOffset of subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = parent.subarray(1, 4);
      const offBefore = view.byteOffset;
      view.some((element: number, index: int, array: Float32Array): boolean => element > 2);
      expect(view.byteOffset).assertEqual(offBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_5700
     * @tc.name testFloat32ArraySomeTwo057
     * @tc.desc Verify some() does not mutate byteOffset (still 0 after call)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 2.0, 3.0]);
      arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_5800
     * @tc.name testFloat32ArraySomeTwo058
     * @tc.desc Verify some(element>5) does not mutate $_get(0) on [10,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 1.0, 2.0]);
      const before0 = arr.$_get(0);
      arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      const element069 = arr.$_get(0);
      expect(element069).assertEqual(before0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_5900
     * @tc.name testFloat32ArraySomeTwo059
     * @tc.desc Verify some(element>10) does not mutate $_get(0) on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const before0 = arr.$_get(0);
      arr.some((element: number, index: int, array: Float32Array): boolean => element > 10);
      const element070 = arr.$_get(0);
      expect(element070).assertEqual(before0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_6000
     * @tc.name testFloat32ArraySomeTwo060
     * @tc.desc Verify some(element>5) does not mutate $_get(2) on [1,1,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 1.0, 10.0]);
      const beforeLast = arr.$_get(2);
      arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      const element071 = arr.$_get(2);
      expect(element071).assertEqual(beforeLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_6100
     * @tc.name testFloat32ArraySomeTwo061
     * @tc.desc Verify some(element>10) does not mutate $_get(2) on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const beforeLast = arr.$_get(2);
      arr.some((element: number, index: int, array: Float32Array): boolean => element > 10);
      const element072 = arr.$_get(2);
      expect(element072).assertEqual(beforeLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_6200
     * @tc.name testFloat32ArraySomeTwo062
     * @tc.desc Verify some(element>5) on [10,2,3] preserves $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 2.0, 3.0]);
      const before0 = arr.$_get(0);
      arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      const element073 = arr.$_get(0);
      expect(element073).assertEqual(before0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_6300
     * @tc.name testFloat32ArraySomeTwo063
     * @tc.desc Verify some(element>5) on [1,10,3] preserves $_get(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 10.0, 3.0]);
      const beforeMid = arr.$_get(1);
      arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      const element074 = arr.$_get(1);
      expect(element074).assertEqual(beforeMid);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_6400
     * @tc.name testFloat32ArraySomeTwo064
     * @tc.desc Verify some(element>10) does not mutate array elements on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      arr.some((element: number, index: int, array: Float32Array): boolean => element > 10);
      const element075 = arr.$_get(0);
      expect(element075).assertEqual(1.0);
      const element075Part2 = arr.$_get(1);
      expect(element075Part2).assertEqual(2.0);
      const element075Part3 = arr.$_get(2);
      expect(element075Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_6500
     * @tc.name testFloat32ArraySomeTwo065
     * @tc.desc Verify some() does not mutate the toString() output of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const tsBefore = arr.toString();
      arr.some((element: number, index: int, array: Float32Array): boolean => element > 1);
      const observedValue076 = arr.toString();
      expect(observedValue076).assertEqual(tsBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_6600
     * @tc.name testFloat32ArraySomeTwo066
     * @tc.desc Verify some() does not affect values() iterator - first element still accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 2.0, 3.0]);
      arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      const it = arr.values();
      const first = it.next();
      expect(first.value).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_6700
     * @tc.name testFloat32ArraySomeTwo067
     * @tc.desc Verify some() does not affect values() iterator - second element still accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 20.0, 3.0]);
      arr.some((element: number, index: int, array: Float32Array): boolean => element > 15);
      const it = arr.values();
      it.next();
      const second = it.next();
      expect(second.value).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_6800
     * @tc.name testFloat32ArraySomeTwo068
     * @tc.desc Verify some Float32Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const before = Float32Array.from(arr);
      arr.some((element: number, index: int, array: Float32Array): boolean => element > 2);
      const element079 = before.$_get(0);
      expect(element079).assertEqual(arr.$_get(0));
      const element079Part2 = before.$_get(1);
      expect(element079Part2).assertEqual(arr.$_get(1));
      const element079Part3 = before.$_get(2);
      expect(element079Part3).assertEqual(arr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_6900
     * @tc.name testFloat32ArraySomeTwo069
     * @tc.desc Verify some(array.$_get(0)>5) does not mutate array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 2.0, 3.0]);
      const before0 = arr.$_get(0);
      arr.some((element: number, index: int, array: Float32Array): boolean => array.$_get(0) > 5);
      const element080 = arr.$_get(0);
      expect(element080).assertEqual(before0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_7000
     * @tc.name testFloat32ArraySomeTwo070
     * @tc.desc Verify some(element>10) does not mutate $_get(1) on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      let count = 0;
      const before1 = arr.$_get(1);
      arr.some((element: number, index: int, array: Float32Array): boolean => { count = count + 1; return element > 10; });
      expect(count).assertEqual(arr.length);
      const element081 = arr.$_get(1);
      expect(element081).assertEqual(before1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_7100
     * @tc.name testFloat32ArraySomeTwo071
     * @tc.desc Verify some() does not mutate buffer reference of subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = parent.subarray(1, 4);
      view.some((element: number, index: int, array: Float32Array): boolean => element > 2);
      expect(view.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_7200
     * @tc.name testFloat32ArraySomeTwo072
     * @tc.desc Verify some on subarray does not mutate parent elements outside subarray range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = parent.subarray(1, 4);
      view.some((element: number, index: int, array: Float32Array): boolean => element > 2);
      const element087 = parent.$_get(0);
      expect(element087).assertEqual(1.0);
      const element087Part2 = parent.$_get(4);
      expect(element087Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_7300
     * @tc.name testFloat32ArraySomeTwo073
     * @tc.desc Verify some on parent does not mutate existing subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = parent.subarray(1, 4);
      const element088 = view.$_get(0);
      parent.some((element: number, index: int, array: Float32Array): boolean => element > 2);
      const element088Part2 = view.$_get(0);
      expect(element088Part2).assertEqual(element088);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_7400
     * @tc.name testFloat32ArraySomeTwo074
     * @tc.desc Verify some on one view does not affect another view of same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const observedValue089: Float32Array = new Float32Array(buf, 0, 2);
      const observedValue089Part2: Float32Array = new Float32Array(buf, 8, 2);
      observedValue089.$_set(0, 10.0);
      observedValue089Part2.$_set(0, 1.0);
      const v2before0 = observedValue089Part2.$_get(0);
      observedValue089.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      const element089 = observedValue089Part2.$_get(0);
      expect(element089).assertEqual(v2before0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_7500
     * @tc.name testFloat32ArraySomeTwo075
     * @tc.desc Verify some on subarray does not change view.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = parent.subarray(1, 4);
      const vlen = view.length;
      view.some((element: number, index: int, array: Float32Array): boolean => element > 2);
      expect(view.length).assertEqual(vlen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_7600
     * @tc.name testFloat32ArraySomeTwo076
     * @tc.desc Verify some on subarray does not change parent byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = parent.subarray(1, 4);
      const pbl = parent.byteLength;
      view.some((element: number, index: int, array: Float32Array): boolean => element > 2);
      expect(parent.byteLength).assertEqual(pbl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_7700
     * @tc.name testFloat32ArraySomeTwo077
     * @tc.desc Verify some on ArrayBuffer-backed view does not change byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const arr: Float32Array = new Float32Array(buf, 4, 4);
      arr.$_set(0, 10.0);
      const blBefore = arr.byteLength;
      arr.some((element: number, index: int, array: Float32Array): boolean => element > 5);
      expect(arr.byteLength).assertEqual(blBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_7800
     * @tc.name testFloat32ArraySomeTwo078
     * @tc.desc Verify 3 some byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      arr.some((element: number, index: int, array: Float32Array): boolean => element > 1);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SOME_TWO_7900
     * @tc.name testFloat32ArraySomeTwo079
     * @tc.desc Verify repeated some(element>4) calls on [1,5,3] both return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySomeTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 5.0, 3.0]);
      const r1: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 4);
      const r2: boolean = arr.some((element: number, index: int, array: Float32Array): boolean => element > 4);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
    });

  });
}
