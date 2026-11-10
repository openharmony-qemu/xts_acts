'use static';

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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

export default function int16ArrayIndexGetPart01Test(): void {
  describe('Int16ArrayIndexGetPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART01_0100
     * @tc.name int16ArrayIndexGetPart01Test001
     * @tc.desc Merged batch (5 tests): out-of-range RangeError: reads past the bounds of populated and zero-length arrays, a Set source, empty from(), Map.values and negative indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get with out-of-bounds indices throws RangeError on non-empty and empty arrays ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let empty: Int16Array = new Int16Array([]);
        let oobIdx: number[] = [3, 4, 2147483647];
        for (let i: int = 0; i < oobIdx.length; i++) {
          try {
            let result: number | undefined = arr.$_get(oobIdx[i].toInt());
            expect(result).assertUndefined();
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        }
        try {
          let emptyResult: number | undefined = empty.$_get(0 as int);
          expect(emptyResult).assertUndefined();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      // --- [2] Verify $_get at an out-of-range index on a two-element array built by from(Set) throws RangeError ---
      {
        let s: Set<int> = new Set<int>();
        s.add(1);
        s.add(2);
        let arr: Int16Array = Int16Array.from(s);
        try {
          let oob: number | undefined = arr.$_get(2);
          expect(oob).assertUndefined();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      // --- [3] Verify $_get at index 0 on Int16Array.from(an empty int Array) throws RangeError ---
      {
        let empty: int[] = [];
        let arr: Int16Array = Int16Array.from(empty);
        try {
          let oob: number | undefined = arr.$_get(0);
          expect(oob).assertUndefined();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      // --- [4] Verify $_get at the length index on from(Map.values()) throws RangeError ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 4);
        m.set('b', 8);
        let arr: Int16Array = Int16Array.from(m.values());
        try {
          let oob: number | undefined = arr.$_get(arr.length);
          expect(oob).assertUndefined();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      // --- [5] Verify $_get with a negative index throws RangeError rather than reading from the end ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        try {
          let oob: number | undefined = arr.$_get(-1);
          expect(oob).assertUndefined();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART01_0200
     * @tc.name int16ArrayIndexGetPart01Test002
     * @tc.desc Merged batch (5 tests): buffer sharing and views: offset-view readback, DataView writes, construction forms, and ArrayBuffer.isView true/false cases.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get reads back the filled elements at index 0 and 2 on an offset ArrayBuffer view after $_set ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf, 2, 3);
        arr.$_set(0, 11);
        arr.$_set(2, 33);
        expect(arr.$_get(0)).assertEqual(11);
        expect(arr.$_get(2)).assertEqual(33);
      }

      // --- [2] Verify $_get reads the value written through a DataView on the same buffer ---
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        let dv: DataView = new DataView(arr.buffer);
        dv.setInt16(0, 300, true);
        expect(arr.$_get(0)).assertEqual(300);
      }

      // --- [3] Verify $_get returns values set via $_set across ArrayBuffer view, array and length-constructor forms ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 88);
        arr.$_set(1, 99);
        expect(arr.$_get(0)).assertEqual(88);
        expect(arr.$_get(1)).assertEqual(99);

        let arr18: Int16Array = new Int16Array([10, 20]);
        arr18.$_get(0);
        arr18.$_set(0, 99);
        expect(arr18.$_get(0)).assertEqual(99);

        let arr22: Int16Array = new Int16Array(3);
        arr22.$_set(0, 11);
        arr22.$_get(1);
        arr22.$_set(2, 33);
        expect(arr22.$_get(0)).assertEqual(11);
        expect(arr22.$_get(2)).assertEqual(33);
      }

      // --- [4] Verify ArrayBuffer.isView is true for an Int16Array and $_get still reads its elements ---
      {
        let arr: Int16Array = new Int16Array([1, 2]);
        let isView: boolean = ArrayBuffer.isView(arr);
        expect(isView).assertTrue();
        expect(arr.$_get(1)).assertEqual(2);
      }

      // --- [5] Verify ArrayBuffer.isView is false for a plain ArrayBuffer while its Int16Array view reads values via $_get ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let isView: boolean = ArrayBuffer.isView(buf);
        expect(isView).assertFalse();

        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 7);
        expect(arr.$_get(0)).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART01_0300
     * @tc.name int16ArrayIndexGetPart01Test003
     * @tc.desc Merged batch (5 tests): boundary values and truncation: all-32767 array, exact values, boundary plus negative, 0x8000 wrap and 0x7FFF write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get reads every position of an all-32767 array as the positive bound ---
      {
        let arr: Int16Array = Int16Array.of(32767, 32767, 32767);
        let g0: number = arr.$_get(0);
        let g1: number = arr.$_get(1);
        let g2: number = arr.$_get(2);
        expect(g0).assertEqual(32767);
        expect(g1).assertEqual(32767);
        expect(g2).assertEqual(32767);
      }

      // --- [2] Verify $_get returns exact stored value for positive, boundary and negative values and multiple indices ---
      {
        let values: number[] = [42, 32767, -32768, -42];
        for (let i: int = 0; i < values.length; i++) {
          let arr: Int16Array = new Int16Array([values[i]]);
          expect(arr.$_get(0)).assertEqual(values[i]);
        }
        let arr5: Int16Array = new Int16Array([100, 200]);
        let r5a: number = arr5.$_get(0);
        let r5b: number = arr5.$_get(1);
        expect(r5a).assertEqual(100);
        expect(r5b).assertEqual(200);

        let arr20: Int16Array = new Int16Array([5, 10, 15]);
        arr20.$_get(1);
        expect(arr20.$_get(0)).assertEqual(5);
        expect(arr20.$_get(2)).assertEqual(15);
      }

      // --- [3] Verify $_get reads the int16 boundary 32767 at index 0 and a negative element at the last index ---
      {
        let arr: Int16Array = new Int16Array([32767, -32768, 0, -1]);
        expect(arr.$_get(0)).assertEqual(32767);
        expect(arr.$_get(3)).assertEqual(-1);
      }

      // --- [4] Verify $_get(1) on a from(Int16Array) array after fill(0x8000) reads the wrapped negative int16 bound -32768 ---
      {
        let base: Int16Array = Int16Array.of(0, 0);
        let arr: Int16Array = Int16Array.from(base);
        arr.fill(0x8000);
        expect(arr.$_get(1)).assertEqual(-32768);
      }

      // --- [5] Verify $_get(0) reads a value written earlier by $_set with the hex int16 boundary 0x7FFF on a from(Int16Array) array ---
      {
        let base: Int16Array = Int16Array.of(0, 0);
        let arr: Int16Array = Int16Array.from(base);
        arr.$_set(0, 0x7FFF);
        expect(arr.$_get(0)).assertEqual(32767);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART01_0400
     * @tc.name int16ArrayIndexGetPart01Test004
     * @tc.desc Merged batch (5 tests): post-mutation reads: toSorted, with() copy, slice, sort and $_set round-trip.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get reads the elements at index 0 and 3 on the toSorted() copy ---
      {
        let arr: Int16Array = Int16Array.of(5, 2, 8, 1);
        let sorted: Int16Array = arr.toSorted();
        expect(sorted.$_get(0)).assertEqual(1);
        expect(sorted.$_get(3)).assertEqual(8);
      }

      // --- [2] Verify $_get reads the substituted element at index 1 on the with(index,value) copy while the original is unmutated ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let modified: Int16Array = arr.with(1, 99);
        expect(modified.$_get(1)).assertEqual(99);
        expect(arr.$_get(1)).assertEqual(2);
      }

      // --- [3] Verify $_get reads the elements at slice-local index 0 and 2 on the slice() result ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        let sl: Int16Array = arr.slice(1, 4);
        expect(sl.$_get(0)).assertEqual(20);
        expect(sl.$_get(2)).assertEqual(40);
      }

      // --- [4] Verify $_get(0) reflects the sorted order after sort() on a from(Int16Array) array ---
      {
        let base: Int16Array = Int16Array.of(9, 3, 6);
        let arr: Int16Array = Int16Array.from(base);
        arr.sort((a: number, b: number): int => (a - b).toInt());
        expect(arr.$_get(0)).assertEqual(3);
      }

      // --- [5] Verify $_get then $_set then $_get reflects updated value ---
      {
        let arr: Int16Array = new Int16Array([10, 20]);
        let oldVal: number | undefined = arr.$_get(0 as int);
        arr.$_set(0 as int, 99);
        let newVal: number | undefined = arr.$_get(0 as int);
        expect(oldVal).assertEqual(10);
        expect(newVal).assertEqual(99);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART01_0500
     * @tc.name int16ArrayIndexGetPart01Test005
     * @tc.desc Merged batch (4 tests): construction sources: Array-literal sum, length-constructed squares, Set last element and mirror comparison.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify summing $_get at indices 0, 1 and 2 on an array built from an Array literal equals the element sum ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        expect(arr.$_get(0) + arr.$_get(1) + arr.$_get(2)).assertEqual(60);
      }

      // --- [2] Verify a loop accumulating squares of $_get values on a length-constructed array equals the sum of squares ---
      {
        let arr: Int16Array = new Int16Array(3);
        for (let i: int = 0; i < 3; i++) {
          arr.$_set(i, i + 1);
        }
        let squares: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          let v: number = arr.$_get(i);
          squares = squares + v * v;
        }
        let want: int = 14;
        expect(squares).assertEqual(want);
      }

      // --- [3] Verify $_get at the last index of a from(Set) array reads the final element added ---
      {
        let s: Set<int> = new Set<int>();
        s.add(3);
        s.add(6);
        s.add(9);
        let arr: Int16Array = Int16Array.from(s);
        let count: int = 0;
        for (const v of s.values()) {
          count = count + 1;
        }
        expect(arr.$_get(count - 1)).assertEqual(9);
      }

      // --- [4] Verify a loop comparing $_get at every index of an array built by from(Set) against a mirror array matches on all indices ---
      {
        let s: Set<int> = new Set<int>();
        s.add(4);
        s.add(8);
        s.add(12);
        let arr: Int16Array = Int16Array.from(s);
        let mirror: Int16Array = Int16Array.of(4, 8, 12);
        let allEqual: boolean = true;
        for (let i: int = 0; i < arr.length; i++) {
          if (arr.$_get(i) !== mirror.$_get(i)) {
            allEqual = false;
          }
        }
        expect(allEqual).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART01_0600
     * @tc.name int16ArrayIndexGetPart01Test006
     * @tc.desc Merged batch (5 tests): index argument forms: Math.abs, Math.round, ternary, early-break search and string length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get accepts an index produced by Math.abs negating a negative index ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9);
        let k: int = -1;
        let idx: int = Math.abs(k);
        let win: Int16Array = arr.subarray(idx);
        expect(win.$_get(0)).assertEqual(6);
      }

      // --- [2] Verify $_get accepts an index produced by Math.round on a double ---
      {
        let arr: Int16Array = Int16Array.of(20, 40, 60);
        let x: double = 1.4;
        let idx: int = Math.round(x).toInt();
        let one: Int16Array = arr.slice(idx, idx + 1);
        expect(one.$_get(0)).assertEqual(40);
      }

      // --- [3] Verify $_get accepts an index chosen by a two-branch ternary over computed positions ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
        let head: int = 0;
        let tail: int = arr.length - 1;
        let pickHead: boolean = false;
        let idx: int = pickHead ? head : tail;
        expect(idx).assertEqual(tail);
        expect(arr.$_get(idx)).assertEqual(8);
      }

      // --- [4] Verify $_get accepts an index located by an early-break search for a value ---
      {
        let arr: Int16Array = Int16Array.of(4, 8, 12, 16);
        let pos: int = -1;
        for (let i: int = 0; i < arr.length; i++) {
          if (arr.$_get(i) === 12) {
            pos = i;
            break;
          }
        }
        expect(arr.$_get(pos)).assertEqual(12);
      }

      // --- [5] Verify $_get accepts an index equal to a token string length ---
      {
        let arr: Int16Array = Int16Array.of(4, 5, 6, 7);
        let token: string = 'abc';
        let idx: int = token.length;
        expect(token.length).assertEqual(3);
        expect(arr.$_get(idx)).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART01_0700
     * @tc.name int16ArrayIndexGetPart01Test007
     * @tc.desc Merged batch (5 tests): index argument forms: parseInt, modulo hash, arithmetic chain, length difference and small-integer product.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get accepts an index from Number.parseInt of a single digit string ---
      {
        let arr: Int16Array = Int16Array.of(30, 40, 50, 60);
        let idxs: int[] = [Number.parseInt('0', 10).toInt(), Number.parseInt('3', 10).toInt()];
        let sum: number = 0;
        for (let i: int = 0; i < idxs.length; i++) {
          sum = sum + (arr.$_get(idxs[i]) as number);
        }
        expect(sum).assertEqual(90);
      }

      // --- [2] Verify $_get accepts an index produced by a remainder modulo of a hash value ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9, 12);
        let hash: int = 11;
        let idx: int = hash % arr.length;
        expect(hash % arr.length).assertEqual(3);
        expect(arr.$_get(idx)).assertEqual(12);
      }

      // --- [3] Verify $_get accepts an index from an int arithmetic chain a plus b times two ---
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15, 20);
        let a: int = 0;
        let b: int = 1;
        let idx: int = a + b * 2;
        expect(a + b * 2).assertEqual(2);
        expect(arr.$_get(idx)).assertEqual(15);
      }

      // --- [4] Verify $_get accepts an index equal to the difference of two array lengths ---
      {
        let small: Int16Array = Int16Array.of(1, 2);
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let idx: int = arr.length - small.length;
        expect(idx).assertEqual(2);
        expect(arr.$_get(idx)).assertEqual(30);
      }

      // --- [5] Verify $_get accepts an index that is the product of two small integers ---
      {
        let arr: Int16Array = Int16Array.of(4, 8, 12, 16);
        let idx: int = 2 * 1;
        expect(2 * 1).assertEqual(2);
        expect(arr.$_get(idx)).assertEqual(12);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART01_0800
     * @tc.name int16ArrayIndexGetPart01Test008
     * @tc.desc Merged batch (5 tests): algorithmic scans and aggregations: early-exit equality, mirror sum, do-while sum, running maximum and minimum index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get confirms every element equals the first by a scan with early exit ---
      {
        let arr: Int16Array = Int16Array.of(5, 5, 5);
        let same: boolean = true;
        let first: number = arr.$_get(0);
        for (let i: int = 1; i < arr.length; i++) {
          if ((arr.$_get(i)) !== first) {
            same = false;
            break;
          }
        }
        expect(same).assertTrue();
      }

      // --- [2] Verify $_get sums each element together with its mirror-position partner ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let total: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          total = total + (arr.$_get(i)) + (arr.$_get(arr.length - 1 - i));
        }
        let want: int = 20;
        expect(total).assertEqual(want);
      }

      // --- [3] Verify $_get accumulates the element sum in a do-while loop ---
      {
        let arr: Int16Array = Int16Array.of(4, 8, 12);
        let i: int = 0;
        let total: number = 0;
        do {
          total = total + arr.$_get(i);
          i = i + 1;
        } while (i < arr.length);
        let want: int = 24;
        expect(total).assertEqual(want);
      }

      // --- [4] Verify $_get computes the running maximum across a manual index scan ---
      {
        let arr: Int16Array = Int16Array.of(3, 9, 2, 7);
        let best: number = arr.$_get(0);
        for (let i: int = 1; i < arr.length; i++) {
          let v: number = arr.$_get(i);
          if (v > best) {
            best = v;
          }
        }
        let want: int = 9;
        expect(best).assertEqual(want);
      }

      // --- [5] Verify $_get finds the index of the smallest element by manual comparison ---
      {
        let arr: Int16Array = Int16Array.of(6, 1, 8, 3);
        let mi: int = 0;
        for (let i: int = 1; i < arr.length; i++) {
          if (arr.$_get(i) < arr.$_get(mi)) {
            mi = i;
          }
        }
        expect(arr.$_get(mi)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART01_0900
     * @tc.name int16ArrayIndexGetPart01Test009
     * @tc.desc Merged batch (4 tests): algorithmic scans and aggregations: squares sum, even-index sum, interior maxima and the maximum adjacent-pair sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get sums the squares of the elements in a manual scan ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let total: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          let v: number = arr.$_get(i);
          total = total + v * v;
        }
        let want: int = 30;
        expect(total).assertEqual(want);
      }

      // --- [2] Verify $_get sums only the elements sitting at even indexes ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9, 12);
        let total: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          if (i % 2 === 0) {
            total = total + (arr.$_get(i));
          }
        }
        let want: int = 12;
        expect(total).assertEqual(want);
      }

      // --- [3] Verify $_get counts the interior elements larger than both neighbours ---
      {
        let arr: Int16Array = Int16Array.of(1, 5, 2, 8, 3);
        let peaks: int = 0;
        for (let i: int = 1; i < arr.length - 1; i++) {
          if ((arr.$_get(i)) > (arr.$_get(i - 1)) && (arr.$_get(i)) > (arr.$_get(i + 1))) {
            peaks = peaks + 1;
          }
        }
        let want: int = 2;
        expect(peaks).assertEqual(want);
      }

      // --- [4] Verify $_get finds the largest adjacent-pair sum across the array ---
      {
        let arr: Int16Array = Int16Array.of(3, 7, 2, 9);
        let best: number = (arr.$_get(0)) + (arr.$_get(1));
        for (let i: int = 1; i < arr.length - 1; i++) {
          let s: number = (arr.$_get(i)) + (arr.$_get(i + 1));
          if (s > best) {
            best = s;
          }
        }
        let want: int = 11;
        expect(best).assertEqual(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART01_1000
     * @tc.name int16ArrayIndexGetPart01Test010
     * @tc.desc Merged batch (5 tests): direct index reads: fixed-hop chaining, subarray-local indices, even-filter, map result and every() comparison.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get follows each element as the next index over a fixed hop count ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 0);
        let idx: int = 0;
        let hops: int = 0;
        while (hops < 2) {
          idx = arr.$_get(idx).toInt();
          hops = hops + 1;
        }
        let reached: number = arr.$_get(idx);
        expect(idx).assertEqual(2);
        expect(reached).assertEqual(0);
      }

      // --- [2] Verify $_get reads the elements at subarray-local index 0 and 1 on the subarray() result ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let sub: Int16Array = arr.subarray(1, 3);
        expect(sub.$_get(0)).assertEqual(20);
        expect(sub.$_get(1)).assertEqual(30);
      }

      // --- [3] Verify $_get reads the elements at index 0 and 2 on an even-only filter result ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
        let filtered: Int16Array = arr.filter((v: number, _i: int, _a: Int16Array): boolean => v % 2 === 0);
        expect(filtered.$_get(0)).assertEqual(2);
        expect(filtered.$_get(2)).assertEqual(6);
      }

      // --- [4] Verify $_get reads the element at index 1 on a map() result ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let mapped: Int16Array = arr.map((v: number, _i: int, _a: Int16Array): number => v * 10);
        expect(mapped.$_get(1)).assertEqual(20);
      }

      // --- [5] Verify every() predicate comparing $_get(index) with the element counts all matches ---
      {
        let arr: Int16Array = Int16Array.of(6, 6, 6);
        let hits: int = 0;
        let all: boolean = arr.every((element: number, index: int): boolean => {
          if (arr.$_get(index) === element) {
            hits = hits + 1;
          }
          return true;
        });
        expect(all).assertTrue();
        expect(hits).assertEqual(3);
      }
    });

  });
}
