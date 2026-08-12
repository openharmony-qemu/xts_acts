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

export default function int32ArrayToReversedPart01Test(): void {
  describe('Int32ArrayToReversedPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayToReversedPart01TestMindmapTest001
     * @tc.desc Verify 0 toReversed length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayToReversedPart01TestMindmapTest002
     * @tc.desc Verify 0 length=2 length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayToReversedPart01TestMindmapTest003
     * @tc.desc Verify 0 toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r1: Int32Array = arr.toReversed();
      let r2: Int32Array = arr.toReversed();
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
      expect(r1.$_get(2)).assertEqual(r2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayToReversedPart01TestMindmapTest004
     * @tc.desc Verify 0 Int32Array.of length=0 toReversed length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of();
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayToReversedPart01TestMindmapTest005
     * @tc.desc Verify 0 Int32Array.from FixedArray length=0 toReversed length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [];
      let arr: Int32Array = Int32Array.from(src);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayToReversedPart01TestMindmapTest006
     * @tc.desc Verify length=0 new Int32Array(0) toReversed length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayToReversedPart01TestMindmapTest007
     * @tc.desc Verify length=1 0 toReversed length=1 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayToReversedPart01TestMindmapTest008
     * @tc.desc Verify length=2 [10,20] toReversed [20,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(20);
      expect(r.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayToReversedPart01TestMindmapTest009
     * @tc.desc Verify length=3 [1,2,3] toReversed [3,2,1] 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayToReversedPart01TestMindmapTest010
     * @tc.desc Verify length=4 [1,2,3,4] toReversed [4,3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(4);
      expect(r.$_get(1)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(2);
      expect(r.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayToReversedPart01TestMindmapTest011
     * @tc.desc Verify length=6 [10,20,30,40,50,60] toReversed [60,50,40,30,20,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(60);
      expect(r.$_get(5)).assertEqual(10);
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayToReversedPart01TestMindmapTest012
     * @tc.desc Verify length=7 [1..7] toReversed [7..1] 3 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6, 7);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(3)).assertEqual(4);
      expect(r.$_get(6)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayToReversedPart01TestMindmapTest013
     * @tc.desc Verify INT_MAX 2147483647 toReversed 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayToReversedPart01TestMindmapTest014
     * @tc.desc Verify INT_MIN -2147483648 toReversed -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayToReversedPart01TestMindmapTest015
     * @tc.desc Verify -1 toReversed -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayToReversedPart01TestMindmapTest016
     * @tc.desc Verify 1 toReversed 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayToReversedPart01TestMindmapTest017
     * @tc.desc Verify 2 toReversed 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayToReversedPart01TestMindmapTest018
     * @tc.desc Verify 0o777 511 toReversed 511
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0o777);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayToReversedPart01TestMindmapTest019
     * @tc.desc Verify 0b1010 10 toReversed 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0b1010);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayToReversedPart01TestMindmapTest020
     * @tc.desc Verify -0x80000000 INT_MIN toReversed -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-0x80000000);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayToReversedPart01TestMindmapTest021
     * @tc.desc Verify 1 4294967297 2^32+1 0 5 1 toReversed [5,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 5);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayToReversedPart01TestMindmapTest022
     * @tc.desc Verify [0,6] 0.5 0 0 toReversed [6,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 6);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(6);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayToReversedPart01TestMindmapTest023
     * @tc.desc Verify [7,0] -0.9 0 1 toReversed [0,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 0);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayToReversedPart01TestMindmapTest024
     * @tc.desc Verify [1,2,3,4,5] toReversed [5,4,3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(1)).assertEqual(4);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.$_get(3)).assertEqual(2);
      expect(r.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayToReversedPart01TestMindmapTest025
     * @tc.desc Verify [5,4,3,2,1] toReversed [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 4, 3, 2, 1);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayToReversedPart01TestMindmapTest026
     * @tc.desc Verify [1,2,3,2,1] toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 2, 1);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.$_get(3)).assertEqual(2);
      expect(r.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayToReversedPart01TestMindmapTest027
     * @tc.desc Verify [7,7,7] toReversed 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 7, 7);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(1)).assertEqual(7);
      expect(r.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayToReversedPart01TestMindmapTest028
     * @tc.desc Verify 0 new Int32Array(4) toReversed 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayToReversedPart01TestMindmapTest029
     * @tc.desc Verify [1,-2,3,-4] toReversed [-4,3,-2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -2, 3, -4);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(-4);
      expect(r.$_get(1)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(-2);
      expect(r.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayToReversedPart01TestMindmapTest030
     * @tc.desc Verify [MAX,0,MIN] toReversed [MIN,0,MAX]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 0, -2147483648);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayToReversedPart01TestMindmapTest031
     * @tc.desc Verify [-1,0] toReversed [0,-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayToReversedPart01TestMindmapTest032
     * @tc.desc Verify [-3,-3] toReversed [-3,-3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-3, -3);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(-3);
      expect(r.$_get(1)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayToReversedPart01TestMindmapTest033
     * @tc.desc Verify [-5] length=1 toReversed [-5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-5);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(-5);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayToReversedPart01TestMindmapTest034
     * @tc.desc Verify new Int32Array(3) toReversed length=3 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayToReversedPart01TestMindmapTest035
     * @tc.desc Verify ArrayBuffer offset=0, length=2 [100,200] toReversed [200,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 0, 2);
      arr.$_set(0, 100);
      arr.$_set(1, 200);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(200);
      expect(r.$_get(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayToReversedPart01TestMindmapTest036
     * @tc.desc Verify ArrayBuffer byteOffset=4, length=2 [11,22] toReversed [22,11]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(22);
      expect(r.$_get(1)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayToReversedPart01TestMindmapTest037
     * @tc.desc Verify Int32Array.of [10,20,30] toReversed [30,20,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(30);
      expect(r.$_get(1)).assertEqual(20);
      expect(r.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayToReversedPart01TestMindmapTest038
     * @tc.desc Verify Int32Array.from(FixedArray<int>) [5,6,7,8] toReversed [8,7,6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [5, 6, 7, 8];
      let arr: Int32Array = Int32Array.from(src);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(8);
      expect(r.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayToReversedPart01TestMindmapTest039
     * @tc.desc Verify Int32Array.from mapfn v*2 [1,2,3] [2,4,6] toReversed [6,4,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1.0, 2.0, 3.0];
      let arr: Int32Array = Int32Array.from(src, (v: number, _k: number): number => v * 2);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(6);
      expect(r.$_get(1)).assertEqual(4);
      expect(r.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayToReversedPart01TestMindmapTest040
     * @tc.desc Verify subarray(0) [1,2,3,4] toReversed [4,3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4);
      let arr: Int32Array = orig.subarray(0);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(4);
      expect(r.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayToReversedPart01TestMindmapTest041
     * @tc.desc Verify subarray(1,3) [2,3] toReversed [3,2] length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3, 4);
      let arr: Int32Array = orig.subarray(1, 3);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayToReversedPart01TestMindmapTest042
     * @tc.desc Verify subarray(2,1) begin>=end toReversed length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let arr: Int32Array = orig.subarray(2, 1);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayToReversedPart01TestMindmapTest043
     * @tc.desc Verify new Int32Array(buf) buffer length [1,2,3] toReversed [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayToReversedPart01TestMindmapTest044
     * @tc.desc Verify ArrayBuffer 4*length 8 2 [33,44] toReversed [44,33]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 0, 2);
      arr.$_set(0, 33);
      arr.$_set(1, 44);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(44);
      expect(r.$_get(1)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayToReversedPart01TestMindmapTest045
     * @tc.desc Verify ArrayBuffer 4*length 20 3 [7,8,9] toReversed length [9,8,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let arr: Int32Array = new Int32Array(buf, 0, 3);
      arr.$_set(0, 7);
      arr.$_set(1, 8);
      arr.$_set(2, 9);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayToReversedPart01TestMindmapTest046
     * @tc.desc Verify byteOffset=4 +length=3 buffer 16 [-1,0,1] toReversed [1,0,-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      arr.$_set(0, -1);
      arr.$_set(1, 0);
      arr.$_set(2, 1);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayToReversedPart01TestMindmapTest047
     * @tc.desc Verify new Int32Array(anotherInt32Array) [9,8,7,6] toReversed [6,7,8,9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(9, 8, 7, 6);
      let arr: Int32Array = new Int32Array(src);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(6);
      expect(r.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayToReversedPart01TestMindmapTest048
     * @tc.desc Verify 0xFF 255 0 1 1 toReversed [1,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0xFF, 1);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayToReversedPart01TestMindmapTest049
     * @tc.desc Verify 0o10 8 0 2 1 toReversed [2,8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0o10, 2);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayToReversedPart01TestMindmapTest050
     * @tc.desc Verify 0b11111111 255 1 3 0 toReversed [255,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 0b11111111);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(255);
      expect(r.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayToReversedPart01TestMindmapTest051
     * @tc.desc Verify 0xFF00 65280 0 -1 1 toReversed [-1,65280]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0xFF00, -1);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(65280);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayToReversedPart01TestMindmapTest052
     * @tc.desc Verify 0o177777 65535 1 4 0 toReversed [65535,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 0o177777);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(65535);
      expect(r.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayToReversedPart01TestMindmapTest053
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r1: Int32Array = arr.toReversed();
      let r2: Int32Array = arr.toReversed();
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
      expect(r1.$_get(1)).assertEqual(r2.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayToReversedPart01TestMindmapTest054
     * @tc.desc Verify [100,101] toReversed [101,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 101);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(101);
      expect(r.$_get(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayToReversedPart01TestMindmapTest055
     * @tc.desc Verify 1 [0,0,1,0,0] length=5 toReversed 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 1, 0, 0);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(0);
      expect(r.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayToReversedPart01TestMindmapTest056
     * @tc.desc Verify [INT_MAX,-1,0,INT_MIN] toReversed [INT_MIN,0,-1,INT_MAX]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -1, 0, -2147483648);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(-1);
      expect(r.$_get(3)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayToReversedPart01TestMindmapTest057
     * @tc.desc Verify toReversed $_set 0 toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.$_set(0, 99);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(2)).assertEqual(99);
      expect(r.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayToReversedPart01TestMindmapTest058
     * @tc.desc Verify toReversed $_set toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.$_set(2, 88);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(88);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayToReversedPart01TestMindmapTest059
     * @tc.desc Verify new ArrayBuffer(0) buffer toReversed length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int32Array = new Int32Array(buf);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayToReversedPart01TestMindmapTest060
     * @tc.desc Verify subarray(1,1) begin==end toReversed length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2);
      let arr: Int32Array = orig.subarray(1, 1);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayToReversedPart01TestMindmapTest061
     * @tc.desc Verify subarray(2) toReversed length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2);
      let arr: Int32Array = orig.subarray(2);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayToReversedPart01TestMindmapTest062
     * @tc.desc Verify length=8 2^3 [1..8] toReversed [8..1] (4,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6, 7, 8);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(8);
      expect(r.$_get(0)).assertEqual(8);
      expect(r.$_get(3)).assertEqual(5);
      expect(r.$_get(4)).assertEqual(4);
      expect(r.$_get(7)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayToReversedPart01TestMindmapTest063
     * @tc.desc Verify length=9 [1..9] toReversed [9..1] 4 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(9);
      expect(r.$_get(4)).assertEqual(5);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(8)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayToReversedPart01TestMindmapTest064
     * @tc.desc Verify length=16 2^4 [0..15] toReversed [15..0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(16);
      for (let i: int = 0; i < 16; i++) {
        arr.$_set(i, i);
      }
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(16);
      expect(r.$_get(0)).assertEqual(15);
      expect(r.$_get(7)).assertEqual(8);
      expect(r.$_get(8)).assertEqual(7);
      expect(r.$_get(15)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayToReversedPart01TestMindmapTest065
     * @tc.desc Verify length=16 [1,-1,2,-2,...,8,-8] toReversed [-8,8,-7,7,...,-1,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -1, 2, -2, 3, -3, 4, -4, 5, -5, 6, -6, 7, -7, 8, -8);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(-8);
      expect(r.$_get(1)).assertEqual(8);
      expect(r.$_get(14)).assertEqual(-1);
      expect(r.$_get(15)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayToReversedPart01TestMindmapTest066
     * @tc.desc Verify length=5 [100,0,-100,0,100] toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 0, -100, 0, 100);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(100);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(-100);
      expect(r.$_get(3)).assertEqual(0);
      expect(r.$_get(4)).assertEqual(100);
    });

  });
}
