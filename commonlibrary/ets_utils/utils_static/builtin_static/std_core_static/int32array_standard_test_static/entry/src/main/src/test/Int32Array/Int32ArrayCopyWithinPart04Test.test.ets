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
export default function int32ArrayCopyWithinPart04TestMindmapTestTest(): void {
  describe('Int32ArrayCopyWithinPart04TestMindmapTestTest', (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0010
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest001
         * @tc.desc Verify 3 copyWithin snapshot [0,2) pos1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([11, 22, 33]);
          let before0: number = arr.$_get(0);
          let before1: number = arr.$_get(1);
          let before2: number = arr.$_get(2);
          arr.copyWithin(1, 0, 2);
          expect(before0).assertEqual(11);
          expect(before1).assertEqual(22);
          expect(before2).assertEqual(33);
          expect(arr.$_get(0)).assertEqual(11);
          expect(arr.$_get(1)).assertEqual(11);
          expect(arr.$_get(2)).assertEqual(22);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0020
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest002
         * @tc.desc Verify copyWithin BYTES_PER_ELEMENT 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(2, 0);
          expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0030
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest003
         * @tc.desc Verify copyWithin byteOffset 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.copyWithin(0, 1);
          expect(arr.byteOffset).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0040
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest004
         * @tc.desc Verify copyWithin buffer ArrayBuffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          let buf: ArrayBuffer = arr.buffer;
          arr.copyWithin(1, 0);
          expect(arr.buffer).assertEqual(buf);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0050
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest005
         * @tc.desc Verify copyWithin length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          arr.copyWithin(0, 2, 4);
          expect(arr.length).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0060
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest006
         * @tc.desc Verify 5 [1,4) pos0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          arr.copyWithin(0, 1, 4);
          expect(arr.$_get(0)).assertEqual(20);
          expect(arr.$_get(1)).assertEqual(30);
          expect(arr.$_get(2)).assertEqual(40);
          expect(arr.$_get(3)).assertEqual(40);
          expect(arr.$_get(4)).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0070
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest007
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          arr.copyWithin(0, 2, 4);
          expect(arr.$_get(4)).assertEqual(5);
          expect(arr.$_get(5)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0080
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest008
         * @tc.desc Verify copyWithin target>0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(3, 0, 2);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0090
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest009
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
          arr.copyWithin(1, 0, 3);
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(1)).assertEqual(7);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0100
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest010
         * @tc.desc Verify copyWithin(0,0)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(0, 0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0110
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest011
         * @tc.desc Verify copyWithin byteLength length*4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(1, 0, 2);
          expect(arr.byteLength).assertEqual(16);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0120
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest012
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(2, 0, 2);
          arr.copyWithin(2, 0, 2);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(10);
          expect(arr.$_get(3)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0130
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest013
         * @tc.desc Verify copyWithin copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([9, 8, 7, 6]);
          arr.copyWithin(3, 0, 1);
          arr.copyWithin(3, 0, 1);
          expect(arr.$_get(0)).assertEqual(9);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0140
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest014
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(0, 3, 5);
          arr.copyWithin(3, 0, 2);
          expect(arr.$_get(0)).assertEqual(4);
          expect(arr.$_get(1)).assertEqual(5);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0150
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest015
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(0, 2);
          arr.copyWithin(2, 0, 2);
          expect(arr.$_get(0)).assertEqual(30);
          expect(arr.$_get(1)).assertEqual(40);
          expect(arr.$_get(2)).assertEqual(30);
          expect(arr.$_get(3)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0160
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest016
         * @tc.desc Verify copyWithin this
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          let r: Int32Array = arr.copyWithin(4, 0, 2).copyWithin(0, 2, 4).copyWithin(2, 4, 6);
          expect(r).assertEqual(arr);
          expect(arr.$_get(0)).assertEqual(3);
          expect(arr.$_get(1)).assertEqual(4);
          expect(arr.length).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0170
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest017
         * @tc.desc Verify copyWithin this
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          let outer: Int32Array = arr.copyWithin(2, 0, 2).copyWithin(0, 2, 4);
          expect(outer.$_get(0)).assertEqual(1);
          expect(outer.$_get(1)).assertEqual(2);
          expect(outer.$_get(2)).assertEqual(1);
          expect(outer.$_get(3)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0180
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest018
         * @tc.desc Verify copyWithin target=start
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
          arr.copyWithin(1, 1, 3);
          expect(arr.$_get(0)).assertEqual(11);
          expect(arr.$_get(1)).assertEqual(22);
          expect(arr.$_get(2)).assertEqual(33);
          expect(arr.$_get(3)).assertEqual(44);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0190
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest019
         * @tc.desc Verify target=0, start=1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(0, 1);
          expect(arr.$_get(0)).assertEqual(2);
          expect(arr.$_get(1)).assertEqual(3);
          expect(arr.$_get(2)).assertEqual(4);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0200
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest020
         * @tc.desc Verify target=1, start=2 5
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          arr.copyWithin(1, 2);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(30);
          expect(arr.$_get(2)).assertEqual(40);
          expect(arr.$_get(3)).assertEqual(50);
          expect(arr.$_get(4)).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0210
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest021
         * @tc.desc Verify target=0, start=2, end=4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(0, 2, 4);
          expect(arr.$_get(0)).assertEqual(3);
          expect(arr.$_get(1)).assertEqual(4);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0220
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest022
         * @tc.desc Verify target=0, start=1, end=3 target
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7, 8]);
          arr.copyWithin(0, 1, 3);
          expect(arr.$_get(0)).assertEqual(6);
          expect(arr.$_get(1)).assertEqual(7);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0230
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest023
         * @tc.desc Verify target=2, start=0 end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(2, 0);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0240
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest024
         * @tc.desc Verify target=3, start=0, end=2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          arr.copyWithin(3, 0, 2);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(30);
          expect(arr.$_get(3)).assertEqual(10);
          expect(arr.$_get(4)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0250
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest025
         * @tc.desc Verify target=2, start=0, end=3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(2, 0, 3);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(2);
          expect(arr.$_get(4)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0260
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest026
         * @tc.desc Verify target=1, start=0, end=3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(1, 0, 3);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(10);
          expect(arr.$_get(2)).assertEqual(20);
          expect(arr.$_get(3)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0270
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest027
         * @tc.desc Verify target=length-2, start=0, end=2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([7, 8, 9, 10]);
          arr.copyWithin(2, 0, 2);
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(1)).assertEqual(8);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0280
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest028
         * @tc.desc Verify target=-3 start=-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          arr.copyWithin(-3, -1);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(50);
          expect(arr.$_get(3)).assertEqual(40);
          expect(arr.$_get(4)).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0290
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest029
         * @tc.desc Verify target=-1 start=-3 end=-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(-1, -3, -1);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0300
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest030
         * @tc.desc Verify target=0 start=-2 end=-1 start/end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(0, -2, -1);
          expect(arr.$_get(0)).assertEqual(30);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(30);
          expect(arr.$_get(3)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0310
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest031
         * @tc.desc Verify target=1 start=-3 end=-1 start/end target
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(1, -3, -1);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(3);
          expect(arr.$_get(2)).assertEqual(4);
          expect(arr.$_get(3)).assertEqual(4);
          expect(arr.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0320
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest032
         * @tc.desc Verify target=-length 0 start=1 end=3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([100, 200, 300, 400]);
          arr.copyWithin(-4, 1, 3);
          expect(arr.$_get(0)).assertEqual(200);
          expect(arr.$_get(1)).assertEqual(300);
          expect(arr.$_get(2)).assertEqual(300);
          expect(arr.$_get(3)).assertEqual(400);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0330
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest033
         * @tc.desc Verify copyWithin reverse copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(0, 2).reverse();
          expect(arr.$_get(0)).assertEqual(4);
          expect(arr.$_get(1)).assertEqual(3);
          expect(arr.$_get(2)).assertEqual(4);
          expect(arr.$_get(3)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0340
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest034
         * @tc.desc Verify copyWithin fill
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(2, 0, 2).fill(99, 0, 1);
          expect(arr.$_get(0)).assertEqual(99);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(10);
          expect(arr.$_get(3)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0350
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest035
         * @tc.desc Verify fill copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.fill(7).copyWithin(2, 0, 2);
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(1)).assertEqual(7);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0360
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest036
         * @tc.desc Verify copyWithin sort length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([3, 1, 4, 2]);
          arr.copyWithin(2, 0, 2).sort();
          expect(arr.length).assertEqual(4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0370
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest037
         * @tc.desc Verify copyWithin subarray
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          let sub: Int32Array = arr.copyWithin(2, 0, 2).subarray(2, 4);
          expect(sub.$_get(0)).assertEqual(10);
          expect(sub.$_get(1)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0380
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest038
         * @tc.desc Verify set copyWithin set
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          let src: Int32Array = new Int32Array([5, 6, 7, 8]);
          arr.set(src);
          arr.copyWithin(0, 2);
          expect(arr.$_get(0)).assertEqual(7);
          expect(arr.$_get(1)).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0390
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest039
         * @tc.desc Verify copyWithin reverse copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          arr.copyWithin(0, 3).reverse().copyWithin(3, 0, 3);
          expect(arr.length).assertEqual(6);
          expect(arr.$_get(3)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0400
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest040
         * @tc.desc Verify copyWithin for
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(0, 2, 5);
          let sum: number = 0;
          for (let i = 0; i < arr.length; i++) {
          sum = sum + arr.$_get(i);
          }
          expect(sum).assertEqual(21);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0410
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest041
         * @tc.desc Verify copyWithin forEach
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(0, 2);
          let sum: number = 0;
          arr.forEach((v: number) => { sum = sum + v; });
          expect(sum).assertEqual(140);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0420
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest042
         * @tc.desc Verify copyWithin reduce
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(2, 0);
          let s: number = arr.reduce((acc: number, v: number, _i: int, _a: Int32Array): number => acc + v, 0);
          expect(s).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0430
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest043
         * @tc.desc Verify copyWithin indexOf
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
          arr.copyWithin(2, 0, 2);
          expect(arr.indexOf(11)).assertEqual(0);
          expect(arr.indexOf(22)).assertEqual(1);
          expect(arr.indexOf(33)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0440
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest044
         * @tc.desc Verify copyWithin includes true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([5, 6, 7, 8]);
          arr.copyWithin(0, 2);
          expect(arr.includes(7)).assertTrue();
          expect(arr.includes(5)).assertFalse();
          expect(arr.includes(8)).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0450
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest045
         * @tc.desc Verify copyWithin for-of FixedArray
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(0, 2);
          let collected: Array<number> = new Array<number>();
          for (const v of arr) {
          collected.push(v);
          }
          expect(collected.length).assertEqual(4);
          expect(collected[0]).assertEqual(30);
          expect(collected[3]).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0460
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest046
         * @tc.desc Verify copyWithin every
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(2, 0, 2);
          let allPositive: boolean = arr.every((v: number): boolean => v > 0);
          expect(allPositive).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0470
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest047
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([100, 200, 300]);
          let snap: number = arr.$_get(0);
          arr.copyWithin(0, 1, 3);
          expect(snap).assertEqual(100);
          expect(arr.$_get(0)).assertEqual(200);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0480
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest048
         * @tc.desc Verify copyWithin forEach
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          arr.copyWithin(2, 0, 3);
          let acc: string = '';
          arr.forEach((v: number) => { acc = acc + v.toString() + ','; });
          expect(acc).assertEqual('1,2,1,2,3,');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0490
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest049
         * @tc.desc Verify copyWithin entries
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
          arr.copyWithin(1, 2);
          let iter = arr.entries();
          let first = iter.next();
          expect(first.done).assertFalse();
          expect(first.value![1]).assertEqual(10);
          let second = iter.next();
          expect(second.value![1]).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0500
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest050
         * @tc.desc Verify copyWithin keys 0..length-1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.copyWithin(0, 1);
          let count: number = 0;
          for (const k of arr.keys()) {
          count = count + 1;
          }
          expect(count).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0510
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest051
         * @tc.desc Verify copyWithin(0,0,0) this
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(0);
          let r: Int32Array = arr.copyWithin(0, 0, 0);
          expect(r).assertEqual(arr);
          expect(arr.length).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0520
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest052
         * @tc.desc Verify copyWithin(0,0)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([42]);
          arr.copyWithin(0, 0);
          expect(arr.$_get(0)).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0530
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest053
         * @tc.desc Verify copyWithin(0,0,1) end
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([77]);
          arr.copyWithin(0, 0, 1);
          expect(arr.$_get(0)).assertEqual(77);
          expect(arr.length).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0540
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest054
         * @tc.desc Verify 8 target=4 start=0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6, 7, 8]);
          arr.copyWithin(4, 0, 4);
          expect(arr.$_get(4)).assertEqual(1);
          expect(arr.$_get(5)).assertEqual(2);
          expect(arr.$_get(6)).assertEqual(3);
          expect(arr.$_get(7)).assertEqual(4);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0550
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest055
         * @tc.desc Verify 8 target=0 start=4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6, 7, 8]);
          arr.copyWithin(0, 4, 8);
          expect(arr.$_get(0)).assertEqual(5);
          expect(arr.$_get(1)).assertEqual(6);
          expect(arr.$_get(2)).assertEqual(7);
          expect(arr.$_get(3)).assertEqual(8);
          expect(arr.$_get(4)).assertEqual(5);
          expect(arr.$_get(7)).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0560
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest056
         * @tc.desc Verify 6 target=2 start=0 end=4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
          arr.copyWithin(2, 0, 4);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(10);
          expect(arr.$_get(3)).assertEqual(20);
          expect(arr.$_get(4)).assertEqual(30);
          expect(arr.$_get(5)).assertEqual(40);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0570
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest057
         * @tc.desc Verify 6 target=1 start=3 end=6
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          arr.copyWithin(1, 3, 6);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(4);
          expect(arr.$_get(2)).assertEqual(5);
          expect(arr.$_get(3)).assertEqual(6);
          expect(arr.$_get(4)).assertEqual(5);
          expect(arr.$_get(5)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0580
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest058
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-5, 0, 5, -10]);
          arr.copyWithin(2, 0, 2);
          expect(arr.$_get(2)).assertEqual(-5);
          expect(arr.$_get(3)).assertEqual(0);
          expect(arr.$_get(0)).assertEqual(-5);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0590
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest059
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, -2, -3, -4]);
          arr.copyWithin(0, 2);
          expect(arr.$_get(0)).assertEqual(-3);
          expect(arr.$_get(1)).assertEqual(-4);
          expect(arr.$_get(2)).assertEqual(-3);
          expect(arr.$_get(3)).assertEqual(-4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0600
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest060
         * @tc.desc Verify -1/0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, 0, -1, 0]);
          arr.copyWithin(2, 0, 2);
          expect(arr.$_get(0)).assertEqual(-1);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(-1);
          expect(arr.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0610
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest061
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 0, 1, 0, 1, 0]);
          arr.copyWithin(2, 0, 4);
          expect(arr.$_get(2)).assertEqual(1);
          expect(arr.$_get(3)).assertEqual(0);
          expect(arr.$_get(4)).assertEqual(1);
          expect(arr.$_get(5)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0620
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest062
         * @tc.desc Verify -1 (0xFFFFFFFF) memmove
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-1, 2, 3, 4]);
          arr.copyWithin(2, 0, 2);
          expect(arr.$_get(2)).assertEqual(-1);
          expect(arr.$_get(3)).assertEqual(2);
          expect(arr.$_get(0)).assertEqual(-1);
          expect(arr.$_get(1)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0630
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest063
         * @tc.desc Verify -1 memmove
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, -1, 4]);
          arr.copyWithin(0, 2, 4);
          expect(arr.$_get(0)).assertEqual(-1);
          expect(arr.$_get(1)).assertEqual(4);
          expect(arr.$_get(2)).assertEqual(-1);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0640
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest064
         * @tc.desc Verify 2^32 ToInt32 0 copyWithin 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.$_set(0, 0);
          arr.$_set(1, 7);
          arr.$_set(2, 8);
          arr.copyWithin(2, 0, 1);
          expect(arr.$_get(2)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0650
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest065
         * @tc.desc Verify 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([0, 0, 55, 66]);
          arr.copyWithin(2, 0, 2);
          expect(arr.$_get(2)).assertEqual(0);
          expect(arr.$_get(3)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0660
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest066
         * @tc.desc Verify INT32_MAX
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647, 2, 3, 4]);
          arr.copyWithin(1, 0, 3);
          expect(arr.$_get(1)).assertEqual(2147483647);
          expect(arr.$_get(2)).assertEqual(2);
          expect(arr.$_get(3)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0670
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest067
         * @tc.desc Verify INT32_MIN
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([-2147483648, 2, 3, 4]);
          arr.copyWithin(3, 0, 1);
          expect(arr.$_get(3)).assertEqual(-2147483648);
          expect(arr.$_get(0)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0680
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest068
         * @tc.desc Verify copyWithin target=2 start=0 end=1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(4);
          arr.$_set(0, 0);
          arr.$_set(1, 1);
          arr.$_set(2, 2);
          arr.$_set(3, 3);
          arr.copyWithin(2, 0, 1);
          expect(arr.$_get(2)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0690
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest069
         * @tc.desc Verify copyWithin target=1 start=0 end=1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.$_set(0, 0);
          arr.$_set(1, 5);
          arr.$_set(2, 6);
          arr.copyWithin(1, 0, 1);
          expect(arr.$_get(1)).assertEqual(0);
          expect(arr.$_get(0)).assertEqual(0);
          expect(arr.$_get(2)).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0700
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest070
         * @tc.desc Verify copyWithin target=2 start=0 end=1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.$_set(0, 0);
          arr.$_set(1, 20);
          arr.$_set(2, 30);
          arr.copyWithin(2, 0, 1);
          expect(arr.$_get(2)).assertEqual(0);
          expect(arr.$_get(1)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0710
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest071
         * @tc.desc Verify 2147483648 ToInt32 -2147483648 copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.$_set(0, -2147483648);
          arr.$_set(1, 11);
          arr.$_set(2, 22);
          arr.copyWithin(2, 0, 1);
          expect(arr.$_get(2)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0720
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest072
         * @tc.desc Verify 4294967297 ToInt32 1 copyWithin 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.$_set(0, 1);
          arr.$_set(1, 88);
          arr.$_set(2, 99);
          arr.copyWithin(2, 0, 1);
          expect(arr.$_get(2)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0730
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest073
         * @tc.desc Verify -2147483649 ToInt32 2147483647 copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(3);
          arr.$_set(0, 2147483647);
          arr.$_set(1, 50);
          arr.$_set(2, 60);
          arr.copyWithin(1, 0, 1);
          expect(arr.$_get(1)).assertEqual(2147483647);
          expect(arr.$_get(0)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0740
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest074
         * @tc.desc Verify INT32_MAX copyWithin target=1 start=0 end=1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.$_set(0, 2147483647);
          arr.$_set(1, 0);
          arr.copyWithin(1, 0, 1);
          expect(arr.$_get(1)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0750
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest075
         * @tc.desc Verify -0 0 copyWithin 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array(2);
          arr.$_set(0, 0);
          arr.$_set(1, 123);
          arr.copyWithin(1, 0, 1);
          expect(arr.$_get(1)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0760
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest076
         * @tc.desc Verify MAX/MIN/-1/0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([2147483647, -2147483648, -1, 0, 100]);
          arr.copyWithin(0, 0, 5);
          expect(arr.$_get(0)).assertEqual(2147483647);
          expect(arr.$_get(1)).assertEqual(-2147483648);
          expect(arr.$_get(2)).assertEqual(-1);
          expect(arr.$_get(3)).assertEqual(0);
          expect(arr.$_get(4)).assertEqual(100);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0770
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest077
         * @tc.desc Verify INT32_MIN target<start
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, -2147483648, 3, 4]);
          arr.copyWithin(0, 1, 3);
          expect(arr.$_get(0)).assertEqual(-2147483648);
          expect(arr.$_get(1)).assertEqual(3);
          expect(arr.$_get(2)).assertEqual(3);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0780
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest078
         * @tc.desc Verify target=INT32_MAX clamp length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.copyWithin(2147483647, 0, 2);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0790
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest079
         * @tc.desc Verify start=INT32_MIN clamp 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([10, 20, 30]);
          arr.copyWithin(1, -2147483648, 2);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(10);
          expect(arr.$_get(2)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0800
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest080
         * @tc.desc Verify end=INT32_MAX clamp length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
          arr.copyWithin(0, 1, 2147483647);
          expect(arr.$_get(0)).assertEqual(2);
          expect(arr.$_get(1)).assertEqual(3);
          expect(arr.$_get(2)).assertEqual(4);
          expect(arr.$_get(3)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0810
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest081
         * @tc.desc Verify end=INT32_MIN clamp 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Int32Array = new Int32Array([1, 2, 3]);
          arr.copyWithin(0, 0, -2147483648);
          expect(arr.$_get(0)).assertEqual(1);
          expect(arr.$_get(1)).assertEqual(2);
          expect(arr.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0820
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest082
         * @tc.desc Verify Int32Array copyWithin subarray
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([10, 20, 30, 40]);
          let child: Int32Array = parent.subarray(0, 4);
          parent.copyWithin(2, 0, 2);
          expect(child.$_get(2)).assertEqual(10);
          expect(child.$_get(3)).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0830
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest083
         * @tc.desc Verify copyWithin byteOffset=8
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          let child: Int32Array = new Int32Array(parent.buffer, 8, 3);
          parent.copyWithin(2, 0, 3);
          expect(child.$_get(0)).assertEqual(1);
          expect(child.$_get(1)).assertEqual(2);
          expect(child.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0840
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest084
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([11, 22, 33, 44]);
          let child: Int32Array = new Int32Array(parent.buffer, 8, 2);
          parent.copyWithin(0, 2, 4);
          expect(child.$_get(0)).assertEqual(33);
          expect(child.$_get(1)).assertEqual(44);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0850
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest085
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
          let child: Int32Array = new Int32Array(parent.buffer, 0, 4);
          parent.copyWithin(0, 2);
          expect(child.$_get(0)).assertEqual(3);
          expect(child.$_get(1)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0860
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest086
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
          let child: Int32Array = new Int32Array(parent.buffer, 0, 4);
          child.copyWithin(2, 0, 2);
          expect(parent.$_get(2)).assertEqual(10);
          expect(parent.$_get(3)).assertEqual(20);
          expect(parent.$_get(4)).assertEqual(50);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0870
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest087
         * @tc.desc Verify copyWithin byteOffset
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          let child: Int32Array = new Int32Array(parent.buffer, 8, 4);
          child.copyWithin(2, 0, 2);
          expect(parent.$_get(0)).assertEqual(1);
          expect(parent.$_get(1)).assertEqual(2);
          expect(parent.$_get(2)).assertEqual(3);
          expect(parent.$_get(3)).assertEqual(4);
          expect(parent.$_get(4)).assertEqual(3);
          expect(parent.$_get(5)).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0880
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest088
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([100, 200, 300, 400]);
          let child: Int32Array = new Int32Array(parent.buffer, 4, 3);
          child.copyWithin(2, 0, 1);
          expect(parent.$_get(0)).assertEqual(100);
          expect(parent.$_get(1)).assertEqual(200);
          expect(parent.$_get(3)).assertEqual(200);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0890
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest089
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          let child: Int32Array = new Int32Array(parent.buffer, 4, 2);
          child.copyWithin(1, 0, 1);
          expect(parent.$_get(0)).assertEqual(1);
          expect(parent.$_get(1)).assertEqual(2);
          expect(parent.$_get(2)).assertEqual(2);
          expect(parent.$_get(3)).assertEqual(4);
          expect(parent.$_get(4)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0900
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest090
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
          let bro1: Int32Array = new Int32Array(parent.buffer, 0, 3);
          let bro2: Int32Array = new Int32Array(parent.buffer, 12, 3);
          bro1.copyWithin(1, 0, 2);
          expect(bro2.$_get(0)).assertEqual(40);
          expect(bro2.$_get(1)).assertEqual(50);
          expect(bro2.$_get(2)).assertEqual(60);
          expect(bro1.$_get(1)).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0910
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest091
         * @tc.desc Verify copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
          let bro1: Int32Array = new Int32Array(parent.buffer, 0, 3);
          let bro2: Int32Array = new Int32Array(parent.buffer, 4, 3);
          bro2.copyWithin(2, 0, 1);
          expect(bro1.$_get(2)).assertEqual(3);
          expect(bro2.$_get(2)).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0920
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest092
         * @tc.desc Verify copyWithin subarray copyWithin buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          let child: Int32Array = parent.subarray(0, 4);
          parent.copyWithin(0, 2, 6);
          child.copyWithin(2, 0, 2);
          expect(parent.$_get(0)).assertEqual(3);
          expect(parent.$_get(1)).assertEqual(4);
          expect(parent.$_get(2)).assertEqual(3);
          expect(parent.$_get(3)).assertEqual(4);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0980
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest098
         * @tc.desc Verify Int32Array copyWithin buffer Uint32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(8);
          let i32: Int32Array = new Int32Array(buf, 0, 2);
          i32.$_set(0, 123456);
          i32.$_set(1, 0);
          i32.copyWithin(1, 0, 1);
          let u32: Uint32Array = new Uint32Array(buf, 0, 2);
          expect(u32.$_get(1)).assertEqual(123456);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_0990
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest099
         * @tc.desc Verify Int32Array copyWithin -1(0xFFFFFFFF) Uint32Array 4294967295
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(8);
          let i32: Int32Array = new Int32Array(buf);
          i32.$_set(0, -1);
          i32.$_set(1, 0);
          i32.copyWithin(1, 0, 1);
          let u32: Uint32Array = new Uint32Array(buf);
          expect(u32.$_get(1)).assertEqual(4294967295);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_1000
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest100
         * @tc.desc Verify copyWithin buffer Int8Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let buf: ArrayBuffer = new ArrayBuffer(4);
          let i32: Int32Array = new Int32Array(buf);
          i32.$_set(0, 1);
          let i8: Int8Array = new Int8Array(buf);
          i32.copyWithin(0, 0, 1);
          expect(i8.length).assertEqual(4);
          expect(i32.$_get(0)).assertEqual(1);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_1010
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest101
         * @tc.desc Verify copyWithin subarray
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
          a.copyWithin(0, 3);
          let s: Int32Array = a.subarray(0, 3);
          expect(s.$_get(0)).assertEqual(4);
          expect(s.$_get(1)).assertEqual(5);
          expect(s.$_get(2)).assertEqual(6);
          expect(s.length).assertEqual(3);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_1020
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest102
         * @tc.desc Verify subarray copyWithin
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([10, 20, 30, 40]);
          let s: Int32Array = a.subarray(1, 3);
          a.copyWithin(0, 2);
          expect(s.$_get(0)).assertEqual(40);
          expect(s.$_get(1)).assertEqual(30);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_1030
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest103
         * @tc.desc Verify copyWithin slice
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3, 4]);
          a.copyWithin(0, 2);
          let cp: Int32Array = a.slice();
          a.$_set(0, 999);
          expect(cp.$_get(0)).assertEqual(3);
          expect(cp.$_get(1)).assertEqual(4);
        });
        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_COPY_WITHIN_PART04_TEST_MINDMAP_1040
         * @tc.name int32ArrayCopyWithinPart04TestMindmapTest104
         * @tc.desc Verify copyWithin subarray buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayCopyWithinPart04TestMindmapTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
          a.copyWithin(0, 2, 5);
          let tail: Int32Array = a.subarray(2, 5);
          expect(tail.$_get(0)).assertEqual(5);
          expect(tail.buffer).assertEqual(a.buffer);
        });
  });
}