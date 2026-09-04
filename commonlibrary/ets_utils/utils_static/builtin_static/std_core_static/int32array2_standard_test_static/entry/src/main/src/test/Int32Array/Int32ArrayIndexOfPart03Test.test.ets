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

export default function int32ArrayIndexOfPart03Test(): void {
  describe('Int32ArrayIndexOfPart03Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest001
     * @tc.desc Verify indexOf() 1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.indexOf(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest002
     * @tc.desc Verify indexOf() -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.indexOf(-1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest003
     * @tc.desc Verify indexOf() fromIndex=0 INT_MAX -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.indexOf(2147483647, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest004
     * @tc.desc Verify indexOf() fromIndex=INT_MAX(2147483647) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.indexOf(0, 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest005
     * @tc.desc Verify indexOf() fromIndex=-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.indexOf(0, -1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest006
     * @tc.desc Verify indexOf() fromIndex=INT_MIN(-2147483648) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.indexOf(0, -2147483648)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest007
     * @tc.desc Verify indexOf() fromIndex=1(>=length=0) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.indexOf(0, 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest008
     * @tc.desc Verify indexOf() Number.NaN(number) fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.indexOf(Number.NaN, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest009
     * @tc.desc Verify indexOf() fromIndex=0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9);
      expect(arr.indexOf(8, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest010
     * @tc.desc Verify indexOf() fromIndex=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9);
      expect(arr.indexOf(9, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest011
     * @tc.desc Verify indexOf() fromIndex=1(>=length) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9);
      expect(arr.indexOf(9, 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest012
     * @tc.desc Verify indexOf() fromIndex=2 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9);
      expect(arr.indexOf(9, 2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest013
     * @tc.desc Verify indexOf() fromIndex=-1( 0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9);
      expect(arr.indexOf(9, -1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest014
     * @tc.desc Verify indexOf() fromIndex=-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9);
      expect(arr.indexOf(8, -1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest015
     * @tc.desc Verify indexOf() fromIndex=-2( <0 0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9);
      expect(arr.indexOf(9, -2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest016
     * @tc.desc Verify indexOf() fromIndex=INT_MAX -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9);
      expect(arr.indexOf(9, 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest017
     * @tc.desc Verify indexOf() INT_MIN fromIndex=0 INT_MIN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      expect(arr.indexOf(-2147483648, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest018
     * @tc.desc Verify indexOf() INT_MAX fromIndex=-1 INT_MAX 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      expect(arr.indexOf(2147483647, -1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest019
     * @tc.desc Verify indexOf() INT_MIN 4 fromIndex=0 INT_MIN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, -2147483648, -2147483648, -2147483648);
      expect(arr.indexOf(-2147483648, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest020
     * @tc.desc Verify indexOf() INT_MAX 3 fromIndex=2( ) INT_MAX 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 2147483647, 2147483647);
      expect(arr.indexOf(2147483647, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest021
     * @tc.desc Verify indexOf() 0 5 fromIndex=3 0 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      expect(arr.indexOf(0, 3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest022
     * @tc.desc Verify indexOf() 0 5 fromIndex=length=5 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      expect(arr.indexOf(0, 5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest023
     * @tc.desc Verify indexOf() 0 5 fromIndex=-1( 4) 0 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      expect(arr.indexOf(0, -1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest024
     * @tc.desc Verify indexOf() fromIndex=length+1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 7, 7);
      expect(arr.indexOf(7, 4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest025
     * @tc.desc Verify indexOf() fromIndex=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-5, -5, -5);
      expect(arr.indexOf(-5, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest026
     * @tc.desc Verify indexOf() fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 3, 3, 3);
      expect(arr.indexOf(4, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest027
     * @tc.desc Verify indexOf() 4 fromIndex=length=4 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      expect(arr.indexOf(40, 4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest028
     * @tc.desc Verify indexOf() 4 fromIndex=length+1=5 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      expect(arr.indexOf(10, 5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest029
     * @tc.desc Verify indexOf() 6 fromIndex=-length=-6( 0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      expect(arr.indexOf(11, -6)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest030
     * @tc.desc Verify indexOf() 6 fromIndex=-(length+1)=-7( -1 0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33, 44, 55, 66);
      expect(arr.indexOf(11, -7)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest031
     * @tc.desc Verify indexOf() 5 fromIndex=-(length+1)=-6 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      expect(arr.indexOf(99, -6)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest032
     * @tc.desc Verify indexOf() 4 fromIndex=-length-1=-5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      expect(arr.indexOf(1, -5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest033
     * @tc.desc Verify indexOf() 4 fromIndex=-1( 3) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      expect(arr.indexOf(4, -1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest034
     * @tc.desc Verify indexOf() 4 fromIndex=-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      expect(arr.indexOf(3, -1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest035
     * @tc.desc Verify indexOf() 4 fromIndex=-4( 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      expect(arr.indexOf(3, -4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest036
     * @tc.desc Verify indexOf() 2 fromIndex=-3( -1 0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(77, 88);
      expect(arr.indexOf(77, -3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest037
     * @tc.desc Verify indexOf() fromIndex 999999( length) 5 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      expect(arr.indexOf(3, 999999)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest038
     * @tc.desc Verify indexOf() fromIndex -999999( 0) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      expect(arr.indexOf(10, -999999)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest039
     * @tc.desc Verify indexOf() fromIndex=INT_MAX 100 Int32Array( 0) 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(100);
      expect(arr.indexOf(0, 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest040
     * @tc.desc Verify indexOf() searchElement=Number.NaN(number) 10 0 -1 Number.NaN!==0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(10);
      expect(arr.indexOf(Number.NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest041
     * @tc.desc Verify indexOf() searchElement=+Number.POSITIVE_INFINITY 5 0 -1 Number.POSITIVE_INFINITY!==0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      expect(arr.indexOf(Number.POSITIVE_INFINITY)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest042
     * @tc.desc Verify indexOf() searchElement=-Number.POSITIVE_INFINITY 5 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      expect(arr.indexOf(Number.NEGATIVE_INFINITY)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest043
     * @tc.desc Verify indexOf() searchElement=1.5(float) 1 2 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      expect(arr.indexOf(1.5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest044
     * @tc.desc Verify indexOf() searchElement -2147483648 returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      expect(arr.indexOf(-2147483648)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest045
     * @tc.desc Verify indexOf() searchElement=4294967295.0(0xFFFFFFFF) -1 -1( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      expect(arr.indexOf(4294967295.0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest046
     * @tc.desc Verify indexOf() searchElement=0.0 0 (+0.0===0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      expect(arr.indexOf(0.0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest047
     * @tc.desc Verify indexOf() searchElement=-0.0 0 (-0.0===0 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      expect(arr.indexOf(-0.0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest048
     * @tc.desc Verify indexOf() searchElement=Number.NaN [1,2,3] -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      expect(arr.indexOf(Number.NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest049
     * @tc.desc Verify indexOf() searchElement=Number.POSITIVE_INFINITY [0] -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      expect(arr.indexOf(Number.POSITIVE_INFINITY)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest050
     * @tc.desc Verify indexOf() searchElement=Number.NEGATIVE_INFINITY [0] -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      expect(arr.indexOf(Number.NEGATIVE_INFINITY)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest051
     * @tc.desc Verify indexOf() searchElement -1( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      expect(arr.indexOf(5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest052
     * @tc.desc Verify indexOf() searchElement -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 40);
      expect(arr.indexOf(30)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest053
     * @tc.desc Verify indexOf() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-10, -20, -30);
      expect(arr.indexOf(-50)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest054
     * @tc.desc Verify indexOf() 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-5, 0, 5);
      expect(arr.indexOf(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest055
     * @tc.desc Verify indexOf() searchElement -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2, 3, 4, 5, 6, 7);
      expect(arr.indexOf(8)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest056
     * @tc.desc Verify indexOf() searchElement=INT_MAX INT_MAX -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483646, 0, -1);
      expect(arr.indexOf(2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest057
     * @tc.desc Verify indexOf() searchElement=INT_MIN INT_MIN -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483647, 0, 1);
      expect(arr.indexOf(-2147483648)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest058
     * @tc.desc Verify indexOf() fromIndex=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7, 5);
      expect(arr.indexOf(5, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest059
     * @tc.desc Verify indexOf() fromIndex=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7, 5);
      expect(arr.indexOf(5, 1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest060
     * @tc.desc Verify indexOf() fromIndex=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(8, 8, 8);
      expect(arr.indexOf(8, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest061
     * @tc.desc Verify indexOf() fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 3, 2, 3, 2, 3);
      expect(arr.indexOf(2, 4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest062
     * @tc.desc Verify indexOf() fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 3, 2, 3, 2, 3);
      expect(arr.indexOf(2, 5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest063
     * @tc.desc Verify indexOf() fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -2, -1, -2, -1);
      expect(arr.indexOf(-1, -2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest064
     * @tc.desc Verify indexOf() ArrayBuffer offset=4 2 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      a.$_set(0, 77);
      a.$_set(1, 88);
      expect(a.indexOf(77)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest065
     * @tc.desc Verify indexOf() ArrayBuffer offset=4 2 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      a.$_set(0, 77);
      a.$_set(1, 88);
      expect(a.indexOf(88)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_6600
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest066
     * @tc.desc Verify indexOf() ArrayBuffer offset=4 2 buffer -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf, 0, 4);
      full.$_set(0, 11);
      full.$_set(1, 22);
      full.$_set(2, 33);
      full.$_set(3, 44);
      let a: Int32Array = new Int32Array(buf, 8, 2);
      expect(a.indexOf(11)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_6700
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest067
     * @tc.desc Verify indexOf() subarray 1 3 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = arr.subarray(1, 4);
      expect(sub.indexOf(20)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_6800
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest068
     * @tc.desc Verify indexOf() subarray 1 3 fromIndex=2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = arr.subarray(1, 4);
      expect(sub.indexOf(40, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_6900
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest069
     * @tc.desc Verify indexOf() subarray (begin>=end) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = arr.subarray(2, 2);
      expect(sub.indexOf(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_7000
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest070
     * @tc.desc Verify indexOf() subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      let sub: Int32Array = arr.subarray(0, 3);
      expect(sub.indexOf(22)).assertEqual(arr.indexOf(22));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_7100
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest071
     * @tc.desc Verify indexOf() ArrayBuffer offset 1 fromIndex=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 4, 1);
      a.$_set(0, 999);
      expect(a.indexOf(999, -1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_7200
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest072
     * @tc.desc Verify $_set indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.$_set(1, 99);
      expect(arr.indexOf(2)).assertEqual(-1);
      expect(arr.indexOf(99)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_7300
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest073
     * @tc.desc Verify fill indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(7);
      expect(arr.indexOf(7)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_7400
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest074
     * @tc.desc Verify fill indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.fill(9, 2, 4);
      expect(arr.indexOf(9)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_7500
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest075
     * @tc.desc Verify reverse indexOf ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.reverse();
      expect(arr.indexOf(1)).assertEqual(3);
      expect(arr.indexOf(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_7600
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest076
     * @tc.desc Verify indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r1: int = arr.indexOf(99);
      let r2: int = arr.indexOf(88);
      expect(r1).assertEqual(-1);
      expect(r2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_7700
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest077
     * @tc.desc Verify indexOf $_set indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 5);
      let idx: int = arr.indexOf(5);
      arr.$_set(idx, 9);
      expect(arr.indexOf(5)).assertEqual(2);
      expect(arr.indexOf(9)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_7800
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest078
     * @tc.desc Verify new Int32Array(3) indexOf(0) fromIndex=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      expect(arr.indexOf(0, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_7900
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest079
     * @tc.desc Verify Int32Array.of() indexOf( ) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of();
      expect(arr.indexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_8000
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest080
     * @tc.desc Verify indexOf() Int32Array.from([...]as int[0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([100, 200, 300]);
      expect(arr.indexOf(200)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_8100
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest081
     * @tc.desc Verify 1 from ArrayBuffer offset=4 indexOf(0) 0( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 4, 1);
      expect(a.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_8200
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest082
     * @tc.desc Verify indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: int = arr.indexOf(99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_8300
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest083
     * @tc.desc Verify indexOf [0,length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: int = arr.indexOf(20);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART03_TEST_MINDMAP_8400
     * @tc.name int32ArrayIndexOfPart03TestMindmapTest084
     * @tc.desc Verify indexOf length byteLength byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart03TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 8, 3);
      let bl0: int = a.byteLength;
      let bo0: int = a.byteOffset;
      let len0: int = a.length;
      a.indexOf(0);
      expect(a.length).assertEqual(len0);
      expect(a.byteLength).assertEqual(bl0);
      expect(a.byteOffset).assertEqual(bo0);
    });


  });
}
