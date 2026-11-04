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

function midIndex(arr: Int16Array): int {
  return arr.length - 2;
}

export default function int16ArrayIndexGetPart02Test(): void {
  describe('Int16ArrayIndexGetPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_0100
     * @tc.name int16ArrayIndexGetPart02Test001
     * @tc.desc Merged batch (5 tests): out-of-range RangeError: length-index reads on Map, copied and toReversed sources, wrapped fill readback and sibling-view invariance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get at the length index on from(Map.keys()) throws RangeError ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(8, 'a');
        m.set(9, 'b');
        let arr: Int16Array = Int16Array.from(m.keys());
        try {
          let oob: number | undefined = arr.$_get(arr.length);
          expect(oob).assertUndefined();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      // --- [2] Verify $_get reads the int16-wrapped value written by an out-of-range fill() ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
        arr.fill(40000);
        expect(arr.$_get(0)).assertEqual(-25536);
        expect(arr.$_get(3)).assertEqual(-25536);
      }

      // --- [3] Verify a failed out-of-bounds $_get on one view leaves a sibling view's shared-buffer values unchanged ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let writer: Int16Array = new Int16Array(buf);
        let reader: Int16Array = new Int16Array(buf);
        writer.$_set(0, -12345);
        writer.$_set(1, 20000);
        try {
          let oob: number | undefined = writer.$_get(2);
          expect(oob).assertUndefined();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        let r0: number = reader.$_get(0);
        let r1: number = reader.$_get(1);
        expect(r0).assertEqual(-12345);
        expect(r1).assertEqual(20000);
      }

      // --- [4] Verify $_get at the length index throws RangeError on from(another Int16Array) and toReversed() sources ---
      {
        let base: Int16Array = Int16Array.of(1, 2, 3);
        let arrays: Int16Array[] = [Int16Array.from(base), base.toReversed()];
        for (let a: int = 0; a < arrays.length; a++) {
          let arr: Int16Array = arrays[a];
          try {
            let oob: number | undefined = arr.$_get(arr.length);
            expect(oob).assertUndefined();
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('RangeError');
          }
        }
      }

      // --- [5] Verify $_get at index equal to arr.length on an array built by from(Array, mapfn) throws RangeError ---
      {
        let src: int[] = [1, 2];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v + k);
        let oobIdx: int = arr.length;
        try {
          let oob: number | undefined = arr.$_get(oobIdx);
          expect(oob).assertUndefined();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_0200
     * @tc.name int16ArrayIndexGetPart02Test002
     * @tc.desc Merged batch (5 tests): buffer sharing and views: cross-view sync, overlapping last-write, fresh views, local indices and offset views.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify shared buffer write one view read other via $_get syncs across full and offset views ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let fullView: Int16Array = new Int16Array(buf);
        fullView.$_set(1, 77);
        let offsetView: Int16Array = new Int16Array(buf, 2, 2);
        expect(offsetView.$_get(0)).assertEqual(77);

        let buf29: ArrayBuffer = new ArrayBuffer(8);
        let fullView29: Int16Array = new Int16Array(buf29);
        fullView29.$_set(2, 66);
        let offsetView29: Int16Array = new Int16Array(buf29, 4, 2);
        expect(offsetView29.$_get(0)).assertEqual(66);

        let buf33: ArrayBuffer = new ArrayBuffer(4);
        let writer33: Int16Array = new Int16Array(buf33);
        let reader33: Int16Array = new Int16Array(buf33);
        writer33.$_set(0, 123);
        expect(reader33.$_get(0)).assertEqual(123);
      }

      // --- [2] Verify $_get on partially overlapping views reads the shared slot written by either view, last write winning ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let lower: Int16Array = new Int16Array(buf, 0, 4);
        let upper: Int16Array = new Int16Array(buf, 2, 3);
        lower.$_set(2, 111);
        expect(upper.$_get(1)).assertEqual(111);
        upper.$_set(1, 222);
        expect(lower.$_get(2)).assertEqual(222);
        upper.$_set(0, 999);
        expect(lower.$_get(1)).assertEqual(999);
      }

      // --- [3] Verify $_get on new view over existing array buffer shared data ---
      {
        let arr1: Int16Array = new Int16Array([10, 20, 30, 40]);
        let buf: ArrayBuffer = arr1.buffer;
        let arr2: Int16Array = new Int16Array(buf, 2, 2);
        expect(arr2.$_get(0)).assertEqual(20);
        expect(arr2.$_get(1)).assertEqual(30);
      }

      // --- [4] Verify $_get on two views of a shared buffer reads each view's own local indices ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let view1: Int16Array = new Int16Array(buf, 0, 2);
        let view2: Int16Array = new Int16Array(buf, 4, 2);
        view1.$_set(0, 11);
        view1.$_set(1, 22);
        view2.$_set(0, 33);
        view2.$_set(1, 44);
        expect(view1.$_get(0)).assertEqual(11);
        expect(view1.$_get(1)).assertEqual(22);
        expect(view2.$_get(0)).assertEqual(33);
        expect(view2.$_get(1)).assertEqual(44);
      }

      // --- [5] Verify $_get on a non-zero-offset view reads the value written via that view ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf, 4, 1);
        arr.$_set(0, 77);
        expect(arr.$_get(0)).assertEqual(77);

        let sibling: Int16Array = new Int16Array(buf, 4, 1);
        expect(sibling.$_get(0)).assertEqual(77);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_0300
     * @tc.name int16ArrayIndexGetPart02Test003
     * @tc.desc Merged batch (4 tests): boundary values and truncation: Math.max, Math.min, inline-min indices and Uint16-to-int16 reinterpretation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get accepts an index produced by Math.max of two integer candidates ---
      {
        let arr: Int16Array = Int16Array.of(4, 8, 12);
        let idx: int = Math.max(0, 1).toInt();
        expect(arr.$_get(idx)).assertEqual(8);
        expect(idx).assertEqual(1);
      }

      // --- [2] Verify $_get accepts an index clamped by Math.min against the last valid position ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9);
        let idx: int = Math.min(5, arr.length - 1).toInt();
        expect(arr.$_get(idx)).assertEqual(9);
        expect(idx).assertEqual(arr.length - 1);
      }

      // --- [3] Verify $_get accepts an index built by a helper-free inline min of two candidates ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
        let x: int = 5;
        let y: int = 3;
        let idx: int = x < y ? x : y;
        expect(idx).assertEqual(3);
        expect(arr.$_get(idx)).assertEqual(8);
      }

      // --- [4] Verify from(Uint16Array) reinterprets unsigned 32768 and 65535 as signed int16 -32768 and -1 while 100 stays positive ---
      {
        let u: Uint16Array = Uint16Array.of(32768, 65535, 100);
        let arr: Int16Array = Int16Array.from(u);

        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(-1);
        expect(arr.$_get(2)).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_0400
     * @tc.name int16ArrayIndexGetPart02Test004
     * @tc.desc Merged batch (4 tests): construction sources: Set and mapfn indices, Map.values and Map.keys elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get reads the elements at index 0 and 2 on an array built by from(Set) ---
      {
        let s: Set<int> = new Set<int>();
        s.add(5);
        s.add(10);
        s.add(15);
        let arr: Int16Array = Int16Array.from(s);
        expect(arr.$_get(0)).assertEqual(5);
        expect(arr.$_get(2)).assertEqual(15);
      }

      // --- [2] Verify $_get reads the mapped elements at index 1 and 3 on an array built by from(Array, mapfn) ---
      {
        let src: int[] = [1, 2, 3, 4];
        let arr: Int16Array = Int16Array.from(src, (v: int, _k: double): double => v * 3);
        expect(arr.$_get(1)).assertEqual(6);
        expect(arr.$_get(3)).assertEqual(12);
      }

      // --- [3] Verify $_get reads element 1 on an array built by from(Map.values()) ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 5);
        m.set('b', 15);
        let arr: Int16Array = Int16Array.from(m.values());
        expect(arr.$_get(1)).assertEqual(15);
      }

      // --- [4] Verify $_get reads element 0 on an array built by from(Map.keys()) ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(3, 'x');
        m.set(7, 'y');
        let arr: Int16Array = Int16Array.from(m.keys());
        expect(arr.$_get(0)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_0500
     * @tc.name int16ArrayIndexGetPart02Test005
     * @tc.desc Merged batch (5 tests): index argument forms: values() counter, indexOf after includes, lastIndexOf, switch dispatch and Map guard.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get reads the element selected by a values() iterator counter ---
      {
        let arr: Int16Array = Int16Array.of(9, 8, 7, 6);
        let count: int = 0;
        for (const v of arr.values()) {
          count = count + 1;
        }
        expect(arr.$_get(count - 1)).assertEqual(6);
      }

      // --- [2] Verify $_get with the position from indexOf reads the searched value after an includes check ---
      {
        let arr: Int16Array = Int16Array.of(3, 9, 27);
        let present: boolean = arr.includes(9);
        let pos: int = arr.indexOf(9);
        let got: number = arr.$_get(pos);
        expect(present).assertTrue();
        expect(got).assertEqual(9);
      }

      // --- [3] Verify $_get with the position from lastIndexOf reads the matched element ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 1, 2);
        let pos: int = arr.lastIndexOf(2);
        expect(arr.$_get(pos)).assertEqual(2);
      }

      // --- [4] Verify $_get reads the element selected by a switch dispatch on the index ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33);
        let idx: int = 2;
        let label: string = '';
        switch (idx) {
          case 0:
            label = 'front';
            break;
          case 1:
            label = 'middle';
            break;
          default:
            label = 'back';
            break;
        }
        let v: number = arr.$_get(idx);
        expect(label).assertEqual('back');
        expect(v).assertEqual(33);
      }

      // --- [5] Verify $_get accepts an index taken from a Map lookup with an undefined guard ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('idx', 2);
        let arr: Int16Array = Int16Array.of(4, 8, 12);
        let raw: number | undefined = m.get('idx');
        let idx: int = raw !== undefined ? raw.toInt() : 0;
        expect(idx).assertEqual(2);
        expect(arr.$_get(idx)).assertEqual(12);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_0600
     * @tc.name int16ArrayIndexGetPart02Test006
     * @tc.desc Merged batch (5 tests): index argument forms: sibling length, Math.floor, arithmetic chain, Math.ceil and half byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get with an index taken from a sibling Int16Array length reads the element at that index ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let sibling: Int16Array = Int16Array.of(0, 0, 0);
        let idx: int = sibling.length;
        expect(arr.$_get(idx)).assertEqual(40);
        expect(idx).assertEqual(3);
      }

      // --- [2] Verify $_get with an index derived from Math.floor reads the element at that index ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7, 8);
        let idx: int = Math.floor(2.5).toInt();
        expect(Math.floor(2.5).toInt()).assertEqual(2);
        expect(arr.$_get(idx)).assertEqual(7);
      }

      // --- [3] Verify $_get with an index from an int arithmetic chain a*2-b reads the element at that index ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
        let a: int = 2;
        let b: int = 1;
        let idx: int = a * 2 - b;
        expect(a * 2 - b).assertEqual(3);
        expect(arr.$_get(idx)).assertEqual(4);
      }

      // --- [4] Verify $_get accepts an index produced by Math.ceil on a fractional double ---
      {
        let arr: Int16Array = Int16Array.of(7, 14, 21);
        let x: double = 0.2;
        let idx: int = Math.ceil(x).toInt();
        let win: Int16Array = arr.subarray(idx);
        expect(win.$_get(0)).assertEqual(14);
      }

      // --- [5] Verify $_get accepts an index of half the byteLength minus one ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        let idx: int = (arr.byteLength / 2 - 1).toInt();
        expect((arr.byteLength / 2 - 1).toInt()).assertEqual(2);
        expect(arr.$_get(idx)).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_0700
     * @tc.name int16ArrayIndexGetPart02Test007
     * @tc.desc Merged batch (5 tests): index argument forms: right shift plus one, boolean selection, remainder, Math.abs and running counter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get accepts an index derived from half the length via a right shift plus one ---
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15, 20, 25);
        let idx: int = (arr.length >> 1) + 1;
        expect((arr.length >> 1) + 1).assertEqual(3);
        expect(arr.$_get(idx)).assertEqual(20);
      }

      // --- [2] Verify $_get accepts an index chosen by a boolean flag selecting between two literals ---
      {
        let arr: Int16Array = Int16Array.of(7, 8, 9);
        let useLast: boolean = true;
        let idx: int = useLast ? 2 : 0;
        let win: Int16Array = arr.subarray(idx);
        expect(win.$_get(0)).assertEqual(9);
      }

      // --- [3] Verify $_get accepts an index that is the remainder of an integer division by two ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33);
        let n: int = 7;
        let idx: int = n % 2;
        expect(n % 2).assertEqual(1);
        expect(arr.$_get(idx)).assertEqual(22);
      }

      // --- [4] Verify $_get accepts an index produced by Math.abs of a negative difference ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        let a: int = 2;
        let b: int = 4;
        let idx: int = Math.abs(a - b);
        let win: Int16Array = arr.subarray(idx);
        expect(win.$_get(0)).assertEqual(6);
      }

      // --- [5] Verify $_get accepts an index taken from a sibling array length used as a running counter ---
      {
        let arr: Int16Array = Int16Array.of(12, 24, 36);
        let counter: int = 0;
        let step: Int16Array = Int16Array.of(0, 0);
        for (let i: int = 0; i < step.length; i++) {
          counter = counter + 1;
        }
        expect(arr.$_get(counter)).assertEqual(36);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_0800
     * @tc.name int16ArrayIndexGetPart02Test008
     * @tc.desc Merged batch (4 tests): algorithmic scans and aggregations: adjacent-order check, prefix sum, multi-array aggregates and index-weighted sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get comparisons across adjacent indexes confirm ascending order ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let asc: boolean = true;
        for (let i: int = 1; i < arr.length; i++) {
          if (arr.$_get(i) < arr.$_get(i - 1)) {
            asc = false;
          }
        }
        expect(asc).assertTrue();
      }

      // --- [2] Verify $_get accumulates a running prefix sum ending at the full total ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let running: number = 0;
        let last: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          running = running + arr.$_get(i);
          last = running;
        }
        let want: int = 10;
        expect(last).assertEqual(want);
      }

      // --- [3] Verify $_get aggregation over one index scan of two arrays yields the element sum 24, product 504, dot product 169, signed difference sum 3 and absolute-gap sum 9 ---
      {
        let s: Set<int> = new Set<int>();
        s.add(9);
        s.add(8);
        s.add(7);
        let a: Int16Array = Int16Array.from(s);
        let b: Int16Array = Int16Array.of(10, 2, 9);
        let sum: number = 0;
        let product: number = 1;
        let dot: number = 0;
        let diff: number = 0;
        let gaps: number = 0;
        for (let i: int = 0; i < a.length; i++) {
          let left: number = a.$_get(i);
          let right: number = b.$_get(i);
          sum = sum + left;
          product = product * left;
          dot = dot + left * right;
          diff = diff + (left - right);
          gaps = gaps + Math.abs(left - right);
        }
        expect(sum).assertEqual(24);
        expect(product).assertEqual(504);
        expect(dot).assertEqual(169);
        expect(diff).assertEqual(3);
        expect(gaps).assertEqual(9);
      }

      // --- [4] Verify $_get computes an index-weighted sum of the elements in a scan ---
      {
        let arr: Int16Array = Int16Array.of(2, 3, 4);
        let total: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          total = total + i * (arr.$_get(i));
        }
        let want: int = 11;
        expect(total).assertEqual(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_0900
     * @tc.name int16ArrayIndexGetPart02Test009
     * @tc.desc Merged batch (5 tests): direct index reads: fill/reverse/copyWithin writes, arithmetic reads, last key, entries and findLast.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get reads value written by fill, reverse and copyWithin ---
      {
        let filled: Int16Array = new Int16Array([0, 0, 0]);
        filled.fill(42);
        expect(filled.$_get(0 as int)).assertEqual(42);

        let fillMin: Int16Array = new Int16Array([0, 0]);
        fillMin.fill(-32768);
        expect(fillMin.$_get(0 as int)).assertEqual(-32768);

        let rev: Int16Array = new Int16Array([1, 2, 3]);
        rev.reverse();
        expect(rev.$_get(0 as int)).assertEqual(3);
        expect(rev.$_get(2 as int)).assertEqual(1);

        let cp: Int16Array = new Int16Array([1, 2, 3, 4]);
        cp.copyWithin(0, 2);
        expect(cp.$_get(0 as int)).assertEqual(3);
        expect(cp.$_get(1 as int)).assertEqual(4);
      }

      // --- [2] Verify $_get results participate in arithmetic combining reads at index 0 and 1 ---
      {
        let arr: Int16Array = Int16Array.of(3, 4, 5);
        expect(arr.$_get(0) * 2 + arr.$_get(1)).assertEqual(10);
      }

      // --- [3] Verify $_get at the last key of the keys() iterator reads the last element ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33);
        let lastKey: int = 0;
        for (const k of arr.keys()) {
          lastKey = k;
        }
        expect(arr.$_get(lastKey)).assertEqual(33);
      }

      // --- [4] Verify $_get(key) equals the entry value for every entry of the entries() iterator ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        let ok: boolean = true;
        for (const entry of arr.entries()) {
          if (arr.$_get(entry[0]) !== entry[1]) {
            ok = false;
          }
        }
        expect(ok).assertTrue();
      }

      // --- [5] Verify $_get(findLastIndex) equals the findLast match value ---
      {
        let arr: Int16Array = Int16Array.of(5, 12, 5, 12);
        let idx: int = arr.findLastIndex((x: number): boolean => x === 12);
        expect(arr.$_get(idx)).assertEqual(arr.findLast((x: number): boolean => x === 12) as number);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_1000
     * @tc.name int16ArrayIndexGetPart02Test010
     * @tc.desc Merged batch (5 tests): direct index reads: some() negative detection, reduce sum, entries-key reproduction, parsed index and variable/expression indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify some() predicate reading $_get(index) detects the sole negative element ---
      {
        let arr: Int16Array = Int16Array.of(4, 8, -2);
        let found: boolean = arr.some((element: number, index: int): boolean => {
          return (arr.$_get(index) as number) < 0;
        });
        expect(found).assertTrue();
      }

      // --- [2] Verify a reduce over the values equals the sum of $_get reads ---
      {
        let arr: Int16Array = Int16Array.of(9, 3, 5);
        let total: number = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
        let g0: number = arr.$_get(0);
        let g1: number = arr.$_get(1);
        let g2: number = arr.$_get(2);
        expect(g0 + g1 + g2).assertEqual(total);
      }

      // --- [3] Verify $_get at each entries() key reproduces the entries() value sequence ---
      {
        let arr: Int16Array = Int16Array.of(2, 5, 8);
        let collected: number[] = [];
        for (const entry of arr.entries()) {
          let v: number = arr.$_get(entry[0]);
          collected.push(v);
        }
        let want: number[] = [2, 5, 8];
        expect(collected).assertDeepEquals(want);
      }

      // --- [4] Verify $_get reads at a parsed index and at an index two positions before it ---
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15, 20);
        let idx: int = Number.parseInt('2', 10).toInt();
        let got: number = arr.$_get(idx);
        let head: number = arr.$_get(idx - 2);
        expect(got).assertEqual(15);
        expect(head).assertEqual(5);
      }

      // --- [5] Verify $_get with int variable and arithmetic expression indices returns expected elements ---
      {
        let arr: Int16Array = new Int16Array([42, 99, 7]);
        let idx: int = 0;
        expect(arr.$_get(idx)).assertEqual(42);

        let arr2: Int16Array = new Int16Array([10, 20, 30]);
        idx = 1;
        expect(arr2.$_get(idx)).assertEqual(20);

        let arr3: Int16Array = new Int16Array([100, 200, 300]);
        idx = 0;
        let r3a: number | undefined = arr3.$_get(idx);
        idx = 2;
        let r3b: number | undefined = arr3.$_get(idx);
        expect(r3a).assertEqual(100);
        expect(r3b).assertEqual(300);

        let arr4: Int16Array = new Int16Array([5, 10, 15, 20]);
        idx = arr4.length - 1;
        expect(arr4.$_get(idx)).assertEqual(20);

        let arr5: Int16Array = new Int16Array([42, 99]);
        expect(arr5.$_get((0 + 0) as int)).assertEqual(42);

        let arr6: Int16Array = new Int16Array([10, 20, 30]);
        expect(arr6.$_get((1 + 1) as int)).assertEqual(30);

        let arr7: Int16Array = new Int16Array([3, 6, 9, 12]);
        expect(arr7.$_get(arr7.length - 1)).assertEqual(12);

        let arr8: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        expect(arr8.$_get((2 * 2) as int)).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_1100
     * @tc.name int16ArrayIndexGetPart02Test011
     * @tc.desc Merged batch (3 tests): out-of-range RangeError: filter-result bound, view-local bound despite backing data, and the int32 minimum index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get at an out-of-range index on a filter() result throws RangeError ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let filtered: Int16Array = arr.filter((v: number, _i: int, _a: Int16Array): boolean => v > 2);
        try {
          let oob: number | undefined = filtered.$_get(2);
          expect(oob).assertUndefined();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      // --- [2] Verify $_get index bounds are view-local: an index past an offset view's length throws RangeError even though the backing buffer holds more data ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let view: Int16Array = new Int16Array(buf, 2, 2);
        expect(view.$_get(1)).assertEqual(0);
        try {
          let oob: number = view.$_get(2);
          expect(oob).assertUndefined();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      // --- [3] Verify $_get at the int32-minimum index throws RangeError, complementing the positive int32-maximum out-of-range probe ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        try {
          let oob: number = arr.$_get(-2147483648);
          expect(oob).assertUndefined();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_1200
     * @tc.name int16ArrayIndexGetPart02Test012
     * @tc.desc Merged batch (5 tests): boundary values and truncation: constructor forms, $_set round-trip, boundary reads, hexadecimal literals and hexadecimal fill.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get returns stored element across constructor forms, indices and boundary values ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
        let cases: int[][] = [[0, 10], [1, 20], [2, 30], [3, 40], [4, 50]];
        for (let i: int = 0; i < cases.length; i++) {
          expect(arr.$_get(cases[i][0])).assertEqual(cases[i][1]);
        }
        let minMax: Int16Array = new Int16Array([-32768, 32767, 42]);
        let bounds: int[][] = [[0, -32768], [1, 32767], [2, 42]];
        for (let i: int = 0; i < bounds.length; i++) {
          expect(minMax.$_get(bounds[i][0])).assertEqual(bounds[i][1]);
        }
        let ofArr: Int16Array = Int16Array.of(42);
        expect(ofArr.$_get(0 as int)).assertEqual(42);

        let fromArr: Int16Array = Int16Array.from([99]);
        expect(fromArr.$_get(0 as int)).assertEqual(99);

        let buf: ArrayBuffer = new ArrayBuffer(2);
        let bufView: Int16Array = new Int16Array(buf);
        expect(bufView.$_get(0 as int)).assertEqual(0);
      }

      // --- [2] Verify $_get returns written value after $_set at various indices and boundary values ---
      {
        let arr: Int16Array = new Int16Array([0, 0, 0]);
        let cases: int[][] = [[0, 42], [0, -32768], [0, 32767], [0, -1], [2, 99]];
        for (let i: int = 0; i < cases.length; i++) {
          arr.$_set(cases[i][0] as int, cases[i][1]);
          expect(arr.$_get(cases[i][0] as int)).assertEqual(cases[i][1]);
        }
      }

      // --- [3] Verify $_get reads back the int16 boundary values at index 0 and 1 after $_set on a length-constructed array ---
      {
        let arr: Int16Array = new Int16Array(2);
        arr.$_set(0, 32767);
        arr.$_set(1, -32768);
        expect(arr.$_get(0)).assertEqual(32767);
        expect(arr.$_get(1)).assertEqual(-32768);
      }

      // --- [4] Verify $_get reads hexadecimal literals 0x7FFF as 32767 and 0x8000 as the wrapped -32768 ---
      {
        let sources: int[][] = [[0x7FFF, 0, 0x0100], [0x8000, 1, 3]];
        let expected: int[] = [32767, -32768];
        for (let i: int = 0; i < sources.length; i++) {
          let arr: Int16Array = Int16Array.from(sources[i]);
          expect(arr.$_get(0)).assertEqual(expected[i]);
        }
      }

      // --- [5] Verify $_get reads the boundary value after fill with hexadecimal 0x7FFF ---
      {
        let arr: Int16Array = new Int16Array(3);
        arr.fill(0x7FFF);
        expect(arr.$_get(1)).assertEqual(32767);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_1300
     * @tc.name int16ArrayIndexGetPart02Test013
     * @tc.desc Merged batch (4 tests): post-mutation reads: $_set/set fill, copy isolation, negative-target copyWithin and toReversed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get reads back index 0 and 2 after length-constructed arrays are filled by $_set or set(Int16Array) ---
      {
        let values: number[][] = [[100, 200, 300], [4, 5, 6]];
        let useSet: boolean[] = [true, false];
        for (let c: int = 0; c < values.length; c++) {
          let arr: Int16Array = new Int16Array(3);
          if (useSet[c]) {
            for (let i: int = 0; i < 3; i++) {
              arr.$_set(i, values[c][i]);
            }
          } else {
            arr.set(Int16Array.from(values[c]));
          }
          expect(arr.$_get(0)).assertEqual(values[c][0]);
          expect(arr.$_get(2)).assertEqual(values[c][2]);
        }
      }

      // --- [2] Verify $_get on a copy-constructed from(another) array sees a $_set write leaving the source intact ---
      {
        let base: Int16Array = Int16Array.of(5, 10, 15);
        let arr: Int16Array = new Int16Array(Int16Array.from(base));
        arr.$_set(0, 99);
        expect(arr.$_get(0)).assertEqual(99);
        expect(base.$_get(0)).assertEqual(5);
      }

      // --- [3] Verify $_get reads the copied window after a negative-target copyWithin() ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
        arr.copyWithin(-2, 0);
        expect(arr.$_get(2)).assertEqual(1);
        expect(arr.$_get(3)).assertEqual(2);
      }

      // --- [4] Verify $_get reads the elements at index 0 and 2 on the toReversed() copy ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let rev: Int16Array = arr.toReversed();
        expect(rev.$_get(0)).assertEqual(3);
        expect(rev.$_get(2)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_1400
     * @tc.name int16ArrayIndexGetPart02Test014
     * @tc.desc Merged batch (4 tests): construction sources: copied Int16Array, typeof across forms, mapfn index consumption and copy-construction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get reads all three elements of an array built by from(another Int16Array) ---
      {
        let base: Int16Array = Int16Array.of(4, 8, 12);
        let arr: Int16Array = Int16Array.from(base);
        let g0: number = arr.$_get(0);
        let g1: number = arr.$_get(1);
        let g2: number = arr.$_get(2);
        expect(g0).assertEqual(4);
        expect(g1).assertEqual(8);
        expect(g2).assertEqual(12);
      }

      // --- [2] Verify typeof $_get result is number across constructor forms and multiple indices ---
      {
        let arr1: Int16Array = new Int16Array([42]);
        expect(typeof arr1.$_get(0)).assertEqual('number');

        let arr2: Int16Array = Int16Array.of(5, 15, 25);
        expect(typeof arr2.$_get(1)).assertEqual('number');

        let arr3: Int16Array = new Int16Array([10, 20, 30]);
        expect(typeof arr3.$_get(0)).assertEqual('number');
        expect(typeof arr3.$_get(1)).assertEqual('number');
        expect(typeof arr3.$_get(2)).assertEqual('number');
      }

      // --- [3] Verify $_get reads from(Array, mapfn) values whose mapfn consumes the element index (100, 302) ---
      {
        let src: int[] = [1, 2, 3];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v * 100 + k);
        expect(arr.$_get(0)).assertEqual(100);
        expect(arr.$_get(2)).assertEqual(302);
      }

      // --- [4] Verify $_get reads the elements at index 0 and 2 on a copy-constructed array ---
      {
        let base: Int16Array = Int16Array.of(11, 22, 33);
        let arr: Int16Array = new Int16Array(base);
        expect(arr.$_get(0)).assertEqual(11);
        expect(arr.$_get(2)).assertEqual(33);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_1500
     * @tc.name int16ArrayIndexGetPart02Test015
     * @tc.desc Merged batch (5 tests): index argument forms: do-while, bitwise AND, right shift, parseFloat and Math.trunc.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get accepts an index advanced by a do-while counter ---
      {
        let arr: Int16Array = Int16Array.of(6, 7, 8);
        let idx: int = 0;
        let i: int = 0;
        do {
          idx = i;
          i = i + 1;
        } while (i < 2);
        expect(idx).assertEqual(1);
        expect(arr.$_get(idx)).assertEqual(7);
      }

      // --- [2] Verify $_get accepts an index masked by a bitwise AND expression ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let raw: int = 6;
        let idx: int = raw & 3;
        expect(raw & 3).assertEqual(2);
        expect(arr.$_get(idx)).assertEqual(30);
      }

      // --- [3] Verify $_get accepts an index produced by a right-shift halving expression ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33, 44);
        let n: int = 6;
        let idx: int = n >> 1;
        expect(n >> 1).assertEqual(3);
        expect(arr.$_get(idx)).assertEqual(44);
      }

      // --- [4] Verify $_get accepts an index converted from a fractional string via parseFloat ---
      {
        let arr: Int16Array = Int16Array.of(8, 16, 24);
        let idx: int = parseFloat('1.7').toInt();
        let one: Int16Array = arr.slice(idx, idx + 1);
        expect(one.$_get(0)).assertEqual(16);
      }

      // --- [5] Verify $_get accepts an index produced by Math.trunc on a double ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
        let x: double = 2.9;
        let idx: int = Math.trunc(x).toInt();
        expect(Math.trunc(x).toInt()).assertEqual(2);
        expect(arr.$_get(idx)).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_1600
     * @tc.name int16ArrayIndexGetPart02Test016
     * @tc.desc Merged batch (5 tests): index argument forms: XOR, zero-valued arithmetic, reduce, length AND and half length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get accepts an index produced by an exclusive-or of two integers ---
      {
        let arr: Int16Array = Int16Array.of(1, 3, 5, 7);
        let idx: int = 1 ^ 1;
        expect(idx).assertEqual(0);
        expect(arr.$_get(idx)).assertEqual(1);
      }

      // --- [2] Verify $_get accepts a computed arithmetic index expression that evaluates to index 0 ---
      {
        let arr: Int16Array = Int16Array.of(5, 15, 25);
        let k: int = 2;
        let idx: int = k - 2 * (k - 1);
        expect(idx).assertEqual(0);
        expect(arr.$_get(idx)).assertEqual(5);
      }

      // --- [3] Verify $_get accepts an index accumulated by a reduce over the value list ---
      {
        let arr: Int16Array = Int16Array.of(9, 9, 9);
        let src: int[] = [0, 1];
        let idx: int = src.reduce((acc: int, cur: int): int => acc + cur, 0);
        expect(idx).assertEqual(1);
        expect(arr.$_get(idx)).assertEqual(9);
      }

      // --- [4] Verify $_get accepts an index equal to the length bitwise AND one ---
      {
        let arr: Int16Array = Int16Array.of(6, 12, 18, 24);
        let idx: int = arr.length & 1;
        expect(arr.length & 1).assertEqual(0);
        expect(arr.$_get(idx)).assertEqual(6);
      }

      // --- [5] Verify $_get accepts an index of half the length produced by Math.trunc ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let idx: int = Math.trunc(arr.length / 2).toInt();
        expect(arr.$_get(idx)).assertEqual(3);
        expect(arr.$_get(idx - 1)).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_1700
     * @tc.name int16ArrayIndexGetPart02Test017
     * @tc.desc Merged batch (5 tests): algorithmic scans and aggregations: binary search, two-pointer sum, palindrome, last-exceeding index and second largest.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get finds an exact target by binary search halving the index range ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8, 10, 12);
        let target: number = 8;
        let lo: int = 0;
        let hi: int = arr.length - 1;
        let found: int = -1;
        while (lo <= hi) {
          let mid: int = (lo + hi) / 2;
          let v: number = arr.$_get(mid);
          if (v === target) {
            found = mid;
            break;
          } else if (v < target) {
            lo = mid + 1;
          } else {
            hi = mid - 1;
          }
        }
        let want: int = 3;
        expect(found).assertEqual(want);
      }

      // --- [2] Verify $_get two-pointer scan finds a pair of elements summing to a target ---
      {
        let arr: Int16Array = Int16Array.of(1, 3, 5, 7, 9);
        let target: number = 12;
        let lo: int = 0;
        let hi: int = arr.length - 1;
        let hit: boolean = false;
        while (lo < hi) {
          let s: number = arr.$_get(lo) + arr.$_get(hi);
          if (s === target) {
            hit = true;
            break;
          } else if (s < target) {
            lo = lo + 1;
          } else {
            hi = hi - 1;
          }
        }
        expect(hit).assertTrue();
      }

      // --- [3] Verify $_get two-pointer comparison confirms a symmetric array is a palindrome ---
      {
        let arr: Int16Array = Int16Array.of(5, 8, 8, 5);
        let lo: int = 0;
        let hi: int = arr.length - 1;
        let pal: boolean = true;
        while (lo < hi) {
          if (arr.$_get(lo) !== arr.$_get(hi)) {
            pal = false;
            break;
          }
          lo = lo + 1;
          hi = hi - 1;
        }
        expect(pal).assertTrue();
      }

      // --- [4] Verify $_get tracks the last index where the value exceeds its predecessor ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 1, 6, 5);
        let pos: int = 0;
        for (let i: int = 1; i < arr.length; i++) {
          if ((arr.$_get(i)) > (arr.$_get(i - 1))) {
            pos = i;
          }
        }
        expect(arr.$_get(pos)).assertEqual(6);
      }

      // --- [5] Verify $_get finds the second largest element in a single pass ---
      {
        let arr: Int16Array = Int16Array.of(7, 3, 9, 5);
        let best: number = arr.$_get(0);
        let second: number = arr.$_get(0);
        for (let i: int = 1; i < arr.length; i++) {
          let v: number = arr.$_get(i);
          if (v > best) {
            second = best;
            best = v;
          } else if (v > second) {
            second = v;
          }
        }
        let want: int = 7;
        expect(second).assertEqual(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_1800
     * @tc.name int16ArrayIndexGetPart02Test018
     * @tc.desc Merged batch (4 tests): algorithmic scans and aggregations: reverse traversal, alternating sum, index-pair products and threshold count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get walks the array in reverse using an index of length minus one minus i ---
      {
        let arr: Int16Array = Int16Array.of(7, 14, 21);
        let joined: string = '';
        for (let i: int = 0; i < arr.length; i++) {
          let idx: int = arr.length - 1 - i;
          joined = joined + (arr.$_get(idx) as number).toString();
        }
        expect(joined).assertEqual('21147');
      }

      // --- [2] Verify $_get computes an alternating add and subtract sum over the indexes ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let total: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          if (i % 2 === 0) {
            total = total + arr.$_get(i);
          } else {
            total = total - arr.$_get(i);
          }
        }
        let want: int = -20;
        expect(total).assertEqual(want);
      }

      // --- [3] Verify $_get nested index scans sum the products of every index pair ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let total: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          for (let j: int = i + 1; j < arr.length; j++) {
            total = total + arr.$_get(i) * arr.$_get(j);
          }
        }
        let want: int = 11;
        expect(total).assertEqual(want);
      }

      // --- [4] Verify $_get counts the elements above a threshold in a manual scan ---
      {
        let arr: Int16Array = Int16Array.of(2, 8, 5, 9, 1);
        let count: int = 0;
        for (let i: int = 0; i < arr.length; i++) {
          if (arr.$_get(i) > 5) {
            count = count + 1;
          }
        }
        let want: int = 2;
        expect(count).assertEqual(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_1900
     * @tc.name int16ArrayIndexGetPart02Test019
     * @tc.desc Merged batch (5 tests): direct index reads: Array.from length, reduceRight, toLocaleString, nested $_get and lower-bound halving.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get at Array.from length minus one reads the trailing element ---
      {
        let src: number[] = [100, 200, 300];
        let arr: Int16Array = Int16Array.from(Array.from(src));
        expect(arr.$_get(arr.length - 1)).assertEqual(300);
      }

      // --- [2] Verify $_get reads the first element after a reduceRight accumulation over the values ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9);
        let total: number = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
        let got: number = arr.$_get(0);
        expect(total).assertEqual(18);
        expect(got).assertEqual(3);
      }

      // --- [3] Verify $_get reads the first element unchanged after a toLocaleString query ---
      {
        let arr: Int16Array = Int16Array.of(12, 24);
        let text: string = arr.toLocaleString();
        let got: number = arr.$_get(0);
        expect(text).assertEqual('12,24');
        expect(got).assertEqual(12);
      }

      // --- [4] Verify nested $_get reads the element indexed by an earlier $_get value ---
      {
        let arr: Int16Array = Int16Array.of(1, 9, 0);
        let inner: int = (arr.$_get(2) as number).toInt();
        expect(arr.$_get(inner)).assertEqual(1);
      }

      // --- [5] Verify $_get locates the first element not below a target bound by halving the range ---
      {
        let arr: Int16Array = Int16Array.of(1, 3, 5, 7, 9);
        let target: number = 6;
        let lo: int = 0;
        let hi: int = arr.length;
        let bound: int = arr.length;
        while (lo < hi) {
          let mid: int = (lo + hi) / 2;
          let v: number = arr.$_get(mid);
          if (v >= target) {
            bound = mid;
            hi = mid;
          } else {
            lo = mid + 1;
          }
        }
        let want: int = 3;
        expect(bound).assertEqual(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEXGET_PART02_2000
     * @tc.name int16ArrayIndexGetPart02Test020
     * @tc.desc Merged batch (2 tests): direct index reads: while-loop length accumulation and a helper-returned index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayIndexGetPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a while loop driven by arr.length accumulates the final $_get value ---
      {
        let arr: Int16Array = Int16Array.of(9, 8, 7, 6, 5);
        let idx: int = 0;
        let last: number = 0;
        while (idx < arr.length) {
          last = arr.$_get(idx);
          idx = idx + 1;
        }
        let want: int = 5;
        expect(last).assertEqual(want);
      }

      // --- [2] Verify $_get with an index returned by a helper function reads the element at that index ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let idx: int = midIndex(arr);
        let win: Int16Array = arr.subarray(idx);
        expect(win.$_get(0)).assertEqual(30);
      }
    });

  });
}
