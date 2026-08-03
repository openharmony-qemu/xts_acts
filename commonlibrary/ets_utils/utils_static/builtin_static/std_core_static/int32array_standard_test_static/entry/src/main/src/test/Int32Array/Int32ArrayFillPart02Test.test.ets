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
export default function int32ArrayFillPart02Test(): void {
  describe('Int32ArrayFillPart02Test', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_0100
         * @tc.name int32ArrayFillPart02TestMindmapTest001
         * @tc.desc Verify number value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          let ret: Int32Array = arr.fill(7.0);
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(1)).assertEqual(7);
          expect(arr.$_get(2)).assertEqual(7);
          expect(ret.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_0200
         * @tc.name int32ArrayFillPart02TestMindmapTest002
         * @tc.desc Verify number value start value start
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      arr.fill(5, 1, arr.length);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(5);
          expect(arr.$_get(2)).assertEqual(5);
          expect(arr.$_get(3)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_0300
         * @tc.name int32ArrayFillPart02TestMindmapTest003
         * @tc.desc Verify number value start end value [start,end)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          arr.fill(8.0, 1, 4);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(2)).assertEqual(8);
          expect(arr.$_get(3)).assertEqual(8);
          expect(arr.$_get(4)).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_0400
         * @tc.name int32ArrayFillPart02TestMindmapTest004
         * @tc.desc Verify number fill this
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          let ret: Int32Array = arr.fill(2);
          expect(ret).assertEqual(arr);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_0500
         * @tc.name int32ArrayFillPart02TestMindmapTest005
         * @tc.desc Verify number length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill(3);
          expect(arr.length).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_0600
         * @tc.name int32ArrayFillPart02TestMindmapTest006
         * @tc.desc Verify value Number.NaN(number) ToInt32 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 7, 7]);
          arr.fill(Double.NaN);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_0700
         * @tc.name int32ArrayFillPart02TestMindmapTest007
         * @tc.desc Verify value +Number.POSITIVE_INFINITY(number) ToInt32 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(Double.POSITIVE_INFINITY);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_0800
         * @tc.name int32ArrayFillPart02TestMindmapTest008
         * @tc.desc Verify value Double.NEGATIVE_INFINITY(number) ToInt32 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(Double.NEGATIVE_INFINITY);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_0900
         * @tc.name int32ArrayFillPart02TestMindmapTest009
         * @tc.desc Verify value 0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(0);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_1000
         * @tc.name int32ArrayFillPart02TestMindmapTest010
         * @tc.desc Verify value -0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(-0);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_1100
         * @tc.name int32ArrayFillPart02TestMindmapTest011
         * @tc.desc Verify value -0 0 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-0);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_1200
         * @tc.name int32ArrayFillPart02TestMindmapTest012
         * @tc.desc Verify value 3.7 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(3.7);
          expect(arr.$_get(0)).assertEqual(3);
          expect(arr.$_get(1)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_1300
         * @tc.name int32ArrayFillPart02TestMindmapTest013
         * @tc.desc Verify value -2.3 -2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-2.3);
          expect(arr.$_get(0)).assertEqual(-2);
          expect(arr.$_get(1)).assertEqual(-2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_1400
         * @tc.name int32ArrayFillPart02TestMindmapTest014
         * @tc.desc Verify value 0.999999 0 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(0.999999);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_1500
         * @tc.name int32ArrayFillPart02TestMindmapTest015
         * @tc.desc Verify value -0.999999 0 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-0.999999);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_1600
         * @tc.name int32ArrayFillPart02TestMindmapTest016
         * @tc.desc Verify value 1.999999 1 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(1.999999);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_1700
         * @tc.name int32ArrayFillPart02TestMindmapTest017
         * @tc.desc Verify value -1.999999 -1 -2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-1.999999);
          expect(arr.$_get(0)).assertEqual(-1);
          expect(arr.$_get(1)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_1800
         * @tc.name int32ArrayFillPart02TestMindmapTest018
         * @tc.desc Verify value INT_MAX+0 2147483647.9 2147483647
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(2147483647.9);
          expect(arr.$_get(0)).assertEqual(2147483647);
          expect(arr.$_get(1)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_1900
         * @tc.name int32ArrayFillPart02TestMindmapTest019
         * @tc.desc Verify value -2147483648.9 -2147483648
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-2147483648.9);
          expect(arr.$_get(0)).assertEqual(-2147483648);
          expect(arr.$_get(1)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_2000
         * @tc.name int32ArrayFillPart02TestMindmapTest020
         * @tc.desc Verify value 1.5e3(1500.0) 1500
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(1.5e3);
          expect(arr.$_get(0)).assertEqual(1500);
          expect(arr.$_get(1)).assertEqual(1500);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_2100
         * @tc.name int32ArrayFillPart02TestMindmapTest021
         * @tc.desc Verify value 2.5e2(250.0) 250
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(2.5e2);
          expect(arr.$_get(0)).assertEqual(250);
          expect(arr.$_get(1)).assertEqual(250);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_2200
         * @tc.name int32ArrayFillPart02TestMindmapTest022
         * @tc.desc Verify value -3.2e2(-320.0) -320
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-3.2e2);
          expect(arr.$_get(0)).assertEqual(-320);
          expect(arr.$_get(1)).assertEqual(-320);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_2300
         * @tc.name int32ArrayFillPart02TestMindmapTest023
         * @tc.desc Verify fill(-1) sets all elements to -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 5, 5, 5]);
          arr.fill(-1);
          expect(arr.$_get(0)).assertEqual(-1);
          expect(arr.$_get(1)).assertEqual(-1);
          expect(arr.$_get(2)).assertEqual(-1);
          expect(arr.$_get(3)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_2400
         * @tc.name int32ArrayFillPart02TestMindmapTest024
         * @tc.desc Verify value 2147483648.0(MAX+1) INT_MIN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(2147483648.0);
          expect(arr.$_get(0)).assertEqual(-2147483648);
          expect(arr.$_get(1)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_2500
         * @tc.name int32ArrayFillPart02TestMindmapTest025
         * @tc.desc Verify value 2147483649.0(MAX+2) INT_MIN+1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(2147483649.0);
          expect(arr.$_get(0)).assertEqual(-2147483647);
          expect(arr.$_get(1)).assertEqual(-2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_2600
         * @tc.name int32ArrayFillPart02TestMindmapTest026
         * @tc.desc Verify value -2147483649.0(MIN-1) INT_MAX
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-2147483649.0);
          expect(arr.$_get(0)).assertEqual(2147483647);
          expect(arr.$_get(1)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_2700
         * @tc.name int32ArrayFillPart02TestMindmapTest027
         * @tc.desc Verify value -2147483650.0(MIN-2) INT_MAX-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-2147483650.0);
          expect(arr.$_get(0)).assertEqual(2147483646);
          expect(arr.$_get(1)).assertEqual(2147483646);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_2800
         * @tc.name int32ArrayFillPart02TestMindmapTest028
         * @tc.desc Verify value 4294967295.0(2^32-1) -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(4294967295.0);
          expect(arr.$_get(0)).assertEqual(-1);
          expect(arr.$_get(1)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_2900
         * @tc.name int32ArrayFillPart02TestMindmapTest029
         * @tc.desc Verify value 4294967296.0(2^32) 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(4294967296.0);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_3000
         * @tc.name int32ArrayFillPart02TestMindmapTest030
         * @tc.desc Verify value 4294967297.0(2^32+1) 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(4294967297.0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_3100
         * @tc.name int32ArrayFillPart02TestMindmapTest031
         * @tc.desc Verify value -4294967296.0(-2^32) 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-4294967296.0);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_3200
         * @tc.name int32ArrayFillPart02TestMindmapTest032
         * @tc.desc Verify value 4.294967295e9(2^32-1) -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(4.294967295e9);
          expect(arr.$_get(0)).assertEqual(-1);
          expect(arr.$_get(1)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_3300
         * @tc.name int32ArrayFillPart02TestMindmapTest033
         * @tc.desc Verify value -4.294967295e9(-(2^32-1)) 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-4.294967295e9);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_3400
         * @tc.name int32ArrayFillPart02TestMindmapTest034
         * @tc.desc Verify value 32767.5(Int16_MAX+0) 32767
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(32767.5);
          expect(arr.$_get(0)).assertEqual(32767);
          expect(arr.$_get(1)).assertEqual(32767);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_3500
         * @tc.name int32ArrayFillPart02TestMindmapTest035
         * @tc.desc Verify value -32768.5(-Int16_MIN-0) -32768
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-32768.5);
          expect(arr.$_get(0)).assertEqual(-32768);
          expect(arr.$_get(1)).assertEqual(-32768);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_3600
         * @tc.name int32ArrayFillPart02TestMindmapTest036
         * @tc.desc Verify value 1073741823.5(2^30-0) 1073741823
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(1073741823.5);
          expect(arr.$_get(0)).assertEqual(1073741823);
          expect(arr.$_get(1)).assertEqual(1073741823);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_3700
         * @tc.name int32ArrayFillPart02TestMindmapTest037
         * @tc.desc Verify value -1073741824.5(-2^30-0) -1073741824
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-1073741824.5);
          expect(arr.$_get(0)).assertEqual(-1073741824);
          expect(arr.$_get(1)).assertEqual(-1073741824);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_3800
         * @tc.name int32ArrayFillPart02TestMindmapTest038
         * @tc.desc Verify value 0.0001 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(0.0001);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_3900
         * @tc.name int32ArrayFillPart02TestMindmapTest039
         * @tc.desc Verify value -0.0001 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-0.0001);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_4000
         * @tc.name int32ArrayFillPart02TestMindmapTest040
         * @tc.desc Verify start=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(7.0, 0, arr.length);
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(1)).assertEqual(7);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_4100
         * @tc.name int32ArrayFillPart02TestMindmapTest041
         * @tc.desc Verify start=-1( )
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(8.0, -1, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_4200
         * @tc.name int32ArrayFillPart02TestMindmapTest042
         * @tc.desc Verify start=-length( -4 4 ) 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(6.0, -4, arr.length);
          expect(arr.$_get(0)).assertEqual(6);
          expect(arr.$_get(1)).assertEqual(6);
          expect(arr.$_get(2)).assertEqual(6);
          expect(arr.$_get(3)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_4300
         * @tc.name int32ArrayFillPart02TestMindmapTest043
         * @tc.desc Verify start=-(length+1) -length 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.fill(4, -5, arr.length);
          expect(arr.$_get(0)).assertEqual(4);
          expect(arr.$_get(1)).assertEqual(4);
          expect(arr.$_get(2)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_4400
         * @tc.name int32ArrayFillPart02TestMindmapTest044
         * @tc.desc Verify start=length( ) no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.fill(9.0, 3, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_4500
         * @tc.name int32ArrayFillPart02TestMindmapTest045
         * @tc.desc Verify start length+100 clamp length no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.fill(9.0, 103, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_4600
         * @tc.name int32ArrayFillPart02TestMindmapTest046
         * @tc.desc Verify start=length-1( )
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(5, 3, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_4700
         * @tc.name int32ArrayFillPart02TestMindmapTest047
         * @tc.desc Verify start=-2( )
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(7.0, -2, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_4800
         * @tc.name int32ArrayFillPart02TestMindmapTest048
         * @tc.desc Verify start=-1000 clamp 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.fill(4, -1000, arr.length);
          expect(arr.$_get(0)).assertEqual(4);
          expect(arr.$_get(1)).assertEqual(4);
          expect(arr.$_get(2)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_4900
         * @tc.name int32ArrayFillPart02TestMindmapTest049
         * @tc.desc Verify fill partial range from index 1 to 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(9, 1, 3);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(9);
          expect(arr.$_get(2)).assertEqual(9);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_5000
         * @tc.name int32ArrayFillPart02TestMindmapTest050
         * @tc.desc Verify end length( 99) clamp length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(6.0, 0, 99);
          expect(arr.$_get(0)).assertEqual(6);
          expect(arr.$_get(1)).assertEqual(6);
          expect(arr.$_get(2)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_5100
         * @tc.name int32ArrayFillPart02TestMindmapTest051
         * @tc.desc Verify end=0 start>=end no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(9.0, 0, 0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_5200
         * @tc.name int32ArrayFillPart02TestMindmapTest052
         * @tc.desc Verify end=-1( )
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(5, 0, -1);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(1)).assertEqual(5);
          expect(arr.$_get(2)).assertEqual(5);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_5300
         * @tc.name int32ArrayFillPart02TestMindmapTest053
         * @tc.desc Verify end=-length( 0) start=0 no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(8.0, 0, -4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_5400
         * @tc.name int32ArrayFillPart02TestMindmapTest054
         * @tc.desc Verify end -length( -10) 0 no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(9.0, 0, -10);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_5500
         * @tc.name int32ArrayFillPart02TestMindmapTest055
         * @tc.desc Verify end=-2( )
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(7.0, 0, -2);
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(1)).assertEqual(7);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_5600
         * @tc.name int32ArrayFillPart02TestMindmapTest056
         * @tc.desc Verify end=1( )
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(6.0, 0, 1);
          expect(arr.$_get(0)).assertEqual(6);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_5700
         * @tc.name int32ArrayFillPart02TestMindmapTest057
         * @tc.desc Verify end=-1000 clamp 0 no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.fill(7.0, 0, -1000);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_5800
         * @tc.name int32ArrayFillPart02TestMindmapTest058
         * @tc.desc Verify start end( 2) no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(9.0, 2, 2);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_5900
         * @tc.name int32ArrayFillPart02TestMindmapTest059
         * @tc.desc Verify start end(3>1) start>=end no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(9.0, 3, 1);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_6000
         * @tc.name int32ArrayFillPart02TestMindmapTest060
         * @tc.desc Verify start=-1 end(3>2) no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(9.0, -1, 2);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_6100
         * @tc.name int32ArrayFillPart02TestMindmapTest061
         * @tc.desc Verify start=-3 end=-1 [1,3)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(8.0, -3, -1);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(2)).assertEqual(8);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_6200
         * @tc.name int32ArrayFillPart02TestMindmapTest062
         * @tc.desc Verify start=-2 end=-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(7.0, -2, -1);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_6300
         * @tc.name int32ArrayFillPart02TestMindmapTest063
         * @tc.desc Verify start=-3 end=4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.fill(0, -3, 4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(0);
          expect(arr.$_get(3)).assertEqual(0);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_6400
         * @tc.name int32ArrayFillPart02TestMindmapTest064
         * @tc.desc Verify start=1 end=length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.fill(6.0, 1, 4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(6);
          expect(arr.$_get(2)).assertEqual(6);
          expect(arr.$_get(3)).assertEqual(6);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_6500
         * @tc.name int32ArrayFillPart02TestMindmapTest065
         * @tc.desc Verify start=1 end=length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.fill(3, 1, 4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(3);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_6600
         * @tc.name int32ArrayFillPart02TestMindmapTest066
         * @tc.desc Verify number fill Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          let ret: Int32Array = arr.fill(1);
          expect(ret).assertEqual(arr);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_6700
         * @tc.name int32ArrayFillPart02TestMindmapTest067
         * @tc.desc Verify number fill byteLength
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          let before: number = arr.byteLength;
          arr.fill(7.5);
          expect(arr.byteLength).assertEqual(before);
          expect(before).assertEqual(16);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_6800
         * @tc.name int32ArrayFillPart02TestMindmapTest068
         * @tc.desc Verify number fill byteOffset
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let arr: Int32Array = new Int32Array(buf, 4, 4);
          let offBefore: number = arr.byteOffset;
          arr.fill(2);
          expect(arr.byteOffset).assertEqual(offBefore);
          expect(offBefore).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_6900
         * @tc.name int32ArrayFillPart02TestMindmapTest069
         * @tc.desc Verify number fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
      arr.fill(1).fill(2, 2, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(1);
          expect(arr.$_get(2)).assertEqual(2);
          expect(arr.$_get(3)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_7000
         * @tc.name int32ArrayFillPart02TestMindmapTest070
         * @tc.desc Verify fill buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(12);
          let arr: Int32Array = new Int32Array(buf, 0, 3);
          let bufBefore: ArrayBuffer = arr.buffer;
          arr.fill(1);
          expect(arr.buffer).assertEqual(bufBefore);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_7100
         * @tc.name int32ArrayFillPart02TestMindmapTest071
         * @tc.desc Verify length=0 fill number this length 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let ret: Int32Array = arr.fill(5);
          expect(ret).assertEqual(arr);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_7200
         * @tc.name int32ArrayFillPart02TestMindmapTest072
         * @tc.desc Verify fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(1);
          arr.fill(42.5);
          expect(arr.$_get(0)).assertEqual(42);
          expect(arr.length).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_7300
         * @tc.name int32ArrayFillPart02TestMindmapTest073
         * @tc.desc Verify start=1 fill no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7]);
      arr.fill(9.0, 1, arr.length);
          expect(arr.$_get(0)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_7400
         * @tc.name int32ArrayFillPart02TestMindmapTest074
         * @tc.desc Verify fill start/end no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          arr.fill(3, 0, 0);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_7500
         * @tc.name int32ArrayFillPart02TestMindmapTest075
         * @tc.desc Verify fill(INT_MAX) sets all elements to 2147483647
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(2147483647);
          expect(arr.$_get(0)).assertEqual(2147483647);
          expect(arr.$_get(1)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_7600
         * @tc.name int32ArrayFillPart02TestMindmapTest076
         * @tc.desc Verify value -1(number)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0]);
          arr.fill(-1);
          expect(arr.$_get(0)).assertEqual(-1);
          expect(arr.$_get(1)).assertEqual(-1);
          expect(arr.$_get(2)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_7700
         * @tc.name int32ArrayFillPart02TestMindmapTest077
         * @tc.desc Verify value 2147483647.0(INT_MAX )
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(2147483647.0);
          expect(arr.$_get(0)).assertEqual(2147483647);
          expect(arr.$_get(1)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_7800
         * @tc.name int32ArrayFillPart02TestMindmapTest078
         * @tc.desc Verify value -2147483648.0(INT_MIN )
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(-2147483648.0);
          expect(arr.$_get(0)).assertEqual(-2147483648);
          expect(arr.$_get(1)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_7900
         * @tc.name int32ArrayFillPart02TestMindmapTest079
         * @tc.desc Verify fill 2147483648.0 fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(2147483648.0);
          arr.fill(0);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_8000
         * @tc.name int32ArrayFillPart02TestMindmapTest080
         * @tc.desc Verify fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
          arr.fill(3, 1, 4);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(3);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(3);
          expect(arr.$_get(4)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_8100
         * @tc.name int32ArrayFillPart02TestMindmapTest081
         * @tc.desc Verify fill Number.NaN 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 5, 5, 5, 5]);
          arr.fill(Double.NaN, 1, 4);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
          expect(arr.$_get(3)).assertEqual(0);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_8200
         * @tc.name int32ArrayFillPart02TestMindmapTest082
         * @tc.desc Verify number fill buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf);
          let b: Int32Array = new Int32Array(buf);
          a.fill(7.0);
          expect(b.$_get(0)).assertEqual(7);
          expect(b.$_get(1)).assertEqual(7);
          expect(b.$_get(2)).assertEqual(7);
          expect(b.$_get(3)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_8300
         * @tc.name int32ArrayFillPart02TestMindmapTest083
         * @tc.desc Verify number fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let a: Int32Array = new Int32Array(buf);
          let b: Int32Array = new Int32Array(buf);
          a.fill(0);
          a.fill(11.0, 1, 3);
          expect(b.$_get(0)).assertEqual(0);
          expect(b.$_get(1)).assertEqual(11);
          expect(b.$_get(2)).assertEqual(11);
          expect(b.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_8400
         * @tc.name int32ArrayFillPart02TestMindmapTest084
         * @tc.desc Verify fill number 2147483648.0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(8);
          let a: Int32Array = new Int32Array(buf);
          let b: Int32Array = new Int32Array(buf);
          a.fill(2147483648.0);
          expect(b.$_get(0)).assertEqual(-2147483648);
          expect(b.$_get(1)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_8500
         * @tc.name int32ArrayFillPart02TestMindmapTest085
         * @tc.desc Verify fill Number.NaN( 0) buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let a: Int32Array = new Int32Array(buf, 4, 4);
          let b: Int32Array = new Int32Array(buf);
          b.fill(1);
          a.fill(Double.NaN);
          expect(b.$_get(0)).assertEqual(1);
          expect(b.$_get(1)).assertEqual(0);
          expect(b.$_get(2)).assertEqual(0);
          expect(b.$_get(3)).assertEqual(0);
          expect(b.$_get(4)).assertEqual(0);
          expect(b.$_get(5)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_8600
         * @tc.name int32ArrayFillPart02TestMindmapTest086
         * @tc.desc Verify fill buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let a: Int32Array = new Int32Array(buf, 4, 4);
          let b: Int32Array = new Int32Array(buf);
          b.fill(1);
          a.fill(99.9, 1, 3);
          expect(b.$_get(0)).assertEqual(1);
          expect(b.$_get(1)).assertEqual(1);
          expect(b.$_get(2)).assertEqual(99);
          expect(b.$_get(3)).assertEqual(99);
          expect(b.$_get(4)).assertEqual(1);
          expect(b.$_get(5)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_8700
         * @tc.name int32ArrayFillPart02TestMindmapTest087
         * @tc.desc Verify fill 0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(12);
          let a: Int32Array = new Int32Array(buf);
          let b: Int32Array = new Int32Array(buf);
          a.fill(5);
          a.fill(0);
          expect(b.$_get(0)).assertEqual(0);
          expect(b.$_get(1)).assertEqual(0);
          expect(b.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_8800
         * @tc.name int32ArrayFillPart02TestMindmapTest088
         * @tc.desc Verify fill -0 0 0 -0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(8);
          let a: Int32Array = new Int32Array(buf);
          let b: Int32Array = new Int32Array(buf);
          a.fill(-0);
          expect(b.$_get(0)).assertEqual(0);
          expect(b.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_8900
         * @tc.name int32ArrayFillPart02TestMindmapTest089
         * @tc.desc Verify subarray fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let sub: Int32Array = parent.subarray(1, 4);
          sub.fill(0);
          expect(parent.$_get(0)).assertEqual(1);
          expect(parent.$_get(1)).assertEqual(0);
          expect(parent.$_get(2)).assertEqual(0);
          expect(parent.$_get(3)).assertEqual(0);
          expect(parent.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_9000
         * @tc.name int32ArrayFillPart02TestMindmapTest090
         * @tc.desc Verify fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(20);
          let a: Int32Array = new Int32Array(buf);
          let b: Int32Array = new Int32Array(buf);
      a.fill(1).fill(2, 0, 2).fill(3, 3, a.length);
          expect(b.$_get(0)).assertEqual(2);
          expect(b.$_get(1)).assertEqual(2);
          expect(b.$_get(2)).assertEqual(1);
          expect(b.$_get(3)).assertEqual(3);
          expect(b.$_get(4)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_9100
         * @tc.name int32ArrayFillPart02TestMindmapTest091
         * @tc.desc Verify number start/end(100/200) clamp
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(2, 100, 200);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_9200
         * @tc.name int32ArrayFillPart02TestMindmapTest092
         * @tc.desc Verify number start/end(-100/-200) clamp 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(3, -100, -200);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_9300
         * @tc.name int32ArrayFillPart02TestMindmapTest093
         * @tc.desc Verify fill Number.NaN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          arr.fill(Double.NaN);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_9400
         * @tc.name int32ArrayFillPart02TestMindmapTest094
         * @tc.desc Verify start=2147483647 number
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.fill(9.0, 2147483647, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_9500
         * @tc.name int32ArrayFillPart02TestMindmapTest095
         * @tc.desc Verify start=-2147483648 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.fill(4.5, -2147483648, arr.length);
          expect(arr.$_get(0)).assertEqual(4);
          expect(arr.$_get(1)).assertEqual(4);
          expect(arr.$_get(2)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_9600
         * @tc.name int32ArrayFillPart02TestMindmapTest096
         * @tc.desc Verify fill on view constructed with out-of-range byteOffset throws RangeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let emptyBuf: ArrayBuffer = new ArrayBuffer(0);
          try {
            let bad: Int32Array = new Int32Array(emptyBuf, 4, 1);
            bad.fill(5);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_9700
         * @tc.name int32ArrayFillPart02TestMindmapTest097
         * @tc.desc Verify fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(1);
          arr.fill(2);
          expect(arr.$_get(0)).assertEqual(2);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART02_TEST_MINDMAP_9800
         * @tc.name int32ArrayFillPart02TestMindmapTest098
         * @tc.desc Verify fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart02TestMindmapTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(5);
          arr.fill(1);
          arr.fill(2, 1, 4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(2);
          expect(arr.$_get(3)).assertEqual(2);
          expect(arr.$_get(4)).assertEqual(1);
        });
  });
}
