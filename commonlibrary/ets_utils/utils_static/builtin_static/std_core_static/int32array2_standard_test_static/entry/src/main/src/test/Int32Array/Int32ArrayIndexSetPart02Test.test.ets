'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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

export default function int32ArrayIndexSetPart02Test(): void {
  describe('Int32ArrayIndexSetPart02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest001
     * @tc.desc Verify $_set stores values at two consecutive indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, 7);
      arr.$_set(1, 8);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest002
     * @tc.desc Verify $_set stores values at both indices of a 2-element Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 111);
      arr.$_set(1, 222);
      expect(arr.$_get(0)).assertEqual(111);
      expect(arr.$_get(1)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest003
     * @tc.desc Verify $_set() int32 -2147483648 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.$_set(4, -2147483648);
      expect(arr.$_get(4)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest004
     * @tc.desc Verify $_set() 2147483649 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(2, 2147483649);
      expect(arr.$_get(2)).assertEqual(-2147483647);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest005
     * @tc.desc Verify $_set() -3.5 ToInt32 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -3.5);
      expect(arr.$_get(0)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest006
     * @tc.desc Verify $_set() -3.5 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(6);
      arr.$_set(3, -3.5);
      expect(arr.$_get(3)).assertEqual(-3);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest007
     * @tc.desc Verify $_set() index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 42);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest008
     * @tc.desc Verify $_set() index=0 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest009
     * @tc.desc Verify $_set() +Number.POSITIVE_INFINITY ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest010
     * @tc.desc Verify $_set() -Number.POSITIVE_INFINITY ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest011
     * @tc.desc Verify $_set() Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.$_set(2, Number.NaN);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest012
     * @tc.desc Verify $_set() 3.999 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 3.999);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest013
     * @tc.desc Verify $_set() 3.5 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 3.5);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest014
     * @tc.desc Verify $_set() -0 ToInt32 0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -0);
      let v: number = arr.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest015
     * @tc.desc Verify $_set does not change array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, 77);
      arr.$_set(3, 88);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest016
     * @tc.desc Verify $_set does not change array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(6);
      arr.$_set(2, 123);
      expect(arr.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest017
     * @tc.desc Verify $_set does not change byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 5);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest018
     * @tc.desc Verify $_set() ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      arr.$_set(0, 555);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest019
     * @tc.desc Verify $_set() ArrayBuffer byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Int32Array = new Int32Array(buf, 8, 3);
      arr.$_set(2, 777);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest020
     * @tc.desc Verify $_set() BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 1);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest021
     * @tc.desc Verify $_set does not change underlying ArrayBuffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(1, 444);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest022
     * @tc.desc Verify $_set at index 0 leaves other elements as default 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, 1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest023
     * @tc.desc Verify $_set() buffer.byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.$_set(4, 99);
      expect(arr.buffer.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest024
     * @tc.desc Verify $_set stores int32 value and leaves other elements as default 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 7);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest025
     * @tc.desc Verify $_set() TypedArray Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(1, 42);
      expect(arr.length).assertEqual(3);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest026
     * @tc.desc Verify $_set() 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.$_set(0, 999);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest027
     * @tc.desc Verify $_set() length-1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      arr.$_set(3, 777);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(22);
      expect(arr.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest028
     * @tc.desc Verify $_set at one index does not affect neighboring elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      arr.$_set(2, 999);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest029
     * @tc.desc Verify $_set overwrites value when called twice on same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 1);
      arr.$_set(0, 2);
      expect(arr.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest030
     * @tc.desc Verify $_set through shared buffer is visible by overlapping offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 4, 3);
      a.$_set(1, 12345);
      expect(b.$_get(0)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest031
     * @tc.desc Verify $_set through offset view propagates to parent Int32Array via shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      b.$_set(1, 7777);
      expect(a.$_get(3)).assertEqual(7777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest032
     * @tc.desc Verify $_set() buffer -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf, 4, 1);
      b.$_set(0, -2147483648);
      expect(a.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest033
     * @tc.desc Verify $_set() 2147483649 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf, 0, 2);
      b.$_set(0, 2147483649);
      expect(a.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest034
     * @tc.desc Verify $_set() -3.5 -3 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf, 4, 2);
      b.$_set(1, -3.5);
      expect(a.$_get(2)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest035
     * @tc.desc Verify $_set() Int32Array 0x12345678 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let i32: Int32Array = new Int32Array(buf);
      let u8: Uint8Array = new Uint8Array(buf);
      i32.$_set(0, 0x12345678);
      expect(u8.$_get(0)).assertEqual(0x78);
      expect(u8.$_get(1)).assertEqual(0x56);
      expect(u8.$_get(2)).assertEqual(0x34);
      expect(u8.$_get(3)).assertEqual(0x12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest036
     * @tc.desc Verify $_set() Int32Array -1 0xFFFFFFFF Uint8Array 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let i32: Int32Array = new Int32Array(buf);
      let u8: Uint8Array = new Uint8Array(buf);
      i32.$_set(0, -1);
      expect(u8.$_get(0)).assertEqual(255);
      expect(u8.$_get(1)).assertEqual(255);
      expect(u8.$_get(2)).assertEqual(255);
      expect(u8.$_get(3)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest037
     * @tc.desc Verify $_set() Int32Array 0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let i32: Int32Array = new Int32Array(buf);
      let u8: Uint8Array = new Uint8Array(buf);
      i32.$_set(0, 0);
      expect(u8.$_get(0)).assertEqual(0);
      expect(u8.$_get(1)).assertEqual(0);
      expect(u8.$_get(2)).assertEqual(0);
      expect(u8.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest038
     * @tc.desc Verify $_set() Int32Array -2147483648 0x80000000 Uint8Array 0x00/0x00/0x00/0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let i32: Int32Array = new Int32Array(buf);
      let u8: Uint8Array = new Uint8Array(buf);
      i32.$_set(0, -2147483648);
      expect(u8.$_get(0)).assertEqual(0);
      expect(u8.$_get(1)).assertEqual(0);
      expect(u8.$_get(2)).assertEqual(0);
      expect(u8.$_get(3)).assertEqual(0x80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest039
     * @tc.desc Verify $_set() Int32Array Number.NaN 0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let i32: Int32Array = new Int32Array(buf);
      let u8: Uint8Array = new Uint8Array(buf);
      i32.$_set(0, Number.NaN);
      expect(u8.$_get(0)).assertEqual(0);
      expect(u8.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest040
     * @tc.desc Verify $_set() Int16Array buffer 0x12345678 Int16Array 0x5678 0x1234
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let i32: Int32Array = new Int32Array(buf);
      let i16: Int16Array = new Int16Array(buf);
      i32.$_set(0, 0x12345678);
      expect(i16.$_get(0)).assertEqual(0x5678);
      expect(i16.$_get(1)).assertEqual(0x1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest041
     * @tc.desc Verify $_set() Uint32Array buffer -1 Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let i32: Int32Array = new Int32Array(buf);
      let u32: Uint32Array = new Uint32Array(buf);
      i32.$_set(0, -1);
      expect(u32.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest042
     * @tc.desc Verify $_set() Float32Array buffer 0 Float32Array 0.0 0x00000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let i32: Int32Array = new Int32Array(buf);
      let f32: Float32Array = new Float32Array(buf);
      i32.$_set(0, 0);
      expect(f32.$_get(0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest043
     * @tc.desc Verify $_set() 2147483648 MAX+1 ToInt32 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2147483648);
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest044
     * @tc.desc Verify $_set() -0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -0.5);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest045
     * @tc.desc Verify $_set() 0.999 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 0.999);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest046
     * @tc.desc Verify $_set() -3.999 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -3.999);
      expect(arr.$_get(0)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest047
     * @tc.desc Verify $_set() 2147483648 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 2147483648);
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest048
     * @tc.desc Verify $_set() -2147483649 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(3, -2147483649);
      expect(arr.$_get(3)).assertEqual(2147483647);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest049
     * @tc.desc Verify $_set() 42 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 42);
      arr.$_set(0, 2147483648);
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest050
     * @tc.desc Verify $_set() Number.NaN 0 -0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, Number.NaN);
      arr.$_set(0, -0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest051
     * @tc.desc Verify $_set initializes all elements with distinct sequential values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest052
     * @tc.desc Verify $_set overwrites value when called three times on same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 111);
      arr.$_set(0, 222);
      arr.$_set(0, 333);
      expect(arr.$_get(0)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayIndexSetPart02TestMindmapTest053
     * @tc.desc Verify $_set() ArrayBuffer ArrayBuffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let arr: Int32Array = new Int32Array(buf, 0, 5);
      arr.$_set(4, 123);
      expect(buf.byteLength).assertEqual(20);
    });
  });
}
