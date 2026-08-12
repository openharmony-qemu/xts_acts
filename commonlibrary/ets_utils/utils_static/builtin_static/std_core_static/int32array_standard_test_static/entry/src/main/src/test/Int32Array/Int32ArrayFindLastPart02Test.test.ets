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
export default function int32ArrayFindLastPart02TestMindmapTestTest(): void {
  describe('Int32ArrayFindLastPart02TestMindmapTestTest', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_0100
         * @tc.name int32ArrayFindLastPart02TestMindmapTest001
         * @tc.desc Verify findLast returns 30 when element matches from end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v > 15);
          expect(r).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_0200
         * @tc.name int32ArrayFindLastPart02TestMindmapTest002
         * @tc.desc Verify findLast returns 0 when matching element is 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 0, 2);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 0);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_0300
         * @tc.name int32ArrayFindLastPart02TestMindmapTest003
         * @tc.desc Verify findLast returns INT_MIN when matching
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-2147483648, 1, 2);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === -2147483648);
          expect(r).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_0400
         * @tc.name int32ArrayFindLastPart02TestMindmapTest004
         * @tc.desc Verify findLast returns INT_MAX when matching
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 2147483647);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 2147483647);
          expect(r).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_0500
         * @tc.name int32ArrayFindLastPart02TestMindmapTest005
         * @tc.desc Verify findLast returns -1 when matching
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-1, 5, 6);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === -1);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_0600
         * @tc.name int32ArrayFindLastPart02TestMindmapTest006
         * @tc.desc Verify findLast returns 42 for single-element array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(42);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 42);
          expect(r).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_0700
         * @tc.name int32ArrayFindLastPart02TestMindmapTest007
         * @tc.desc Verify findLast returns 30 on subarray view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = Int32Array.of(10, 20, 30, 40);
          let view: Int32Array = base.subarray(1, 3);
          let r: number = view.findLast((v: number, i: int, a: Int32Array): boolean => v > 15);
          expect(r).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_0800
         * @tc.name int32ArrayFindLastPart02TestMindmapTest008
         * @tc.desc Verify :number number undefined
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => v > 100);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_0900
         * @tc.name int32ArrayFindLastPart02TestMindmapTest009
         * @tc.desc Verify boolean
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(5, 6, 7);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 7);
          expect(r).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_1000
         * @tc.name int32ArrayFindLastPart02TestMindmapTest010
         * @tc.desc Verify object null/
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 3);
          expect(r).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_1100
         * @tc.name int32ArrayFindLastPart02TestMindmapTest011
         * @tc.desc Verify findLast returns 99 when matching the last element (99) in [1,2,3,99]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 99);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 99);
          expect(r).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_1200
         * @tc.name int32ArrayFindLastPart02TestMindmapTest012
         * @tc.desc Verify findLast returns 77 when the only matching element is at index 0 in [77,1,2,3]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(77, 1, 2, 3);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 77);
          expect(r).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_1300
         * @tc.name int32ArrayFindLastPart02TestMindmapTest013
         * @tc.desc Verify findLast returns the last matching element (20 at index 3) when predicate v >= 20 in [10,20,30,20,10]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 20, 10);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v >= 20);
          expect(r).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_1400
         * @tc.name int32ArrayFindLastPart02TestMindmapTest014
         * @tc.desc Verify findLast returns 5 (last element) when all elements satisfy v >= 0 in [1,2,3,4,5]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v >= 0);
          expect(r).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_1500
         * @tc.name int32ArrayFindLastPart02TestMindmapTest015
         * @tc.desc Verify findLast returns 55 when the matching element is surrounded by zeros in [0,0,55,0,0]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 55, 0, 0);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 55);
          expect(r).assertEqual(55);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_1600
         * @tc.name int32ArrayFindLastPart02TestMindmapTest016
         * @tc.desc Verify findLast returns 7 from the last occurrence (index 1 not 0) in [7,7]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(7, 7);
          let lastIdx: int = -1;
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          if (v === 7) { lastIdx = i; return true; }
          return false;
        });
          expect(r).assertEqual(7);
          expect(lastIdx).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_1700
         * @tc.name int32ArrayFindLastPart02TestMindmapTest017
         * @tc.desc Verify int32 2147483647
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2147483647, -5);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 2147483647);
          expect(r).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_1800
         * @tc.name int32ArrayFindLastPart02TestMindmapTest018
         * @tc.desc Verify int32 -2147483648
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-5, -2147483648, 10);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === -2147483648);
          expect(r).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_1900
         * @tc.name int32ArrayFindLastPart02TestMindmapTest019
         * @tc.desc Verify -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-2, -1, 0);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === -1);
          expect(r).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_2000
         * @tc.name int32ArrayFindLastPart02TestMindmapTest020
         * @tc.desc Verify 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-1, 0, 1);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 0);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_2100
         * @tc.name int32ArrayFindLastPart02TestMindmapTest021
         * @tc.desc Verify -0 ToInt32 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.$_set(0, 1);
          arr.$_set(1, -0);
          arr.$_set(2, 2);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => (1 / v) === Double.NEGATIVE_INFINITY);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_2200
         * @tc.name int32ArrayFindLastPart02TestMindmapTest022
         * @tc.desc Verify 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 1, 2);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 1);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_2300
         * @tc.name int32ArrayFindLastPart02TestMindmapTest023
         * @tc.desc Verify 2147483648 -2147483648
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.$_set(0, (2147483648.0).toInt());
          arr.$_set(1, 5);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => v === -2147483648);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_2400
         * @tc.name int32ArrayFindLastPart02TestMindmapTest024
         * @tc.desc Verify 2147483649 -2147483647
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.$_set(0, (2147483649.0).toInt());
          arr.$_set(1, 1);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => v === -2147483647);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_2500
         * @tc.name int32ArrayFindLastPart02TestMindmapTest025
         * @tc.desc Verify -2147483649 2147483647
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.$_set(0, (-2147483649.0).toInt());
          arr.$_set(1, 0);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 2147483647);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_2600
         * @tc.name int32ArrayFindLastPart02TestMindmapTest026
         * @tc.desc Verify 4294967295 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.$_set(0, (4294967295.0).toInt());
          arr.$_set(1, 0);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => v === -1);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_2700
         * @tc.name int32ArrayFindLastPart02TestMindmapTest027
         * @tc.desc Verify 3.7 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.$_set(0, (3.7).toInt());
          arr.$_set(1, 100);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 3);
          expect(r).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_2800
         * @tc.name int32ArrayFindLastPart02TestMindmapTest028
         * @tc.desc Verify -3.7 -3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.$_set(0, (-3.7).toInt());
          arr.$_set(1, 9);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === -3);
          expect(r).assertEqual(-3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_2900
         * @tc.name int32ArrayFindLastPart02TestMindmapTest029
         * @tc.desc Verify Number.NaN ToInt32 0 === 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.$_set(0, (Double.NaN).toInt());
          arr.$_set(1, 5);
          arr.$_set(2, 6);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 0);
          expect(r).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_3000
         * @tc.name int32ArrayFindLastPart02TestMindmapTest030
         * @tc.desc Verify +Number.POSITIVE_INFINITY ToInt32 0 === 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.$_set(0, (Double.POSITIVE_INFINITY).toInt());
          arr.$_set(1, 2);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 0);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_3100
         * @tc.name int32ArrayFindLastPart02TestMindmapTest031
         * @tc.desc Verify Double.NEGATIVE_INFINITY ToInt32 0 === 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.$_set(0, (Double.NEGATIVE_INFINITY).toInt());
          arr.$_set(1, 8);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 0);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_3200
         * @tc.name int32ArrayFindLastPart02TestMindmapTest032
         * @tc.desc Verify predicate v > N
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 5, 10, 7, 3);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v > 6);
          expect(r).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_3300
         * @tc.name int32ArrayFindLastPart02TestMindmapTest033
         * @tc.desc Verify predicate v < N
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 2, 8, 4, 9);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v < 5);
          expect(r).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_3400
         * @tc.name int32ArrayFindLastPart02TestMindmapTest034
         * @tc.desc Verify findLast returns 33 when matching a specific value in [11,22,33,44]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(11, 22, 33, 44);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 33);
          expect(r).assertEqual(33);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_3500
         * @tc.name int32ArrayFindLastPart02TestMindmapTest035
         * @tc.desc Verify findLast returns the last odd number (7) when predicate v % 2 !== 0 in [2,4,5,6,7,8]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(2, 4, 5, 6, 7, 8);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v % 2 !== 0);
          expect(r).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_3600
         * @tc.name int32ArrayFindLastPart02TestMindmapTest036
         * @tc.desc Verify number truthy
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 3);
          expect(r).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_3700
         * @tc.name int32ArrayFindLastPart02TestMindmapTest037
         * @tc.desc Verify findLast returns 9 at index 0 when searching from end in [9,0]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(9, 0);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 9);
          expect(r).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_3800
         * @tc.name int32ArrayFindLastPart02TestMindmapTest038
         * @tc.desc Verify findLast returns 9 when matching the last element at index 1 in [0,9]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 9);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 9);
          expect(r).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_3900
         * @tc.name int32ArrayFindLastPart02TestMindmapTest039
         * @tc.desc Verify findLast returns 999 from the last duplicate occurrence (index 80 not 50)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(100);
          for (let i = 0; i < 100; i++) { arr.$_set(i, i); }
          arr.$_set(50, 999);
          arr.$_set(80, 999);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 999);
          expect(r).assertEqual(999);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_4000
         * @tc.name int32ArrayFindLastPart02TestMindmapTest040
         * @tc.desc Verify findLast returns 777 when the only match is at index 0 in a large zero-filled array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(100);
          for (let i = 0; i < 100; i++) { arr.$_set(i, 0); }
          arr.$_set(0, 777);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 777);
          expect(r).assertEqual(777);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_4100
         * @tc.name int32ArrayFindLastPart02TestMindmapTest041
         * @tc.desc Verify findLast returns 5 from the last occurrence (index 4) in [5,0,5,0,5]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(5, 0, 5, 0, 5);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 5);
          expect(r).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_4200
         * @tc.name int32ArrayFindLastPart02TestMindmapTest042
         * @tc.desc Verify index === length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 0, 123);
          let idxRecord: int = -1;
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { idxRecord = i; return v === 123; });
          expect(r).assertEqual(123);
          expect(idxRecord).assertEqual(arr.length - 1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_4300
         * @tc.name int32ArrayFindLastPart02TestMindmapTest043
         * @tc.desc Verify :number 0 undefined/ bug
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 9999);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_4400
         * @tc.name int32ArrayFindLastPart02TestMindmapTest044
         * @tc.desc Verify number
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 30);
          r = 999;
          expect(arr.$_get(2)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_4500
         * @tc.name int32ArrayFindLastPart02TestMindmapTest045
         * @tc.desc Verify findLast length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let before: int = arr.length;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => v > 2);
          expect(arr.length).assertEqual(before);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_4600
         * @tc.name int32ArrayFindLastPart02TestMindmapTest046
         * @tc.desc Verify findLast byteLength
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let before: int = arr.byteLength;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 4);
          expect(arr.byteLength).assertEqual(before);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_4700
         * @tc.name int32ArrayFindLastPart02TestMindmapTest047
         * @tc.desc Verify findLast byteOffset
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let arr: Int32Array = new Int32Array(buf, 4, 2);
          let before: int = arr.byteOffset;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => true);
          expect(arr.byteOffset).assertEqual(before);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_4800
         * @tc.name int32ArrayFindLastPart02TestMindmapTest048
         * @tc.desc Verify findLast BYTES_PER_ELEMENT 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 3);
          expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_4900
         * @tc.name int32ArrayFindLastPart02TestMindmapTest049
         * @tc.desc Verify findLast does not mutate the original array when predicate matches in [10,20,30,40,50]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
          arr.findLast((v: number, i: int, a: Int32Array): boolean => v > 25);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(30);
          expect(arr.$_get(3)).assertEqual(40);
          expect(arr.$_get(4)).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_5000
         * @tc.name int32ArrayFindLastPart02TestMindmapTest050
         * @tc.desc Verify findLast does not mutate the original array when predicate always returns true in [-1,0,1]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(-1, 0, 1);
          arr.findLast((v: number, i: int, a: Int32Array): boolean => true);
          expect(arr.$_get(0)).assertEqual(-1);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_5100
         * @tc.name int32ArrayFindLastPart02TestMindmapTest051
         * @tc.desc Verify findLast throws Error when predicate always returns false (no match) and array [7,8,9] remains unchanged
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(7, 8, 9);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => false);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            expect(e.message).assertEqual('Int32Array.findLast: not implemented if an element was not found');
          }
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(2)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_5200
         * @tc.name int32ArrayFindLastPart02TestMindmapTest052
         * @tc.desc Verify findLast length 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => true);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_5300
         * @tc.name int32ArrayFindLastPart02TestMindmapTest053
         * @tc.desc Verify findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(42);
          arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 42);
          expect(arr.$_get(0)).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_5400
         * @tc.name int32ArrayFindLastPart02TestMindmapTest054
         * @tc.desc Verify array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(5, 6, 7);
          arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          a.$_get(0);
          return v === 7;
        });
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(1)).assertEqual(6);
          expect(arr.$_get(2)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_5500
         * @tc.name int32ArrayFindLastPart02TestMindmapTest055
         * @tc.desc Verify buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let bufBefore: ArrayBuffer = arr.buffer;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 3);
          expect(arr.buffer).assertEqual(bufBefore);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_5600
         * @tc.name int32ArrayFindLastPart02TestMindmapTest056
         * @tc.desc Verify subarray findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
          let view: Int32Array = base.subarray(1, 4);
          let r: number = view.findLast((v: number, i: int, a: Int32Array): boolean => true);
          expect(r).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_5700
         * @tc.name int32ArrayFindLastPart02TestMindmapTest057
         * @tc.desc Verify subarray findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let view: Int32Array = base.subarray(0, 2);
          let r: number = view.findLast((v: number, i: int, a: Int32Array): boolean => true);
          expect(r).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_5800
         * @tc.name int32ArrayFindLastPart02TestMindmapTest058
         * @tc.desc Verify ArrayBuffer findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let view: Int32Array = new Int32Array(buf, 4, 2);
          view.$_set(0, 111);
          view.$_set(1, 222);
          let r: number = view.findLast((v: number, i: int, a: Int32Array): boolean => v > 0);
          expect(r).assertEqual(222);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_5900
         * @tc.name int32ArrayFindLastPart02TestMindmapTest059
         * @tc.desc Verify findLast buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = Int32Array.of(1, 2, 3, 4);
          let view: Int32Array = base.subarray(0, 4);
          base.findLast((v: number, i: int, a: Int32Array): boolean => v === 4);
          expect(view.$_get(0)).assertEqual(1);
          expect(view.$_get(1)).assertEqual(2);
          expect(view.$_get(2)).assertEqual(3);
          expect(view.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_6000
         * @tc.name int32ArrayFindLastPart02TestMindmapTest060
         * @tc.desc Verify findLast buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf, 0, 2);
          let b: Int32Array = new Int32Array(buf, 8, 2);
          a.$_set(0, 10);
          a.$_set(1, 20);
          b.$_set(0, 30);
          b.$_set(1, 40);
          a.findLast((v: number, i: int, arr: Int32Array): boolean => true);
          expect(b.$_get(0)).assertEqual(30);
          expect(b.$_get(1)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_6100
         * @tc.name int32ArrayFindLastPart02TestMindmapTest061
         * @tc.desc Verify slice findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let original: Int32Array = Int32Array.of(7, 8, 9);
          let cp: Int32Array = original.slice();
          cp.findLast((v: number, i: int, a: Int32Array): boolean => true);
          expect(original.$_get(0)).assertEqual(7);
          expect(original.$_get(1)).assertEqual(8);
          expect(original.$_get(2)).assertEqual(9);
          expect(cp.$_get(0)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_6200
         * @tc.name int32ArrayFindLastPart02TestMindmapTest062
         * @tc.desc Verify 1 subarray findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = Int32Array.of(10, 20, 30);
          let view: Int32Array = base.subarray(1, 2);
          let r: number = view.findLast((v: number, i: int, a: Int32Array): boolean => true);
          expect(r).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_6300
         * @tc.name int32ArrayFindLastPart02TestMindmapTest063
         * @tc.desc Verify byteOffset 0 findLast base
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(20);
          let full: Int32Array = new Int32Array(buf);
          full.$_set(0, 1);
          full.$_set(1, 2);
          full.$_set(2, 3);
          full.$_set(3, 4);
          full.$_set(4, 5);
          let view: Int32Array = new Int32Array(buf, 8, 3);
          let r: number = view.findLast((v: number, i: int, a: Int32Array): boolean => v === 5);
          expect(r).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_6400
         * @tc.name int32ArrayFindLastPart02TestMindmapTest064
         * @tc.desc Verify findLast buffer.byteLength
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3);
          let before: int = arr.buffer.byteLength;
          arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 3);
          expect(arr.buffer.byteLength).assertEqual(before);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_6500
         * @tc.name int32ArrayFindLastPart02TestMindmapTest065
         * @tc.desc Verify findLast returns first element when matching first element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let r: number | undefined = arr.findLast((v: number, _i: int, _a: Int32Array): boolean => v === 1);
          expect(r).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_6600
         * @tc.name int32ArrayFindLastPart02TestMindmapTest066
         * @tc.desc Verify findLast number
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 20);
          let sum: number = r + 1;
          expect(sum).assertEqual(21);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_6700
         * @tc.name int32ArrayFindLastPart02TestMindmapTest067
         * @tc.desc Verify findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          let r1: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v % 2 === 0);
          let r2: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v % 2 === 0);
          expect(r1).assertEqual(4);
          expect(r1).assertEqual(r2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_6800
         * @tc.name int32ArrayFindLastPart02TestMindmapTest068
         * @tc.desc Verify findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(5, 3, 8, 6, 2);
          let r1: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v > 6);
          let r2: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v < 4);
          expect(r1).assertEqual(8);
          expect(r2).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_6900
         * @tc.name int32ArrayFindLastPart02TestMindmapTest069
         * @tc.desc Verify findLast TypedArray findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(1, 2, 3);
          let b: Int32Array = Int32Array.of(10, 20, 30);
          let r: number = a.findLast((v: number, i: int, arr: Int32Array): boolean => {
          b.findLast((v2: number, i2: int, a2: Int32Array): boolean => v2 === 30);
          return v === 2;
        });
          expect(r).assertEqual(2);
          expect(b.$_get(2)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_7000
         * @tc.name int32ArrayFindLastPart02TestMindmapTest070
         * @tc.desc Verify array $_set findLast
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0, 0, 0, 0);
          try {
            arr.findLast((v: number, i: int, a: Int32Array): boolean => {
            if (i === 3) {
            a.$_set(3, 77);
            return false;
            }
            return v === 77;
          });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('Error');
          }
          expect(arr.$_get(3)).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_7100
         * @tc.name int32ArrayFindLastPart02TestMindmapTest071
         * @tc.desc Verify 0x7FFFFFFE 2147483646
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let target: int = 2147483646;
          let arr: Int32Array = Int32Array.of(1, target, 3);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === target);
          expect(r).assertEqual(target);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_7200
         * @tc.name int32ArrayFindLastPart02TestMindmapTest072
         * @tc.desc Verify 0xFF 255
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0x01, 0x02, 0xFF);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 0xFF);
          expect(r).assertEqual(255);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_7300
         * @tc.name int32ArrayFindLastPart02TestMindmapTest073
         * @tc.desc Verify 0o77 63
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0o10, 0o20, 0o77);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 0o77);
          expect(r).assertEqual(63);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART02_TEST_MINDMAP_7400
         * @tc.name int32ArrayFindLastPart02TestMindmapTest074
         * @tc.desc Verify 0b1010 10
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFindLastPart02TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(0b1, 0b10, 0b1010);
          let r: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => v === 0b1010);
          expect(r).assertEqual(10);
        });
  });
}
