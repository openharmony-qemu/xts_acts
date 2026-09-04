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

export default function int32ArrayIndexSetPart03Test(): void {
  describe('Int32ArrayIndexSetPart03Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest001
     * @tc.desc Verify $_set() arity=2 void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      let r: void = a.$_set(1, 77);
      expect(a.$_get(1)).assertEqual(77);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest002
     * @tc.desc Verify $_set() arity=2 index value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      let i: int = 0;
      let v: number = 0;
      a.$_set(i, v);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest003
     * @tc.desc Verify $_set stores values at two distinct indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.$_set(0, 11);
      a.$_set(1, 22);
      expect(a.$_get(0)).assertEqual(11);
      expect(a.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest004
     * @tc.desc Verify $_set() index=length throws RangeError and leaves array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      try {
        a.$_set(5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(4)).assertEqual(5);
      expect(a.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest005
     * @tc.desc Verify $_set() index=0 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 5);
      a.$_set(0, 0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest006
     * @tc.desc Verify $_set() index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([100]);
      a.$_set(0, 200);
      expect(a.$_get(0)).assertEqual(200);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest007
     * @tc.desc Verify $_set() length=4 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.$_set(1, 5);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(5);
      expect(a.$_get(2)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest008
     * @tc.desc Verify $_set() 1 fill index=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.fill(1);
      a.$_set(2, 9);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(9);
      expect(a.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest009
     * @tc.desc Verify $_set() -1 index=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(-1);
      a.$_set(0, 0);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(-1);
      expect(a.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest010
     * @tc.desc Verify $_set() E 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = 0;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest011
     * @tc.desc Verify $_set() E -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: int = -1;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest012
     * @tc.desc Verify $_set() E 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = 1;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest013
     * @tc.desc Verify $_set() number 4294967296.0 2^32 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = 4294967296.0;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest014
     * @tc.desc Verify $_set() number 4294967297.0 2^32+1 ToInt32 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = 4294967297.0;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest015
     * @tc.desc Verify $_set() number 2147483649.0 MAX+2 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = 2147483649.0;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest016
     * @tc.desc Verify $_set() number 0.9 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = 0.9;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest017
     * @tc.desc Verify $_set() number -0.9 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = -0.9;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest018
     * @tc.desc Verify $_set() number 1.5 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = 1.5;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest019
     * @tc.desc Verify $_set() number -1.5 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = -1.5;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest020
     * @tc.desc Verify $_set() number 2147483647.9 MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = 2147483647.9;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest021
     * @tc.desc Verify $_set() number -0.0 ToInt32(-0)===+0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let v: number = -0.0;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest022
     * @tc.desc Verify $_set() E number int 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = new Int32Array(1);
      let a2: Int32Array = new Int32Array(1);
      let vi: number = 0;
      let vn: number = 42.0;
      a1.$_set(0, vi);
      a2.$_set(0, vn);
      expect(a1.$_get(0)).assertEqual(0);
      expect(a2.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest023
     * @tc.desc Verify $_set() E number number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let vi: number = 0;
      let vn: number = 20.0;
      a.$_set(0, vi);
      a.$_set(0, vn);
      expect(a.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest024
     * @tc.desc Verify $_set() number E E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let vn: number = 30.0;
      let vi: number = 0;
      a.$_set(0, vn);
      a.$_set(0, vi);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest025
     * @tc.desc Verify $_set() number 3.7 3 E 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 3.7);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest026
     * @tc.desc Verify $_set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      a.$_set(2, 99);
      expect(a.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest027
     * @tc.desc Verify $_set byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let before: number = a.byteLength;
      a.$_set(3, 1);
      expect(a.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest028
     * @tc.desc Verify $_set BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest029
     * @tc.desc Verify $_set buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      let buf: ArrayBuffer = a.buffer;
      a.$_set(1, 7);
      expect(a.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest030
     * @tc.desc Verify $_set Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.$_set(0, 1);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest031
     * @tc.desc Verify $_set 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      a.$_set(2, 777);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest032
     * @tc.desc Verify $_set on zero-length Int32Array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      try {
        a.$_set(0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest033
     * @tc.desc Verify $_set() index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      try {
        a.$_set(999999999, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest034
     * @tc.desc Verify $_set() 0.9 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0.9);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest035
     * @tc.desc Verify $_set() Number.NaN length=3 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.$_set(0, 1);
      a.$_set(2, 3);
      a.$_set(1, Number.NaN);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest036
     * @tc.desc Verify $_set() -0.0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.$_set(0, 0);
      a.$_set(1, -0.0);
      expect(a.$_get(0)).assertEqual(a.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest037
     * @tc.desc Verify $_set() number 1.999999 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 1.999999);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest038
     * @tc.desc Verify $_set() number -1.999999 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -1.999999);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest039
     * @tc.desc Verify ArrayBuffer Int32Array $_set buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let secondView: Int32Array = new Int32Array(buf, 0, 2);
      let thirdView: Int32Array = new Int32Array(buf, 8, 2);
      secondView.$_set(0, 100);
      thirdView.$_set(0, 200);
      expect(secondView.$_get(0)).assertEqual(100);
      expect(thirdView.$_get(0)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest040
     * @tc.desc Verify buffer $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let secondView: Int32Array = new Int32Array(buf, 0, 2);
      let thirdView: Int32Array = new Int32Array(buf, 0, 2);
      secondView.$_set(1, 55);
      expect(thirdView.$_get(1)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest041
     * @tc.desc Verify $_set ArrayBuffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let v: Int32Array = new Int32Array(buf, 0, 1);
      let u: Uint8Array = new Uint8Array(buf, 0, 4);
      v.$_set(0, 1);
      expect(u.$_get(0)).assertEqual(1);
      expect(u.$_get(1)).assertEqual(0);
      expect(u.$_get(2)).assertEqual(0);
      expect(u.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest042
     * @tc.desc Verify subarray $_set buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40]);
      let child: Int32Array = parent.subarray(1, 3);
      child.$_set(0, 999);
      expect(parent.$_get(1)).assertEqual(999);
      expect(parent.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest043
     * @tc.desc Verify byteOffset=4 $_set(0, v) buffer 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let firstView: Int32Array = new Int32Array(buf, 0, 1);
      let fifthView: Int32Array = new Int32Array(buf, 4, 1);
      firstView.$_set(0, 11);
      fifthView.$_set(0, 22);
      expect(firstView.$_get(0)).assertEqual(11);
      expect(fifthView.$_get(0)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest044
     * @tc.desc Verify $_set 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let v: Int32Array = new Int32Array(buf, 0, 1);
      let u: Uint8Array = new Uint8Array(buf, 0, 4);
      v.$_set(0, 255);
      v.$_set(0, 0);
      expect(u.$_get(0)).assertEqual(0);
      expect(u.$_get(1)).assertEqual(0);
      expect(u.$_get(2)).assertEqual(0);
      expect(u.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayIndexSetPart03TestMindmapTest045
     * @tc.desc Verify $_set() INT_MAX(0x7FFFFFFF) buffer FF FF FF 7F
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart03TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let v: Int32Array = new Int32Array(buf, 0, 1);
      let u: Uint8Array = new Uint8Array(buf, 0, 4);
      v.$_set(0, 2147483647);
      expect(u.$_get(0)).assertEqual(255);
      expect(u.$_get(1)).assertEqual(255);
      expect(u.$_get(2)).assertEqual(255);
      expect(u.$_get(3)).assertEqual(127);
    });


  });
}
