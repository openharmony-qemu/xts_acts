'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
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

export default function int32ArraySlicePart01Test(): void {
  describe('Int32ArraySlicePart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArraySlicePart01TestMindmapTest001
     * @tc.desc Verify slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      let r: Int32Array = arr.slice();
      expect(r.length).assertEqual(6);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(5)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArraySlicePart01TestMindmapTest002
     * @tc.desc Verify slice() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.slice();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArraySlicePart01TestMindmapTest003
     * @tc.desc Verify slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      let r: Int32Array = arr.slice();
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArraySlicePart01TestMindmapTest004
     * @tc.desc Verify slice(begin) begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 8, 7, 6, 5]);
      let r: Int32Array = arr.slice(0);
      expect(r.length).assertEqual(5);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArraySlicePart01TestMindmapTest005
     * @tc.desc Verify slice(begin) begin=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300, 400, 500, 600]);
      let r: Int32Array = arr.slice(3);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(400);
      expect(r.$_get(2)).assertEqual(600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArraySlicePart01TestMindmapTest006
     * @tc.desc Verify slice(begin) begin=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.slice(-1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArraySlicePart01TestMindmapTest007
     * @tc.desc Verify slice(begin) begin length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.slice(3);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArraySlicePart01TestMindmapTest008
     * @tc.desc Verify slice(begin,end) (2,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
      let r: Int32Array = arr.slice(2, 5);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(30);
      expect(r.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArraySlicePart01TestMindmapTest009
     * @tc.desc Verify slice(begin,end) (0,length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7, 8]);
      let r: Int32Array = arr.slice(0, 4);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArraySlicePart01TestMindmapTest010
     * @tc.desc Verify slice(begin,end) (-5,-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
      let r: Int32Array = arr.slice(-5, -2);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(20);
      expect(r.$_get(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArraySlicePart01TestMindmapTest011
     * @tc.desc Verify slice(begin,end) (-3,6)begin end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
      let r: Int32Array = arr.slice(-3, 6);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(40);
      expect(r.$_get(2)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArraySlicePart01TestMindmapTest012
     * @tc.desc Verify slice(begin,end) (2,-1)begin end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
      let r: Int32Array = arr.slice(2, -1);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(30);
      expect(r.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArraySlicePart01TestMindmapTest013
     * @tc.desc Verify begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9, 10]);
      let r: Int32Array = arr.slice(0);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArraySlicePart01TestMindmapTest014
     * @tc.desc Verify begin=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9, 10]);
      let r: Int32Array = arr.slice(1);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(8);
      expect(r.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArraySlicePart01TestMindmapTest015
     * @tc.desc Verify begin=length-1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9, 10]);
      let r: Int32Array = arr.slice(3);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArraySlicePart01TestMindmapTest016
     * @tc.desc Verify begin=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9, 10]);
      let r: Int32Array = arr.slice(4);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArraySlicePart01TestMindmapTest017
     * @tc.desc Verify begin=length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9, 10]);
      let r: Int32Array = arr.slice(5);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArraySlicePart01TestMindmapTest018
     * @tc.desc Verify begin=100 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9, 10]);
      let r: Int32Array = arr.slice(100);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArraySlicePart01TestMindmapTest019
     * @tc.desc Verify begin=2147483647 int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.slice(2147483647);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArraySlicePart01TestMindmapTest020
     * @tc.desc Verify begin=-1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let r: Int32Array = arr.slice(-1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArraySlicePart01TestMindmapTest021
     * @tc.desc Verify begin=-2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let r: Int32Array = arr.slice(-2);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(1)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArraySlicePart01TestMindmapTest022
     * @tc.desc Verify begin=-length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let r: Int32Array = arr.slice(-6);
      expect(r.length).assertEqual(6);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(5)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArraySlicePart01TestMindmapTest023
     * @tc.desc Verify begin=-length-1 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let r: Int32Array = arr.slice(-7);
      expect(r.length).assertEqual(6);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArraySlicePart01TestMindmapTest024
     * @tc.desc Verify begin=-100 -length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let r: Int32Array = arr.slice(-100);
      expect(r.length).assertEqual(6);
      expect(r.$_get(5)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArraySlicePart01TestMindmapTest025
     * @tc.desc Verify begin=-2147483648 int32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42, 43, 44]);
      let r: Int32Array = arr.slice(-2147483648);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(42);
      expect(r.$_get(2)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArraySlicePart01TestMindmapTest026
     * @tc.desc Verify end=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let r: Int32Array = arr.slice(0, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArraySlicePart01TestMindmapTest027
     * @tc.desc Verify end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let r: Int32Array = arr.slice(0, 1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArraySlicePart01TestMindmapTest028
     * @tc.desc Verify end=length-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let r: Int32Array = arr.slice(0, 3);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArraySlicePart01TestMindmapTest029
     * @tc.desc Verify end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let r: Int32Array = arr.slice(0, 4);
      expect(r.length).assertEqual(4);
      expect(r.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArraySlicePart01TestMindmapTest030
     * @tc.desc Verify end=length+1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let r: Int32Array = arr.slice(0, 5);
      expect(r.length).assertEqual(4);
      expect(r.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArraySlicePart01TestMindmapTest031
     * @tc.desc Verify end=200 length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let r: Int32Array = arr.slice(0, 200);
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArraySlicePart01TestMindmapTest032
     * @tc.desc Verify end=2147483647 int32 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.slice(0, 2147483647);
      expect(r.length).assertEqual(3);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArraySlicePart01TestMindmapTest033
     * @tc.desc Verify end=-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let r: Int32Array = arr.slice(0, -1);
      expect(r.length).assertEqual(4);
      expect(r.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArraySlicePart01TestMindmapTest034
     * @tc.desc Verify end=-2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let r: Int32Array = arr.slice(0, -2);
      expect(r.length).assertEqual(3);
      expect(r.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArraySlicePart01TestMindmapTest035
     * @tc.desc Verify end=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let r: Int32Array = arr.slice(0, -5);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArraySlicePart01TestMindmapTest036
     * @tc.desc Verify end=-length-1 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let r: Int32Array = arr.slice(0, -6);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArraySlicePart01TestMindmapTest037
     * @tc.desc Verify end=-50 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let r: Int32Array = arr.slice(0, -50);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArraySlicePart01TestMindmapTest038
     * @tc.desc Verify end=-2147483648 int32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.slice(0, -2147483648);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArraySlicePart01TestMindmapTest039
     * @tc.desc Verify length=1 [42] begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.slice(0);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArraySlicePart01TestMindmapTest040
     * @tc.desc Verify length=1 [42] begin=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.slice(1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArraySlicePart01TestMindmapTest041
     * @tc.desc Verify length=1 [42] begin=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.slice(-1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArraySlicePart01TestMindmapTest042
     * @tc.desc Verify length=1 [42] begin=-2 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.slice(-2);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArraySlicePart01TestMindmapTest043
     * @tc.desc Verify length=2 [-100,100] begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-100, 100]);
      let r: Int32Array = arr.slice(0);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(-100);
      expect(r.$_get(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArraySlicePart01TestMindmapTest044
     * @tc.desc Verify length=2 [-100,100] begin=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-100, 100]);
      let r: Int32Array = arr.slice(1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArraySlicePart01TestMindmapTest045
     * @tc.desc Verify length=2 [-100,100] begin=-1 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-100, 100]);
      let r: Int32Array = arr.slice(-1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArraySlicePart01TestMindmapTest046
     * @tc.desc Verify length=2 [-100,100] begin=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-100, 100]);
      let r: Int32Array = arr.slice(-2);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(-100);
      expect(r.$_get(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArraySlicePart01TestMindmapTest047
     * @tc.desc Verify length=3 begin=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.slice(1);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArraySlicePart01TestMindmapTest048
     * @tc.desc Verify length=3 begin=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.slice(-1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArraySlicePart01TestMindmapTest049
     * @tc.desc Verify INT_MIN/0/INT_MAX begin=0 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0, 2147483647]);
      let r: Int32Array = arr.slice(0);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArraySlicePart01TestMindmapTest050
     * @tc.desc Verify INT_MIN/0/INT_MAX begin=-1 [INT_MAX]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0, 2147483647]);
      let r: Int32Array = arr.slice(-1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArraySlicePart01TestMindmapTest051
     * @tc.desc Verify length=1 [42] end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.slice(0, 1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArraySlicePart01TestMindmapTest052
     * @tc.desc Verify length=1 [42] end=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.slice(0, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArraySlicePart01TestMindmapTest053
     * @tc.desc Verify length=1 [42] end=-1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.slice(0, -1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArraySlicePart01TestMindmapTest054
     * @tc.desc Verify length=1 [42] end=-2 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.slice(0, -2);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArraySlicePart01TestMindmapTest055
     * @tc.desc Verify length=2 [-100,100] end=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-100, 100]);
      let r: Int32Array = arr.slice(0, 2);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(-100);
      expect(r.$_get(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArraySlicePart01TestMindmapTest056
     * @tc.desc Verify length=2 [-100,100] end=-1 [-100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-100, 100]);
      let r: Int32Array = arr.slice(0, -1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArraySlicePart01TestMindmapTest057
     * @tc.desc Verify INT_MIN/0/INT_MAX end=3 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0, 2147483647]);
      let r: Int32Array = arr.slice(0, 3);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArraySlicePart01TestMindmapTest058
     * @tc.desc Verify INT_MIN/0/INT_MAX end=-1 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0, 2147483647]);
      let r: Int32Array = arr.slice(0, -1);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArraySlicePart01TestMindmapTest059
     * @tc.desc Verify begin=0 end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 8, 7, 6, 5]);
      let r: Int32Array = arr.slice(0, 1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArraySlicePart01TestMindmapTest060
     * @tc.desc Verify begin=length-1 end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 8, 7, 6, 5]);
      let r: Int32Array = arr.slice(4, 5);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArraySlicePart01TestMindmapTest061
     * @tc.desc Verify begin=-length end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 8, 7, 6, 5]);
      let r: Int32Array = arr.slice(-5, 5);
      expect(r.length).assertEqual(5);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArraySlicePart01TestMindmapTest062
     * @tc.desc Verify begin=-length end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 8, 7, 6, 5]);
      let r: Int32Array = arr.slice(-5, -1);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArraySlicePart01TestMindmapTest063
     * @tc.desc Verify begin=1 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 8, 7, 6, 5]);
      let r: Int32Array = arr.slice(1, 4);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(8);
      expect(r.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArraySlicePart01TestMindmapTest064
     * @tc.desc Verify begin=INT_MIN end=INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.slice(-2147483648, 2147483647);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArraySlicePart01TestMindmapTest065
     * @tc.desc Verify begin=1 end=INT_MAX begin end 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.slice(1, 2147483647);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArraySlicePart01TestMindmapTest066
     * @tc.desc Verify begin=INT_MIN end=-1begin end=-1 0 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.slice(-2147483648, -1);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArraySlicePart01TestMindmapTest067
     * @tc.desc Verify length=8 begin=2 end=6 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60, 70, 80]);
      let r: Int32Array = arr.slice(2, 6);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(30);
      expect(r.$_get(3)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArraySlicePart01TestMindmapTest068
     * @tc.desc Verify length=8 begin=1 end=-2 begin end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60, 70, 80]);
      let r: Int32Array = arr.slice(1, -2);
      expect(r.length).assertEqual(5);
      expect(r.$_get(0)).assertEqual(20);
      expect(r.$_get(4)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArraySlicePart01TestMindmapTest069
     * @tc.desc Verify begin=-1 end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.slice(-1, 1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArraySlicePart01TestMindmapTest070
     * @tc.desc Verify begin=INT_MIN end=INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.slice(-2147483648, 2147483647);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArraySlicePart01TestMindmapTest071
     * @tc.desc Verify [0,INT_MAX,INT_MIN,-1] begin=1 end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 2147483647, -2147483648, -1]);
      let r: Int32Array = arr.slice(1, 3);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(2147483647);
      expect(r.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArraySlicePart01TestMindmapTest072
     * @tc.desc Verify [-5,-4,-3,-2,-1] begin=1 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-5, -4, -3, -2, -1]);
      let r: Int32Array = arr.slice(1, 4);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(-4);
      expect(r.$_get(1)).assertEqual(-3);
      expect(r.$_get(2)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArraySlicePart01TestMindmapTest073
     * @tc.desc Verify from slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([11, 22, 33, 44] as int[]);
      let r: Int32Array = arr.slice();
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_7400
     * @tc.name int32ArraySlicePart01TestMindmapTest074
     * @tc.desc Verify from slice(-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([11, 22, 33, 44] as int[]);
      let r: Int32Array = arr.slice(-2);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(33);
      expect(r.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_7500
     * @tc.name int32ArraySlicePart01TestMindmapTest075
     * @tc.desc Verify from slice(1,-1) [22,33]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([11, 22, 33, 44] as int[]);
      let r: Int32Array = arr.slice(1, -1);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(22);
      expect(r.$_get(1)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_7600
     * @tc.name int32ArraySlicePart01TestMindmapTest076
     * @tc.desc Verify ArrayBuffer 6 Int32Arrayslice(2,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      arr.$_set(3, 40);
      arr.$_set(4, 50);
      arr.$_set(5, 60);
      let r: Int32Array = arr.slice(2, 5);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(30);
      expect(r.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_7700
     * @tc.name int32ArraySlicePart01TestMindmapTest077
     * @tc.desc Verify ArrayBuffer slice(-3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      arr.$_set(3, 40);
      arr.$_set(4, 50);
      arr.$_set(5, 60);
      let r: Int32Array = arr.slice(-3);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(40);
      expect(r.$_get(2)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_7800
     * @tc.name int32ArraySlicePart01TestMindmapTest078
     * @tc.desc Verify [1..4] begin=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.slice(2);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART01_TEST_MINDMAP_7900
     * @tc.name int32ArraySlicePart01TestMindmapTest079
     * @tc.desc Verify [1..5] begin=2 end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart01TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let r: Int32Array = arr.slice(2, 3);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(3);
    });
  });
}
