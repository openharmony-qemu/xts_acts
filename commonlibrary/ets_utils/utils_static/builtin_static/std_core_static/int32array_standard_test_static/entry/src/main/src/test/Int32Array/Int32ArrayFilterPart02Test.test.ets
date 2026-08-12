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
export default function int32ArrayFilterPart02Test(): void {
  describe('Int32ArrayFilterPart02Test', (): void => {
        beforeAll((): void => {
        });
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(30);
        });
        afterEach((): void => {
        });
        afterAll((): void => {
        });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayFilterPart02TestMindmapTest001
     * @tc.desc Verify filter return is instanceof Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 0);
      expect(r.length).assertEqual(3);
      arr.$_set(0, 99);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayFilterPart02TestMindmapTest002
     * @tc.desc Verify filter return name property is Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 1);
      expect(r.name).assertEqual('Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayFilterPart02TestMindmapTest003
     * @tc.desc Verify filter return is not a plain Array via BYTES_PER_ELEMENT check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 0);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
      expect(r.buffer.byteLength).assertEqual(r.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayFilterPart02TestMindmapTest004
     * @tc.desc Verify filter returns elements matching predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 0);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayFilterPart02TestMindmapTest005
     * @tc.desc Verify all-no-match filter returns non-null result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 100);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayFilterPart02TestMindmapTest006
     * @tc.desc Verify empty-source filter returns Int32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => true);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayFilterPart02TestMindmapTest007
     * @tc.desc Verify filter on offset-buffer Int32Array returns Int32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      arr.$_set(0, 7);
      arr.$_set(1, 8);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 0);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(1)).assertEqual(8);
      arr.$_set(0, 999);
      expect(r.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayFilterPart02TestMindmapTest008
     * @tc.desc Verify filter on Int32Array.of source returns Int32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 15);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(22);
      expect(r.$_get(1)).assertEqual(33);
      arr.$_set(1, 999);
      expect(r.$_get(0)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayFilterPart02TestMindmapTest009
     * @tc.desc Verify all-match filter length equals source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => true);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(20);
      expect(r.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayFilterPart02TestMindmapTest010
     * @tc.desc Verify all-no-match filter length and byteLength are 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => false);
      expect(r.length).assertEqual(0);
      expect(r.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayFilterPart02TestMindmapTest011
     * @tc.desc Verify half-match filter length equals hit count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3, -4, 5, -6] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 0);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayFilterPart02TestMindmapTest012
     * @tc.desc Verify only-first-match filter length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, -1, -2, -3] as number[]);
      let r: Int32Array = arr.filter((_val: number, index: int, _array: Int32Array): boolean => index == 0);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayFilterPart02TestMindmapTest013
     * @tc.desc Verify only-last-match filter length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2, -3, 99] as number[]);
      let r: Int32Array = arr.filter((_val: number, index: int, array: Int32Array): boolean => index == array.length - 1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayFilterPart02TestMindmapTest014
     * @tc.desc Verify filter with predicate always false returns empty Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => false);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayFilterPart02TestMindmapTest015
     * @tc.desc Verify single-element match filter length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val == 42);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayFilterPart02TestMindmapTest016
     * @tc.desc Verify single-element no-match filter length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val != 42);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayFilterPart02TestMindmapTest017
     * @tc.desc Verify all-match filter byteLength equals length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => true);
      expect(r.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayFilterPart02TestMindmapTest018
     * @tc.desc Verify partial-hit filter byteLength equals hits*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3, -4, 5] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 0);
      expect(r.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayFilterPart02TestMindmapTest019
     * @tc.desc Verify filter result byteOffset is always 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 1);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayFilterPart02TestMindmapTest020
     * @tc.desc Verify filter on offset-view source returns byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let arr: Int32Array = new Int32Array(buf, 8, 3);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      arr.$_set(2, 33);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 0);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayFilterPart02TestMindmapTest021
     * @tc.desc Verify non-empty filter result BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 0);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayFilterPart02TestMindmapTest022
     * @tc.desc Verify empty filter result BYTES_PER_ELEMENT still 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => false);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayFilterPart02TestMindmapTest023
     * @tc.desc Verify length*4 consistent with byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -1, 2, -2, 3, -3, 4] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 0);
      expect(r.length * 4).assertEqual(r.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayFilterPart02TestMindmapTest024
     * @tc.desc Verify all-match filter elements identical to source in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => true);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(20);
      expect(r.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayFilterPart02TestMindmapTest025
     * @tc.desc Verify even-filter result preserves evens in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val % 2 == 0);
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(4);
      expect(r.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayFilterPart02TestMindmapTest026
     * @tc.desc Verify first-match-only result [0] equals first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([77, -1, -2, -3] as number[]);
      let r: Int32Array = arr.filter((_val: number, index: int, _array: Int32Array): boolean => index == 0);
      expect(r.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayFilterPart02TestMindmapTest027
     * @tc.desc Verify last-match-only result [0] equals last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2, -3, 88] as number[]);
      let r: Int32Array = arr.filter((_val: number, index: int, array: Int32Array): boolean => index == array.length - 1);
      expect(r.$_get(0)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayFilterPart02TestMindmapTest028
     * @tc.desc Verify single middle-match result contains only that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2, 55, -3, -4] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val == 55);
      expect(r.$_get(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayFilterPart02TestMindmapTest029
     * @tc.desc Verify negative-filter result preserves negative signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-10, 20, -30, 40, -50] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val < 0);
      expect(r.$_get(0)).assertEqual(-10);
      expect(r.$_get(1)).assertEqual(-30);
      expect(r.$_get(2)).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayFilterPart02TestMindmapTest030
     * @tc.desc Verify filter preserves INT_MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -1, 0] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val == 2147483647);
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayFilterPart02TestMindmapTest031
     * @tc.desc Verify filter preserves INT_MIN -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -2147483648, 1] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val == -2147483648);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayFilterPart02TestMindmapTest032
     * @tc.desc Verify filter preserves zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 0, -1] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val == 0);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayFilterPart02TestMindmapTest033
     * @tc.desc Verify even-index filter yields elements in source order skipping odds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.filter((_val: number, index: int, _array: Int32Array): boolean => index % 2 == 0);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(30);
      expect(r.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayFilterPart02TestMindmapTest034
     * @tc.desc Verify all-no-match $_get(0) on empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => false);
      let first: number | undefined = r.at(0);
      expect(first).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayFilterPart02TestMindmapTest035
     * @tc.desc Verify length-1 position is last hit element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 6, 9, 12, 15);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val % 3 == 0);
      expect(r.$_get(r.length - 1)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayFilterPart02TestMindmapTest036
     * @tc.desc Verify threshold filter result strictly follows occurrence order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 12, 8, 130, 44] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val >= 10);
      expect(r.$_get(0)).assertEqual(12);
      expect(r.$_get(1)).assertEqual(130);
      expect(r.$_get(2)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayFilterPart02TestMindmapTest037
     * @tc.desc Verify odd-index filter yields elements at positions 1,3,5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200, 300, 400, 500, 600);
      let r: Int32Array = arr.filter((_val: number, index: int, _array: Int32Array): boolean => index % 2 == 1);
      expect(r.$_get(0)).assertEqual(200);
      expect(r.$_get(1)).assertEqual(400);
      expect(r.$_get(2)).assertEqual(600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayFilterPart02TestMindmapTest038
     * @tc.desc Verify source array length unchanged after filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let before: int = arr.length;
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 2);
      expect(arr.length).assertEqual(before);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayFilterPart02TestMindmapTest039
     * @tc.desc Verify source element values unchanged after filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 15);
      expect(r.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayFilterPart02TestMindmapTest040
     * @tc.desc Verify source first element unchanged after filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(111, 222, 333);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 200);
      expect(r.length).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayFilterPart02TestMindmapTest041
     * @tc.desc Verify source last element unchanged after filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(111, 222, 333);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val < 200);
      expect(r.length).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayFilterPart02TestMindmapTest042
     * @tc.desc Verify source byteLength unchanged after filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let before: int = arr.byteLength;
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => true);
      expect(arr.byteLength).assertEqual(before);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayFilterPart02TestMindmapTest043
     * @tc.desc Verify source byteOffset unchanged after filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf, 8, 3);
      let before: int = arr.byteOffset;
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => true);
      expect(arr.byteOffset).assertEqual(before);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayFilterPart02TestMindmapTest044
     * @tc.desc Verify all elements unchanged after all-no-match filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-5, 0, 5] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 100);
      expect(r.length).assertEqual(0);
      expect(arr.$_get(0)).assertEqual(-5);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayFilterPart02TestMindmapTest045
     * @tc.desc Verify empty array length remains 0 after filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => true);
      expect(arr.length).assertEqual(0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayFilterPart02TestMindmapTest046
     * @tc.desc Verify callback mutating source is reflected; result based on traversal-time values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.filter((val: number, index: int, array: Int32Array): boolean => {
        array.$_set(index, 999);
        return val % 2 == 0;
      });
      expect(arr.$_get(0)).assertEqual(999);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayFilterPart02TestMindmapTest047
     * @tc.desc Verify filter result buffer is not the same instance as source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 1);
      let sameBuffer: boolean = (r.buffer === arr.buffer);
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayFilterPart02TestMindmapTest048
     * @tc.desc Verify mutating filter result does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => true);
      r.$_set(0, 999);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayFilterPart02TestMindmapTest049
     * @tc.desc Verify mutating second element of result does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => true);
      r.$_set(1, 777);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayFilterPart02TestMindmapTest050
     * @tc.desc Verify mutating source after filter does not affect already-returned result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => true);
      arr.$_set(0, 111);
      expect(r.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayFilterPart02TestMindmapTest051
     * @tc.desc Verify filter result buffer is an ArrayBuffer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => true);
      expect(r.length).assertEqual(2);
      expect(r.buffer.byteLength).assertEqual(r.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayFilterPart02TestMindmapTest052
     * @tc.desc Verify filter result buffer byteLength equals result byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 2);
      expect(r.buffer.byteLength).assertEqual(r.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayFilterPart02TestMindmapTest053
     * @tc.desc Verify empty filter result buffer byteLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => false);
      expect(r.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayFilterPart02TestMindmapTest054
     * @tc.desc Verify externally-backed ArrayBuffer source yields independent new buffer on filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 1);
      let sameBuffer: boolean = (r.buffer === buf);
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayFilterPart02TestMindmapTest055
     * @tc.desc Verify DataView writes into source buffer do not affect already-filtered result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      arr.$_set(3, 40);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 15);
      let dv: DataView = new DataView(buf);
      dv.setInt32(4, 999, true);
      expect(r.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayFilterPart02TestMindmapTest056
     * @tc.desc Verify other Int32Array view on source buffer is unaffected by writes to filter result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => true);
      let other: Int32Array = new Int32Array(arr.buffer);
      r.$_set(0, -99);
      expect(other.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayFilterPart02TestMindmapTest057
     * @tc.desc Verify chained filter.filter yields correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3, -4, 5, -6] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 0)
      .filter((val: number, _index: int, _array: Int32Array): boolean => val > 2);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayFilterPart02TestMindmapTest058
     * @tc.desc Verify filter result can be iterated with forEach to sum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let sum: number = 0;
      arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 15)
      .forEach((val: number, _i: int, _a: Int32Array): void => { sum = sum + val; });
      expect(sum).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayFilterPart02TestMindmapTest059
     * @tc.desc Verify all-no-match followed by all-true chain filter length still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => false)
      .filter((_val: number, _index: int, _array: Int32Array): boolean => true);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayFilterPart02TestMindmapTest060
     * @tc.desc Verify filter chained with map transforms values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let mapped: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val % 2 == 0)
      .map((val: number, _index: int, _array: Int32Array): number => val * 10);
      expect(mapped.$_get(0)).assertEqual(20);
      expect(mapped.$_get(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayFilterPart02TestMindmapTest061
     * @tc.desc Verify filter chained with reduce sums correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sum: number = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 2)
      .reduce<number>((acc: number, val: number, _i: int, _a: Int32Array): number => acc + val, 0);
      expect(sum).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayFilterPart02TestMindmapTest062
     * @tc.desc Verify reverse on filter result does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 1);
      let rev: Int32Array = r.reverse();
      expect(rev.$_get(0)).assertEqual(5);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArrayFilterPart02TestMindmapTest063
     * @tc.desc Verify bracket [] access works on filter result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val >= 20);
      expect(r[0]).assertEqual(20);
      expect(r[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArrayFilterPart02TestMindmapTest064
     * @tc.desc Verify join on filter result returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 1);
      let s: string = r.join(',');
      expect(s.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArrayFilterPart02TestMindmapTest065
     * @tc.desc Verify indexOf on filter result locates element correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val >= 20);
      expect(r.indexOf(30)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_6600
     * @tc.name int32ArrayFilterPart02TestMindmapTest066
     * @tc.desc Verify some on filter result returns boolean correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let hasBig: boolean = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 0)
      .some((val: number, _i: int, _a: Int32Array): boolean => val > 4);
      expect(hasBig).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_6700
     * @tc.name int32ArrayFilterPart02TestMindmapTest067
     * @tc.desc Verify every on filter result returns true when all satisfy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2, 3, 4, 5] as number[]);
      let allPos: boolean = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 0)
      .every((val: number, _i: int, _a: Int32Array): boolean => val > 0);
      expect(allPos).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_6800
     * @tc.name int32ArrayFilterPart02TestMindmapTest068
     * @tc.desc Verify three consecutive chained filters produce correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 2)
      .filter((val: number, _index: int, _array: Int32Array): boolean => val < 9)
      .filter((val: number, _index: int, _array: Int32Array): boolean => val % 2 == 0);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(4);
      expect(r.$_get(1)).assertEqual(6);
      expect(r.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_6900
     * @tc.name int32ArrayFilterPart02TestMindmapTest069
     * @tc.desc Verify filter result supports for-of traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 15);
      let collected: number[] = [];
      let it = r.values();
      let cur = it.next();
      while (!cur.done) {
        collected.push(cur.value as number);
        cur = it.next();
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0] as number).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_7000
     * @tc.name int32ArrayFilterPart02TestMindmapTest070
     * @tc.desc Verify subarray chained on filter result returns correct view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 1);
      let sub: Int32Array = r.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(3);
      expect(sub.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_7100
     * @tc.name int32ArrayFilterPart02TestMindmapTest071
     * @tc.desc Verify sort chained on filter result sorts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 4, 1, 5, 9, 2, 6] as number[]);
      let r: Int32Array = arr.filter((val: number, _index: int, _array: Int32Array): boolean => val > 2);
      let s: Int32Array = r.sort();
      expect(s.$_get(0)).assertEqual(3);
      expect(s.$_get(s.length - 1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_7200
     * @tc.name int32ArrayFilterPart02TestMindmapTest072
     * @tc.desc Verify fill on filter result does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => true);
      r.fill(0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILTER_PART02_TEST_MINDMAP_7300
     * @tc.name int32ArrayFilterPart02TestMindmapTest073
     * @tc.desc Verify set on filter result writes only into result not source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFilterPart02TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.filter((_val: number, _index: int, _array: Int32Array): boolean => true);
      let src: Int32Array = Int32Array.of(77, 88);
      r.set(src, 1);
      expect(r.$_get(1)).assertEqual(77);
      expect(r.$_get(2)).assertEqual(88);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });
  });
}
