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
export default function int32ArrayFillPart04Test(): void {
  describe('Int32ArrayFillPart04Test', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_0100
         * @tc.name int32ArrayFillPart04TestMindmapTest001
         * @tc.desc Verify single-arg fill fills entire non-zero byteOffset view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let view: Int32Array = new Int32Array(buf, 8, 3);
          view.fill(42);
          expect(view.length).assertEqual(3);
          expect(view.$_get(0)).assertEqual(42);
          expect(view.$_get(1)).assertEqual(42);
          expect(view.$_get(2)).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_0200
         * @tc.name int32ArrayFillPart04TestMindmapTest002
         * @tc.desc Verify single-arg fill overwrites all elements on of-constructed array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
          arr.fill(7);
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(4)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_0300
         * @tc.name int32ArrayFillPart04TestMindmapTest003
         * @tc.desc Verify two-arg fill(start) fills from start to end on from-constructed array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let source: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
          let arr: Int32Array = Int32Array.from(source);
          arr.fill(99, 3, arr.length);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(99);
          expect(arr.$_get(5)).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_0400
         * @tc.name int32ArrayFillPart04TestMindmapTest004
         * @tc.desc Verify three-arg fill fills [start,end) on non-zero byteOffset view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(32);
          let view: Int32Array = new Int32Array(buf, 4, 6);
          view.fill(111, 2, 5);
          expect(view.$_get(0)).assertEqual(0);
          expect(view.$_get(1)).assertEqual(0);
          expect(view.$_get(2)).assertEqual(111);
          expect(view.$_get(3)).assertEqual(111);
          expect(view.$_get(4)).assertEqual(111);
          expect(view.$_get(5)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_0500
         * @tc.name int32ArrayFillPart04TestMindmapTest005
         * @tc.desc Verify fill with INT_MAX value on length-4 array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill(2147483647);
          expect(arr.$_get(0)).assertEqual(2147483647);
          expect(arr.$_get(1)).assertEqual(2147483647);
          expect(arr.$_get(2)).assertEqual(2147483647);
          expect(arr.$_get(3)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_0600
         * @tc.name int32ArrayFillPart04TestMindmapTest006
         * @tc.desc Verify fill with INT_MAX value on length-1 array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.fill(2147483647);
          expect(arr.$_get(0)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_0700
         * @tc.name int32ArrayFillPart04TestMindmapTest007
         * @tc.desc Verify fill INT_MAX into [1,3) leaves out-of-range elements untouched
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
          arr.fill(2147483647, 1, 3);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(2147483647);
          expect(arr.$_get(2)).assertEqual(2147483647);
          expect(arr.$_get(3)).assertEqual(0);
          expect(arr.$_get(4)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_0800
         * @tc.name int32ArrayFillPart04TestMindmapTest008
         * @tc.desc Verify fill with INT_MIN value on length-3 array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill((-2147483648) as number);
          expect(arr.$_get(0)).assertEqual(-2147483648);
          expect(arr.$_get(1)).assertEqual(-2147483648);
          expect(arr.$_get(2)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_0900
         * @tc.name int32ArrayFillPart04TestMindmapTest009
         * @tc.desc Verify fill INT_MIN on non-zero byteOffset view fills all view elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(20);
          let view: Int32Array = new Int32Array(buf, 8, 2);
          view.fill((-2147483648) as number);
          expect(view.$_get(0)).assertEqual(-2147483648);
          expect(view.$_get(1)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_1000
         * @tc.name int32ArrayFillPart04TestMindmapTest010
         * @tc.desc Verify fill INT_MIN into [0,1) sets only first element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill((-2147483648) as number, 0, 1);
          expect(arr.$_get(0)).assertEqual(-2147483648);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_1100
         * @tc.name int32ArrayFillPart04TestMindmapTest011
         * @tc.desc Verify fill with -1 on length-5 array sets all bits to 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(5);
          arr.fill((-1));
          expect(arr.$_get(0)).assertEqual(-1);
          expect(arr.$_get(2)).assertEqual(-1);
          expect(arr.$_get(4)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_1200
         * @tc.name int32ArrayFillPart04TestMindmapTest012
         * @tc.desc Verify fill -1 from negative start -2 to end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.fill((-1), (-2));
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(-1);
          expect(arr.$_get(3)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_1300
         * @tc.name int32ArrayFillPart04TestMindmapTest013
         * @tc.desc Verify fill -1 into [1,-1) on from-constructed array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(5, 6, 7, 8, 9);
          let arr: Int32Array = Int32Array.from(src);
          arr.fill((-1), 1, (-1));
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(1)).assertEqual(-1);
          expect(arr.$_get(2)).assertEqual(-1);
          expect(arr.$_get(3)).assertEqual(-1);
          expect(arr.$_get(4)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_1400
         * @tc.name int32ArrayFillPart04TestMindmapTest014
         * @tc.desc Verify fill 0 after INT_MAX clears all elements to zero
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(2147483647);
          arr.fill(0);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_1500
         * @tc.name int32ArrayFillPart04TestMindmapTest015
         * @tc.desc Verify fill 0 into [length-1,length) sets only last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
          arr.fill(0, arr.length - 1, arr.length);
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_1600
         * @tc.name int32ArrayFillPart04TestMindmapTest016
         * @tc.desc Verify fill 0 from start=-1 normalizes to last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([3, 3, 3, 3]);
          arr.fill(0, (-1));
          expect(arr.$_get(0)).assertEqual(3);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_1700
         * @tc.name int32ArrayFillPart04TestMindmapTest017
         * @tc.desc Verify fill from start=-1 on non-zero byteOffset view sets last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(32);
          let view: Int32Array = new Int32Array(buf, 12, 4);
          view.$_set(0, 1);
          view.$_set(1, 2);
          view.$_set(2, 3);
          view.$_set(3, 4);
          view.fill(9, (-1));
          expect(view.$_get(0)).assertEqual(1);
          expect(view.$_get(1)).assertEqual(2);
          expect(view.$_get(2)).assertEqual(3);
          expect(view.$_get(3)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_1800
         * @tc.name int32ArrayFillPart04TestMindmapTest018
         * @tc.desc Verify fill with end=-length normalizes to empty range and is no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let view: Int32Array = new Int32Array(buf, 4, 4);
          view.fill(5);
          view.fill(9, 0, (-4));
          expect(view.$_get(0)).assertEqual(5);
          expect(view.$_get(1)).assertEqual(5);
          expect(view.$_get(2)).assertEqual(5);
          expect(view.$_get(3)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_1900
         * @tc.name int32ArrayFillPart04TestMindmapTest019
         * @tc.desc Verify fill with start=-length normalizes to 0 with positive end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.fill(8, (-5), 3);
          expect(arr.$_get(0)).assertEqual(8);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(2)).assertEqual(8);
          expect(arr.$_get(3)).assertEqual(4);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_2000
         * @tc.name int32ArrayFillPart04TestMindmapTest020
         * @tc.desc Verify fill with start=-length-1 double-underflow clamps to 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(7, (-4), 2);
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(1)).assertEqual(7);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_2100
         * @tc.name int32ArrayFillPart04TestMindmapTest021
         * @tc.desc Verify fill with start equal to end is empty range no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(99, 2, 2);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_2200
         * @tc.name int32ArrayFillPart04TestMindmapTest022
         * @tc.desc Verify fill with reversed start>end range is no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(88, 3, 1);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_2300
         * @tc.name int32ArrayFillPart04TestMindmapTest023
         * @tc.desc Verify fill with negative start and end=0 normalizes to empty range no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(77, (-1), 0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_2400
         * @tc.name int32ArrayFillPart04TestMindmapTest024
         * @tc.desc Verify fill with start equal to length is empty range no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(66, 3, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_2500
         * @tc.name int32ArrayFillPart04TestMindmapTest025
         * @tc.desc Verify fill with negative start and end=0 produces empty range no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(55, (-2), 0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_2600
         * @tc.name int32ArrayFillPart04TestMindmapTest026
         * @tc.desc Verify chained fill with different ranges and values produces expected result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(5);
          arr.fill(1).fill(2, 0, 2).fill(3, 4, arr.length);
          expect(arr.$_get(0)).assertEqual(2);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(1);
          expect(arr.$_get(4)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_2700
         * @tc.name int32ArrayFillPart04TestMindmapTest027
         * @tc.desc Verify fill returns same reference (===) as original array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          let ret: Int32Array = arr.fill(7);
          expect(ret).assertEqual(arr);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_2800
         * @tc.name int32ArrayFillPart04TestMindmapTest028
         * @tc.desc Verify byteLength remains unchanged after chained fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          let before: int = arr.byteLength;
          arr.fill(1).fill(2, 1, 3);
          expect(arr.byteLength).assertEqual(before);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_2900
         * @tc.name int32ArrayFillPart04TestMindmapTest029
         * @tc.desc Verify length remains unchanged after chained fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(6);
          arr.fill(0).fill((-1), 2, 4);
          expect(arr.length).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_3000
         * @tc.name int32ArrayFillPart04TestMindmapTest030
         * @tc.desc Verify chained fill INT_MAX then INT_MIN overwrites with INT_MIN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(2147483647).fill((-2147483648) as number);
          expect(arr.$_get(0)).assertEqual(-2147483648);
          expect(arr.$_get(1)).assertEqual(-2147483648);
          expect(arr.$_get(2)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_3100
         * @tc.name int32ArrayFillPart04TestMindmapTest031
         * @tc.desc Verify fill on non-zero byteOffset view returns same reference
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let view: Int32Array = new Int32Array(buf, 4, 4);
          let ret: Int32Array = view.fill(5);
          expect(ret).assertEqual(view);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_3200
         * @tc.name int32ArrayFillPart04TestMindmapTest032
         * @tc.desc Verify fill does not change buffer reference
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let view: Int32Array = new Int32Array(buf);
          let beforeBuf: ArrayBuffer = view.buffer;
          view.fill(42);
          expect(view.buffer).assertEqual(beforeBuf);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_3300
         * @tc.name int32ArrayFillPart04TestMindmapTest033
         * @tc.desc Verify fill preserves byteOffset on non-zero offset view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(32);
          let view: Int32Array = new Int32Array(buf, 12, 3);
          let before: int = view.byteOffset;
          view.fill(9);
          expect(view.byteOffset).assertEqual(before);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_3400
         * @tc.name int32ArrayFillPart04TestMindmapTest034
         * @tc.desc Verify fill does not change array length after tail fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(0, 2, arr.length);
          expect(arr.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_3500
         * @tc.name int32ArrayFillPart04TestMindmapTest035
         * @tc.desc Verify fill does not change BYTES_PER_ELEMENT constant
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill(7);
          expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_3600
         * @tc.name int32ArrayFillPart04TestMindmapTest036
         * @tc.desc Verify fill on one view is observed on another co-located view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf, 0, 4);
          let b: Int32Array = new Int32Array(buf, 0, 4);
          a.fill(123);
          expect(b.$_get(0)).assertEqual(123);
          expect(b.$_get(3)).assertEqual(123);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_3700
         * @tc.name int32ArrayFillPart04TestMindmapTest037
         * @tc.desc Verify fill on offset view is observed at correct offsets in start view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let a: Int32Array = new Int32Array(buf, 8, 2);
          let b: Int32Array = new Int32Array(buf, 0, 6);
          a.fill(77);
          expect(b.$_get(0)).assertEqual(0);
          expect(b.$_get(1)).assertEqual(0);
          expect(b.$_get(2)).assertEqual(77);
          expect(b.$_get(3)).assertEqual(77);
          expect(b.$_get(4)).assertEqual(0);
          expect(b.$_get(5)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_3800
         * @tc.name int32ArrayFillPart04TestMindmapTest038
         * @tc.desc Verify fill on start view is observed in overlapping offset view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(20);
          let a: Int32Array = new Int32Array(buf, 0, 5);
          let b: Int32Array = new Int32Array(buf, 8, 3);
          a.fill((-1));
          expect(b.$_get(0)).assertEqual(-1);
          expect(b.$_get(1)).assertEqual(-1);
          expect(b.$_get(2)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_3900
         * @tc.name int32ArrayFillPart04TestMindmapTest039
         * @tc.desc Verify partial fill leaves adjacent elements untouched
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf, 0, 4);
          a.fill(1);
          a.fill(9, 1, 3);
          expect(a.$_get(0)).assertEqual(1);
          expect(a.$_get(1)).assertEqual(9);
          expect(a.$_get(2)).assertEqual(9);
          expect(a.$_get(3)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_4000
         * @tc.name int32ArrayFillPart04TestMindmapTest040
         * @tc.desc Verify partial fill on non-zero offset view is precisely observed in start view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(32);
          let a: Int32Array = new Int32Array(buf, 8, 4);
          let b: Int32Array = new Int32Array(buf, 0, 8);
          a.fill(5, 1, 3);
          expect(b.$_get(0)).assertEqual(0);
          expect(b.$_get(1)).assertEqual(0);
          expect(b.$_get(2)).assertEqual(0);
          expect(b.$_get(3)).assertEqual(5);
          expect(b.$_get(4)).assertEqual(5);
          expect(b.$_get(5)).assertEqual(0);
          expect(b.$_get(6)).assertEqual(0);
          expect(b.$_get(7)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_4100
         * @tc.name int32ArrayFillPart04TestMindmapTest041
         * @tc.desc Verify fill through subarray writes through to parent array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let sub: Int32Array = arr.subarray(1, 4);
          sub.fill(0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
          expect(arr.$_get(3)).assertEqual(0);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_4200
         * @tc.name int32ArrayFillPart04TestMindmapTest042
         * @tc.desc Verify negative start on subarray normalizes relative to subarray length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          let sub: Int32Array = arr.subarray(1, 5);
          sub.fill(99, (-2));
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(99);
          expect(arr.$_get(4)).assertEqual(99);
          expect(arr.$_get(5)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_4300
         * @tc.name int32ArrayFillPart04TestMindmapTest043
         * @tc.desc Verify fill on zero-length subarray is no-op and does not throw
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let sub: Int32Array = arr.subarray(2, 2);
          sub.fill(5);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(sub.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_4400
         * @tc.name int32ArrayFillPart04TestMindmapTest044
         * @tc.desc Verify fill on subarray preserves its byteOffset and length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(8);
          let sub: Int32Array = arr.subarray(2, 6);
          let offBefore: int = sub.byteOffset;
          let lenBefore: int = sub.length;
          sub.fill(3);
          expect(sub.byteOffset).assertEqual(offBefore);
          expect(sub.length).assertEqual(lenBefore);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_4500
         * @tc.name int32ArrayFillPart04TestMindmapTest045
         * @tc.desc Verify INT_MIN written through one view reads back identically from peer view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(8);
          let a: Int32Array = new Int32Array(buf, 0, 2);
          let b: Int32Array = new Int32Array(buf, 0, 2);
          a.fill((-2147483648) as number);
          expect(b.$_get(0)).assertEqual(-2147483648);
          expect(b.$_get(1)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_4600
         * @tc.name int32ArrayFillPart04TestMindmapTest046
         * @tc.desc Verify -1 bit pattern confined to [1,3) subrange
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf, 0, 4);
          a.fill(0);
          a.fill((-1), 1, 3);
          expect(a.$_get(0)).assertEqual(0);
          expect(a.$_get(1)).assertEqual(-1);
          expect(a.$_get(2)).assertEqual(-1);
          expect(a.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_4700
         * @tc.name int32ArrayFillPart04TestMindmapTest047
         * @tc.desc Verify fill on of-constructed array is visible through fresh buffer view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          arr.fill(100, 1, 3);
          let view: Int32Array = new Int32Array(arr.buffer, arr.byteOffset, arr.length);
          expect(view.$_get(0)).assertEqual(1);
          expect(view.$_get(1)).assertEqual(100);
          expect(view.$_get(2)).assertEqual(100);
          expect(view.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_4800
         * @tc.name int32ArrayFillPart04TestMindmapTest048
         * @tc.desc Verify value MAX+1 wraps to INT_MIN via ToInt32 in chained fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(0).fill((2147483648) as number);
          expect(arr.$_get(0)).assertEqual(-2147483648);
          expect(arr.$_get(1)).assertEqual(-2147483648);
          expect(arr.$_get(2)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_4900
         * @tc.name int32ArrayFillPart04TestMindmapTest049
         * @tc.desc Verify value MIN-1 wraps to INT_MAX via ToInt32 on non-zero offset view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let view: Int32Array = new Int32Array(buf, 4, 2);
          view.fill((-2147483649) as number);
          expect(view.$_get(0)).assertEqual(2147483647);
          expect(view.$_get(1)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_5000
         * @tc.name int32ArrayFillPart04TestMindmapTest050
         * @tc.desc Verify value 2^32 wraps to 0 via ToInt32
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(1);
          arr.fill((4294967296) as number);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_5100
         * @tc.name int32ArrayFillPart04TestMindmapTest051
         * @tc.desc Verify value 2^32+1 wraps to 1 via ToInt32
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill((4294967297) as number);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_5200
         * @tc.name int32ArrayFillPart04TestMindmapTest052
         * @tc.desc Verify float value 0 truncates toward zero to 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(5);
          arr.fill(0);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_5300
         * @tc.name int32ArrayFillPart04TestMindmapTest053
         * @tc.desc Verify Number.NaN value converts to 0 on non-zero offset view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(12);
          let view: Int32Array = new Int32Array(buf, 4, 1);
          view.fill(7);
          view.fill((Double.NaN));
          expect(view.$_get(0)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_5400
         * @tc.name int32ArrayFillPart04TestMindmapTest054
         * @tc.desc Verify Number.POSITIVE_INFINITY value converts to 0 in chained fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(9).fill((Double.POSITIVE_INFINITY));
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_5500
         * @tc.name int32ArrayFillPart04TestMindmapTest055
         * @tc.desc Verify value MAX+2 wraps through subarray fill visible in parent
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
          let sub: Int32Array = arr.subarray(2, 4);
          sub.fill((2147483649) as number);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(-2147483647);
          expect(arr.$_get(3)).assertEqual(-2147483647);
          expect(arr.$_get(4)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_5600
         * @tc.name int32ArrayFillPart04TestMindmapTest056
         * @tc.desc Verify value MIN-2 wraps and partial fill confirms range boundaries
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill((-2147483650) as number, 1, 3);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(2147483646);
          expect(arr.$_get(2)).assertEqual(2147483646);
          expect(arr.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_5700
         * @tc.name int32ArrayFillPart04TestMindmapTest057
         * @tc.desc Verify consecutive identical fills are idempotent
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill(42);
          arr.fill(42);
          expect(arr.$_get(0)).assertEqual(42);
          expect(arr.$_get(1)).assertEqual(42);
          expect(arr.$_get(2)).assertEqual(42);
          expect(arr.$_get(3)).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_5800
         * @tc.name int32ArrayFillPart04TestMindmapTest058
         * @tc.desc Verify fill(v) equals fill(v,0,length) element-wise
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3, 4]);
          let b: Int32Array = new Int32Array([1, 2, 3, 4]);
          a.fill(7);
          b.fill(7, 0, 4);
          expect(a.$_get(0)).assertEqual(b.$_get(0));
          expect(a.$_get(1)).assertEqual(b.$_get(1));
          expect(a.$_get(2)).assertEqual(b.$_get(2));
          expect(a.$_get(3)).assertEqual(b.$_get(3));
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_5900
         * @tc.name int32ArrayFillPart04TestMindmapTest059
         * @tc.desc Verify segmented fills followed by full fill yields uniform value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(5);
          arr.fill(1, 0, 2);
          arr.fill(2, 2, 5);
          arr.fill(9);
          expect(arr.$_get(0)).assertEqual(9);
          expect(arr.$_get(2)).assertEqual(9);
          expect(arr.$_get(4)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_6000
         * @tc.name int32ArrayFillPart04TestMindmapTest060
         * @tc.desc Verify fill on properly sized buffer view does not throw
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(8);
          let view: Int32Array = new Int32Array(buf, 0, 2);
          view.fill(3);
          expect(view.$_get(0)).assertEqual(3);
          expect(view.$_get(1)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_6100
         * @tc.name int32ArrayFillPart04TestMindmapTest061
         * @tc.desc Verify fill(0) on length-2 array sets both elements to 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(0);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_6200
         * @tc.name int32ArrayFillPart04TestMindmapTest062
         * @tc.desc Verify constructing Int32Array from empty buffer with byteOffset=4 length=1 throws RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          new Int32Array(buf);
          try {
            let emptyBuf: ArrayBuffer = new ArrayBuffer(0);
            let bad: Int32Array = new Int32Array(emptyBuf, 4, 1);
            bad.fill(1);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_6300
         * @tc.name int32ArrayFillPart04TestMindmapTest063
         * @tc.desc Verify fill then $_set and reverse produces expected reversed order
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(0);
          arr.$_set(0, 1);
          arr.$_set(2, 3);
          arr.reverse();
          expect(arr.$_get(0)).assertEqual(3);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_6400
         * @tc.name int32ArrayFillPart04TestMindmapTest064
         * @tc.desc Verify for-of iteration after fill sees filled value for every element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill(11);
          let count: int = 0;
          for (let x of arr) {
          expect(x).assertEqual(11);
          count++;
          }
          expect(count).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_6500
         * @tc.name int32ArrayFillPart04TestMindmapTest065
         * @tc.desc Verify forEach after partial fill observes correct values at each index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.fill(0, 2, 4);
          let seen: number[] = [];
          arr.forEach((v: number, _i: int, _a: Int32Array): void => {
          seen.push(v);
        });
          expect(seen.length).assertEqual(5);
          expect(seen[0]).assertEqual(1);
          expect(seen[2]).assertEqual(0);
          expect(seen[3]).assertEqual(0);
          expect(seen[4]).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_6600
         * @tc.name int32ArrayFillPart04TestMindmapTest066
         * @tc.desc Verify every returns true when all elements equal fill value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(5);
          arr.fill(7);
          let allSeven: boolean = arr.every((v: number, _i: int, _a: Int32Array): boolean => {
          return v === 7;
        });
          expect(allSeven).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART04_TEST_MINDMAP_6700
         * @tc.name int32ArrayFillPart04TestMindmapTest067
         * @tc.desc Verify some finds value within partially filled range
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.fill(99, 1, 4);
          let hasNinetyNine: boolean = arr.some((v: number, _i: int, _a: Int32Array): boolean => {
          return v === 99;
        });
          expect(hasNinetyNine).assertTrue();
        });
  });
}
