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

export default function int32ArrayIndexOfPart02Test(): void {
  describe('Int32ArrayIndexOfPart02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest001
     * @tc.desc Verify indexOf returns the expected index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let arr: Int32Array = Int32Array.from(src, (v: number): number => v * 10);
      let r: int = arr.indexOf(20);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest002
     * @tc.desc Verify indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let arr: Int32Array = Int32Array.from(src, (v: number): number => v * 10);
      let r: int = arr.indexOf(999);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest003
     * @tc.desc Verify indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      expect(arr.indexOf(7)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest004
     * @tc.desc Verify indexOf length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      expect(arr.indexOf(4)).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest005
     * @tc.desc Verify indexOf returns -1 when the value is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r = arr.indexOf(99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest006
     * @tc.desc Verify indexOf int $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      let idx: int = arr.indexOf(6);
      expect(arr.$_get(idx)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest007
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 2, 1);
      expect(arr.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest008
     * @tc.desc Verify indexOf() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 5, 5, 5);
      expect(arr.indexOf(5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest009
     * @tc.desc Verify indexOf() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      expect(arr.indexOf(42)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest010
     * @tc.desc Verify indexOf() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      expect(arr.indexOf(43)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest011
     * @tc.desc Verify indexOf() 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.indexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest012
     * @tc.desc Verify indexOf() INT_MAX -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.indexOf(2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest013
     * @tc.desc Verify indexOf() INT_MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 0);
      expect(arr.indexOf(2147483647)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest014
     * @tc.desc Verify indexOf() INT_MIN -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -2147483648);
      expect(arr.indexOf(-2147483648)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest015
     * @tc.desc Verify indexOf() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2);
      expect(arr.indexOf(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest016
     * @tc.desc Verify indexOf() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2, -1, 0);
      expect(arr.indexOf(-1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest017
     * @tc.desc Verify indexOf() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      expect(arr.indexOf(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest018
     * @tc.desc Verify indexOf() -0 +0 +0 === -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1);
      expect(arr.indexOf(-0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest019
     * @tc.desc Verify indexOf() +0 -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-0, 1);
      expect(arr.indexOf(+0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest020
     * @tc.desc Verify indexOf() positive infinity searchElement returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, Number.NaN, 2);
      expect(arr.indexOf(Number.POSITIVE_INFINITY)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest021
     * @tc.desc Verify indexOf() positive infinity does not match a stored zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      expect(arr.indexOf(Number.POSITIVE_INFINITY)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest022
     * @tc.desc Verify indexOf() does not convert 0.5 and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      expect(arr.indexOf(0.5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest023
     * @tc.desc Verify indexOf() does not convert -0.9 and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2);
      expect(arr.indexOf(-0.9)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest024
     * @tc.desc Verify indexOf() does not convert 2147483647.9 and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 2147483647);
      expect(arr.indexOf(2147483647.9)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest025
     * @tc.desc Verify indexOf() searchElement -2147483648 returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, 0);
      expect(arr.indexOf(-2147483648)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest026
     * @tc.desc Verify indexOf() does not convert 2147483649.0 and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -2147483647);
      expect(arr.indexOf(2147483649.0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest027
     * @tc.desc Verify indexOf() does not convert 4294967296.0 and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1);
      expect(arr.indexOf(4294967296.0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest028
     * @tc.desc Verify indexOf() does not convert 4294967297.0 and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1);
      expect(arr.indexOf(4294967297.0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest029
     * @tc.desc Verify indexOf() fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 2);
      expect(arr.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest030
     * @tc.desc Verify indexOf() fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 2);
      expect(arr.indexOf(2, 0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest031
     * @tc.desc Verify indexOf() fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let arr: Int32Array = Int32Array.from(src, (v: number): number => v * 10);
      expect(arr.indexOf(20, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest032
     * @tc.desc Verify indexOf() fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let arr: Int32Array = Int32Array.from(src, (v: number): number => v * 10);
      expect(arr.indexOf(10, 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest033
     * @tc.desc Verify indexOf() fromIndex length -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let arr: Int32Array = Int32Array.from(src, (v: number): number => v * 10);
      expect(arr.indexOf(30, arr.length)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest034
     * @tc.desc Verify indexOf() fromIndex length+1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      expect(arr.indexOf(1, arr.length + 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest035
     * @tc.desc Verify indexOf() fromIndex -1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let arr: Int32Array = Int32Array.from(src, (v: number): number => v * 10);
      expect(arr.indexOf(30, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest036
     * @tc.desc Verify indexOf() fromIndex -length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let arr: Int32Array = Int32Array.from(src, (v: number): number => v * 10);
      expect(arr.indexOf(10, -3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest037
     * @tc.desc Verify indexOf() fromIndex -(length+1) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let arr: Int32Array = Int32Array.from(src, (v: number): number => v * 10);
      expect(arr.indexOf(10, -4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest038
     * @tc.desc Verify indexOf() fromIndex 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 2, 1);
      expect(arr.indexOf(1, 2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest039
     * @tc.desc Verify indexOf() fromIndex=length -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 5, 5);
      expect(arr.indexOf(5, 3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest040
     * @tc.desc Verify indexOf length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let before: int = arr.length;
      arr.indexOf(2);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest041
     * @tc.desc Verify indexOf byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let arr: Int32Array = Int32Array.from(src, (v: number): number => v * 10);
      let before: int = arr.byteLength;
      arr.indexOf(20);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest042
     * @tc.desc Verify indexOf offset byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let before: int = arr.byteOffset;
      arr.indexOf(0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest043
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.indexOf(999);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest044
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      arr.indexOf(8);
      expect(arr.$_get(0)).assertEqual(7);
      {
        let arr: Int32Array = Int32Array.of(7, 8, 9);
        arr.indexOf(8);
        expect(arr.$_get(1)).assertEqual(8);
      }
      {
        let arr: Int32Array = Int32Array.of(7, 8, 9);
        arr.indexOf(8);
        expect(arr.$_get(2)).assertEqual(9);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest045
     * @tc.desc Verify indexOf ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let buf = arr.buffer;
      arr.indexOf(2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest046
     * @tc.desc Verify indexOf BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      arr.indexOf(1);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest047
     * @tc.desc Verify indexOf int this int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.indexOf(2);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest048
     * @tc.desc Verify indexOf -1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r = arr.indexOf(99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest049
     * @tc.desc Verify indexOf 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6);
      let r = arr.indexOf(5);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest050
     * @tc.desc Verify indexOf ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 0, 3);
      a.$_set(0, 11);
      a.$_set(1, 22);
      a.$_set(2, 33);
      let b: Int32Array = new Int32Array(buf, 0, 3);
      a.indexOf(22);
      expect(b.$_get(0)).assertEqual(11);
      expect(b.$_get(1)).assertEqual(22);
      expect(b.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest051
     * @tc.desc Verify indexOf offset byteOffset length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 8, 2);
      a.$_set(0, 100);
      a.$_set(1, 200);
      a.indexOf(100);
      expect(a.byteOffset).assertEqual(8);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest052
     * @tc.desc Verify indexOf ArrayBuffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      a.indexOf(0);
      expect(buf.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest053
     * @tc.desc Verify subarray indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = arr.subarray(2, 5);
      expect(sub.indexOf(40)).assertEqual(1);
      {
        let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
        let sub: Int32Array = arr.subarray(2, 5);
        expect(sub.indexOf(20)).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest054
     * @tc.desc Verify subarray indexOf length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(1, 3);
      let before: int = sub.length;
      sub.indexOf(2);
      expect(sub.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest055
     * @tc.desc Verify new ArrayBuffer indexOf(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf, 0, 3);
      expect(arr.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest056
     * @tc.desc Verify new ArrayBuffer offset indexOf(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      expect(arr.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest057
     * @tc.desc Verify indexOf() of INT_MIN -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      expect(arr.indexOf(-2147483648)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest058
     * @tc.desc Verify indexOf() from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([5, 10, 15, 20]);
      expect(arr.indexOf(15)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest059
     * @tc.desc Verify indexOf() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 7);
      expect(arr.indexOf(7)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest060
     * @tc.desc Verify indexOf() length/2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2, 3, 4);
      expect(arr.indexOf(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest061
     * @tc.desc Verify new Int32Array(N) indexOf(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      expect(arr.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest062
     * @tc.desc Verify indexOf() INT_MIN INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -2, -2147483648, -3);
      expect(arr.indexOf(-2147483648)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest063
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-10, 10, -20, 20);
      expect(arr.indexOf(20)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest064
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-10, 10, -20, 20);
      expect(arr.indexOf(-20)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest065
     * @tc.desc Verify indexOf() searchElement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 1, 4, 1, 5);
      let r1 = arr.indexOf(1);
      let r2 = arr.indexOf(1);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_6600
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest066
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 1, 4, 1, 5);
      arr.indexOf(3);
      expect(arr.indexOf(5)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_6700
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest067
     * @tc.desc Verify indexOf() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      expect(arr.indexOf(2)).assertEqual(1);
      expect(arr.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_6800
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest068
     * @tc.desc Verify indexOf() fromIndex=length-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let arr: Int32Array = Int32Array.from(src, (v: number): number => v * 10);
      expect(arr.indexOf(30, arr.length - 1)).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_6900
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest069
     * @tc.desc Verify indexOf() fromIndex=length-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let arr: Int32Array = Int32Array.from(src, (v: number): number => v * 10);
      expect(arr.indexOf(20, arr.length - 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_7000
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest070
     * @tc.desc Verify indexOf() fromIndex=-2 length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      expect(arr.indexOf(3, -2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_7100
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest071
     * @tc.desc Verify indexOf() fromIndex=-2 length-2 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      expect(arr.indexOf(2, -2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_7200
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest072
     * @tc.desc Verify indexOf() fromIndex=(1  as Array<number>)[0] = [1]= 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 5, 6);
      expect(arr.indexOf(5, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_7300
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest073
     * @tc.desc Verify indexOf() fromIndex length -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      expect(arr.indexOf(1, 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_7400
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest074
     * @tc.desc Verify indexOf() fromIndex -length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let arr: Int32Array = Int32Array.from(src, (v: number): number => v * 10);
      expect(arr.indexOf(10, -2147483647)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_7500
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest075
     * @tc.desc Verify indexOf() 0xA =10 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      expect(arr.indexOf(0xA)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_7600
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest076
     * @tc.desc Verify indexOf() 0x7FFFFFFF INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 2147483647);
      expect(arr.indexOf(0x7FFFFFFF)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_7700
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest077
     * @tc.desc Verify indexOf set indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.indexOf(2);
      arr.$_set(0, 99);
      expect(arr.indexOf(99)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART02_TEST_MINDMAP_7800
     * @tc.name int32ArrayIndexOfPart02TestMindmapTest078
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart02TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.indexOf(3);
      let sum: number = 0;
      for (let i = 0; i < arr.length; i++) {
        sum += arr.$_get(i);
      }
      expect(sum).assertEqual(10);
    });


  });
}
