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
export default function int32ArrayCopyWithinPart05TestMindmapTestTest(): void {
  describe('Int32ArrayCopyWithinPart05TestMindmapTestTest', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_0100
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest001
         * @tc.desc Verify 2 start=0 target 3 end=length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a1: Int32Array = new Int32Array([11, 22, 33, 44, 55]);
          let a2: Int32Array = new Int32Array([11, 22, 33, 44, 55]);
          a1.copyWithin(3, 0);
          a2.copyWithin(3, 0, 5);
          expect(a1.$_get(3)).assertEqual(a2.$_get(3));
          expect(a1.$_get(4)).assertEqual(a2.$_get(4));
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_0200
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest002
         * @tc.desc Verify 2 start=2 end [2,length) target
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9, 10, 11]);
          arr.copyWithin(0, 2);
          expect(arr.$_get(0)).assertEqual(9);
          expect(arr.$_get(1)).assertEqual(10);
          expect(arr.$_get(2)).assertEqual(11);
          expect(arr.$_get(3)).assertEqual(10);
          expect(arr.$_get(4)).assertEqual(11);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_0300
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest003
         * @tc.desc Verify 3 end=start+1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([9, 8, 7, 6]);
          arr.copyWithin(2, 0, 1);
          expect(arr.$_get(2)).assertEqual(9);
          expect(arr.$_get(0)).assertEqual(9);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(3)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_0400
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest004
         * @tc.desc Verify start=2,end=2 empty range no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7, 8]);
          arr.copyWithin(0, 2, 2);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(1)).assertEqual(6);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_0500
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest005
         * @tc.desc Verify 3 end=0 start clamp
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          arr.copyWithin(3, 1, 0);
          expect(arr.$_get(3)).assertEqual(4);
          expect(arr.$_get(4)).assertEqual(5);
          expect(arr.$_get(5)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_0600
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest006
         * @tc.desc Verify 2 start=length no-op part01
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-5, -4, -3, -2, -1, 0]);
          arr.copyWithin(0, 6);
          expect(arr.$_get(0)).assertEqual(-5);
          expect(arr.$_get(5)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_0700
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest007
         * @tc.desc Verify 2 length 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let r: Int32Array = arr.copyWithin(0, 0);
          expect(r).assertEqual(arr);
          expect(r.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_0800
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest008
         * @tc.desc Verify 3 target=0 start=0 end=1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-99]);
          arr.copyWithin(0, 0, 1);
          expect(arr.$_get(0)).assertEqual(-99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_0900
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest009
         * @tc.desc Verify target=2 0/1/length-1 7
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60, 70]);
          arr.copyWithin(2, 5);
          expect(arr.$_get(2)).assertEqual(60);
          expect(arr.$_get(3)).assertEqual(70);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(4)).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_1000
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest010
         * @tc.desc Verify target=length-2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          arr.copyWithin(4, 0, 2);
          expect(arr.$_get(4)).assertEqual(1);
          expect(arr.$_get(5)).assertEqual(2);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_1100
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest011
         * @tc.desc Verify target=2 2 length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([8, 9]);
          arr.copyWithin(2, 0);
          expect(arr.$_get(0)).assertEqual(8);
          expect(arr.$_get(1)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_1200
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest012
         * @tc.desc Verify target=length+2 no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([3, 4, 5]);
          arr.copyWithin(5, 0);
          expect(arr.$_get(0)).assertEqual(3);
          expect(arr.$_get(1)).assertEqual(4);
          expect(arr.$_get(2)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_1300
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest013
         * @tc.desc Verify target=-3 -3 > -length length-3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
          arr.copyWithin(-3, 0, 2);
          expect(arr.$_get(3)).assertEqual(10);
          expect(arr.$_get(4)).assertEqual(20);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(30);
          expect(arr.$_get(5)).assertEqual(60);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_1400
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest014
         * @tc.desc Verify target=-5 6 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([11, 22, 33, 44, 55, 66]);
          arr.copyWithin(1, 3, 5);
          expect(arr.$_get(1)).assertEqual(44);
          expect(arr.$_get(2)).assertEqual(55);
          expect(arr.$_get(0)).assertEqual(11);
          expect(arr.$_get(3)).assertEqual(44);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_1500
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest015
         * @tc.desc Verify target=-(length+2) clamp 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          arr.copyWithin(-5, 1);
          expect(arr.$_get(0)).assertEqual(8);
          expect(arr.$_get(1)).assertEqual(9);
          expect(arr.$_get(2)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_1600
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest016
         * @tc.desc Verify target 0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([21, 22, 23, 24]);
          arr.copyWithin(0, 2);
          expect(arr.$_get(0)).assertEqual(23);
          expect(arr.$_get(1)).assertEqual(24);
          expect(arr.$_get(2)).assertEqual(23);
          expect(arr.$_get(3)).assertEqual(24);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_1700
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest017
         * @tc.desc Verify target 0 0 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([51, 52, 53]);
          arr.copyWithin(0, 1);
          expect(arr.$_get(0)).assertEqual(52);
          expect(arr.$_get(1)).assertEqual(53);
          expect(arr.$_get(2)).assertEqual(53);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_1800
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest018
         * @tc.desc Verify start=2 6 [2,6)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          arr.copyWithin(0, 2);
          expect(arr.$_get(0)).assertEqual(3);
          expect(arr.$_get(1)).assertEqual(4);
          expect(arr.$_get(2)).assertEqual(5);
          expect(arr.$_get(3)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_1900
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest019
         * @tc.desc Verify start=length-2 2 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, -2, -3, -4, -5]);
          arr.copyWithin(0, 3);
          expect(arr.$_get(0)).assertEqual(-4);
          expect(arr.$_get(1)).assertEqual(-5);
          expect(arr.$_get(2)).assertEqual(-3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_2000
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest020
         * @tc.desc Verify start=length+1 clamp length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([6, 7, 8, 9]);
          arr.copyWithin(1, 5);
          expect(arr.$_get(1)).assertEqual(7);
          expect(arr.$_get(2)).assertEqual(8);
          expect(arr.$_get(3)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_2100
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest021
         * @tc.desc Verify start=-3 7 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60, 70]);
          arr.copyWithin(0, -3);
          expect(arr.$_get(0)).assertEqual(50);
          expect(arr.$_get(1)).assertEqual(60);
          expect(arr.$_get(2)).assertEqual(70);
          expect(arr.$_get(3)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_2200
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest022
         * @tc.desc Verify start=-length+1 start=1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([9, 8, 7, 6, 5]);
          arr.copyWithin(2, -4);
          expect(arr.$_get(2)).assertEqual(8);
          expect(arr.$_get(3)).assertEqual(7);
          expect(arr.$_get(4)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_2300
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest023
         * @tc.desc Verify start=-(length+2) clamp 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([4, 5, 6, 7]);
          arr.copyWithin(2, -6);
          expect(arr.$_get(2)).assertEqual(4);
          expect(arr.$_get(3)).assertEqual(5);
          expect(arr.$_get(0)).assertEqual(4);
          expect(arr.$_get(1)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_2400
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest024
         * @tc.desc Verify start 2 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([11, 22, 33, 44, 55]);
          arr.copyWithin(0, 2);
          expect(arr.$_get(0)).assertEqual(33);
          expect(arr.$_get(1)).assertEqual(44);
          expect(arr.$_get(2)).assertEqual(55);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_2500
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest025
         * @tc.desc Verify start -2 -2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          arr.copyWithin(0, -2);
          expect(arr.$_get(0)).assertEqual(40);
          expect(arr.$_get(1)).assertEqual(50);
          expect(arr.$_get(2)).assertEqual(30);
          expect(arr.$_get(3)).assertEqual(40);
          expect(arr.$_get(4)).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_2600
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest026
         * @tc.desc Verify start=length clamps to length producing no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-10, -20, -30, -40]);
          arr.copyWithin(0, arr.length);
          expect(arr.$_get(0)).assertEqual(-10);
          expect(arr.$_get(3)).assertEqual(-40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_2700
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest027
         * @tc.desc Verify end=2 5 [start,2)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(3, 0, 2);
          expect(arr.$_get(3)).assertEqual(1);
          expect(arr.$_get(4)).assertEqual(2);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_2800
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest028
         * @tc.desc Verify end=length-2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([9, 8, 7, 6, 5, 4]);
          arr.copyWithin(3, 0, 4);
          expect(arr.$_get(3)).assertEqual(9);
          expect(arr.$_get(4)).assertEqual(8);
          expect(arr.$_get(5)).assertEqual(7);
          expect(arr.$_get(0)).assertEqual(9);
          expect(arr.$_get(2)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_2900
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest029
         * @tc.desc Verify end=length+3 clamp length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2, 4, 6, 8]);
          arr.copyWithin(1, 0, 7);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(4);
          expect(arr.$_get(3)).assertEqual(6);
          expect(arr.$_get(0)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_3000
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest030
         * @tc.desc Verify end=-3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
          arr.copyWithin(4, 0, -3);
          expect(arr.$_get(4)).assertEqual(10);
          expect(arr.$_get(5)).assertEqual(20);
          expect(arr.$_get(3)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_3100
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest031
         * @tc.desc Verify end=-length+1 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([77, 88, 99, 110]);
          arr.copyWithin(2, 0, -3);
          expect(arr.$_get(2)).assertEqual(77);
          expect(arr.$_get(3)).assertEqual(110);
          expect(arr.$_get(0)).assertEqual(77);
          expect(arr.$_get(1)).assertEqual(88);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_3200
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest032
         * @tc.desc Verify end=-(length+2) clamp 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([3, 6, 9, 12]);
          arr.copyWithin(1, 0, -6);
          expect(arr.$_get(0)).assertEqual(3);
          expect(arr.$_get(1)).assertEqual(6);
          expect(arr.$_get(2)).assertEqual(9);
          expect(arr.$_get(3)).assertEqual(12);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_3300
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest033
         * @tc.desc Verify end 4 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 3, 5, 7, 9, 11]);
          arr.copyWithin(0, 0, 4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(3);
          expect(arr.$_get(2)).assertEqual(5);
          expect(arr.$_get(3)).assertEqual(7);
          expect(arr.$_get(4)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_3400
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest034
         * @tc.desc Verify end -1 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([12, 13, 14, 15, 16]);
          arr.copyWithin(0, 1, -1);
          expect(arr.$_get(0)).assertEqual(13);
          expect(arr.$_get(1)).assertEqual(14);
          expect(arr.$_get(2)).assertEqual(15);
          expect(arr.$_get(3)).assertEqual(15);
          expect(arr.$_get(4)).assertEqual(16);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_3500
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest035
         * @tc.desc Verify end=0 (NaN ToInteger 0) no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, -2, -3, -4]);
          arr.copyWithin(2, 0, 0);
          expect(arr.$_get(2)).assertEqual(-3);
          expect(arr.$_get(3)).assertEqual(-4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_3600
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest036
         * @tc.desc Verify end=0 (NEGATIVE_INFINITY clamp 0) no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([21, 22, 23, 24]);
          arr.copyWithin(1, 0, 0);
          expect(arr.$_get(1)).assertEqual(22);
          expect(arr.$_get(2)).assertEqual(23);
          expect(arr.$_get(3)).assertEqual(24);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_3700
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest037
         * @tc.desc Verify target 0x2 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          arr.copyWithin(0x2, 0, 2);
          expect(arr.$_get(2)).assertEqual(10);
          expect(arr.$_get(3)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_3800
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest038
         * @tc.desc Verify start 0o3 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(0, 0o3);
          expect(arr.$_get(0)).assertEqual(4);
          expect(arr.$_get(1)).assertEqual(5);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_3900
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest039
         * @tc.desc Verify end 0b101 5
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([9, 8, 7, 6, 5, 4]);
          arr.copyWithin(0, 0, 0b101);
          expect(arr.$_get(0)).assertEqual(9);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(6);
          expect(arr.$_get(4)).assertEqual(5);
          expect(arr.$_get(5)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_4000
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest040
         * @tc.desc Verify -0x1 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([100, 200, 300, 400]);
          arr.copyWithin(0, -0x1);
          expect(arr.$_get(0)).assertEqual(400);
          expect(arr.$_get(1)).assertEqual(200);
          expect(arr.$_get(2)).assertEqual(300);
          expect(arr.$_get(3)).assertEqual(400);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_4100
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest041
         * @tc.desc Verify 1 1 target
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7, 8]);
          arr.copyWithin(1, 0, 1);
          expect(arr.$_get(1)).assertEqual(5);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_4200
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest042
         * @tc.desc Verify target>start
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(2, 0, 4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(2);
          expect(arr.$_get(4)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_4300
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest043
         * @tc.desc Verify target<start
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(0, 1, 5);
          expect(arr.$_get(0)).assertEqual(2);
          expect(arr.$_get(1)).assertEqual(3);
          expect(arr.$_get(2)).assertEqual(4);
          expect(arr.$_get(3)).assertEqual(5);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_4400
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest044
         * @tc.desc Verify target=start
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([9, 7, 5, 3, 1]);
          arr.copyWithin(2, 2);
          expect(arr.$_get(0)).assertEqual(9);
          expect(arr.$_get(1)).assertEqual(7);
          expect(arr.$_get(2)).assertEqual(5);
          expect(arr.$_get(3)).assertEqual(3);
          expect(arr.$_get(4)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_4500
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest045
         * @tc.desc Verify target=0,start=1 start target
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(0, 1, 4);
          expect(arr.$_get(0)).assertEqual(20);
          expect(arr.$_get(1)).assertEqual(30);
          expect(arr.$_get(2)).assertEqual(40);
          expect(arr.$_get(3)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_4600
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest046
         * @tc.desc Verify - memmove
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6, 7]);
          arr.copyWithin(0, 2, 6);
          expect(arr.$_get(0)).assertEqual(3);
          expect(arr.$_get(1)).assertEqual(4);
          expect(arr.$_get(2)).assertEqual(5);
          expect(arr.$_get(3)).assertEqual(6);
          expect(arr.$_get(4)).assertEqual(5);
          expect(arr.$_get(5)).assertEqual(6);
          expect(arr.$_get(6)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_4700
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest047
         * @tc.desc Verify target=-2,start=0,end=4 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(-2, 0, 4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_4800
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest048
         * @tc.desc Verify target=0,start=0,end=length 8
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([8, 7, 6, 5, 4, 3, 2, 1]);
          arr.copyWithin(0, 0, 8);
          expect(arr.$_get(0)).assertEqual(8);
          expect(arr.$_get(7)).assertEqual(1);
          expect(arr.length).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_4900
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest049
         * @tc.desc Verify target >=length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(4, 0, 3);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_5000
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest050
         * @tc.desc Verify clamp start 0 start<-length end [0,end)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          arr.copyWithin(2, -99, 4);
          expect(arr.$_get(2)).assertEqual(10);
          expect(arr.$_get(3)).assertEqual(20);
          expect(arr.$_get(4)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_5100
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest051
         * @tc.desc Verify clamp end length end>length target
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(2, 0, 99);
          expect(arr.$_get(2)).assertEqual(10);
          expect(arr.$_get(3)).assertEqual(20);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_5200
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest052
         * @tc.desc Verify clamp start>end start end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(0, 5, -5);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_5300
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest053
         * @tc.desc Verify 0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 7, 8]);
          arr.copyWithin(3, 0, 2);
          expect(arr.$_get(3)).assertEqual(0);
          expect(arr.$_get(4)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_5400
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest054
         * @tc.desc Verify -1 (0xFFFFFFFF)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, 5, 5, 5]);
          arr.copyWithin(1, 0, 2);
          expect(arr.$_get(1)).assertEqual(-1);
          expect(arr.$_get(2)).assertEqual(5);
          expect(arr.$_get(3)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_5500
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest055
         * @tc.desc Verify 2147483647 (INT32_MAX)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 2147483647, 0, 0]);
          arr.copyWithin(2, 1, 2);
          expect(arr.$_get(2)).assertEqual(2147483647);
          expect(arr.$_get(1)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_5600
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest056
         * @tc.desc Verify -2147483648 (INT32_MIN)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, -2147483648, 0]);
          arr.copyWithin(0, 2, 3);
          expect(arr.$_get(0)).assertEqual(-2147483648);
          expect(arr.$_get(2)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_5700
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest057
         * @tc.desc Verify copyWithin with negative values copying range to non-overlapping target index
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-10, -20, -30, 0, 0]);
          arr.copyWithin(3, 0, 2);
          expect(arr.$_get(3)).assertEqual(-10);
          expect(arr.$_get(4)).assertEqual(-20);
          expect(arr.$_get(0)).assertEqual(-10);
          expect(arr.$_get(1)).assertEqual(-20);
          expect(arr.$_get(2)).assertEqual(-30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_5800
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest058
         * @tc.desc Verify copyWithin with mix of positive and negative values copying 3-element range
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, 2, -3, 0, 0, 0]);
          arr.copyWithin(3, 0, 3);
          expect(arr.$_get(3)).assertEqual(-1);
          expect(arr.$_get(4)).assertEqual(2);
          expect(arr.$_get(5)).assertEqual(-3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_5900
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest059
         * @tc.desc Verify 4294967295 -1 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, 7]);
          arr.copyWithin(1, 0, 1);
          expect(arr.$_get(1)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_6000
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest060
         * @tc.desc Verify copyWithin with duplicate values replacing last element with first element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 5, 5, 9]);
          arr.copyWithin(3, 0, 1);
          expect(arr.$_get(3)).assertEqual(5);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(1)).assertEqual(5);
          expect(arr.$_get(2)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_6100
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest061
         * @tc.desc Verify target
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          arr.copyWithin(4, 0, 4);
          expect(arr.$_get(4)).assertEqual(1);
          expect(arr.$_get(5)).assertEqual(2);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_6200
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest062
         * @tc.desc Verify copyWithin copying first two elements to target index 4 leaving earlier elements untouched
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          arr.copyWithin(4, 0, 2);
          expect(arr.$_get(4)).assertEqual(1);
          expect(arr.$_get(5)).assertEqual(2);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_6300
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest063
         * @tc.desc Verify target <
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          arr.copyWithin(-3, 0, 5);
          expect(arr.$_get(2)).assertEqual(10);
          expect(arr.$_get(3)).assertEqual(20);
          expect(arr.$_get(4)).assertEqual(30);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_6400
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest064
         * @tc.desc Verify target=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([9, 9, 1, 2, 3, 4]);
          arr.copyWithin(0, 2, 4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(2);
          expect(arr.$_get(4)).assertEqual(3);
          expect(arr.$_get(5)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_6500
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest065
         * @tc.desc Verify this fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let r: Int32Array = arr.copyWithin(2, 0, 2).fill(0, 0, 1);
          expect(r).assertEqual(arr);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_6600
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest066
         * @tc.desc Verify this reverse mutating
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          arr.copyWithin(3, 0, 3).reverse();
          expect(arr.$_get(0)).assertEqual(3);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(3);
          expect(arr.$_get(4)).assertEqual(2);
          expect(arr.$_get(5)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_6700
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest067
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          arr.copyWithin(0, 3).copyWithin(3, 0, 2);
          expect(arr.$_get(0)).assertEqual(40);
          expect(arr.$_get(1)).assertEqual(50);
          expect(arr.$_get(2)).assertEqual(30);
          expect(arr.$_get(3)).assertEqual(40);
          expect(arr.$_get(4)).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_6800
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest068
         * @tc.desc Verify copyWithin buffer byteOffset 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(1, 0);
          expect(arr.byteOffset).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_6900
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest069
         * @tc.desc Verify copyWithin length 7
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 6, 5, 4, 3, 2, 1]);
          arr.copyWithin(2, 0);
          expect(arr.length).assertEqual(7);
          expect(arr.byteLength).assertEqual(28);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_7000
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest070
         * @tc.desc Verify subarray copyWithin buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          let sub: Int32Array = base.subarray(1, 5);
          sub.copyWithin(1, 0, 2);
          expect(base.$_get(1)).assertEqual(2);
          expect(base.$_get(2)).assertEqual(2);
          expect(base.$_get(3)).assertEqual(3);
          expect(base.$_get(4)).assertEqual(5);
          expect(base.$_get(5)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_7100
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest071
         * @tc.desc Verify start/end/target target start end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.copyWithin(99999999, -99999999, 99999999);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_7200
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest072
         * @tc.desc Verify copyWithin with extreme out-of-bounds indices on single-element array leaves array unchanged
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([42]);
          arr.copyWithin(-99, 99, -99);
          expect(arr.$_get(0)).assertEqual(42);
          expect(arr.length).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_7300
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest073
         * @tc.desc Verify length 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          arr.copyWithin(100, -100, 200);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_7400
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest074
         * @tc.desc Verify target=0,start=0,end=0 (NaN -> 0) no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([11, 22, 33]);
          arr.copyWithin(0, 0, 0);
          expect(arr.$_get(0)).assertEqual(11);
          expect(arr.$_get(1)).assertEqual(22);
          expect(arr.$_get(2)).assertEqual(33);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_7500
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest075
         * @tc.desc Verify target=0,start=arr.length,end=0 (POSITIVE_INFINITY/NEGATIVE_INFINITY clamp) no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7, 8]);
          arr.copyWithin(0, arr.length, 0);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(3)).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_7600
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest076
         * @tc.desc Verify target=arr.length (2147483648 clamp length) no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(arr.length, 0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_7700
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest077
         * @tc.desc Verify end=arr.length (2147483649 clamp length)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          arr.copyWithin(1, 0, arr.length);
          expect(arr.$_get(1)).assertEqual(10);
          expect(arr.$_get(2)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_7800
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest078
         * @tc.desc Verify target=0,start=1 (-2147483649 clamp 0)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([4, 5, 6]);
          arr.copyWithin(0, 1);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(1)).assertEqual(6);
          expect(arr.$_get(2)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_7900
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest079
         * @tc.desc Verify start=arr.length (4294967295 clamp length) no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9]);
          arr.copyWithin(0, arr.length);
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(2)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_8000
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest080
         * @tc.desc Verify end=arr.length (4294967296 clamp length)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 3, 5]);
          arr.copyWithin(1, 0, arr.length);
          expect(arr.$_get(1)).assertEqual(1);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(0)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_8100
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest081
         * @tc.desc Verify target -0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(0, 2, 4);
          expect(arr.$_get(0)).assertEqual(30);
          expect(arr.$_get(1)).assertEqual(40);
          expect(arr.$_get(2)).assertEqual(30);
          expect(arr.$_get(3)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_8200
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest082
         * @tc.desc Verify start=0 (-0 -> 0)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([22, 33, 44]);
          arr.copyWithin(2, 0, 1);
          expect(arr.$_get(2)).assertEqual(22);
          expect(arr.$_get(0)).assertEqual(22);
          expect(arr.$_get(1)).assertEqual(33);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_8300
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest083
         * @tc.desc Verify 0 target 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(0, 3);
          expect(arr.$_get(0)).assertEqual(4);
          expect(arr.$_get(1)).assertEqual(5);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_8400
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest084
         * @tc.desc Verify -3 start -3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
          arr.copyWithin(0, -3);
          expect(arr.$_get(0)).assertEqual(40);
          expect(arr.$_get(1)).assertEqual(50);
          expect(arr.$_get(2)).assertEqual(60);
          expect(arr.$_get(3)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_8500
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest085
         * @tc.desc Verify ToInt32
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 2147483647, -2147483648, -1, 0, 0]);
          arr.copyWithin(4, 0, 4);
          expect(arr.$_get(4)).assertEqual(0);
          expect(arr.$_get(5)).assertEqual(2147483647);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(2147483647);
          expect(arr.$_get(2)).assertEqual(-2147483648);
          expect(arr.$_get(3)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_8600
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest086
         * @tc.desc Verify 7 target=3 start=0 end=4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6, 7]);
          arr.copyWithin(3, 0, 4);
          expect(arr.$_get(3)).assertEqual(1);
          expect(arr.$_get(4)).assertEqual(2);
          expect(arr.$_get(5)).assertEqual(3);
          expect(arr.$_get(6)).assertEqual(4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_8700
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest087
         * @tc.desc Verify 8 target=0 start=4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60, 70, 80]);
          arr.copyWithin(0, 4);
          expect(arr.$_get(0)).assertEqual(50);
          expect(arr.$_get(1)).assertEqual(60);
          expect(arr.$_get(2)).assertEqual(70);
          expect(arr.$_get(3)).assertEqual(80);
          expect(arr.$_get(4)).assertEqual(50);
          expect(arr.$_get(7)).assertEqual(80);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_8800
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest088
         * @tc.desc Verify 9 target=5 start=1 end=4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6, 7, 8, 9]);
          arr.copyWithin(5, 1, 4);
          expect(arr.$_get(5)).assertEqual(2);
          expect(arr.$_get(6)).assertEqual(3);
          expect(arr.$_get(7)).assertEqual(4);
          expect(arr.$_get(8)).assertEqual(9);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_8900
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest089
         * @tc.desc Verify 7 target=-5 start=-5 end=-2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, -2, -3, -4, -5, -6, -7]);
          arr.copyWithin(-5, -5, -2);
          expect(arr.$_get(2)).assertEqual(-3);
          expect(arr.$_get(3)).assertEqual(-4);
          expect(arr.$_get(4)).assertEqual(-5);
          expect(arr.$_get(0)).assertEqual(-1);
          expect(arr.$_get(1)).assertEqual(-2);
          expect(arr.$_get(5)).assertEqual(-6);
          expect(arr.$_get(6)).assertEqual(-7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_9000
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest090
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, -2, -3, -4]);
          arr.copyWithin(2, 0, 2);
          expect(arr.$_get(2)).assertEqual(-1);
          expect(arr.$_get(3)).assertEqual(-2);
          expect(arr.$_get(0)).assertEqual(-1);
          expect(arr.$_get(1)).assertEqual(-2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_9100
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest091
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 1, 2, 3, 4]);
          arr.copyWithin(0, 2, 5);
          expect(arr.$_get(0)).assertEqual(2);
          expect(arr.$_get(1)).assertEqual(3);
          expect(arr.$_get(2)).assertEqual(4);
          expect(arr.$_get(3)).assertEqual(3);
          expect(arr.$_get(4)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_9200
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest092
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([4, 3, 2, 1, 0]);
          arr.copyWithin(2, 0, 3);
          expect(arr.$_get(2)).assertEqual(4);
          expect(arr.$_get(3)).assertEqual(3);
          expect(arr.$_get(4)).assertEqual(2);
          expect(arr.$_get(0)).assertEqual(4);
          expect(arr.$_get(1)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART05_TEST_MINDMAP_9300
         * @tc.name int32ArrayCopyWithinPart05TestMindmapTest093
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart05TestMindmapTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([99, 0, 0, 0, 0]);
          arr.copyWithin(1, 0, 1).copyWithin(2, 1, 2).copyWithin(3, 2, 3).copyWithin(4, 3, 4);
          expect(arr.$_get(0)).assertEqual(99);
          expect(arr.$_get(1)).assertEqual(99);
          expect(arr.$_get(2)).assertEqual(99);
          expect(arr.$_get(3)).assertEqual(99);
          expect(arr.$_get(4)).assertEqual(99);
        });
  });
}
