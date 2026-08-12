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

export default function int32ArraySubarrayPart01TestMindmapTest(): void {
  describe('int32ArraySubarrayPart01TestMindmapTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArraySubarrayPart01TestMindmapTest001
     * @tc.desc Verify 0 subarray() 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33, 44, 55);
      let r: Int32Array = arr.subarray();
      expect(r.length).assertEqual(5);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(4)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArraySubarrayPart01TestMindmapTest002
     * @tc.desc Verify 0 subarray()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(99);
      let r: Int32Array = arr.subarray();
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArraySubarrayPart01TestMindmapTest003
     * @tc.desc Verify 0 subarray() ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let r: Int32Array = arr.subarray();
      expect(r.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArraySubarrayPart01TestMindmapTest004
     * @tc.desc Verify 0 subarray() byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.subarray();
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArraySubarrayPart01TestMindmapTest005
     * @tc.desc Verify 0 subarray() byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.subarray();
      expect(r.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArraySubarrayPart01TestMindmapTest006
     * @tc.desc Verify 0 subarray() Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: Int32Array = arr.subarray();
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArraySubarrayPart01TestMindmapTest007
     * @tc.desc Verify 1 subarray(begin)begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Int32Array = arr.subarray(0);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArraySubarrayPart01TestMindmapTest008
     * @tc.desc Verify 1 subarray(begin)begin=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.subarray(1);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(20);
      expect(r.$_get(3)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArraySubarrayPart01TestMindmapTest009
     * @tc.desc Verify 1 subarray(begin)begin=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.subarray(-1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArraySubarrayPart01TestMindmapTest010
     * @tc.desc Verify 1 subarray(begin)begin=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.subarray(-5);
      expect(r.length).assertEqual(5);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArraySubarrayPart01TestMindmapTest011
     * @tc.desc Verify 1 subarray(begin)begin=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.subarray(5);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArraySubarrayPart01TestMindmapTest012
     * @tc.desc Verify 1 subarray(begin)begin=length+1 clamp length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: Int32Array = arr.subarray(4);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArraySubarrayPart01TestMindmapTest013
     * @tc.desc Verify 1 subarray(begin)begin=-(length+1) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.subarray(-6);
      expect(r.length).assertEqual(5);
      expect(r.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArraySubarrayPart01TestMindmapTest014
     * @tc.desc Verify 1 subarray(begin)begin INT_MAX clamp length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.subarray(2147483647);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArraySubarrayPart01TestMindmapTest015
     * @tc.desc Verify 1 subarray(begin)begin INT_MIN clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.subarray(-2147483648);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArraySubarrayPart01TestMindmapTest016
     * @tc.desc Verify 1 subarray(begin) begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.subarray(0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArraySubarrayPart01TestMindmapTest017
     * @tc.desc Verify 1 subarray(begin)begin=0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      let r: Int32Array = arr.subarray(0);
      expect(r.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArraySubarrayPart01TestMindmapTest018
     * @tc.desc Verify 1 subarray(begin)begin>0 byteOffset begin BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Int32Array = arr.subarray(2);
      expect(r.byteOffset).assertEqual(8);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArraySubarrayPart01TestMindmapTest019
     * @tc.desc Verify 2 subarray(begin,end)begin=0,end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: Int32Array = arr.subarray(0, 5);
      expect(r.length).assertEqual(5);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArraySubarrayPart01TestMindmapTest020
     * @tc.desc Verify 2 subarray(begin,end)begin=0,end=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.subarray(0, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArraySubarrayPart01TestMindmapTest021
     * @tc.desc Verify 2 subarray(begin,end)begin=2,end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.subarray(2, 4);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(30);
      expect(r.$_get(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArraySubarrayPart01TestMindmapTest022
     * @tc.desc Verify 2 subarray(begin,end)begin=0,end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.subarray(0, -1);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArraySubarrayPart01TestMindmapTest023
     * @tc.desc Verify 2 subarray(begin,end)begin=-3,end=-1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.subarray(-3, -1);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(30);
      expect(r.$_get(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArraySubarrayPart01TestMindmapTest024
     * @tc.desc Verify 2 subarray(begin,end)begin=-length,end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.subarray(-4, 4);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArraySubarrayPart01TestMindmapTest025
     * @tc.desc Verify 2 subarray(begin,end)begin=length,end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.subarray(3, 3);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArraySubarrayPart01TestMindmapTest026
     * @tc.desc Verify 2 subarray(begin,end)begin end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: Int32Array = arr.subarray(3, 1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArraySubarrayPart01TestMindmapTest027
     * @tc.desc Verify 2 subarray(begin,end)begin=INT_MIN,end=INT_MAX clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      let r: Int32Array = arr.subarray(-2147483648, 2147483647);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArraySubarrayPart01TestMindmapTest028
     * @tc.desc Verify 2 subarray(begin,end)begin=1,end=-length end 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Int32Array = arr.subarray(1, -4);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArraySubarrayPart01TestMindmapTest029
     * @tc.desc Verify 2 subarray(begin,end) subarray(0,1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(77);
      let r: Int32Array = arr.subarray(0, 1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArraySubarrayPart01TestMindmapTest030
     * @tc.desc Verify 2 subarray(begin,end)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.subarray(0, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArraySubarrayPart01TestMindmapTest031
     * @tc.desc Verify begin end=2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.subarray(0, 2);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArraySubarrayPart01TestMindmapTest032
     * @tc.desc Verify begin end=-2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.subarray(0, -2);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArraySubarrayPart01TestMindmapTest033
     * @tc.desc Verify begin=length-1 end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Int32Array = arr.subarray(3, 4);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArraySubarrayPart01TestMindmapTest034
     * @tc.desc Verify begin=-1 end=length begin=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r1: Int32Array = arr.subarray(-1, 4);
      let r2: Int32Array = arr.subarray(3, 4);
      expect(r1.length).assertEqual(r2.length);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArraySubarrayPart01TestMindmapTest035
     * @tc.desc Verify begin=0,end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: Int32Array = arr.subarray(0, 1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArraySubarrayPart01TestMindmapTest036
     * @tc.desc Verify begin 3 6 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 10, 20, 30, 40, 50);
      let r: Int32Array = arr.subarray(3);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(30);
      expect(r.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArraySubarrayPart01TestMindmapTest037
     * @tc.desc Verify begin=-2 5 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.subarray(-2);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(40);
      expect(r.$_get(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArraySubarrayPart01TestMindmapTest038
     * @tc.desc Verify begin=0 begin=-length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r1: Int32Array = arr.subarray(0);
      let r2: Int32Array = arr.subarray(-5);
      expect(r1.length).assertEqual(r2.length);
      expect(r1.byteOffset).assertEqual(r2.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArraySubarrayPart01TestMindmapTest039
     * @tc.desc Verify end length begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.subarray(2);
      expect(r.length).assertEqual(3);
      expect(r.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArraySubarrayPart01TestMindmapTest040
     * @tc.desc Verify end=-3 5 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.subarray(0, -3);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArraySubarrayPart01TestMindmapTest041
     * @tc.desc Verify end=-(length+1) 0 begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.subarray(0, -5);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArraySubarrayPart01TestMindmapTest042
     * @tc.desc Verify end=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Int32Array = arr.subarray(0, -4);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArraySubarrayPart01TestMindmapTest043
     * @tc.desc Verify end=length+1 clamp length begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: Int32Array = arr.subarray(1, 100);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(20);
      expect(r.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArraySubarrayPart01TestMindmapTest044
     * @tc.desc Verify begin end begin=-2,end=4 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.subarray(-2, 4);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArraySubarrayPart01TestMindmapTest045
     * @tc.desc Verify subarray BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.subarray(1, 2);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArraySubarrayPart01TestMindmapTest046
     * @tc.desc Verify subarray length end-begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0, 0, 0);
      let r: Int32Array = arr.subarray(1, 4);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArraySubarrayPart01TestMindmapTest047
     * @tc.desc Verify subarray byteLength length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: Int32Array = arr.subarray(1, 4);
      expect(r.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArraySubarrayPart01TestMindmapTest048
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.subarray(1, 2);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArraySubarrayPart01TestMindmapTest049
     * @tc.desc Verify subarray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.subarray(0, 2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArraySubarrayPart01TestMindmapTest050
     * @tc.desc Verify subarray Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r1: Int32Array = arr.subarray();
      let r2: Int32Array = arr.subarray();
      let notSame: boolean = (r1 !== r2);
      expect(notSame).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArraySubarrayPart01TestMindmapTest051
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.subarray(1, 3);
      r.$_set(0, 99);
      expect(arr.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArraySubarrayPart01TestMindmapTest052
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.subarray(1, 3);
      arr.$_set(2, 77);
      expect(r.$_get(1)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArraySubarrayPart01TestMindmapTest053
     * @tc.desc Verify writes through a subarray view update the corresponding source element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: Int32Array = arr.subarray(0, 2);
      r.$_set(0, 111);
      expect(arr.$_get(0)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArraySubarrayPart01TestMindmapTest054
     * @tc.desc Verify subarray subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r1: Int32Array = arr.subarray(1);
      let r2: Int32Array = r1.subarray(1);
      expect(r2.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArraySubarrayPart01TestMindmapTest055
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
      let grand: Int32Array = arr.subarray(1).subarray(1);
      grand.$_set(0, 88);
      expect(arr.$_get(2)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArraySubarrayPart01TestMindmapTest056
     * @tc.desc Verify byteOffset byteOffset begin 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 10, 20, 30, 40);
      let r: Int32Array = arr.subarray(2);
      expect(r.byteOffset).assertEqual(8);
      expect(r.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArraySubarrayPart01TestMindmapTest057
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.subarray(2, 2);
      expect(r.length).assertEqual(0);
      expect(r.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArraySubarrayPart01TestMindmapTest058
     * @tc.desc Verify $_set on an empty subarray throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
      * @tc.level LEVEL2
      */
    it('int32ArraySubarrayPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = Int32Array.of(1, 2, 3);
        let r: Int32Array = arr.subarray(1, 1);
        r.$_set(0, 999);
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(1)).assertEqual(2);
        expect(arr.$_get(2)).assertEqual(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArraySubarrayPart01TestMindmapTest059
     * @tc.desc Verify subarray BYTES_PER_ELEMENT=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: Int32Array = arr.subarray().subarray();
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArraySubarrayPart01TestMindmapTest060
     * @tc.desc Verify subarray ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let base: Int32Array = new Int32Array(buf, 4, 3);
      base.$_set(0, 100);
      base.$_set(1, 200);
      base.$_set(2, 300);
      let r: Int32Array = base.subarray(1);
      expect(r.$_get(0)).assertEqual(200);
      expect(r.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArraySubarrayPart01TestMindmapTest061
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0);
      let r: Int32Array = arr.subarray(0, 4);
      r.$_set(0, 1);
      r.$_set(1, 2);
      r.$_set(2, 3);
      r.$_set(3, 4);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArraySubarrayPart01TestMindmapTest062
     * @tc.desc Verify subarray(0) byteOffset 0 byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7, 8);
      let r: Int32Array = arr.subarray(0);
      expect(r.byteOffset).assertEqual(0);
      expect(r.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArraySubarrayPart01TestMindmapTest063
     * @tc.desc Verify subarray() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.subarray();
      expect(r.length).assertEqual(0);
      expect(r.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArraySubarrayPart01TestMindmapTest064
     * @tc.desc Verify subarray(2,2) subarray(1,1) buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r1: Int32Array = arr.subarray(2, 2);
      let r2: Int32Array = arr.subarray(1, 1);
      expect(r1.buffer).assertEqual(r2.buffer);
      expect(r1.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArraySubarrayPart01TestMindmapTest065
     * @tc.desc Verify 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Int32Array = arr.subarray(2, 3);
      r.$_set(0, -5);
      expect(arr.$_get(2)).assertEqual(-5);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArraySubarrayPart01TestMindmapTest066
     * @tc.desc Verify a single-element subarray shares storage with its source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: Int32Array = arr.subarray(0, 1);
      expect(r.$_get(0)).assertEqual(arr.$_get(0));
      r.$_set(0, 84);
      expect(arr.$_get(0)).assertEqual(84);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArraySubarrayPart01TestMindmapTest067
     * @tc.desc Verify subarray subarray byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
      let r1: Int32Array = arr.subarray(1);
      let r2: Int32Array = r1.subarray(2);
      expect(r2.byteOffset).assertEqual(12);
      expect(r2.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArraySubarrayPart01TestMindmapTest068
     * @tc.desc Verify at(5) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.subarray(0, 2);
      let v: number | undefined = r.at(5);
      let isUndef: boolean = (v === undefined);
      expect(isUndef).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArraySubarrayPart01TestMindmapTest069
     * @tc.desc Verify INT_MIN subarray INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, 0, 2147483647);
      let r: Int32Array = arr.subarray(0, 3);
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArraySubarrayPart01TestMindmapTest070
     * @tc.desc Verify 8 subarray(2,6) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2, 3, 4, 5, 6, 7);
      let r: Int32Array = arr.subarray(2, 6);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(3)).assertEqual(5);
      expect(r.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArraySubarrayPart01TestMindmapTest071
     * @tc.desc Verify subarray fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0);
      let r: Int32Array = arr.subarray(1, 3);
      arr.fill(7);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArraySubarrayPart01TestMindmapTest072
     * @tc.desc Verify fill buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
      let r: Int32Array = arr.subarray(1, 4);
      r.fill(9);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(9);
      expect(arr.$_get(4)).assertEqual(0);
    });
  });
}
