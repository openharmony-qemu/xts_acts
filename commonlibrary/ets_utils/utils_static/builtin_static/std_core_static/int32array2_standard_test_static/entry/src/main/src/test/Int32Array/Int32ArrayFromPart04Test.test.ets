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

export default function int32ArrayFromPart04Test(): void {
  describe('Int32ArrayFromPart04Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArrayFromPart04TestMindmapTest001
     * @tc.desc Verify from() Array<number> Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [4, 5, 6];
      let r: Int32Array = Int32Array.from(src);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(4);
      expect(r.$_get(1)).assertEqual(5);
      expect(r.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArrayFromPart04TestMindmapTest002
     * @tc.desc Verify from() empty Array<number> creates Int32Array with length=0, byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [];
      let r: Int32Array = Int32Array.from(src);
      expect(r.length).assertEqual(0);
      expect(r.byteLength).assertEqual(0);
      expect(r.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArrayFromPart04TestMindmapTest003
     * @tc.desc Verify from() Array<number> 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [0];
      let r: Int32Array = Int32Array.from(src);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArrayFromPart04TestMindmapTest004
     * @tc.desc Verify from() Array<number> -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-1];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArrayFromPart04TestMindmapTest005
     * @tc.desc Verify from() Array<number> 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [8, 9];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(8);
      expect(r.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArrayFromPart04TestMindmapTest006
     * @tc.desc Verify from() with Array<number> preserves all element values at correct indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [10, 20, 30, 40, 50];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(2)).assertEqual(30);
      expect(r.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArrayFromPart04TestMindmapTest007
     * @tc.desc Verify from() Array<number> [-5, 0, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-5, 0, 5];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-5);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArrayFromPart04TestMindmapTest008
     * @tc.desc Verify from() Array<number> [6,6,6,6] 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [6, 6, 6, 6];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(6);
      expect(r.$_get(1)).assertEqual(6);
      expect(r.$_get(2)).assertEqual(6);
      expect(r.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArrayFromPart04TestMindmapTest009
     * @tc.desc Verify from() Array<number> [7,2,9,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [7, 2, 9, 4];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(9);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArrayFromPart04TestMindmapTest010
     * @tc.desc Verify from() Array<number> [9,7,5,3,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [9, 7, 5, 3, 1];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArrayFromPart04TestMindmapTest011
     * @tc.desc Verify from() 6 Array<number> length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [11, 22, 33, 44, 55, 66];
      let r: Int32Array = Int32Array.from(src);
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArrayFromPart04TestMindmapTest012
     * @tc.desc Verify from() Array.of Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = Array.of<number>(100, 200, 300);
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(100);
      expect(r.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArrayFromPart04TestMindmapTest013
     * @tc.desc Verify from() push Array<number> pushed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [];
      src.push(15);
      src.push(25);
      src.push(35);
      let r: Int32Array = Int32Array.from(src);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(15);
      expect(r.$_get(2)).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArrayFromPart04TestMindmapTest014
     * @tc.desc Verify from() -0 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-0];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArrayFromPart04TestMindmapTest015
     * @tc.desc Verify from() int32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [2147483647];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArrayFromPart04TestMindmapTest016
     * @tc.desc Verify from() int32 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-2147483648];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArrayFromPart04TestMindmapTest017
     * @tc.desc Verify from() MAX-1 = 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [2147483646];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArrayFromPart04TestMindmapTest018
     * @tc.desc Verify from() MIN+1 = -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-2147483647];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArrayFromPart04TestMindmapTest019
     * @tc.desc Verify from() 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [3];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArrayFromPart04TestMindmapTest020
     * @tc.desc Verify from() MAX+1 = 2147483648 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [2147483648];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArrayFromPart04TestMindmapTest021
     * @tc.desc Verify from() MAX+2 = 2147483649 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [2147483649];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArrayFromPart04TestMindmapTest022
     * @tc.desc Verify from() MIN-1 = -2147483649 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-2147483649];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArrayFromPart04TestMindmapTest023
     * @tc.desc Verify from() 0xFFFFFFFF = 4294967295 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [4294967295];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArrayFromPart04TestMindmapTest024
     * @tc.desc Verify from() 2^32 = 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [4294967296];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArrayFromPart04TestMindmapTest025
     * @tc.desc Verify from() 2^32+1 = 4294967297 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [4294967297];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArrayFromPart04TestMindmapTest026
     * @tc.desc Verify from() coerces overflow values beyond int32 range via ToInt32 wrapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [2147483648, -2147483649, 4294967296];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(2147483647);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArrayFromPart04TestMindmapTest027
     * @tc.desc Verify from() 4.5 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [4.5];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArrayFromPart04TestMindmapTest028
     * @tc.desc Verify from() -4.5 -4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-4.5];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArrayFromPart04TestMindmapTest029
     * @tc.desc Verify from() 4.999 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [4.999];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArrayFromPart04TestMindmapTest030
     * @tc.desc Verify from() -4.001 -4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-4.001];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArrayFromPart04TestMindmapTest031
     * @tc.desc Verify from() 0.7 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [0.7];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArrayFromPart04TestMindmapTest032
     * @tc.desc Verify from() -0.7 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-0.7];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArrayFromPart04TestMindmapTest033
     * @tc.desc Verify from() MAX 2147483647.9 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [2147483647.9];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArrayFromPart04TestMindmapTest034
     * @tc.desc Verify from() MIN -2147483648.9 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-2147483648.9];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArrayFromPart04TestMindmapTest035
     * @tc.desc Verify from() .0 5.0 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [5.0];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArrayFromPart04TestMindmapTest036
     * @tc.desc Verify from() Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [Number.NaN];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArrayFromPart04TestMindmapTest037
     * @tc.desc Verify from() +Number.POSITIVE_INFINITY 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [Number.POSITIVE_INFINITY];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArrayFromPart04TestMindmapTest038
     * @tc.desc Verify from() -Number.POSITIVE_INFINITY 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-Number.POSITIVE_INFINITY];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArrayFromPart04TestMindmapTest039
     * @tc.desc Verify from() Number.MIN_VALUE 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [Number.MIN_VALUE];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArrayFromPart04TestMindmapTest040
     * @tc.desc Verify from() -Number.MIN_VALUE 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-Number.MIN_VALUE];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArrayFromPart04TestMindmapTest041
     * @tc.desc Verify from() Number.EPSILON 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [Number.EPSILON];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArrayFromPart04TestMindmapTest042
     * @tc.desc Verify from() 1e10 ToInt32 2^32 1410065408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [10000000000];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(1410065408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArrayFromPart04TestMindmapTest043
     * @tc.desc Verify from() -1e10 ToInt32 2^32 -1410065408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-10000000000];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-1410065408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArrayFromPart04TestMindmapTest044
     * @tc.desc Verify from() Number.MAX_SAFE_INTEGER (9007199254740991) ToInt32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [9007199254740991];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArrayFromPart04TestMindmapTest045
     * @tc.desc Verify from() [Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, 0.3, -0.3] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [
      Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, 0.3, -0.3
      ];
      let r: Int32Array = Int32Array.from(src);
      expect(r.length).assertEqual(5);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArrayFromPart04TestMindmapTest046
     * @tc.desc Verify from() [0, -1, MAX, MIN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [0, -1, 2147483647, -2147483648];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(2147483647);
      expect(r.$_get(3)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArrayFromPart04TestMindmapTest047
     * @tc.desc Verify from() / /Number.NaN/Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [2147483648, 4.7, Number.NaN, Number.POSITIVE_INFINITY];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(4);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArrayFromPart04TestMindmapTest048
     * @tc.desc Verify from() [-0, 0, 0.2, -0.2] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-0, 0, 0.2, -0.2];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArrayFromPart04TestMindmapTest049
     * @tc.desc Verify from() [4.5,-4.5] [4,-4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [4.5, -4.5, 200.9, -200.9];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(4);
      expect(r.$_get(1)).assertEqual(-4);
      expect(r.$_get(2)).assertEqual(200);
      expect(r.$_get(3)).assertEqual(-200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArrayFromPart04TestMindmapTest050
     * @tc.desc Verify from() [2147483648,2147483649,2147483650]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [2147483648, 2147483649, 2147483650];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(-2147483647);
      expect(r.$_get(2)).assertEqual(-2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArrayFromPart04TestMindmapTest051
     * @tc.desc Verify from() 1.5e2 150 ToInt32 150
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.5e2];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArrayFromPart04TestMindmapTest052
     * @tc.desc Verify from() copies array length and elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [11, 22];
      let r: Int32Array = Int32Array.from(src);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(1)).assertEqual(22);
      expect(r.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArrayFromPart04TestMindmapTest053
     * @tc.desc Verify from() result length equals the source array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [11, 22, 33, 44];
      let r: Int32Array = Int32Array.from(src);
      expect(r.length).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArrayFromPart04TestMindmapTest054
     * @tc.desc Verify from() byteLength = length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [11, 22, 33];
      let r: Int32Array = Int32Array.from(src);
      expect(r.byteLength).assertEqual(12);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArrayFromPart04TestMindmapTest055
     * @tc.desc Verify from() BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [11];
      let r: Int32Array = Int32Array.from(src);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArrayFromPart04TestMindmapTest056
     * @tc.desc Verify from() buffer byteLength = length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [11, 22, 33, 44, 55];
      let r: Int32Array = Int32Array.from(src);
      expect(r.buffer.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArrayFromPart04TestMindmapTest057
     * @tc.desc Verify from() with a single-element Array preserves element value and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArrayFromPart04TestMindmapTest058
     * @tc.desc Verify from() result supports $_get(0) to access the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [55, 66, 77];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(55);
      expect(r.$_get(r.length - 1)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArrayFromPart04TestMindmapTest059
     * @tc.desc Verify from() result toString() returns comma-separated string of element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [4, 5, 6];
      let r: Int32Array = Int32Array.from(src);
      expect(r.toString()).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArrayFromPart04TestMindmapTest060
     * @tc.desc Verify from() result supports join() with default comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [40, 50, 60];
      let r: Int32Array = Int32Array.from(src);
      expect(r.join()).assertEqual('40,50,60');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArrayFromPart04TestMindmapTest061
     * @tc.desc Verify from() result supports join() with a custom dash separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3, 4];
      let r: Int32Array = Int32Array.from(src);
      expect(r.join('-')).assertEqual('1-2-3-4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArrayFromPart04TestMindmapTest062
     * @tc.desc Verify from() with empty source produces empty string from join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [];
      let r: Int32Array = Int32Array.from(src);
      expect(r.join()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArrayFromPart04TestMindmapTest063
     * @tc.desc Verify from() 4294967295 toString -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [4294967295];
      let r: Int32Array = Int32Array.from(src);
      expect(r.toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArrayFromPart04TestMindmapTest064
     * @tc.desc Verify from() result supports bracket index access for element retrieval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [77, 88];
      let r: Int32Array = Int32Array.from(src);
      expect(r[0]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArrayFromPart04TestMindmapTest065
     * @tc.desc Verify mutating the from() result via $_set does not affect the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let r: Int32Array = Int32Array.from(src);
      r.$_set(0, 888);
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArrayFromPart04TestMindmapTest066
     * @tc.desc Verify from() does not mutate the source Array<number> elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      Int32Array.from(src);
      expect(src[0]).assertEqual(1);
      expect(src[1]).assertEqual(2);
      expect(src[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArrayFromPart04TestMindmapTest067
     * @tc.desc Verify from() does not change the length of the source Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      Int32Array.from(src);
      expect(src.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_6800
     * @tc.name int32ArrayFromPart04TestMindmapTest068
     * @tc.desc Verify two from() calls on the same source produce independent Int32Array instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let r1: Int32Array = Int32Array.from(src);
      let r2: Int32Array = Int32Array.from(src);
      r1.$_set(0, 222);
      expect(r2.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_6900
     * @tc.name int32ArrayFromPart04TestMindmapTest069
     * @tc.desc Verify modifying source Array after from() call does not affect the returned Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2];
      let r: Int32Array = Int32Array.from(src);
      src[0] = 777;
      expect(r.$_get(0)).assertEqual(1);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_7000
     * @tc.name int32ArrayFromPart04TestMindmapTest070
     * @tc.desc Verify two from() calls on the same source produce results with distinct ArrayBuffer instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2];
      let r1: Int32Array = Int32Array.from(src);
      let r2: Int32Array = Int32Array.from(src);
      let sameBuf: boolean = r1.buffer === r2.buffer;
      expect(sameBuf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_7100
     * @tc.name int32ArrayFromPart04TestMindmapTest071
     * @tc.desc Verify from Array push Int32Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2];
      let r: Int32Array = Int32Array.from(src);
      src.push(3);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_7200
     * @tc.name int32ArrayFromPart04TestMindmapTest072
     * @tc.desc Verify from() result supports $_set and $_get for element mutation and access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2];
      let r: Int32Array = Int32Array.from(src);
      r.$_set(1, 666);
      expect(r.$_get(1)).assertEqual(666);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_7300
     * @tc.name int32ArrayFromPart04TestMindmapTest073
     * @tc.desc Verify fill() on the from() result replaces all elements with the specified fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3, 4];
      let r: Int32Array = Int32Array.from(src);
      r.fill(0);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_7400
     * @tc.name int32ArrayFromPart04TestMindmapTest074
     * @tc.desc Verify from() result supports indexOf() to find the index of a given element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [10, 20, 30, 40];
      let r: Int32Array = Int32Array.from(src);
      expect(r.indexOf(30)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_7500
     * @tc.name int32ArrayFromPart04TestMindmapTest075
     * @tc.desc Verify from Number.NaN 0 includes(0) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, Number.NaN, 3];
      let r: Int32Array = Int32Array.from(src);
      expect(r.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_7600
     * @tc.name int32ArrayFromPart04TestMindmapTest076
     * @tc.desc Verify from() result supports for-of iteration over all elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [8, 9, 10];
      let r: Int32Array = Int32Array.from(src);
      let collected: Array<number> = [];
      for (let v of r) {
        collected.push(v);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(8);
      expect(collected[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_7700
     * @tc.name int32ArrayFromPart04TestMindmapTest077
     * @tc.desc Verify from() result for-of iteration can be terminated early with break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3, 4];
      let r: Int32Array = Int32Array.from(src);
      let sum: number = 0;
      for (let v of r) {
        if (v > 2) {
          break;
        }
        sum = sum + v;
      }
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_7800
     * @tc.name int32ArrayFromPart04TestMindmapTest078
     * @tc.desc Verify chaining Array.from() then Int32Array.from() round-trips element values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let r1: Int32Array = Int32Array.from(src);
      let tmp: Array<number> = Array.from(r1);
      let r2: Int32Array = Int32Array.from(tmp);
      expect(r2.$_get(0)).assertEqual(1);
      expect(r2.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_7900
     * @tc.name int32ArrayFromPart04TestMindmapTest079
     * @tc.desc Verify from() result can be used as the source for set() to copy into another Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [21, 22, 23];
      let r: Int32Array = Int32Array.from(src);
      let dst: Int32Array = new Int32Array(3);
      dst.set(r);
      expect(dst.$_get(0)).assertEqual(21);
      expect(dst.$_get(2)).assertEqual(23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_8000
     * @tc.name int32ArrayFromPart04TestMindmapTest080
     * @tc.desc Verify reverse() on the from() result reverses element order within the copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let r: Int32Array = Int32Array.from(src);
      r.reverse();
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_8100
     * @tc.name int32ArrayFromPart04TestMindmapTest081
     * @tc.desc Verify map() on the from() result applies the transform function to each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let r: Int32Array = Int32Array.from(src);
      let m: Int32Array = r.map((v: number, _i: int, _a: Int32Array): number => v * 2);
      expect(m.$_get(0)).assertEqual(2);
      expect(m.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_8200
     * @tc.name int32ArrayFromPart04TestMindmapTest082
     * @tc.desc Verify filter() on the from() result selects only elements matching the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3, 4];
      let r: Int32Array = Int32Array.from(src);
      let f: Int32Array = r.filter((v: number, _i: int, _a: Int32Array): boolean => v > 2);
      expect(f.length).assertEqual(2);
      expect(f.$_get(0)).assertEqual(3);
      expect(f.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_8300
     * @tc.name int32ArrayFromPart04TestMindmapTest083
     * @tc.desc Verify from() with null source throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Int32Array.from(null as Object as Array<number>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_8400
     * @tc.name int32ArrayFromPart04TestMindmapTest084
     * @tc.desc Verify from() with undefined source throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Int32Array.from(undefined as Object as Array<number>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_8500
     * @tc.name int32ArrayFromPart04TestMindmapTest085
     * @tc.desc Verify from() Array Number.NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [Number.NaN, 1];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_8600
     * @tc.name int32ArrayFromPart04TestMindmapTest086
     * @tc.desc Verify from() Array Number.POSITIVE_INFINITY/-Number.POSITIVE_INFINITY 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_8700
     * @tc.name int32ArrayFromPart04TestMindmapTest087
     * @tc.desc Verify from() coerces float values in the source array to int32 via truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.2, 2.3, 3.4];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_8800
     * @tc.name int32ArrayFromPart04TestMindmapTest088
     * @tc.desc Verify from() ToInt32 / /Number.NaN/ /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [2147483648, -2147483649, Number.NaN, -4.9, 0.6];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(2147483647);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(-4);
      expect(r.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_8900
     * @tc.name int32ArrayFromPart04TestMindmapTest089
     * @tc.desc Verify from() [-Number.EPSILON, Number.EPSILON, -Number.MIN_VALUE, Number.MIN_VALUE] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-Number.EPSILON, Number.EPSILON, -Number.MIN_VALUE, Number.MIN_VALUE];
      let r: Int32Array = Int32Array.from(src);
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_9000
     * @tc.name int32ArrayFromPart04TestMindmapTest090
     * @tc.desc Verify from() MAX+N [2147483648+32] -2147483648+32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [2147483680];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-2147483616);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_9100
     * @tc.name int32ArrayFromPart04TestMindmapTest091
     * @tc.desc Verify from() -1 0xFFFFFFFF -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-1, -1, -1, -1];
      let r: Int32Array = Int32Array.from(src);
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(-1);
      expect(r.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART04_TEST_MINDMAP_9200
     * @tc.name int32ArrayFromPart04TestMindmapTest092
     * @tc.desc Verify from() preserves sequential values 0 through 7 at correct indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart04TestMindmapTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [0, 1, 2, 3, 4, 5, 6, 7];
      let r: Int32Array = Int32Array.from(src);
      for (let i: int = 0; i < r.length; i++) {
        expect(r.$_get(i)).assertEqual(i);
      }
    });
  });
}
