'use static'


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
export default function int32ArrayFindLastIndexPart02TestMindmapTestTest(): void {
  describe('Int32ArrayFindLastIndexPart02TestMindmapTestTest', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_0100
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest001
         * @tc.desc Verify findLastIndex returns index 1 when element matches
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 2);
          expect(result).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_0200
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest002
         * @tc.desc Verify findLastIndex returns -1 when no element matches
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 99);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_0300
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest003
         * @tc.desc Verify -1 number
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let result: int = arr.findLastIndex((v: number): boolean => true);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_0400
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest004
         * @tc.desc Verify 1 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 20);
          expect(result).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_0500
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest005
         * @tc.desc Verify undefined
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 7);
          expect(result).assertEqual(2);
          expect(isNaN(result)).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_0600
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest006
         * @tc.desc Verify int 2 ===
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 30);
          expect(result).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_0700
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest007
         * @tc.desc Verify 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([42]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 42);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_0800
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest008
         * @tc.desc Verify -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([42]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 99);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_0900
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest009
         * @tc.desc Verify length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 5);
          expect(result).assertEqual(arr.length - 1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_1000
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest010
         * @tc.desc Verify 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 10);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_1100
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest011
         * @tc.desc Verify findLastIndex returns correct index (2) when matching element in middle of array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 30);
          expect(result).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_1200
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest012
         * @tc.desc Verify predicate length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
          let result: int = arr.findLastIndex((v: number): boolean => true);
          expect(result).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_1300
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest013
         * @tc.desc Verify findLastIndex returns last occurrence index when multiple matching elements exist
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 9, 5, 9, 5]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 5);
          expect(result).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_1400
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest014
         * @tc.desc Verify 9 9
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([9, 1, 9, 2, 9]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 9);
          expect(result).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_1500
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest015
         * @tc.desc Verify 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([3, 1, 4, 1, 5]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 3);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_1600
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest016
         * @tc.desc Verify index length-2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
          let result: int = arr.findLastIndex((v: number, i: int): boolean => i === arr.length - 2);
          expect(result).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_1700
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest017
         * @tc.desc Verify 0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 1, 0, 2]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 0);
          expect(result).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_1800
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest018
         * @tc.desc Verify -1 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, 5, -1, 8]);
          let result: int = arr.findLastIndex((v: number): boolean => v === -1);
          expect(result).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_1900
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest019
         * @tc.desc Verify INT_MAX 2147483647
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2147483647, 3]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 2147483647);
          expect(result).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_2000
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest020
         * @tc.desc Verify INT_MIN -2147483648
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-2147483648, 0, 1]);
          let result: int = arr.findLastIndex((v: number): boolean => v === -2147483648);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_2100
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest021
         * @tc.desc Verify INT_MAX
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647, 1, 2147483647]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 2147483647);
          expect(result).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_2200
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest022
         * @tc.desc Verify INT_MIN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-2147483648, 5, -2147483648]);
          let result: int = arr.findLastIndex((v: number): boolean => v === -2147483648);
          expect(result).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_2300
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest023
         * @tc.desc Verify -100
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-100, -200, -100, -300]);
          let result: int = arr.findLastIndex((v: number): boolean => v === -100);
          expect(result).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_2400
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest024
         * @tc.desc Verify length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([77, 1, 2, 77]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 77);
          expect(result).assertEqual(3);
          expect(result).assertEqual(arr.length - 1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_2500
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest025
         * @tc.desc Verify predicate false -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let result: int = arr.findLastIndex((v: number): boolean => false);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_2600
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest026
         * @tc.desc Verify predicate v===999 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 999);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_2700
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest027
         * @tc.desc Verify Number.NaN Int32Array Number.NaN ToInt32 0 Number.isNaN false -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 1, 2]);
          let result: int = arr.findLastIndex((v: number): boolean => isNaN(v));
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_2800
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest028
         * @tc.desc Verify 0 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 0);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_2900
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest029
         * @tc.desc Verify INT_MAX+1 INT_MIN INT_MIN -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let target: number = 2147483648.0;
          let result: int = arr.findLastIndex((v: number): boolean => v === target);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_3000
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest030
         * @tc.desc Verify length=0 predicate -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array();
          let result: int = arr.findLastIndex((v: number): boolean => true);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_3100
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest031
         * @tc.desc Verify findLastIndex length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let before: int = arr.length;
          arr.findLastIndex((v: number): boolean => v === 3);
          expect(arr.length).assertEqual(before);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_3200
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest032
         * @tc.desc Verify findLastIndex byteLength 4*length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let before: int = arr.byteLength;
          arr.findLastIndex((v: number): boolean => v === 2);
          expect(arr.byteLength).assertEqual(before);
          expect(arr.byteLength).assertEqual(12);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_3300
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest033
         * @tc.desc Verify findLastIndex byteOffset
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let arr: Int32Array = new Int32Array(buf, 4, 2);
          let before: int = arr.byteOffset;
          arr.findLastIndex((v: number): boolean => true);
          expect(arr.byteOffset).assertEqual(before);
          expect(arr.byteOffset).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_3400
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest034
         * @tc.desc Verify findLastIndex BYTES_PER_ELEMENT 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.findLastIndex((v: number): boolean => v === 2);
          expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_3500
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest035
         * @tc.desc Verify findLastIndex length 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          arr.findLastIndex((v: number): boolean => true);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_3600
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest036
         * @tc.desc Verify findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.findLastIndex((v: number): boolean => v === 30);
          expect(arr[0]).assertEqual(10);
          expect(arr[1]).assertEqual(20);
          expect(arr[2]).assertEqual(30);
          expect(arr[3]).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_3700
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest037
         * @tc.desc Verify findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-5, 0, 5]);
          arr.findLastIndex((v: number, i: int): boolean => i === 2);
          expect(arr[0]).assertEqual(-5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_3800
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest038
         * @tc.desc Verify findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-5, 0, 5]);
          arr.findLastIndex((v: number, i: int): boolean => i === 0);
          expect(arr[2]).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_3900
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest039
         * @tc.desc Verify findLastIndex INT_MAX
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2147483647, 3]);
          arr.findLastIndex((v: number): boolean => v === 1);
          expect(arr[1]).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_4000
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest040
         * @tc.desc Verify findLastIndex INT_MIN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-2147483648, 0, 1]);
          arr.findLastIndex((v: number): boolean => v === 1);
          expect(arr[0]).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_4100
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest041
         * @tc.desc Verify findLastIndex with no matching element does not modify the array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          arr.findLastIndex((v: number): boolean => v === 999);
          expect(arr[0]).assertEqual(7);
          expect(arr[1]).assertEqual(8);
          expect(arr[2]).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_4200
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest042
         * @tc.desc Verify $_get API
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([100, 200, 300]);
          arr.findLastIndex((v: number): boolean => v === 200);
          expect(arr.$_get(0)).assertEqual(100);
          expect(arr.$_get(1)).assertEqual(200);
          expect(arr.$_get(2)).assertEqual(300);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_4300
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest043
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([11, 22, 33]);
          arr.findLastIndex((v: number): boolean => true);
          expect(arr[0]).assertEqual(11);
          expect(arr[1]).assertEqual(22);
          expect(arr[2]).assertEqual(33);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_4400
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest044
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([44, 55, 66]);
          arr.findLastIndex((v: number): boolean => false);
          expect(arr[0]).assertEqual(44);
          expect(arr[1]).assertEqual(55);
          expect(arr[2]).assertEqual(66);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_4500
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest045
         * @tc.desc Verify findLastIndex buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(12);
          let arr: Int32Array = new Int32Array(buf);
          let before: ArrayBuffer = arr.buffer;
          arr.findLastIndex((v: number): boolean => true);
          expect(arr.buffer).assertEqual(before);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_4600
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest046
         * @tc.desc Verify findLastIndex ArrayBuffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf, 0, 3);
          let b: Int32Array = new Int32Array(buf, 0, 3);
          a.$_set(0, 10);
          a.$_set(1, 20);
          a.$_set(2, 30);
          a.findLastIndex((v: number): boolean => v === 20);
          expect(b[0]).assertEqual(10);
          expect(b[1]).assertEqual(20);
          expect(b[2]).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_4700
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest047
         * @tc.desc Verify findLastIndex ArrayBuffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(20);
          let a: Int32Array = new Int32Array(buf, 0, 3);
          let c: Int32Array = new Int32Array(buf, 8, 3);
          a.$_set(0, 1);
          a.$_set(1, 2);
          a.$_set(2, 3);
          c.$_set(0, 4);
          c.$_set(1, 5);
          c.$_set(2, 6);
          a.findLastIndex((v: number): boolean => v === 2);
          expect(c[0]).assertEqual(4);
          expect(c[1]).assertEqual(5);
          expect(c[2]).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_4800
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest048
         * @tc.desc Verify findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 1, 2, 3, 4, 5]);
          let sub: Int32Array = arr.subarray(2, 5);
          sub.findLastIndex((v: number): boolean => v === 4);
          expect(arr[0]).assertEqual(0);
          expect(arr[1]).assertEqual(1);
          expect(arr[2]).assertEqual(2);
          expect(arr[3]).assertEqual(3);
          expect(arr[4]).assertEqual(4);
          expect(arr[5]).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_4900
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest049
         * @tc.desc Verify findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          let sub: Int32Array = arr.subarray(1, 4);
          let result: int = sub.findLastIndex((v: number): boolean => v === 30);
          expect(result).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_5000
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest050
         * @tc.desc Verify findLastIndex length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let sub: Int32Array = arr.subarray(1, 4);
          let beforeLen: int = sub.length;
          sub.findLastIndex((v: number): boolean => v === 3);
          expect(sub.length).assertEqual(beforeLen);
          expect(sub.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_5100
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest051
         * @tc.desc Verify findLastIndex byteOffset
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let sub: Int32Array = arr.subarray(2, 5);
          let beforeOff: int = sub.byteOffset;
          sub.findLastIndex((v: number): boolean => true);
          expect(sub.byteOffset).assertEqual(beforeOff);
          expect(sub.byteOffset).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_5200
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest052
         * @tc.desc Verify 0 findLastIndex -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let sub: Int32Array = arr.subarray(2, 2);
          let result: int = sub.findLastIndex((v: number): boolean => true);
          expect(result).assertEqual(-1);
          expect(sub.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_5300
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest053
         * @tc.desc Verify byteOffset findLastIndex byteOffset
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let arr: Int32Array = new Int32Array(buf, 12, 2);
          arr.$_set(0, 100);
          arr.$_set(1, 200);
          arr.findLastIndex((v: number): boolean => v === 100);
          expect(arr.byteOffset).assertEqual(12);
          expect(arr.length).assertEqual(2);
          expect(arr[0]).assertEqual(100);
          expect(arr[1]).assertEqual(200);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_5400
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest054
         * @tc.desc Verify array === findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let captured: Int32Array | undefined = undefined;
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          captured = a;
          return v === 2;
        });
          expect(captured).assertEqual(arr);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_5500
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest055
         * @tc.desc Verify array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let sub: Int32Array = arr.subarray(1, 3);
          let captured: Int32Array | undefined = undefined;
          sub.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          captured = a;
          return v === 20;
        });
          expect(captured).assertEqual(sub);
          expect(captured).not().assertEqual(arr);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_5600
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest056
         * @tc.desc Verify array length length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let seen: int = -1;
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          seen = a.length;
          return true;
        });
          expect(seen).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_5700
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest057
         * @tc.desc Verify index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let idxs: int[] = [];
          arr.findLastIndex((v: number, i: int): boolean => {
          idxs.push(i);
          return false;
        });
          expect(idxs.length).assertEqual(4);
          expect(idxs[0]).assertEqual(3);
          expect(idxs[1]).assertEqual(2);
          expect(idxs[2]).assertEqual(1);
          expect(idxs[3]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_5800
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest058
         * @tc.desc Verify findLastIndex short-circuits after finding first match from the end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let callCount: int = 0;
          let result: int = arr.findLastIndex((v: number, i: int): boolean => {
          callCount = callCount + 1;
          return v === 40;
        });
          expect(result).assertEqual(3);
          expect(callCount).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_5900
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest059
         * @tc.desc Verify length - hitIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          let callCount: int = 0;
          let result: int = arr.findLastIndex((v: number, i: int): boolean => {
          callCount = callCount + 1;
          return v === 30;
        });
          expect(result).assertEqual(2);
          expect(callCount).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_6000
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest060
         * @tc.desc Verify 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([99]);
          let callCount: int = 0;
          let result: int = arr.findLastIndex((v: number, i: int): boolean => {
          callCount = callCount + 1;
          return true;
        });
          expect(result).assertEqual(0);
          expect(callCount).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_6100
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest061
         * @tc.desc Verify 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let callCount: int = 0;
          let result: int = arr.findLastIndex((v: number, i: int): boolean => {
          callCount = callCount + 1;
          return true;
        });
          expect(result).assertEqual(-1);
          expect(callCount).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_6200
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest062
         * @tc.desc Verify length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let callCount: int = 0;
          let result: int = arr.findLastIndex((v: number, i: int): boolean => {
          callCount = callCount + 1;
          return false;
        });
          expect(result).assertEqual(-1);
          expect(callCount).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_6300
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest063
         * @tc.desc Verify i=length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let firstIdx: int = -999;
          arr.findLastIndex((v: number, i: int): boolean => {
          if (firstIdx === -999) {
          firstIdx = i;
          }
          return false;
        });
          expect(firstIdx).assertEqual(2);
          expect(firstIdx).assertEqual(arr.length - 1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_6400
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest064
         * @tc.desc Verify i
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 15, 25, 35, 45]);
          let lastIdx: int = -1;
          let result: int = arr.findLastIndex((v: number, i: int): boolean => {
          lastIdx = i;
          return v === 15;
        });
          expect(result).assertEqual(1);
          expect(lastIdx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_6500
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest065
         * @tc.desc Verify value array[index] a[i]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([100, 200, 300, 400]);
          let mismatch: boolean = false;
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (a[i] !== v) {
          mismatch = true;
          }
          return false;
        });
          expect(mismatch).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_6600
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest066
         * @tc.desc Verify index [0, length-1]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let outOfRange: boolean = false;
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i < 0 || i >= a.length) {
          outOfRange = true;
          }
          return false;
        });
          expect(outOfRange).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_6700
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest067
         * @tc.desc Verify 0 i 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          let sawZero: boolean = false;
          arr.findLastIndex((v: number, i: int): boolean => {
          if (i === 0) {
          sawZero = true;
          }
          return false;
        });
          expect(sawZero).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_6800
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest068
         * @tc.desc Verify callCount
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let acc: int = 0;
          let result: int = arr.findLastIndex((v: number, i: int): boolean => {
          acc = acc + 1;
          return v === 2;
        });
          expect(result).assertEqual(1);
          expect(acc).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_6900
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest069
         * @tc.desc Verify value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 10, 15]);
          let seen: number[] = [];
          arr.findLastIndex((v: number, i: int): boolean => {
          seen.push(v);
          return false;
        });
          expect(seen.length).assertEqual(3);
          expect(seen[0]).assertEqual(15);
          expect(seen[1]).assertEqual(10);
          expect(seen[2]).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_7000
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest070
         * @tc.desc Verify array findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let result: int = arr.findLastIndex((v: number, _i: int, _a: Int32Array): boolean => {
          return v === 30;
        });
          expect(result).assertEqual(2);
          expect(arr[0]).assertEqual(10);
          expect(arr[1]).assertEqual(20);
          expect(arr[2]).assertEqual(30);
          expect(arr[3]).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_7100
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest071
         * @tc.desc Verify findLastIndex returns last occurrence when duplicate values exist
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2, 1, 2, 3, 2]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 2);
          expect(result).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_7200
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest072
         * @tc.desc Verify findLastIndex predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 2, 1]);
          let r1: int = arr.findLastIndex((v: number): boolean => v === 2);
          let r2: int = arr.findLastIndex((v: number): boolean => v === 2);
          expect(r1).assertEqual(r2);
          expect(r1).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_7300
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest073
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let r1: int = arr.findLastIndex((v: number): boolean => v === 30);
          let r2: int = arr.findLastIndex((v: number): boolean => v === 10);
          expect(r1).assertEqual(2);
          expect(r2).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_7400
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest074
         * @tc.desc Verify Error null
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findLastIndex((v: number): boolean => {
            throw new Error('predicate error');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_7500
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest075
         * @tc.desc Verify findLastIndex propagates exception thrown in predicate and does not modify array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findLastIndex((v: number): boolean => {
            throw new Error('boom');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_7600
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest076
         * @tc.desc Verify findLastIndex stops iterating when predicate throws mid-traversal and reports invocation count
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          let callCount: int = 0;
          try {
            arr.findLastIndex((v: number, i: int): boolean => {
            callCount = callCount + 1;
            if (i === 2) {
            throw new Error('midway');
            }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(callCount).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_7700
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest077
         * @tc.desc Verify RangeError name RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findLastIndex((v: number): boolean => {
            throw new RangeError('range');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_7800
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest078
         * @tc.desc Verify TypeError name TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findLastIndex((v: number): boolean => {
            throw new TypeError('type');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('TypeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_7900
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest079
         * @tc.desc Verify v>0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 1, 2, 3]);
          let result: int = arr.findLastIndex((v: number): boolean => v > 0);
          expect(result).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_8000
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest080
         * @tc.desc Verify ArrayBuffer 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let arr: Int32Array = new Int32Array(buf);
          let result: int = arr.findLastIndex((v: number): boolean => v === 0);
          expect(result).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_8100
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest081
         * @tc.desc Verify ArrayBuffer byteOffset=4,length=2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let full: Int32Array = new Int32Array(buf);
          full.$_set(0, 1);
          full.$_set(1, 2);
          full.$_set(2, 3);
          full.$_set(3, 4);
          let part: Int32Array = new Int32Array(buf, 4, 2);
          let result: int = part.findLastIndex((v: number): boolean => v === 3);
          expect(result).assertEqual(1);
          expect(part.length).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_8200
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest082
         * @tc.desc Verify of findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(7, 8, 9, 10);
          let result: int = arr.findLastIndex((v: number): boolean => v === 9);
          expect(result).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_8300
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest083
         * @tc.desc Verify from findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.from([5, 15, 25, 35]);
          let result: int = arr.findLastIndex((v: number): boolean => v === 15);
          expect(result).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_8400
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest084
         * @tc.desc Verify of findLastIndex 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(42);
          let result: int = arr.findLastIndex((v: number): boolean => v === 42);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_8500
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest085
         * @tc.desc Verify of Int32Array findLastIndex -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of();
          let result: int = arr.findLastIndex((v: number): boolean => true);
          expect(result).assertEqual(-1);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_8600
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest086
         * @tc.desc Verify from mapfn findLastIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.from([1, 2, 3] as number[], (v: number): number => v * 10);
          let result: int = arr.findLastIndex((v: number): boolean => v === 20);
          expect(result).assertEqual(1);
          expect(arr[0]).assertEqual(10);
          expect(arr[1]).assertEqual(20);
          expect(arr[2]).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_8700
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest087
         * @tc.desc Verify 32 31 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let data: int[] = [];
          for (let i: int = 0; i < 32; i++) {
          data.push(i);
          }
          let arr: Int32Array = new Int32Array(data);
          let callCount: int = 0;
          let result: int = arr.findLastIndex((v: number, idx: int): boolean => {
          callCount = callCount + 1;
          return v === 31;
        });
          expect(result).assertEqual(31);
          expect(callCount).assertEqual(1);
          expect(arr.length).assertEqual(32);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART02_TEST_MINDMAP_8800
         * @tc.name int32ArrayFindLastIndexPart02TestMindmapTest088
         * @tc.desc Verify 16 0 length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart02TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let data: int[] = [];
          for (let i: int = 0; i < 16; i++) {
          data.push(i + 1);
          }
          let arr: Int32Array = new Int32Array(data);
          let callCount: int = 0;
          let result: int = arr.findLastIndex((v: number): boolean => {
          callCount = callCount + 1;
          return v === 1;
        });
          expect(result).assertEqual(0);
          expect(callCount).assertEqual(16);
        });
  });
}
