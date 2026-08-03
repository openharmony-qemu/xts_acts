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

export default function int32ArrayFromPart07TestMindmapTestTest(): void {
  describe('Int32ArrayFromPart07TestMindmapTestTest', (): void => {
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
         * @tc.desc Verify FixedArray [] Set<int> length 0
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
         * @tc.desc Verify Array<number> Int32Array byteLength 0
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
         * @tc.desc Verify [1,2] FixedArray new Set([1,2])
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a1: Int32Array = Int32Array.from([1, 2]);
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
         * @tc.desc Verify FixedArray<int> [1,2,3] Array<number> [1,2,3] length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a1: Int32Array = Int32Array.from([1, 2, 3]);
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
          let a2: Int32Array = Int32Array.from([7, 8, 9]);
          expect(a1.byteLength).assertEqual(a2.byteLength);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_0600
         * @tc.name int32ArrayFromPart07TestMindmapTest006
         * @tc.desc Verify Set FixedArray
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
         * @tc.desc Verify Iterable [4,5,6] FixedArray [4,5,6]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let g: Array<number> = [4, 5, 6];
          let a1: Int32Array = Int32Array.from(g);
          let a2: Int32Array = Int32Array.from([4, 5, 6]);
          expect(a1.length).assertEqual(a2.length);
          expect(a1.$_get(1)).assertEqual(a2.$_get(1));
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_0800
         * @tc.name int32ArrayFromPart07TestMindmapTest008
         * @tc.desc Verify ArrayLike length=3 Array<number> [0,0,0] length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let al: Array<number> = [0, 0, 0];
          let a1: Int32Array = Int32Array.from(al);
          let arr: Array<number> = [0, 0, 0];
          let a2: Int32Array = Int32Array.from(arr);
          expect(a1.length).assertEqual(a2.length);
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
          let a2: Int32Array = Int32Array.from([1]);
          expect(a1.$_get(0)).assertEqual(1);
          expect(a2.$_get(0)).assertEqual(1);
          expect(a1.BYTES_PER_ELEMENT).assertEqual(a2.BYTES_PER_ELEMENT);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1000
         * @tc.name int32ArrayFromPart07TestMindmapTest010
         * @tc.desc Verify [1,2] FixedArray Array Set length 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Array<number> = [1, 2];
          let aArr: Int32Array = Int32Array.from(arr);
          let aFix: Int32Array = Int32Array.from([1, 2]);
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
         * @tc.desc Verify FixedArray Array Set Int32Array byteOffset 0
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
         * @tc.desc Verify FixedArray/Array/Set/Int32Array BYTES_PER_ELEMENT 4
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Array<number> = [1];
          let s: Set<number> = new Set<number>();
          s.add(1);
          expect(Int32Array.from([1]).BYTES_PER_ELEMENT).assertEqual(4);
          expect(Int32Array.from(arr).BYTES_PER_ELEMENT).assertEqual(4);
          expect(Int32Array.from(s).BYTES_PER_ELEMENT).assertEqual(4);
          expect(Int32Array.from(new Int32Array([1])).BYTES_PER_ELEMENT).assertEqual(4);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1300
         * @tc.name int32ArrayFromPart07TestMindmapTest013
         * @tc.desc Verify byteLength 12 3*4
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
          expect(Int32Array.from([1, 2, 3]).byteLength).assertEqual(12);
          expect(Int32Array.from(arr).byteLength).assertEqual(12);
          expect(Int32Array.from(s).byteLength).assertEqual(12);
          expect(Int32Array.from(new Int32Array([1, 2, 3])).byteLength).assertEqual(12);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1400
         * @tc.name int32ArrayFromPart07TestMindmapTest014
         * @tc.desc Verify buffer ArrayBuffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array([1, 2]);
          let aSrc: Int32Array = Int32Array.from(src);
          aSrc.$_set(0, 999);
          expect(src.$_get(0)).assertEqual(1);
          expect(aSrc.$_get(0)).assertEqual(999);
          let arr: Array<number> = [1, 2];
          let aArr: Int32Array = Int32Array.from(arr);
          expect(aArr.buffer.byteLength).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1500
         * @tc.name int32ArrayFromPart07TestMindmapTest015
         * @tc.desc Verify FixedArray Array<number> buffer null byteLength=0
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
         * @tc.desc Verify Set buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let s: Set<number> = new Set<number>();
          s.add(10);
          let a: Int32Array = Int32Array.from(s);
          expect(a.buffer.byteLength).assertEqual(4);
          expect(a.length).assertEqual(1);
          expect(a[0]).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1700
         * @tc.name int32ArrayFromPart07TestMindmapTest017
         * @tc.desc Verify [5] toString "5"
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let s: Set<number> = new Set<number>();
          s.add(5);
          let arr: Array<number> = [5];
          expect(Int32Array.from([5]).toString()).assertEqual('5');
          expect(Int32Array.from(arr).toString()).assertEqual('5');
          expect(Int32Array.from(s).toString()).assertEqual('5');
          expect(Int32Array.from(new Int32Array([5])).toString()).assertEqual('5');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1800
         * @tc.name int32ArrayFromPart07TestMindmapTest018
         * @tc.desc Verify [1,2] toString "1,2"
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let s: Set<number> = new Set<number>();
          s.add(1);
          s.add(2);
          let arr: Array<number> = [1, 2];
          expect(Int32Array.from([1, 2]).toString()).assertEqual('1,2');
          expect(Int32Array.from(arr).toString()).assertEqual('1,2');
          expect(Int32Array.from(s).toString()).assertEqual('1,2');
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_1900
         * @tc.name int32ArrayFromPart07TestMindmapTest019
         * @tc.desc Verify FixedArray Set toString
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
         * @tc.desc Verify [-1, -2] FixedArray Array toString "-1,-2"
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
         * @tc.desc Verify values from FixedArray and Set
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a1: Int32Array = Int32Array.from([1]);
          expect(a1.length).assertEqual(1);
          expect(a1.$_get(0)).assertEqual(1);
          let s: Set<number> = new Set<number>();
          s.add(1);
          let a2: Int32Array = Int32Array.from(s);
          expect(a2.length).assertEqual(1);
          expect(a2.$_get(0)).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2200
         * @tc.name int32ArrayFromPart07TestMindmapTest022
         * @tc.desc Verify FixedArray mapfn x=>x*2 [2,4,6]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Array<number> = [1, 2, 3];
          let a1: Int32Array = Int32Array.from(src, (v: number): number => v * 2);
          let a2: Int32Array = Int32Array.from([2, 4, 6]);
          expect(a1.$_get(0)).assertEqual(a2.$_get(0));
          expect(a1.$_get(1)).assertEqual(a2.$_get(1));
          expect(a1.$_get(2)).assertEqual(a2.$_get(2));
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2300
         * @tc.name int32ArrayFromPart07TestMindmapTest023
         * @tc.desc Verify ArrayLike + mapfn FixedArray+mapfn
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let al: Array<number> = [10, 20];
          let src23: Array<number> = [10, 20];
          let a1: Int32Array = Int32Array.from(al, (v: number): number => v + 1);
          let a2: Int32Array = Int32Array.from(src23, (v: number): number => v + 1);
          expect(a1.length).assertEqual(a2.length);
          expect(a1.$_get(0)).assertEqual(a2.$_get(0));
          expect(a1.$_get(1)).assertEqual(a2.$_get(1));
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2400
         * @tc.name int32ArrayFromPart07TestMindmapTest024
         * @tc.desc Verify Set mapfn Iterable+mapfn
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let s: Set<number> = new Set<number>();
          s.add(3);
          s.add(7);
          let a1: Int32Array = Int32Array.from(s);
          let w: Array<number> = Array.from(s);
          let a2: Int32Array = Int32Array.from(w, (v: number): number => v);
          expect(a1.$_get(0)).assertEqual(a2.$_get(0));
          expect(a1.$_get(1)).assertEqual(a2.$_get(1));
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2500
         * @tc.name int32ArrayFromPart07TestMindmapTest025
         * @tc.desc Verify mapfn receives index k as second argument (Array)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let idx: Array<number> = [];
          let src: Array<number> = [10, 20, 30];
          let a: Int32Array = Int32Array.from(src, (v: number, k: number): number => {
            idx.push(k);
            return v;
          });
          expect(idx.length).assertEqual(3);
          expect(idx[0]).assertEqual(0);
          expect(idx[1]).assertEqual(1);
          expect(idx[2]).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2600
         * @tc.name int32ArrayFromPart07TestMindmapTest026
         * @tc.desc Verify mapfn receives index k as second argument (Array)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let al: Array<number> = [7, 8, 9];
          let idx: Array<number> = [];
          let a: Int32Array = Int32Array.from(al, (v: number, k: number): number => {
            idx.push(k);
            return v;
          });
          expect(idx.length).assertEqual(3);
          expect(idx[0]).assertEqual(0);
          expect(idx[1]).assertEqual(1);
          expect(idx[2]).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2700
         * @tc.name int32ArrayFromPart07TestMindmapTest027
         * @tc.desc Verify mapfn receives index k as second argument (Iterable)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let t: Array<number> = [100, 200, 300];
          let idx: Array<number> = [];
          let a: Int32Array = Int32Array.from(t, (v: number, k: number): number => {
            idx.push(k);
            return v;
          });
          expect(idx.length).assertEqual(3);
          expect(idx[0]).assertEqual(0);
          expect(idx[1]).assertEqual(1);
          expect(idx[2]).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2800
         * @tc.name int32ArrayFromPart07TestMindmapTest028
         * @tc.desc Verify mapfn NaN ToInt32 0 Array Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let al: Array<number> = [99];
          let src28: Array<number> = [99];
          let a1: Int32Array = Int32Array.from(src28, (v: number): number => Number.NaN);
          let a2: Int32Array = Int32Array.from(al, (v: number): number => Number.NaN);
          expect(a1.$_get(0)).assertEqual(0);
          expect(a2.$_get(0)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_2900
         * @tc.name int32ArrayFromPart07TestMindmapTest029
         * @tc.desc Verify mapfn Infinity ToInt32 0 Array Set(Iterable)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let s: Set<number> = new Set<number>();
          s.add(1);
          let src29: Array<number> = [1];
          let a1: Int32Array = Int32Array.from(src29, (v: number): number => Number.POSITIVE_INFINITY);
          let w: Array<number> = Array.from(s);
          let a2: Int32Array = Int32Array.from(w, (v: number): number => Number.POSITIVE_INFINITY);
          expect(a1.$_get(0)).assertEqual(0);
          expect(a2.$_get(0)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3000
         * @tc.name int32ArrayFromPart07TestMindmapTest030
         * @tc.desc Verify mapfn 3.7 ToInt32 3 Array Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Array<number> = [1];
          let src30: Array<number> = [1];
          let a1: Int32Array = Int32Array.from(src30, (v: number): number => 3.7);
          let a2: Int32Array = Int32Array.from(arr, (v: number): number => 3.7);
          expect(a1.$_get(0)).assertEqual(3);
          expect(a2.$_get(0)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3100
         * @tc.name int32ArrayFromPart07TestMindmapTest031
         * @tc.desc Verify mapfn 2147483648 -2147483648 Array Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let al: Array<number> = [0];
          let src31: Array<number> = [0];
          let a1: Int32Array = Int32Array.from(src31, (v: number): number => 2147483648);
          let a2: Int32Array = Int32Array.from(al, (v: number): number => 2147483648);
          expect(a1.$_get(0)).assertEqual(-2147483648);
          expect(a2.$_get(0)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3200
         * @tc.name int32ArrayFromPart07TestMindmapTest032
         * @tc.desc Verify mapfn throw from Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let captured: Int32Array | null = null;
          try {
              let src: Array<number> = [1, 2];
              let a: Int32Array = Int32Array.from(src, (v: number): number => {
                throw new Error('mapfn boom');
              });
              captured = a;
              expect().assertFail();
          } catch (e) {
              expect(e.name).assertEqual('Error');
          }
          expect(captured).assertEqual(null);
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
          let calls: Array<number> = [];
          try {
              let src: Array<number> = [1, 2, 3];
              Int32Array.from(src, (v: number): number => {
                calls.push(v);
                if (v === 2) {
                  throw new Error('v=2');
                }
                return v;
              });
              expect().assertFail();
          } catch (e) {
              msg = (e as Error).message;
              expect(e.name).assertEqual('Error');
          }
          expect(msg).assertEqual('v=2');
          expect(calls.length).assertEqual(2);
          expect(calls[1]).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3400
         * @tc.name int32ArrayFromPart07TestMindmapTest034
         * @tc.desc Verify mapfn throw from Array Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let al: Array<number> = [10, 20, 30];
          let calls: Array<number> = [];
          try {
              Int32Array.from(al, (v: number): number => {
                calls.push(v);
                if (v === 30) {
                  throw new Error('last');
                }
                return v;
              });
              expect().assertFail();
          } catch (e) {
              expect(e.name).assertEqual('Error');
          }
          expect(calls.length).assertEqual(3);
          expect(calls[2]).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3500
         * @tc.name int32ArrayFromPart07TestMindmapTest035
         * @tc.desc Verify Iterable next() from
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let msg: string = '';
          try {
              let src035: Array<number> = [1, 2, 3];
              Int32Array.from(src035, (v: number): number => {
                if (v === 2) {
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
         * @tc.desc Verify Iterable + mapfn mapfn
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let t: Array<number> = [1, 2, 3];
          let marker: Array<number> = [];
          try {
              Int32Array.from(t, (v: number): number => {
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
         * @tc.desc Verify Set from length value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = new Int32Array(0);
          let s: Set<number> = new Set<number>();
          s.add(9);
          a = Int32Array.from(s);
          expect(a.length).assertEqual(1);
          expect(a.$_get(0)).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_3800
         * @tc.name int32ArrayFromPart07TestMindmapTest038
         * @tc.desc Verify values from FixedArray
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let good: Int32Array = new Int32Array(0);
          good = Int32Array.from([11, 22, 33]);
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
          a = Int32Array.from([4, 5]);
          let src39: Array<number> = [1];
          try {
              Int32Array.from(src39, (v: number): number => { throw new Error('x'); });
              expect().assertFail();
          } catch (e) {
              expect(e.name).assertEqual('Error');
          }
          expect(a.$_get(1)).assertEqual(5);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4000
         * @tc.name int32ArrayFromPart07TestMindmapTest040
         * @tc.desc Verify from
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let before: Int32Array = Int32Array.from([100]);
          let src40: Array<number> = [1];
          try {
              Int32Array.from(src40, (v: number): number => { throw new Error('mid'); });
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
         * @tc.desc Verify from(Int32Array)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src: Int32Array = new Int32Array([7, 8]);
          let dst: Int32Array = Int32Array.from(src);
          dst.$_set(0, 999);
          expect(src.$_get(0)).assertEqual(7);
          expect(dst.$_get(0)).assertEqual(999);
          expect(dst.$_get(1)).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4200
         * @tc.name int32ArrayFromPart07TestMindmapTest042
         * @tc.desc Verify from(Int32Array) Int32Array buffer
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
         * @tc.desc Verify from(Array<number>) Array
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
         * @tc.desc Verify from(FixedArray) buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let dst: Int32Array = Int32Array.from([3, 4, 5]);
          let buf1: ArrayBuffer = dst.buffer;
          dst.$_set(1, 999);
          expect(dst.$_get(1)).assertEqual(999);
          expect(buf1.byteLength).assertEqual(12);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4500
         * @tc.name int32ArrayFromPart07TestMindmapTest045
         * @tc.desc Verify from(Set) Set
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
         * @tc.desc Verify from Array<number>
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Array<number> = [1, 2, 3];
          let a: Int32Array = Int32Array.from(arr);
          let b: Int32Array = Int32Array.from(arr);
          a.$_set(0, 999);
          expect(b.$_get(0)).assertEqual(1);
          expect(a.$_get(0)).assertEqual(999);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4700
         * @tc.name int32ArrayFromPart07TestMindmapTest047
         * @tc.desc Verify from Set
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
          a.$_set(0, 999);
          expect(b.$_get(0)).assertEqual(8);
          expect(a.$_get(0)).assertEqual(999);
          expect(a.$_get(1)).assertEqual(b.$_get(1));
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4800
         * @tc.name int32ArrayFromPart07TestMindmapTest048
         * @tc.desc Verify from(Iterable)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let t: Array<number> = [6, 7];
          let a: Int32Array = Int32Array.from(t);
          let b: Int32Array = Int32Array.from(t);
          a.$_set(0, 999);
          expect(b.$_get(0)).assertEqual(6);
          expect(a.$_get(0)).assertEqual(999);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_4900
         * @tc.name int32ArrayFromPart07TestMindmapTest049
         * @tc.desc Verify from(Int32Array) from
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
         * @tc.desc Verify from(Array<number>) number
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
         * @tc.desc Verify from $_set buffer buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.from([1, 2, 3]);
          let bufBefore: ArrayBuffer = a.buffer;
          a.$_set(2, 55);
          expect(a.buffer).assertEqual(bufBefore);
          expect(a.$_get(2)).assertEqual(55);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_5200
         * @tc.name int32ArrayFromPart07TestMindmapTest052
         * @tc.desc Verify int32 MAX 2147483647 FixedArray / Array / Int32Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Array<number> = [2147483647];
          let src: Int32Array = new Int32Array([2147483647]);
          expect(Int32Array.from([2147483647]).$_get(0)).assertEqual(2147483647);
          expect(Int32Array.from(arr).$_get(0)).assertEqual(2147483647);
          expect(Int32Array.from(src).$_get(0)).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_5300
         * @tc.name int32ArrayFromPart07TestMindmapTest053
         * @tc.desc Verify int32 MIN -2147483648 FixedArray / Set / Array
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
         * @tc.desc Verify 0 -0 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let s: Set<number> = new Set<number>();
          s.add(-0);
          let arr: Array<number> = [-0];
          expect(Int32Array.from([0]).$_get(0)).assertEqual(0);
          expect(Int32Array.from([-0]).$_get(0)).assertEqual(0);
          expect(Int32Array.from(s).$_get(0)).assertEqual(0);
          expect(Int32Array.from(arr).$_get(0)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_5500
         * @tc.name int32ArrayFromPart07TestMindmapTest055
         * @tc.desc Verify -1 Set 0xFFFFFFFF FixedArray Array -1
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
         * @tc.desc Verify 4294967295 FixedArray Array -1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Array<number> = [4294967295];
          let fixArr: Array<number> = [4294967295];
          expect(Int32Array.from(fixArr).$_get(0)).assertEqual(-1);
          expect(Int32Array.from(arr).$_get(0)).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_5700
         * @tc.name int32ArrayFromPart07TestMindmapTest057
         * @tc.desc Verify 4294967296 Array mapfn 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let src057a: Array<number> = [4294967296];
          let a1: Int32Array = Int32Array.from(src057a);
          let src57: Array<number> = [0];
          let a2: Int32Array = Int32Array.from(src57, (v: number): number => 4294967296);
          expect(a1.$_get(0)).assertEqual(0);
          expect(a2.$_get(0)).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_5800
         * @tc.name int32ArrayFromPart07TestMindmapTest058
         * @tc.desc Verify NaN FixedArray/Array/Set 0
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
         * @tc.desc Verify -3.9 FixedArray Array -3
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
         * @tc.desc Verify byteLength=4 length=1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let s: Set<number> = new Set<number>();
          s.add(1);
          let arr: Array<number> = [1];
          let a1: Int32Array = Int32Array.from([1]);
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
         * @tc.desc Verify byteLength=0 length=0
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
         * @tc.desc Verify $_set $_get
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let s: Set<number> = new Set<number>();
          s.add(1);
          let arr: Array<number> = [1];
          let a1: Int32Array = Int32Array.from([1]);
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
         * @tc.desc Verify set no-op
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let s: Set<number> = new Set<number>();
          s.add(1);
          let arr: Array<number> = [1];
          let a1: Int32Array = Int32Array.from([1]);
          let a2: Int32Array = Int32Array.from(arr);
          let a3: Int32Array = Int32Array.from(s);
          try {
            a1.$_set(1, 999);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
          try {
            a2.$_set(1, 999);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
          try {
            a3.$_set(1, 999);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
          expect(a1.length).assertEqual(1);
          expect(a2.at(1)).assertEqual(undefined);
          expect(a3.at(1)).assertEqual(undefined);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6400
         * @tc.name int32ArrayFromPart07TestMindmapTest064
         * @tc.desc Verify get undefined
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let s: Set<number> = new Set<number>();
          s.add(1);
          expect(Int32Array.from([1]).at(99)).assertEqual(undefined);
          expect(Int32Array.from(new Array<number>()).at(0)).assertEqual(undefined);
          expect(Int32Array.from(s).at(1)).assertEqual(undefined);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6500
         * @tc.name int32ArrayFromPart07TestMindmapTest065
         * @tc.desc Verify from(from(FixedArray))
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.from(Int32Array.from([1, 2, 3]));
          expect(a.length).assertEqual(3);
          expect(a.$_get(0)).assertEqual(1);
          expect(a.$_get(2)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6600
         * @tc.name int32ArrayFromPart07TestMindmapTest066
         * @tc.desc Verify from(from(Set)) buffer
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let s: Set<number> = new Set<number>();
          s.add(10);
          s.add(20);
          let a1: Int32Array = Int32Array.from(s);
          let a2: Int32Array = Int32Array.from(a1);
          expect(a2.$_get(0)).assertEqual(10);
          expect(a2.$_get(1)).assertEqual(20);
          a1.$_set(0, 999);
          expect(a2.$_get(0)).assertEqual(10);
          expect(a1.$_get(0)).assertEqual(999);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6700
         * @tc.name int32ArrayFromPart07TestMindmapTest067
         * @tc.desc Verify from(Array, mapfn) from
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let arr: Array<number> = [1, 2, 3];
          let a1: Int32Array = Int32Array.from(arr, (v: number): number => v + 10);
          let a2: Int32Array = Int32Array.from(a1);
          expect(a2.$_get(0)).assertEqual(11);
          expect(a2.$_get(1)).assertEqual(12);
          expect(a2.$_get(2)).assertEqual(13);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6800
         * @tc.name int32ArrayFromPart07TestMindmapTest068
         * @tc.desc Verify from( FixedArray) from
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let a: Int32Array = Int32Array.from(Int32Array.from([]));
          expect(a.length).assertEqual(0);
          expect(a.byteLength).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_6900
         * @tc.name int32ArrayFromPart07TestMindmapTest069
         * @tc.desc Verify Set<number> 3.7 from 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let s: Set<number> = new Set<number>();
          s.add(3.7);
          let a: Int32Array = Int32Array.from(s);
          expect(a.$_get(0)).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_7000
         * @tc.name int32ArrayFromPart07TestMindmapTest070
         * @tc.desc Verify Set<number> -2.5 from -2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let s: Set<number> = new Set<number>();
          s.add(-2.5);
          let a: Int32Array = Int32Array.from(s);
          expect(a.$_get(0)).assertEqual(-2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_7100
         * @tc.name int32ArrayFromPart07TestMindmapTest071
         * @tc.desc Verify Set<number> 2147483648 from -2147483648
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let s: Set<number> = new Set<number>();
          s.add(2147483648);
          let a: Int32Array = Int32Array.from(s);
          expect(a.$_get(0)).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_7200
         * @tc.name int32ArrayFromPart07TestMindmapTest072
         * @tc.desc Verify Set<int> -100
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let s: Set<number> = new Set<number>();
          s.add(-100);
          let a: Int32Array = Int32Array.from(s);
          expect(a.length).assertEqual(1);
          expect(a.$_get(0)).assertEqual(-100);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_7300
         * @tc.name int32ArrayFromPart07TestMindmapTest073
         * @tc.desc Verify Set<int> [10,-20,30]
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_7400
         * @tc.name int32ArrayFromPart07TestMindmapTest074
         * @tc.desc Verify Array length=3 0 2 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let al: Array<number> = [10, 0, 30];
          let a: Int32Array = Int32Array.from(al);
          expect(a.length).assertEqual(3);
          expect(a.$_get(0)).assertEqual(10);
          expect(a.$_get(1)).assertEqual(0);
          expect(a.$_get(2)).assertEqual(30);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_7500
         * @tc.name int32ArrayFromPart07TestMindmapTest075
         * @tc.desc Verify Array+mapfn passes element value and index to mapfn
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let al: Array<number> = [77, 0];
          let capturedValues: number[] = [];
          let capturedIndices: number[] = [];
          let a: Int32Array = Int32Array.from(al, (v: number, k: number): number => {
            capturedValues.push(v);
            capturedIndices.push(k);
            return v;
          });
          expect(a.length).assertEqual(2);
          expect(capturedValues[0]).assertEqual(77);
          expect(capturedValues[1]).assertEqual(0);
          expect(capturedIndices[0]).assertEqual(0);
          expect(capturedIndices[1]).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART07_TEST_MINDMAP_7600
         * @tc.name int32ArrayFromPart07TestMindmapTest076
         * @tc.desc Verify Array length=0 FixedArray []
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level LEVEL2
         */
        it('int32ArrayFromPart07TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          let al: Array<number> = [];
          let a1: Int32Array = Int32Array.from(al);
          let a2: Int32Array = Int32Array.from([]);
          expect(a1.length).assertEqual(0);
          expect(a2.length).assertEqual(0);
          expect(a1.byteLength).assertEqual(a2.byteLength);
        });

  });
}
