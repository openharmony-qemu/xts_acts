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

export default function int32ArrayIndexOfPart04Test(): void {
  describe('Int32ArrayIndexOfPart04Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest001
     * @tc.desc Verify indexOf length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let beforeLen: int = arr.length;
      arr.indexOf(20);
      expect(arr.length).assertEqual(beforeLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest002
     * @tc.desc Verify indexOf length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.indexOf(99);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest003
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.indexOf(3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest004
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.indexOf(-5);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest005
     * @tc.desc Verify indexOf byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(new ArrayBuffer(16));
      let beforeBL: int = arr.byteLength;
      arr.indexOf(0);
      expect(arr.byteLength).assertEqual(beforeBL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest006
     * @tc.desc Verify indexOf byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf, 8, 3);
      let beforeBO: int = arr.byteOffset;
      arr.indexOf(0);
      expect(arr.byteOffset).assertEqual(beforeBO);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest007
     * @tc.desc Verify indexOf buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.indexOf(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest008
     * @tc.desc Verify indexOf length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.indexOf(1);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest009
     * @tc.desc Verify indexOf fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9, 7);
      arr.indexOf(7, 1);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest010
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 3, 5, 3, 5);
      let r1: int = arr.indexOf(3);
      let r2: int = arr.indexOf(3);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest011
     * @tc.desc Verify indexOf fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.indexOf(2, 1000000);
      expect(r).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest012
     * @tc.desc Verify indexOf() positive infinity does not match a stored zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 0, 6);
      let r: int = arr.indexOf(Number.POSITIVE_INFINITY);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest013
     * @tc.desc Verify indexOf() number 0.5 does not match a stored zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 0, 2);
      let r: int = arr.indexOf(0.5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest014
     * @tc.desc Verify indexOf() number -0.9 does not match a stored zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 0, 4);
      let r: int = arr.indexOf(-0.9);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest015
     * @tc.desc Verify indexOf() number 2147483647.9 does not match INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 2147483647, -1);
      let r: int = arr.indexOf(2147483647.9);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest016
     * @tc.desc Verify indexOf() number 2147483648.0 does not match INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -2147483648, 2);
      let r: int = arr.indexOf(2147483648.0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest017
     * @tc.desc Verify indexOf() number 2147483649.0 does not match -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -2147483647, 0);
      let r: int = arr.indexOf(2147483649.0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest018
     * @tc.desc Verify indexOf() number -2147483649.0 does not match INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 2147483647, 0);
      let r: int = arr.indexOf(-2147483649.0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest019
     * @tc.desc Verify indexOf() number -0.0 ToInt32 0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 0, 6);
      let r: int = arr.indexOf(-0.0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest020
     * @tc.desc Verify indexOf() does not convert 1.1 and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2);
      let r: int = arr.indexOf(1.1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest021
     * @tc.desc Verify indexOf() does not convert -1.1 and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -1, 2);
      let r: int = arr.indexOf(-1.1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest022
     * @tc.desc Verify indexOf() does not convert 1.999999 and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 1, 3);
      let r: int = arr.indexOf(1.999999);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest023
     * @tc.desc Verify indexOf() does not convert -2147483648.5 and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -2147483648, 1);
      let r: int = arr.indexOf(-2147483648.5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest024
     * @tc.desc Verify indexOf() number -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: int = arr.indexOf(99.9);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest025
     * @tc.desc Verify indexOf() number 3.5 ToInt32 3 3.5 !== 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 3, 0);
      let r: int = arr.indexOf(3.5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest026
     * @tc.desc Verify indexOf() does not convert -2.5 and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, -2, 3);
      let r: int = arr.indexOf(-2.5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest027
     * @tc.desc Verify $_set indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.$_set(1, 99);
      let r: int = arr.indexOf(99);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest028
     * @tc.desc Verify $_set indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.$_set(0, 77);
      let r: int = arr.indexOf(77);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest029
     * @tc.desc Verify $_set indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.$_set(2, 55);
      let r: int = arr.indexOf(55);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest030
     * @tc.desc Verify $_set indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.$_set(2, 1);
      let r: int = arr.indexOf(1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest031
     * @tc.desc Verify $_set indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.$_set(1, 99);
      let r: int = arr.indexOf(2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest032
     * @tc.desc Verify $_set INT_MIN indexOf INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(1, -2147483648);
      let r: int = arr.indexOf(-2147483648);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest033
     * @tc.desc Verify $_set INT_MAX indexOf INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(2, 2147483647);
      let r: int = arr.indexOf(2147483647);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest034
     * @tc.desc Verify set(array, offset) indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let src: Int32Array = Int32Array.of(11, 22);
      arr.set(src, 2);
      let r: int = arr.indexOf(22);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest035
     * @tc.desc Verify set(array) offset 0 indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.of(7, 8, 9);
      arr.set(src);
      let r: int = arr.indexOf(7);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest036
     * @tc.desc Verify set INT_MIN indexOf INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let src: Int32Array = Int32Array.of(0, -2147483648);
      arr.set(src, 1);
      let r: int = arr.indexOf(-2147483648);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest037
     * @tc.desc Verify fill(value) indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(42);
      let r: int = arr.indexOf(42);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest038
     * @tc.desc Verify fill(value, start) start indexOf start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.fill(7, 2);
      let r: int = arr.indexOf(7);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest039
     * @tc.desc Verify indexOf() fill(value, start, end) 0 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.fill(9, 1, 4);
      expect(arr.indexOf(9)).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest040
     * @tc.desc Verify fill INT_MIN indexOf INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(-2147483648);
      let r: int = arr.indexOf(-2147483648);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest041
     * @tc.desc Verify fill INT_MAX indexOf INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(2147483647);
      let r: int = arr.indexOf(2147483647);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest042
     * @tc.desc Verify fill -1 indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(-1);
      let r: int = arr.indexOf(-1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest043
     * @tc.desc Verify copyWithin indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(0, 3, 5);
      let r: int = arr.indexOf(4);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest044
     * @tc.desc Verify reverse indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.reverse();
      let r: int = arr.indexOf(10);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest045
     * @tc.desc Verify indexOf() reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.reverse();
      let r: int = arr.indexOf(30);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest046
     * @tc.desc Verify sort indexOf(INT_MIN) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, -2147483648, 0, 2147483647);
      arr.sort();
      let r: int = arr.indexOf(-2147483648);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest047
     * @tc.desc Verify sort indexOf(INT_MAX) length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, -2147483648, 0, 2147483647);
      arr.sort();
      let r: int = arr.indexOf(2147483647);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest048
     * @tc.desc Verify sort indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 1, 2, 1, 2);
      arr.sort();
      let r: int = arr.indexOf(2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest049
     * @tc.desc Verify indexOf() copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2, 3, 4);
      arr.copyWithin(0, 3, 5);
      expect(arr.indexOf(3)).assertEqual(0);
      expect(arr.indexOf(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest050
     * @tc.desc Verify A Buffer B indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(2, 123);
      let r: int = b.indexOf(123);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest051
     * @tc.desc Verify byteOffset A B indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 8, 4);
      a.$_set(3, 77);
      let r: int = b.indexOf(77);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest052
     * @tc.desc Verify subarray indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(2, 5);
      arr.$_set(3, 99);
      let r: int = sub.indexOf(99);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest053
     * @tc.desc Verify subarray indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let sub: Int32Array = arr.subarray(1, 4);
      sub.$_set(1, 88);
      let r: int = arr.indexOf(88);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest054
     * @tc.desc Verify subarray indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 5, 0, 0);
      let sub: Int32Array = arr.subarray(1, 5);
      let r: int = sub.indexOf(5);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest055
     * @tc.desc Verify subarray indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = arr.subarray(2, 2);
      let r: int = sub.indexOf(2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest056
     * @tc.desc Verify subarray begin>=end indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = arr.subarray(3, 1);
      expect(sub.length).assertEqual(0);
      let r: int = sub.indexOf(1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest057
     * @tc.desc Verify Buffer 0 indexOf byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Int32Array = new Int32Array(buf, 12, 4);
      arr.$_set(0, 5);
      arr.$_set(3, 5);
      let r: int = arr.indexOf(5);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest058
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let a: Int32Array = new Int32Array(buf, 0, 5);
      let b: Int32Array = new Int32Array(buf, 4, 4);
      a.$_set(2, 100);
      let r: int = b.indexOf(100);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest059
     * @tc.desc Verify fill subarray indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(6);
      let sub: Int32Array = arr.subarray(2, 5);
      sub.fill(33);
      let r: int = arr.indexOf(33);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest060
     * @tc.desc Verify indexOf() reverse Buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.reverse();
      let r: int = b.indexOf(1);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest061
     * @tc.desc Verify ArrayBuffer indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf1: ArrayBuffer = new ArrayBuffer(12);
      let buf2: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf1);
      let b: Int32Array = new Int32Array(buf2);
      a.$_set(0, 111);
      b.$_set(0, 222);
      expect(a.indexOf(222)).assertEqual(-1);
      expect(b.indexOf(111)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest062
     * @tc.desc Verify subarray( ) indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Int32Array = new Int32Array(5);
      let s1: Int32Array = root.subarray(1, 5);
      let s2: Int32Array = s1.subarray(1, 3);
      s2.$_set(0, 777);
      expect(root.indexOf(777)).assertEqual(2);
      expect(s1.indexOf(777)).assertEqual(1);
      expect(s2.indexOf(777)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest063
     * @tc.desc Verify indexOf fromIndex indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 3, 5, 3, 5);
      let first: int = arr.indexOf(5);
      let second: int = arr.indexOf(5, first + 1);
      expect(first).assertEqual(0);
      expect(second).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest064
     * @tc.desc Verify indexOf+fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 1, 2, 1, 2);
      let p0: int = arr.indexOf(1);
      let p1: int = arr.indexOf(1, p0 + 1);
      let p2: int = arr.indexOf(1, p1 + 1);
      let p3: int = arr.indexOf(1, p2 + 1);
      expect(p0).assertEqual(0);
      expect(p1).assertEqual(2);
      expect(p2).assertEqual(4);
      expect(p3).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest065
     * @tc.desc Verify indexOf $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let idx: int = arr.indexOf(20);
      expect(arr.$_get(idx + 1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest066
     * @tc.desc Verify indexOf -1 fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let missIdx: int = arr.indexOf(99);
      let r: int = arr.indexOf(3, missIdx);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest067
     * @tc.desc Verify subarray indexOf subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 7, 8, 9);
      let sub: Int32Array = arr.subarray(2);
      let r: int = sub.indexOf(8);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_6800
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest068
     * @tc.desc Verify indexOf fill+reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(1);
      arr.$_set(0, 5);
      arr.reverse();
      let r: int = arr.indexOf(5);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_6900
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest069
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let b: Int32Array = Int32Array.of(4, 2, 5);
      let ia: int = a.indexOf(2);
      let ib: int = b.indexOf(2);
      expect(ia).assertEqual(ib);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_7000
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest070
     * @tc.desc Verify indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20);
      let b: Int32Array = Int32Array.of(30, 40);
      expect(a.indexOf(30)).assertEqual(-1);
      expect(b.indexOf(10)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_7100
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest071
     * @tc.desc Verify indexOf set offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 1, 0, 0, 0);
      let pos: int = arr.indexOf(1);
      let src: Int32Array = Int32Array.of(9);
      arr.set(src, pos + 1);
      expect(arr.$_get(pos + 1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_7200
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest072
     * @tc.desc Verify indexOf() Number.NaN does not match a zero-filled array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let r: int = arr.indexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_7300
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest073
     * @tc.desc Verify indexOf() number Number.NaN fromIndex=2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let r: int = arr.indexOf(Number.NaN, 2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_7400
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest074
     * @tc.desc Verify indexOf() INT_MIN/INT_MAX/0/-1 number 2147483648.0 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -1, 2147483647, -2147483648);
      let r: int = arr.indexOf(-2147483648);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_7500
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest075
     * @tc.desc Verify fill $_set indexOf fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(7);
      arr.$_set(2, 8);
      expect(arr.indexOf(7)).assertEqual(0);
      expect(arr.indexOf(8)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_7600
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest076
     * @tc.desc Verify Buffer fill indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf, 8, 3);
      child.fill(66);
      let r: int = parent.indexOf(66);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_7700
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest077
     * @tc.desc Verify sort indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 1, 3, 1, 3);
      arr.sort();
      let r: int = arr.indexOf(3);
      expect(r).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_7800
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest078
     * @tc.desc Verify $_set indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(1, 10);
      arr.$_set(1, 20);
      arr.$_set(1, 30);
      expect(arr.indexOf(10)).assertEqual(-1);
      expect(arr.indexOf(30)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_7900
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest079
     * @tc.desc Verify set reverse indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let src: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.set(src);
      arr.reverse();
      expect(arr.indexOf(1)).assertEqual(3);
      expect(arr.indexOf(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_8000
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest080
     * @tc.desc Verify fill INT_MIN+INT_MAX indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, 0, 2147483647);
      expect(arr.indexOf(-2147483648)).assertEqual(0);
      expect(arr.indexOf(2147483647)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_8100
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest081
     * @tc.desc Verify fill(0) indexOf(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.fill(0);
      let r: int = arr.indexOf(0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_8200
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest082
     * @tc.desc Verify fill indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 4, 3);
      a.fill(111);
      b.fill(222);
      expect(a.indexOf(222)).assertEqual(1);
      expect(b.indexOf(111)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_8300
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest083
     * @tc.desc Verify sort indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 1, 2, 1, 2, 1);
      arr.sort();
      let count: number = 0;
      let idx: int = arr.indexOf(2);
      while (idx !== -1) {
        count = count + 1;
        idx = arr.indexOf(2, idx + 1);
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_OF_PART04_TEST_MINDMAP_8400
     * @tc.name int32ArrayIndexOfPart04TestMindmapTest084
     * @tc.desc Verify copyWithin indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexOfPart04TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 7, 0, 0);
      arr.copyWithin(0, 2, 3);
      expect(arr.indexOf(7)).assertEqual(0);
    });
  });
}
