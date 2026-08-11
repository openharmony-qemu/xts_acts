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

export default function int32ArrayToSortedPart01TestMindmapTestTest(): void {
  describe('Int32ArrayToSortedPart01TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayToSortedPart01TestMindmapTest001
     * @tc.desc Verify toSorted() Int32Array ( Array )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 2, 7]);
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayToSortedPart01TestMindmapTest002
     * @tc.desc Verify toSorted() BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toSorted();
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayToSortedPart01TestMindmapTest003
     * @tc.desc Verify toSorted() byteLength length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: Int32Array = arr.toSorted();
      expect(r.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayToSortedPart01TestMindmapTest004
     * @tc.desc Verify toSorted() , ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayToSortedPart01TestMindmapTest005
     * @tc.desc Verify toSorted(),this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 3, 5]);
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayToSortedPart01TestMindmapTest006
     * @tc.desc Verify 0 new Int32Array(0) toSorted() length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayToSortedPart01TestMindmapTest007
     * @tc.desc Verify 1 [0] toSorted() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayToSortedPart01TestMindmapTest008
     * @tc.desc Verify 1 [-1] toSorted() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayToSortedPart01TestMindmapTest009
     * @tc.desc Verify 2 [2,1] toSorted() [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayToSortedPart01TestMindmapTest010
     * @tc.desc Verify 2 [-1,1] toSorted() [-1,1]( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayToSortedPart01TestMindmapTest011
     * @tc.desc Verify 4 [4,3,2,1] toSorted() [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 3, 2, 1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayToSortedPart01TestMindmapTest012
     * @tc.desc Verify [1,2,3,4,5] toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.$_get(3)).assertEqual(4);
      expect(r.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayToSortedPart01TestMindmapTest013
     * @tc.desc Verify [7,7,7] toSorted() 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(1)).assertEqual(7);
      expect(r.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayToSortedPart01TestMindmapTest014
     * @tc.desc Verify (16 ) toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([15, 3, 9, 0, 12, 6, 1, 14, 4, 8, 10, 2, 13, 5, 11, 7]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(15)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayToSortedPart01TestMindmapTest015
     * @tc.desc Verify 2 [2,1,1,3] toSorted() [1,1,2,3]( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 1, 1, 3]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(2);
      expect(r.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayToSortedPart01TestMindmapTest016
     * @tc.desc Verify [0,0,0] toSorted() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayToSortedPart01TestMindmapTest017
     * @tc.desc Verify (-0 int32 0) toSorted() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-0, 0, 1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayToSortedPart01TestMindmapTest018
     * @tc.desc Verify [0,-1,1] toSorted() [-1,0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -1, 1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayToSortedPart01TestMindmapTest019
     * @tc.desc Verify [-3,-1,-2] toSorted() [-3,-2,-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3, -1, -2]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-3);
      expect(r.$_get(1)).assertEqual(-2);
      expect(r.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayToSortedPart01TestMindmapTest020
     * @tc.desc Verify [5,1,3] toSorted() [1,3,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 1, 3]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayToSortedPart01TestMindmapTest021
     * @tc.desc Verify [-2,-1,0,1,2] [2,-1,0,-2,1] toSorted() [-2,-1,0,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, -1, 0, -2, 1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-2);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(1);
      expect(r.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayToSortedPart01TestMindmapTest022
     * @tc.desc Verify INT_MAX(2147483647) toSorted() 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayToSortedPart01TestMindmapTest023
     * @tc.desc Verify INT_MIN(-2147483648) toSorted() -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayToSortedPart01TestMindmapTest024
     * @tc.desc Verify INT_MAX 0 [0,2147483647] toSorted() [0,2147483647]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 2147483647]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayToSortedPart01TestMindmapTest025
     * @tc.desc Verify INT_MIN 0 [-2147483648,0] toSorted() [-2147483648,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayToSortedPart01TestMindmapTest026
     * @tc.desc Verify INT_MAX INT_MIN [2147483647,-2147483648] toSorted() [INT_MIN,INT_MAX]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayToSortedPart01TestMindmapTest027
     * @tc.desc Verify INT_MIN / -1 / 0 / 1 / INT_MAX toSorted() [INT_MIN,-1,0,1,INT_MAX]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2147483648, 2147483647, -1, 0]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(1);
      expect(r.$_get(4)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayToSortedPart01TestMindmapTest028
     * @tc.desc Verify INT_MAX 1 [2147483647,1] toSorted() [1,2147483647]; Also verify verify INT_MAX 0x7FFFFFFF 1 toSorted() [1,2147483647]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2147483647);

      {
      let arr: Int32Array = new Int32Array([0x7FFFFFFF, 1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2147483647);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayToSortedPart01TestMindmapTest029
     * @tc.desc Verify INT_MIN -1 [-1,-2147483648] toSorted() [INT_MIN,-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2147483648]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayToSortedPart01TestMindmapTest030
     * @tc.desc Verify INT_MAX [2147483647,2147483647,0] toSorted() [0,2147483647,2147483647]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 2147483647, 0]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(2147483647);
      expect(r.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayToSortedPart01TestMindmapTest031
     * @tc.desc Verify INT_MIN [-2147483648,-2147483648,0] toSorted() [INT_MIN,INT_MIN,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -2147483648, 0]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(-2147483648);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayToSortedPart01TestMindmapTest032
     * @tc.desc Verify Number.NaN( ToInt32 0) 1 [1,Number.NaN] toSorted() [0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, Number.NaN]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayToSortedPart01TestMindmapTest033
     * @tc.desc Verify 0.5( ToInt32 0) 1 [0.5,1] toSorted() [0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0.5, 1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayToSortedPart01TestMindmapTest034
     * @tc.desc Verify -0.9( ToInt32 0) -1 [-1,-0.9] toSorted() [-1,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -0.9]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayToSortedPart01TestMindmapTest035
     * @tc.desc Verify 2147483647.9( ToInt32 2147483647) 0 toSorted() [0,INT_MAX]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647.9, 0]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayToSortedPart01TestMindmapTest036
     * @tc.desc Verify -2147483648.9( ToInt32 -2147483648) 0 toSorted() [INT_MIN,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -2147483648.9]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayToSortedPart01TestMindmapTest037
     * @tc.desc Verify 1.1( 1) 2( ) [2,1.1] toSorted() [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 1.1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayToSortedPart01TestMindmapTest038
     * @tc.desc Verify -1.1( -1) -2 [-1.1,-2] toSorted() [-2,-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1.1, -2]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-2);
      expect(r.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayToSortedPart01TestMindmapTest039
     * @tc.desc Verify 4294967296(2^32, 0) 1 toSorted() [0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4294967296, 1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayToSortedPart01TestMindmapTest040
     * @tc.desc Verify 4294967297( 1) 0 toSorted() [0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4294967297, 0]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayToSortedPart01TestMindmapTest041
     * @tc.desc Verify 0xFF(=255) 0x01(=1) toSorted() [1,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0xFF, 0x01]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayToSortedPart01TestMindmapTest042
     * @tc.desc Verify 0o10(=8) 0o2(=2) toSorted() [2,8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0o10, 0o2]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayToSortedPart01TestMindmapTest043
     * @tc.desc Verify 0b101(=5) 0b10(=2) toSorted() [2,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0b101, 0b10]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayToSortedPart01TestMindmapTest044
     * @tc.desc Verify -0x1(=-1) 0 toSorted() [-1,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -0x1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayToSortedPart01TestMindmapTest045
     * @tc.desc Verify [0xFF(255),0b10(2),0o7(7)] toSorted() [2,7,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0xFF, 0b10, 0o7]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(7);
      expect(r.$_get(2)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayToSortedPart01TestMindmapTest046
     * @tc.desc Verify length new Int32Array(3)( 0) toSorted() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayToSortedPart01TestMindmapTest047
     * @tc.desc Verify Int32Array.of(3,1,2) toSorted() [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 1, 2);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayToSortedPart01TestMindmapTest048
     * @tc.desc Verify Int32Array.from([5,1,3]) toSorted() [1,3,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([5, 1, 3]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayToSortedPart01TestMindmapTest049
     * @tc.desc Verify ArrayBuffer Int32Array [buf,0,3] toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let src: Int32Array = new Int32Array(buf);
      src.$_set(0, 30);
      src.$_set(1, 10);
      src.$_set(2, 20);
      let r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(20);
      expect(r.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayToSortedPart01TestMindmapTest050
     * @tc.desc Verify ArrayBuffer byteOffset(4) toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let src: Int32Array = new Int32Array(buf, 4, 3);
      src.$_set(0, 300);
      src.$_set(1, 100);
      src.$_set(2, 200);
      let r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(100);
      expect(r.$_get(1)).assertEqual(200);
      expect(r.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayToSortedPart01TestMindmapTest051
     * @tc.desc Verify Int32Array subarray ( buffer) toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = new Int32Array([9, 5, 7, 1, 3]);
      let sub: Int32Array = base.subarray(1, 4);
      let r: Int32Array = sub.toSorted();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayToSortedPart01TestMindmapTest052
     * @tc.desc Verify toSorted() toSorted() ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 2, 8, 1, 9]);
      let r1: Int32Array = arr.toSorted();
      let r2: Int32Array = r1.toSorted();
      expect(r2.$_get(0)).assertEqual(1);
      expect(r2.$_get(4)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayToSortedPart01TestMindmapTest053
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 4, 1, 5]);
      let r: Int32Array = arr.toSorted().toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayToSortedPart01TestMindmapTest054
     * @tc.desc Verify -1 0 [-1,0,-1,0] toSorted() [-1,-1,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, -1, 0]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayToSortedPart01TestMindmapTest055
     * @tc.desc Verify 0 1 [1,0,1,0,1] toSorted() [0,0,1,1,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 0, 1, 0, 1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(1);
      expect(r.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayToSortedPart01TestMindmapTest056
     * @tc.desc Verify / [INT_MAX,INT_MIN,INT_MAX,INT_MIN] toSorted() MIN MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648, 2147483647, -2147483648]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(-2147483648);
      expect(r.$_get(2)).assertEqual(2147483647);
      expect(r.$_get(3)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayToSortedPart01TestMindmapTest057
     * @tc.desc Verify [INT_MAX,INT_MAX] toSorted() INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 2147483647]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(2147483647);
      expect(r.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayToSortedPart01TestMindmapTest058
     * @tc.desc Verify [INT_MIN,INT_MIN] toSorted() INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -2147483648]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayToSortedPart01TestMindmapTest059
     * @tc.desc Verify [INT_MIN,0,INT_MAX] [0,INT_MAX,INT_MIN] toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 2147483647, -2147483648]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayToSortedPart01TestMindmapTest060
     * @tc.desc Verify 1 [3,2,1,0,-1,-2,-3] toSorted() [-3,-2,-1,0,1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 2, 1, 0, -1, -2, -3]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-3);
      expect(r.$_get(3)).assertEqual(0);
      expect(r.$_get(6)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayToSortedPart01TestMindmapTest061
     * @tc.desc Verify [100,1,50,25,75] toSorted() [1,25,50,75,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 1, 50, 25, 75]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(25);
      expect(r.$_get(2)).assertEqual(50);
      expect(r.$_get(3)).assertEqual(75);
      expect(r.$_get(4)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayToSortedPart01TestMindmapTest062
     * @tc.desc Verify [-100,-1,-50,-25,-75] toSorted() [-100,-75,-50,-25,-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-100, -1, -50, -25, -75]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-100);
      expect(r.$_get(1)).assertEqual(-75);
      expect(r.$_get(2)).assertEqual(-50);
      expect(r.$_get(3)).assertEqual(-25);
      expect(r.$_get(4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayToSortedPart01TestMindmapTest063
     * @tc.desc Verify new Int32Array() (length=0) toSorted() length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayToSortedPart01TestMindmapTest064
     * @tc.desc Verify ArrayBuffer(0) buffer Int32Array (length=0) toSorted() length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int32Array = new Int32Array(buf);
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayToSortedPart01TestMindmapTest065
     * @tc.desc Verify 4 ArrayBuffer + byteOffset=0 [7] toSorted() [7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int32Array = new Int32Array(buf, 0, 1);
      arr.$_set(0, 7);
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayToSortedPart01TestMindmapTest066
     * @tc.desc Verify Int32Array.of() ( ) toSorted() length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of();
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayToSortedPart01TestMindmapTest067
     * @tc.desc Verify Int32Array.from([]) toSorted() length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [];
      let arr: Int32Array = Int32Array.from(src);
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayToSortedPart01TestMindmapTest068
     * @tc.desc Verify Int32Array.of INT_MIN toSorted() INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayToSortedPart01TestMindmapTest069
     * @tc.desc Verify Int32Array.of INT_MAX toSorted() INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(2147483647);
    });

  });
}
