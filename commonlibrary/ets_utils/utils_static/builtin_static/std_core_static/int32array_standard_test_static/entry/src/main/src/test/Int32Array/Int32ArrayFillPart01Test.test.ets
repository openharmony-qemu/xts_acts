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
export default function int32ArrayFillPart01Test(): void {
  describe('Int32ArrayFillPart01Test', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_0100
         * @tc.name int32ArrayFillPart01TestMindmapTest001
         * @tc.desc Verify fill whole array with only value argument
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(9);
          expect(arr.length).assertEqual(4);
          expect(arr.$_get(0)).assertEqual(9);
          expect(arr.$_get(1)).assertEqual(9);
          expect(arr.$_get(2)).assertEqual(9);
          expect(arr.$_get(3)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_0200
         * @tc.name int32ArrayFillPart01TestMindmapTest002
         * @tc.desc Verify fill from start to end with value and start arguments
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(7, 2, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_0300
         * @tc.name int32ArrayFillPart01TestMindmapTest003
         * @tc.desc Verify fill [start,end) interval with three arguments
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.fill(8, 1, 4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(2)).assertEqual(8);
          expect(arr.$_get(3)).assertEqual(8);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_0400
         * @tc.name int32ArrayFillPart01TestMindmapTest004
         * @tc.desc Verify fill with value zero writes zero to all elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([9, 9, 9]);
          arr.fill(0);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_0500
         * @tc.name int32ArrayFillPart01TestMindmapTest005
         * @tc.desc Verify fill with positive integer 1 writes 1 to all elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(1);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(1);
          expect(arr.$_get(2)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_0600
         * @tc.name int32ArrayFillPart01TestMindmapTest006
         * @tc.desc Verify fill with negative integer -1 writes -1 to all elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(-1);
          expect(arr.$_get(0)).assertEqual(-1);
          expect(arr.$_get(1)).assertEqual(-1);
          expect(arr.$_get(2)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_0700
         * @tc.name int32ArrayFillPart01TestMindmapTest007
         * @tc.desc Verify fill with ordinary positive integer 42 writes correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(42);
          expect(arr.$_get(0)).assertEqual(42);
          expect(arr.$_get(1)).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_0800
         * @tc.name int32ArrayFillPart01TestMindmapTest008
         * @tc.desc Verify fill with ordinary negative integer -99 writes correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-99);
          expect(arr.$_get(0)).assertEqual(-99);
          expect(arr.$_get(1)).assertEqual(-99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_0900
         * @tc.name int32ArrayFillPart01TestMindmapTest009
         * @tc.desc Verify fill with INT_MAX 2147483647 writes exact maximum value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          let v: int = 2147483647;
          arr.fill(v);
          expect(arr.$_get(0)).assertEqual(2147483647);
          expect(arr.$_get(1)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_1000
         * @tc.name int32ArrayFillPart01TestMindmapTest010
         * @tc.desc Verify fill with INT_MIN -2147483648 writes exact minimum value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          let v: int = -2147483648;
          arr.fill(v);
          expect(arr.$_get(0)).assertEqual(-2147483648);
          expect(arr.$_get(1)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_1100
         * @tc.name int32ArrayFillPart01TestMindmapTest011
         * @tc.desc Verify fill with hexadecimal integer 0xFF writes 255 correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(0xFF);
          expect(arr.$_get(0)).assertEqual(255);
          expect(arr.$_get(1)).assertEqual(255);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_1200
         * @tc.name int32ArrayFillPart01TestMindmapTest012
         * @tc.desc Verify fill with octal integer 0o77 writes 63 correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(0o77);
          expect(arr.$_get(0)).assertEqual(63);
          expect(arr.$_get(1)).assertEqual(63);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_1300
         * @tc.name int32ArrayFillPart01TestMindmapTest013
         * @tc.desc Verify fill with binary integer 0b1010 writes 10 correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(0b1010);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_1400
         * @tc.name int32ArrayFillPart01TestMindmapTest014
         * @tc.desc Verify start omitted defaults to 0 filling to end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(5);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(3)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_1500
         * @tc.name int32ArrayFillPart01TestMindmapTest015
         * @tc.desc Verify start=0 fills from first element to end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(6, 0, arr.length);
          expect(arr.$_get(0)).assertEqual(6);
          expect(arr.$_get(1)).assertEqual(6);
          expect(arr.$_get(2)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_1600
         * @tc.name int32ArrayFillPart01TestMindmapTest016
         * @tc.desc Verify start=1 fills from second element to end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(9, 1, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(9);
          expect(arr.$_get(2)).assertEqual(9);
          expect(arr.$_get(3)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_1700
         * @tc.name int32ArrayFillPart01TestMindmapTest017
         * @tc.desc Verify start=length-1 fills only last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(7, 3, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_1800
         * @tc.name int32ArrayFillPart01TestMindmapTest018
         * @tc.desc Verify start equals length fills no elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(9, 3, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_1900
         * @tc.name int32ArrayFillPart01TestMindmapTest019
         * @tc.desc Verify start greater than length clamps to length no fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(9, 100, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_2000
         * @tc.name int32ArrayFillPart01TestMindmapTest020
         * @tc.desc Verify start=-1 converts to last element index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(8, -1, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_2100
         * @tc.name int32ArrayFillPart01TestMindmapTest021
         * @tc.desc Verify start=-2 fills from second to last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.fill(9, -2, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(9);
          expect(arr.$_get(4)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_2200
         * @tc.name int32ArrayFillPart01TestMindmapTest022
         * @tc.desc Verify start=-length converts to 0 filling from first element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(6, -4, arr.length);
          expect(arr.$_get(0)).assertEqual(6);
          expect(arr.$_get(3)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_2300
         * @tc.name int32ArrayFillPart01TestMindmapTest023
         * @tc.desc Verify start=-length+1 converts to 1 filling from second element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(5, -3, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(5);
          expect(arr.$_get(2)).assertEqual(5);
          expect(arr.$_get(3)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_2400
         * @tc.name int32ArrayFillPart01TestMindmapTest024
         * @tc.desc Verify start far less than -length clamps to 0 filling whole array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(4, -10, arr.length);
          expect(arr.$_get(0)).assertEqual(4);
          expect(arr.$_get(1)).assertEqual(4);
          expect(arr.$_get(2)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_2500
         * @tc.name int32ArrayFillPart01TestMindmapTest025
         * @tc.desc Verify start=2 in length 5 array fills from third element to end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.fill(7, 2, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(7);
          expect(arr.$_get(4)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_2600
         * @tc.name int32ArrayFillPart01TestMindmapTest026
         * @tc.desc Verify end omitted defaults to length filling to array end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(7, 1, arr.length);
          expect(arr.$_get(1)).assertEqual(7);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_2700
         * @tc.name int32ArrayFillPart01TestMindmapTest027
         * @tc.desc Verify end=0 empty interval fills no elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(9, 0, 0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_2800
         * @tc.name int32ArrayFillPart01TestMindmapTest028
         * @tc.desc Verify end=1 fills only first element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(8, 0, 1);
          expect(arr.$_get(0)).assertEqual(8);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_2900
         * @tc.name int32ArrayFillPart01TestMindmapTest029
         * @tc.desc Verify end=length-1 fills up to second to last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(6, 0, 3);
          expect(arr.$_get(0)).assertEqual(6);
          expect(arr.$_get(1)).assertEqual(6);
          expect(arr.$_get(2)).assertEqual(6);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_3000
         * @tc.name int32ArrayFillPart01TestMindmapTest030
         * @tc.desc Verify end equals length fills to last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(5, 0, 3);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(1)).assertEqual(5);
          expect(arr.$_get(2)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_3100
         * @tc.name int32ArrayFillPart01TestMindmapTest031
         * @tc.desc Verify end greater than length clamps to length filling to end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(4, 0, 100);
          expect(arr.$_get(0)).assertEqual(4);
          expect(arr.$_get(1)).assertEqual(4);
          expect(arr.$_get(2)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_3200
         * @tc.name int32ArrayFillPart01TestMindmapTest032
         * @tc.desc Verify end=-1 converts to length-1 filling before last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(9, 0, -1);
          expect(arr.$_get(0)).assertEqual(9);
          expect(arr.$_get(1)).assertEqual(9);
          expect(arr.$_get(2)).assertEqual(9);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_3300
         * @tc.name int32ArrayFillPart01TestMindmapTest033
         * @tc.desc Verify end=-2 converts to length-2 filling before second to last
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.fill(7, 1, -2);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(7);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(4);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_3400
         * @tc.name int32ArrayFillPart01TestMindmapTest034
         * @tc.desc Verify end=-length converts to 0 empty interval no fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(9, 0, -4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_3500
         * @tc.name int32ArrayFillPart01TestMindmapTest035
         * @tc.desc Verify end far less than -length clamps to 0 empty interval no fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(9, 0, -100);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_3600
         * @tc.name int32ArrayFillPart01TestMindmapTest036
         * @tc.desc Verify end=2 with start=0 fills only first two elements in length 5
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          arr.fill(99, 0, 2);
          expect(arr.$_get(0)).assertEqual(99);
          expect(arr.$_get(1)).assertEqual(99);
          expect(arr.$_get(2)).assertEqual(30);
          expect(arr.$_get(3)).assertEqual(40);
          expect(arr.$_get(4)).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_3700
         * @tc.name int32ArrayFillPart01TestMindmapTest037
         * @tc.desc Verify end argument omitted is distinct from start omitted behavior
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr1: Int32Array = new Int32Array([1, 2, 3, 4]);
          let arr2: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr1.fill(7, 1, arr1.length);
          arr2.fill(7, 1, 4);
          expect(arr1.$_get(1)).assertEqual(arr2.$_get(1));
          expect(arr1.$_get(2)).assertEqual(arr2.$_get(2));
          expect(arr1.$_get(3)).assertEqual(arr2.$_get(3));
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_3800
         * @tc.name int32ArrayFillPart01TestMindmapTest038
         * @tc.desc Verify start=0 end=length fills entire array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(6, 0, 4);
          expect(arr.$_get(0)).assertEqual(6);
          expect(arr.$_get(1)).assertEqual(6);
          expect(arr.$_get(2)).assertEqual(6);
          expect(arr.$_get(3)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_3900
         * @tc.name int32ArrayFillPart01TestMindmapTest039
         * @tc.desc Verify start=1 end=3 fills only indices 1 and 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.fill(8, 1, 3);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(2)).assertEqual(8);
          expect(arr.$_get(3)).assertEqual(4);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_4000
         * @tc.name int32ArrayFillPart01TestMindmapTest040
         * @tc.desc Verify start=end=2 empty interval silent no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(9, 2, 2);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_4100
         * @tc.name int32ArrayFillPart01TestMindmapTest041
         * @tc.desc Verify start greater than end silent no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(9, 3, 1);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_4200
         * @tc.name int32ArrayFillPart01TestMindmapTest042
         * @tc.desc Verify negative start with positive end converts and fills correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.fill(7, -3, 4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(7);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_4300
         * @tc.name int32ArrayFillPart01TestMindmapTest043
         * @tc.desc Verify both negative start and end convert and fill correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.fill(8, -4, -1);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(2)).assertEqual(8);
          expect(arr.$_get(3)).assertEqual(8);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_4400
         * @tc.name int32ArrayFillPart01TestMindmapTest044
         * @tc.desc Verify start negative clamped to 0 with positive small end fills [0,end)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(5, -100, 2);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(1)).assertEqual(5);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_4500
         * @tc.name int32ArrayFillPart01TestMindmapTest045
         * @tc.desc Verify positive start with end negative clamped to 0 causes no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(9, 2, -100);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_4600
         * @tc.name int32ArrayFillPart01TestMindmapTest046
         * @tc.desc Verify positive start clamped to length with normal end causes no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(9, 100, 2);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_4700
         * @tc.name int32ArrayFillPart01TestMindmapTest047
         * @tc.desc Verify start=-1 end=-1 empty interval no-op in length 4 array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(9, -1, -1);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_4800
         * @tc.name int32ArrayFillPart01TestMindmapTest048
         * @tc.desc Verify start=-1 end=length fills last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(6, -1, 4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_4900
         * @tc.name int32ArrayFillPart01TestMindmapTest049
         * @tc.desc Verify fill returns calling object itself this
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          let ret: Int32Array = arr.fill(1);
          expect(ret).assertEqual(arr);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_5000
         * @tc.name int32ArrayFillPart01TestMindmapTest050
         * @tc.desc Verify fill supports chaining two calls with different ranges
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(0).fill(9, 1, 3);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(9);
          expect(arr.$_get(2)).assertEqual(9);
          expect(arr.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_5100
         * @tc.name int32ArrayFillPart01TestMindmapTest051
         * @tc.desc Verify array length remains unchanged after fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(5);
          let before: int = arr.length;
          arr.fill(7);
          expect(arr.length).assertEqual(before);
          expect(arr.length).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_5200
         * @tc.name int32ArrayFillPart01TestMindmapTest052
         * @tc.desc Verify byteLength remains unchanged after fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          let before: int = arr.byteLength;
          arr.fill(1);
          expect(arr.byteLength).assertEqual(before);
          expect(arr.byteLength).assertEqual(16);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_5300
         * @tc.name int32ArrayFillPart01TestMindmapTest053
         * @tc.desc Verify BYTES_PER_ELEMENT constant remains 4 after fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(42);
          expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_5400
         * @tc.name int32ArrayFillPart01TestMindmapTest054
         * @tc.desc Verify fill returns this across three chained calls pointing to same object
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          let r1: Int32Array = arr.fill(1);
          let r2: Int32Array = r1.fill(2, 1, r1.length);
          let r3: Int32Array = r2.fill(3, 2, 3);
          expect(r3).assertEqual(arr);
          expect(r3.$_get(0)).assertEqual(1);
          expect(r3.$_get(1)).assertEqual(2);
          expect(r3.$_get(2)).assertEqual(3);
          expect(r3.$_get(3)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_5500
         * @tc.name int32ArrayFillPart01TestMindmapTest055
         * @tc.desc Verify buffer reference remains same object after fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          let buf: ArrayBuffer = arr.buffer;
          arr.fill(5);
          expect(arr.buffer).assertEqual(buf);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_5600
         * @tc.name int32ArrayFillPart01TestMindmapTest056
         * @tc.desc Verify byteOffset remains unchanged after fill on offset view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let arr: Int32Array = new Int32Array(buf, 8, 3);
          let off: int = arr.byteOffset;
          arr.fill(9);
          expect(arr.byteOffset).assertEqual(off);
          expect(arr.byteOffset).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_5700
         * @tc.name int32ArrayFillPart01TestMindmapTest057
         * @tc.desc Verify empty array length=0 fill silent no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          arr.fill(9);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_5800
         * @tc.name int32ArrayFillPart01TestMindmapTest058
         * @tc.desc Verify empty array fill with start still no-op length unchanged
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          arr.fill(9, 0, arr.length);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_5900
         * @tc.name int32ArrayFillPart01TestMindmapTest059
         * @tc.desc Verify empty array fill with start and end still no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          arr.fill(9, 0, 0);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_6000
         * @tc.name int32ArrayFillPart01TestMindmapTest060
         * @tc.desc Verify empty array fill with out of range start end no-op no throw
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          arr.fill(9, -100, 100);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_6100
         * @tc.name int32ArrayFillPart01TestMindmapTest061
         * @tc.desc Verify empty array fill returns this and length remains 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let ret: Int32Array = arr.fill(5);
          expect(ret).assertEqual(arr);
          expect(ret.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_6200
         * @tc.name int32ArrayFillPart01TestMindmapTest062
         * @tc.desc Verify single element array fill fills whole element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.fill(33);
          expect(arr.length).assertEqual(1);
          expect(arr.$_get(0)).assertEqual(33);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_6300
         * @tc.name int32ArrayFillPart01TestMindmapTest063
         * @tc.desc Verify single element fill(33,0,1) equals filling whole array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7]);
          arr.fill(33, 0, 1);
          expect(arr.$_get(0)).assertEqual(33);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_6400
         * @tc.name int32ArrayFillPart01TestMindmapTest064
         * @tc.desc Verify single element fill(v,1) start out of range no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7]);
          arr.fill(33, 1, arr.length);
          expect(arr.$_get(0)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_6500
         * @tc.name int32ArrayFillPart01TestMindmapTest065
         * @tc.desc Verify single element fill(v,-1) fills the unique element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7]);
          arr.fill(44, -1, arr.length);
          expect(arr.$_get(0)).assertEqual(44);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_6600
         * @tc.name int32ArrayFillPart01TestMindmapTest066
         * @tc.desc Verify single element fill(v,0,0) empty interval no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7]);
          arr.fill(55, 0, 0);
          expect(arr.$_get(0)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_6700
         * @tc.name int32ArrayFillPart01TestMindmapTest067
         * @tc.desc Verify INT_MAX fill and read back preserves maximum value exactly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          let v: int = 2147483647;
          arr.fill(v);
          expect(arr.$_get(0)).assertEqual(2147483647);
          expect(arr.$_get(1)).assertEqual(2147483647);
          expect(arr.$_get(2)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_6800
         * @tc.name int32ArrayFillPart01TestMindmapTest068
         * @tc.desc Verify INT_MIN fill and read back preserves minimum with correct sign
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          let v: int = -2147483648;
          arr.fill(v);
          expect(arr.$_get(0)).assertEqual(-2147483648);
          expect(arr.$_get(1)).assertEqual(-2147483648);
          expect(arr.$_get(2)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_6900
         * @tc.name int32ArrayFillPart01TestMindmapTest069
         * @tc.desc Verify -1 fill and read back preserves all-ones sign bit value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-1);
          expect(arr.$_get(0)).assertEqual(-1);
          expect(arr.$_get(1)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_7000
         * @tc.name int32ArrayFillPart01TestMindmapTest070
         * @tc.desc Verify zero fill overwrites existing negative values in range
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, -2, -3, -4]);
          arr.fill(0, 1, 3);
          expect(arr.$_get(0)).assertEqual(-1);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
          expect(arr.$_get(3)).assertEqual(-4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_7100
         * @tc.name int32ArrayFillPart01TestMindmapTest071
         * @tc.desc Verify partial INT_MAX fill boundary preserves untouched region
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
          let v: int = 2147483647;
          arr.fill(v, 1, 3);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(2147483647);
          expect(arr.$_get(2)).assertEqual(2147483647);
          expect(arr.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_7200
         * @tc.name int32ArrayFillPart01TestMindmapTest072
         * @tc.desc Verify partial INT_MIN fill boundary correct
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let v: int = -2147483648;
          arr.fill(v, 1, 3);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(-2147483648);
          expect(arr.$_get(2)).assertEqual(-2147483648);
          expect(arr.$_get(3)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_7300
         * @tc.name int32ArrayFillPart01TestMindmapTest073
         * @tc.desc Verify repeated fill same value is idempotent no content change
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 5, 5]);
          arr.fill(5);
          arr.fill(5);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(1)).assertEqual(5);
          expect(arr.$_get(2)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_7400
         * @tc.name int32ArrayFillPart01TestMindmapTest074
         * @tc.desc Verify two chained fills different values latter overrides former range
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill(11).fill(22, 2, arr.length);
          expect(arr.$_get(0)).assertEqual(11);
          expect(arr.$_get(1)).assertEqual(11);
          expect(arr.$_get(2)).assertEqual(22);
          expect(arr.$_get(3)).assertEqual(22);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_7500
         * @tc.name int32ArrayFillPart01TestMindmapTest075
         * @tc.desc Verify shared ArrayBuffer same offset view observes fill writes
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let a1: Int32Array = new Int32Array(buf, 0, 4);
          let a2: Int32Array = new Int32Array(buf, 0, 4);
          a1.fill(42);
          expect(a2.$_get(0)).assertEqual(42);
          expect(a2.$_get(1)).assertEqual(42);
          expect(a2.$_get(2)).assertEqual(42);
          expect(a2.$_get(3)).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_7600
         * @tc.name int32ArrayFillPart01TestMindmapTest076
         * @tc.desc Verify shared ArrayBuffer partial fill seen through second view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let a1: Int32Array = new Int32Array(buf, 0, 4);
          let a2: Int32Array = new Int32Array(buf, 0, 4);
          a1.fill(0);
          a1.fill(77, 1, 3);
          expect(a2.$_get(0)).assertEqual(0);
          expect(a2.$_get(1)).assertEqual(77);
          expect(a2.$_get(2)).assertEqual(77);
          expect(a2.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_7700
         * @tc.name int32ArrayFillPart01TestMindmapTest077
         * @tc.desc Verify fill does not affect disjoint byte range of other view on same buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let a1: Int32Array = new Int32Array(buf, 0, 3);
          let a2: Int32Array = new Int32Array(buf, 12, 3);
          a1.fill(0);
          a2.fill(0);
          a1.fill(111, 0, 3);
          expect(a2.$_get(0)).assertEqual(0);
          expect(a2.$_get(1)).assertEqual(0);
          expect(a2.$_get(2)).assertEqual(0);
          expect(a1.$_get(0)).assertEqual(111);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_7800
         * @tc.name int32ArrayFillPart01TestMindmapTest078
         * @tc.desc Verify fill on offset ArrayBuffer view writes to correct underlying buffer positions
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let a1: Int32Array = new Int32Array(buf, 0, 6);
          let a2: Int32Array = new Int32Array(buf, 8, 3);
          a1.fill(0);
          a2.fill(99);
          expect(a1.$_get(0)).assertEqual(0);
          expect(a1.$_get(1)).assertEqual(0);
          expect(a1.$_get(2)).assertEqual(99);
          expect(a1.$_get(3)).assertEqual(99);
          expect(a1.$_get(4)).assertEqual(99);
          expect(a1.$_get(5)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_7900
         * @tc.name int32ArrayFillPart01TestMindmapTest079
         * @tc.desc Verify fill on subarray subview writes through to original array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
          let sub: Int32Array = arr.subarray(1, 4);
          sub.fill(7);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(7);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(7);
          expect(arr.$_get(4)).assertEqual(0);
          expect(sub.$_get(0)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_8000
         * @tc.name int32ArrayFillPart01TestMindmapTest080
         * @tc.desc Verify after filling single element byte view observes non-zero bytes
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.fill(1);
          let view: Int8Array = new Int8Array(arr.buffer, 0, 4);
          let nonzero: boolean = view.$_get(0) !== 0 || view.$_get(1) !== 0 || view.$_get(2) !== 0 || view.$_get(3) !== 0;
          expect(nonzero).assertTrue();
          expect(arr.$_get(0)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_8100
         * @tc.name int32ArrayFillPart01TestMindmapTest081
         * @tc.desc Verify fill -1 then Uint8Array byte view observes all 0xFF bytes
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.fill(-1);
          let view: Uint8Array = new Uint8Array(arr.buffer, 0, 4);
          expect(view.$_get(0)).assertEqual(255);
          expect(view.$_get(1)).assertEqual(255);
          expect(view.$_get(2)).assertEqual(255);
          expect(view.$_get(3)).assertEqual(255);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART01_TEST_MINDMAP_8200
         * @tc.name int32ArrayFillPart01TestMindmapTest082
         * @tc.desc Verify fill INT_MAX then fill 0 completely overwrites previous value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart01TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          let v: int = 2147483647;
          arr.fill(v);
          arr.fill(0);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });
  });
}
