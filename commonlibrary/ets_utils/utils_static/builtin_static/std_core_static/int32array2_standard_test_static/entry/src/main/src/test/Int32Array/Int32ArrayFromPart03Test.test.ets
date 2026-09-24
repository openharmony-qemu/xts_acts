'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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

export default function int32ArrayFromPart03Test(): void {
  describe('Int32ArrayFromPart03Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayFromPart03TestMindmapTest001
     * @tc.desc Verify from() 1 Int32Array Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(3);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.length).assertEqual(3);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayFromPart03TestMindmapTest002
     * @tc.desc Verify from() 0-length array creates Int32Array with length=0, byteLength=0, byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(0);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.length).assertEqual(0);
      expect(dst.byteLength).assertEqual(0);
      expect(dst.byteOffset).assertEqual(0);
      expect(src.buffer).not().assertEqual(dst.buffer);
      expect(src).not().assertEqual(dst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayFromPart03TestMindmapTest003
     * @tc.desc Verify from() 1 Int32Array length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(1);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayFromPart03TestMindmapTest004
     * @tc.desc Verify from() 64 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(64);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.length).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayFromPart03TestMindmapTest005
     * @tc.desc Verify from() begin >= end subarray length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3, 4);
      let src: Int32Array = base.subarray(3, 2);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayFromPart03TestMindmapTest006
     * @tc.desc Verify from() [0] 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(0);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayFromPart03TestMindmapTest007
     * @tc.desc Verify from() [-1] 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(-1);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayFromPart03TestMindmapTest008
     * @tc.desc Verify from() [-2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(-2);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayFromPart03TestMindmapTest009
     * @tc.desc Verify from() [2147483647] INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(2147483647);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayFromPart03TestMindmapTest010
     * @tc.desc Verify from() [-2147483648] INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(-2147483648);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayFromPart03TestMindmapTest011
     * @tc.desc Verify from() [1,2] 1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayFromPart03TestMindmapTest012
     * @tc.desc Verify from() [3,-3,3] / /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(3, -3, 3);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(3);
      expect(dst.$_get(1)).assertEqual(-3);
      expect(dst.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayFromPart03TestMindmapTest013
     * @tc.desc Verify from() [-5,-4,-3,-2,-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(-5, -4, -3, -2, -1);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(-5);
      expect(dst.$_get(2)).assertEqual(-3);
      expect(dst.$_get(4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayFromPart03TestMindmapTest014
     * @tc.desc Verify from() [10,20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(10, 20, 30, 40);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(10);
      expect(dst.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayFromPart03TestMindmapTest015
     * @tc.desc Verify from() [40,30,20,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(40, 30, 20, 10);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(40);
      expect(dst.$_get(3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayFromPart03TestMindmapTest016
     * @tc.desc Verify from() 0 4 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(4);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(0);
      expect(dst.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayFromPart03TestMindmapTest017
     * @tc.desc Verify from() INT_MAX/INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(2147483647, 0, -2147483648);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(2147483647);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayFromPart03TestMindmapTest018
     * @tc.desc Verify from() INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2147483647, 2);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayFromPart03TestMindmapTest019
     * @tc.desc Verify from() INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, -2147483648);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayFromPart03TestMindmapTest020
     * @tc.desc Verify from() 64 i 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(64);
      for (let i: int = 0; i < 64; i++) {
        src.$_set(i, i);
      }
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayFromPart03TestMindmapTest021
     * @tc.desc Verify from() 64 i
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(64);
      for (let i: int = 0; i < 64; i++) {
        src.$_set(i, i);
      }
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(32)).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayFromPart03TestMindmapTest022
     * @tc.desc Verify from() 64 i 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(64);
      for (let i: int = 0; i < 64; i++) {
        src.$_set(i, i);
      }
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(63)).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayFromPart03TestMindmapTest023
     * @tc.desc Verify from() Int32Array.of(...)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(7, 8, 9);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(7);
      expect(dst.$_get(1)).assertEqual(8);
      expect(dst.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayFromPart03TestMindmapTest024
     * @tc.desc Verify from() new Int32Array(buffer, 0, length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let src: Int32Array = new Int32Array(buf, 0, 3);
      src.$_set(0, 11);
      src.$_set(1, 22);
      src.$_set(2, 33);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(11);
      expect(dst.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayFromPart03TestMindmapTest025
     * @tc.desc Verify from() new Int32Array(buffer, 4, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let src: Int32Array = new Int32Array(buf, 4, 2);
      src.$_set(0, 100);
      src.$_set(1, 200);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.length).assertEqual(2);
      expect(dst.$_get(0)).assertEqual(100);
      expect(dst.$_get(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayFromPart03TestMindmapTest026
     * @tc.desc Verify from() subarray(1,3) buffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(10, 20, 30, 40);
      let src: Int32Array = base.subarray(1, 3);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.length).assertEqual(2);
      expect(dst.$_get(0)).assertEqual(20);
      expect(dst.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayFromPart03TestMindmapTest027
     * @tc.desc Verify from() subarray subarray(length-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let src: Int32Array = base.subarray(3);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.length).assertEqual(2);
      expect(dst.$_get(0)).assertEqual(4);
      expect(dst.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayFromPart03TestMindmapTest028
     * @tc.desc Verify from() slice(1,3) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(10, 20, 30, 40);
      let src: Int32Array = base.slice(1, 3);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(20);
      expect(dst.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayFromPart03TestMindmapTest029
     * @tc.desc Verify from() fill(7, 0, 4) 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(4);
      src.fill(7, 0, 4);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(7);
      expect(dst.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayFromPart03TestMindmapTest030
     * @tc.desc Verify from() ArrayBuffer(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let src: Int32Array = new Int32Array(buf);
      src.$_set(0, 42);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.length).assertEqual(1);
      expect(dst.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayFromPart03TestMindmapTest031
     * @tc.desc Verify from() ArrayBuffer(24) 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let src: Int32Array = new Int32Array(buf, 0, 6);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.length).assertEqual(6);
      expect(dst.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayFromPart03TestMindmapTest032
     * @tc.desc Verify from() copies Int32Array length and first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.length).assertEqual(3);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
      expect(dst.buffer.byteLength).assertEqual(12);
      expect(dst.buffer.byteLength).assertEqual(dst.byteLength);
      expect(src.buffer).not().assertEqual(dst.buffer);
      expect(src).not().assertEqual(dst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayFromPart03TestMindmapTest033
     * @tc.desc Verify from() byteOffset 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3, 4);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.byteOffset).assertEqual(0);
      expect(dst.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayFromPart03TestMindmapTest034
     * @tc.desc Verify from() subarray byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = new Int32Array(new ArrayBuffer(32), 0, 8);
      let src: Int32Array = base.subarray(2, 5);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.byteOffset).assertEqual(0);
      {
        let base: Int32Array = new Int32Array(new ArrayBuffer(32), 0, 8);
        let src: Int32Array = base.subarray(2, 5);
        let dst: Int32Array = Int32Array.from(src);
        expect(src.buffer).not().assertEqual(dst.buffer);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayFromPart03TestMindmapTest035
     * @tc.desc Verify from() byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(42);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayFromPart03TestMindmapTest036
     * @tc.desc Verify from() for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(5, 6, 7);
      let dst: Int32Array = Int32Array.from(src);
      let expected: number[] = [5, 6, 7];
      let i: int = 0;
      for (let v of dst) {
        expect(v).assertEqual(expected[i]);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayFromPart03TestMindmapTest037
     * @tc.desc Verify from() forEach value/index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(10, 20, 30);
      let dst: Int32Array = Int32Array.from(src);
      dst.forEach((value: number, index: int, arr: Int32Array): void => {
        expect(value).assertEqual(src.$_get(index));
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayFromPart03TestMindmapTest038
     * @tc.desc Verify from() for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(0);
      let dst: Int32Array = Int32Array.from(src);
      let count: number = 0;
      for (let v of dst) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayFromPart03TestMindmapTest039
     * @tc.desc Verify from() 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3);
      let dst: Int32Array = Int32Array.from(src);
      src.$_set(0, 999);
      expect(dst.$_get(0)).assertEqual(1);
      {
        let src: Int32Array = Int32Array.of(1, 2, 3);
        let dst: Int32Array = Int32Array.from(src);
        dst.$_set(0, 888);
        expect(src.$_get(0)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayFromPart03TestMindmapTest040
     * @tc.desc Verify from() copy is unaffected by fill() mutations on source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3, 4);
      let dst: Int32Array = Int32Array.from(src);
      src.fill(0, 0, 4);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayFromPart03TestMindmapTest041
     * @tc.desc Verify source and from() copy remain independent after reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3);
      let dst: Int32Array = Int32Array.from(src);
      src.reverse();
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(2)).assertEqual(3);
      let source: Int32Array = Int32Array.of(1, 2, 3);
      let copy: Int32Array = Int32Array.from(source);
      copy.reverse();
      expect(source.$_get(0)).assertEqual(1);
      expect(source.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayFromPart03TestMindmapTest042
     * @tc.desc Verify from() copy is unaffected by $_set mutations on source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(10, 20, 30);
      let dst: Int32Array = Int32Array.from(src);
      src.$_set(0, 111);
      src.$_set(1, 222);
      src.$_set(2, 333);
      expect(dst.$_get(0)).assertEqual(10);
      expect(dst.$_get(1)).assertEqual(20);
      expect(dst.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayFromPart03TestMindmapTest043
     * @tc.desc Verify from() copy is independent of sibling view mutations on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let src: Int32Array = new Int32Array(buf, 0, 3);
      src.$_set(0, 1);
      src.$_set(1, 2);
      src.$_set(2, 3);
      let sibling: Int32Array = new Int32Array(buf, 0, 3);
      let dst: Int32Array = Int32Array.from(src);
      sibling.$_set(1, 999);
      expect(dst.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayFromPart03TestMindmapTest044
     * @tc.desc Verify from() produces independent copies that do not share storage between calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3);
      let dst1: Int32Array = Int32Array.from(src);
      let dst2: Int32Array = Int32Array.from(src);
      dst1.$_set(0, 111);
      expect(dst2.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayFromPart03TestMindmapTest045
     * @tc.desc Verify from() returns a new buffer that shares storage with the returned Int32Array but not with source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3);
      let dst: Int32Array = Int32Array.from(src);
      let dstView: Int32Array = new Int32Array(dst.buffer, 0, 3);
      dstView.$_set(0, 555);
      expect(src.$_get(0)).assertEqual(1);
      expect(dst.$_get(0)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayFromPart03TestMindmapTest046
     * @tc.desc Verify from() on a subarray creates a copy independent of base array modifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = new Int32Array(new ArrayBuffer(32), 0, 8);
      base.$_set(2, 100);
      base.$_set(3, 200);
      base.$_set(4, 300);
      let src: Int32Array = base.subarray(2, 5);
      let dst: Int32Array = Int32Array.from(src);
      base.$_set(3, 999);
      expect(dst.$_get(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayFromPart03TestMindmapTest047
     * @tc.desc Verify from() on an offset-constructed Int32Array creates an independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let src: Int32Array = new Int32Array(buf, 4, 2);
      src.$_set(0, 10);
      src.$_set(1, 20);
      let dst: Int32Array = Int32Array.from(src);
      src.$_set(0, 999);
      expect(dst.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayFromPart03TestMindmapTest048
     * @tc.desc Verify Int32Array.from(Int32Array.from(x))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(5, 6, 7, 8);
      let dst: Int32Array = Int32Array.from(Int32Array.from(src));
      expect(dst.length).assertEqual(4);
      expect(dst.$_get(0)).assertEqual(5);
      expect(dst.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayFromPart03TestMindmapTest049
     * @tc.desc Verify chained from() creates distinct buffers at each level of copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3);
      let dst: Int32Array = Int32Array.from(Int32Array.from(src));
      expect(src.buffer).not().assertEqual(dst.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayFromPart03TestMindmapTest050
     * @tc.desc Verify from() in a chain copies the current snapshot of the intermediate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3);
      let mid: Int32Array = Int32Array.from(src);
      mid.$_set(0, 999);
      let dst: Int32Array = Int32Array.from(mid);
      expect(dst.$_get(0)).assertEqual(999);
      expect(src.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayFromPart03TestMindmapTest051
     * @tc.desc Verify from() [INT_MAX, INT_MIN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(2147483647, -2147483648);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(2147483647);
      expect(dst.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayFromPart03TestMindmapTest052
     * @tc.desc Verify from() [INT_MIN, 0, INT_MAX]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(-2147483648, 0, 2147483647);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(-2147483648);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayFromPart03TestMindmapTest053
     * @tc.desc Verify from(FixedArray) INT_MAX from INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.from([2147483647, -1, 0]);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(2147483647);
      expect(dst.$_get(1)).assertEqual(-1);
      expect(dst.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayFromPart03TestMindmapTest054
     * @tc.desc Verify from() [INT_MAX, INT_MAX, INT_MAX] INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(2147483647, 2147483647, 2147483647);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(2147483647);
      expect(dst.$_get(1)).assertEqual(2147483647);
      expect(dst.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayFromPart03TestMindmapTest055
     * @tc.desc Verify from() [INT_MIN, INT_MIN] INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(-2147483648, -2147483648);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(-2147483648);
      expect(dst.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayFromPart03TestMindmapTest056
     * @tc.desc Verify from() sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(3, 1, 2);
      src.sort();
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayFromPart03TestMindmapTest057
     * @tc.desc Verify from() captures the array state after copyWithin() has mutated the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart03TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3, 4);
      src.copyWithin(2, 0, 2);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(2)).assertEqual(1);
      expect(dst.$_get(3)).assertEqual(2);
    });
  });
}
