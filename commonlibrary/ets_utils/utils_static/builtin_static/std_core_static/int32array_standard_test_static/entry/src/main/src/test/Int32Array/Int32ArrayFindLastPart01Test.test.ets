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
export default function int32ArrayFindLastPart01Test(): void {
  describe('Int32ArrayFindLastPart01Test', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_0100
         * @tc.name int32ArrayFindLastPart01TestMindmapTest001
         * @tc.desc Verify 1 predicate value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          let result: number = arr.findLast((v: number): boolean => v > 25);
          expect(result).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_0200
         * @tc.name int32ArrayFindLastPart01TestMindmapTest002
         * @tc.desc Verify 1 predicate value index index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let result: number = arr.findLast((v: number, i: int): boolean => i === 1);
          expect(result).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_0300
         * @tc.name int32ArrayFindLastPart01TestMindmapTest003
         * @tc.desc Verify 1 predicate value/index/array array.length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          let result: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => i === a.length - 1);
          expect(result).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_0400
         * @tc.name int32ArrayFindLastPart01TestMindmapTest004
         * @tc.desc Verify 0 findLast predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findLast(undefined as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
            expect('should not reach').assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_0500
         * @tc.name int32ArrayFindLastPart01TestMindmapTest005
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let result: number = arr.findLast((v: number): boolean => v < 4);
          expect(result).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_0600
         * @tc.name int32ArrayFindLastPart01TestMindmapTest006
         * @tc.desc Verify undefined predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          let result: number = arr.findLast((v: number): boolean => v > 7);
          expect(result).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_0700
         * @tc.name int32ArrayFindLastPart01TestMindmapTest007
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([42]);
          let result: number = arr.findLast((v: number): boolean => v === 42);
          expect(result).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_0800
         * @tc.name int32ArrayFindLastPart01TestMindmapTest008
         * @tc.desc Verify value 0 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 0, 3]);
          let result: number = arr.findLast((v: number): boolean => v === 0);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_0900
         * @tc.name int32ArrayFindLastPart01TestMindmapTest009
         * @tc.desc Verify value -0 0 ToInt32 0 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 1, 2, 0]);
          let result: number = arr.findLast((v: number): boolean => v === 0);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_1000
         * @tc.name int32ArrayFindLastPart01TestMindmapTest010
         * @tc.desc Verify value 1 predicate 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 2, 3, 1]);
          let result: number = arr.findLast((v: number): boolean => v === 1);
          expect(result).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_1100
         * @tc.name int32ArrayFindLastPart01TestMindmapTest011
         * @tc.desc Verify value -1 -1 predicate -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-3, -1, 0, -1]);
          let result: number = arr.findLast((v: number): boolean => v === -1);
          expect(result).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_1200
         * @tc.name int32ArrayFindLastPart01TestMindmapTest012
         * @tc.desc Verify value int32 2147483647 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, -1, 2147483647, 5]);
          let result: number = arr.findLast((v: number): boolean => v === 2147483647);
          expect(result).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_1300
         * @tc.name int32ArrayFindLastPart01TestMindmapTest013
         * @tc.desc Verify value int32 -2147483648 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-2147483648, 0, 1, -2147483648]);
          let result: number = arr.findLast((v: number): boolean => v === -2147483648);
          expect(result).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_1400
         * @tc.name int32ArrayFindLastPart01TestMindmapTest014
         * @tc.desc Verify -42 predicate -42
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-42, 10, 99, -42]);
          let result: number = arr.findLast((v: number): boolean => v === -42);
          expect(result).assertEqual(-42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_1500
         * @tc.name int32ArrayFindLastPart01TestMindmapTest015
         * @tc.desc Verify 42 predicate 42
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, 42, 0, 42]);
          let result: number = arr.findLast((v: number): boolean => v === 42);
          expect(result).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_1600
         * @tc.name int32ArrayFindLastPart01TestMindmapTest016
         * @tc.desc Verify predicate v>0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-5, 4, -3, 9, -8]);
          let result: number = arr.findLast((v: number): boolean => v > 0);
          expect(result).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_1700
         * @tc.name int32ArrayFindLastPart01TestMindmapTest017
         * @tc.desc Verify predicate v<0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, -4, 3, -9, 8]);
          let result: number = arr.findLast((v: number): boolean => v < 0);
          expect(result).assertEqual(-9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_1800
         * @tc.name int32ArrayFindLastPart01TestMindmapTest018
         * @tc.desc Verify predicate v%2===0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 4, 3, 6, 5]);
          let result: number = arr.findLast((v: number): boolean => v % 2 === 0);
          expect(result).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_1900
         * @tc.name int32ArrayFindLastPart01TestMindmapTest019
         * @tc.desc Verify predicate v%2!==0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2, 3, 6, 5, 8]);
          let result: number = arr.findLast((v: number): boolean => v % 2 !== 0);
          expect(result).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_2000
         * @tc.name int32ArrayFindLastPart01TestMindmapTest020
         * @tc.desc Verify value 0xFF 255 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 0xFF, 2, 0xFF]);
          let result: number = arr.findLast((v: number): boolean => v === 0xFF);
          expect(result).assertEqual(255);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_2100
         * @tc.name int32ArrayFindLastPart01TestMindmapTest021
         * @tc.desc Verify value 0o77 63 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0o77, 1, 2, 0o77]);
          let result: number = arr.findLast((v: number): boolean => v === 63);
          expect(result).assertEqual(63);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_2200
         * @tc.name int32ArrayFindLastPart01TestMindmapTest022
         * @tc.desc Verify value 0b1010 10 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0b1010, 1, 2, 0b1010]);
          let result: number = arr.findLast((v: number): boolean => v === 10);
          expect(result).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_2300
         * @tc.name int32ArrayFindLastPart01TestMindmapTest023
         * @tc.desc Verify findLast returns matching value (7) when all elements are identical and match predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
          let result: number = arr.findLast((v: number): boolean => v === 7);
          expect(result).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_2400
         * @tc.name int32ArrayFindLastPart01TestMindmapTest024
         * @tc.desc Verify predicate true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let result: number = arr.findLast((v: number): boolean => true);
          expect(result).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_2500
         * @tc.name int32ArrayFindLastPart01TestMindmapTest025
         * @tc.desc Verify findLast returns the last element (8) satisfying v > 4 from the end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7, 8]);
          let result: number = arr.findLast((v: number): boolean => v > 4);
          expect(result).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_2600
         * @tc.name int32ArrayFindLastPart01TestMindmapTest026
         * @tc.desc Verify value 2147483648 ToInt32 -2147483648 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, -2147483648, 2]);
          let result: number = arr.findLast((v: number): boolean => v === -2147483648);
          expect(result).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_2700
         * @tc.name int32ArrayFindLastPart01TestMindmapTest027
         * @tc.desc Verify value -2147483649 ToInt32 2147483647 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647, 3]);
          let result: number = arr.findLast((v: number): boolean => v === 2147483647);
          expect(result).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_2800
         * @tc.name int32ArrayFindLastPart01TestMindmapTest028
         * @tc.desc Verify value 3.5 ToInt32 3 predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 3, 5]);
          let result: number = arr.findLast((v: number): boolean => v === 3);
          expect(result).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_2900
         * @tc.name int32ArrayFindLastPart01TestMindmapTest029
         * @tc.desc Verify Number.NaN ToInt32 0 predicate 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 0, 2, 0]);
          let result: number = arr.findLast((v: number): boolean => v === 0);
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_3000
         * @tc.name int32ArrayFindLastPart01TestMindmapTest030
         * @tc.desc Verify index predicate index length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let lastIdx: int = -1;
          let result: number = arr.findLast((v: number, i: int): boolean => {
          lastIdx = i;
          return v === 40;
        });
          expect(result).assertEqual(40);
          expect(lastIdx).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_3100
         * @tc.name int32ArrayFindLastPart01TestMindmapTest031
         * @tc.desc Verify index length-1 index length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let firstCallIdx: int = -1;
          let called: boolean = false;
          try {
            arr.findLast((v: number, i: int): boolean => {
            if (!called) {
            firstCallIdx = i;
            called = true;
            }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(firstCallIdx).assertEqual(3);
          expect(called).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_3200
         * @tc.name int32ArrayFindLastPart01TestMindmapTest032
         * @tc.desc Verify index index length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          let hitIdx: int = -1;
          arr.findLast((v: number, i: int): boolean => {
          if (v === 30) {
          hitIdx = i;
          return true;
          }
          return false;
        });
          expect(hitIdx).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_3300
         * @tc.name int32ArrayFindLastPart01TestMindmapTest033
         * @tc.desc Verify 0 index 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([99, 2, 3, 4]);
          let hitIdx: int = -1;
          arr.findLast((v: number, i: int): boolean => {
          if (v === 99) {
          hitIdx = i;
          return true;
          }
          return false;
        });
          expect(hitIdx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_3400
         * @tc.name int32ArrayFindLastPart01TestMindmapTest034
         * @tc.desc Verify length-1 index length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 77]);
          let hitIdx: int = -1;
          arr.findLast((v: number, i: int): boolean => {
          if (v === 77) {
          hitIdx = i;
          return true;
          }
          return false;
        });
          expect(hitIdx).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_3500
         * @tc.name int32ArrayFindLastPart01TestMindmapTest035
         * @tc.desc Verify index 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5]);
          let seenIdx: int = -1;
          arr.findLast((v: number, i: int): boolean => {
          seenIdx = i;
          return v === 5;
        });
          expect(seenIdx).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_3600
         * @tc.name int32ArrayFindLastPart01TestMindmapTest036
         * @tc.desc Verify index length-1,length-2,...,0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let idxs: Array<number> = new Array<number>();
          try {
            arr.findLast((v: number, i: int): boolean => {
            idxs.push(i);
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(idxs.length).assertEqual(3);
          expect(idxs[0]).assertEqual(2);
          expect(idxs[1]).assertEqual(1);
          expect(idxs[2]).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_3700
         * @tc.name int32ArrayFindLastPart01TestMindmapTest037
         * @tc.desc Verify findLast predicate receives correct indices
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let hitIdx: int = -1;
          arr.findLast((v: number, i: int): boolean => {
          hitIdx = i;
          return v === 2;
        });
          expect(hitIdx + 1).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_3800
         * @tc.name int32ArrayFindLastPart01TestMindmapTest038
         * @tc.desc Verify findLast short-circuits and reports correct invocation count when match is found during reverse traversal
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let count: int = 0;
          arr.findLast((v: number, i: int): boolean => {
          count = count + 1;
          return v === 4;
        });
          expect(count).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_3900
         * @tc.name int32ArrayFindLastPart01TestMindmapTest039
         * @tc.desc Verify index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          let result: number = arr.findLast((v: number, i: int): boolean => i % 2 !== 0);
          expect(result).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_4000
         * @tc.name int32ArrayFindLastPart01TestMindmapTest040
         * @tc.desc Verify index i>1 index 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          let result: number = arr.findLast((v: number, i: int): boolean => i > 1);
          expect(result).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_4100
         * @tc.name int32ArrayFindLastPart01TestMindmapTest041
         * @tc.desc Verify array findLast Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let sameRef: boolean = false;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          sameRef = a === arr;
          return true;
        });
          expect(sameRef).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_4200
         * @tc.name int32ArrayFindLastPart01TestMindmapTest042
         * @tc.desc Verify array array.length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let seenLen: int = -1;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          seenLen = a.length;
          return true;
        });
          expect(seenLen).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_4300
         * @tc.name int32ArrayFindLastPart01TestMindmapTest043
         * @tc.desc Verify array a[0]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let firstVal: number = 0;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          firstVal = a[0];
          return true;
        });
          expect(firstVal).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_4400
         * @tc.name int32ArrayFindLastPart01TestMindmapTest044
         * @tc.desc Verify array a[a.length-1] v
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 99]);
          let lastVal: number = 0;
          let firstV: number = 0;
          let first: boolean = true;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          if (first) {
          lastVal = a[a.length - 1];
          firstV = v;
          first = false;
          }
          return true;
        });
          expect(lastVal).assertEqual(firstV);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_4500
         * @tc.name int32ArrayFindLastPart01TestMindmapTest045
         * @tc.desc Verify array length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1]);
          let seenLen: int = -1;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          seenLen = a.length;
          return true;
        });
          expect(seenLen).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_4600
         * @tc.name int32ArrayFindLastPart01TestMindmapTest046
         * @tc.desc Verify array arr arr
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          let midVal: number = 0;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          midVal = a[1];
          return true;
        });
          expect(midVal).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_4700
         * @tc.name int32ArrayFindLastPart01TestMindmapTest047
         * @tc.desc Verify array buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let result: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          if (i === 3) {
          a[0] = 99;
          }
          return v === 99;
        });
          expect(result).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_4800
         * @tc.name int32ArrayFindLastPart01TestMindmapTest048
         * @tc.desc Verify array i value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let consistent: boolean = true;
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (a[i] !== v) {
            consistent = false;
            }
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(consistent).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_4900
         * @tc.name int32ArrayFindLastPart01TestMindmapTest049
         * @tc.desc Verify array length 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([55]);
          let len: int = 0;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          len = a.length;
          return true;
        });
          expect(len).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_5000
         * @tc.name int32ArrayFindLastPart01TestMindmapTest050
         * @tc.desc Verify array BYTES_PER_ELEMENT 4 Int32Array 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let bpe: int = 0;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          bpe = a.BYTES_PER_ELEMENT;
          return true;
        });
          expect(bpe).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_5100
         * @tc.name int32ArrayFindLastPart01TestMindmapTest051
         * @tc.desc Verify predicate true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let result: number = arr.findLast((v: number): boolean => {
          return true;
        });
          expect(result).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_5200
         * @tc.name int32ArrayFindLastPart01TestMindmapTest052
         * @tc.desc Verify predicate false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let result: number = arr.findLast((v: number): boolean => {
          return v === 1;
        });
          expect(result).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_5300
         * @tc.name int32ArrayFindLastPart01TestMindmapTest053
         * @tc.desc Verify predicate v===value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7, 8]);
          let target: number = 7;
          let result: number = arr.findLast((v: number): boolean => v === target);
          expect(result).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_5400
         * @tc.name int32ArrayFindLastPart01TestMindmapTest054
         * @tc.desc Verify predicate &&
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, 4, -9, 16]);
          let result: number = arr.findLast((v: number): boolean => v > 0 && v % 2 === 0);
          expect(result).assertEqual(16);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_5500
         * @tc.name int32ArrayFindLastPart01TestMindmapTest055
         * @tc.desc Verify predicate ||
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2, -4, 6, -8]);
          let result: number = arr.findLast((v: number): boolean => v < 0 || v > 5);
          expect(result).assertEqual(-8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_5600
         * @tc.name int32ArrayFindLastPart01TestMindmapTest056
         * @tc.desc Verify predicate !
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 0]);
          let result: number = arr.findLast((v: number): boolean => !(v !== 0));
          expect(result).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_5700
         * @tc.name int32ArrayFindLastPart01TestMindmapTest057
         * @tc.desc Verify predicate false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let callCount: int = 0;
          try {
            arr.findLast((v: number): boolean => {
            callCount = callCount + 1;
            return false;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(callCount).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_5800
         * @tc.name int32ArrayFindLastPart01TestMindmapTest058
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let sum: number = 0;
          let result: number = arr.findLast((v: number): boolean => {
          sum = sum + v;
          return sum >= 12;
        });
          expect(result).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_5900
         * @tc.name int32ArrayFindLastPart01TestMindmapTest059
         * @tc.desc Verify predicate >=
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let result: number = arr.findLast((v: number): boolean => v >= 4);
          expect(result).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_6000
         * @tc.name int32ArrayFindLastPart01TestMindmapTest060
         * @tc.desc Verify predicate <=
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 4, 3, 2, 1]);
          let result: number = arr.findLast((v: number): boolean => v <= 2);
          expect(result).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_6100
         * @tc.name int32ArrayFindLastPart01TestMindmapTest061
         * @tc.desc Verify predicate null
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findLast(null as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_6200
         * @tc.name int32ArrayFindLastPart01TestMindmapTest062
         * @tc.desc Verify predicate undefined
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findLast(undefined as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_6300
         * @tc.name int32ArrayFindLastPart01TestMindmapTest063
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findLast(42 as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_6400
         * @tc.name int32ArrayFindLastPart01TestMindmapTest064
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findLast(new Object() as Object as (v: number, i: int, a: Int32Array) => boolean);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_6500
         * @tc.name int32ArrayFindLastPart01TestMindmapTest065
         * @tc.desc Verify predicate Error
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findLast((v: number): boolean => {
            throw new Error('predicate boom');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('predicate boom');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_6600
         * @tc.name int32ArrayFindLastPart01TestMindmapTest066
         * @tc.desc Verify predicate
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let callCount: int = 0;
          try {
            arr.findLast((v: number): boolean => {
            callCount = callCount + 1;
            throw new Error('first element throw');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('first element throw');
            expect(callCount).assertEqual(1);
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_6700
         * @tc.name int32ArrayFindLastPart01TestMindmapTest067
         * @tc.desc Verify predicate RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findLast((v: number): boolean => {
            throw new RangeError('range');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART01_TEST_MINDMAP_6800
         * @tc.name int32ArrayFindLastPart01TestMindmapTest068
         * @tc.desc Verify predicate TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          try {
            arr.findLast((v: number): boolean => {
            throw new TypeError('type');
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('TypeError');
          }
        });
  });
}
