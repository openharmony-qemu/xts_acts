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

export default function int32ArrayLastIndexOfPart01Test(): void {
  describe('Int32ArrayLastIndexOfPart01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest001
     * @tc.desc Verify lastIndexOf with single parameter omitting fromIndex hits the rightmost duplicate element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(4, 5, 6, 5);
      const r: int = values.lastIndexOf(5);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest002
     * @tc.desc Verify lastIndexOf with single parameter when target does not exist returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2, 3);
      const r: int = values.lastIndexOf(99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest003
     * @tc.desc Verify lastIndexOf with single parameter when target only appears at first position returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(7, 8, 9);
      const r: int = values.lastIndexOf(7);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest004
     * @tc.desc Verify lastIndexOf with single parameter when target only appears at the end returns length minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(10, 20, 30);
      const r: int = values.lastIndexOf(30);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest005
     * @tc.desc Verify lastIndexOf with two parameters fromIndex=0 only searches the first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(5, 6, 7, 5);
      const r: int = values.lastIndexOf(5, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest006
     * @tc.desc Verify lastIndexOf with fromIndex as middle index only searches leftwards from that position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(4, 5, 6, 5, 7);
      const r: int = values.lastIndexOf(5, 2);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest007
     * @tc.desc Verify lastIndexOf with fromIndex pointing to the end is equivalent to single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(4, 5, 6, 5);
      const r: int = values.lastIndexOf(5, 3);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest008
     * @tc.desc Verify lastIndexOf with searchElement 0 on single element array returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(0);
      const r: int = values.lastIndexOf(0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest009
     * @tc.desc Verify lastIndexOf with searchElement 0 hits the rightmost 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(0, 1, 0, 2);
      const r: int = values.lastIndexOf(0);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest010
     * @tc.desc Verify lastIndexOf with searchElement -1 hits the rightmost -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-1, 0, -1, -2);
      const r: int = values.lastIndexOf(-1);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest011
     * @tc.desc Verify lastIndexOf with searchElement INT_MAX 2147483647 hits the rightmost
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2147483647, 2, 2147483647);
      const r: int = values.lastIndexOf(2147483647);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest012
     * @tc.desc Verify lastIndexOf with searchElement INT_MIN -2147483648 hits the rightmost
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-2147483648, 0, -2147483648);
      const r: int = values.lastIndexOf(-2147483648);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest013
     * @tc.desc Verify lastIndexOf with INT_MAX when not present returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2, 3);
      const r: int = values.lastIndexOf(2147483647);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest014
     * @tc.desc Verify lastIndexOf with INT_MIN when not present returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2, 3);
      const r: int = values.lastIndexOf(-2147483648);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest015
     * @tc.desc Verify lastIndexOf with regular negative number -2 appearing multiple times returns the rightmost index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-2, -3, -2, -4);
      const r: int = values.lastIndexOf(-2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest016
     * @tc.desc Verify lastIndexOf with large positive number 1000000 when present hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1000000, 2, 1000000);
      const r: int = values.lastIndexOf(1000000);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest017
     * @tc.desc Verify lastIndexOf with large negative number -1000000 when present hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-1000000, -1000000, 3);
      const r: int = values.lastIndexOf(-1000000);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest018
     * @tc.desc Verify lastIndexOf with all same elements returns length minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(7, 7, 7, 7);
      const r: int = values.lastIndexOf(7);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest019
     * @tc.desc Verify lastIndexOf with 0xFFFFFFFF corresponding int value -1 hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, -1, 2);
      const r: int = values.lastIndexOf(-1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest020
     * @tc.desc Verify lastIndexOf with alternating positive negative values searching for middle positive hits the rightmost
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(3, -3, 3, -3, 3);
      const r: int = values.lastIndexOf(3);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest021
     * @tc.desc Verify lastIndexOf with alternating positive negative values searching for negative hits the rightmost
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(3, -3, 3, -3, 3);
      const r: int = values.lastIndexOf(-3);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest022
     * @tc.desc Verify lastIndexOf with searchElement Number.NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(0, 1, 2);
      const r: int = values.lastIndexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest023
     * @tc.desc Verify lastIndexOf with searchElement positive Number.POSITIVE_INFINITY returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(0, 1, 2147483647);
      const r: int = values.lastIndexOf(Number.POSITIVE_INFINITY);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest024
     * @tc.desc Verify lastIndexOf with searchElement negative Number.POSITIVE_INFINITY returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-2147483648, 0, 1);
      const r: int = values.lastIndexOf(Number.NEGATIVE_INFINITY);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest025
     * @tc.desc Verify lastIndexOf with 0.5 positive decimal returns -1 not truncated to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(0, 1, 2);
      const r: int = values.lastIndexOf(0.5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest026
     * @tc.desc Verify lastIndexOf with -0.9 negative decimal returns -1 not truncated to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-1, 0, 1);
      const r: int = values.lastIndexOf(-0.9);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest027
     * @tc.desc Verify lastIndexOf with 2147483647.9 returns -1 not truncated to INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(2147483647, 0);
      const r: int = values.lastIndexOf(2147483647.9);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest028
     * @tc.desc Verify lastIndexOf with -0.0 negative zero hits stored 0 SameValueZero equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 0, 2);
      const r: int = values.lastIndexOf(-0.0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest029
     * @tc.desc Verify lastIndexOf with 0.0 positive zero hits stored 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 0, 2, 0);
      const r: int = values.lastIndexOf(0.0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest030
     * @tc.desc Verify lastIndexOf with 1.0 hits int stored 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(2, 1, 3);
      const r: int = values.lastIndexOf(1.0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest031
     * @tc.desc Verify lastIndexOf with 2147483648.0 INT_MAX+1 returns -1 not ToInt32 wrap to INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-2147483648, 2147483647, 0);
      const r: int = values.lastIndexOf(2147483648.0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest032
     * @tc.desc Verify lastIndexOf with -2147483649.0 INT_MIN-1 returns -1 not ToInt32 wrap to INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(2147483647, -2147483648, 0);
      const r: int = values.lastIndexOf(-2147483649.0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest033
     * @tc.desc Verify lastIndexOf with 4294967296.0 2^32 returns -1 not ToInt32 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(0, 1, 2);
      const r: int = values.lastIndexOf(4294967296.0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest034
     * @tc.desc Verify lastIndexOf with 4294967297.0 2^32+1 returns -1 not ToInt32 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(0, 1, 2);
      const r: int = values.lastIndexOf(4294967297.0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest035
     * @tc.desc Verify lastIndexOf all zeros searching Number.NaN still returns -1 distinguishes 0 from Number.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(0, 0, 0);
      const r: int = values.lastIndexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest036
     * @tc.desc Verify lastIndexOf with INT_MAX 2147483647.0 hits int stored INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2147483647, 2);
      const r: int = values.lastIndexOf(2147483647.0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest037
     * @tc.desc Verify lastIndexOf with INT_MIN -2147483648.0 hits int stored INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, -2147483648, 2);
      const r: int = values.lastIndexOf(-2147483648.0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest038
     * @tc.desc Verify lastIndexOf with 1.5 non-integer number returns -1 not truncated to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(0, 1, 2);
      const r: int = values.lastIndexOf(1.5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest039
     * @tc.desc Verify lastIndexOf with -1.5 negative non-integer number returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-2, -1, 0);
      const r: int = values.lastIndexOf(-1.5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest040
     * @tc.desc Verify lastIndexOf with searchElement 0 int hits 0 in array distinguishing from Number.NaN path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 0, 2);
      const r: int = values.lastIndexOf(0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest041
     * @tc.desc Verify lastIndexOf with 1073741824.0 2^30 within int range hits precisely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(0, 1073741824, 2);
      const r: int = values.lastIndexOf(1073741824.0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest042
     * @tc.desc Verify lastIndexOf with -1073741824.0 negative 2^30 hits precisely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-1073741824, 1, -1073741824);
      const r: int = values.lastIndexOf(-1073741824.0);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest043
     * @tc.desc Verify lastIndexOf fromIndex 0 with target at 0 hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(5, 6, 7);
      const r: int = values.lastIndexOf(5, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest044
     * @tc.desc Verify lastIndexOf fromIndex 0 with target only after 0 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(5, 6, 7);
      const r: int = values.lastIndexOf(6, 0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest045
     * @tc.desc Verify lastIndexOf fromIndex length-1 end position with target at end hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2, 3);
      const r: int = values.lastIndexOf(3, 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest046
     * @tc.desc Verify lastIndexOf fromIndex equals length clamps to length-1 hitting end element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2, 3);
      const r: int = values.lastIndexOf(3, 3);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest047
     * @tc.desc Verify lastIndexOf fromIndex greater than length clamps to length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2, 3, 2);
      const r: int = values.lastIndexOf(2, 100);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest048
     * @tc.desc Verify lastIndexOf fromIndex 2147483647 clamps to length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2, 3);
      const r: int = values.lastIndexOf(3, 2147483647);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest049
     * @tc.desc Verify lastIndexOf fromIndex -1 corresponds to last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2, 3);
      const r: int = values.lastIndexOf(3, -1);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest050
     * @tc.desc Verify lastIndexOf fromIndex -1 finds the first element at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2, 3);
      const r: int = values.lastIndexOf(1, -1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest051
     * @tc.desc Verify lastIndexOf fromIndex -2 second last index hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2, 3, 4);
      const r: int = values.lastIndexOf(3, -2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest052
     * @tc.desc Verify lastIndexOf fromIndex -2 target only at end returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2, 3, 4);
      const r: int = values.lastIndexOf(4, -2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest053
     * @tc.desc Verify lastIndexOf fromIndex negative length corresponds to index 0 hits first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(7, 8, 9);
      const r: int = values.lastIndexOf(7, -3);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest054
     * @tc.desc Verify lastIndexOf fromIndex negative length target not at 0 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(7, 8, 9);
      const r: int = values.lastIndexOf(8, -3);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest055
     * @tc.desc Verify lastIndexOf fromIndex negative length+1 out of bounds returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(7, 8, 9);
      const r: int = values.lastIndexOf(7, -4);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest056
     * @tc.desc Verify lastIndexOf fromIndex -1000000 resulting start position less than 0 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2, 3);
      const r: int = values.lastIndexOf(2, -1000000);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest057
     * @tc.desc Verify lastIndexOf fromIndex middle 2 target exists at fromIndex and right returns fromIndex position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(5, 6, 5, 7, 5);
      const r: int = values.lastIndexOf(5, 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest058
     * @tc.desc Verify lastIndexOf fromIndex -3 length 5 corresponds to index 2 hits that position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(9, 8, 7, 6, 5);
      const r: int = values.lastIndexOf(7, -3);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest059
     * @tc.desc Verify lastIndexOf fromIndex -3 length 5 target only at its right returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(9, 8, 7, 6, 5);
      const r: int = values.lastIndexOf(5, -3);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest060
     * @tc.desc Verify lastIndexOf single element array fromIndex 0 finds unique element hits 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(42);
      const r: int = values.lastIndexOf(42, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest061
     * @tc.desc Verify lastIndexOf single element array fromIndex -1 finds unique element hits 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(42);
      const r: int = values.lastIndexOf(42, -1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest062
     * @tc.desc Verify lastIndexOf single element array fromIndex 1 greater than or equal to length clamps to 0 hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(42);
      const r: int = values.lastIndexOf(42, 1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest063
     * @tc.desc Verify lastIndexOf single element array fromIndex -2 less than negative length returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(42);
      const r: int = values.lastIndexOf(42, -2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest064
     * @tc.desc Verify lastIndexOf empty array omitting fromIndex returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(0);
      const r: int = values.lastIndexOf(0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest065
     * @tc.desc Verify lastIndexOf empty array with fromIndex 0 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(0);
      const r: int = values.lastIndexOf(0, 0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest066
     * @tc.desc Verify lastIndexOf empty array with Number.NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(0);
      const r: int = values.lastIndexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest067
     * @tc.desc Verify lastIndexOf fromIndex middle 1 target at fromIndex hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(10, 20, 30);
      const r: int = values.lastIndexOf(20, 1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest068
     * @tc.desc Verify lastIndexOf fromIndex middle 1 target only at its right index 2 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(10, 20, 30);
      const r: int = values.lastIndexOf(30, 1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest069
     * @tc.desc Verify lastIndexOf fromIndex middle 1 target at its left index 0 hits 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(10, 20, 30);
      const r: int = values.lastIndexOf(10, 1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest070
     * @tc.desc Verify lastIndexOf all same elements fromIndex 1 returns 1 rightmost within fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(5, 5, 5, 5);
      const r: int = values.lastIndexOf(5, 1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest071
     * @tc.desc Verify lastIndexOf all same elements fromIndex length-1 returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(5, 5, 5, 5);
      const r: int = values.lastIndexOf(5, 3);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest072
     * @tc.desc Verify lastIndexOf two element array searching b fromIndex 0 returns -1 b is to the right unreachable scanning leftwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(11, 22);
      const r: int = values.lastIndexOf(22, 0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest073
     * @tc.desc Verify lastIndexOf two element array searching b fromIndex 1 hits 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(11, 22);
      const r: int = values.lastIndexOf(22, 1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_7400
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest074
     * @tc.desc Verify lastIndexOf two element array searching b fromIndex -1 hits 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(11, 22);
      const r: int = values.lastIndexOf(22, -1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_7500
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest075
     * @tc.desc Verify lastIndexOf two element array searching a fromIndex -2 corresponding to 0 hits 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(11, 22);
      const r: int = values.lastIndexOf(11, -2);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_7600
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest076
     * @tc.desc Verify lastIndexOf fromIndex -1 element at end and duplicated at left returns end index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(7, 8, 7, 8);
      const r: int = values.lastIndexOf(8, -1);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_7700
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest077
     * @tc.desc Verify lastIndexOf array with multiple 0s fromIndex 0 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(0, 1, 0);
      const r: int = values.lastIndexOf(0, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_7800
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest078
     * @tc.desc Verify lastIndexOf array with multiple 0s fromIndex 2 returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(0, 1, 0);
      const r: int = values.lastIndexOf(0, 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_7900
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest079
     * @tc.desc Verify lastIndexOf all -1 fromIndex -2 corresponds to length-2 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-1, -1, -1);
      const r: int = values.lastIndexOf(-1, -2);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_8000
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest080
     * @tc.desc Verify lastIndexOf length 6 array fromIndex 2 hitting fromIndex element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60);
      const r: int = values.lastIndexOf(30, 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_8100
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest081
     * @tc.desc Verify lastIndexOf length 6 array fromIndex -4 corresponds to index 2 hits that position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60);
      const r: int = values.lastIndexOf(30, -4);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_8200
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest082
     * @tc.desc Verify lastIndexOf INT_MAX appearing multiple times fromIndex 0 returns leftmost position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(2147483647, 0, 2147483647);
      const r: int = values.lastIndexOf(2147483647, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART01_TEST_MINDMAP_8300
     * @tc.name int32ArrayLastIndexOfPart01TestMindmapTest083
     * @tc.desc Verify lastIndexOf INT_MIN appearing multiple times fromIndex length clamps to end returns rightmost index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart01TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-2147483648, -2147483648);
      const r: int = values.lastIndexOf(-2147483648, 2);
      expect(r).assertEqual(1);
    });
  });
}
