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
export default function int32ArrayFindLastIndexPart01TestMindmapTestTest(): void {
  describe('Int32ArrayFindLastIndexPart01TestMindmapTestTest', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_0100
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest001
         * @tc.desc Verify findLastIndex predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findLastIndex(undefined as Object as (value: number, index: int, array: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_0200
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest002
         * @tc.desc Verify 1 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let r: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => v === 20);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_0300
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest003
         * @tc.desc Verify predicate number
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([4, 5, 6]);
          let r: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => v > 100);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_0400
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest004
         * @tc.desc Verify predicate Int32Array this
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          new Int32Array([-1]);
          let r: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => v === 8);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_0500
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest005
         * @tc.desc Verify predicate null
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([13, 24, 35]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 24);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_0600
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest006
         * @tc.desc Verify value index/array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 30);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_0700
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest007
         * @tc.desc Verify value index array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let r: int = arr.findLastIndex((v: number, i: int): boolean => i === 1);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_0800
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest008
         * @tc.desc Verify 0 ():boolean true length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          let r: int = arr.findLastIndex((): boolean => true);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_0900
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest009
         * @tc.desc Verify 0 ():boolean false -1 length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          let count: int = 0;
          arr.findLastIndex((): boolean => { count++; return false; });
          expect(count).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_1000
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest010
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 15, 25, 35]);
          let pred = (v: number): boolean => v === 15;
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_1100
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest011
         * @tc.desc Verify array[i] index value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([100, 200, 300]);
          let pred: (value: number, index: int, array: Int32Array) => boolean = (v: number, i: int, a: Int32Array): boolean => a.$_get(i) === v && v === 200;
          let r: int = arr.findLastIndex(pred);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_1200
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest012
         * @tc.desc Verify number predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findLastIndex((42) as Object as (value: number, index: int, array: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_1300
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest013
         * @tc.desc Verify string predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findLastIndex(('notAFunction') as Object as (value: number, index: int, array: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_1400
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest014
         * @tc.desc Verify null predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findLastIndex(null as Object as (value: number, index: int, array: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_1500
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest015
         * @tc.desc Verify undefined predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findLastIndex(undefined as Object as (value: number, index: int, array: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_1600
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest016
         * @tc.desc Verify boolean true predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          try {
            arr.findLastIndex((true) as Object as (value: number, index: int, array: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_1700
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest017
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          let obj: Object = new Object();
          try {
            arr.findLastIndex(obj as Object as (value: number, index: int, array: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_1800
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest018
         * @tc.desc Verify value 0 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 0]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 0);
          expect(r).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_1900
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest019
         * @tc.desc Verify value 0 0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 1, 0, 1, 0]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 0);
          expect(r).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_2000
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest020
         * @tc.desc Verify value 0 predicate 0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 1, 2]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 0);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_2100
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest021
         * @tc.desc Verify value 1 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 2, 1]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 1);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_2200
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest022
         * @tc.desc Verify value 1 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 1);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_2300
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest023
         * @tc.desc Verify value -1 0xFFFFFFFF -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, 0, -1, 2]);
          let r: int = arr.findLastIndex((v: number): boolean => v === -1);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_2400
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest024
         * @tc.desc Verify value -1 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, 0, 1, 2]);
          let r: int = arr.findLastIndex((v: number): boolean => v === -1);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_2500
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest025
         * @tc.desc Verify value 42 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 42, 99, 7]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 42);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_2600
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest026
         * @tc.desc Verify value 42 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 42, 99]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 42);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_2700
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest027
         * @tc.desc Verify value -42 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-10, -42, -99, -42]);
          let r: int = arr.findLastIndex((v: number): boolean => v === -42);
          expect(r).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_2800
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest028
         * @tc.desc Verify +0 v===0 v===-0 SameValueZero
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0]);
          let eqZero: boolean = false;
          let eqNegZero: boolean = false;
          arr.findLastIndex((v: number): boolean => {
          eqZero = v === 0;
          eqNegZero = v === -0;
          return true;
        });
          expect(eqZero).assertTrue();
          expect(eqNegZero).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_2900
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest029
         * @tc.desc Verify value number typeof "number"
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7]);
          let ty: string = '';
          arr.findLastIndex((v: number): boolean => {
          ty = typeof v;
          return true;
        });
          expect(ty).assertEqual('number');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_3000
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest030
         * @tc.desc Verify value INT32_MAX=2147483647 0x7FFFFFFF predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, -1, 2147483647]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 2147483647);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_3100
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest031
         * @tc.desc Verify value INT32_MAX=2147483647
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647, 0, -1, -2147483648]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 2147483647);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_3200
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest032
         * @tc.desc Verify value INT32_MIN=-2147483648 0x80000000 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 0, -1, -2147483648]);
          let r: int = arr.findLastIndex((v: number): boolean => v === -2147483648);
          expect(r).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_3300
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest033
         * @tc.desc Verify value INT32_MIN=-2147483648
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-2147483648, 0, 1]);
          let r: int = arr.findLastIndex((v: number): boolean => v === -2147483648);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_3400
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest034
         * @tc.desc Verify MAX MIN predicate MAX 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647, -2147483648]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 2147483647);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_3500
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest035
         * @tc.desc Verify MAX MIN predicate MIN 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647, -2147483648]);
          let r: int = arr.findLastIndex((v: number): boolean => v === -2147483648);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_3600
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest036
         * @tc.desc Verify 2147483648 ToInt32 -2147483648 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(4);
          let u32: Uint32Array = new Uint32Array(buf);
          u32.$_set(0, 2147483648);
          let arr: Int32Array = new Int32Array(buf);
          let r: int = arr.findLastIndex((v: number): boolean => v === -2147483648);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_3700
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest037
         * @tc.desc Verify 4294967295 0xFFFFFFFF ToInt32 -1 predicate -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(4);
          let u32: Uint32Array = new Uint32Array(buf);
          u32.$_set(0, 4294967295);
          let arr: Int32Array = new Int32Array(buf);
          let r: int = arr.findLastIndex((v: number): boolean => v === -1);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_3800
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest038
         * @tc.desc Verify 4294967296 2^32 0x100000000 ToInt32 0 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([4294967296]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 0);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_3900
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest039
         * @tc.desc Verify 0x7FFFFFFF INT32_MAX
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0x7FFFFFFF]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 2147483647);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_4000
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest040
         * @tc.desc Verify 0o777 =511 511
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0o777]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 511);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_4100
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest041
         * @tc.desc Verify 0b1010 =10 10
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0b1010]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 10);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_4200
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest042
         * @tc.desc Verify Float64Array Number.POSITIVE_INFINITY buffer Int32Array 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(8);
          let f64: Float64Array = new Float64Array(buf);
          let i32: Int32Array = new Int32Array(buf);
          f64.$_set(0, Number.POSITIVE_INFINITY);
          let valFirst: number = i32.$_get(0);
          let valSecond: number = i32.$_get(1);
          let sawZero: boolean = (valFirst === 0 || valSecond === 0);
          expect(sawZero).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_4300
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest043
         * @tc.desc Verify Int32Array 0 predicate Number.isNaN false Number.NaN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0]);
          let r: int = arr.findLastIndex((v: number): boolean => isNaN(v));
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_4400
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest044
         * @tc.desc Verify Number.isNaN false -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let r: int = arr.findLastIndex((v: number): boolean => isNaN(v));
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_4500
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest045
         * @tc.desc Verify 3.5 ArrayBuffer Float64 Int32Array / 0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(8);
          let f64: Float64Array = new Float64Array(buf);
          f64.$_set(0, 3.5);
          let i32: Int32Array = new Int32Array(buf);
          let valFirst: number = i32.$_get(0);
          let isInt: boolean = valFirst % 1 === 0;
          expect(isInt).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_4600
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest046
         * @tc.desc Verify 7 7
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 7, 7]);
          let allSeven: boolean = true;
          arr.findLastIndex((v: number): boolean => {
          if (v !== 7) { allSeven = false; }
          return false;
        });
          expect(allSeven).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_4700
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest047
         * @tc.desc Verify -1 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, -1, -1]);
          let allNeg: boolean = true;
          arr.findLastIndex((v: number): boolean => {
          if (v !== -1) { allNeg = false; }
          return false;
        });
          expect(allNeg).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_4800
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest048
         * @tc.desc Verify index number typeof "number"
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let ty: string = '';
          arr.findLastIndex((v: number, i: int): boolean => {
          ty = typeof i;
          return true;
        });
          expect(ty).assertEqual('int');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_4900
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest049
         * @tc.desc Verify index=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([42]);
          let seen: int = -1;
          arr.findLastIndex((v: number, i: int): boolean => {
          seen = i;
          return false;
        });
          expect(seen).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_5000
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest050
         * @tc.desc Verify index=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let sawZero: boolean = false;
          arr.findLastIndex((v: number, i: int): boolean => {
          if (i === 0) { sawZero = true; }
          return false;
        });
          expect(sawZero).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_5100
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest051
         * @tc.desc Verify index=1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let sawOne: boolean = false;
          arr.findLastIndex((v: number, i: int): boolean => {
          if (i === 1) { sawOne = true; }
          return false;
        });
          expect(sawOne).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_5200
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest052
         * @tc.desc Verify index=2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let sawTwo: boolean = false;
          arr.findLastIndex((v: number, i: int): boolean => {
          if (i === 2) { sawTwo = true; }
          return false;
        });
          expect(sawTwo).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_5300
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest053
         * @tc.desc Verify index length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let firstIdx: int = -99;
          let called: boolean = false;
          arr.findLastIndex((v: number, i: int): boolean => {
          if (!called) {
          firstIdx = i;
          called = true;
          }
          return false;
        });
          expect(firstIdx).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_5400
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest054
         * @tc.desc Verify 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let count: int = 0;
          let r: int = arr.findLastIndex((v: number, i: int): boolean => {
          count++;
          return v === 3;
        });
          expect(r).assertEqual(2);
          expect(count).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_5500
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest055
         * @tc.desc Verify 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let count: int = 0;
          arr.findLastIndex((v: number, i: int): boolean => {
          count++;
          return v === 4;
        });
          expect(count).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_5600
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest056
         * @tc.desc Verify length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let count: int = 0;
          let r: int = arr.findLastIndex((v: number, i: int): boolean => {
          count++;
          return v === 10;
        });
          expect(r).assertEqual(0);
          expect(count).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_5700
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest057
         * @tc.desc Verify index value i=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([100, 200, 300]);
          let paired: boolean = true;
          arr.findLastIndex((v: number, i: int): boolean => {
          if (i === 0 && v !== 100) { paired = false; }
          return false;
        });
          expect(paired).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_5800
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest058
         * @tc.desc Verify index value i=length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([100, 200, 300]);
          let paired: boolean = true;
          arr.findLastIndex((v: number, i: int): boolean => {
          if (i === 2 && v !== 300) { paired = false; }
          return false;
        });
          expect(paired).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_5900
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest059
         * @tc.desc Verify index -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let allNonNeg: boolean = true;
          arr.findLastIndex((v: number, i: int): boolean => {
          if (i < 0) { allNonNeg = false; }
          return false;
        });
          expect(allNonNeg).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_6000
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest060
         * @tc.desc Verify index length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let allInRange: boolean = true;
          arr.findLastIndex((v: number, i: int): boolean => {
          if (i >= arr.length) { allInRange = false; }
          return false;
        });
          expect(allInRange).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_6100
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest061
         * @tc.desc Verify i
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let lastI: int = -1;
          arr.findLastIndex((v: number, i: int): boolean => {
          lastI = i;
          i = 999;
          return false;
        });
          expect(lastI).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_6200
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest062
         * @tc.desc Verify array findLastIndex Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let sameRef: boolean = false;
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          sameRef = (a === arr);
          return true;
        });
          expect(sameRef).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_6300
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest063
         * @tc.desc Verify array Int32Array instanceof
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2]);
          let sameRef: boolean = false;
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          sameRef = (a === arr);
          return true;
        });
          expect(sameRef).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_6400
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest064
         * @tc.desc Verify array.length length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let len: int = 0;
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          len = a.length;
          return true;
        });
          expect(len).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_6500
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest065
         * @tc.desc Verify array $_get value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 15, 25]);
          let mismatch: boolean = false;
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (a.$_get(i) !== v) {
          mismatch = true;
          }
          return false;
        });
          expect(mismatch).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_6600
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest066
         * @tc.desc Verify array buffer buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let sameBuf: boolean = false;
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          sameBuf = (a.buffer === arr.buffer);
          return true;
        });
          expect(sameBuf).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_6700
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest067
         * @tc.desc Verify array.BYTES_PER_ELEMENT 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          let bpe: int = 0;
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          bpe = a.BYTES_PER_ELEMENT;
          return true;
        });
          expect(bpe).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_6800
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest068
         * @tc.desc Verify array.byteOffset 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let bo: int = -1;
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          bo = a.byteOffset;
          return true;
        });
          expect(bo).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_6900
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest069
         * @tc.desc Verify array.byteLength length*4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let bl: int = 0;
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          bl = a.byteLength;
          return true;
        });
          expect(bl).assertEqual(16);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_7000
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest070
         * @tc.desc Verify byteOffset=4 findLastIndex array.byteOffset 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let arr: Int32Array = new Int32Array(buf, 4, 2);
          let bo: int = -1;
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          bo = a.byteOffset;
          return true;
        });
          expect(bo).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_7100
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest071
         * @tc.desc Verify array.length 1 value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([42]);
          let capturedLen: int = 0;
          let capturedVal: number = 0;
          let r: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          capturedLen = a.length;
          capturedVal = v;
          return true;
        });
          expect(r).assertEqual(0);
          expect(capturedLen).assertEqual(1);
          expect(capturedVal).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_7200
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest072
         * @tc.desc Verify array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let called: boolean = false;
          let r: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          called = true;
          return true;
        });
          expect(called).assertFalse();
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_7300
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest073
         * @tc.desc Verify array $_set
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let observed: number = 0;
          arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          if (i === a.length - 1) {
          a.$_set(0, 99);
          }
          if (i === 0) {
          observed = v;
          }
          return false;
        });
          expect(observed).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_7400
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest074
         * @tc.desc Verify predicate true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let r: int = arr.findLastIndex((v: number, i: int, a: Int32Array): boolean => {
          return true;
        });
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_7500
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest075
         * @tc.desc Verify predicate false -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let r: int = arr.findLastIndex((v: number): boolean => false);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_7600
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest076
         * @tc.desc Verify predicate (v>5)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([3, 6, 8, 2, 9]);
          let r: int = arr.findLastIndex((v: number): boolean => v > 5);
          expect(r).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_7700
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest077
         * @tc.desc Verify predicate (v<0)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, 2, -3, 4, -5]);
          let r: int = arr.findLastIndex((v: number): boolean => v < 0);
          expect(r).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_7800
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest078
         * @tc.desc Verify predicate (v%2===0)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let r: int = arr.findLastIndex((v: number): boolean => v % 2 === 0);
          expect(r).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_7900
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest079
         * @tc.desc Verify predicate (v & 1)===1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 1, 2, 3, 4, 5, 6, 7]);
          let r: int = arr.findLastIndex((v: number): boolean => (v & 1) === 1);
          expect(r).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_8000
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest080
         * @tc.desc Verify predicate (v>=10 && v<=20)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 15, 12, 25, 18]);
          let r: int = arr.findLastIndex((v: number): boolean => v >= 10 && v <= 20);
          expect(r).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_8100
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest081
         * @tc.desc Verify predicate flag=true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let flag: boolean = true;
          let r: int = arr.findLastIndex((v: number): boolean => flag);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_8200
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest082
         * @tc.desc Verify [1,2,3,4,5] 5 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 5);
          expect(r).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_8300
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest083
         * @tc.desc Verify [5,4,3,2,1] 1 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 4, 3, 2, 1]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 1);
          expect(r).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_8400
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest084
         * @tc.desc Verify [5,5] 5 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 5]);
          let r: int = arr.findLastIndex((v: number): boolean => v === 5);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_8500
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest085
         * @tc.desc Verify [-99] -99 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-99]);
          let r: int = arr.findLastIndex((v: number): boolean => v === -99);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_INDEX_PART01_TEST_MINDMAP_8600
         * @tc.name int32ArrayFindLastIndexPart01TestMindmapTest086
         * @tc.desc Verify predicate v*v>100 10
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastIndexPart01TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, -20, 8, 15, -3]);
          let r: int = arr.findLastIndex((v: number): boolean => v * v > 100);
          expect(r).assertEqual(3);
        });
  });
}
