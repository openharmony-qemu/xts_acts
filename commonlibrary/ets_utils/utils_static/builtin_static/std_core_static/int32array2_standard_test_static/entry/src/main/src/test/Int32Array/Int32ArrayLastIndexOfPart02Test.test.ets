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

export default function int32ArrayLastIndexOfPart02Test(): void {
  describe('Int32ArrayLastIndexOfPart02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest001
     * @tc.desc Verify lastIndexOf returns the expected index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: int = arr.lastIndexOf(20);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest002
     * @tc.desc Verify lastIndexOf returns the expected index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.lastIndexOf(99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest003
     * @tc.desc Verify lastIndexOf returns the expected index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: int = arr.lastIndexOf(0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest004
     * @tc.desc Verify lastIndexOf returns the expected index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.lastIndexOf(0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest005
     * @tc.desc Verify lastIndexOf returns the expected index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 0);
      let r: int = arr.lastIndexOf(2147483647);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest006
     * @tc.desc Verify lastIndexOf returns the expected index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -2147483648);
      let r: int = arr.lastIndexOf(-2147483648);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest007
     * @tc.desc Verify lastIndexOf returns the expected index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: int = arr.lastIndexOf(20, -3);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest008
     * @tc.desc Verify lastIndexOf returns the expected index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: int = arr.lastIndexOf(42);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest009
     * @tc.desc Verify lastIndexOf returns index 1 for the matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Object = arr.lastIndexOf(2) as Object;
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest010
     * @tc.desc Verify lastIndexOf returns index 0 for the matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Object = arr.lastIndexOf(1) as Object;
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest011
     * @tc.desc Verify lastIndexOf returns index 1 for the matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      expect(arr.lastIndexOf(2)).assertEqual(1);
      {
        let arr: Int32Array = Int32Array.of(1, 2, 3);
        let result: int = arr.lastIndexOf(2);
        expect(result).assertEqual(1);
        expect(ArrayBuffer.isView(arr)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest012
     * @tc.desc Verify lastIndexOf hit result can be used as subscript for $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let idx: int = arr.lastIndexOf(8);
      expect(idx).assertEqual(1);
      expect(arr.$_get(idx)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest013
     * @tc.desc Verify lastIndexOf hit on first element returns exactly 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      expect(arr.lastIndexOf(5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest014
     * @tc.desc Verify lastIndexOf hit on last element returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      expect(arr.lastIndexOf(7)).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest015
     * @tc.desc Verify lastIndexOf hit result is within valid range [0, length-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r = arr.lastIndexOf(30);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest016
     * @tc.desc Verify lastIndexOf miss returns exactly -1 not other negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      expect(arr.lastIndexOf(999)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest017
     * @tc.desc Verify -1 from lastIndexOf miss is also integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r = arr.lastIndexOf(99);
      expect(r).assertEqual(Math.floor(r));
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest018
     * @tc.desc Verify lastIndexOf result cannot be less than -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r = arr.lastIndexOf(99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest019
     * @tc.desc Verify two-element array lastIndexOf hitting index 0 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22);
      expect(arr.lastIndexOf(11)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest020
     * @tc.desc Verify two-element array lastIndexOf hitting index 1 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22);
      expect(arr.lastIndexOf(22)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest021
     * @tc.desc Verify three-element array lastIndexOf middle element returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      expect(arr.lastIndexOf(20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest022
     * @tc.desc Verify lastIndexOf() five-element array all same elements returns rightmost index 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 5, 5, 5, 5);
      expect(arr.lastIndexOf(5)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest023
     * @tc.desc Verify lastIndexOf() five-element array target only at index 3 returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 77, 0);
      expect(arr.lastIndexOf(77)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest024
     * @tc.desc Verify four-element array lastIndexOf(0) returns rightmost zero at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2, 0);
      expect(arr.lastIndexOf(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest025
     * @tc.desc Verify lastIndexOf() negative element returns rightmost occurrence index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-3, 10, -3, 20);
      expect(arr.lastIndexOf(-3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest026
     * @tc.desc Verify lastIndexOf() fromIndex=0 first element match returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      expect(arr.lastIndexOf(7, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest027
     * @tc.desc Verify lastIndexOf() fromIndex=0 first element mismatch returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      expect(arr.lastIndexOf(9, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest028
     * @tc.desc Verify lastIndexOf() fromIndex=length-1 matches tail element returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      expect(arr.lastIndexOf(30, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest029
     * @tc.desc Verify lastIndexOf() fromIndex=-1 normalizes to length-1 matches tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      expect(arr.lastIndexOf(30, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest030
     * @tc.desc Verify lastIndexOf() fromIndex=-length normalizes to 0 matches first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      expect(arr.lastIndexOf(10, -3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest031
     * @tc.desc Verify lastIndexOf() fromIndex=length clamps to length-1 returns first element index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      expect(arr.lastIndexOf(1, 3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest032
     * @tc.desc Verify lastIndexOf() INT32_MAX at index 1 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 2147483647, -2147483648);
      expect(arr.lastIndexOf(2147483647)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest033
     * @tc.desc Verify lastIndexOf() INT32_MIN at index 2 returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 2147483647, -2147483648);
      expect(arr.lastIndexOf(-2147483648)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest034
     * @tc.desc Verify lastIndexOf() INT32_MAX not in array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      expect(arr.lastIndexOf(2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest035
     * @tc.desc Verify lastIndexOf() INT32_MIN not in array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      expect(arr.lastIndexOf(-2147483648)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest036
     * @tc.desc Verify lastIndexOf() Number.NaN search always returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      expect(arr.lastIndexOf(Number.NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest037
     * @tc.desc Verify lastIndexOf() -1 all-ones bit pattern matches correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -1, 2);
      expect(arr.lastIndexOf(-1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest038
     * @tc.desc Verify length stays 1 after lastIndexOf on single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      arr.lastIndexOf(42);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest039
     * @tc.desc Verify byteLength unchanged after lastIndexOf on default view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let before: int = arr.byteLength;
      arr.lastIndexOf(20);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest040
     * @tc.desc Verify byteLength unchanged after lastIndexOf on offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let before: int = arr.byteLength;
      arr.lastIndexOf(Number.NaN);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest041
     * @tc.desc Verify BYTES_PER_ELEMENT remains 4 after lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.lastIndexOf(2);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest042
     * @tc.desc Verify byteOffset stays 0 after lastIndexOf on default view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let before: int = arr.byteOffset;
      arr.lastIndexOf(2);
      expect(arr.byteOffset).assertEqual(before);
      expect(before).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest043
     * @tc.desc Verify byteOffset unchanged after lastIndexOf on nonzero offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 8, 2);
      let before: int = arr.byteOffset;
      arr.lastIndexOf(0);
      expect(arr.byteOffset).assertEqual(before);
      expect(before).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest044
     * @tc.desc Verify all elements unchanged after lastIndexOf hit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      arr.lastIndexOf(30);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest045
     * @tc.desc Verify all elements unchanged after lastIndexOf miss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.lastIndexOf(99);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest046
     * @tc.desc Verify INT32_MAX and INT32_MIN elements unchanged after lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648, 0);
      arr.lastIndexOf(0);
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(-2147483648);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest047
     * @tc.desc Verify elements unchanged after lastIndexOf searching Number.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.lastIndexOf(Number.NaN);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest048
     * @tc.desc Verify first element unchanged after lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(77, 88, 99);
      arr.lastIndexOf(99);
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest049
     * @tc.desc Verify last element unchanged after lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(77, 88, 99);
      arr.lastIndexOf(77);
      expect(arr.$_get(2)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest050
     * @tc.desc Verify element values unchanged when read via [] subscript after lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.lastIndexOf(20);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest051
     * @tc.desc Verify buffer reference is same object after lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      let before: ArrayBuffer = arr.buffer;
      arr.lastIndexOf(0);
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest052
     * @tc.desc Verify underlying buffer byteLength unchanged after lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 0, 3);
      let before: int = buf.byteLength;
      arr.lastIndexOf(0);
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest053
     * @tc.desc Verify independent view on same buffer unchanged after lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      a.$_set(0, 11);
      a.$_set(1, 22);
      b.$_set(0, 33);
      b.$_set(1, 44);
      a.lastIndexOf(22);
      expect(b.$_get(0)).assertEqual(33);
      expect(b.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest054
     * @tc.desc Verify overlapping offset view data not corrupted after lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let a1: Int32Array = new Int32Array(buf, 0, 3);
      let a2: Int32Array = new Int32Array(buf, 4, 3);
      a1.$_set(0, 1);
      a1.$_set(1, 2);
      a1.$_set(2, 3);
      a2.$_set(0, 2);
      a2.$_set(1, 3);
      a2.$_set(2, 4);
      a1.lastIndexOf(3);
      expect(a2.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest055
     * @tc.desc Verify byte content unchanged after writing Number.NaN as 0 then calling lastIndexOf(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int32Array = new Int32Array(buf);
      view.$_set(0, Number.NaN);
      let before: number = view.$_get(0);
      let r = view.lastIndexOf(0);
      expect(r).assertEqual(0);
      expect(view.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest056
     * @tc.desc Verify subarray still shares same buffer after lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let sub: Int32Array = arr.subarray(1, 3);
      sub.lastIndexOf(20);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest057
     * @tc.desc Verify subarray elements unchanged after lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sub: Int32Array = arr.subarray(1, 4);
      sub.lastIndexOf(3);
      expect(sub.$_get(0)).assertEqual(2);
      expect(sub.$_get(1)).assertEqual(3);
      expect(sub.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest058
     * @tc.desc Verify parent array elements unchanged after lastIndexOf on subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sub: Int32Array = arr.subarray(1, 4);
      sub.lastIndexOf(3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest059
     * @tc.desc Verify lastIndexOf() length-1 subarray hit returns 0 and subarray length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(2, 3);
      let r = sub.lastIndexOf(3);
      expect(r).assertEqual(0);
      expect(sub.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest060
     * @tc.desc Verify slice copy lastIndexOf does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let cp: Int32Array = arr.slice();
      let r = cp.lastIndexOf(3);
      expect(r).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(cp.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest061
     * @tc.desc Verify new Int32Array(length) all-zero elements unchanged after lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.lastIndexOf(0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest062
     * @tc.desc Verify Int32Array.of constructed elements unchanged after lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7, 8);
      arr.lastIndexOf(7);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest063
     * @tc.desc Verify Int32Array.from constructed elements unchanged after lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [11, 22, 33];
      let arr: Int32Array = Int32Array.from(src);
      arr.lastIndexOf(22);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(22);
      expect(arr.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest064
     * @tc.desc Verify prefix data before offset view is unchanged after lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let prefix: Int32Array = new Int32Array(buf, 0, 1);
      prefix.$_set(0, 999);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.lastIndexOf(2);
      expect(prefix.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest065
     * @tc.desc Verify consecutive lastIndexOf with same arg returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 2, 1);
      let r1 = arr.lastIndexOf(2);
      let r2 = arr.lastIndexOf(2);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_6600
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest066
     * @tc.desc Verify alternating lastIndexOf with different elements returns correct independent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let a = arr.lastIndexOf(10);
      let b = arr.lastIndexOf(99);
      let c = arr.lastIndexOf(30);
      expect(a).assertEqual(0);
      expect(b).assertEqual(-1);
      expect(c).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_6700
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest067
     * @tc.desc Verify consecutive lastIndexOf with different fromIndex returns correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 5, 3, 5, 4);
      expect(arr.lastIndexOf(5, 4)).assertEqual(3);
      expect(arr.lastIndexOf(5, 2)).assertEqual(1);
      expect(arr.lastIndexOf(5, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_6800
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest068
     * @tc.desc Verify lastIndexOf result can be reused as fromIndex to hit same position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7, 6, 5);
      let idx: int = arr.lastIndexOf(7);
      expect(arr.lastIndexOf(7, idx)).assertEqual(idx);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_6900
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest069
     * @tc.desc Verify lastIndexOf() -1 as fromIndex clamps to 0 searching another value returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let miss = arr.lastIndexOf(99);
      let r: int = arr.lastIndexOf(2, miss);
      expect(miss).assertEqual(-1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_7000
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest070
     * @tc.desc Verify all -1 array lastIndexOf(-1) returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -1, -1);
      expect(arr.lastIndexOf(-1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_7100
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest071
     * @tc.desc Verify all zero array lastIndexOf(0) returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0);
      expect(arr.lastIndexOf(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_7200
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest072
     * @tc.desc Verify lastIndexOf() ascending array [1,2,3,4,5] searching 1 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      expect(arr.lastIndexOf(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_7300
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest073
     * @tc.desc Verify lastIndexOf() ascending array searching 5 returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      expect(arr.lastIndexOf(5)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_7400
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest074
     * @tc.desc Verify lastIndexOf() alternating [0,-1,0,-1,0] searching 0 returns rightmost position 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -1, 0, -1, 0);
      expect(arr.lastIndexOf(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_7500
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest075
     * @tc.desc Verify lastIndexOf() -0 search matches slot storing 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2);
      expect(arr.lastIndexOf(-0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART02_TEST_MINDMAP_7600
     * @tc.name int32ArrayLastIndexOfPart02TestMindmapTest076
     * @tc.desc Verify lastIndexOf() 0 search matches slot written via -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart02TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-0, 1, 2);
      expect(arr.lastIndexOf(0)).assertEqual(0);
    });


  });
}
