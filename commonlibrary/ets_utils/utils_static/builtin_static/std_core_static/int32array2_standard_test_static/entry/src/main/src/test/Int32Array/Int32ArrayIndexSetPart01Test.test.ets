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

export default function int32ArrayIndexSetPart01Test(): void {
  describe('Int32ArrayIndexSetPart01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest001
     * @tc.desc Verify $_set returns undefined after writing the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let r: void = a.$_set(0, 7);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest002
     * @tc.desc Verify $_set() E int 123 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = 123;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest003
     * @tc.desc Verify $_set() number 3.7 ToInt32 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = 3.7;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest004
     * @tc.desc Verify $_set overwrites previous value at same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 11);
      a.$_set(0, 22);
      expect(a.$_get(0)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest005
     * @tc.desc Verify $_set length=4 0/1/2/3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.$_set(0, 10);
      a.$_set(1, 20);
      a.$_set(2, 30);
      a.$_set(3, 40);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
      expect(a.$_get(2)).assertEqual(30);
      expect(a.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest006
     * @tc.desc Verify $_set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      a.$_set(2, 7);
      expect(a.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest007
     * @tc.desc Verify $_set byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let before: number = a.byteLength;
      a.$_set(1, 9);
      expect(a.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest008
     * @tc.desc Verify 0 $_set 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.$_set(2, 77);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(77);
      expect(a.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest009
     * @tc.desc Verify $_set() index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.$_set(0, 100);
      expect(a.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest010
     * @tc.desc Verify $_set() index int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let i: int = 0;
      a.$_set(i, 55);
      expect(a.$_get(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest011
     * @tc.desc Verify $_set() index 2-1=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.$_set(2 - 1, 77);
      expect(a.$_get(1)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest012
     * @tc.desc Verify $_set() index=length-1 length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      a.$_set(a.length - 1, 400);
      expect(a.$_get(4)).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest013
     * @tc.desc Verify $_set() index=length-1 length=1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(a.length - 1, 999);
      expect(a.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest014
     * @tc.desc Verify $_set() index=2 length=5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      a.$_set(2, 222);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(222);
      expect(a.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest015
     * @tc.desc Verify $_set() index 1|2=3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.$_set(1 | 2, 111);
      expect(a.$_get(3)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest016
     * @tc.desc Verify $_set() index 1*2=2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.$_set(1 * 2, 88);
      expect(a.$_get(2)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest017
     * @tc.desc Verify $_set() index L=a.length L-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let L: int = a.length;
      a.$_set(L - 1, 7);
      expect(a.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest018
     * @tc.desc Verify $_set() index=0 length=5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      a.$_set(0, 1);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(0);
      expect(a.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest019
     * @tc.desc Verify $_set() index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 6, 7, 8]);
      a.$_set(0, 99);
      expect(a.$_get(0)).assertEqual(99);
      expect(a.$_get(1)).assertEqual(6);
      expect(a.$_get(2)).assertEqual(7);
      expect(a.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest020
     * @tc.desc Verify $_set() index=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      a.$_set(1, 200);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(200);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest021
     * @tc.desc Verify $_set() index=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      a.$_set(a.length - 1, 999);
      expect(a.$_get(3)).assertEqual(999);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest022
     * @tc.desc Verify $_set() index 0 length-1 i*10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      for (let i = 0; i < a.length; i++) {
        a.$_set(i, i * 10);
      }
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(10);
      expect(a.$_get(2)).assertEqual(20);
      expect(a.$_get(3)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest023
     * @tc.desc Verify $_set() value=-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -1);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest024
     * @tc.desc Verify $_set() value=-100 int -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: int = -100;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest025
     * @tc.desc Verify $_set() value=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([55]);
      a.$_set(0, 0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest026
     * @tc.desc Verify $_set() value=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 1);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest027
     * @tc.desc Verify $_set() value 7-2*3=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: int = 7 - 2 * 3;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest028
     * @tc.desc Verify $_set() value int 5 +2 10 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let acc: number = 0;
      for (let i = 0; i < 5; i++) {
        acc = acc + 2;
      }
      a.$_set(0, acc);
      expect(a.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest029
     * @tc.desc Verify $_set() E 50 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let p: number = 0;
      let n: int = -50;
      a.$_set(0, p);
      a.$_set(0, n);
      expect(a.$_get(0)).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest030
     * @tc.desc Verify $_set() E INT_MIN -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: int = -2147483648;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest031
     * @tc.desc Verify $_set() number 0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0.0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest032
     * @tc.desc Verify $_set() number -0.0 ToInt32(-0)===0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -0.0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest033
     * @tc.desc Verify $_set() number 0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0.5);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest034
     * @tc.desc Verify $_set() number -0.9 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -0.9);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest035
     * @tc.desc Verify $_set() number 2147483647.9 int32 max 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 2147483647.9);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest036
     * @tc.desc Verify $_set() 0x7FFFFFFF int32 max 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0x7FFFFFFF);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest037
     * @tc.desc Verify $_set() -0x80000000 int32 min -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -0x80000000);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest038
     * @tc.desc Verify $_set() 0o10 8 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0o10);
      expect(a.$_get(0)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest039
     * @tc.desc Verify $_set() 0b1010 10 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0b1010);
      expect(a.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest040
     * @tc.desc Verify $_set() 1e2 100.0 ToInt32 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 1e2);
      expect(a.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest041
     * @tc.desc Verify $_set() E int 11 number 3.5 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let vi: number = 0;
      let vn: number = 3.5;
      a.$_set(0, vi);
      a.$_set(0, vn);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest042
     * @tc.desc Verify $_set() E int 100 number -0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      let vi: number = 0;
      let vn: number = -0.5;
      a.$_set(0, vi);
      a.$_set(1, vn);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest043
     * @tc.desc Verify $_set() E -1 number -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let b: Int32Array = new Int32Array(1);
      let vi: int = -1;
      let vn: number = -1.0;
      a.$_set(0, vi);
      b.$_set(0, vn);
      expect(a.$_get(0)).assertEqual(b.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest044
     * @tc.desc Verify $_set() number -2147483649.0 MIN-1 ToInt32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = -2147483649.0;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest045
     * @tc.desc Verify $_set() stores 0 and Number.NaN converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let vi: number = 0;
      a.$_set(0, vi);
      a.$_set(0, Number.NaN);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest046
     * @tc.desc Verify $_set BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.$_set(1, 9);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest047
     * @tc.desc Verify $_set at one index does not affect other elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      a.$_set(1, 999);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(2)).assertEqual(30);
      expect(a.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest048
     * @tc.desc Verify $_set(0, Number.NaN) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([100]);
      a.$_set(0, Number.NaN);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest049
     * @tc.desc Verify $_set buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      let buf: ArrayBuffer = a.buffer;
      a.$_set(0, 5);
      expect(a.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest050
     * @tc.desc Verify $_set byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.$_set(2, 9);
      expect(a.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest051
     * @tc.desc Verify $_set() $_get(0) number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 8);
      let v: number = a.$_get(0);
      expect(v).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest052
     * @tc.desc Verify $_set() index=-1 try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      try {
        a.$_set(-1, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest053
     * @tc.desc Verify $_set() index=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      try {
        a.$_set(2, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest054
     * @tc.desc Verify $_set(0, v) length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      try {
        a.$_set(0, 7);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest055
     * @tc.desc Verify $_set() index=999999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      try {
        a.$_set(999999, 7);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest056
     * @tc.desc Verify $_set() 2147483649 MAX+2 0x80000001 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 2147483649);
      expect(a.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest057
     * @tc.desc Verify $_set() -2147483649 MIN-1 ToInt32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -2147483649);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest058
     * @tc.desc Verify $_set() 4294967295.0 0xFFFFFFFF uint32 max ToInt32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 4294967295.0);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest059
     * @tc.desc Verify $_set() 4294967296.0 0x100000000 2^32 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 4294967296.0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest060
     * @tc.desc Verify $_set() 4294967297.0 2^32+1 ToInt32 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 4294967297.0);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest061
     * @tc.desc Verify $_set() 2.5 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 2.5);
      expect(a.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest062
     * @tc.desc Verify $_set() -2.5 -2 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -2.5);
      expect(a.$_get(0)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest063
     * @tc.desc Verify $_set() 9.999 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 9.999);
      expect(a.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayIndexSetPart01TestMindmapTest064
     * @tc.desc Verify $_set() -9.999 -9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -9.999);
      expect(a.$_get(0)).assertEqual(-9);
    });



  });
}
