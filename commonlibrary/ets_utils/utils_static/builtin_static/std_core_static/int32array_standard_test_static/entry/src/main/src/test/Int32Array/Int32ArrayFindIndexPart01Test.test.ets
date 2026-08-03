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
export default function int32ArrayFindIndexPart01TestMindmapTestTest(): void {
  describe('Int32ArrayFindIndexPart01TestMindmapTestTest', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_0100
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest001
         * @tc.desc Verify findIndex predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findIndex(undefined as Object as (value: number, index: int, array: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_0200
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest002
         * @tc.desc Verify 1 predicate int
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 20);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_0300
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest003
         * @tc.desc Verify predicate number
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([4, 5, 6]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v > 100);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_0400
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest004
         * @tc.desc Verify predicate Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 8);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_0500
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest005
         * @tc.desc Verify value index/array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let r: int = arr.findIndex((v: number): boolean => v === 30);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_0600
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest006
         * @tc.desc Verify value index array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let r: int = arr.findIndex((v: number, i: int): boolean => i === 1);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_0700
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest007
         * @tc.desc Verify 0 ()=>boolean true 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          let r: int = arr.findIndex((): boolean => true);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_0800
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest008
         * @tc.desc Verify value 0 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 1, 2, 3]);
          let r: int = arr.findIndex((v: number): boolean => v === 0);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_0900
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest009
         * @tc.desc Verify value 0 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 0, 4]);
          let r: int = arr.findIndex((v: number): boolean => v === 0);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_1000
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest010
         * @tc.desc Verify value 0 predicate length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 0]);
          let r: int = arr.findIndex((v: number): boolean => v === 0);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_1100
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest011
         * @tc.desc Verify value 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let r: int = arr.findIndex((v: number): boolean => v === 1);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_1200
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest012
         * @tc.desc Verify value -1 0xFFFFFFFF
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-3, -2, -1, 0, 1]);
          let r: int = arr.findIndex((v: number): boolean => v === -1);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_1300
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest013
         * @tc.desc Verify value 42
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 42, 99]);
          let r: int = arr.findIndex((v: number): boolean => v === 42);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_1400
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest014
         * @tc.desc Verify value -42
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-10, -42, -99]);
          let r: int = arr.findIndex((v: number): boolean => v === -42);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_1500
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest015
         * @tc.desc Verify value int32 2147483647
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647, 0, -1]);
          let r: int = arr.findIndex((v: number): boolean => v === 2147483647);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_1600
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest016
         * @tc.desc Verify value int32 2147483647
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 1, 2147483647]);
          let r: int = arr.findIndex((v: number): boolean => v === 2147483647);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_1700
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest017
         * @tc.desc Verify value int32 -2147483648
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, -2147483648, 1]);
          let r: int = arr.findIndex((v: number): boolean => v === -2147483648);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_1800
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest018
         * @tc.desc Verify value int32 -2147483648
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-2147483648, 0, 1]);
          let r: int = arr.findIndex((v: number): boolean => v === -2147483648);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_1900
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest019
         * @tc.desc Verify MAX MIN MAX MAX MIN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-2147483648, 2147483647]);
          let r: int = arr.findIndex((v: number): boolean => v === 2147483647);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_2000
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest020
         * @tc.desc Verify MAX MIN MIN MIN MAX
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-2147483648, 2147483647]);
          let r: int = arr.findIndex((v: number): boolean => v === -2147483648);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_2100
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest021
         * @tc.desc Verify 2147483648 MAX+1 -2147483648 predicate -2147483648
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483648]);
          let r: int = arr.findIndex((v: number): boolean => v === -2147483648);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_2200
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest022
         * @tc.desc Verify 2147483649 MAX+2 -2147483647 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483649]);
          let r: int = arr.findIndex((v: number): boolean => v === -2147483647);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_2300
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest023
         * @tc.desc Verify -2147483649 MIN-1 2147483647 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-2147483649]);
          let r: int = arr.findIndex((v: number): boolean => v === 2147483647);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_2400
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest024
         * @tc.desc Verify 4294967295 0xFFFFFFFF -1 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([4294967295]);
          let r: int = arr.findIndex((v: number): boolean => v === -1);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_2500
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest025
         * @tc.desc Verify 4294967296 2^32 0 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([4294967296]);
          let r: int = arr.findIndex((v: number): boolean => v === 0);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_2600
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest026
         * @tc.desc Verify -1 4294967295 -1 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([4294967295, -1, 0]);
          let r: int = arr.findIndex((v: number): boolean => v === -1);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_2700
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest027
         * @tc.desc Verify 3.5 ToInt32 3 predicate 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([3.5]);
          let r: int = arr.findIndex((v: number): boolean => v === 3);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_2800
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest028
         * @tc.desc Verify -3.5 ToInt32 -3 predicate -3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-3.5]);
          let r: int = arr.findIndex((v: number): boolean => v === -3);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_2900
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest029
         * @tc.desc Verify 3.999 3 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([3.999]);
          let r: int = arr.findIndex((v: number): boolean => v === 3);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_3000
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest030
         * @tc.desc Verify 3.5 predicate 3.5 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([3.5]);
          let r: int = arr.findIndex((v: number): boolean => v === 3.5);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_3100
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest031
         * @tc.desc Verify 2147483647.9 2147483647 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647.9]);
          let seen: number = 0;
          arr.findIndex((v: number): boolean => { seen = v; return false; });
          expect(seen).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_3200
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest032
         * @tc.desc Verify Number.NaN ToInt32 0 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([Double.NaN]);
          let r: int = arr.findIndex((v: number): boolean => v === 0);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_3300
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest033
         * @tc.desc Verify +Number.POSITIVE_INFINITY ToInt32 0 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([Double.POSITIVE_INFINITY]);
          let r: int = arr.findIndex((v: number): boolean => v === 0);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_3400
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest034
         * @tc.desc Verify Double.NEGATIVE_INFINITY ToInt32 0 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([Double.NEGATIVE_INFINITY]);
          let r: int = arr.findIndex((v: number): boolean => v === 0);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_3500
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest035
         * @tc.desc Verify Number.NaN 0 predicate v!==v Number.NaN -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([Double.NaN]);
          let r: int = arr.findIndex((v: number): boolean => v !== v);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_3600
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest036
         * @tc.desc Verify 0 Number.NaN 0 predicate 0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([Double.NaN, 0, 1]);
          let r: int = arr.findIndex((v: number): boolean => v === 0);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_3700
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest037
         * @tc.desc Verify 0xFF predicate 255
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0xFF]);
          let seen: number = 0;
          arr.findIndex((v: number): boolean => { seen = v; return false; });
          expect(seen).assertEqual(255);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_3800
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest038
         * @tc.desc Verify 0o77 predicate 63
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0o77]);
          let seen: number = 0;
          arr.findIndex((v: number): boolean => { seen = v; return false; });
          expect(seen).assertEqual(63);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_3900
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest039
         * @tc.desc Verify 0b1010 predicate 10
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0b1010]);
          let seen: number = 0;
          arr.findIndex((v: number): boolean => { seen = v; return false; });
          expect(seen).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_4000
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest040
         * @tc.desc Verify index 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let seenIdx: int = -1;
          arr.findIndex((v: number, i: int): boolean => { seenIdx = i; return true; });
          expect(seenIdx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_4100
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest041
         * @tc.desc Verify index length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let lastIdx: int = -1;
          arr.findIndex((v: number, i: int): boolean => { lastIdx = i; return v === 40; });
          expect(lastIdx).assertEqual(arr.length - 1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_4200
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest042
         * @tc.desc Verify index 0 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let indices: Array<int> = new Array<int>();
          arr.findIndex((v: number, i: int): boolean => { indices.push(i); return false; });
          expect(indices.length).assertEqual(4);
          expect(indices[0]).assertEqual(0);
          expect(indices[1]).assertEqual(1);
          expect(indices[2]).assertEqual(2);
          expect(indices[3]).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_4300
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest043
         * @tc.desc Verify index 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([42]);
          let seenIdx: int = -1;
          arr.findIndex((v: number, i: int): boolean => { seenIdx = i; return true; });
          expect(seenIdx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_4400
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest044
         * @tc.desc Verify findIndex on empty Int32Array returns -1 and callback is never invoked
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let called: boolean = false;
          let r: int = arr.findIndex((v: number, i: int): boolean => { called = true; return true; });
          expect(r).assertEqual(-1);
          expect(called).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_4500
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest045
         * @tc.desc Verify index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let maxSeenIdx: int = -1;
          let r: int = arr.findIndex((v: number, i: int): boolean => { maxSeenIdx = i; return v === 1; });
          expect(r).assertEqual(0);
          expect(maxSeenIdx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_4600
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest046
         * @tc.desc Verify index 0 length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let callCount: int = 0;
          let r: int = arr.findIndex((v: number, i: int): boolean => { callCount = callCount + 1; return false; });
          expect(r).assertEqual(-1);
          expect(callCount).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_4700
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest047
         * @tc.desc Verify length-1 true length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let cnt: int = 0;
          let r: int = arr.findIndex((v: number, i: int): boolean => { cnt++; return i === 4; });
          expect(r).assertEqual(4);
          expect(cnt).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_4800
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest048
         * @tc.desc Verify array Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let bpe: number = 0;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => { bpe = a.BYTES_PER_ELEMENT; return true; });
          expect(bpe).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_4900
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest049
         * @tc.desc Verify array ===
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let sameRef: boolean = false;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => { sameRef = (a === arr); return true; });
          expect(sameRef).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_5000
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest050
         * @tc.desc Verify array.length length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let capturedLen: int = -1;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => { capturedLen = a.length; return v === 30; });
          expect(capturedLen).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_5100
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest051
         * @tc.desc Verify array.BYTES_PER_ELEMENT 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          let bpe: number = 0;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => { bpe = a.BYTES_PER_ELEMENT; return true; });
          expect(bpe).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_5200
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest052
         * @tc.desc Verify array.$_get(i) value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 14, 21, 28]);
          let allConsistent: boolean = true;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          if (v !== a.$_get(i)) { allConsistent = false; }
          return false;
        });
          expect(allConsistent).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_5300
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest053
         * @tc.desc Verify array $_set
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => { a.$_set(2, 99); return true; });
          expect(arr.$_get(2)).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_5400
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest054
         * @tc.desc Verify subarray findIndex array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let child: Int32Array = parent.subarray(1, 4);
          let childLen: int = -1;
          let sameAsParent: boolean = true;
          child.findIndex((v: number, i: int, a: Int32Array): boolean => {
          childLen = a.length;
          sameAsParent = (a === parent);
          return true;
        });
          expect(childLen).assertEqual(3);
          expect(sameAsParent).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_5500
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest055
         * @tc.desc Verify of array.buffer buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30);
          let bufRef = arr.buffer;
          let sameBuf: boolean = false;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => { sameBuf = (a.buffer === bufRef); return true; });
          expect(sameBuf).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_5600
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest056
         * @tc.desc Verify true 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => true);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_5700
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest057
         * @tc.desc Verify false -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => false);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_5800
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest058
         * @tc.desc Verify 3 true 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          let cnt: int = 0;
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => { cnt++; return i === 2; });
          expect(r).assertEqual(2);
          expect(cnt).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_5900
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest059
         * @tc.desc Verify findIndex returns first index where value is divisible by 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2, 4, 6, 8, 10]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v % 4 === 0);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_6000
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest060
         * @tc.desc Verify v>
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 3, 5, 7, 9]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v > 6);
          expect(r).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_6100
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest061
         * @tc.desc Verify v<
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, -2, -3, -4]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v < -2);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_6200
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest062
         * @tc.desc Verify v%2===0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 3, 5, 6, 7]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v % 2 === 0);
          expect(r).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_6300
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest063
         * @tc.desc Verify predicate i===a.length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => i === a.length - 1);
          expect(r).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_6400
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest064
         * @tc.desc Verify predicate v!==target target
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 5, 6, 5]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v !== 5);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_6500
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest065
         * @tc.desc Verify predicate === -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 999);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_6600
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest066
         * @tc.desc Verify predicate i%2===0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => i % 2 === 0);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_6700
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest067
         * @tc.desc Verify predicate i%2===1 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => i % 2 === 1);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_6800
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest068
         * @tc.desc Verify predicate i>=length -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => i >= a.length);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_6900
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest069
         * @tc.desc Verify predicate i<0 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => i < 0);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_7000
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest070
         * @tc.desc Verify predicate Error findIndex
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findIndex((v: number, i: int, a: Int32Array): boolean => { throw new Error('predicate error'); });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_7100
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest071
         * @tc.desc Verify predicate Error
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let visitedFirst: boolean = false;
          try {
            arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
            if (i === 0) { visitedFirst = true; return false; }
            throw new Error('bang');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(visitedFirst).assertTrue();
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_7200
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest072
         * @tc.desc Verify predicate length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let lenBefore: int = arr.length;
          try {
            arr.findIndex((v: number, i: int, a: Int32Array): boolean => { throw new Error('oops'); });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(arr.length).assertEqual(lenBefore);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_7300
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest073
         * @tc.desc Verify predicate RangeError RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findIndex((v: number, i: int, a: Int32Array): boolean => { throw new RangeError('out of range'); });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_7400
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest074
         * @tc.desc Verify predicate TypeError TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          try {
            arr.findIndex((v: number, i: int, a: Int32Array): boolean => { throw new TypeError('type bad'); });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('TypeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_7500
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest075
         * @tc.desc Verify Int32Array.from predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.from([5, 10, 15]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 10);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_7600
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest076
         * @tc.desc Verify Int32Array.of predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(100, 200, 300);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 300);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_7700
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest077
         * @tc.desc Verify ArrayBuffer predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(12);
          let view: Int32Array = new Int32Array(buf);
          view.$_set(0, 11);
          view.$_set(1, 22);
          view.$_set(2, 33);
          let r: int = view.findIndex((v: number, i: int, a: Int32Array): boolean => v === 22);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_7800
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest078
         * @tc.desc Verify ArrayBuffer byteOffset=4 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let view: Int32Array = new Int32Array(buf, 4, 2);
          view.$_set(0, 77);
          view.$_set(1, 88);
          let firstIdx: int = -1;
          let r: int = view.findIndex((v: number, i: int, a: Int32Array): boolean => { firstIdx = i; return v === 88; });
          expect(firstIdx).assertEqual(1);
          expect(r).assertEqual(1);
          expect(view.length).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_7900
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest079
         * @tc.desc Verify Int32Array predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array([10, 20, 30]);
          let dst: Int32Array = new Int32Array(src);
          let r: int = dst.findIndex((v: number, i: int, a: Int32Array): boolean => v === 20);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_8000
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest080
         * @tc.desc Verify 0 predicate 0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 0);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_8100
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest081
         * @tc.desc Verify 0 predicate 0 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v !== 0);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_8200
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest082
         * @tc.desc Verify 7 predicate 7 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 7);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_8300
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest083
         * @tc.desc Verify 0 predicate 0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 0);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_8400
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest084
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-10, -20, -30, -40]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === -30);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_8500
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest085
         * @tc.desc Verify predicate v>0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-5, -3, 0, 3, 5]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v > 0);
          expect(r).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_8600
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest086
         * @tc.desc Verify predicate let
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let target: number = 25;
          let arr: Int32Array = new Int32Array([10, 20, 25, 30]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === target);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_8700
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest087
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let sum: number = 0;
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => { sum = sum + v; return v === 3; });
          expect(r).assertEqual(2);
          expect(sum).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_8800
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest088
         * @tc.desc Verify true -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let cnt: int = 0;
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => { cnt++; return true; });
          expect(r).assertEqual(-1);
          expect(cnt).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_8900
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest089
         * @tc.desc Verify 100 1 predicate 99
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(100);
          arr.$_set(99, 1);
          let cnt: int = 0;
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => { cnt++; return v === 1; });
          expect(r).assertEqual(99);
          expect(cnt).assertEqual(100);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_9000
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest090
         * @tc.desc Verify 100 1 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(100);
          arr.$_set(0, 1);
          let cnt: int = 0;
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => { cnt++; return v === 1; });
          expect(r).assertEqual(0);
          expect(cnt).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_9100
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest091
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([9, 7, 5, 3, 1]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v < 4);
          expect(r).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_9200
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest092
         * @tc.desc Verify -1 predicate -1 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === -1);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_9300
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest093
         * @tc.desc Verify -1 predicate 1 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1]);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 1);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_9400
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest094
         * @tc.desc Verify $_set predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(20);
          arr.$_set(13, 777);
          let r: int = arr.findIndex((v: number, i: int, a: Int32Array): boolean => v === 777);
          expect(r).assertEqual(13);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_INDEX_PART01_TEST_MINDMAP_9500
         * @tc.name int32ArrayFindIndexPart01TestMindmapTest095
         * @tc.desc Verify predicate array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindIndexPart01TestMindmapTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let neighbor: number = -999;
          arr.findIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === 1) { neighbor = a.$_get(2); }
          return false;
        });
          expect(neighbor).assertEqual(3);
        });
  });
}
