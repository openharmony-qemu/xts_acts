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

export default function int32ArrayLastIndexOfPart04Test(): void {
  describe('Int32ArrayLastIndexOfPart04Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest001
     * @tc.desc Verify lastIndexOf does not mutate element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 10, 15, 20);
      arr.lastIndexOf(15);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(15);
      expect(arr.$_get(3)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest002
     * @tc.desc Verify lastIndexOf buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let bufRef: ArrayBuffer = arr.buffer;
      arr.lastIndexOf(2);
      expect(arr.buffer).assertEqual(bufRef);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest003
     * @tc.desc Verify lastIndexOf byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let bl: int = arr.byteLength;
      arr.lastIndexOf(3);
      expect(arr.byteLength).assertEqual(bl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest004
     * @tc.desc Verify lastIndexOf byteOffset unchanged for offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let bo: int = arr.byteOffset;
      arr.lastIndexOf(0);
      expect(arr.byteOffset).assertEqual(bo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest005
     * @tc.desc Verify lastIndexOf idempotent: two calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 2, 1);
      let r1: int = arr.lastIndexOf(2);
      let r2: int = arr.lastIndexOf(2);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest006
     * @tc.desc Verify both indexOf and lastIndexOf on empty array return -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.lastIndexOf(0)).assertEqual(-1);
      expect(arr.indexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest007
     * @tc.desc Verify lastIndexOf does not overwrite zero-initialized elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.lastIndexOf(0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest008
     * @tc.desc Verify lastIndexOf result used as fromIndex for nested search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 2, 1);
      let outer: int = arr.lastIndexOf(2);
      let inner: int = arr.lastIndexOf(1, outer);
      expect(outer).assertEqual(3);
      expect(inner).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest009
     * @tc.desc Verify lastIndexOf result used to $_get matches searchElement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let idx: int = arr.lastIndexOf(40);
      expect(arr.$_get(idx)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest010
     * @tc.desc Verify lastIndexOf on subarray returns index relative to subarray origin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = arr.subarray(1, 4);
      expect(sub.lastIndexOf(30)).assertEqual(1);
      expect(sub.lastIndexOf(20)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest011
     * @tc.desc Verify length=1 array lastIndexOf hit, reused as fromIndex returns same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let idx: int = arr.lastIndexOf(42);
      expect(idx).assertEqual(0);
      expect(arr.lastIndexOf(42, idx)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest012
     * @tc.desc Verify lastIndexOf miss returns -1, using -1 as fromIndex searches from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let nf: int = arr.lastIndexOf(999);
      let r: int = arr.lastIndexOf(3, nf);
      expect(nf).assertEqual(-1);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest013
     * @tc.desc Verify two lastIndexOf calls on different values, right element index > left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9, 7, 8, 9);
      let last7: int = arr.lastIndexOf(7);
      let last9: int = arr.lastIndexOf(9);
      expect(last7).assertEqual(3);
      expect(last9).assertEqual(5);
      expect(last9 > last7).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest014
     * @tc.desc Verify lastIndexOf result used to construct subarray, elements from hit position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 77, 0, 0);
      let idx: int = arr.lastIndexOf(77);
      let sub: Int32Array = arr.subarray(idx);
      expect(sub.$_get(0)).assertEqual(77);
      expect(sub.length).assertEqual(arr.length - idx);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest015
     * @tc.desc Verify $_set middle position then lastIndexOf locates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0);
      arr.$_set(2, 77);
      expect(arr.lastIndexOf(77)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest016
     * @tc.desc Verify $_set first position then lastIndexOf returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      arr.$_set(0, 111);
      expect(arr.lastIndexOf(111)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest017
     * @tc.desc Verify $_set last position then lastIndexOf returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      arr.$_set(2, 222);
      expect(arr.lastIndexOf(222)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest018
     * @tc.desc Verify multiple $_set same value, lastIndexOf returns rightmost write position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
      arr.$_set(1, 5);
      arr.$_set(3, 5);
      expect(arr.lastIndexOf(5)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest019
     * @tc.desc Verify fill full array then lastIndexOf returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(9);
      expect(arr.lastIndexOf(9)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest020
     * @tc.desc Verify fill range [1,3) then lastIndexOf locates last filled position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.fill(7, 1, 3);
      expect(arr.lastIndexOf(7)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest021
     * @tc.desc Verify reverse then lastIndexOf maps original first to new last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.reverse();
      expect(arr.lastIndexOf(1)).assertEqual(3);
      expect(arr.lastIndexOf(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest022
     * @tc.desc Verify copyWithin then lastIndexOf locates rightmost copied element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(3, 0, 2);
      expect(arr.lastIndexOf(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest023
     * @tc.desc Verify set batch write then lastIndexOf locates rightmost in batch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(6);
      let src: Int32Array = Int32Array.of(10, 20, 30);
      arr.set(src, 2);
      expect(arr.lastIndexOf(30)).assertEqual(4);
      expect(arr.lastIndexOf(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest024
     * @tc.desc Verify sort then lastIndexOf returns rightmost of clustered equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 1, 4, 1, 5, 9, 2, 6);
      arr.sort();
      expect(arr.lastIndexOf(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest025
     * @tc.desc Verify $_set INT_MIN then lastIndexOf accurately hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(2, -2147483648);
      expect(arr.lastIndexOf(-2147483648)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest026
     * @tc.desc Verify $_set INT_MAX then lastIndexOf accurately hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(1, 2147483647);
      expect(arr.lastIndexOf(2147483647)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest027
     * @tc.desc Verify zero-init buffer, $_set(0) at one pos, lastIndexOf(0) still returns rightmost
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(2, 0);
      expect(arr.lastIndexOf(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest028
     * @tc.desc Verify lastIndexOf() $_set overwrites old value, old value no longer found, new value found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 99, 3);
      arr.$_set(1, 2);
      expect(arr.lastIndexOf(99)).assertEqual(-1);
      expect(arr.lastIndexOf(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest029
     * @tc.desc Verify fill with -1 then lastIndexOf(-1) returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(-1);
      expect(arr.lastIndexOf(-1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest030
     * @tc.desc Verify two fill rounds with different values, lastIndexOf returns only second fill position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(5);
      arr.fill(8, 1, 3);
      expect(arr.lastIndexOf(5)).assertEqual(0);
      expect(arr.lastIndexOf(8)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest031
     * @tc.desc Verify two zero-offset Int32Array share buffer, write via A visible in B lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(2, 555);
      expect(b.lastIndexOf(555)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest032
     * @tc.desc Verify parent writes to subarray shared region, child lastIndexOf returns child-relative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
      let child: Int32Array = parent.subarray(1, 4);
      parent.$_set(2, 88);
      expect(child.lastIndexOf(88)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest033
     * @tc.desc Verify child subarray writes, parent lastIndexOf returns parent-relative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(5);
      let child: Int32Array = parent.subarray(1, 4);
      child.$_set(1, 99);
      expect(parent.lastIndexOf(99)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest034
     * @tc.desc Verify lastIndexOf() offset=4 and offset=0 views share buffer, cross-offset write index mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 4, 4);
      a.$_set(3, 77);
      expect(b.lastIndexOf(77)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest035
     * @tc.desc Verify lastIndexOf() slice creates independent copy, copy modification does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp: Int32Array = orig.slice();
      cp.$_set(1, 999);
      expect(orig.lastIndexOf(999)).assertEqual(-1);
      expect(cp.lastIndexOf(999)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest036
     * @tc.desc Verify lastIndexOf() two non-overlapping slice views, each write independent, cross-find returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      a.$_set(0, 11);
      b.$_set(0, 22);
      expect(a.lastIndexOf(22)).assertEqual(-1);
      expect(b.lastIndexOf(11)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest037
     * @tc.desc Verify overlapping subarray same element lastIndexOf returns each view's local index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 7, 0, 0);
      let s1: Int32Array = arr.subarray(0, 4);
      let s2: Int32Array = arr.subarray(2, 5);
      expect(s1.lastIndexOf(7)).assertEqual(2);
      expect(s2.lastIndexOf(7)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest038
     * @tc.desc Verify zero-length subarray on same buffer does not affect parent lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let emptySub: Int32Array = arr.subarray(1, 1);
      expect(emptySub.length).assertEqual(0);
      expect(arr.lastIndexOf(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest039
     * @tc.desc Verify Uint32Array writes 2^31 bit pattern, Int32Array lastIndexOf(INT_MIN) hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let u: Uint32Array = new Uint32Array(buf);
      let i: Int32Array = new Int32Array(buf);
      u.$_set(0, 2147483648);
      expect(i.lastIndexOf(-2147483648)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest040
     * @tc.desc Verify Uint32Array writes 0xFFFFFFFF, Int32Array lastIndexOf(-1) hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let u: Uint32Array = new Uint32Array(buf);
      let i: Int32Array = new Int32Array(buf);
      u.$_set(1, 4294967295);
      expect(i.lastIndexOf(-1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest041
     * @tc.desc Verify lastIndexOf() Int32Array writes -1, Uint8Array sees 255 each byte, Int32 re-search -1 still hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let i: Int32Array = new Int32Array(buf);
      i.$_set(0, -1);
      let u8: Uint8Array = new Uint8Array(buf);
      expect(u8.$_get(0)).assertEqual(255);
      expect(u8.$_get(3)).assertEqual(255);
      expect(i.lastIndexOf(-1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest042
     * @tc.desc Verify Int16Array two -1 segments form int32 -1, Int32Array lastIndexOf(-1) hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let i16: Int16Array = new Int16Array(buf);
      let i32: Int32Array = new Int32Array(buf);
      i16.$_set(0, -1);
      i16.$_set(1, -1);
      expect(i32.lastIndexOf(-1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest043
     * @tc.desc Verify Float32Array writes 0.0 (all-zero bits), Int32Array lastIndexOf(0) hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let f: Float32Array = new Float32Array(buf);
      let i: Int32Array = new Int32Array(buf);
      f.$_set(0, 0.0);
      expect(i.lastIndexOf(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest044
     * @tc.desc Verify Uint8Array byte-by-byte writes 0x7FFFFFFF, Int32Array lastIndexOf(INT_MAX) hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let u8: Uint8Array = new Uint8Array(buf);
      u8.$_set(0, 255);
      u8.$_set(1, 255);
      u8.$_set(2, 255);
      u8.$_set(3, 127);
      let i: Int32Array = new Int32Array(buf);
      expect(i.lastIndexOf(2147483647)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest045
     * @tc.desc Verify lastIndexOf() number 2147483648.0 strict compare not equal to stored INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, 1, 2);
      let n: number = 2147483648.0;
      expect(arr.lastIndexOf(n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest046
     * @tc.desc Verify lastIndexOf() number 2147483649.0 strict compare not equal to stored -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483647, 0);
      let n: number = 2147483649.0;
      expect(arr.lastIndexOf(n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest047
     * @tc.desc Verify lastIndexOf() number -2147483649.0 strict compare not equal to stored INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 2147483647);
      let n: number = -2147483649.0;
      expect(arr.lastIndexOf(n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest048
     * @tc.desc Verify lastIndexOf() number 4294967296.0 strict compare not equal to stored 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2);
      let n: number = 4294967296.0;
      expect(arr.lastIndexOf(n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest049
     * @tc.desc Verify lastIndexOf() number 4294967297.0 strict compare not equal to stored 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1);
      let n: number = 4294967297.0;
      expect(arr.lastIndexOf(n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest050
     * @tc.desc Verify lastIndexOf() number 0.5 strict compare not equal to stored 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      let n: number = 0.5;
      expect(arr.lastIndexOf(n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest051
     * @tc.desc Verify lastIndexOf() number -0.9 strict compare not equal to stored 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2);
      let n: number = -0.9;
      expect(arr.lastIndexOf(n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest052
     * @tc.desc Verify lastIndexOf() number 2147483647.9 strict compare not equal to stored INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 0);
      let n: number = 2147483647.9;
      expect(arr.lastIndexOf(n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest053
     * @tc.desc Verify lastIndexOf() number Number.POSITIVE_INFINITY strict compare does not match any finite element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let n: number = Number.POSITIVE_INFINITY;
      expect(arr.lastIndexOf(n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest054
     * @tc.desc Verify lastIndexOf() number -Number.POSITIVE_INFINITY strict compare does not match any finite element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -2, -3);
      let n: number = -Number.POSITIVE_INFINITY;
      expect(arr.lastIndexOf(n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest055
     * @tc.desc Verify lastIndexOf() number Number.NaN strict compare does not match any element (strict equality Number.NaN!==Number.NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      let n: number = Number.NaN;
      expect(arr.lastIndexOf(n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest056
     * @tc.desc Verify lastIndexOf() number 0.0 strictly equals stored 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2);
      let n: number = 0.0;
      expect(arr.lastIndexOf(n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest057
     * @tc.desc Verify lastIndexOf() number -0.0 strictly equals stored 0 (+0 === -0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1);
      let n: number = -0.0;
      expect(arr.lastIndexOf(n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest058
     * @tc.desc Verify lastIndexOf() int 0 hits stored 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2);
      expect(arr.lastIndexOf(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest059
     * @tc.desc Verify lastIndexOf() int INT_MAX precisely hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 2147483647, -1);
      expect(arr.lastIndexOf(2147483647)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest060
     * @tc.desc Verify lastIndexOf() int INT_MIN precisely hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -2147483648, 1);
      expect(arr.lastIndexOf(-2147483648)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest061
     * @tc.desc Verify lastIndexOf() number 1.0 precisely hits stored int 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      let n: number = 1.0;
      expect(arr.lastIndexOf(n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest062
     * @tc.desc Verify lastIndexOf() number -1.0 precisely hits stored int -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0, 1);
      let n: number = -1.0;
      expect(arr.lastIndexOf(n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest063
     * @tc.desc Verify loop: lastIndexOf finds target right-to-left, zero out, until -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 1, 0, 1);
      let idx: int = arr.lastIndexOf(1);
      expect(idx).assertEqual(4);
      arr.$_set(idx, 0);
      idx = arr.lastIndexOf(1);
      expect(idx).assertEqual(2);
      arr.$_set(idx, 0);
      idx = arr.lastIndexOf(1);
      expect(idx).assertEqual(0);
      arr.$_set(idx, 0);
      expect(arr.lastIndexOf(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest064
     * @tc.desc Verify lastIndexOf hit then $_set overwrite, old value -1 new value hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let idx: int = arr.lastIndexOf(20);
      arr.$_set(idx, 99);
      expect(arr.lastIndexOf(20)).assertEqual(-1);
      expect(arr.lastIndexOf(99)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest065
     * @tc.desc Verify lastIndexOf miss no write, array state unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let idx: int = arr.lastIndexOf(77);
      expect(idx).assertEqual(-1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest066
     * @tc.desc Verify two fill rounds with different values, lastIndexOf transitions correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(5);
      expect(arr.lastIndexOf(5)).assertEqual(2);
      arr.fill(8);
      expect(arr.lastIndexOf(5)).assertEqual(-1);
      expect(arr.lastIndexOf(8)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest067
     * @tc.desc Verify for-of last element equals lastIndexOf last-index element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let last: number = 0;
      for (let _i: int = 0; _i < arr.length; _i++) {
        let v = arr[_i];
        last = v;
      }
      let idx: number = arr.lastIndexOf(last);
      expect(idx).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_6800
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest068
     * @tc.desc Verify all same element for-of count equals length, lastIndexOf returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 7, 7, 7);
      let count: int = 0;
      for (let _i: int = 0; _i < arr.length; _i++) {
        let v = arr[_i];
        if (v === 7) {
          count = count + 1;
        }
      }
      expect(count).assertEqual(4);
      expect(arr.lastIndexOf(7)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_6900
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest069
     * @tc.desc Verify for-of early break does not affect subsequent lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      for (let _i: int = 0; _i < arr.length; _i++) {
        let v = arr[_i];
        if (v === 3) {
          break;
        }
      }
      expect(arr.lastIndexOf(5)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_7000
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest070
     * @tc.desc Verify unique element indexOf and lastIndexOf return same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      expect(arr.indexOf(3)).assertEqual(2);
      expect(arr.lastIndexOf(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_7100
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest071
     * @tc.desc Verify duplicate element indexOf returns leftmost, lastIndexOf returns rightmost
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 8, 5, 8, 5);
      let left: int = arr.indexOf(5);
      let right: int = arr.lastIndexOf(5);
      expect(left).assertEqual(0);
      expect(right).assertEqual(4);
      expect(right > left).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_7200
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest072
     * @tc.desc Verify adjacent duplicates indexOf=lastIndexOf-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 9, 9, 2);
      expect(arr.indexOf(9)).assertEqual(1);
      expect(arr.lastIndexOf(9)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_7300
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest073
     * @tc.desc Verify first element unique, indexOf=lastIndexOf=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(99, 1, 2);
      expect(arr.indexOf(99)).assertEqual(0);
      expect(arr.lastIndexOf(99)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_7400
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest074
     * @tc.desc Verify last element unique, indexOf=lastIndexOf=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 88);
      expect(arr.indexOf(88)).assertEqual(2);
      expect(arr.lastIndexOf(88)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_7500
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest075
     * @tc.desc Verify of-constructed array byteLength=4*length, lastIndexOf works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      expect(arr.byteLength).assertEqual(12);
      expect(arr.lastIndexOf(20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_7600
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest076
     * @tc.desc Verify lastIndexOf() from ordinary array creates copy, source modification does not affect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let srcArr: int[] = [1, 2, 3];
      let ta: Int32Array = Int32Array.from(srcArr);
      srcArr[1] = 999;
      expect(ta.lastIndexOf(2)).assertEqual(1);
      expect(ta.lastIndexOf(999)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_7700
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest077
     * @tc.desc Verify lastIndexOf() from another Int32Array creates independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp: Int32Array = Int32Array.from(orig);
      orig.$_set(1, 888);
      expect(cp.lastIndexOf(2)).assertEqual(1);
      expect(cp.lastIndexOf(888)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_7800
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest078
     * @tc.desc Verify of single element array length=1 byteLength=4 lastIndexOf returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
      expect(arr.lastIndexOf(42)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_7900
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest079
     * @tc.desc Verify byteOffset=4 length=2 view lastIndexOf returns view-local index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(1, 33);
      let part: Int32Array = new Int32Array(buf, 4, 2);
      expect(part.lastIndexOf(33)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_8000
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest080
     * @tc.desc Verify byteOffset=12 length=1 tail view lastIndexOf returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(3, 77);
      let tail: Int32Array = new Int32Array(buf, 12, 1);
      expect(tail.lastIndexOf(77)).assertEqual(0);
      expect(tail.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_8100
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest081
     * @tc.desc Verify zero-init buffer lastIndexOf(0) returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let arr: Int32Array = new Int32Array(buf);
      expect(arr.length).assertEqual(5);
      expect(arr.lastIndexOf(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_8200
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest082
     * @tc.desc Verify all INT_MAX array lastIndexOf returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(2147483647);
      expect(arr.lastIndexOf(2147483647)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_8300
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest083
     * @tc.desc Verify all INT_MIN array lastIndexOf returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(-2147483648);
      expect(arr.lastIndexOf(-2147483648)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_8400
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest084
     * @tc.desc Verify only first element is target, lastIndexOf returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9, 0, 0, 0);
      expect(arr.lastIndexOf(9)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_8500
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest085
     * @tc.desc Verify only last element is target, lastIndexOf returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 9);
      expect(arr.lastIndexOf(9)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_8600
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest086
     * @tc.desc Verify set from offset=0 batch of three, lastIndexOf locates rightmost
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let src: Int32Array = Int32Array.of(11, 22, 33);
      arr.set(src, 0);
      expect(arr.lastIndexOf(33)).assertEqual(2);
      expect(arr.lastIndexOf(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_8700
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest087
     * @tc.desc Verify set from offset=length-1 single element, lastIndexOf locates last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let src: Int32Array = Int32Array.of(77);
      arr.set(src, 3);
      expect(arr.lastIndexOf(77)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_8800
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest088
     * @tc.desc Verify $_set negative -100 then lastIndexOf(-100) precisely hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(2, -100);
      expect(arr.lastIndexOf(-100)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_8900
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest089
     * @tc.desc Verify of with -0 (same as 0) then lastIndexOf(0) hits that position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -0, 2);
      expect(arr.lastIndexOf(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART04_TEST_MINDMAP_9000
     * @tc.name int32ArrayLastIndexOfPart04TestMindmapTest090
     * @tc.desc Verify lastIndexOf() finds INT32_MAX-1 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart04TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 2147483646, 0);
      expect(arr.lastIndexOf(2147483646)).assertEqual(1);
    });
  });
}
