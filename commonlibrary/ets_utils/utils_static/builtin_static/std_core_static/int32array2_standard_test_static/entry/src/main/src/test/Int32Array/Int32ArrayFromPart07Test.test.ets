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

export default function int32ArrayFromPart07Test(): void {
  describe('Int32ArrayFromPart07Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_0100
     * @tc.name int32ArrayFromPart07TestMindmapTest001
     * @tc.desc Verify from() FixedArray [] Set<number> length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = Int32Array.from([]);
      let s: Set<number> = new Set<number>();
      let a2: Int32Array = Int32Array.from(s);
      expect(a1.length).assertEqual(0);
      expect(a2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_0200
     * @tc.name int32ArrayFromPart07TestMindmapTest002
     * @tc.desc Verify from() Array<number> Int32Array byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [];
      let a1: Int32Array = Int32Array.from(arr);
      let src: Int32Array = new Int32Array(0);
      let a2: Int32Array = Int32Array.from(src);
      expect(a1.byteLength).assertEqual(0);
      expect(a2.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_0300
     * @tc.name int32ArrayFromPart07TestMindmapTest003
     * @tc.desc Verify from() [1,2] FixedArray new Set([1,2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = Int32Array.from([1, 2] as number[]);
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let a2: Int32Array = Int32Array.from(s);
      expect(a2.$_get(0)).assertEqual(a1.$_get(0));
      expect(a2.$_get(1)).assertEqual(a1.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_0400
     * @tc.name int32ArrayFromPart07TestMindmapTest004
     * @tc.desc Verify from() FixedArray<int> [1,2,3] Array<number> [1,2,3] length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = Int32Array.from([1, 2, 3] as number[]);
      let arr: Array<number> = [1, 2, 3];
      let a2: Int32Array = Int32Array.from(arr);
      expect(a1.length).assertEqual(a2.length);
      expect(a1.$_get(2)).assertEqual(a2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_0500
     * @tc.name int32ArrayFromPart07TestMindmapTest005
     * @tc.desc Verify Int32Array from FixedArray byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([7, 8, 9]);
      let a1: Int32Array = Int32Array.from(src);
      let a2: Int32Array = Int32Array.from([7, 8, 9] as number[]);
      expect(a1.byteLength).assertEqual(a2.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_0600
     * @tc.name int32ArrayFromPart07TestMindmapTest006
     * @tc.desc Verify from() Set FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(100);
      s.add(-200);
      s.add(300);
      let aSet: Int32Array = Int32Array.from(s);
      let aFix: Int32Array = Int32Array.from([100, -200, 300]);
      expect(aSet.$_get(0)).assertEqual(aFix.$_get(0));
      expect(aSet.$_get(1)).assertEqual(aFix.$_get(1));
      expect(aSet.$_get(2)).assertEqual(aFix.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_0700
     * @tc.name int32ArrayFromPart07TestMindmapTest007
     * @tc.desc Verify from() Set<number> {4,5,6} vs number[] [4,5,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(4);
      s.add(5);
      s.add(6);
      let a1: Int32Array = Int32Array.from(s);
      let a2: Int32Array = Int32Array.from([4, 5, 6] as number[]);
      expect(a1.length).assertEqual(3);
      expect(a1.$_get(0)).assertEqual(4);
      expect(a1.$_get(1)).assertEqual(5);
      expect(a1.$_get(2)).assertEqual(6);
      expect(a2.length).assertEqual(3);
      expect(a2.$_get(0)).assertEqual(4);
      expect(a2.$_get(1)).assertEqual(5);
      expect(a2.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_0800
     * @tc.name int32ArrayFromPart07TestMindmapTest008
     * @tc.desc Verify from() Int32Array [0,0,0] vs number[] [0,0,0] length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(0, 0, 0);
      let a1: Int32Array = Int32Array.from(src);
      let a2: Int32Array = Int32Array.from([0, 0, 0] as number[]);
      expect(a1.length).assertEqual(3);
      expect(a1.$_get(0)).assertEqual(0);
      expect(a1.$_get(1)).assertEqual(0);
      expect(a1.$_get(2)).assertEqual(0);
      expect(a2.length).assertEqual(3);
      expect(a2.$_get(0)).assertEqual(0);
      expect(a2.$_get(1)).assertEqual(0);
      expect(a2.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_0900
     * @tc.name int32ArrayFromPart07TestMindmapTest009
     * @tc.desc Verify from(Int32Array) from(FixedArray) constructor Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = Int32Array.from(new Int32Array([1]));
      let a2: Int32Array = Int32Array.from([1] as number[]);
      expect(a1.length).assertEqual(a2.length);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1000
     * @tc.name int32ArrayFromPart07TestMindmapTest010
     * @tc.desc Verify from() [1,2] FixedArray Array Set length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [1, 2];
      let aArr: Int32Array = Int32Array.from(arr);
      let aFix: Int32Array = Int32Array.from([1, 2] as number[]);
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let aSet: Int32Array = Int32Array.from(s);
      expect(aArr.length).assertEqual(2);
      expect(aFix.length).assertEqual(2);
      expect(aSet.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1100
     * @tc.name int32ArrayFromPart07TestMindmapTest011
     * @tc.desc Verify from() FixedArray Array Set Int32Array byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = Int32Array.from([]);
      let a2: Int32Array = Int32Array.from(new Array<number>());
      let a3: Int32Array = Int32Array.from(new Set<number>());
      let a4: Int32Array = Int32Array.from(new Int32Array(0));
      expect(a1.byteOffset).assertEqual(0);
      expect(a2.byteOffset).assertEqual(0);
      expect(a3.byteOffset).assertEqual(0);
      expect(a4.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1200
     * @tc.name int32ArrayFromPart07TestMindmapTest012
     * @tc.desc Verify from() FixedArray/Array/Set/Int32Array BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [1];
      let s: Set<number> = new Set<number>();
      s.add(1);
      expect(Int32Array.from([1] as number[]).BYTES_PER_ELEMENT).assertEqual(4);
      expect(Int32Array.from(arr).BYTES_PER_ELEMENT).assertEqual(4);
      expect(Int32Array.from(s).BYTES_PER_ELEMENT).assertEqual(4);
      expect(Int32Array.from(new Int32Array([1])).BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1300
     * @tc.name int32ArrayFromPart07TestMindmapTest013
     * @tc.desc Verify from() byteLength 12 3*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [1, 2, 3];
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      expect(Int32Array.from([1, 2, 3] as number[]).byteLength).assertEqual(12);
      expect(Int32Array.from(arr).byteLength).assertEqual(12);
      expect(Int32Array.from(s).byteLength).assertEqual(12);
      expect(Int32Array.from(new Int32Array([1, 2, 3])).byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1400
     * @tc.name int32ArrayFromPart07TestMindmapTest014
     * @tc.desc Verify from() buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2]);
      let aSrc: Int32Array = Int32Array.from(src);
      expect(aSrc.buffer).not().assertEqual(src.buffer);
      let arr: Array<number> = [1, 2];
      let aArr: Int32Array = Int32Array.from(arr);
      expect(aArr.byteLength).assertEqual(8);
      expect(aArr.$_get(0)).assertEqual(1);
      expect(aArr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1500
     * @tc.name int32ArrayFromPart07TestMindmapTest015
     * @tc.desc Verify from() creates zero-length buffers for empty array sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = Int32Array.from([]);
      let a2: Int32Array = Int32Array.from(new Array<number>());
      expect(a1.buffer.byteLength).assertEqual(0);
      expect(a2.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1600
     * @tc.name int32ArrayFromPart07TestMindmapTest016
     * @tc.desc Verify from() copies a Set element into a zero-offset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(10);
      let a: Int32Array = Int32Array.from(s);
      expect(a.byteLength).assertEqual(4);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1700
     * @tc.name int32ArrayFromPart07TestMindmapTest017
     * @tc.desc Verify from() [5] toString '5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(5);
      let arr: Array<number> = [5];
      expect(Int32Array.from([5] as number[]).toString()).assertEqual('5');
      expect(Int32Array.from(arr).toString()).assertEqual('5');
      expect(Int32Array.from(s).toString()).assertEqual('5');
      expect(Int32Array.from(new Int32Array([5])).toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1800
     * @tc.name int32ArrayFromPart07TestMindmapTest018
     * @tc.desc Verify from() [1,2] toString '1,2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let arr: Array<number> = [1, 2];
      expect(Int32Array.from([1, 2] as number[]).toString()).assertEqual('1,2');
      expect(Int32Array.from(arr).toString()).assertEqual('1,2');
      expect(Int32Array.from(s).toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1900
     * @tc.name int32ArrayFromPart07TestMindmapTest019
     * @tc.desc Verify from() FixedArray Set toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      expect(Int32Array.from([]).toString()).assertEqual('');
      expect(Int32Array.from(s).toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2000
     * @tc.name int32ArrayFromPart07TestMindmapTest020
     * @tc.desc Verify from() [-1, -2] FixedArray Array toString '-1,-2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [-1, -2];
      expect(Int32Array.from([-1, -2]).toString()).assertEqual('-1,-2');
      expect(Int32Array.from(arr).toString()).assertEqual('-1,-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2100
     * @tc.name int32ArrayFromPart07TestMindmapTest021
     * @tc.desc Verify from() Array and Set preserve length and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int32Array = Int32Array.from([1] as number[]);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(1);
      let s: Set<number> = new Set<number>();
      s.add(1);
      let r2: Int32Array = Int32Array.from(s);
      expect(r2.length).assertEqual(1);
      expect(r2.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2200
     * @tc.name int32ArrayFromPart07TestMindmapTest022
     * @tc.desc Verify from() FixedArray mapfn x=>x*2 [2,4,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = Int32Array.from([1, 2, 3] as number[], (v: number, k: number): number => v * 2);
      let a2: Int32Array = Int32Array.from([2, 4, 6] as number[]);
      expect(a1.$_get(0)).assertEqual(a2.$_get(0));
      expect(a1.$_get(1)).assertEqual(a2.$_get(1));
      expect(a1.$_get(2)).assertEqual(a2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2300
     * @tc.name int32ArrayFromPart07TestMindmapTest023
     * @tc.desc Verify from() Set<number> + mapfn vs number[] + mapfn [10,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(10);
      s.add(20);
      let a1: Int32Array = Int32Array.from(s, (v: number, k: number): number => v + 1);
      let a2: Int32Array = Int32Array.from([10, 20] as number[], (v: number, k: number): number => v + 1);
      expect(a1.length).assertEqual(2);
      expect(a1.$_get(0)).assertEqual(11);
      expect(a1.$_get(1)).assertEqual(21);
      expect(a2.length).assertEqual(2);
      expect(a2.$_get(0)).assertEqual(11);
      expect(a2.$_get(1)).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2400
     * @tc.name int32ArrayFromPart07TestMindmapTest024
     * @tc.desc Verify from() Set<number> {3,7} vs number[] [3,7] + mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(3);
      s.add(7);
      let a1: Int32Array = Int32Array.from(s);
      let a2: Int32Array = Int32Array.from([3, 7] as number[], (v: number, k: number): number => v * 2);
      expect(a1.$_get(0)).assertEqual(3);
      expect(a1.$_get(1)).assertEqual(7);
      expect(a2.$_get(0)).assertEqual(6);
      expect(a2.$_get(1)).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2500
     * @tc.name int32ArrayFromPart07TestMindmapTest025
     * @tc.desc Verify from() mapfn k FixedArray 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idx: Array<number> = [];
      let a: Int32Array = Int32Array.from([10, 20, 30] as number[], (v: number, k: number): number => {
        idx.push(k);
        return v;
      });
      expect(idx.length).assertEqual(3);
      expect(idx[0]).assertEqual(0);
      expect(idx[1]).assertEqual(1);
      expect(idx[2]).assertEqual(2);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2600
     * @tc.name int32ArrayFromPart07TestMindmapTest026
     * @tc.desc Verify from() mapfn k ArrayLike 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idx: Array<number> = [];
      let a: Int32Array = Int32Array.from([7, 8, 9] as number[], (v: number, k: number): number => {
        idx.push(k);
        return v;
      });
      expect(idx[1]).assertEqual(1);
      expect(idx[2]).assertEqual(2);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(7);
      expect(a.$_get(1)).assertEqual(8);
      expect(a.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2700
     * @tc.name int32ArrayFromPart07TestMindmapTest027
     * @tc.desc Verify from() mapfn Iterable k 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idx: Array<number> = [];
      let a: Int32Array = Int32Array.from([100, 200, 300] as number[], (v: number, k: number): number => {
        idx.push(k);
        return v;
      });
      expect(idx.length).assertEqual(3);
      expect(idx[0]).assertEqual(0);
      expect(idx[2]).assertEqual(2);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(100);
      expect(a.$_get(1)).assertEqual(200);
      expect(a.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2800
     * @tc.name int32ArrayFromPart07TestMindmapTest028
     * @tc.desc Verify from() Set<number> {99} mapfn NaN vs number[] [99] mapfn NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(99);
      let a1: Int32Array = Int32Array.from(s, (v: number, k: number): number => {
        expect(v).assertEqual(99);
        return Number.NaN;
      });
      let a2: Int32Array = Int32Array.from([99] as number[], (v: number, k: number): number => {
        expect(v).assertEqual(99);
        return Number.NaN;
      });
      expect(a1.$_get(0)).assertEqual(0);
      expect(a2.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2900
     * @tc.name int32ArrayFromPart07TestMindmapTest029
     * @tc.desc Verify from() mapfn Number.POSITIVE_INFINITY ToInt32 0 FixedArray Set(Iterable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      let a1: Int32Array = Int32Array.from([1] as number[], (v: number, k: number): number => {
        expect(v).assertEqual(1);
        return Number.POSITIVE_INFINITY;
      });
      let a2: Int32Array = Int32Array.from(s, (v: number, k: number): number => {
        expect(v).assertEqual(1);
        return Number.POSITIVE_INFINITY;
      });
      expect(a1.$_get(0)).assertEqual(0);
      expect(a2.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3000
     * @tc.name int32ArrayFromPart07TestMindmapTest030
     * @tc.desc Verify from() mapfn 3.7 ToInt32 3 FixedArray Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [1];
      let a1: Int32Array = Int32Array.from([1] as number[], (v: number, k: number): number => {
        expect(v).assertEqual(1);
        return 3.7;
      });
      let a2: Int32Array = Int32Array.from(arr, (v: number, k: number): number => {
        expect(v).assertEqual(1);
        return 3.7;
      });
      expect(a1.$_get(0)).assertEqual(3);
      expect(a2.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3100
     * @tc.name int32ArrayFromPart07TestMindmapTest031
     * @tc.desc Verify from() Set<number> {0} mapfn overflow vs number[] [0] mapfn overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(0);
      let a1: Int32Array = Int32Array.from(s, (v: number, k: number): number => {
        expect(v).assertEqual(0);
        return 2147483648;
      });
      let a2: Int32Array = Int32Array.from([0] as number[], (v: number, k: number): number => {
        expect(v).assertEqual(0);
        return 2147483648;
      });
      expect(a1.$_get(0)).assertEqual(-2147483648);
      expect(a2.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3200
     * @tc.name int32ArrayFromPart07TestMindmapTest032
     * @tc.desc Verify mapfn 1 from FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Int32Array.from([1, 2] as number[], (v: number, k: number): number => {
          expect(v).assertEqual(k + 1);
          throw new Error('mapfn boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3300
     * @tc.name int32ArrayFromPart07TestMindmapTest033
     * @tc.desc Verify mapfn 2 from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '';
      try {
        Int32Array.from([1, 2, 3] as number[], (v: number, k: number): number => {
          if (k === 1) {
            throw new Error('idx1');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        msg = e.message;
      }
      expect(msg).assertEqual('idx1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3400
     * @tc.name int32ArrayFromPart07TestMindmapTest034
     * @tc.desc Verify from() mapfn 3 ArrayLike ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Int32Array.from([10, 20, 30] as number[], (v: number, k: number): number => {
          if (k === 2) {
            throw new Error('last');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3500
     * @tc.name int32ArrayFromPart07TestMindmapTest035
     * @tc.desc Verify from() Set<number> Iterable mapfn throws mid-iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let msg: string = '';
      try {
        Int32Array.from(s, (v: number, k: number): number => {
          if (k === 1) {
            throw new Error('iter mid');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        msg = (e as Error).message;
      }
      expect(msg).assertEqual('iter mid');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3600
     * @tc.name int32ArrayFromPart07TestMindmapTest036
     * @tc.desc Verify from() Iterable + mapfn mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let marker: Array<number> = [];
      try {
        Int32Array.from([1, 2, 3] as number[], (v: number, k: number): number => {
          marker.push(v);
          if (v === 2) {
            throw new Error('v=2');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(marker.length).assertEqual(2);
      expect(marker[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3700
     * @tc.name int32ArrayFromPart07TestMindmapTest037
     * @tc.desc Verify from() Set returns correct length and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(9);
      let a: Int32Array = Int32Array.from(s);
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3800
     * @tc.name int32ArrayFromPart07TestMindmapTest038
     * @tc.desc Verify from() returns correct length and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let good: Int32Array = Int32Array.from([11, 22, 33]);
      expect(good.length).assertEqual(3);
      expect(good.$_get(0)).assertEqual(11);
      expect(good.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3900
     * @tc.name int32ArrayFromPart07TestMindmapTest039
     * @tc.desc Verify mapfn from try
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      a = Int32Array.from([4, 5] as number[]);
      try {
        Int32Array.from([1] as number[], (v: number, k: number): number => {
          expect(v).assertEqual(1);
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(a.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4000
     * @tc.name int32ArrayFromPart07TestMindmapTest040
     * @tc.desc Verify error thrown in mapfn during from() does not corrupt subsequent from() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let before: Int32Array = Int32Array.from([100]);
      try {
        Int32Array.from([1] as number[], (v: number, k: number): number => {
          expect(v).assertEqual(1);
          throw new Error('mid');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let after: Int32Array = Int32Array.from([200]);
      expect(before.$_get(0)).assertEqual(100);
      expect(after.$_get(0)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4100
     * @tc.name int32ArrayFromPart07TestMindmapTest041
     * @tc.desc Verify from() with Int32Array source returns a new distinct instance with same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([7, 8]);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst).not().assertEqual(src);
      expect(dst.$_get(0)).assertEqual(src.$_get(0));
      expect(dst.$_get(1)).assertEqual(src.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4200
     * @tc.name int32ArrayFromPart07TestMindmapTest042
     * @tc.desc Verify mutating from() result with Int32Array source does not affect the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2]);
      let dst: Int32Array = Int32Array.from(src);
      dst.$_set(0, 999);
      expect(src.$_get(0)).assertEqual(1);
      expect(dst.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4300
     * @tc.name int32ArrayFromPart07TestMindmapTest043
     * @tc.desc Verify mutating from() result with Array<number> source does not affect the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [10, 20];
      let dst: Int32Array = Int32Array.from(arr);
      dst.$_set(0, 777);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4400
     * @tc.name int32ArrayFromPart07TestMindmapTest044
     * @tc.desc Verify from() with FixedArray source produces result with accessible and writable buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = Int32Array.from([3, 4, 5] as number[]);
      let buf1: ArrayBuffer = dst.buffer;
      dst.$_set(1, 999);
      expect(dst.$_get(1)).assertEqual(999);
      expect(buf1.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4500
     * @tc.name int32ArrayFromPart07TestMindmapTest045
     * @tc.desc Verify mutating from() result with Set source does not affect the source Set contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(50);
      let dst: Int32Array = Int32Array.from(s);
      dst.$_set(0, 111);
      expect(s.has(50)).assertTrue();
      expect(s.has(111)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4600
     * @tc.name int32ArrayFromPart07TestMindmapTest046
     * @tc.desc Verify two from() calls on the same Array<number> produce distinct instances with distinct buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [1, 2, 3];
      let a: Int32Array = Int32Array.from(arr);
      let b: Int32Array = Int32Array.from(arr);
      expect(a).not().assertEqual(b);
      expect(a.buffer).not().assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4700
     * @tc.name int32ArrayFromPart07TestMindmapTest047
     * @tc.desc Verify two from() calls on the same Set produce independent results with equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(8);
      s.add(9);
      let a: Int32Array = Int32Array.from(s);
      let b: Int32Array = Int32Array.from(s);
      expect(a).not().assertEqual(b);
      expect(a.$_get(0)).assertEqual(b.$_get(0));
      expect(a.$_get(1)).assertEqual(b.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4800
     * @tc.name int32ArrayFromPart07TestMindmapTest048
     * @tc.desc Verify two from() calls on separate FixedArrays produce distinct instances with equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([6, 7] as number[]);
      let b: Int32Array = Int32Array.from([6, 7] as number[]);
      expect(a).not().assertEqual(b);
      expect(a.$_get(0)).assertEqual(b.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4900
     * @tc.name int32ArrayFromPart07TestMindmapTest049
     * @tc.desc Verify from() captures a snapshot of the source at call time, not later mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2]);
      let a1: Int32Array = Int32Array.from(src);
      src.$_set(0, 42);
      let a2: Int32Array = Int32Array.from(src);
      expect(a1.$_get(0)).assertEqual(1);
      expect(a2.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_5000
     * @tc.name int32ArrayFromPart07TestMindmapTest050
     * @tc.desc Verify source Array modifications after from() call do not affect the returned copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [100];
      let dst: Int32Array = Int32Array.from(arr);
      arr[0] = 200;
      expect(dst.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_5100
     * @tc.name int32ArrayFromPart07TestMindmapTest051
     * @tc.desc Verify $_set on the from() result mutates the copy but preserves the buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([1, 2, 3] as number[]);
      let bufBefore: ArrayBuffer = a.buffer;
      a.$_set(2, 55);
      expect(a.buffer).assertEqual(bufBefore);
      expect(a.$_get(2)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_5200
     * @tc.name int32ArrayFromPart07TestMindmapTest052
     * @tc.desc Verify from() int32 MAX 2147483647 FixedArray / Array / Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [2147483647];
      let src: Int32Array = new Int32Array([2147483647]);
      expect(Int32Array.from([2147483647 as number]).$_get(0)).assertEqual(2147483647);
      expect(Int32Array.from(arr).$_get(0)).assertEqual(2147483647);
      expect(Int32Array.from(src).$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_5300
     * @tc.name int32ArrayFromPart07TestMindmapTest053
     * @tc.desc Verify from() int32 MIN -2147483648 FixedArray / Set / Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-2147483648);
      let arr: Array<number> = [-2147483648];
      expect(Int32Array.from([-2147483648]).$_get(0)).assertEqual(-2147483648);
      expect(Int32Array.from(s).$_get(0)).assertEqual(-2147483648);
      expect(Int32Array.from(arr).$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_5400
     * @tc.name int32ArrayFromPart07TestMindmapTest054
     * @tc.desc Verify from() 0 -0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-0);
      let arr: Array<number> = [-0];
      expect(Int32Array.from([0] as number[]).$_get(0)).assertEqual(0);
      expect(Int32Array.from([-0]).$_get(0)).assertEqual(0);
      expect(Int32Array.from(s).$_get(0)).assertEqual(0);
      expect(Int32Array.from(arr).$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_5500
     * @tc.name int32ArrayFromPart07TestMindmapTest055
     * @tc.desc Verify from() -1 Set 0xFFFFFFFF FixedArray Array -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-1);
      let arr: Array<number> = [-1];
      expect(Int32Array.from([-1]).$_get(0)).assertEqual(-1);
      expect(Int32Array.from(s).$_get(0)).assertEqual(-1);
      expect(Int32Array.from(arr).$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_5600
     * @tc.name int32ArrayFromPart07TestMindmapTest056
     * @tc.desc Verify from() 4294967295 FixedArray Array -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [4294967295];
      expect(Int32Array.from([4294967295 as number]).$_get(0)).assertEqual(-1);
      expect(Int32Array.from(arr).$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_5700
     * @tc.name int32ArrayFromPart07TestMindmapTest057
     * @tc.desc Verify from() 4294967296 FixedArray mapfn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = Int32Array.from([4294967296 as number]);
      let a2: Int32Array = Int32Array.from([0] as number[], (v: number, k: number): number => {
        expect(v).assertEqual(0);
        return 4294967296;
      });
      expect(a1.$_get(0)).assertEqual(0);
      expect(a2.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_5800
     * @tc.name int32ArrayFromPart07TestMindmapTest058
     * @tc.desc Verify from() Number.NaN FixedArray/Array/Set 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(Number.NaN);
      let arr: Array<number> = [Number.NaN];
      expect(Int32Array.from([Number.NaN]).$_get(0)).assertEqual(0);
      expect(Int32Array.from(s).$_get(0)).assertEqual(0);
      expect(Int32Array.from(arr).$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_5900
     * @tc.name int32ArrayFromPart07TestMindmapTest059
     * @tc.desc Verify from() -3.9 FixedArray Array -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [-3.9];
      expect(Int32Array.from([-3.9]).$_get(0)).assertEqual(-3);
      expect(Int32Array.from(arr).$_get(0)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6000
     * @tc.name int32ArrayFromPart07TestMindmapTest060
     * @tc.desc Verify from() byteLength=4 length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      let arr: Array<number> = [1];
      let a1: Int32Array = Int32Array.from([1] as number[]);
      let a2: Int32Array = Int32Array.from(arr);
      let a3: Int32Array = Int32Array.from(s);
      let a4: Int32Array = Int32Array.from(new Int32Array([1]));
      expect(a1.byteLength).assertEqual(4);
      expect(a2.byteLength).assertEqual(4);
      expect(a3.byteLength).assertEqual(4);
      expect(a4.byteLength).assertEqual(4);
      expect(a1.length).assertEqual(1);
      expect(a3.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6100
     * @tc.name int32ArrayFromPart07TestMindmapTest061
     * @tc.desc Verify from() byteLength=0 length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      let arr: Array<number> = [];
      expect(Int32Array.from([]).byteLength).assertEqual(0);
      expect(Int32Array.from(arr).byteLength).assertEqual(0);
      expect(Int32Array.from(s).byteLength).assertEqual(0);
      expect(Int32Array.from(new Int32Array(0)).byteLength).assertEqual(0);
      expect(Int32Array.from([]).length).assertEqual(0);
      expect(Int32Array.from(s).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6200
     * @tc.name int32ArrayFromPart07TestMindmapTest062
     * @tc.desc Verify from() results from different source types support $_set/$_get for mutation and access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      let arr: Array<number> = [1];
      let a1: Int32Array = Int32Array.from([1] as number[]);
      let a2: Int32Array = Int32Array.from(arr);
      let a3: Int32Array = Int32Array.from(s);
      a1.$_set(0, 111);
      a2.$_set(0, 222);
      a3.$_set(0, 333);
      expect(a1.$_get(0)).assertEqual(111);
      expect(a2.$_get(0)).assertEqual(222);
      expect(a3.$_get(0)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6300
     * @tc.name int32ArrayFromPart07TestMindmapTest063
     * @tc.desc Verify chained from(from(FixedArray)) preserves all element values and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from(Int32Array.from([1, 2, 3] as number[]));
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6400
     * @tc.name int32ArrayFromPart07TestMindmapTest064
     * @tc.desc Verify from(from(Set)) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(10);
      s.add(20);
      let a1: Int32Array = Int32Array.from(s);
      let a2: Int32Array = Int32Array.from(a1);
      expect(a2.$_get(0)).assertEqual(10);
      expect(a2.$_get(1)).assertEqual(20);
      expect(a1.buffer).not().assertEqual(a2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6500
     * @tc.name int32ArrayFromPart07TestMindmapTest065
     * @tc.desc Verify chained from() after from() with mapfn preserves the transformed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<number> = [1, 2, 3];
      let a1: Int32Array = Int32Array.from(arr, (v: number, k: number): number => v + 10);
      let a2: Int32Array = Int32Array.from(a1);
      expect(a2.$_get(0)).assertEqual(11);
      expect(a2.$_get(1)).assertEqual(12);
      expect(a2.$_get(2)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6600
     * @tc.name int32ArrayFromPart07TestMindmapTest066
     * @tc.desc Verify chained from(from([])) on empty source produces empty Int32Array with zero length and byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from(Int32Array.from([]));
      expect(a.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6700
     * @tc.name int32ArrayFromPart07TestMindmapTest067
     * @tc.desc Verify from() with Set<number> coerces float 3.7 to int32 via truncation to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(3.7);
      let a: Int32Array = Int32Array.from(s);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6800
     * @tc.name int32ArrayFromPart07TestMindmapTest068
     * @tc.desc Verify from() with Set<number> coerces negative float -2.5 to int32 via truncation to -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-2.5);
      let a: Int32Array = Int32Array.from(s);
      expect(a.$_get(0)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6900
     * @tc.name int32ArrayFromPart07TestMindmapTest069
     * @tc.desc Verify from() with Set<number> wraps overflow value 2147483648 to int32 as -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(2147483648);
      let a: Int32Array = Int32Array.from(s);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_7000
     * @tc.name int32ArrayFromPart07TestMindmapTest070
     * @tc.desc Verify from() with Set<number> containing a negative integer preserves value and correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-100);
      let a: Int32Array = Int32Array.from(s);
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_7100
     * @tc.name int32ArrayFromPart07TestMindmapTest071
     * @tc.desc Verify from() with Set<number> iterates values in insertion order and preserves all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(10);
      s.add(-20);
      s.add(30);
      let a: Int32Array = Int32Array.from(s);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(-20);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_7200
     * @tc.name int32ArrayFromPart07TestMindmapTest072
     * @tc.desc Verify from() with FixedArray preserves all elements including zero-valued elements at correct indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([10, 0, 30] as number[]);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_7300
     * @tc.name int32ArrayFromPart07TestMindmapTest073
     * @tc.desc Verify from() with ArrayLike and mapfn correctly passes element values at each index to mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sawUndef: boolean = false;
      let a: Int32Array = Int32Array.from([77, 0] as number[], (v: number, k: number): number => {
        if (k === 1 && v === 0) {
          sawUndef = true;
        }
        return v;
      });
      expect(sawUndef).assertTrue();
      expect(a.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_7400
     * @tc.name int32ArrayFromPart07TestMindmapTest074
     * @tc.desc Verify from() on empty FixedArray produces empty Int32Array with consistent zero byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = Int32Array.from([] as number[]);
      let a2: Int32Array = Int32Array.from([] as number[]);
      expect(a1.length).assertEqual(0);
      expect(a2.length).assertEqual(0);
      expect(a1.byteLength).assertEqual(a2.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_7500
     * @tc.name int32ArrayFromPart07TestMindmapTest075
     * @tc.desc Verify from() converts 2^53 to Int32 zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart07TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([9007199254740992.0]);
      expect(a.$_get(0)).assertEqual(0);
    });

  });
}
