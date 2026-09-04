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

export default function int32ArrayIndexSetPart05Test(): void {
  describe('Int32ArrayIndexSetPart05Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_0100
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest001
     * @tc.desc Verify $_set() index + int index=0 $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 42);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_0200
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest002
     * @tc.desc Verify $_set() index + number index=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(2, 7.9);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_0300
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest003
     * @tc.desc Verify $_set 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, 9);
      arr.$_set(3, 18);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(18);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_0400
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest004
     * @tc.desc Verify $_set stores values at two indices and their sum is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 5);
      arr.$_set(1, 6);
      let sum: number = (arr.$_get(0)) + (arr.$_get(1));
      expect(sum).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_0500
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest005
     * @tc.desc Verify $_set returns undefined after writing the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let r: Object | undefined = arr.$_set(0, 77);
      expect(r).assertUndefined();
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_0600
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest006
     * @tc.desc Verify $_set() index=0 -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, -1);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_0700
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest007
     * @tc.desc Verify $_set() index=length-1 -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(3, -1);
      expect(arr.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_0800
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest008
     * @tc.desc Verify $_set() length=2 index=1 321 321
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(1, 321);
      expect(arr.$_get(1)).assertEqual(321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_0900
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest009
     * @tc.desc Verify $_set() index int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      let i: int = 0;
      arr.$_set(i, 123);
      expect(arr.$_get(0)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_1000
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest010
     * @tc.desc Verify $_set() value=-1 -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.$_set(2, -1);
      expect(arr.$_get(2)).assertEqual(-1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_1100
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest011
     * @tc.desc Verify $_set() value=2 index=0 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2);
      expect(arr.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_1200
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest012
     * @tc.desc Verify $_set() value=-2 index=0 -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -2);
      expect(arr.$_get(0)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_1300
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest013
     * @tc.desc Verify $_set() value=65536 2^16 65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 65536);
      expect(arr.$_get(0)).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_1400
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest014
     * @tc.desc Verify $_set() value=2147483646 INT_MAX-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2147483646);
      expect(arr.$_get(0)).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_1500
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest015
     * @tc.desc Verify $_set() value=-2147483647 INT_MIN+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -2147483647);
      expect(arr.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_1600
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest016
     * @tc.desc Verify $_set() a+b int+int=300+500 value 800
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let a: int = 300;
      let b: int = 500;
      arr.$_set(0, a + b);
      expect(arr.$_get(0)).assertEqual(800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_1700
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest017
     * @tc.desc Verify $_set() value=-0.999 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -0.999);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_1800
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest018
     * @tc.desc Verify $_set() value=1.0e-10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 1.0e-10);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_1900
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest019
     * @tc.desc Verify $_set() value=1000000.5 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 1000000.5);
      expect(arr.$_get(0)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_2000
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest020
     * @tc.desc Verify $_set() number*number 2.5*4.0=10.0 number 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let a: number = 2.5;
      let b: number = 4.0;
      arr.$_set(0, a * b);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_2100
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest021
     * @tc.desc Verify $_set() converts Number.NaN to 0 at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, 55);
      arr.$_set(2, Number.NaN);
      arr.$_set(3, 66);
      expect(arr.$_get(0)).assertEqual(55);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_2200
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest022
     * @tc.desc Verify $_set() value=+Number.POSITIVE_INFINITY index=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 303);
      arr.$_set(1, Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(303);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_2300
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest023
     * @tc.desc Verify $_set() -0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let b: Int32Array = new Int32Array(1);
      a.$_set(0, -0);
      b.$_set(0, 0);
      expect(a.$_get(0)).assertEqual(b.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_2400
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest024
     * @tc.desc Verify $_set() value=2.147483647e9 INT_MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2.147483647e9);
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_2500
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest025
     * @tc.desc Verify $_set() value=2147483648 index=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 100);
      arr.$_set(2, 200);
      arr.$_set(1, 2147483648);
      expect(arr.$_get(0)).assertEqual(100);
      expect(arr.$_get(1)).assertEqual(-2147483648);
      expect(arr.$_get(2)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_2600
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest026
     * @tc.desc Verify $_set() value=8589934592 0x200000000 2*2^32 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 8589934592);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_2700
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest027
     * @tc.desc Verify $_set() value=-4294967296 -2^32 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -4294967296);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_2800
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest028
     * @tc.desc Verify $_set() value=-2147483648.9 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -2147483648.9);
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_2900
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest029
     * @tc.desc Verify $_set() 2147483648 5 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2147483648);
      arr.$_set(0, 5);
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_3000
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest030
     * @tc.desc Verify $_set() 2147483648 4294967295 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2147483648);
      arr.$_set(0, 4294967295);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_3100
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest031
     * @tc.desc Verify $_set() ArrayBuffer Int32Array A B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 0, 3);
      let b: Int32Array = new Int32Array(buf, 0, 3);
      a.$_set(1, -1);
      expect(b.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_3200
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest032
     * @tc.desc Verify byteOffset=4 $_set 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let p: Int32Array = new Int32Array(buf, 0, 4);
      let c: Int32Array = new Int32Array(buf, 4, 2);
      c.$_set(0, 77);
      expect(p.$_get(1)).assertEqual(77);
      expect(p.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_3300
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest033
     * @tc.desc Verify $_set() 2 byteOffset=8 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let p: Int32Array = new Int32Array(buf, 0, 4);
      let c: Int32Array = new Int32Array(buf, 8, 2);
      p.$_set(2, 88);
      expect(c.$_get(0)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_3400
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest034
     * @tc.desc Verify $_set -1 Uint8Array 4 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let i32: Int32Array = new Int32Array(buf, 0, 1);
      let u8: Uint8Array = new Uint8Array(buf, 0, 4);
      i32.$_set(0, -1);
      expect(u8[0]).assertEqual(255);
      expect(u8[1]).assertEqual(255);
      expect(u8[2]).assertEqual(255);
      expect(u8[3]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_3500
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest035
     * @tc.desc Verify $_set INT_MIN 0x80000000 0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let i32: Int32Array = new Int32Array(buf, 0, 1);
      let u8: Uint8Array = new Uint8Array(buf, 0, 4);
      i32.$_set(0, -2147483648);
      expect(u8[0]).assertEqual(0);
      expect(u8[1]).assertEqual(0);
      expect(u8[2]).assertEqual(0);
      expect(u8[3]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_3600
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest036
     * @tc.desc Verify Int32Array $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      a.$_set(0, 11);
      a.$_set(1, 22);
      b.$_set(0, 33);
      b.$_set(1, 44);
      expect(a.$_get(0)).assertEqual(11);
      expect(a.$_get(1)).assertEqual(22);
      expect(b.$_get(0)).assertEqual(33);
      expect(b.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_3700
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest037
     * @tc.desc Verify $_set DataView getInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let i32: Int32Array = new Int32Array(buf, 0, 2);
      let dv: DataView = new DataView(buf);
      i32.$_set(0, 1234567);
      i32.$_set(1, -7654321);
      expect(dv.getInt32(0, true)).assertEqual(1234567);
      expect(dv.getInt32(4, true)).assertEqual(-7654321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_3800
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest038
     * @tc.desc Verify $_set() DataView Int32Array $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let i32: Int32Array = new Int32Array(buf, 0, 1);
      let dv: DataView = new DataView(buf);
      let index: int = 0;
      let value: number = 999;
      i32.$_set(index, value);
      expect(i32.$_get(index)).assertEqual(value);
      expect(dv.getInt32(0, true)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_3900
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest039
     * @tc.desc Verify slice $_set buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array([1, 2, 3, 4]);
      let cp: Int32Array = orig.slice();
      cp.$_set(0, 9999);
      expect(orig.$_get(0)).assertEqual(1);
      expect(cp.$_get(0)).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_4000
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest040
     * @tc.desc Verify subarray $_set buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sub: Int32Array = orig.subarray(1, 3);
      sub.$_set(0, 8888);
      expect(orig.$_get(1)).assertEqual(8888);
      expect(orig.$_get(0)).assertEqual(1);
      expect(orig.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_4100
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest041
     * @tc.desc Verify ArrayBuffer byteOffset=4, length=2 $_set Number.NaN 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      arr.$_set(1, Number.NaN);
      let full: Int32Array = new Int32Array(buf);
      expect(full.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_4200
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest042
     * @tc.desc Verify $_set for
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      arr.$_set(3, 40);
      let sum: number = 0;
      for (let i: int = 0; i < arr.length; i++) {
        sum = sum + (arr.$_get(i));
      }
      expect(sum).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_4300
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest043
     * @tc.desc Verify $_set() -1 0 INT_MAX INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, -1);
      arr.$_set(1, 0);
      arr.$_set(2, 2147483647);
      arr.$_set(3, -2147483648);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(2147483647);
      expect(arr.$_get(3)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_4400
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest044
     * @tc.desc Verify Int32Array.of $_set of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      arr.$_set(0, 999);
      expect(arr.$_get(0)).assertEqual(999);
      expect(arr.$_get(1)).assertEqual(22);
      expect(arr.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_4500
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest045
     * @tc.desc Verify Int32Array.from $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(7, 8, 9);
      let arr: Int32Array = Int32Array.from(src);
      arr.$_set(2, 777);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_4600
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest046
     * @tc.desc Verify new Int32Array(length) $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(1, 42);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(42);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_4700
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest047
     * @tc.desc Verify new Int32Array([...]) $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      arr.$_set(0, 55);
      arr.$_set(2, 77);
      expect(arr.$_get(0)).assertEqual(55);
      expect(arr.$_get(1)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_4800
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest048
     * @tc.desc Verify 128 $_set 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(128);
      arr.$_set(0, 123);
      arr.$_set(64, 456);
      arr.$_set(127, 789);
      expect(arr.$_get(0)).assertEqual(123);
      expect(arr.$_get(64)).assertEqual(456);
      expect(arr.$_get(127)).assertEqual(789);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(126)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_4900
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest049
     * @tc.desc Verify $_set() converts 2^53-1 to Int32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 9007199254740991.0);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART05_TEST_MINDMAP_5000
     * @tc.name int32ArrayIndexSetPart05TestMindmapTest050
     * @tc.desc Verify $_set() converts 2^53 to Int32 zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart05TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 9007199254740992.0);
      expect(arr.$_get(0)).assertEqual(0);
    });

  });
}
