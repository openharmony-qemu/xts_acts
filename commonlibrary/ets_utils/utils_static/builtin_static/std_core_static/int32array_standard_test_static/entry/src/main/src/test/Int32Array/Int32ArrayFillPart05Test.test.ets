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
export default function int32ArrayFillPart05Test(): void {
  describe('Int32ArrayFillPart05Test', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_0100
         * @tc.name int32ArrayFillPart05TestMindmapTest001
         * @tc.desc Verify single-arg fill covers all elements on copy-constructed array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(11, 22, 33, 44);
          let arr: Int32Array = new Int32Array(src);
          arr.fill(77);
          expect(arr.$_get(0)).assertEqual(77);
          expect(arr.$_get(1)).assertEqual(77);
          expect(arr.$_get(2)).assertEqual(77);
          expect(arr.$_get(3)).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_0200
         * @tc.name int32ArrayFillPart05TestMindmapTest002
         * @tc.desc Verify fill on copy-constructed array does not affect source buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let arr: Int32Array = new Int32Array(src);
          arr.fill(99);
          expect(src.$_get(0)).assertEqual(1);
          expect(src.$_get(1)).assertEqual(2);
          expect(src.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_0300
         * @tc.name int32ArrayFillPart05TestMindmapTest003
         * @tc.desc Verify single-arg fill on length-7 new Int32Array sets tail element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(7);
          arr.fill((-5));
          expect(arr.$_get(6)).assertEqual((-5));
          expect(arr.length).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_0400
         * @tc.name int32ArrayFillPart05TestMindmapTest004
         * @tc.desc Verify two-arg fill(start=1) fills from index 1 to end on array-literal construction
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0] as number[]);
          arr.fill(8, 1, arr.length);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(2)).assertEqual(8);
          expect(arr.$_get(3)).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_0500
         * @tc.name int32ArrayFillPart05TestMindmapTest005
         * @tc.desc Verify three-arg fill(0,1) on length-2 array fills only first element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0] as number[]);
          arr.fill(9, 0, 1);
          expect(arr.$_get(0)).assertEqual(9);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_0600
         * @tc.name int32ArrayFillPart05TestMindmapTest006
         * @tc.desc Verify fill works on view over ArrayBuffer with non-4-multiple byteLength
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(9);
          let view: Int32Array = new Int32Array(buf, 0, 2);
          view.fill(33);
          expect(view.$_get(0)).assertEqual(33);
          expect(view.$_get(1)).assertEqual(33);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_0700
         * @tc.name int32ArrayFillPart05TestMindmapTest007
         * @tc.desc Verify two-arg fill(start=2) on from-constructed length-4 array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.from([10, 20, 30, 40] as number[]);
          arr.fill(0, 2, arr.length);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(0);
          expect(arr.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_0800
         * @tc.name int32ArrayFillPart05TestMindmapTest008
         * @tc.desc Verify value=0.4 truncates toward zero to 0 filling entire array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 7, 7] as number[]);
          arr.fill(0.4);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_0900
         * @tc.name int32ArrayFillPart05TestMindmapTest009
         * @tc.desc Verify value=-0.4 truncates toward zero to 0 on fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 5] as number[]);
          arr.fill((-0.4));
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_1000
         * @tc.name int32ArrayFillPart05TestMindmapTest010
         * @tc.desc Verify value=2147483647.4 truncates to INT_MAX on fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(2147483647.4);
          expect(arr.$_get(0)).assertEqual(2147483647);
          expect(arr.$_get(1)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_1100
         * @tc.name int32ArrayFillPart05TestMindmapTest011
         * @tc.desc Verify value=0.999999 truncates toward zero to 0 not 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([100] as number[]);
          arr.fill(0.999999);
          expect(arr.$_get(0)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_1200
         * @tc.name int32ArrayFillPart05TestMindmapTest012
         * @tc.desc Verify value=-0.0 treated as 0 on fill equivalent to +0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 5] as number[]);
          arr.fill((-0.0));
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_1300
         * @tc.name int32ArrayFillPart05TestMindmapTest013
         * @tc.desc Verify value=1.0 float literal integer fills as 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(1.0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(2)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_1400
         * @tc.name int32ArrayFillPart05TestMindmapTest014
         * @tc.desc Verify value=Number.EPSILON truncates to 0 on fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(Number.EPSILON);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_1500
         * @tc.name int32ArrayFillPart05TestMindmapTest015
         * @tc.desc Verify value=0.5 truncates to 0 in partial range fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4] as number[]);
          arr.fill(0.5, 1, 3);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_1600
         * @tc.name int32ArrayFillPart05TestMindmapTest016
         * @tc.desc Verify value=2147483648.0 wraps to INT_MIN on 3-element array fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(2147483648.0);
          expect(arr.$_get(0)).assertEqual((-2147483648));
          expect(arr.$_get(1)).assertEqual((-2147483648));
          expect(arr.$_get(2)).assertEqual((-2147483648));
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_1700
         * @tc.name int32ArrayFillPart05TestMindmapTest017
         * @tc.desc Verify value=-2147483649.0 wraps to INT_MAX on non-zero byteOffset view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let view: Int32Array = new Int32Array(buf, 4, 3);
          view.fill((-2147483649.0));
          expect(view.$_get(0)).assertEqual(2147483647);
          expect(view.$_get(2)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_1800
         * @tc.name int32ArrayFillPart05TestMindmapTest018
         * @tc.desc Verify value=4294967297.0 wraps to 1 on copy-constructed array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let orig: Int32Array = new Int32Array(2);
          let arr: Int32Array = new Int32Array(orig);
          arr.fill(4294967297.0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(1);
          expect(orig.$_get(0)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_1900
         * @tc.name int32ArrayFillPart05TestMindmapTest019
         * @tc.desc Verify value=2147483649.0 wraps to -2147483647 on partial fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0] as number[]);
          arr.fill(2147483649.0, 1, 3);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual((-2147483647));
          expect(arr.$_get(2)).assertEqual((-2147483647));
          expect(arr.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_2000
         * @tc.name int32ArrayFillPart05TestMindmapTest020
         * @tc.desc Verify start=0 fills [0,2) without modifying rest
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4] as number[]);
          arr.fill(9, 0, 2);
          expect(arr.$_get(0)).assertEqual(9);
          expect(arr.$_get(1)).assertEqual(9);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_2100
         * @tc.name int32ArrayFillPart05TestMindmapTest021
         * @tc.desc Verify start=length on length-5 array normalizes to empty range no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5] as number[]);
          arr.fill(99, 5, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_2200
         * @tc.name int32ArrayFillPart05TestMindmapTest022
         * @tc.desc Verify start=length-1 fills only the last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0] as number[]);
          arr.fill(77, 3, arr.length);
          expect(arr.$_get(2)).assertEqual(0);
          expect(arr.$_get(3)).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_2300
         * @tc.name int32ArrayFillPart05TestMindmapTest023
         * @tc.desc Verify start=-length normalizes to 0 equivalent to omitting start
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3] as number[]);
          arr.fill(88, (-3), 2);
          expect(arr.$_get(0)).assertEqual(88);
          expect(arr.$_get(1)).assertEqual(88);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_2400
         * @tc.name int32ArrayFillPart05TestMindmapTest024
         * @tc.desc Verify start=2 on length-6 array fills from index 2 to end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0, 0] as number[]);
          arr.fill(55, 2, arr.length);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(55);
          expect(arr.$_get(5)).assertEqual(55);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_2500
         * @tc.name int32ArrayFillPart05TestMindmapTest025
         * @tc.desc Verify fill on subarray view with start=1 uses sub-relative index and writes through
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = new Int32Array([1, 2, 3, 4, 5] as number[]);
          let sub: Int32Array = base.subarray(1, 4);
          sub.fill(100, 1, sub.length);
          expect(sub.$_get(0)).assertEqual(2);
          expect(sub.$_get(1)).assertEqual(100);
          expect(sub.$_get(2)).assertEqual(100);
          expect(base.$_get(2)).assertEqual(100);
          expect(base.$_get(3)).assertEqual(100);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_2600
         * @tc.name int32ArrayFillPart05TestMindmapTest026
         * @tc.desc Verify fill(0,0,length-1) on copy-constructed array excludes last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4);
          let arr: Int32Array = new Int32Array(src);
          arr.fill(0, 0, 3);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_2700
         * @tc.name int32ArrayFillPart05TestMindmapTest027
         * @tc.desc Verify end=0 produces empty range no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3] as number[]);
          arr.fill(99, 0, 0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_2800
         * @tc.name int32ArrayFillPart05TestMindmapTest028
         * @tc.desc Verify end=1 fills only first element on non-zero initial array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7, 8] as number[]);
          arr.fill(0, 0, 1);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(6);
          expect(arr.$_get(3)).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_2900
         * @tc.name int32ArrayFillPart05TestMindmapTest029
         * @tc.desc Verify end=-1 normalizes to length-1 filling up to second-to-last
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5] as number[]);
          arr.fill(0, 0, (-1));
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(3)).assertEqual(0);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_3000
         * @tc.name int32ArrayFillPart05TestMindmapTest030
         * @tc.desc Verify end=length fills to end equivalent to omitting end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0] as number[]);
          arr.fill(42, 0, 3);
          expect(arr.$_get(0)).assertEqual(42);
          expect(arr.$_get(2)).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_3100
         * @tc.name int32ArrayFillPart05TestMindmapTest031
         * @tc.desc Verify end=length+1 clamped to length fills from start=1 to end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3] as number[]);
          arr.fill(7, 1, 99);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(7);
          expect(arr.$_get(2)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_3200
         * @tc.name int32ArrayFillPart05TestMindmapTest032
         * @tc.desc Verify end=4 on length-6 array fills range [2,4)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0, 0] as number[]);
          arr.fill(22, 2, 4);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(22);
          expect(arr.$_get(3)).assertEqual(22);
          expect(arr.$_get(4)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_3300
         * @tc.name int32ArrayFillPart05TestMindmapTest033
         * @tc.desc Verify end=2 on from-constructed array fills first two elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.from([10, 20, 30, 40] as number[]);
          arr.fill(999, 0, 2);
          expect(arr.$_get(0)).assertEqual(999);
          expect(arr.$_get(1)).assertEqual(999);
          expect(arr.$_get(2)).assertEqual(30);
          expect(arr.$_get(3)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_3400
         * @tc.name int32ArrayFillPart05TestMindmapTest034
         * @tc.desc Verify start=-2 end=-1 on length-5 fills second-to-last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5] as number[]);
          arr.fill(0, (-2), (-1));
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(0);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_3500
         * @tc.name int32ArrayFillPart05TestMindmapTest035
         * @tc.desc Verify start=-4 end=-2 on length-5 normalizes to [1,3)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5] as number[]);
          arr.fill(88, (-4), (-2));
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(88);
          expect(arr.$_get(2)).assertEqual(88);
          expect(arr.$_get(3)).assertEqual(4);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_3600
         * @tc.name int32ArrayFillPart05TestMindmapTest036
         * @tc.desc Verify start=-100 far below -length clamps to 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3] as number[]);
          arr.fill(0, (-100), 2);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_3700
         * @tc.name int32ArrayFillPart05TestMindmapTest037
         * @tc.desc Verify start=1 end=-1 mixed on length-4 fills middle two elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4] as number[]);
          arr.fill(77, 1, (-1));
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(77);
          expect(arr.$_get(2)).assertEqual(77);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_3800
         * @tc.name int32ArrayFillPart05TestMindmapTest038
         * @tc.desc Verify start=-1 end=-4 normalizes to start>end empty range no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4] as number[]);
          arr.fill(99, (-1), (-4));
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_3900
         * @tc.name int32ArrayFillPart05TestMindmapTest039
         * @tc.desc Verify negative indices on subarray view normalize relative to sub length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6] as number[]);
          let sub: Int32Array = base.subarray(1, 5);
          sub.fill(0, (-2), (-1));
          expect(sub.length).assertEqual(4);
          expect(sub.$_get(0)).assertEqual(2);
          expect(sub.$_get(1)).assertEqual(3);
          expect(sub.$_get(2)).assertEqual(0);
          expect(sub.$_get(3)).assertEqual(5);
          expect(base.$_get(3)).assertEqual(0);
          expect(base.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_4000
         * @tc.name int32ArrayFillPart05TestMindmapTest040
         * @tc.desc Verify start=2 end=2 same-point empty range no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4] as number[]);
          arr.fill(0, 2, 2);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_4100
         * @tc.name int32ArrayFillPart05TestMindmapTest041
         * @tc.desc Verify start=3 end=1 reverse range produces empty range no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4] as number[]);
          arr.fill(0, 3, 1);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_4200
         * @tc.name int32ArrayFillPart05TestMindmapTest042
         * @tc.desc Verify start=0 end=0 empty range no-op on non-zero initial array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7] as number[]);
          arr.fill(0, 0, 0);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(2)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_4300
         * @tc.name int32ArrayFillPart05TestMindmapTest043
         * @tc.desc Verify start=length end=length+2 clamped start=end=length no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2] as number[]);
          arr.fill(0, 2, 10);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_4400
         * @tc.name int32ArrayFillPart05TestMindmapTest044
         * @tc.desc Verify fill on subarray start=end=1 empty range no-op does not affect parent
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = new Int32Array([1, 2, 3] as number[]);
          let sub: Int32Array = base.subarray(0, 3);
          sub.fill(99, 1, 1);
          expect(base.$_get(0)).assertEqual(1);
          expect(base.$_get(1)).assertEqual(2);
          expect(base.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_4500
         * @tc.name int32ArrayFillPart05TestMindmapTest045
         * @tc.desc Verify single-arg fill return value is strictly identical to original array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          let ret: Int32Array = arr.fill(42);
          expect(ret).assertEqual(arr);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_4600
         * @tc.name int32ArrayFillPart05TestMindmapTest046
         * @tc.desc Verify three-arg fill return value is identical this reference
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          let ret: Int32Array = arr.fill(7, 1, 3);
          expect(ret).assertEqual(arr);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_4700
         * @tc.name int32ArrayFillPart05TestMindmapTest047
         * @tc.desc Verify fill().fill() chained call overlays two ranges correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(5);
          arr.fill(1).fill(2, 3, arr.length);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(2)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(2);
          expect(arr.$_get(4)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_4800
         * @tc.name int32ArrayFillPart05TestMindmapTest048
         * @tc.desc Verify fill().reverse() chain fills with 9 then reverse keeps all 9 and same this
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(5, 5, 5);
          let ret: Int32Array = arr.fill(9).reverse();
          expect(ret).assertEqual(arr);
          expect(arr.$_get(0)).assertEqual(9);
          expect(arr.$_get(2)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_4900
         * @tc.name int32ArrayFillPart05TestMindmapTest049
         * @tc.desc Verify fill().$_set() chain modifies single element after fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill(11).$_set(2, 99);
          expect(arr.$_get(0)).assertEqual(11);
          expect(arr.$_get(2)).assertEqual(99);
          expect(arr.$_get(3)).assertEqual(11);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_5000
         * @tc.name int32ArrayFillPart05TestMindmapTest050
         * @tc.desc Verify fill returns the same reference as this (assertEqual arr)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          let ret: Int32Array = arr.fill(0);
          expect(ret).assertEqual(arr);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_5100
         * @tc.name int32ArrayFillPart05TestMindmapTest051
         * @tc.desc Verify fill().sort() chain returns same this after fill and sort
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(3, 1, 2);
          let ret: Int32Array = arr.fill(5).sort();
          expect(ret).assertEqual(arr);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(2)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_5200
         * @tc.name int32ArrayFillPart05TestMindmapTest052
         * @tc.desc Verify length unchanged after fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(7);
          arr.fill(0);
          expect(arr.length).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_5300
         * @tc.name int32ArrayFillPart05TestMindmapTest053
         * @tc.desc Verify byteLength remains 4*length after fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(5);
          let before: int = arr.byteLength;
          arr.fill(1);
          expect(arr.byteLength).assertEqual(before);
          expect(before).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_5400
         * @tc.name int32ArrayFillPart05TestMindmapTest054
         * @tc.desc Verify byteOffset preserved on non-zero offset view after fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(32);
          let view: Int32Array = new Int32Array(buf, 12, 3);
          let off: int = view.byteOffset;
          view.fill(5);
          expect(view.byteOffset).assertEqual(off);
          expect(off).assertEqual(12);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_5500
         * @tc.name int32ArrayFillPart05TestMindmapTest055
         * @tc.desc Verify BYTES_PER_ELEMENT remains 4 after fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(10);
          arr.fill(0);
          expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_5600
         * @tc.name int32ArrayFillPart05TestMindmapTest056
         * @tc.desc Verify buffer reference remains same ArrayBuffer after fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let view: Int32Array = new Int32Array(buf);
          view.fill(1);
          expect(view.buffer).assertEqual(buf);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_5700
         * @tc.name int32ArrayFillPart05TestMindmapTest057
         * @tc.desc Verify copy-constructed array has independent buffer from source after fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array(4);
          let arr: Int32Array = new Int32Array(src);
          arr.fill(0);
          src.$_set(0, 77);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.length).assertEqual(src.length);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_5800
         * @tc.name int32ArrayFillPart05TestMindmapTest058
         * @tc.desc Verify full fill INT_MAX then full fill 0 overwrites all elements to 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill(2147483647);
          arr.fill(0);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_5900
         * @tc.name int32ArrayFillPart05TestMindmapTest059
         * @tc.desc Verify fill -1 everywhere then fill INT_MIN into [1,3) creates mixed pattern
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill((-1));
          arr.fill((-2147483648) as number, 1, 3);
          expect(arr.$_get(0)).assertEqual((-1));
          expect(arr.$_get(1)).assertEqual((-2147483648));
          expect(arr.$_get(2)).assertEqual((-2147483648));
          expect(arr.$_get(3)).assertEqual((-1));
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_6000
         * @tc.name int32ArrayFillPart05TestMindmapTest060
         * @tc.desc Verify fill [0,2) then [2,4) adjacent ranges concatenate two values without overlap
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill(10, 0, 2);
          arr.fill(20, 2, 4);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(10);
          expect(arr.$_get(2)).assertEqual(20);
          expect(arr.$_get(3)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_6100
         * @tc.name int32ArrayFillPart05TestMindmapTest061
         * @tc.desc Verify fill adjacent ranges then [1,3) overlay covers seam with new value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill(1, 0, 2);
          arr.fill(2, 2, 4);
          arr.fill(9, 1, 3);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(9);
          expect(arr.$_get(2)).assertEqual(9);
          expect(arr.$_get(3)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_6200
         * @tc.name int32ArrayFillPart05TestMindmapTest062
         * @tc.desc Verify fill same value twice is idempotent second fill does not change elements
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(42);
          arr.fill(42);
          expect(arr.$_get(0)).assertEqual(42);
          expect(arr.$_get(1)).assertEqual(42);
          expect(arr.$_get(2)).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_6300
         * @tc.name int32ArrayFillPart05TestMindmapTest063
         * @tc.desc Verify fill small value then fill large value overwrites all to large value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.fill(1);
          arr.fill(2147483647);
          expect(arr.$_get(0)).assertEqual(2147483647);
          expect(arr.$_get(1)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_6400
         * @tc.name int32ArrayFillPart05TestMindmapTest064
         * @tc.desc Verify for-of iteration after full fill sees fill value for every element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill(7);
          let count: int = 0;
          for (let v of arr) {
          expect(v).assertEqual(7);
          count++;
          }
          expect(count).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_6500
         * @tc.name int32ArrayFillPart05TestMindmapTest065
         * @tc.desc Verify for-of break early termination after fill does not corrupt filled values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(5);
          arr.fill(3);
          let sum: number = 0;
          for (let i: int = 0; i < arr.length; i++) {
          sum = sum + arr.$_get(i);
          if (sum >= 9) {
          break;
          }
          }
          expect(arr.$_get(0)).assertEqual(3);
          expect(arr.$_get(4)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_6600
         * @tc.name int32ArrayFillPart05TestMindmapTest066
         * @tc.desc Verify join string reflects partial fill with correct separators
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
          arr.fill(0, 1, 3);
          let s: string = arr.join(',');
          expect(s).assertEqual('1,0,0,4');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_6700
         * @tc.name int32ArrayFillPart05TestMindmapTest067
         * @tc.desc Verify toString reflects filled values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill((-5));
          let s: string = arr.toString();
          expect(s).assertEqual('-5,-5,-5');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_6800
         * @tc.name int32ArrayFillPart05TestMindmapTest068
         * @tc.desc Verify $_get reads filled values correctly via index accessor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(42);
          expect(arr.$_get(0)).assertEqual(42);
          expect(arr.$_get(2)).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_6900
         * @tc.name int32ArrayFillPart05TestMindmapTest069
         * @tc.desc Verify keys iterator length remains correct after fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill(0);
          let count: int = 0;
          for (let k of arr.keys()) {
          count++;
          }
          expect(count).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_7000
         * @tc.name int32ArrayFillPart05TestMindmapTest070
         * @tc.desc Verify fill writes through to same-buffer sibling view only in overlapping bytes
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let valFirst: Int32Array = new Int32Array(buf, 0, 2);
          let valSecond: Int32Array = new Int32Array(buf, 8, 2);
          valFirst.fill(100);
          expect(valFirst.$_get(0)).assertEqual(100);
          expect(valFirst.$_get(1)).assertEqual(100);
          expect(valSecond.$_get(0)).assertEqual(0);
          expect(valSecond.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_7100
         * @tc.name int32ArrayFillPart05TestMindmapTest071
         * @tc.desc Verify three views on same buffer filling middle view leaves sides untouched
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(24);
          let a: Int32Array = new Int32Array(buf, 0, 2);
          let b: Int32Array = new Int32Array(buf, 8, 2);
          let c: Int32Array = new Int32Array(buf, 16, 2);
          b.fill(55);
          expect(a.$_get(0)).assertEqual(0);
          expect(b.$_get(0)).assertEqual(55);
          expect(b.$_get(1)).assertEqual(55);
          expect(c.$_get(0)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_7200
         * @tc.name int32ArrayFillPart05TestMindmapTest072
         * @tc.desc Verify fill on subarray of subarray writes through to original base at correct positions
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = new Int32Array(8);
          let s1: Int32Array = base.subarray(2, 6);
          let s2: Int32Array = s1.subarray(1, 3);
          s2.fill(77);
          expect(s2.$_get(0)).assertEqual(77);
          expect(s2.$_get(1)).assertEqual(77);
          expect(s1.$_get(1)).assertEqual(77);
          expect(s1.$_get(2)).assertEqual(77);
          expect(base.$_get(3)).assertEqual(77);
          expect(base.$_get(4)).assertEqual(77);
          expect(base.$_get(2)).assertEqual(0);
          expect(base.$_get(5)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_7300
         * @tc.name int32ArrayFillPart05TestMindmapTest073
         * @tc.desc Verify subarray(0) full-view fill is equivalent to filling original array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = Int32Array.of(1, 2, 3, 4);
          let full: Int32Array = base.subarray(0);
          full.fill(0);
          expect(base.$_get(0)).assertEqual(0);
          expect(base.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_7400
         * @tc.name int32ArrayFillPart05TestMindmapTest074
         * @tc.desc Verify fill on negative-begin subarray writes through to parent tail
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let tail: Int32Array = base.subarray((-2));
          tail.fill(88);
          expect(tail.length).assertEqual(2);
          expect(base.$_get(0)).assertEqual(1);
          expect(base.$_get(2)).assertEqual(3);
          expect(base.$_get(3)).assertEqual(88);
          expect(base.$_get(4)).assertEqual(88);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_7500
         * @tc.name int32ArrayFillPart05TestMindmapTest075
         * @tc.desc Verify fill on zero-length subarray writes no bytes and leaves parent unchanged
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = Int32Array.of(1, 2, 3);
          let empty: Int32Array = base.subarray(2, 2);
          empty.fill(99);
          expect(base.$_get(0)).assertEqual(1);
          expect(base.$_get(1)).assertEqual(2);
          expect(base.$_get(2)).assertEqual(3);
          expect(empty.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_7600
         * @tc.name int32ArrayFillPart05TestMindmapTest076
         * @tc.desc Verify fill with start=1 fills [1,3) range on array-literal construction
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0] as number[]);
          arr.fill(5, 1, 3);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(5);
          expect(arr.$_get(2)).assertEqual(5);
          expect(arr.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_7700
         * @tc.name int32ArrayFillPart05TestMindmapTest077
         * @tc.desc Verify start=-1 normalizes to length-1 filling last element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0] as number[]);
          arr.fill(6, (-1));
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
          expect(arr.$_get(3)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_7800
         * @tc.name int32ArrayFillPart05TestMindmapTest078
         * @tc.desc Verify fill with end=2 fills [0,2) range on array-literal construction
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0] as number[]);
          arr.fill(8, 0, 2);
          expect(arr.$_get(0)).assertEqual(8);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(2)).assertEqual(0);
          expect(arr.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_7900
         * @tc.name int32ArrayFillPart05TestMindmapTest079
         * @tc.desc Verify fill with start=0 fills [0,2) range on non-zero initial array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3] as number[]);
          arr.fill(0, 0, 2);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_8000
         * @tc.name int32ArrayFillPart05TestMindmapTest080
         * @tc.desc Verify fill on empty array returns itself with length 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let r1: Int32Array = arr.fill(1);
          expect(r1.length).assertEqual(0);
          expect(r1).assertEqual(arr);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_8100
         * @tc.name int32ArrayFillPart05TestMindmapTest081
         * @tc.desc Verify three-arg fill on empty array still returns empty
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let r2: Int32Array = arr.fill(1, 0, 10);
          expect(r2.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_8200
         * @tc.name int32ArrayFillPart05TestMindmapTest082
         * @tc.desc Verify fill with negative indices on empty array remains length 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          arr.fill(99, (-1), (-1));
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_8300
         * @tc.name int32ArrayFillPart05TestMindmapTest083
         * @tc.desc Verify Number.NaN as fill value converts to 0 via ToInt32
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.fill(Double.NaN);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_8400
         * @tc.name int32ArrayFillPart05TestMindmapTest084
         * @tc.desc Verify Number.NaN as fill value converts to 0 on non-zero offset view
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let view: Int32Array = new Int32Array(buf, 4, 2);
          view.fill(Double.NaN);
          expect(view.$_get(0)).assertEqual(0);
          expect(view.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_8500
         * @tc.name int32ArrayFillPart05TestMindmapTest085
         * @tc.desc Verify $_set single element then fill range overwrites that element
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.$_set(1, 111);
          arr.fill(0, 0, 3);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(0);
          expect(arr.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_8600
         * @tc.name int32ArrayFillPart05TestMindmapTest086
         * @tc.desc Verify set(array,offset) after fill then full fill overwrites all
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(6);
          let src: Int32Array = Int32Array.of(1, 2);
          arr.fill(9, 0, 4);
          arr.set(src, 2);
          expect(arr.$_get(1)).assertEqual(9);
          expect(arr.$_get(2)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(2);
          expect(arr.$_get(4)).assertEqual(0);
          arr.fill(0);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(5)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_8700
         * @tc.name int32ArrayFillPart05TestMindmapTest087
         * @tc.desc Verify copyWithin after fill preserves fill value at copied positions
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(5);
          arr.fill(0);
          arr.$_set(0, 7);
          arr.$_set(4, 8);
          arr.copyWithin(2, 0, 2);
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(0);
          expect(arr.$_get(4)).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_8800
         * @tc.name int32ArrayFillPart05TestMindmapTest088
         * @tc.desc Verify reduce sum after fill correctly reflects filled values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill(3);
          let sum: number = arr.reduce<number>((acc: number, v: number, _i: int, _a: Int32Array): number => acc + v, 0);
          expect(sum).assertEqual(12);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_8900
         * @tc.name int32ArrayFillPart05TestMindmapTest089
         * @tc.desc Verify every returns true when all elements equal fill value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(5);
          arr.fill(42);
          let allEq: boolean = arr.every((v: number, _i: int, _a: Int32Array): boolean => {
          return v === 42;
        });
          expect(allEq).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART05_TEST_MINDMAP_9000
         * @tc.name int32ArrayFillPart05TestMindmapTest090
         * @tc.desc Verify some detects both new and old values after partial fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFillPart05TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 0, 0] as number[]);
          arr.fill(1, 1, 3);
          let hasOne: boolean = arr.some((v: number, _i: int, _a: Int32Array): boolean => {
          return v === 1;
        });
          let hasZero: boolean = arr.some((v: number, _i: int, _a: Int32Array): boolean => {
          return v === 0;
        });
          expect(hasOne).assertTrue();
          expect(hasZero).assertTrue();
        });
  });
}
