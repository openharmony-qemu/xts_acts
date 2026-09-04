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

export default function int32ArrayIndexOfPart01Test(): void {
  describe('Int32ArrayIndexOfPart01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest001
     * @tc.desc Verify indexOf() 1 searchElement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: int = arr.indexOf(30);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest002
     * @tc.desc Verify indexOf() 1 searchElement -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: int = arr.indexOf(99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest003
     * @tc.desc Verify indexOf() 1 searchElement 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let r: int = arr.indexOf(7);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest004
     * @tc.desc Verify indexOf() 1 searchElement length-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: int = arr.indexOf(5);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest005
     * @tc.desc Verify indexOf() 2 searchElement+fromIndex fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: int = arr.indexOf(30, 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest006
     * @tc.desc Verify indexOf() 2 fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: int = arr.indexOf(10, 2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest007
     * @tc.desc Verify indexOf() 2 fromIndex=0 fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let r: int = arr.indexOf(7, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest008
     * @tc.desc Verify indexOf() 2 fromIndex >= length -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.indexOf(2, 5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest009
     * @tc.desc Verify indexOf() 2 searchElement fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: int = arr.indexOf(999, 1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest010
     * @tc.desc Verify indexOf() 2 fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 2, 1);
      let r: int = arr.indexOf(2, 2);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest011
     * @tc.desc Verify indexOf() searchElement 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      let r: int = arr.indexOf(4);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest012
     * @tc.desc Verify indexOf() searchElement 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2);
      let r: int = arr.indexOf(0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest013
     * @tc.desc Verify indexOf() searchElement 0 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.indexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest014
     * @tc.desc Verify indexOf() searchElement -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -1, 2);
      let r: int = arr.indexOf(-1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest015
     * @tc.desc Verify indexOf() searchElement -1 -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.indexOf(-1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest016
     * @tc.desc Verify indexOf() searchElement -7 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-7, 0, 7);
      let r: int = arr.indexOf(-7);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest017
     * @tc.desc Verify indexOf() searchElement -7 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-8, 0, 7);
      let r: int = arr.indexOf(-7);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest018
     * @tc.desc Verify indexOf() searchElement INT_MAX (2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0, 2147483647);
      let r: int = arr.indexOf(2147483647);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest019
     * @tc.desc Verify indexOf() searchElement INT_MAX (2147483647) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0, 2147483646);
      let r: int = arr.indexOf(2147483647);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest020
     * @tc.desc Verify indexOf() searchElement INT_MIN (-2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -2147483648, 2);
      let r: int = arr.indexOf(-2147483648);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest021
     * @tc.desc Verify indexOf() searchElement INT_MIN (-2147483648) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -2147483647, 2);
      let r: int = arr.indexOf(-2147483648);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest022
     * @tc.desc Verify indexOf() searchElement INT_MAX (2147483647) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -1, 0);
      let r: int = arr.indexOf(2147483647);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest023
     * @tc.desc Verify indexOf() searchElement INT_MIN (-2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -1, -2147483648);
      let r: int = arr.indexOf(-2147483648);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest024
     * @tc.desc Verify indexOf() searchElement -0.0 number +0 -0===+0 true 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2);
      let r: int = arr.indexOf(-0.0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest025
     * @tc.desc Verify indexOf() searchElement -0.0 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.indexOf(-0.0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest026
     * @tc.desc Verify indexOf() searchElement 0.0 number 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2);
      let r: int = arr.indexOf(0.0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest027
     * @tc.desc Verify indexOf() searchElement Number.NaN number 0 Number.NaN===0 false -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2);
      let r: int = arr.indexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest028
     * @tc.desc Verify indexOf() searchElement Number.POSITIVE_INFINITY Number.POSITIVE_INFINITY int -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2);
      let r: int = arr.indexOf(Number.POSITIVE_INFINITY);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest029
     * @tc.desc Verify indexOf() searchElement -Number.POSITIVE_INFINITY -Number.POSITIVE_INFINITY int -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.indexOf(Number.NEGATIVE_INFINITY);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest030
     * @tc.desc Verify indexOf() searchElement Number.POSITIVE_INFINITY -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: int = arr.indexOf(Number.POSITIVE_INFINITY);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest031
     * @tc.desc Verify indexOf() searchElement 0.5 0.5=== int false -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      let r: int = arr.indexOf(0.5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest032
     * @tc.desc Verify indexOf() searchElement -0.9 -0.9=== int false -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -1, -2);
      let r: int = arr.indexOf(-0.9);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest033
     * @tc.desc Verify indexOf() searchElement 1.5 1/2 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      let r: int = arr.indexOf(1.5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest034
     * @tc.desc Verify indexOf() searchElement -1.5 -1/-2 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2, -1, 0);
      let r: int = arr.indexOf(-1.5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest035
     * @tc.desc Verify indexOf() searchElement 0.999999 1 1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      let r: int = arr.indexOf(0.999999);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest036
     * @tc.desc Verify indexOf() searchElement -0.999999 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0, 1);
      let r: int = arr.indexOf(-0.999999);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest037
     * @tc.desc Verify indexOf() searchElement 2147483647.9 INT_MAX 2147483647 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 2147483647, 1);
      let r: int = arr.indexOf(2147483647.9);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest038
     * @tc.desc Verify indexOf() searchElement 2.220446049250313e-16 Number.EPSILON 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1);
      let r: int = arr.indexOf(2.220446049250313e-16);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest039
     * @tc.desc Verify indexOf() searchElement -2147483648 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -2147483648, 1);
      let r: int = arr.indexOf(-2147483648);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest040
     * @tc.desc Verify indexOf() searchElement 2147483647 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 2147483647, 1);
      let r: int = arr.indexOf(2147483647);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest041
     * @tc.desc Verify indexOf() searchElement 4294967296.0 (2^32 number ) 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2);
      let r: int = arr.indexOf(4294967296.0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest042
     * @tc.desc Verify indexOf() searchElement 4294967297.0 (2^32+1 number ) 1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      let r: int = arr.indexOf(4294967297.0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest043
     * @tc.desc Verify indexOf() searchElement 2147483649.0 (INT_MAX+2 number ) -2147483647 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -2147483647, 1);
      let r: int = arr.indexOf(2147483649.0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest044
     * @tc.desc Verify indexOf() searchElement 4294967295.0 (0xFFFFFFFF number ) -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -1, 1);
      let r: int = arr.indexOf(4294967295.0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest045
     * @tc.desc Verify indexOf() searchElement -4294967296.0 (-2^32 number ) 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1);
      let r: int = arr.indexOf(-4294967296.0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest046
     * @tc.desc Verify indexOf() searchElement 0xFF =255 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 255, -1);
      let r: int = arr.indexOf(0xFF);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest047
     * @tc.desc Verify indexOf() searchElement 0o77 =63 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(63, 64);
      let r: int = arr.indexOf(0o77);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest048
     * @tc.desc Verify indexOf() searchElement 0b1010 =10 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9, 10, 11);
      let r: int = arr.indexOf(0b1010);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest049
     * @tc.desc Verify indexOf() searchElement 0b101 =5 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 4, 5, 6);
      let r: int = arr.indexOf(0b101);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest050
     * @tc.desc Verify indexOf() searchElement 0o10 =8 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let r: int = arr.indexOf(0o10);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest051
     * @tc.desc Verify indexOf() searchElement 1e2 =100 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(99, 100, 101);
      let r: int = arr.indexOf(1e2);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest052
     * @tc.desc Verify indexOf() searchElement -1e2 =-100 -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-150, -100, -50);
      let r: int = arr.indexOf(-1e2);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest053
     * @tc.desc Verify indexOf() searchElement 1.5e2 =150.0 number 150 int number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(50, 100, 150);
      let r: int = arr.indexOf(1.5e2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest054
     * @tc.desc Verify indexOf() searchElement (5+5=10) 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 10, 15);
      let r: int = arr.indexOf(5 + 5);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest055
     * @tc.desc Verify indexOf() searchElement (1<<3=8) 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let r: int = arr.indexOf(1 << 3);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest056
     * @tc.desc Verify indexOf() fromIndex=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: int = arr.indexOf(30, 1);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest057
     * @tc.desc Verify indexOf() fromIndex=length-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.indexOf(3, 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest058
     * @tc.desc Verify indexOf() fromIndex=length-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: int = arr.indexOf(10, 2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest059
     * @tc.desc Verify indexOf() fromIndex=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 7, 5, 7);
      let r: int = arr.indexOf(7, 1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest060
     * @tc.desc Verify indexOf() fromIndex=0 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33, 44);
      let r: int = arr.indexOf(44, 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest061
     * @tc.desc Verify indexOf() fromIndex=length -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.indexOf(3, 3);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest062
     * @tc.desc Verify indexOf() fromIndex=length+1 +1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.indexOf(1, 4);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest063
     * @tc.desc Verify indexOf() fromIndex 1000000 length -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.indexOf(3, 1000000);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest064
     * @tc.desc Verify indexOf() fromIndex=INT_MAX (2147483647) length -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.indexOf(1, 2147483647);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest065
     * @tc.desc Verify indexOf() fromIndex=-1 1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: int = arr.indexOf(30, -1);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest066
     * @tc.desc Verify indexOf() fromIndex=-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: int = arr.indexOf(20, -1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest067
     * @tc.desc Verify indexOf() fromIndex=-2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: int = arr.indexOf(30, -2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest068
     * @tc.desc Verify indexOf() fromIndex=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      let r: int = arr.indexOf(5, -3);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest069
     * @tc.desc Verify indexOf() fromIndex=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: int = arr.indexOf(30, -4);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest070
     * @tc.desc Verify indexOf() fromIndex=-(length+1) < 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      let r: int = arr.indexOf(5, -4);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest071
     * @tc.desc Verify indexOf() fromIndex=-(length+1) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      let r: int = arr.indexOf(99, -4);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest072
     * @tc.desc Verify indexOf() fromIndex -1000000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.indexOf(1, -1000000);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest073
     * @tc.desc Verify indexOf() fromIndex=INT_MIN (-2147483648) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42, 43, 44);
      let r: int = arr.indexOf(42, -2147483648);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_7400
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest074
     * @tc.desc Verify indexOf() fromIndex=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 7, 5, 7);
      let r: int = arr.indexOf(7, -1);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_7500
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest075
     * @tc.desc Verify indexOf() fromIndex=-2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 5, 7, 5, 7);
      let r: int = arr.indexOf(7, -2);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_7600
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest076
     * @tc.desc Verify indexOf() fromIndex=0 searchElement=INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648, 0);
      let r: int = arr.indexOf(2147483647, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_7700
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest077
     * @tc.desc Verify indexOf() fromIndex=1 searchElement=INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648, 0);
      let r: int = arr.indexOf(-2147483648, 1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_7800
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest078
     * @tc.desc Verify indexOf() fromIndex=-1 searchElement=INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2147483647);
      let r: int = arr.indexOf(2147483647, -1);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_7900
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest079
     * @tc.desc Verify indexOf() fromIndex=-3 0 searchElement=INT_MIN 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, -2147483648, -1, 0);
      let r: int = arr.indexOf(-2147483648, -3);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_8000
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest080
     * @tc.desc Verify indexOf() fromIndex=-3 0 searchElement=INT_MAX 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 0, -1);
      let r: int = arr.indexOf(2147483647, -3);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_8100
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest081
     * @tc.desc Verify indexOf() fromIndex=-1 searchElement=INT_MAX INT_MAX -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648, 0);
      let r: int = arr.indexOf(2147483647, -1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_8200
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest082
     * @tc.desc Verify indexOf() fromIndex=length searchElement=0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      let r: int = arr.indexOf(0, 3);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_8300
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest083
     * @tc.desc Verify indexOf() fromIndex=0 Number.NaN number -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      let r: int = arr.indexOf(Number.NaN, 0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_8400
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest084
     * @tc.desc Verify indexOf() fromIndex=0 +Number.POSITIVE_INFINITY int -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      let r: int = arr.indexOf(Number.POSITIVE_INFINITY, 0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_8500
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest085
     * @tc.desc Verify indexOf() fromIndex=0 -0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2);
      let r: int = arr.indexOf(-0.0, 0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_8600
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest086
     * @tc.desc Verify indexOf() searchElement fromIndex=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: int = arr.indexOf(42, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_8700
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest087
     * @tc.desc Verify indexOf() searchElement fromIndex=0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: int = arr.indexOf(7, 0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_8800
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest088
     * @tc.desc Verify indexOf() fromIndex=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: int = arr.indexOf(42, -1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_8900
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest089
     * @tc.desc Verify indexOf() fromIndex=1 (>=length) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: int = arr.indexOf(42, 1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_9000
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest090
     * @tc.desc Verify indexOf() fromIndex=-2 <0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: int = arr.indexOf(42, -2);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_9100
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest091
     * @tc.desc Verify indexOf() fromIndex=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 7, 7, 7);
      let r: int = arr.indexOf(7, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_9200
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest092
     * @tc.desc Verify indexOf() fromIndex=2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 7, 7, 7);
      let r: int = arr.indexOf(7, 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_9300
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest093
     * @tc.desc Verify indexOf() fromIndex=-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 7, 7, 7);
      let r: int = arr.indexOf(7, -1);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_9400
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest094
     * @tc.desc Verify indexOf() 0 fromIndex=0 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      let r: int = arr.indexOf(0, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_9500
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest095
     * @tc.desc Verify indexOf() 0 fromIndex=1 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      let r: int = arr.indexOf(0, 1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_9600
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest096
     * @tc.desc Verify indexOf() searchElement=1 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2, -1, 0);
      let r: int = arr.indexOf(1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_9700
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest097
     * @tc.desc Verify indexOf() searchElement=-99 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, 0, 1);
      let r: int = arr.indexOf(-99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_9800
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest098
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.indexOf(3);
      expect(arr.length).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART01_TEST_MINDMAP_9900
     * @tc.name int32ArrayIndexOfPart01TestMindmapTest099
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart01TestMindmapTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.indexOf(99, -1);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });
  });
}
