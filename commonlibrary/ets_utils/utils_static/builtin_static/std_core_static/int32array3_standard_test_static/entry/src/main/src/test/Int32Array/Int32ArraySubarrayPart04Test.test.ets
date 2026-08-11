'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
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

export default function int32ArraySubarrayPart04TestMindmapTestTest(): void {
  describe('Int32ArraySubarrayPart04TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArraySubarrayPart04TestMindmapTest001
     * @tc.desc Verify $_set 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([100, 200, 300, 400, 500, 600]);
      let child: Int32Array = parent.subarray(2, 5);
      parent.$_set(2, 7777);
      expect(child.$_get(0)).assertEqual(7777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArraySubarrayPart04TestMindmapTest002
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([11, 22, 33, 44, 55]);
      let child: Int32Array = parent.subarray(1, 4);
      parent.$_set(3, 8888);
      expect(child.$_get(2)).assertEqual(8888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArraySubarrayPart04TestMindmapTest003
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let child: Int32Array = parent.subarray(2, 5);
      parent.$_set(1, 9999);
      expect(child.length).assertEqual(3);
      expect(child.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArraySubarrayPart04TestMindmapTest004
     * @tc.desc Verify fill(value,start,end)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let child: Int32Array = parent.subarray(1, 5);
      parent.fill(0, 2, 4);
      expect(child.$_get(0)).assertEqual(2);
      expect(child.$_get(1)).assertEqual(0);
      expect(child.$_get(2)).assertEqual(0);
      expect(child.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArraySubarrayPart04TestMindmapTest005
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([50, 10, 40, 20, 30]);
      let child: Int32Array = parent.subarray(1, 4);
      parent.sort();
      expect(child.$_get(0)).assertEqual(20);
      expect(child.$_get(1)).assertEqual(30);
      expect(child.$_get(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArraySubarrayPart04TestMindmapTest006
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([9, 8, 7, 6, 5, 4]);
      let child: Int32Array = parent.subarray(2, 5);
      parent.copyWithin(2, 0, 2);
      expect(child.$_get(0)).assertEqual(9);
      expect(child.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArraySubarrayPart04TestMindmapTest007
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      let child: Int32Array = parent.subarray(1, 4);
      child.$_set(0, 1234);
      expect(parent.$_get(1)).assertEqual(1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArraySubarrayPart04TestMindmapTest008
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let child: Int32Array = parent.subarray(2, 5);
      child.$_set(2, 5678);
      expect(parent.$_get(4)).assertEqual(5678);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArraySubarrayPart04TestMindmapTest009
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
      let child: Int32Array = parent.subarray(1, 5);
      child.fill(-7);
      expect(parent.$_get(0)).assertEqual(10);
      expect(parent.$_get(1)).assertEqual(-7);
      expect(parent.$_get(2)).assertEqual(-7);
      expect(parent.$_get(3)).assertEqual(-7);
      expect(parent.$_get(4)).assertEqual(-7);
      expect(parent.$_get(5)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArraySubarrayPart04TestMindmapTest010
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60, 70]);
      let child: Int32Array = parent.subarray(2, 6);
      child.reverse();
      expect(parent.$_get(0)).assertEqual(10);
      expect(parent.$_get(1)).assertEqual(20);
      expect(parent.$_get(2)).assertEqual(60);
      expect(parent.$_get(3)).assertEqual(50);
      expect(parent.$_get(4)).assertEqual(40);
      expect(parent.$_get(5)).assertEqual(30);
      expect(parent.$_get(6)).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArraySubarrayPart04TestMindmapTest011
     * @tc.desc Verify set(typedarray)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([0, 0, 0, 0, 0, 0]);
      let child: Int32Array = parent.subarray(1, 5);
      let src: Int32Array = new Int32Array([11, 22, 33, 44]);
      child.set(src);
      expect(parent.$_get(0)).assertEqual(0);
      expect(parent.$_get(1)).assertEqual(11);
      expect(parent.$_get(2)).assertEqual(22);
      expect(parent.$_get(3)).assertEqual(33);
      expect(parent.$_get(4)).assertEqual(44);
      expect(parent.$_get(5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArraySubarrayPart04TestMindmapTest012
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([0, 1, 2, 3, 4, 5]);
      let child: Int32Array = parent.subarray(1, 5);
      child.copyWithin(1, 0, 2);
      expect(parent.$_get(1)).assertEqual(1);
      expect(parent.$_get(2)).assertEqual(1);
      expect(parent.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArraySubarrayPart04TestMindmapTest013
     * @tc.desc Verify set(typedarray, offset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([0, 0, 0, 0, 0, 0]);
      let child: Int32Array = parent.subarray(1, 6);
      let src: Int32Array = new Int32Array([77, 88]);
      child.set(src, 2);
      expect(parent.$_get(3)).assertEqual(77);
      expect(parent.$_get(4)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArraySubarrayPart04TestMindmapTest014
     * @tc.desc Verify overlapping subarray views observe writes to their shared element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6, 7]);
      let a: Int32Array = parent.subarray(0, 5);
      let b: Int32Array = parent.subarray(3, 7);
      a.$_set(3, 2024);
      expect(b.$_get(0)).assertEqual(2024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArraySubarrayPart04TestMindmapTest015
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6, 7, 8]);
      let a: Int32Array = parent.subarray(0, 3);
      let b: Int32Array = parent.subarray(5, 8);
      a.fill(99);
      expect(b.$_get(0)).assertEqual(6);
      expect(b.$_get(1)).assertEqual(7);
      expect(b.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArraySubarrayPart04TestMindmapTest016
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(12);
      let c1: Int32Array = parent.subarray(0, 4);
      let c2: Int32Array = parent.subarray(3, 8);
      let c3: Int32Array = parent.subarray(7, 12);
      expect(c1.buffer).assertEqual(parent.buffer);
      expect(c2.buffer).assertEqual(parent.buffer);
      expect(c3.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArraySubarrayPart04TestMindmapTest017
     * @tc.desc Verify fill-7 fill+7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(6);
      let a: Int32Array = parent.subarray(0, 4);
      let b: Int32Array = parent.subarray(2, 6);
      a.fill(-7);
      b.fill(7);
      expect(parent.$_get(0)).assertEqual(-7);
      expect(parent.$_get(1)).assertEqual(-7);
      expect(parent.$_get(2)).assertEqual(7);
      expect(parent.$_get(3)).assertEqual(7);
      expect(parent.$_get(4)).assertEqual(7);
      expect(parent.$_get(5)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArraySubarrayPart04TestMindmapTest018
     * @tc.desc Verify DataView int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(4);
      let child: Int32Array = parent.subarray(1, 3);
      child.$_set(0, 0x0A0B0C0D);
      let dv: DataView = new DataView(parent.buffer);
      expect(dv.getInt32(child.byteOffset, true)).assertEqual(0x0A0B0C0D);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArraySubarrayPart04TestMindmapTest019
     * @tc.desc Verify DataView buffer int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(4);
      let child: Int32Array = parent.subarray(1, 2);
      let dv: DataView = new DataView(parent.buffer);
      dv.setInt32(child.byteOffset, 12345678, true);
      expect(child.$_get(0)).assertEqual(12345678);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArraySubarrayPart04TestMindmapTest020
     * @tc.desc Verify subarray() byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(10);
      let child: Int32Array = parent.subarray(4);
      let grand: Int32Array = child.subarray();
      expect(grand.byteOffset).assertEqual(child.byteOffset);
      expect(grand.length).assertEqual(child.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArraySubarrayPart04TestMindmapTest021
     * @tc.desc Verify subarray(begin) begin 4 byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(12);
      let child: Int32Array = parent.subarray(4, 10);
      let grand: Int32Array = child.subarray(3);
      expect(grand.byteOffset).assertEqual((4 + 3) * 4);
      expect(grand.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArraySubarrayPart04TestMindmapTest022
     * @tc.desc Verify subarray(begin,end)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(12);
      let child: Int32Array = parent.subarray(3, 10);
      let grand: Int32Array = child.subarray(2, 5);
      expect(grand.byteOffset).assertEqual((3 + 2) * 4);
      expect(grand.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArraySubarrayPart04TestMindmapTest023
     * @tc.desc Verify subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = new Int32Array(24);
      let l1: Int32Array = base.subarray(2);
      let l2: Int32Array = l1.subarray(3);
      let l3: Int32Array = l2.subarray(4);
      let l4: Int32Array = l3.subarray(1);
      expect(l4.byteOffset).assertEqual((2 + 3 + 4 + 1) * 4);
      expect(l4.length).assertEqual(24 - 2 - 3 - 4 - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArraySubarrayPart04TestMindmapTest024
     * @tc.desc Verify writes through a nested subarray update the corresponding parent elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([0, 0, 0, 0, 0, 0, 0]);
      let child: Int32Array = parent.subarray(2, 6);
      let grand: Int32Array = child.subarray(1, 3);
      grand.$_set(0, 42);
      grand.$_set(1, 43);
      expect(parent.$_get(3)).assertEqual(42);
      expect(parent.$_get(4)).assertEqual(43);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArraySubarrayPart04TestMindmapTest025
     * @tc.desc Verify begin length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60, 70]);
      let child: Int32Array = parent.subarray(2, 6);
      let grand: Int32Array = child.subarray(-3);
      expect(grand.length).assertEqual(3);
      expect(grand.$_get(0)).assertEqual(40);
      expect(grand.$_get(1)).assertEqual(50);
      expect(grand.$_get(2)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArraySubarrayPart04TestMindmapTest026
     * @tc.desc Verify begin>=end buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(10);
      let child: Int32Array = parent.subarray(3, 7);
      let grand: Int32Array = child.subarray(2, 0);
      expect(grand.length).assertEqual(0);
      expect(grand.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArraySubarrayPart04TestMindmapTest027
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(8);
      let child: Int32Array = parent.subarray(1, 7);
      let grand: Int32Array = child.subarray(2, 5);
      grand.fill(111);
      expect(parent.$_get(0)).assertEqual(0);
      expect(parent.$_get(3)).assertEqual(111);
      expect(parent.$_get(5)).assertEqual(111);
      expect(parent.$_get(6)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArraySubarrayPart04TestMindmapTest028
     * @tc.desc Verify subarray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(7);
      let beforeLen: number = parent.length;
      parent.subarray(2, 5);
      expect(parent.length).assertEqual(beforeLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArraySubarrayPart04TestMindmapTest029
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([5, 4, 3, 2, 1]);
      parent.subarray(1, 4);
      expect(parent.$_get(0)).assertEqual(5);
      expect(parent.$_get(1)).assertEqual(4);
      expect(parent.$_get(2)).assertEqual(3);
      expect(parent.$_get(3)).assertEqual(2);
      expect(parent.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArraySubarrayPart04TestMindmapTest030
     * @tc.desc Verify subarray buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(8);
      let bufBefore: ArrayBuffer = parent.buffer;
      let child: Int32Array = parent.subarray(0, 4);
      expect(child.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArraySubarrayPart04TestMindmapTest031
     * @tc.desc Verify $_set length/byteOffset/byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(6);
      let child: Int32Array = parent.subarray(1, 5);
      let off: number = child.byteOffset;
      let blen: number = child.byteLength;
      let len: number = child.length;
      child.$_set(0, 99);
      child.$_set(3, 100);
      expect(child.byteOffset).assertEqual(off);
      expect(child.byteLength).assertEqual(blen);
      expect(child.length).assertEqual(len);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArraySubarrayPart04TestMindmapTest032
     * @tc.desc Verify fill byteLength length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(6);
      let child: Int32Array = parent.subarray(0, 4);
      let beforeBL: number = child.byteLength;
      let beforeL: number = child.length;
      child.fill(5);
      expect(child.byteLength).assertEqual(beforeBL);
      expect(child.length).assertEqual(beforeL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArraySubarrayPart04TestMindmapTest033
     * @tc.desc Verify reverse length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let child: Int32Array = parent.subarray(0, 5);
      let beforeLen: number = child.length;
      child.reverse();
      expect(child.length).assertEqual(beforeLen);
      expect(child.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArraySubarrayPart04TestMindmapTest034
     * @tc.desc Verify sort byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([3, 1, 4, 2, 5]);
      let child: Int32Array = parent.subarray(0, 4);
      let off: number = child.byteOffset;
      child.sort();
      expect(child.byteOffset).assertEqual(off);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArraySubarrayPart04TestMindmapTest035
     * @tc.desc Verify subarray().subarray(begin)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([100, 200, 300, 400, 500, 600]);
      let b: Int32Array = a.subarray().subarray(2);
      expect(b.length).assertEqual(4);
      expect(b.$_get(0)).assertEqual(300);
      expect(b.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArraySubarrayPart04TestMindmapTest036
     * @tc.desc Verify subarray begin=1 byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 1, 2, 3, 4, 5, 6, 7]);
      let b: Int32Array = a.subarray(1).subarray(1).subarray(1);
      expect(b.length).assertEqual(5);
      expect(b.$_get(0)).assertEqual(3);
      expect(b.byteOffset).assertEqual(3 * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArraySubarrayPart04TestMindmapTest037
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(6);
      let b: Int32Array = a.subarray(4, 4).subarray();
      expect(b.length).assertEqual(0);
      expect(b.buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArraySubarrayPart04TestMindmapTest038
     * @tc.desc Verify begin subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
      let b: Int32Array = a.subarray(-4).subarray(1);
      expect(b.length).assertEqual(3);
      expect(b.$_get(0)).assertEqual(40);
      expect(b.$_get(2)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArraySubarrayPart04TestMindmapTest039
     * @tc.desc Verify subarray set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 0, 0, 0, 0, 0]);
      a.subarray(1, 5).set(new Int32Array([111, 222, 333, 444]));
      expect(a.$_get(1)).assertEqual(111);
      expect(a.$_get(4)).assertEqual(444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArraySubarrayPart04TestMindmapTest040
     * @tc.desc Verify subarray fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(8);
      a.subarray(2, 6).fill(13);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(13);
      expect(a.$_get(5)).assertEqual(13);
      expect(a.$_get(7)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArraySubarrayPart04TestMindmapTest041
     * @tc.desc Verify subarray().reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      a.subarray().reverse();
      expect(a.$_get(0)).assertEqual(5);
      expect(a.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArraySubarrayPart04TestMindmapTest042
     * @tc.desc Verify repeated parent writes are immediately visible through a full subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(4);
      let c: Int32Array = p.subarray(0, 4);
      p.$_set(0, 11);
      expect(c.$_get(0)).assertEqual(11);
      p.$_set(0, 22);
      expect(c.$_get(0)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArraySubarrayPart04TestMindmapTest043
     * @tc.desc Verify writes through a partial subarray update the corresponding parent indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(4);
      let c: Int32Array = p.subarray(1, 3);
      c.$_set(0, 33);
      expect(p.$_get(1)).assertEqual(33);
      c.$_set(1, 44);
      expect(p.$_get(2)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArraySubarrayPart04TestMindmapTest044
     * @tc.desc Verify alternating parent and subarray writes share the same backing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(2);
      let c: Int32Array = p.subarray(0, 2);
      p.$_set(0, 1);
      c.$_set(0, 2);
      p.$_set(0, 3);
      c.$_set(0, 4);
      expect(c.$_get(0)).assertEqual(4);
      expect(p.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArraySubarrayPart04TestMindmapTest045
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(5);
      let c: Int32Array = p.subarray(1, 4);
      c.fill(77);
      expect(p.$_get(0)).assertEqual(0);
      expect(p.$_get(1)).assertEqual(77);
      expect(p.$_get(2)).assertEqual(77);
      expect(p.$_get(3)).assertEqual(77);
      expect(p.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArraySubarrayPart04TestMindmapTest046
     * @tc.desc Verify $_set INT32_MAX(2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(3);
      let c: Int32Array = p.subarray(0, 3);
      c.$_set(0, 2147483647);
      expect(p.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArraySubarrayPart04TestMindmapTest047
     * @tc.desc Verify $_set INT32_MIN(-2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(3);
      let c: Int32Array = p.subarray(0, 2);
      c.$_set(1, -2147483648);
      expect(p.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArraySubarrayPart04TestMindmapTest048
     * @tc.desc Verify $_set 0 (0) written to parent via subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(2);
      let c: Int32Array = p.subarray(1, 2);
      c.$_set(0, 0);
      expect(p.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArraySubarrayPart04TestMindmapTest049
     * @tc.desc Verify $_set 1 written to parent via subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(2);
      let c: Int32Array = p.subarray(0, 2);
      c.$_set(1, 1);
      expect(p.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArraySubarrayPart04TestMindmapTest050
     * @tc.desc Verify $_set Number.NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(2);
      let c: Int32Array = p.subarray(0, 2);
      c.$_set(0, Number.NaN);
      expect(p.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArraySubarrayPart04TestMindmapTest051
     * @tc.desc Verify $_set 0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(2);
      let c: Int32Array = p.subarray(0, 2);
      c.$_set(0, 0.5);
      expect(c.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArraySubarrayPart04TestMindmapTest052
     * @tc.desc Verify fill MAX+1 MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(3);
      let c: Int32Array = p.subarray(0, 3);
      c.fill(2147483648);
      expect(c.$_get(0)).assertEqual(-2147483648);
      expect(c.$_get(1)).assertEqual(-2147483648);
      expect(c.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArraySubarrayPart04TestMindmapTest053
     * @tc.desc Verify set ToInt32 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(4);
      let c: Int32Array = p.subarray(1, 3);
      let src: Int32Array = new Int32Array([2147483648, -2147483649]);
      c.set(src);
      expect(p.$_get(1)).assertEqual(-2147483648);
      expect(p.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArraySubarrayPart04TestMindmapTest054
     * @tc.desc Verify $_set on a begin-equals-end subarray throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let p: Int32Array = new Int32Array([1, 2, 3, 4]);
        let c: Int32Array = p.subarray(2, 2);
        c.$_set(0, 99);
        expect(p.$_get(2)).assertEqual(3);
        expect(c.length).assertEqual(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArraySubarrayPart04TestMindmapTest055
     * @tc.desc Verify $_set on a begin-greater-than-end subarray throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let p: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
        let c: Int32Array = p.subarray(4, 2);
        c.$_set(0, 77);
        c.$_set(-1, 88);
        expect(p.$_get(2)).assertEqual(3);
        expect(p.$_get(4)).assertEqual(5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArraySubarrayPart04TestMindmapTest056
     * @tc.desc Verify fill no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([1, 2, 3]);
      let c: Int32Array = p.subarray(1, 1);
      c.fill(999);
      expect(p.$_get(0)).assertEqual(1);
      expect(p.$_get(1)).assertEqual(2);
      expect(p.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArraySubarrayPart04TestMindmapTest057
     * @tc.desc Verify subarray() $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let p: Int32Array = new Int32Array(0);
        let c: Int32Array = p.subarray();
        c.$_set(0, 1);
        expect(c.length).assertEqual(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArraySubarrayPart04TestMindmapTest058
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let b: Int32Array = a.subarray(1, 3);
      expect(b.buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArraySubarrayPart04TestMindmapTest059
     * @tc.desc Verify slice slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let s: Int32Array = a.slice(1, 4);
      a.$_set(2, 999);
      expect(s.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArraySubarrayPart04TestMindmapTest060
     * @tc.desc Verify subarray slice slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let c: Int32Array = a.subarray(0, 5);
      let s: Int32Array = c.slice(1, 4);
      s.$_set(0, 888);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArraySubarrayPart04TestMindmapTest061
     * @tc.desc Verify slice buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let s: Int32Array = a.slice(0, 2);
      expect(s.buffer).not().assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArraySubarrayPart04TestMindmapTest062
     * @tc.desc Verify ArrayBuffer byteOffset subarray offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let base: Int32Array = new Int32Array(buf, 4, 4);
      let sub: Int32Array = base.subarray(2);
      expect(sub.byteOffset).assertEqual(12);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArraySubarrayPart04TestMindmapTest063
     * @tc.desc Verify offset subarray $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let base: Int32Array = new Int32Array(buf, 4, 4);
      base.$_set(0, 100);
      base.$_set(1, 200);
      base.$_set(2, 300);
      base.$_set(3, 400);
      let sub: Int32Array = base.subarray(1, 3);
      sub.$_set(1, 999);
      expect(base.$_get(2)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArraySubarrayPart04TestMindmapTest064
     * @tc.desc Verify offset byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let base: Int32Array = new Int32Array(buf, 4, 6);
      let child: Int32Array = base.subarray(2);
      let grand: Int32Array = child.subarray(1);
      expect(grand.byteOffset).assertEqual(4 + (2 + 1) * 4);
      expect(grand.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArraySubarrayPart04TestMindmapTest065
     * @tc.desc Verify set RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(6);
      let c: Int32Array = p.subarray(3, 5);
      let src: Int32Array = new Int32Array([1, 2, 3]);
      try {
        c.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArraySubarrayPart04TestMindmapTest066
     * @tc.desc Verify set offset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      let c: Int32Array = p.subarray(0, 5);
      let src: Int32Array = new Int32Array([1]);
      try {
        c.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(p.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArraySubarrayPart04TestMindmapTest067
     * @tc.desc Verify with length RangeError buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let c: Int32Array = p.subarray(1, 4);
      try {
        c.with(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(p.$_get(1)).assertEqual(2);
      expect(p.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_6800
     * @tc.name int32ArraySubarrayPart04TestMindmapTest068
     * @tc.desc Verify with -length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(5);
      let c: Int32Array = p.subarray(1, 4);
      try {
        c.with(-4, 88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_6900
     * @tc.name int32ArraySubarrayPart04TestMindmapTest069
     * @tc.desc Verify buffer transfer length/byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let c: Int32Array = p.subarray(1, 4);
      let lenBefore: number = c.length;
      let offBefore: number = c.byteOffset;
      p.$_set(1, 20);
      expect(c.length).assertEqual(lenBefore);
      expect(c.byteOffset).assertEqual(offBefore);
      expect(c.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_7000
     * @tc.name int32ArraySubarrayPart04TestMindmapTest070
     * @tc.desc Verify transfer buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(4);
      let c: Int32Array = p.subarray(0, 2);
      p.$_set(0, 7);
      expect(c.length).assertEqual(2);
      expect(c.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_7100
     * @tc.name int32ArraySubarrayPart04TestMindmapTest071
     * @tc.desc Verify BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(5);
      let c: Int32Array = p.subarray(1, 3);
      expect(c.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_7200
     * @tc.name int32ArraySubarrayPart04TestMindmapTest072
     * @tc.desc Verify BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(5);
      let c: Int32Array = p.subarray(2, 2);
      expect(c.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_7300
     * @tc.name int32ArraySubarrayPart04TestMindmapTest073
     * @tc.desc Verify subarray(0,3) returns an Int32Array view with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(4);
      let c: Int32Array = p.subarray(0, 3);
      expect(c.length).assertEqual(3);
      expect(c.$_get(0)).assertEqual(0);
      expect(c.buffer).assertEqual(p.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_7400
     * @tc.name int32ArraySubarrayPart04TestMindmapTest074
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([100, 200, 300, 400, 500]);
      let c: Int32Array = p.subarray(1, 4);
      expect(c.toString()).assertEqual('200,300,400');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_7500
     * @tc.name int32ArraySubarrayPart04TestMindmapTest075
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let c: Int32Array = p.subarray(2, 5);
      expect(c.join('-')).assertEqual('3-4-5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_7600
     * @tc.name int32ArraySubarrayPart04TestMindmapTest076
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let c: Int32Array = p.subarray(0, 6);
      let seen: number[] = [];
      c.forEach((val: number, idx: int) => {
        seen.push(val);
        if (idx === 2) {
          p.$_set(4, 999);
        }
      });
      expect(seen[0]).assertEqual(1);
      expect(seen[4]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_7700
     * @tc.name int32ArraySubarrayPart04TestMindmapTest077
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      let c: Int32Array = p.subarray(0, 5);
      let out: Int32Array = c.map((val: number, idx: int, _a: Int32Array): number => {
        if (idx === 0) {
          c.$_set(2, 55);
        }
        return val + idx;
      });
      expect(out.$_get(0)).assertEqual(0);
      expect(p.$_get(2)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_7800
     * @tc.name int32ArraySubarrayPart04TestMindmapTest078
     * @tc.desc Verify for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([1, 2, 3, 4]);
      let c: Int32Array = p.subarray(0, 4);
      let collected: number[] = [];
      for (let i = 0; i < c.length; i++) {
        let v = c.$_get(i);
        collected.push(v);
        if (v === 2) {
          p.$_set(3, 88);
        }
      }
      expect(collected[3]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_7900
     * @tc.name int32ArraySubarrayPart04TestMindmapTest079
     * @tc.desc Verify forEach length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let c: Int32Array = p.subarray(1, 4);
      let cnt: number = 0;
      c.forEach((_v: number, _i: int, _a: Int32Array) => {
        cnt = cnt + 1;
      });
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_8000
     * @tc.name int32ArraySubarrayPart04TestMindmapTest080
     * @tc.desc Verify reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let c: Int32Array = p.subarray(1, 4);
      let sum: number = c.reduce((acc: number, v: number): number => acc + v);
      expect(sum).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_8100
     * @tc.name int32ArraySubarrayPart04TestMindmapTest081
     * @tc.desc Verify some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let c: Int32Array = p.subarray(0, 5);
      let calls: number = 0;
      let hit: boolean = c.some((v: number, _i: int, _a: Int32Array): boolean => {
        calls = calls + 1;
        return v === 3;
      });
      expect(hit).assertTrue();
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_8200
     * @tc.name int32ArraySubarrayPart04TestMindmapTest082
     * @tc.desc Verify begin=end length=0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(5);
      let c: Int32Array = p.subarray(3, 3);
      expect(c.length).assertEqual(0);
      expect(c.buffer).assertEqual(p.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_8300
     * @tc.name int32ArraySubarrayPart04TestMindmapTest083
     * @tc.desc Verify begin>end byteOffset clamp begin 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(10);
      let c: Int32Array = p.subarray(6, 2);
      expect(c.length).assertEqual(0);
      expect(c.byteOffset).assertEqual(6 * 4);
      expect(c.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_8400
     * @tc.name int32ArraySubarrayPart04TestMindmapTest084
     * @tc.desc Verify subarray(0,1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([99]);
      let c: Int32Array = p.subarray(0, 1);
      c.$_set(0, 7);
      expect(p.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_8500
     * @tc.name int32ArraySubarrayPart04TestMindmapTest085
     * @tc.desc Verify subarray(1,1) byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([99]);
      let c: Int32Array = p.subarray(1, 1);
      expect(c.length).assertEqual(0);
      expect(c.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_8600
     * @tc.name int32ArraySubarrayPart04TestMindmapTest086
     * @tc.desc Verify (begin=0) (end=length) subarray()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([1, 2, 3]);
      let c1: Int32Array = p.subarray(0, 3);
      let c2: Int32Array = p.subarray();
      expect(c1.length).assertEqual(c2.length);
      expect(c1.byteOffset).assertEqual(c2.byteOffset);
      expect(c1.buffer).assertEqual(c2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_8700
     * @tc.name int32ArraySubarrayPart04TestMindmapTest087
     * @tc.desc Verify fill reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let c: Int32Array = p.subarray(1, 5);
      c.fill(0);
      p.reverse();
      expect(p.$_get(0)).assertEqual(6);
      expect(p.$_get(1)).assertEqual(0);
      expect(p.$_get(2)).assertEqual(0);
      expect(p.$_get(3)).assertEqual(0);
      expect(p.$_get(4)).assertEqual(0);
      expect(p.$_get(5)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_8800
     * @tc.name int32ArraySubarrayPart04TestMindmapTest088
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([8, 1, 2, 3, 8]);
      let c: Int32Array = p.subarray(1, 4);
      c.copyWithin(0, 2, 3);
      expect(p.$_get(1)).assertEqual(3);
      expect(p.$_get(2)).assertEqual(2);
      expect(p.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_8900
     * @tc.name int32ArraySubarrayPart04TestMindmapTest089
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(6);
      let a: Int32Array = p.subarray(0, 4);
      let b: Int32Array = p.subarray(2, 6);
      a.fill(1);
      b.fill(2);
      expect(p.$_get(0)).assertEqual(1);
      expect(p.$_get(1)).assertEqual(1);
      expect(p.$_get(2)).assertEqual(2);
      expect(p.$_get(3)).assertEqual(2);
      expect(p.$_get(4)).assertEqual(2);
      expect(p.$_get(5)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_9000
     * @tc.name int32ArraySubarrayPart04TestMindmapTest090
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array([99, 5, 3, 8, 1, 77]);
      let c: Int32Array = p.subarray(1, 5);
      c.sort();
      expect(p.$_get(0)).assertEqual(99);
      expect(p.$_get(1)).assertEqual(1);
      expect(p.$_get(2)).assertEqual(3);
      expect(p.$_get(3)).assertEqual(5);
      expect(p.$_get(4)).assertEqual(8);
      expect(p.$_get(5)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART04_TEST_MINDMAP_9100
     * @tc.name int32ArraySubarrayPart04TestMindmapTest091
     * @tc.desc Verify set subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart04TestMindmapTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Int32Array = new Int32Array(8);
      p.subarray(2, 6).set(new Int32Array([10, 20, 30, 40]));
      let verify: Int32Array = p.subarray(2, 6);
      expect(verify.$_get(0)).assertEqual(10);
      expect(verify.$_get(3)).assertEqual(40);
    });
  });
}
