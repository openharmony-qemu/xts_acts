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

export default function int32ArrayIndexSetPart04Test(): void {
  describe('Int32ArrayIndexSetPart04Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest001
     * @tc.desc Verify $_set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let beforeLen: number = arr.length;
      arr.$_set(1, 99);
      expect(arr.length).assertEqual(beforeLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest002
     * @tc.desc Verify $_set byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let beforeBL: number = arr.byteLength;
      arr.$_set(2, -5);
      expect(arr.byteLength).assertEqual(beforeBL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest003
     * @tc.desc Verify $_set byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let beforeOff: number = arr.byteOffset;
      arr.$_set(0, 77);
      expect(arr.byteOffset).assertEqual(beforeOff);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest004
     * @tc.desc Verify $_set() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.$_set(0, 99);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest005
     * @tc.desc Verify $_set at one index does not affect neighboring elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      arr.$_set(2, 999);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest006
     * @tc.desc Verify $_set at last index does not affect preceding elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      arr.$_set(2, 777);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest007
     * @tc.desc Verify $_set() 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42, 0]);
      let v: number = arr.$_get(0);
      arr.$_set(1, v);
      expect(arr.$_get(1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest008
     * @tc.desc Verify $_set allows independent writes at different indices without interference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 100);
      arr.$_set(1, 200);
      arr.$_set(0, 101);
      expect(arr.$_get(0)).assertEqual(101);
      expect(arr.$_get(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest009
     * @tc.desc Verify $_set() i.$_get(i) j INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, -2147483648);
      let got: number = arr.$_get(0);
      arr.$_set(1, got);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest010
     * @tc.desc Verify $_set() arr[i+1]=arr[i]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 0, 0, 0]);
      arr.$_set(1, arr.$_get(0));
      arr.$_set(2, arr.$_get(1));
      arr.$_set(3, arr.$_get(2));
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest011
     * @tc.desc Verify $_set() number -1.5 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -1.5);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest012
     * @tc.desc Verify $_get $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 123.456);
      let v: number = arr.$_get(0);
      arr.$_set(1, v);
      expect(arr.$_get(1)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest013
     * @tc.desc Verify $_set() Int32Array 0 buffer 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf);
      parent.$_set(0, 1234);
      expect(child.$_get(0)).assertEqual(1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest014
     * @tc.desc Verify $_set() 1 buffer 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf);
      parent.$_set(1, -5678);
      expect(child.$_get(1)).assertEqual(-5678);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest015
     * @tc.desc Verify $_set() byteOffset=4 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf, 4, 3);
      parent.$_set(1, 777);
      expect(child.$_get(0)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest016
     * @tc.desc Verify $_set() byteOffset=8 2 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf, 8, 2);
      parent.$_set(2, 9999);
      expect(child.$_get(0)).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest017
     * @tc.desc Verify $_set() byteOffset=4 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf, 4, 2);
      child.$_set(0, 555);
      expect(parent.$_get(1)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest018
     * @tc.desc Verify $_set() byteOffset=8, length=1 0 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf, 8, 1);
      child.$_set(0, -333);
      expect(parent.$_get(2)).assertEqual(-333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest019
     * @tc.desc Verify $_set() viewA viewB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let viewA: Int32Array = new Int32Array(buf, 0, 3);
      let viewB: Int32Array = new Int32Array(buf, 8, 2);
      viewA.$_set(2, 4321);
      expect(viewB.$_get(0)).assertEqual(4321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest020
     * @tc.desc Verify $_set() v1 1 <-> v2 0 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let secondView: Int32Array = new Int32Array(buf, 0, 4);
      let thirdView: Int32Array = new Int32Array(buf, 4, 3);
      secondView.$_set(1, 8888);
      expect(thirdView.$_get(0)).assertEqual(8888);
      thirdView.$_set(2, -9999);
      expect(secondView.$_get(3)).assertEqual(-9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest021
     * @tc.desc Verify $_set 1 DataView 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 1);
      let dv: DataView = new DataView(buf);
      let le0: number = dv.getUint8(0);
      expect(le0).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest022
     * @tc.desc Verify $_set INT_MAX DataView getInt32 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 2147483647);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt32(0, true)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest023
     * @tc.desc Verify $_set INT_MIN DataView getInt32 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, -2147483648);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt32(0, true)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest024
     * @tc.desc Verify $_set() slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf, 0, 1);
      parent.$_set(0, 11);
      child.$_set(0, 22);
      expect(parent.$_get(0)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest025
     * @tc.desc Verify $_set() for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let collected: Array<number> = new Array<number>();
      let idx: number = 0;
      for (let val of arr) {
        if (idx === 0) {
          arr.$_set(2, 77);
        }
        collected.push(val);
        idx = idx + 1;
      }
      expect(collected[2]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest026
     * @tc.desc Verify for-of break $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let i: int = 0;
      for (let val of arr) {
        arr.$_set(i, val + 5);
        if (i === 1) {
          break;
        }
        i = i + 1;
      }
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest027
     * @tc.desc Verify $_set() for-of length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sum: number = 0;
      for (let val of arr) {
        sum = sum + val;
        if (val === 2) {
          arr.$_set(0, 100);
        }
      }
      expect(sum).assertEqual(6);
      expect(arr.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest028
     * @tc.desc Verify forEach $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.forEach((value: number, index: int, array: Int32Array) => {
        array.$_set(index, value * value);
      });
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest029
     * @tc.desc Verify forEach $_set callCount length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let callCount: number = 0;
      arr.forEach((_v: number, i: int, a: Int32Array) => {
        callCount = callCount + 1;
        if (i === 2) {
          a.$_set(0, 100);
        }
      });
      expect(callCount).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest030
     * @tc.desc Verify forEach $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let seen: Array<number> = new Array<number>();
      arr.forEach((v: number, i: int, a: Int32Array) => {
        if (i === 0) {
          a.$_set(1, 55);
        }
        seen.push(v);
      });
      expect(seen[1]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest031
     * @tc.desc Verify map $_set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let dst: Int32Array = src.map((v: number, i: int, a: Int32Array): number => {
        if (i === 0) {
          a.$_set(2, 100);
        }
        return v * 10;
      });
      expect(dst.length).assertEqual(3);
      expect(src.$_get(2)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest032
     * @tc.desc Verify $_set inside forEach callback writes correct value at each index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let order: Array<number> = new Array<number>();
      arr.forEach((_v: number, i: int, a: Int32Array) => {
        a.$_set(i, i * 2);
        order.push(i);
      });
      expect(order.length).assertEqual(4);
      expect(order[0]).assertEqual(0);
      expect(order[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest033
     * @tc.desc Verify $_set() number 2.5 number 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let v: number = 2.5;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest034
     * @tc.desc Verify $_set() int 0 int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let zero: int = 0;
      arr.$_set(0, zero);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest035
     * @tc.desc Verify $_set repeated writes of same value are idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 12345);
      arr.$_set(0, 12345);
      arr.$_set(0, 12345);
      expect(arr.$_get(0)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest036
     * @tc.desc Verify $_set() INT_MAX INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2147483647);
      arr.$_set(0, -2147483648);
      arr.$_set(0, 2147483647);
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest037
     * @tc.desc Verify $_set() INT_MAX INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(0, 2147483647);
      arr.$_set(1, 2147483647);
      arr.$_set(2, 2147483647);
      arr.$_set(3, 2147483647);
      expect(arr.$_get(3)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest038
     * @tc.desc Verify $_set() INT_MIN INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, -2147483648);
      arr.$_set(1, -2147483648);
      arr.$_set(2, -2147483648);
      expect(arr.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest039
     * @tc.desc Verify $_set() 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 0);
      arr.$_set(0, 1);
      arr.$_set(0, 0);
      arr.$_set(0, 1);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest040
     * @tc.desc Verify $_set returns undefined after writing the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let r: Object | undefined = arr.$_set(0, 42);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest041
     * @tc.desc Verify Int32Array.of $_set of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.$_set(1, 999);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest042
     * @tc.desc Verify Int32Array.from $_set length from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3, 4, 5];
      let arr: Int32Array = Int32Array.from(src);
      arr.$_set(4, 500);
      expect(arr.length).assertEqual(5);
      expect(arr.$_get(4)).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest043
     * @tc.desc Verify 1 $_set(0, x) x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -7);
      expect(arr.$_get(0)).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest044
     * @tc.desc Verify 2 $_set(1, x) 0 x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(1, 55);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest045
     * @tc.desc Verify $_set() byteOffset slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf, 4, 3);
      child.$_set(2, 12345);
      expect(parent.$_get(3)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest046
     * @tc.desc Verify $_set() 2147483648.0 INT_MIN INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 2147483648.0);
      let v: number = a.$_get(0);
      let b: Int32Array = new Int32Array(1);
      b.$_set(0, v);
      expect(b.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_SET_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArrayIndexSetPart04TestMindmapTest047
     * @tc.desc Verify $_set() -2147483649.0 INT_MAX INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexSetPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -2147483649.0);
      let v: number = a.$_get(0);
      expect(v).assertEqual(2147483647);
    });


  });
}
