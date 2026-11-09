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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from './../Util.test';

export default function int8ArrayToSortedPart03Test(): void {
  describe('Int8ArrayToSortedPart03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_0100
     * @tc.name int8ArrayToSortedPart03Test001
     * @tc.desc Verify toSorted returns new array sorted ascending, original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let result: Int8Array = arr.toSorted();
      let resultVal: number = result.$_get(0);
      let expectedVal: int = 1;
      expect(resultVal).assertEqual(expectedVal);
      let resultVal2: number = result.$_get(2);
      let expectedVal2: int = 3;
      expect(resultVal2).assertEqual(expectedVal2);
      let resultVal3: number = arr.$_get(0);
      let expectedVal3: int = 3;
      expect(resultVal3).assertEqual(expectedVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_0200
     * @tc.name int8ArrayToSortedPart03Test002
     * @tc.desc Verify toSorted sorts ascending, original array first element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let result: Int8Array = arr.toSorted();
      let resultVal: number = result.$_get(0);
      let expectedVal: int = 1;
      expect(resultVal).assertEqual(expectedVal);
      let resultVal2: number = arr.$_get(0);
      let expectedVal2: int = 3;
      expect(resultVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_0300
     * @tc.name int8ArrayToSortedPart03Test003
     * @tc.desc Verify toSorted keeps original array and result array lengths equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let originalLen: number = arr.length;
      let result: Int8Array = arr.toSorted();
      let resultLen: int = arr.length;
      let expectedVal: number = originalLen;
      expect(resultLen).assertEqual(expectedVal);
      let resultLen2: int = result.length;
      let expectedVal2: number = originalLen;
      expect(resultLen2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_0400
     * @tc.name int8ArrayToSortedPart03Test004
     * @tc.desc Verify toSorted leaves original array first element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let firstVal: number = arr[0];
      arr.toSorted();
      let resultVal: number = arr[0];
      let expectedVal: number = firstVal;
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_0500
     * @tc.name int8ArrayToSortedPart03Test005
     * @tc.desc Verify toSorted leaves original array last element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let lastVal: number = arr[arr.length - 1];
      arr.toSorted();
      let resultLen: number = arr[arr.length - 1];
      let expectedVal: number = lastVal;
      expect(resultLen).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_0600
     * @tc.name int8ArrayToSortedPart03Test006
     * @tc.desc Verify toSorted keeps original array buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let buf: ArrayBuffer = arr.buffer;
      arr.toSorted();
      let resultBuf: ArrayBuffer = arr.buffer;
      let expectedVal: ArrayBuffer = buf;
      expect(resultBuf).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_0700
     * @tc.name int8ArrayToSortedPart03Test007
     * @tc.desc Verify toSorted result array length equals original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let result: Int8Array = arr.toSorted();
      let resultLen: int = result.length;
      let expectedVal: int = arr.length;
      expect(resultLen).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_0800
     * @tc.name int8ArrayToSortedPart03Test008
     * @tc.desc Verify toSorted result array byteLength equals original array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let result: Int8Array = arr.toSorted();
      let resultByteLen: int = result.byteLength;
      let expectedVal: int = arr.byteLength;
      expect(resultByteLen).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_0900
     * @tc.name int8ArrayToSortedPart03Test009
     * @tc.desc Verify repeated toSorted calls produce arrays of equal length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      let r1: Int8Array = arr.toSorted();
      let r2: Int8Array = arr.toSorted();
      let resultLen: int = r1.length;
      let expectedVal: int = r2.length;
      expect(resultLen).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_1000
     * @tc.name int8ArrayToSortedPart03Test010
     * @tc.desc Verify toSorted default ascending sort, result array element-wise ascending from minimum to maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let result: Int8Array = arr.toSorted();
      let resultVal: number = result[0];
      let expectedVal: int = 1;
      expect(resultVal).assertEqual(expectedVal);
      let resultVal2: number = result[1];
      let expectedVal2: int = 2;
      expect(resultVal2).assertEqual(expectedVal2);
      let resultVal3: number = result[2];
      let expectedVal3: int = 3;
      expect(resultVal3).assertEqual(expectedVal3);
      let resultVal4: number = result[3];
      let expectedVal4: int = 4;
      expect(resultVal4).assertEqual(expectedVal4);
      let resultVal5: number = result[4];
      let expectedVal5: int = 5;
      expect(resultVal5).assertEqual(expectedVal5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_1100
     * @tc.name int8ArrayToSortedPart03Test011
     * @tc.desc Verify toSorted leaves original array first and last elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let snap: Int8Array = new Int8Array(arr);
      arr.toSorted();
      let resultVal: number = arr[0];
      let expectedVal: number = snap[0];
      expect(resultVal).assertEqual(expectedVal);
      let resultVal2: number = arr[4];
      let expectedVal2: number = snap[4];
      expect(resultVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_1200
     * @tc.name int8ArrayToSortedPart03Test012
     * @tc.desc Verify toSorted result array length preserved for 5-element constructor-created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let result: Int8Array = arr.toSorted();
      let resultLen: int = result.length;
      let expectedVal: int = 5;
      expect(resultLen).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_1300
     * @tc.name int8ArrayToSortedPart03Test013
     * @tc.desc Verify toSorted result array independent, modifying copy does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let result: Int8Array = arr.toSorted();
      result[0] = 99;
      let resultVal: number = arr[0];
      let expectedVal: int = 5;
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_1400
     * @tc.name int8ArrayToSortedPart03Test014
     * @tc.desc Verify toSorted original array first element matches snapshot before sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let snap: Int8Array = new Int8Array(arr);
      arr.toSorted();
      let resultVal: number = arr[0];
      let expectedVal: number = snap[0];
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_1500
     * @tc.name int8ArrayToSortedPart03Test015
     * @tc.desc Verify toSorted returns new array distinct from original, length preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let result: Int8Array = arr.toSorted();
      expect(result).not().assertEqual(arr);
      let resultLen: int = result.length;
      let expectedVal: int = 5;
      expect(resultLen).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_1600
     * @tc.name int8ArrayToSortedPart03Test016
     * @tc.desc Verify toSorted on duplicate-value array does not crash, length preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5, 3, 3]);
      let result: Int8Array = arr.toSorted();
      let resultLen: int = result.length;
      let expectedVal: int = 5;
      expect(resultLen).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_1700
     * @tc.name int8ArrayToSortedPart03Test017
     * @tc.desc Verify toSorted result array first element is minimum after default ascending sort on 5-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let result: Int8Array = arr.toSorted();
      let resultVal: number = result[0];
      let expectedVal: int = 1;
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_1800
     * @tc.name int8ArrayToSortedPart03Test018
     * @tc.desc Verify toSorted result array last element is maximum after default ascending sort on 3-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1]);
      let result: Int8Array = arr.toSorted();
      let resultVal: number = result[2];
      let expectedVal: int = 5;
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_1900
     * @tc.name int8ArrayToSortedPart03Test019
     * @tc.desc Verify toSorted result array length equals original array length and first element sorted ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1]);
      let result: Int8Array = arr.toSorted();
      let resultLen: int = result.length;
      let expectedVal: int = 3;
      expect(resultLen).assertEqual(expectedVal);
      let resultVal2: number = result[0];
      let expectedVal2: int = 1;
      expect(resultVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_2000
     * @tc.name int8ArrayToSortedPart03Test020
     * @tc.desc Verify toSorted sorts ascending, first element minimum and last maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let result: Int8Array = arr.toSorted();
      let resultVal: number = result[0];
      let expectedVal: int = 1;
      expect(resultVal).assertEqual(expectedVal);
      let resultVal2: number = result[4];
      let expectedVal2: int = 5;
      expect(resultVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_2100
     * @tc.name int8ArrayToSortedPart03Test021
     * @tc.desc Verify two-element array toSorted returns ascending order, smaller element becomes index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1]);
      let result: Int8Array = arr.toSorted();
      let resultVal: number = result[0];
      let expectedVal: int = 1;
      expect(resultVal).assertEqual(expectedVal);
      let resultVal2: number = result[1];
      let expectedVal2: int = 3;
      expect(resultVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_2200
     * @tc.name int8ArrayToSortedPart03Test022
     * @tc.desc Verify empty array toSorted() returns array not same reference as original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.toSorted();
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_2300
     * @tc.name int8ArrayToSortedPart03Test023
     * @tc.desc Verify single-element array toSorted() returns single-element array, element value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let result: Int8Array = arr.toSorted();
      let resultLen: int = result.length;
      let expectedVal: int = 1;
      expect(resultLen).assertEqual(expectedVal);
      let resultVal2: number = result[0];
      let expectedVal2: int = 42;
      expect(resultVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_2400
     * @tc.name int8ArrayToSortedPart03Test024
     * @tc.desc Verify single-element array toSorted() returns array not same reference as original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let result: Int8Array = arr.toSorted();
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_2500
     * @tc.name int8ArrayToSortedPart03Test025
     * @tc.desc Verify single-element array toSorted() result element value equals original element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let result: Int8Array = arr.toSorted();
      let resultVal: number = result[0];
      let expectedVal: number = arr[0];
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_2600
     * @tc.name int8ArrayToSortedPart03Test026
     * @tc.desc Verify all-equal elements toSorted() returns array element-wise equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7, 7]);
      let result: Int8Array = arr.toSorted();
      let resultVal: number = result[0];
      let expectedVal: int = 7;
      expect(resultVal).assertEqual(expectedVal);
      let resultVal2: number = result[1];
      let expectedVal2: int = 7;
      expect(resultVal2).assertEqual(expectedVal2);
      let resultVal3: number = result[2];
      let expectedVal3: int = 7;
      expect(resultVal3).assertEqual(expectedVal3);
      let resultVal4: number = result[3];
      let expectedVal4: int = 7;
      expect(resultVal4).assertEqual(expectedVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_2700
     * @tc.name int8ArrayToSortedPart03Test027
     * @tc.desc Verify all-equal elements toSorted() result array element-wise equal to original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      let result: Int8Array = arr.toSorted();
      let resultVal: number = result[0];
      let expectedVal: int = 7;
      expect(resultVal).assertEqual(expectedVal);
      let resultVal2: number = result[1];
      let expectedVal2: int = 7;
      expect(resultVal2).assertEqual(expectedVal2);
      let resultVal3: number = result[2];
      let expectedVal3: int = 7;
      expect(resultVal3).assertEqual(expectedVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_2800
     * @tc.name int8ArrayToSortedPart03Test028
     * @tc.desc Verify all-equal elements toSorted() returns array not same reference as original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7, 7]);
      let result: Int8Array = arr.toSorted();
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_2900
     * @tc.name int8ArrayToSortedPart03Test029
     * @tc.desc Verify all-equal elements toSorted() original array first and last elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7, 7]);
      let snap: Int8Array = new Int8Array(arr);
      arr.toSorted();
      let resultVal: number = arr[0];
      let expectedVal: number = snap[0];
      expect(resultVal).assertEqual(expectedVal);
      let resultVal2: number = arr[3];
      let expectedVal2: number = snap[3];
      expect(resultVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_3000
     * @tc.name int8ArrayToSortedPart03Test030
     * @tc.desc Verify toSorted result array modification does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let result: Int8Array = arr.toSorted();
      result[0] = -128;
      let resultVal: number = arr[0];
      let expectedVal: int = 5;
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_3100
     * @tc.name int8ArrayToSortedPart03Test031
     * @tc.desc Verify original array modification after toSorted does not affect result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let result: Int8Array = arr.toSorted();
      let resultFirst: number = result[0];
      arr[0] = 127;
      let resultVal: number = result[0];
      let expectedVal: number = resultFirst;
      expect(resultVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_3200
     * @tc.name int8ArrayToSortedPart03Test032
     * @tc.desc Verify toSorted result array buffer is different reference from original array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let result: Int8Array = arr.toSorted();
      expect(result.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_3300
     * @tc.name int8ArrayToSortedPart03Test033
     * @tc.desc Verify two consecutive toSorted calls return different instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let r1: Int8Array = arr.toSorted();
      let r2: Int8Array = arr.toSorted();
      expect(r1).not().assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_3400
     * @tc.name int8ArrayToSortedPart03Test034
     * @tc.desc Verify toSorted result array is not same reference as original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let result: Int8Array = arr.toSorted();
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_3500
     * @tc.name int8ArrayToSortedPart03Test035
     * @tc.desc Verify repeated toSorted calls sort ascending, first element minimum and last maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      arr.toSorted();
      let result: Int8Array = arr.toSorted();
      let resultVal: number = result[0];
      let expectedVal: int = 1;
      expect(resultVal).assertEqual(expectedVal);
      let resultVal2: number = result[4];
      let expectedVal2: int = 5;
      expect(resultVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_3600
     * @tc.name int8ArrayToSortedPart03Test036
     * @tc.desc Verify toSorted boundary values first min last max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, -1, 2, INT8_MIN, INT8_MAX]);
      let result: Int8Array = arr.toSorted();
      let resultVal: number = result[0];
      let expectedVal: number = INT8_MIN;
      expect(resultVal).assertEqual(expectedVal);
      let resultVal2: number = result[4];
      let expectedVal2: number = INT8_MAX;
      expect(resultVal2).assertEqual(expectedVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_3700
     * @tc.name int8ArrayToSortedPart03Test037
     * @tc.desc Verify toSorted reverse input fully ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 4, 3, 2, 1]);
      let result: Int8Array = arr.toSorted();
      let resultVal: number = result[0];
      let expectedVal: int = 1;
      expect(resultVal).assertEqual(expectedVal);
      let resultVal2: number = result[2];
      let expectedVal2: int = 3;
      expect(resultVal2).assertEqual(expectedVal2);
      let resultVal3: number = result[4];
      let expectedVal3: int = 5;
      expect(resultVal3).assertEqual(expectedVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_3800
     * @tc.name int8ArrayToSortedPart03Test038
     * @tc.desc Verify toSorted repeated calls deterministic first last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      let r1: Int8Array = arr.toSorted();
      let r2: Int8Array = arr.toSorted();
      let join1: string = r1.join(',');
      let join2: string = r2.join(',');
      let expectedJoin: string = '1,2,3,4,5';
      expect(join1).assertEqual(expectedJoin);
      expect(join2).assertEqual(expectedJoin);
      expect(r1).not().assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_3900
     * @tc.name int8ArrayToSortedPart03Test039
     * @tc.desc Verify toSorted() result array byteOffset equals 0, new copy starts at buffer origin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 3, 1]);
      let result: Int8Array = arr.toSorted();
      let resultByteOffset: int = result.byteOffset;
      let expectedVal: int = 0;
      expect(resultByteOffset).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSORTED_PART03_4000
     * @tc.name int8ArrayToSortedPart03Test040
     * @tc.desc Verify toSorted duplicates preserve equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToSortedPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 3, 1, 3]);
      let result: Int8Array = arr.toSorted();
      let resultVal: number = result[0];
      let expectedVal: int = 1;
      expect(resultVal).assertEqual(expectedVal);
      let resultVal2: number = result[1];
      let expectedVal2: int = 1;
      expect(resultVal2).assertEqual(expectedVal2);
      let resultVal3: number = result[3];
      let expectedVal3: int = 3;
      expect(resultVal3).assertEqual(expectedVal3);
      let resultVal4: number = result[4];
      let expectedVal4: int = 3;
      expect(resultVal4).assertEqual(expectedVal4);
    });
  });
}
