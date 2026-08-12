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

export default function int32ArrayIncludesPart02TestMindmapTestTest(): void {
  describe('Int32ArrayIncludesPart02TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayIncludesPart02TestMindmapTest001
     * @tc.desc Verify includes returns expected boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: boolean = arr.includes(10);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayIncludesPart02TestMindmapTest002
     * @tc.desc Verify includes(Number.NaN) returns false for non-empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 0, 3]);
      let nonEmptyResult: boolean = arr.includes(Number.NaN);
      expect(nonEmptyResult).assertFalse();
      let another: Int32Array = new Int32Array([1, 2, 3]);
      expect(another.includes(Number.NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayIncludesPart02TestMindmapTest003
     * @tc.desc Verify includes with fromIndex returns expected boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: boolean = arr.includes(30, 2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayIncludesPart02TestMindmapTest004
     * @tc.desc Verify includes with fromIndex returns expected boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: boolean = arr.includes(30, -2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayIncludesPart02TestMindmapTest005
     * @tc.desc Verify includes returns expected boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: boolean = arr.includes(99);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayIncludesPart02TestMindmapTest006
     * @tc.desc Verify includes on an empty array returns false and preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: boolean = arr.includes(1);
      expect(r).assertFalse();
      expect(arr.includes(Number.NaN)).assertFalse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayIncludesPart02TestMindmapTest007
     * @tc.desc Verify fromIndex at or beyond length produces false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let atLength: Int32Array = new Int32Array([1, 2, 3]);
      let beyondLength: Int32Array = new Int32Array([1, 2, 3]);
      expect(atLength.includes(3, atLength.length)).assertFalse();
      expect(beyondLength.includes(1, beyondLength.length + 1)).assertFalse();
      expect(beyondLength.includes(1, 100)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayIncludesPart02TestMindmapTest008
     * @tc.desc Verify includes fromIndex past last element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20]);
      let r: boolean = arr.includes(10, 1);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayIncludesPart02TestMindmapTest009
     * @tc.desc Verify includes positive and negative infinity returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      expect(arr.includes(Number.POSITIVE_INFINITY)).assertFalse();
      expect(arr.includes(Number.NEGATIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayIncludesPart02TestMindmapTest010
     * @tc.desc Verify includes(-Infinity) returns false (ToInt32=0, not in array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = arr.includes(Number.NEGATIVE_INFINITY);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayIncludesPart02TestMindmapTest011
     * @tc.desc Verify includes non-integer search values returns false without ToInt32 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      expect(arr.includes(3.5)).assertFalse();
      expect(arr.includes(3.1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayIncludesPart02TestMindmapTest012
     * @tc.desc Verify includes -1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      expect(arr.includes(-1)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayIncludesPart02TestMindmapTest013
     * @tc.desc Verify includes fromIndex=0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      expect(arr.includes(10, 0)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayIncludesPart02TestMindmapTest014
     * @tc.desc Verify includes fromIndex length-1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      expect(arr.includes(30, arr.length - 1)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayIncludesPart02TestMindmapTest015
     * @tc.desc Verify includes fromIndex -length 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      expect(arr.includes(10, -100)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayIncludesPart02TestMindmapTest016
     * @tc.desc Verify includes -0 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      expect(arr.includes(-0)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayIncludesPart02TestMindmapTest017
     * @tc.desc Verify includes NaN false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.includes(Number.NaN)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayIncludesPart02TestMindmapTest018
     * @tc.desc Verify includes fromIndex length false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      expect(arr.includes(3, arr.length)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayIncludesPart02TestMindmapTest019
     * @tc.desc Verify includes INT32_MAX+1 returns false (no ToInt32 conversion)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      expect(arr.includes(2147483648)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayIncludesPart02TestMindmapTest020
     * @tc.desc Verify includes INT32_MIN-1 returns false (no ToInt32 conversion)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      expect(arr.includes(-2147483649)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayIncludesPart02TestMindmapTest021
     * @tc.desc Verify includes does not change typed-array metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let beforeLength: number = arr.length;
      let beforeByteLength: number = arr.byteLength;
      arr.includes(20);
      expect(arr.length).assertEqual(beforeLength);
      expect(arr.byteLength).assertEqual(beforeByteLength);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayIncludesPart02TestMindmapTest022
     * @tc.desc Verify includes preserves metadata of an ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let beforeOffset: number = arr.byteOffset;
      let beforeLength: number = arr.length;
      let beforeByteLength: number = arr.byteLength;
      arr.includes(0);
      expect(arr.byteOffset).assertEqual(beforeOffset);
      expect(arr.length).assertEqual(beforeLength);
      expect(arr.byteLength).assertEqual(beforeByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayIncludesPart02TestMindmapTest023
     * @tc.desc Verify includes does not mutate the underlying elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      expect(arr.includes(10)).assertTrue();
      expect(arr.includes(99)).assertFalse();
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayIncludesPart02TestMindmapTest024
     * @tc.desc Verify includes with fromIndex does not mutate the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      expect(arr.includes(30, 2)).assertTrue();
      expect(arr.includes(30, 3)).assertFalse();
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayIncludesPart02TestMindmapTest025
     * @tc.desc Verify includes INT32_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      arr.includes(2147483647);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayIncludesPart02TestMindmapTest026
     * @tc.desc Verify includes 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.includes(2147483648);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayIncludesPart02TestMindmapTest027
     * @tc.desc Verify includes ArrayBuffer Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a1: Int32Array = new Int32Array(buf, 0, 2);
      let a2: Int32Array = new Int32Array(buf, 8, 2);
      a1[0] = 1; a1[1] = 2; a2[0] = 3; a2[1] = 4;
      a1.includes(2);
      expect(a2[0]).assertEqual(3);
      expect(a2[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayIncludesPart02TestMindmapTest028
     * @tc.desc Verify includes Uint8Array Int32Array buffer Int32Array.includes buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let i32: Int32Array = new Int32Array(buf);
      i32[0] = 0x12345678;
      i32[1] = -1;
      i32.includes(0x12345678);
      expect(i32[0]).assertEqual(0x12345678);
      expect(i32[1]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayIncludesPart02TestMindmapTest029
     * @tc.desc Verify includes offset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let prefix: Int32Array = new Int32Array(buf, 0, 1);
      let view: Int32Array = new Int32Array(buf, 4, 3);
      prefix[0] = 99;
      view[0] = 10; view[1] = 20; view[2] = 30;
      view.includes(20);
      expect(prefix[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayIncludesPart02TestMindmapTest030
     * @tc.desc Verify includes preserves the underlying ArrayBuffer and its size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      let beforeBuffer: ArrayBuffer = arr.buffer;
      arr.includes(0);
      expect(arr.buffer).assertEqual(beforeBuffer);
      expect(buf.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayIncludesPart02TestMindmapTest031
     * @tc.desc Verify includes subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let child: Int32Array = parent.subarray(1, 4);
      child.includes(30);
      expect(parent[0]).assertEqual(10);
      expect(parent[1]).assertEqual(20);
      expect(parent[2]).assertEqual(30);
      expect(parent[3]).assertEqual(40);
      expect(parent[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayIncludesPart02TestMindmapTest032
     * @tc.desc Verify includes slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array([10, 20, 30]);
      let cp: Int32Array = orig.slice();
      cp.includes(20);
      expect(orig[0]).assertEqual(10);
      expect(orig[1]).assertEqual(20);
      expect(orig[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayIncludesPart02TestMindmapTest033
     * @tc.desc Verify includes buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      a[0] = 111; a[1] = 222; a[2] = 333;
      a.includes(222);
      expect(a[0]).assertEqual(111);
      expect(a[1]).assertEqual(222);
      expect(a[2]).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayIncludesPart02TestMindmapTest034
     * @tc.desc Verify includes on Int32Array constructed from ArrayBuffer finds element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf, 0, 3);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      let r: boolean = arr.includes(2);
      expect(r).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayIncludesPart02TestMindmapTest035
     * @tc.desc Verify includes on subarray finds element within subarray range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = new Int32Array([10, 20, 30, 40]);
      let arr: Int32Array = base.subarray(1, 3);
      let r: boolean = arr.includes(20);
      expect(r).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayIncludesPart02TestMindmapTest036
     * @tc.desc Verify repeated includes calls return the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      let first: boolean = arr.includes(6);
      let second: boolean = arr.includes(6);
      expect(first).assertTrue();
      expect(second).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayIncludesPart02TestMindmapTest037
     * @tc.desc Verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      expect(arr.includes(20)).assertEqual(true);
      expect(arr.includes(99)).assertEqual(false);
      expect(arr.includes(20)).assertEqual(true);
      expect(arr.includes(99)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayIncludesPart02TestMindmapTest038
     * @tc.desc Verify includes fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      expect(arr.includes(30)).assertEqual(true);
      expect(arr.includes(30, 3)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayIncludesPart02TestMindmapTest039
     * @tc.desc Verify includes 50+ true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: Int32Array = new Int32Array(60);
      for (let i: int = 0; i < 60; i++) {
        data.$_set(i, i);
      }
      let r: boolean = data.includes(55);
      expect(r).assertEqual(true);
      expect(data.length).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayIncludesPart02TestMindmapTest040
     * @tc.desc Verify includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
      let r: boolean = arr.includes(7);
      expect(r).assertTrue();
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayIncludesPart02TestMindmapTest041
     * @tc.desc Verify includes finds both signed 32-bit endpoints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648]);
      expect(arr.includes(2147483647)).assertTrue();
      expect(arr.includes(-2147483648)).assertTrue();
      expect(arr[0]).assertEqual(2147483647);
      expect(arr[1]).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayIncludesPart02TestMindmapTest042
     * @tc.desc Verify includes toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let before: string = arr.toString();
      arr.includes(2);
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayIncludesPart02TestMindmapTest043
     * @tc.desc Verify search values above the signed 32-bit range are not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      expect(arr.includes(4294967295)).assertFalse();
      expect(arr.includes(4294967296)).assertFalse();
      expect(arr[0]).assertEqual(-1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayIncludesPart02TestMindmapTest044
     * @tc.desc Verify includes of boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200, 300);
      let r: boolean = arr.includes(200);
      expect(r).assertEqual(true);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayIncludesPart02TestMindmapTest045
     * @tc.desc Verify includes from boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: number[] = [5, 10, 15];
      let arr: Int32Array = Int32Array.from(source);
      let r: boolean = arr.includes(10);
      expect(r).assertEqual(true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5);
      expect(arr[2]).assertEqual(15);
    });
    });
    }
