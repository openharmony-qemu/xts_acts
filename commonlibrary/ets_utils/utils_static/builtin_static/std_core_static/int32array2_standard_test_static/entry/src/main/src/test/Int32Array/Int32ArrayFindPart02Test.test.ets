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

export default function int32ArrayFindPart02Test(): void {
  describe('Int32ArrayFindPart02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayFindPart02TestMindmapTest001
     * @tc.desc Verify find returns first element matching value 20 in positive-number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 20);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayFindPart02TestMindmapTest002
     * @tc.desc Verify find returns element matching negative value -10 in negative-number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([-5, -10, -20]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === -10);
      expect(result).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayFindPart02TestMindmapTest003
     * @tc.desc Verify find returns zero element when matching value 0 in mixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 0, 2]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayFindPart02TestMindmapTest004
     * @tc.desc Verify find returns INT32_MAX value when it is the matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([2147483647, 0]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 2147483647);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayFindPart02TestMindmapTest005
     * @tc.desc Verify find returns INT32_MIN value when it is the matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest005',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === -2147483648);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayFindPart02TestMindmapTest006
     * @tc.desc Verify find() no match returns undefined assertUndefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest006',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 99);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayFindPart02TestMindmapTest007
     * @tc.desc Verify find returns first element when matching the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest007',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayFindPart02TestMindmapTest008
     * @tc.desc Verify find with always-true predicate returns first element in single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest008',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([42]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => true);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayFindPart02TestMindmapTest009
     * @tc.desc Verify find returns undefined when no element matches in single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest009',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([55]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 77);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayFindPart02TestMindmapTest010
     * @tc.desc Verify find returns first element when predicate matches by index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest010',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => i === 0);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayFindPart02TestMindmapTest011
     * @tc.desc Verify find returns last element when predicate matches by last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest011',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => i === arr.length - 1);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayFindPart02TestMindmapTest012
     * @tc.desc Verify find returns first occurrence when multiple matching elements exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest012',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 2, 1]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayFindPart02TestMindmapTest013
     * @tc.desc Verify find returns first negative element using less-than-zero predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest013',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, -5, 3]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v < 0);
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayFindPart02TestMindmapTest014
     * @tc.desc Verify find matches element by strict equality to external variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest014',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let target: number = 42 as number;
      let arr: Int32Array = new Int32Array([1, target, 99]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === target);
      expect(result).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayFindPart02TestMindmapTest015
     * @tc.desc Verify find() predicate value>threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest015',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 3, 5, 7, 9]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v > 4);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayFindPart02TestMindmapTest016
     * @tc.desc Verify find() predicate value%2===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest016',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 3, 4, 6, 8]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v % 2 === 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayFindPart02TestMindmapTest017
     * @tc.desc Verify Number.NaN ToInt32 0 find(===0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest017',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, Number.NaN);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayFindPart02TestMindmapTest018
     * @tc.desc Verify +Number.POSITIVE_INFINITY ToInt32 0 find(===0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest018',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayFindPart02TestMindmapTest019
     * @tc.desc Verify -Number.POSITIVE_INFINITY ToInt32 0 find(===0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest019',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, -Number.POSITIVE_INFINITY);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayFindPart02TestMindmapTest020
     * @tc.desc Verify 2147483648 ToInt32 -2147483648 find(===-2147483648) -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest020',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 2147483648);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === -2147483648);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayFindPart02TestMindmapTest021
     * @tc.desc Verify 2147483649 ToInt32 -2147483647 find -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest021',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 2147483649);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === -2147483647);
      expect(result).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayFindPart02TestMindmapTest022
     * @tc.desc Verify -2147483649 ToInt32 2147483647 find 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest022',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, -2147483649);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 2147483647);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayFindPart02TestMindmapTest023
     * @tc.desc Verify 4294967295 (0xFFFFFFFF) ToInt32 -1 find(===-1) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest023',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 4294967295);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayFindPart02TestMindmapTest024
     * @tc.desc Verify 4294967296 (2^32) ToInt32 0 find(===0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest024',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 4294967296);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayFindPart02TestMindmapTest025
     * @tc.desc Verify 3.7 ToInt32 3 find(===3) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest025',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 3.7);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayFindPart02TestMindmapTest026
     * @tc.desc Verify -3.7 ToInt32 -3 find(===-3) -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest026',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, -3.7);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === -3);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayFindPart02TestMindmapTest027
     * @tc.desc Verify find does not modify array length on successful match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest027',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let before: number = arr.length;
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 3);
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayFindPart02TestMindmapTest028
     * @tc.desc Verify find does not modify array length when no element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest028',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let before: number = arr.length;
      let result: number | undefined = arr.find((v: number, i: int, a: Int32Array): boolean => v === 999);
      expect(result).assertEqual(undefined);
      expect(arr.length).assertEqual(before);
      {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 999);
        expect(result).assertEqual(undefined);
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(1)).assertEqual(2);
        expect(arr.$_get(2)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayFindPart02TestMindmapTest029
     * @tc.desc Verify find on zero-length array returns undefined and length stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest029',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array(0);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => true);
      expect(result).assertEqual(undefined);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayFindPart02TestMindmapTest030
     * @tc.desc Verify find on single-element array does not change length after match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest030',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([42]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 42);
      expect(result).assertEqual(42);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayFindPart02TestMindmapTest031
     * @tc.desc Verify find does not modify byteLength or byteOffset on successful match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest031',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let beforeByteLength: number = arr.byteLength;
      let beforeByteOffset: number = arr.byteOffset;
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 2);
      expect(result).assertEqual(2);
      expect(arr.byteLength).assertEqual(beforeByteLength);
      expect(arr.byteOffset).assertEqual(beforeByteOffset);
      {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        let bufBefore: ArrayBuffer = arr.buffer;
        let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 2);
        expect(result).assertEqual(2);
        expect(arr.buffer).assertEqual(bufBefore);
      }
      {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        let bufBL: number = arr.buffer.byteLength;
        arr.find((v: number, i: int, a: Int32Array): boolean => v === 2);
        expect(arr.buffer.byteLength).assertEqual(bufBL);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayFindPart02TestMindmapTest032
     * @tc.desc Verify find does not modify byteOffset of array with non-zero initial offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest032',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let before: number = arr.byteOffset;
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => false);
      expect(result).assertEqual(undefined);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayFindPart02TestMindmapTest033
     * @tc.desc Verify BYTES_PER_ELEMENT remains 4 after find on Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest033',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 1);
      expect(result).assertEqual(1);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayFindPart02TestMindmapTest034
     * @tc.desc Verify find stops iteration after first match and invokes callback only once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest034',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
      let callCount: number = 0 as number;
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => {
        callCount = callCount + 1;
        return v === 7;
      });
      expect(result).assertEqual(7);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayFindPart02TestMindmapTest035
     * @tc.desc Verify find returns first positive element in mixed-sign array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest035',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([-100, 100]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v > 0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayFindPart02TestMindmapTest036
     * @tc.desc Verify find does not modify array elements on successful match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest036',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 30);
      expect(result).assertEqual(30);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayFindPart02TestMindmapTest037
     * @tc.desc Verify find does not modify array elements when callback reads array via third argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest037',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return false;
      });
      expect(result).assertEqual(undefined);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayFindPart02TestMindmapTest038
     * @tc.desc Verify find returns zero element from boundary-value array without modifying elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest038',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648, 0, -1]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 0);
      expect(result).assertEqual(0);
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(-2147483648);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayFindPart02TestMindmapTest039
     * @tc.desc Verify find returns first element in homogeneous array without modifying values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest039',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([2, 2, 2]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 2);
      expect(result).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayFindPart02TestMindmapTest040
     * @tc.desc Verify find on parent array does not modify subarray elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest040',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sub: Int32Array = arr.subarray(1, 3);
      arr.find((v: number, i: int, a: Int32Array): boolean => v === 4);
      expect(sub.$_get(0)).assertEqual(2);
      expect(sub.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayFindPart02TestMindmapTest041
     * @tc.desc Verify find does not modify elements of another view sharing the same ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest041',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a1: Int32Array = new Int32Array(buf);
      a1.$_set(0, 11);
      a1.$_set(1, 22);
      a1.$_set(2, 33);
      let a2: Int32Array = new Int32Array(buf);
      a1.find((v: number, i: int, a: Int32Array): boolean => v === 22);
      expect(a2.$_get(0)).assertEqual(11);
      expect(a2.$_get(1)).assertEqual(22);
      expect(a2.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayFindPart02TestMindmapTest042
     * @tc.desc Verify find on original array does not modify elements of sliced copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest042',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let cp: Int32Array = arr.slice();
      cp.find((v: number, i: int, a: Int32Array): boolean => v === 8);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(9);
      expect(cp.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayFindPart02TestMindmapTest043
     * @tc.desc Verify find returns correct element from view with non-zero byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest043',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let outer: Int32Array = new Int32Array(buf);
      outer.$_set(0, 100);
      outer.$_set(1, 200);
      outer.$_set(2, 300);
      outer.$_set(3, 400);
      let view: Int32Array = new Int32Array(buf, 4, 2);
      let result = view.find((v: number, i: int, a: Int32Array): boolean => v === 300);
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayFindPart02TestMindmapTest044
     * @tc.desc Verify find on view with byteOffset returns undefined when element is outside view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest044',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let outer: Int32Array = new Int32Array(buf);
      outer.$_set(0, 1);
      outer.$_set(1, 2);
      outer.$_set(2, 3);
      outer.$_set(3, 4);
      let view: Int32Array = new Int32Array(buf, 8, 2);
      let result = view.find((v: number, i: int, a: Int32Array): boolean => v === 2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayFindPart02TestMindmapTest045
     * @tc.desc Verify find on view with byteOffset does not modify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest045',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 8, 3);
      let beforeBL: number = view.byteLength;
      view.find((v: number, i: int, a: Int32Array): boolean => false);
      expect(view.byteLength).assertEqual(beforeBL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayFindPart02TestMindmapTest046
     * @tc.desc Verify find on parent array does not modify subarray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest046',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let sub: Int32Array = arr.subarray(2, 4);
      let subLen: number = sub.length;
      arr.find((v: number, i: int, a: Int32Array): boolean => v === 5);
      expect(sub.length).assertEqual(subLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayFindPart02TestMindmapTest047
     * @tc.desc Verify find works on Int32Array created with from() and length is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest047',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = Int32Array.from([10, 20, 30]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 20);
      expect(result).assertEqual(20);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayFindPart02TestMindmapTest048
     * @tc.desc Verify find works on Int32Array created with of() and elements are unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest048',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = Int32Array.of(5, 15, 25);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => v === 25);
      expect(result).assertEqual(25);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(15);
      expect(arr.$_get(2)).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayFindPart02TestMindmapTest049
     * @tc.desc Verify find callback receives array argument with correct length property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest049',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let ok: boolean = true;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (a.length !== 4) {
          ok = false;
        }
        return false;
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayFindPart02TestMindmapTest050
     * @tc.desc Verify find callback element value matches value retrieved via a.$_get at same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest050',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([5, 15, 25, 35]);
      let allMatch: boolean = true;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (a.$_get(i) !== v) {
          allMatch = false;
        }
        return false;
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayFindPart02TestMindmapTest051
     * @tc.desc Verify find callback receives the correct view instance when called on array with byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest051',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let outer: Int32Array = new Int32Array(buf);
      let view: Int32Array = new Int32Array(buf, 4, 2);
      let sameAsView: boolean = false;
      let sameAsOuter: boolean = false;
      view.find((v: number, i: int, a: Int32Array): boolean => {
        sameAsView = (a === view);
        sameAsOuter = (a === outer);
        return true;
      });
      expect(sameAsView).assertTrue();
      expect(sameAsOuter).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayFindPart02TestMindmapTest052
     * @tc.desc Verify find() true callCount=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest052',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300]);
      let callCount: number = 0 as number;
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(result).assertEqual(100);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayFindPart02TestMindmapTest053
     * @tc.desc Verify find() false callCount length undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest053',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let callCount: number = 0 as number;
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => {
        callCount = callCount + 1;
        return false;
      });
      expect(result).assertUndefined();
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayFindPart02TestMindmapTest054
     * @tc.desc Verify find invokes callback exactly up to and including the matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest054',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let callCount: number = 0 as number;
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => {
        callCount = callCount + 1;
        return v === 30;
      });
      expect(result).assertEqual(30);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayFindPart02TestMindmapTest055
     * @tc.desc Verify find invokes callback for all elements when match is at last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest055',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let callCount: number = 0 as number;
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => {
        callCount = callCount + 1;
        return v === 3;
      });
      expect(result).assertEqual(3);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayFindPart02TestMindmapTest056
     * @tc.desc Verify find does not invoke callback on empty array and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest056',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array(0);
      let callCount: number = 0 as number;
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => {
        callCount = callCount + 1;
        return true;
      });
      expect(result).assertUndefined();
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayFindPart02TestMindmapTest057
     * @tc.desc Verify find callback receives index 0 for single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest057',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([7]);
      let seenIndex: number = -1;
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => {
        seenIndex = i;
        return true;
      });
      expect(result).assertEqual(7);
      expect(seenIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayFindPart02TestMindmapTest058
     * @tc.desc Verify find callback receives correct index 1 when matching second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest058',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let seenIndex: number = -1;
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (v === 20) {
          seenIndex = i;
          return true;
        }
        return false;
      });
      expect(result).assertEqual(20);
      expect(seenIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayFindPart02TestMindmapTest059
     * @tc.desc Verify find returns first element at even index using modulo on index argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart02TestMindmapTest059',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => i % 2 === 0);
      expect(result).assertEqual(11);
    });

  });
}
