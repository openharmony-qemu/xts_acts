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
import Utils from '../Util.test';

export default function int8ArrayLastIndexOfPart02Test(): void {
  describe('Int8ArrayLastIndexOfPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_0100
     * @tc.name int8ArrayLastIndexOfPart02Test001
     * @tc.desc Verify lastIndexOf(10) returns index 1 for array [5, 10, 15]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 10, 15]);
      let result: int = arr.lastIndexOf(10);
      let expectedIndex: int = 1;
      expect(result).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_0200
     * @tc.name int8ArrayLastIndexOfPart02Test002
     * @tc.desc Verify lastIndexOf(99) returns -1 when element is not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 10, 15]);
      let result: int = arr.lastIndexOf(99);
      let expectedIndex: int = -1;
      expect(result).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_0300
     * @tc.name int8ArrayLastIndexOfPart02Test003
     * @tc.desc Verify lastIndexOf(2) returns index 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: int = arr.lastIndexOf(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_0400
     * @tc.name int8ArrayLastIndexOfPart02Test004
     * @tc.desc Verify lastIndexOf(7) returns index 0 when searchElement is at first position in 3-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8, 9]);
      let result: int = arr.lastIndexOf(7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_0500
     * @tc.name int8ArrayLastIndexOfPart02Test005
     * @tc.desc Verify lastIndexOf(42) returns index 0 for single-element array with matching value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let result: int = arr.lastIndexOf(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_0600
     * @tc.name int8ArrayLastIndexOfPart02Test006
     * @tc.desc Verify lastIndexOf returns length-1 for repeated element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 3, 3, 3]);
      let result: int = arr.lastIndexOf(3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_0700
     * @tc.name int8ArrayLastIndexOfPart02Test007
     * @tc.desc Verify all same elements hit returns last index (length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      let result: int = arr.lastIndexOf(5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_0800
     * @tc.name int8ArrayLastIndexOfPart02Test008
     * @tc.desc Verify lastIndexOf(10) returns index 0 when target is first of two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let result: int = arr.lastIndexOf(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_0900
     * @tc.name int8ArrayLastIndexOfPart02Test009
     * @tc.desc Verify lastIndexOf(20) returns index 1 when target is second of two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let result: int = arr.lastIndexOf(20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_1000
     * @tc.name int8ArrayLastIndexOfPart02Test010
     * @tc.desc Verify lastIndexOf fromIndex=0 returns index 0 for repeated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      let result: int = arr.lastIndexOf(5, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_1100
     * @tc.name int8ArrayLastIndexOfPart02Test011
     * @tc.desc Verify lastIndexOf with fromIndex=3 searches up to index 3 for duplicate value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([2, 1, 2, 3, 2]);
      let result: int = arr.lastIndexOf(2, 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_1200
     * @tc.name int8ArrayLastIndexOfPart02Test012
     * @tc.desc Verify lastIndexOf with fromIndex=-1 searches only last element position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let result: int = arr.lastIndexOf(4, 2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_1300
     * @tc.name int8ArrayLastIndexOfPart02Test013
     * @tc.desc Verify lastIndexOf clamps fromIndex 100 to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 1, 2]);
      let result: int = arr.lastIndexOf(2, 100);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_1400
     * @tc.name int8ArrayLastIndexOfPart02Test014
     * @tc.desc Verify lastIndexOf fromIndex=-1 searches full range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([9, 2, 3, 4]);
      let result: int = arr.lastIndexOf(9, -1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_1500
     * @tc.name int8ArrayLastIndexOfPart02Test015
     * @tc.desc Verify fromIndex=-2 skips last element, searchElement at last position returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 9]);
      let result: int = arr.lastIndexOf(9, -2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_1600
     * @tc.name int8ArrayLastIndexOfPart02Test016
     * @tc.desc Verify lastIndexOf fromIndex=-2 finds value at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let result: int = arr.lastIndexOf(3, -2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_1700
     * @tc.name int8ArrayLastIndexOfPart02Test017
     * @tc.desc Verify lastIndexOf fromIndex=-length finds first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8, 9]);
      let result: int = arr.lastIndexOf(7, -3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_1800
     * @tc.name int8ArrayLastIndexOfPart02Test018
     * @tc.desc Verify lastIndexOf(7) returns -1 when value not found in single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let result: int = arr.lastIndexOf(7);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_1900
     * @tc.name int8ArrayLastIndexOfPart02Test019
     * @tc.desc Verify lastIndexOf with fromIndex=-1 when searchElement is at last position returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: int = arr.lastIndexOf(3, 1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_2000
     * @tc.name int8ArrayLastIndexOfPart02Test020
     * @tc.desc Verify lastIndexOf with fromIndex=-1 when searchElement is not at last position returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: int = arr.lastIndexOf(0, 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_2100
     * @tc.name int8ArrayLastIndexOfPart02Test021
     * @tc.desc Verify lastIndexOf(9) returns -1 when value not in uniform array of 5s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      let result: int = arr.lastIndexOf(9);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_2200
     * @tc.name int8ArrayLastIndexOfPart02Test022
     * @tc.desc Verify lastIndexOf(0) returns -1 when zero not present in array of -1 and 1-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 1, -1, 1]);
      let result: int = arr.lastIndexOf(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_2300
     * @tc.name int8ArrayLastIndexOfPart02Test023
     * @tc.desc Verify lastIndexOf(0) returns index 1 for array [1, 0, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, 2]);
      let result: int = arr.lastIndexOf(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_2400
     * @tc.name int8ArrayLastIndexOfPart02Test024
     * @tc.desc Verify lastIndexOf(-1) returns index 1 for array [0, -1, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, -1, 0]);
      let result: int = arr.lastIndexOf(-1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_2500
     * @tc.name int8ArrayLastIndexOfPart02Test025
     * @tc.desc Verify lastIndexOf(INT8_MIN) returns correct last occurrence index when INT8_MIN appears multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 0, INT8_MIN, 0, INT8_MIN]);
      let result: int = arr.lastIndexOf(-128);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_2600
     * @tc.name int8ArrayLastIndexOfPart02Test026
     * @tc.desc Verify lastIndexOf 0 -128 -128 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, INT8_MIN, 0, INT8_MIN, 0]);
      let result: int = arr.lastIndexOf(-128);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_2700
     * @tc.name int8ArrayLastIndexOfPart02Test027
     * @tc.desc Verify length unchanged after lastIndexOf call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let before: int = arr.length;
      let resultVal1: number = arr.lastIndexOf(2);
      let expectedVal1: number = 1;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualLength: int = arr.length;
      let expectedLength = before;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_2800
     * @tc.name int8ArrayLastIndexOfPart02Test028
     * @tc.desc Verify lastIndexOf isView true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: number = arr.lastIndexOf(2);
      let expectedVal1: number = 1;
      expect(resultVal1).assertEqual(expectedVal1);
      let isViewResult: boolean = ArrayBuffer.isView(arr);
      expect(isViewResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_2900
     * @tc.name int8ArrayLastIndexOfPart02Test029
     * @tc.desc Verify subarray shares buffer with parent after lastIndexOf (write child read parent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let view: Int8Array = arr.subarray(1, 3);
      let resultVal1: number = view.lastIndexOf(2);
      let expectedVal1: number = 0;
      expect(resultVal1).assertEqual(expectedVal1);
      view.$_set(0, 99);
      let actualValue: number = arr.$_get(1);
      let expectedValue: int = 99;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_3000
     * @tc.name int8ArrayLastIndexOfPart02Test030
     * @tc.desc Verify lastIndexOf on subarray view keeps shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let view: Int8Array = arr.subarray(1, 3);
      let resultVal1: number = view.lastIndexOf(2);
      let expectedVal1: number = 0;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualBuffer: ArrayBuffer = view.buffer;
      let expectedBuffer: ArrayBuffer = arr.buffer;
      expect(actualBuffer).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_3100
     * @tc.name int8ArrayLastIndexOfPart02Test031
     * @tc.desc Verify lastIndexOf keeps view length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 4, 2);
      let resultVal1: number = arr.lastIndexOf(0);
      let expectedVal1: number = 1;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualLength: int = arr.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_3200
     * @tc.name int8ArrayLastIndexOfPart02Test032
     * @tc.desc Verify lastIndexOf keeps view byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      let resultVal1: number = arr.lastIndexOf(0);
      let expectedVal1: number = 3;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 4;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_3300
     * @tc.name int8ArrayLastIndexOfPart02Test033
     * @tc.desc Verify multi-view shared buffer still interoperable after lastIndexOf (write secondValue read parent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let firstValue: Int8Array = arr.subarray(0, 2);
      let secondValue: Int8Array = arr.subarray(2, 4);
      let resultVal1: number = firstValue.lastIndexOf(1);
      let expectedVal1: number = 0;
      expect(resultVal1).assertEqual(expectedVal1);
      secondValue.$_set(0, 77);
      let actualValue: number = arr.$_get(2);
      let expectedValue: int = 77;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_3400
     * @tc.name int8ArrayLastIndexOfPart02Test034
     * @tc.desc Verify parent data still visible to subview after lastIndexOf (write parent read child)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8, 9]);
      let view: Int8Array = arr.subarray(0, 2);
      let resultVal1: number = arr.lastIndexOf(8);
      let expectedVal1: number = 1;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: number = view.$_get(1);
      let expectedValue: int = 8;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_3500
     * @tc.name int8ArrayLastIndexOfPart02Test035
     * @tc.desc Verify idempotency: two consecutive lastIndexOf calls return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 3, 1, 3]);
      let r1: int = arr.lastIndexOf(3);
      let r2: int = arr.lastIndexOf(3);
      expect(r1).assertEqual(4);
      expect(r2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_3600
     * @tc.name int8ArrayLastIndexOfPart02Test036
     * @tc.desc Verify fromIndex call does not affect subsequent default lastIndexOf call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([2, 1, 2, 1, 2]);
      let r1: int = arr.lastIndexOf(2, 1);
      let r2: int = arr.lastIndexOf(2);
      expect(r1).assertEqual(0);
      expect(r2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_3700
     * @tc.name int8ArrayLastIndexOfPart02Test037
     * @tc.desc Verify lastIndexOf preserves includes(2) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: number = arr.lastIndexOf(2);
      let expectedVal1: number = 1;
      expect(resultVal1).assertEqual(expectedVal1);
      let includesResult: boolean = arr.includes(2);
      expect(includesResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_3800
     * @tc.name int8ArrayLastIndexOfPart02Test038
     * @tc.desc Verify lastIndexOf keeps byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: number = arr.lastIndexOf(2);
      let expectedVal1: number = 1;
      expect(resultVal1).assertEqual(expectedVal1);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_3900
     * @tc.name int8ArrayLastIndexOfPart02Test039
     * @tc.desc Verify lastIndexOf allows subarray of length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let resultVal1: number = arr.lastIndexOf(3);
      let expectedVal1: number = 2;
      expect(resultVal1).assertEqual(expectedVal1);
      let v: Int8Array = arr.subarray(1, 3);
      let actualLength: int = v.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART02_TEST_4000
     * @tc.name int8ArrayLastIndexOfPart02Test040
     * @tc.desc Verify lastIndexOf then $_set writes value 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: number = arr.lastIndexOf(2);
      let expectedVal1: number = 1;
      expect(resultVal1).assertEqual(expectedVal1);
      arr.$_set(0, 50);
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = 50;
      expect(actualValue).assertEqual(expectedValue);
    });
  });
}
