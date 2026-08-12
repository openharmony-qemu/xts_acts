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
export default function int32ArrayConstructorPart04TestMindmapTestTest(): void {
  describe('Int32ArrayConstructorPart04TestMindmapTestTest', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_0100
         * @tc.name int32ArrayConstructorPart04TestMindmapTest001
         * @tc.desc Verify arity=1 Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.length).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_0200
         * @tc.name int32ArrayConstructorPart04TestMindmapTest002
         * @tc.desc Verify arity=1 Int32Array length=0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array(0);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.length).assertEqual(0);
          expect(dst.byteLength).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_0300
         * @tc.name int32ArrayConstructorPart04TestMindmapTest003
         * @tc.desc Verify Int32Array 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(42);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.length).assertEqual(1);
          expect(dst.$_get(0)).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_0400
         * @tc.name int32ArrayConstructorPart04TestMindmapTest004
         * @tc.desc Verify Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(10, 20, 30, 40);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.length).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_0500
         * @tc.name int32ArrayConstructorPart04TestMindmapTest005
         * @tc.desc Verify ArrayBuffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(12);
          let srcView: Int32Array = new Int32Array(buf, 0, 3);
          srcView.$_set(0, 7);
          srcView.$_set(1, 8);
          srcView.$_set(2, 9);
          let dst: Int32Array = new Int32Array(srcView);
          expect(dst.length).assertEqual(3);
          expect(dst.$_get(0)).assertEqual(7);
          expect(dst.$_get(1)).assertEqual(8);
          expect(dst.$_get(2)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_0600
         * @tc.name int32ArrayConstructorPart04TestMindmapTest006
         * @tc.desc Verify byteOffset=8
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(20);
          let srcView: Int32Array = new Int32Array(buf, 8, 3);
          srcView.$_set(0, 100);
          srcView.$_set(1, 200);
          srcView.$_set(2, 300);
          let dst: Int32Array = new Int32Array(srcView);
          expect(dst.length).assertEqual(3);
          expect(dst.$_get(0)).assertEqual(100);
          expect(dst.$_get(2)).assertEqual(300);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_0700
         * @tc.name int32ArrayConstructorPart04TestMindmapTest007
         * @tc.desc Verify subarray buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let sub: Int32Array = src.subarray(1, 4);
          let dst: Int32Array = new Int32Array(sub);
          expect(dst.length).assertEqual(3);
          expect(dst.$_get(0)).assertEqual(2);
          expect(dst.$_get(2)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_0800
         * @tc.name int32ArrayConstructorPart04TestMindmapTest008
         * @tc.desc Verify Int32Array.from
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.from([5, 6, 7]);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(1)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_0900
         * @tc.name int32ArrayConstructorPart04TestMindmapTest009
         * @tc.desc Verify Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.of(11, 22);
          let b: Int32Array = new Int32Array(a);
          let c: Int32Array = new Int32Array(b);
          expect(c.length).assertEqual(2);
          expect(c.$_get(0)).assertEqual(11);
          expect(c.$_get(1)).assertEqual(22);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_1000
         * @tc.name int32ArrayConstructorPart04TestMindmapTest010
         * @tc.desc Verify sort
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(3, 1, 2);
          src.sort();
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(0)).assertEqual(1);
          expect(dst.$_get(1)).assertEqual(2);
          expect(dst.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_1100
         * @tc.name int32ArrayConstructorPart04TestMindmapTest011
         * @tc.desc Verify filter Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = Int32Array.of(1, -2, 3, -4);
          let src: Int32Array = base.filter((v: number, i: int, a: Int32Array): boolean => v > 0);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.length).assertEqual(2);
          expect(dst.$_get(0)).assertEqual(1);
          expect(dst.$_get(1)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_1200
         * @tc.name int32ArrayConstructorPart04TestMindmapTest012
         * @tc.desc Verify map Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = Int32Array.of(1, 2, 3);
          let src: Int32Array = base.map((v: number, i: int, a: Int32Array): number => v * 10);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(0)).assertEqual(10);
          expect(dst.$_get(2)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_1300
         * @tc.name int32ArrayConstructorPart04TestMindmapTest013
         * @tc.desc Verify subarray
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = Int32Array.of(0, 1, 2, 3, 4);
          let sub: Int32Array = base.subarray(2);
          let dst: Int32Array = new Int32Array(sub);
          expect(dst.length).assertEqual(3);
          expect(dst.$_get(0)).assertEqual(2);
          expect(dst.$_get(2)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_1400
         * @tc.name int32ArrayConstructorPart04TestMindmapTest014
         * @tc.desc Verify subarray begin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
          let sub: Int32Array = base.subarray(-2);
          let dst: Int32Array = new Int32Array(sub);
          expect(dst.length).assertEqual(2);
          expect(dst.$_get(0)).assertEqual(40);
          expect(dst.$_get(1)).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_1500
         * @tc.name int32ArrayConstructorPart04TestMindmapTest015
         * @tc.desc Verify subarray begin>=end 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let base: Int32Array = Int32Array.of(1, 2, 3);
          let sub: Int32Array = base.subarray(2, 2);
          let dst: Int32Array = new Int32Array(sub);
          expect(dst.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_1600
         * @tc.name int32ArrayConstructorPart04TestMindmapTest016
         * @tc.desc Verify byteOffset=4 length=1 length=1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(8);
          let src: Int32Array = new Int32Array(buf, 4, 1);
          src.$_set(0, 42);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.length).assertEqual(1);
          expect(dst.$_get(0)).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_1700
         * @tc.name int32ArrayConstructorPart04TestMindmapTest017
         * @tc.desc Verify 0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, 1, -1);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(0)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_1800
         * @tc.name int32ArrayConstructorPart04TestMindmapTest018
         * @tc.desc Verify constructing Int32Array from Int32Array.of(-1,-100) correctly copies negative values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(-1, -100);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(0)).assertEqual(-1);
          expect(dst.$_get(1)).assertEqual(-100);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_1900
         * @tc.name int32ArrayConstructorPart04TestMindmapTest019
         * @tc.desc Verify INT_MAX (0x7FFFFFFF)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(2147483647);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(0)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_2000
         * @tc.name int32ArrayConstructorPart04TestMindmapTest020
         * @tc.desc Verify INT_MIN (-2147483648)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(-2147483648);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(0)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_2100
         * @tc.name int32ArrayConstructorPart04TestMindmapTest021
         * @tc.desc Verify 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array(5);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(0)).assertEqual(0);
          expect(dst.$_get(4)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_2200
         * @tc.name int32ArrayConstructorPart04TestMindmapTest022
         * @tc.desc Verify -1 -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array(4);
          src.fill(-1);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(0)).assertEqual(-1);
          expect(dst.$_get(3)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_2300
         * @tc.name int32ArrayConstructorPart04TestMindmapTest023
         * @tc.desc Verify INT_MIN INT_MIN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array(2);
          src.fill(-2147483648);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(0)).assertEqual(-2147483648);
          expect(dst.$_get(1)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_2400
         * @tc.name int32ArrayConstructorPart04TestMindmapTest024
         * @tc.desc Verify constructing Int32Array from a fill-Int32Array copies all elements with correct values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array(4);
          src.fill(7);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(0)).assertEqual(7);
          expect(dst.$_get(3)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_2500
         * @tc.name int32ArrayConstructorPart04TestMindmapTest025
         * @tc.desc Verify constructing Int32Array from Int32Array.of() with multiple values copies all elements correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(101, 202, 303, 404, 505);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(0)).assertEqual(101);
          expect(dst.$_get(2)).assertEqual(303);
          expect(dst.$_get(4)).assertEqual(505);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_2600
         * @tc.name int32ArrayConstructorPart04TestMindmapTest026
         * @tc.desc Verify constructing from Int32Array backed by DataView(0) produces element 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(8);
          let dv: DataView = new DataView(buf);
          dv.setInt32(0, 0, true);
          let src: Int32Array = new Int32Array(buf.slice(0, 4));
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(0)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_2700
         * @tc.name int32ArrayConstructorPart04TestMindmapTest027
         * @tc.desc Verify 16
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array(16);
          for (let i: int = 0; i < 16; i++) {
          src.$_set(i, i * 7);
          }
          let dst: Int32Array = new Int32Array(src);
          expect(dst.length).assertEqual(16);
          expect(dst.$_get(0)).assertEqual(0);
          expect(dst.$_get(15)).assertEqual(105);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_2800
         * @tc.name int32ArrayConstructorPart04TestMindmapTest028
         * @tc.desc Verify 128
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array(128);
          for (let i: int = 0; i < 128; i++) {
          src.$_set(i, i);
          }
          let dst: Int32Array = new Int32Array(src);
          expect(dst.length).assertEqual(128);
          expect(dst.$_get(0)).assertEqual(0);
          expect(dst.$_get(127)).assertEqual(127);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_2900
         * @tc.name int32ArrayConstructorPart04TestMindmapTest029
         * @tc.desc Verify -0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, -1, 1);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(0)).assertEqual(0);
          expect(dst.$_get(1)).assertEqual(-1);
          expect(dst.$_get(2)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_3000
         * @tc.name int32ArrayConstructorPart04TestMindmapTest030
         * @tc.desc Verify Int32Array instanceof
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.length).assertEqual(1);
          expect(dst.$_get(0)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_3100
         * @tc.name int32ArrayConstructorPart04TestMindmapTest031
         * @tc.desc Verify length length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.length).assertEqual(src.length);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_3200
         * @tc.name int32ArrayConstructorPart04TestMindmapTest032
         * @tc.desc Verify byteLength = length * 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.byteLength).assertEqual(12);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_3300
         * @tc.name int32ArrayConstructorPart04TestMindmapTest033
         * @tc.desc Verify BYTES_PER_ELEMENT 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.BYTES_PER_ELEMENT).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_3400
         * @tc.name int32ArrayConstructorPart04TestMindmapTest034
         * @tc.desc Verify byteOffset 0 buffer 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let src: Int32Array = new Int32Array(buf, 8, 2);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.byteOffset).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_3500
         * @tc.name int32ArrayConstructorPart04TestMindmapTest035
         * @tc.desc Verify buffer null ArrayBuffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.buffer.byteLength).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_3600
         * @tc.name int32ArrayConstructorPart04TestMindmapTest036
         * @tc.desc Verify buffer.byteLength 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array(0);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.buffer.byteLength).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_3700
         * @tc.name int32ArrayConstructorPart04TestMindmapTest037
         * @tc.desc Verify buffer.byteLength dst.byteLength
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.buffer.byteLength).assertEqual(dst.byteLength);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_3800
         * @tc.name int32ArrayConstructorPart04TestMindmapTest038
         * @tc.desc Verify buffer length*4 padding
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(32);
          let srcView: Int32Array = new Int32Array(buf, 4, 3);
          let dst: Int32Array = new Int32Array(srcView);
          expect(dst.buffer.byteLength).assertEqual(12);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_3900
         * @tc.name int32ArrayConstructorPart04TestMindmapTest039
         * @tc.desc Verify buffer buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(20);
          let src: Int32Array = new Int32Array(buf, 0, 3);
          src.$_set(0, 1);
          src.$_set(1, 2);
          src.$_set(2, 3);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.buffer.byteLength).assertEqual(12);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_4000
         * @tc.name int32ArrayConstructorPart04TestMindmapTest040
         * @tc.desc Verify buffer 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(99);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.buffer.byteLength).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_4100
         * @tc.name int32ArrayConstructorPart04TestMindmapTest041
         * @tc.desc Verify dst.buffer src.buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let dst: Int32Array = new Int32Array(src);
          dst.$_set(0, 999);
          expect(src.$_get(0)).assertEqual(1);
          expect(dst.$_get(0)).assertEqual(999);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_4200
         * @tc.name int32ArrayConstructorPart04TestMindmapTest042
         * @tc.desc Verify dst.$_set src
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(10, 20, 30);
          let dst: Int32Array = new Int32Array(src);
          dst.$_set(0, 999);
          expect(src.$_get(0)).assertEqual(10);
          expect(dst.$_get(0)).assertEqual(999);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_4300
         * @tc.name int32ArrayConstructorPart04TestMindmapTest043
         * @tc.desc Verify src dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(10, 20, 30);
          let dst: Int32Array = new Int32Array(src);
          src.$_set(1, 888);
          expect(dst.$_get(1)).assertEqual(20);
          expect(src.$_get(1)).assertEqual(888);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_4400
         * @tc.name int32ArrayConstructorPart04TestMindmapTest044
         * @tc.desc Verify ArrayBuffer dst.buffer ArrayBuffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(16);
          let srcView: Int32Array = new Int32Array(buf, 4, 2);
          srcView.$_set(0, 55);
          srcView.$_set(1, 66);
          let dst: Int32Array = new Int32Array(srcView);
          dst.$_set(0, 999);
          expect(srcView.$_get(0)).assertEqual(55);
          expect(dst.$_get(0)).assertEqual(999);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_4500
         * @tc.name int32ArrayConstructorPart04TestMindmapTest045
         * @tc.desc Verify buffer dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(12);
          let src: Int32Array = new Int32Array(buf);
          src.$_set(0, 1);
          src.$_set(1, 2);
          src.$_set(2, 3);
          let dst: Int32Array = new Int32Array(src);
          let alias: Int32Array = new Int32Array(buf);
          alias.$_set(0, 9999);
          expect(dst.$_get(0)).assertEqual(1);
          expect(src.$_get(0)).assertEqual(9999);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_4600
         * @tc.name int32ArrayConstructorPart04TestMindmapTest046
         * @tc.desc Verify subarray base buffer dst subarray buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let big: Int32Array = Int32Array.of(0, 1, 2, 3, 4, 5);
          let sub: Int32Array = big.subarray(2, 5);
          let dst: Int32Array = new Int32Array(sub);
          big.$_set(2, 77);
          expect(dst.$_get(0)).assertEqual(2);
          expect(sub.$_get(0)).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_4700
         * @tc.name int32ArrayConstructorPart04TestMindmapTest047
         * @tc.desc Verify dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(-2147483648, 2147483647, 0, -1);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(0)).assertEqual(src.$_get(0));
          expect(dst.$_get(1)).assertEqual(src.$_get(1));
          expect(dst.$_get(2)).assertEqual(src.$_get(2));
          expect(dst.$_get(3)).assertEqual(src.$_get(3));
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_4800
         * @tc.name int32ArrayConstructorPart04TestMindmapTest048
         * @tc.desc Verify fill dst src
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4);
          let dst: Int32Array = new Int32Array(src);
          dst.fill(0);
          expect(dst.$_get(0)).assertEqual(0);
          expect(src.$_get(0)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_4900
         * @tc.name int32ArrayConstructorPart04TestMindmapTest049
         * @tc.desc Verify reverse dst src
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let dst: Int32Array = new Int32Array(src);
          dst.reverse();
          expect(dst.$_get(0)).assertEqual(3);
          expect(src.$_get(0)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_5000
         * @tc.name int32ArrayConstructorPart04TestMindmapTest050
         * @tc.desc Verify copyWithin dst src
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4);
          let dst: Int32Array = new Int32Array(src);
          dst.copyWithin(2, 0, 2);
          expect(dst.$_get(2)).assertEqual(1);
          expect(src.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_5100
         * @tc.name int32ArrayConstructorPart04TestMindmapTest051
         * @tc.desc Verify dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2);
          let d1: Int32Array = new Int32Array(src);
          let d2: Int32Array = new Int32Array(src);
          d1.$_set(0, 100);
          expect(d2.$_get(0)).assertEqual(1);
          expect(src.$_get(0)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_5200
         * @tc.name int32ArrayConstructorPart04TestMindmapTest052
         * @tc.desc Verify dst.set(src)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let dst: Int32Array = new Int32Array(src);
          dst.set(src);
          expect(dst.$_get(0)).assertEqual(1);
          expect(dst.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_5300
         * @tc.name int32ArrayConstructorPart04TestMindmapTest053
         * @tc.desc Verify byteOffset=4 dst buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(8);
          let src: Int32Array = new Int32Array(buf, 4, 1);
          src.$_set(0, 123);
          let dst: Int32Array = new Int32Array(src);
          dst.$_set(0, 456);
          expect(src.$_get(0)).assertEqual(123);
          expect(dst.$_get(0)).assertEqual(456);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_5400
         * @tc.name int32ArrayConstructorPart04TestMindmapTest054
         * @tc.desc Verify Int32Array dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2);
          let dst1: Int32Array = new Int32Array(src);
          src = Int32Array.of(9, 9);
          let dst2: Int32Array = new Int32Array(src);
          expect(dst1.$_get(0)).assertEqual(1);
          expect(dst2.$_get(0)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_5500
         * @tc.name int32ArrayConstructorPart04TestMindmapTest055
         * @tc.desc Verify map dst dst src
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let dst: Int32Array = new Int32Array(src);
          let mapped: Int32Array = dst.map((v: number, i: int, a: Int32Array): number => v * 2);
          expect(mapped.$_get(0)).assertEqual(2);
          expect(dst.$_get(0)).assertEqual(1);
          expect(src.$_get(0)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_5600
         * @tc.name int32ArrayConstructorPart04TestMindmapTest056
         * @tc.desc Verify dst.$_set dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, 0, 0);
          let dst: Int32Array = new Int32Array(src);
          dst.$_set(1, 42);
          expect(dst.$_get(1)).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_5700
         * @tc.name int32ArrayConstructorPart04TestMindmapTest057
         * @tc.desc Verify dst.buffer DataView dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, 0);
          let dst: Int32Array = new Int32Array(src);
          let dv: DataView = new DataView(dst.buffer);
          dv.setInt32(0, 123, true);
          expect(dst.$_get(0)).assertEqual(123);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_5800
         * @tc.name int32ArrayConstructorPart04TestMindmapTest058
         * @tc.desc Verify dst.buffer Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, 0, 0);
          let dst: Int32Array = new Int32Array(src);
          let alias: Int32Array = new Int32Array(dst.buffer);
          alias.$_set(2, 777);
          expect(dst.$_get(2)).assertEqual(777);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_5900
         * @tc.name int32ArrayConstructorPart04TestMindmapTest059
         * @tc.desc Verify dst.buffer byteOffset=4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, 0, 0, 0);
          let dst: Int32Array = new Int32Array(src);
          let alias: Int32Array = new Int32Array(dst.buffer, 4, 3);
          alias.$_set(0, 111);
          expect(dst.$_get(1)).assertEqual(111);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_6000
         * @tc.name int32ArrayConstructorPart04TestMindmapTest060
         * @tc.desc Verify dst.buffer DataView src.buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(5, 6);
          let dst: Int32Array = new Int32Array(src);
          let dvDst: DataView = new DataView(dst.buffer);
          dvDst.setInt32(0, 999, true);
          let dvSrc: DataView = new DataView(src.buffer);
          expect(dvSrc.getInt32(0, true)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_6100
         * @tc.name int32ArrayConstructorPart04TestMindmapTest061
         * @tc.desc Verify buffer dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(8);
          let src: Int32Array = new Int32Array(buf);
          let twin: Int32Array = new Int32Array(buf);
          src.$_set(0, 1);
          twin.$_set(1, 2);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.$_get(0)).assertEqual(1);
          expect(dst.$_get(1)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_6200
         * @tc.name int32ArrayConstructorPart04TestMindmapTest062
         * @tc.desc Verify dst.set dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, 0, 0);
          let dst: Int32Array = new Int32Array(src);
          let alias: Int32Array = new Int32Array(dst.buffer);
          dst.set(Int32Array.of(9, 9, 9));
          expect(alias.$_get(0)).assertEqual(9);
          expect(alias.$_get(2)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_6300
         * @tc.name int32ArrayConstructorPart04TestMindmapTest063
         * @tc.desc Verify dst.fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array(4);
          let dst: Int32Array = new Int32Array(src);
          let alias: Int32Array = new Int32Array(dst.buffer);
          dst.fill(-1);
          expect(alias.$_get(0)).assertEqual(-1);
          expect(alias.$_get(3)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_6400
         * @tc.name int32ArrayConstructorPart04TestMindmapTest064
         * @tc.desc Verify for-of dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(10, 20, 30, 40);
          let dst: Int32Array = new Int32Array(src);
          let collected: Array<number> = [];
          for (let v of dst) {
          collected.push(v);
          }
          expect(collected.length).assertEqual(4);
          expect(collected[0]).assertEqual(10);
          expect(collected[3]).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_6500
         * @tc.name int32ArrayConstructorPart04TestMindmapTest065
         * @tc.desc Verify forEach dst index value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(7, 8);
          let dst: Int32Array = new Int32Array(src);
          let idxSum: int = 0;
          let valSum: number = 0;
          dst.forEach((value: number, index: int, arr: Int32Array): void => {
          idxSum = idxSum + index;
          valSum = valSum + value;
        });
          expect(idxSum).assertEqual(1);
          expect(valSum).assertEqual(15);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_6600
         * @tc.name int32ArrayConstructorPart04TestMindmapTest066
         * @tc.desc Verify forEach arr dst src
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1);
          let dst: Int32Array = new Int32Array(src);
          dst.forEach((value: number, index: int, arr: Int32Array): void => {
          expect(arr).assertEqual(dst);
        });
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_6700
         * @tc.name int32ArrayConstructorPart04TestMindmapTest067
         * @tc.desc Verify forEach 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array(0);
          let dst: Int32Array = new Int32Array(src);
          let count: int = 0;
          dst.forEach((value: number, index: int, arr: Int32Array): void => {
          count = count + 1;
        });
          expect(count).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_6800
         * @tc.name int32ArrayConstructorPart04TestMindmapTest068
         * @tc.desc Verify every true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(3, 3, 3);
          let dst: Int32Array = new Int32Array(src);
          let allEq: boolean = dst.every((value, index, arr) => value === 3);
          expect(allEq).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_6900
         * @tc.name int32ArrayConstructorPart04TestMindmapTest069
         * @tc.desc Verify some dst true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let dst: Int32Array = new Int32Array(src);
          let has: boolean = dst.some((value, index, arr) => value === 2);
          expect(has).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_7000
         * @tc.name int32ArrayConstructorPart04TestMindmapTest070
         * @tc.desc Verify indexOf dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(5, 6, 7, 8);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.indexOf(7)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_7100
         * @tc.name int32ArrayConstructorPart04TestMindmapTest071
         * @tc.desc Verify reduce dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4);
          let dst: Int32Array = new Int32Array(src);
          let sum: number = dst.reduce((acc: number, cur: number, idx: int, arr: Int32Array): number => acc + cur, 0);
          expect(sum).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_7200
         * @tc.name int32ArrayConstructorPart04TestMindmapTest072
         * @tc.desc Verify reduceRight 321
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let dst: Int32Array = new Int32Array(src);
          let concat: number = dst.reduceRight((acc: number, cur: number, idx: int, a: Int32Array): number => acc * 10 + cur, 0);
          expect(concat).assertEqual(321);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_7300
         * @tc.name int32ArrayConstructorPart04TestMindmapTest073
         * @tc.desc Verify entries dst [index,value]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(10, 20, 30);
          let dst: Int32Array = new Int32Array(src);
          let idx: int = 0;
          for (let pair of dst.entries()) {
          expect(pair[0]).assertEqual(idx);
          expect(pair[1]).assertEqual(src.$_get(idx));
          idx = idx + 1;
          }
          expect(idx).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_7400
         * @tc.name int32ArrayConstructorPart04TestMindmapTest074
         * @tc.desc Verify keys dst 0+1+2+3=6
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(0, 0, 0, 0);
          let dst: Int32Array = new Int32Array(src);
          let sumIdx: int = 0;
          let cnt: int = 0;
          for (let k of dst.keys()) {
          sumIdx = sumIdx + k;
          cnt = cnt + 1;
          }
          expect(cnt).assertEqual(4);
          expect(sumIdx).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_7500
         * @tc.name int32ArrayConstructorPart04TestMindmapTest075
         * @tc.desc Verify values dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(5, 6, 7);
          let dst: Int32Array = new Int32Array(src);
          let i: int = 0;
          for (let v of dst.values()) {
          expect(v).assertEqual(src.$_get(i));
          i = i + 1;
          }
          expect(i).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_7600
         * @tc.name int32ArrayConstructorPart04TestMindmapTest076
         * @tc.desc Verify at dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.at(0)).assertEqual(1);
          expect(dst.at(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_7700
         * @tc.name int32ArrayConstructorPart04TestMindmapTest077
         * @tc.desc Verify at dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.at(-1)).assertEqual(3);
          expect(dst.at(-3)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_7800
         * @tc.name int32ArrayConstructorPart04TestMindmapTest078
         * @tc.desc Verify includes dst -1 true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(-1, 0, 1);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.includes(-1)).assertTrue();
          expect(dst.includes(2)).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_7900
         * @tc.name int32ArrayConstructorPart04TestMindmapTest079
         * @tc.desc Verify slice dst src
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
          let dst: Int32Array = new Int32Array(src);
          let s1: Int32Array = src.slice(1, 4);
          let s2: Int32Array = dst.slice(1, 4);
          expect(s2.length).assertEqual(s1.length);
          expect(s2.$_get(0)).assertEqual(s1.$_get(0));
          expect(s2.$_get(2)).assertEqual(s1.$_get(2));
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_8000
         * @tc.name int32ArrayConstructorPart04TestMindmapTest080
         * @tc.desc Verify find dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(10, 20, 30);
          let dst: Int32Array = new Int32Array(src);
          let found: number | undefined = dst.find((v: number, i: int, a: Int32Array): boolean => v === 20);
          expect(found).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_8100
         * @tc.name int32ArrayConstructorPart04TestMindmapTest081
         * @tc.desc Verify findIndex dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(10, 20, 30);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.findIndex((v: number, i: int, a: Int32Array): boolean => v === 30)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_8200
         * @tc.name int32ArrayConstructorPart04TestMindmapTest082
         * @tc.desc Verify findLast dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3, 2, 1);
          let dst: Int32Array = new Int32Array(src);
          let last: number | undefined = dst.findLast((v: number, i: int, a: Int32Array): boolean => v === 2);
          expect(last).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_8300
         * @tc.name int32ArrayConstructorPart04TestMindmapTest083
         * @tc.desc Verify join dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(1, 2, 3);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.join(',')).assertEqual('1,2,3');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_8400
         * @tc.name int32ArrayConstructorPart04TestMindmapTest084
         * @tc.desc Verify toString dst
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = Int32Array.of(4, 5, 6);
          let dst: Int32Array = new Int32Array(src);
          expect(dst.toString()).assertEqual(src.toString());
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_8500
         * @tc.name int32ArrayConstructorPart04TestMindmapTest085
         * @tc.desc Verify null other
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          try {
            new Int32Array(null as Object as Int32Array);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_8600
         * @tc.name int32ArrayConstructorPart04TestMindmapTest086
         * @tc.desc Verify undefined other
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          try {
            new Int32Array(undefined as Object as Int32Array);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_8700
         * @tc.name int32ArrayConstructorPart04TestMindmapTest087
         * @tc.desc Verify Object other
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          try {
            let obj: Object = new Object();
            new Int32Array(obj as Int32Array);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART04_TEST_MINDMAP_8800
         * @tc.name int32ArrayConstructorPart04TestMindmapTest088
         * @tc.desc Verify 64
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayConstructorPart04TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array(64);
          for (let i: int = 0; i < 64; i++) {
          src.$_set(i, i);
          }
          let dst: Int32Array = new Int32Array(src);
          expect(dst.length).assertEqual(64);
          expect(dst.$_get(63)).assertEqual(63);
        });
  });
}
