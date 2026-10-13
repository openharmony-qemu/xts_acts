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
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function int8ArraySortPart02Test(): void {
  describe('Int8ArraySortPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_0100
     * @tc.name int8ArraySortPart02Test001
     * @tc.desc Verify sort() Int8Array returns sorted view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 1, 2]);
      const result = arr.sort();
      expect(ArrayBuffer.isView(result)).assertTrue();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_0200
     * @tc.name int8ArraySortPart02Test002
     * @tc.desc Verify sort(compareFn) result is ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 1, 2]);
      const fn: (a: number, b: number) => int = (a: number, b: number) => {
        return a > b ? 1 : a < b ? -1 : 0;
      };
      const result = arr.sort(fn);
      expect(ArrayBuffer.isView(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_0300
     * @tc.name int8ArraySortPart02Test003
     * @tc.desc Verify sort() typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3]);
      const result = arr.sort();
      expect(ArrayBuffer.isView(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_0400
     * @tc.name int8ArraySortPart02Test004
     * @tc.desc Verify sort() Int8Array on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(0);
      const result = arr.sort();
      expect(ArrayBuffer.isView(result)).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_0500
     * @tc.name int8ArraySortPart02Test005
     * @tc.desc Verify sort() Int8Array on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(5);
      const result = arr.sort();
      expect(ArrayBuffer.isView(result)).assertTrue();
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_0900
     * @tc.name int8ArraySortPart02Test009
     * @tc.desc Verify sort() ascending sets -3 at index 0 as the smallest element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([-1, -3, 2, 1]);
      arr.sort();
      let result = arr.$_get(0);
      let expected = -3;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_1000
     * @tc.name int8ArraySortPart02Test010
     * @tc.desc Verify sort() ascending sets 2 at index 3 as the largest element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([-1, -3, 2, 1]);
      arr.sort();
      let result = arr.$_get(3);
      let expected = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_1100
     * @tc.name int8ArraySortPart02Test011
     * @tc.desc Verify sort int8 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([INT8_MIN, INT8_MAX, 0]);
      arr.sort();
      let result = arr.$_get(0);
      let expected = INT8_MIN;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_1200
     * @tc.name int8ArraySortPart02Test012
     * @tc.desc Verify sort int8 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([INT8_MIN, INT8_MAX, 0]);
      arr.sort();
      let result = arr.$_get(2);
      let expected = INT8_MAX;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_1300
     * @tc.name int8ArraySortPart02Test013
     * @tc.desc Verify sort() on zeros keeps element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0, 0, 0]);
      arr.sort();
      let result = arr.$_get(1);
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_1400
     * @tc.name int8ArraySortPart02Test014
     * @tc.desc Verify sort() ascending sets INT8_MIN at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([INT8_MAX, INT8_MAX, INT8_MIN, INT8_MIN]);
      arr.sort();
      let result = arr.$_get(0);
      let expected = INT8_MIN;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_1500
     * @tc.name int8ArraySortPart02Test015
     * @tc.desc Verify sort [1,2,3] $_get(0) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3]);
      const desc: (a: number, b: number) => int = (a: number, b: number) => {
        return b > a ? 1 : b < a ? -1 : 0;
      };
      arr.sort(desc);
      let result = arr.$_get(0);
      let expected = 3;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_1600
     * @tc.name int8ArraySortPart02Test016
     * @tc.desc Verify sort [1,2,3] $_get(2) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3]);
      const desc: (a: number, b: number) => int = (a: number, b: number) => {
        return b > a ? 1 : b < a ? -1 : 0;
      };
      arr.sort(desc);
      let result = arr.$_get(2);
      let expected = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_1700
     * @tc.name int8ArraySortPart02Test017
     * @tc.desc Verify sort(desc_compareFn) descending sets INT8_MAX at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([INT8_MIN, 0, INT8_MAX]);
      const desc: (a: number, b: number) => int = (a: number, b: number) => {
        return b > a ? 1 : b < a ? -1 : 0;
      };
      arr.sort(desc);
      let result = arr.$_get(0);
      let expected = INT8_MAX;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_1800
     * @tc.name int8ArraySortPart02Test018
     * @tc.desc Verify [3,1,2] sort() length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 1, 2]);
      const result = arr.sort();
      let actualVal: int = result.length;
      let expectedVal: int = 3;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_1900
     * @tc.name int8ArraySortPart02Test019
     * @tc.desc Verify [3,1,2] sort() byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 1, 2]);
      const result = arr.sort();
      let actualVal: int = result.byteOffset;
      let expectedVal: int = 0;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_2000
     * @tc.name int8ArraySortPart02Test020
     * @tc.desc Verify sort() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(0);
      const result = arr.sort();
      let actualVal: int = result.length;
      let expectedVal: int = 0;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_2100
     * @tc.name int8ArraySortPart02Test021
     * @tc.desc Verify sort() length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(7);
      const result = arr.sort();
      let actualVal: int = result.length;
      let expectedVal: int = 1;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_2200
     * @tc.name int8ArraySortPart02Test022
     * @tc.desc Verify byteOffset=4 sort() byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Int8Array(buf, 4, 3);
      view.$_set(0, 3);
      view.$_set(1, 1);
      view.$_set(2, 2);
      const result = view.sort();
      let actualVal: int = result.byteOffset;
      let expectedVal: int = 4;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_2300
     * @tc.name int8ArraySortPart02Test023
     * @tc.desc Verify byteOffset=2 sort() length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Int8Array(buf, 2, 3);
      view.$_set(0, 3);
      view.$_set(1, 1);
      view.$_set(2, 2);
      const result = view.sort();
      let actualVal: int = result.length;
      let expectedVal: int = 3;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_2400
     * @tc.name int8ArraySortPart02Test024
     * @tc.desc Verify sort() buffer.byteLength buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 1, 2]);
      const bufLenBefore = arr.buffer.byteLength;
      arr.sort();
      let result = arr.buffer.byteLength;
      let expected = bufLenBefore;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_3000
     * @tc.name int8ArraySortPart02Test030
     * @tc.desc Verify sort() keeps byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 1, 2]);
      const offsetBefore = arr.byteOffset;
      arr.sort();
      let result = arr.byteOffset;
      let expected = offsetBefore;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_3200
     * @tc.name int8ArraySortPart02Test032
     * @tc.desc Verify sort().reverse() result is ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 1, 2]);
      const result = arr.sort().reverse();
      expect(ArrayBuffer.isView(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_3300
     * @tc.name int8ArraySortPart02Test033
     * @tc.desc Verify sort().subarray(0) result is ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 1, 2]);
      const result = arr.sort().subarray(0);
      expect(ArrayBuffer.isView(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_3500
     * @tc.name int8ArraySortPart02Test035
     * @tc.desc Verify sort( ).at(0) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 3, 2]);
      const desc: (a: number, b: number) => int = (a: number, b: number) => {
        return b > a ? 1 : b < a ? -1 : 0;
      };
      const first = arr.sort(desc).at(0);
      expect(first).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_3600
     * @tc.name int8ArraySortPart02Test036
     * @tc.desc Verify sort() buffer buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 1, 2]);
      const bufBefore = arr.buffer;
      arr.sort();
      let result = arr.buffer;
      let expected = bufBefore;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_3700
     * @tc.name int8ArraySortPart02Test037
     * @tc.desc Verify byteOffset=5 sort() byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const view = new Int8Array(buf, 5, 3);
      view.$_set(0, 3);
      view.$_set(1, 1);
      view.$_set(2, 2);
      const offsetBefore = view.byteOffset;
      view.sort();
      let actualVal: int = view.byteOffset;
      let expectedVal: int = offsetBefore;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_3800
     * @tc.name int8ArraySortPart02Test038
     * @tc.desc Verify sort() subarray(0) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 1, 2]);
      arr.sort();
      const sub = arr.subarray(0);
      let actualVal: ArrayBuffer = sub.buffer;
      let expectedVal: ArrayBuffer = arr.buffer;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_3900
     * @tc.name int8ArraySortPart02Test039
     * @tc.desc Verify sort() on view1 does not affect view2 sharing the same ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const view1 = new Int8Array(buf, 0, 3);
      const view2 = new Int8Array(buf, 3, 3);
      view1.$_set(0, 3);
      view1.$_set(1, 1);
      view1.$_set(2, 2);
      view2.$_set(0, 6);
      view2.$_set(1, 5);
      view2.$_set(2, 4);
      view1.sort();
      let actualVal: number = view2.$_get(0);
      let expectedVal: int = 6;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_4000
     * @tc.name int8ArraySortPart02Test040
     * @tc.desc Verify sort() byteLength length int8 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 1, 2]);
      const result = arr.sort();
      let actualVal: int = result.byteLength;
      let expectedVal: int = result.length;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_6200
     * @tc.name int8ArraySortPart02Test062
     * @tc.desc Verify sort() leaves single element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(42);
      arr.sort();
      let result = arr.$_get(0);
      let expected = 42;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_6300
     * @tc.name int8ArraySortPart02Test063
     * @tc.desc Verify sort(compareFn) callCount 0 on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(7);
      let callCount: int = 0;
      const fn: (a: number, b: number) => int = (a: number, b: number) => {
        callCount = callCount + 1;
        return a > b ? 1 : a < b ? -1 : 0;
      };
      arr.sort(fn);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_6400
     * @tc.name int8ArraySortPart02Test064
     * @tc.desc Verify sort() then toString() returns '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 1, 2]);
      arr.sort();
      let result = arr.toString();
      let expected = '1,2,3';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_6500
     * @tc.name int8ArraySortPart02Test065
     * @tc.desc Verify sort() then join(',') returns '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 1, 2]);
      arr.sort();
      let result = arr.join(',');
      let expected = '1,2,3';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_6600
     * @tc.name int8ArraySortPart02Test066
     * @tc.desc Verify sort() at(-1) 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0, INT8_MAX, INT8_MIN]);
      arr.sort();
      let result = arr.at(-1);
      let expected = INT8_MAX;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_6700
     * @tc.name int8ArraySortPart02Test067
     * @tc.desc Verify sort( ) at(0) 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0, INT8_MAX, INT8_MIN]);
      const desc: (a: number, b: number) => int = (a: number, b: number) => {
        return b > a ? 1 : b < a ? -1 : 0;
      };
      arr.sort(desc);
      let result = arr.at(0);
      let expected = INT8_MAX;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_6900
     * @tc.name int8ArraySortPart02Test069
     * @tc.desc Verify sort() indexOf( ) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0, INT8_MIN, INT8_MAX]);
      arr.sort();
      let result = arr.indexOf(-128);
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SORT_PART02_TEST_7000
     * @tc.name int8ArraySortPart02Test070
     * @tc.desc Verify sort( ) lastIndexOf( ) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySortPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0, INT8_MAX, INT8_MIN]);
      const desc: (a: number, b: number) => int = (a: number, b: number) => {
        return b > a ? 1 : b < a ? -1 : 0;
      };
      arr.sort(desc);
      let result = arr.lastIndexOf(127);
      let expected = 0;
      expect(result).assertEqual(expected);
    });
  });
}
