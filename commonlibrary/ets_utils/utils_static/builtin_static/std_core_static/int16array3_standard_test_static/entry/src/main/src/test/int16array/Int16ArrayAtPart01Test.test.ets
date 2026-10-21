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
} from '../../../../hypium/index';
import Utils from '../Util.test';

function lastIndex(arr: Int16Array): int {
  return arr.length - 1;
}

export default function int16ArrayAtPart01Test(): void {
  describe('Int16ArrayAtPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_0100
     * @tc.name int16ArrayAtPart01Test001
     * @tc.desc Merged batch (5 tests): algorithmic scans and aggregations: binary search, lower-bound halving, two-pointer pair sum, palindrome check and mirror-pair sums via at().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() finds an exact target by binary search halving the index range ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8, 10, 12);
        let target: number = 8;
        let lo: int = 0;
        let hi: int = arr.length - 1;
        let found: int = -1;
        while (lo <= hi) {
          let mid: int = (lo + hi) / 2;
          let v: number = arr.at(mid) as number;
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

      // --- [2] Verify at() locates the first element not below a target bound by halving the range ---
      {
        let arr: Int16Array = Int16Array.of(1, 3, 5, 7, 9);
        let target: number = 6;
        let lo: int = 0;
        let hi: int = arr.length;
        let bound: int = arr.length;
        while (lo < hi) {
          let mid: int = (lo + hi) / 2;
          let v: number = arr.at(mid) as number;
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

      // --- [3] Verify at() two-pointer scan finds a pair of elements summing to a target ---
      {
        let arr: Int16Array = Int16Array.of(1, 3, 5, 7, 9);
        let target: number = 12;
        let lo: int = 0;
        let hi: int = arr.length - 1;
        let hit: boolean = false;
        while (lo < hi) {
          let s: number = (arr.at(lo) as number) + (arr.at(hi) as number);
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

      // --- [4] Verify at() two-pointer comparison confirms a symmetric array is a palindrome ---
      {
        let arr: Int16Array = Int16Array.of(5, 8, 8, 5);
        let lo: int = 0;
        let hi: int = arr.length - 1;
        let pal: boolean = true;
        while (lo < hi) {
          if (arr.at(lo) !== arr.at(hi)) {
            pal = false;
            break;
          }
          lo = lo + 1;
          hi = hi - 1;
        }
        expect(pal).assertTrue();
      }

      // --- [5] Verify at() sums each element together with its mirror-position partner ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let total: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          total = total + (arr.at(i) as number) + (arr.at(arr.length - 1 - i) as number);
        }
        let want: int = 20;
        expect(total).assertEqual(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_0200
     * @tc.name int16ArrayAtPart01Test002
     * @tc.desc Merged batch (4 tests): algorithmic scans and aggregations: threshold counting, sum of squares, local-maxima count and maximum adjacent-pair sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() counts the elements above a threshold in a manual scan ---
      {
        let arr: Int16Array = Int16Array.of(2, 8, 5, 9, 1);
        let count: int = 0;
        for (let i: int = 0; i < arr.length; i++) {
          if ((arr.at(i) as number) > 5) {
            count = count + 1;
          }
        }
        let want: int = 2;
        expect(count).assertEqual(want);
      }

      // --- [2] Verify at() sums the squares of the elements in a manual scan ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let total: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          let v: number = arr.at(i) as number;
          total = total + v * v;
        }
        let want: int = 30;
        expect(total).assertEqual(want);
      }

      // --- [3] Verify at() counts the interior elements larger than both neighbours ---
      {
        let arr: Int16Array = Int16Array.of(1, 5, 2, 8, 3);
        let peaks: int = 0;
        for (let i: int = 1; i < arr.length - 1; i++) {
          if ((arr.at(i) as number) > (arr.at(i - 1) as number) && (arr.at(i) as number) > (arr.at(i + 1) as number)) {
            peaks = peaks + 1;
          }
        }
        let want: int = 2;
        expect(peaks).assertEqual(want);
      }

      // --- [4] Verify at() finds the largest adjacent-pair sum across the array ---
      {
        let arr: Int16Array = Int16Array.of(3, 7, 2, 9);
        let best: number = (arr.at(0) as number) + (arr.at(1) as number);
        for (let i: int = 1; i < arr.length - 1; i++) {
          let s: number = (arr.at(i) as number) + (arr.at(i + 1) as number);
          if (s > best) {
            best = s;
          }
        }
        let want: int = 11;
        expect(best).assertEqual(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_0300
     * @tc.name int16ArrayAtPart01Test003
     * @tc.desc Merged batch (5 tests): out-of-range and empty arrays: undefined beyond either end and at extreme negative indices, zero-length and short sources, and 100-element reads at the int16 bounds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() returns undefined for past-end, negative and int-extreme out-of-range indices ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        let idxs: int[] = [5, 2147483647, -6, -2147483648];
        for (let i: int = 0; i < idxs.length; i++) {
          expect(arr.at(idxs[i])).assertUndefined();
        }
      }

      // --- [2] Verify at() on empty Int16Array returns undefined for any index ---
      {
        let arr: Int16Array = new Int16Array();
        let idxs: int[] = [0, -1, 1, -2];
        for (let i: int = 0; i < idxs.length; i++) {
          expect(arr.at(idxs[i])).assertUndefined();
        }
      }

      // --- [3] Verify at() out-of-range index on single-element and two-element arrays returns undefined ---
      {
        let single: Int16Array = Int16Array.of(42);
        let singleOob: int[] = [1, -2];
        for (let i: int = 0; i < singleOob.length; i++) {
          let result: Number | undefined = single.at(singleOob[i]);
          expect(result).assertUndefined();
        }
        let pair: Int16Array = Int16Array.of(100, 200);
        let pairOob: int[] = [2, -3];
        for (let j: int = 0; j < pairOob.length; j++) {
          let result: Number | undefined = pair.at(pairOob[j]);
          expect(result).assertUndefined();
        }
      }

      // --- [4] Verify at() reads int16-boundary elements and returns undefined for an out-of-range index ---
      {
        let arr: Int16Array = Int16Array.of(32767, -32768, 0, -1);
        let cases: int[][] = [[0, 32767], [1, -32768], [2, 0], [3, -1], [-1, -1], [-2, 0], [-3, -32768], [-4, 32767]];
        for (let i: int = 0; i < cases.length; i++) {
          expect(arr.at(cases[i][0])).assertEqual(cases[i][1]);
        }
        let oob: int[] = [4, -5];
        for (let j: int = 0; j < oob.length; j++) {
          expect(arr.at(oob[j])).assertUndefined();
        }
      }

      // --- [5] Verify at() element access on 100-element Int16Array for valid indices and out-of-range undefined ---
      {
        let values: int[] = [];
        for (let k: int = 0; k < 100; k++) { values.push(k); }
        let arr: Int16Array = Int16Array.from(values);
        let pos: int[] = [0, 1, 49, 50, 98, 99];
        for (let i: int = 0; i < pos.length; i++) {
          expect(arr.at(pos[i])).assertEqual(pos[i]);
        }
        let neg: int[] = [-1, -50, -99, -100];
        for (let j: int = 0; j < neg.length; j++) {
          expect(arr.at(neg[j])).assertEqual(100 + neg[j]);
        }
        let oob: int[] = [100, -101];
        for (let m: int = 0; m < oob.length; m++) {
          expect(arr.at(oob[m])).assertUndefined();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_0400
     * @tc.name int16ArrayAtPart01Test004
     * @tc.desc Merged batch (5 tests): out-of-range and empty arrays: undefined for sibling-length and negative-overflow indices, last-element and at(length) reads, Map-guarded index and truncation after set().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() using index equal to a sibling array length on a three-element array returns undefined ---
      {
        let other: Int16Array = Int16Array.of(1, 2, 3, 4);
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let idx: int = other.length;
        expect(arr.at(idx)).assertUndefined();
      }

      // --- [2] Verify at() with index -(length+1) on a three-element array returns undefined ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let idx: int = -(arr.length + 1);
        expect(arr.at(idx)).assertUndefined();
      }

      // --- [3] Verify at() reads the last element at index length-1 and returns undefined at index length ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        expect(arr.at(arr.length - 1)).assertEqual(50);
        expect(arr.at(arr.length)).assertUndefined();
      }

      // --- [4] Verify at() accepts an index taken from a Map lookup with an undefined guard ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('idx', 2);
        let arr: Int16Array = Int16Array.of(4, 8, 12);
        let raw: number | undefined = m.get('idx');
        let idx: int = raw !== undefined ? raw.toInt() : 0;
        expect(idx).assertEqual(2);
        expect(arr.at(idx)).assertEqual(12);
      }

      // --- [5] Verify at(0) after set() with an out-of-range value returns the truncated int16-boundary value ---
      {
        let arr: Int16Array = new Int16Array([0, 0]);
        let src: Int16Array = new Int16Array([32768]);
        arr.set(src, 0);
        expect(arr.at(0)!).assertEqual(-32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_0500
     * @tc.name int16ArrayAtPart01Test005
     * @tc.desc Merged batch (5 tests): boundary values and truncation: fill and $_set at both int16 bounds, consecutive boundary reads, overflow and fractional truncation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at(0) after fill with 32767 and with 0x8000 reads 32767 and the wrapped -32768 ---
      {
        let fills: int[] = [32767, 0x8000];
        let expected: int[] = [32767, -32768];
        for (let i: int = 0; i < fills.length; i++) {
          let arr: Int16Array = new Int16Array(2);
          arr.fill(fills[i]);
          expect(arr.at(0)).assertEqual(expected[i]);
        }
      }

      // --- [2] Verify at(-1) after $_set with hexadecimal 0x7FFF reads the positive int16 bound ---
      {
        let arr: Int16Array = new Int16Array(2);
        arr.$_set(0, 1);
        arr.$_set(1, 0x7FFF);
        expect(arr.at(-1)).assertEqual(32767);
      }

      // --- [3] Verify consecutive at() reads at 0, 1 and -1 on from(Map.values()) return the stored boundary elements ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 0);
        m.set('b', 32767);
        m.set('c', -32768);
        let arr: Int16Array = Int16Array.from(m.values());
        expect(arr.at(0)).assertEqual(0);
        expect(arr.at(1)).assertEqual(32767);
        expect(arr.at(-1)).assertEqual(-32768);
      }

      // --- [4] Verify at(0) after $_set(0,v) truncates overflow and fractional values to int16 ---
      {
        let cases: int[][] = [[32768, -32768], [-32769, 32767], [65535, -1], [65536, 0], [0x7FFF, 32767], [65537, 1], [3, 3], [-3, -3]];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = new Int16Array([1, 2, 3]);
          arr.$_set(0, cases[i][0]);
          expect(arr.at(0)!).assertEqual(cases[i][1]);
        }
        let nanArr: Int16Array = new Int16Array([1, 2, 3]);
        nanArr.$_set(0, Number.NaN);
        expect(nanArr.at(0)!).assertEqual(0);

        let fracArr: Int16Array = new Int16Array([1, 2, 3]);
        fracArr.$_set(0, 3.7);
        expect(fracArr.at(0)!).assertEqual(3);
        fracArr.$_set(0, -3.7);
        expect(fracArr.at(0)!).assertEqual(-3);

        let fillArr: Int16Array = new Int16Array([1, 2, 3]);
        fillArr.fill(65535);
        expect(fillArr.at(0)!).assertEqual(-1);
      }

      // --- [5] Verify at(0) reads the first element after set() writes two int16-boundary values ---
      {
        let arr: Int16Array = new Int16Array([0, 0, 0]);
        arr.set(Int16Array.of(32767, -32768), 0);
        expect(arr.at(0)!).assertEqual(32767);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_0600
     * @tc.name int16ArrayAtPart01Test006
     * @tc.desc Merged batch (5 tests): post-mutation reads: kept or overwritten values after with(), slice(), filter(), map() and offset set().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() on arr.with(1,99) result reads substituted 99 at index 1 and keeps original 20 at index 1 ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let substituted: Int16Array = arr.with(1, 99);
        expect(substituted.at(1)).assertEqual(99);
        expect(arr.at(1)).assertEqual(20);
      }

      // --- [2] Verify at() reads the first and last elements of a slice() result by index 0 and -1 ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let sl: Int16Array = arr.slice(1, 3);
        expect(sl.at(0)).assertEqual(20);
        expect(sl.at(-1)).assertEqual(30);
      }

      // --- [3] Verify at() reads the kept first and last elements of a filter() result by index 0 and -1 ---
      {
        let arr: Int16Array = Int16Array.of(-3, 5, -7, 15);
        let kept: Int16Array = arr.filter((v: number, i: int, a: Int16Array): boolean => v > 0);
        expect(kept.at(0)).assertEqual(5);
        expect(kept.at(-1)).assertEqual(15);
      }

      // --- [4] Verify at() reads the mapped first and last elements of a map() result by index 0 and -1 ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let mapped: Int16Array = arr.map((v: number, i: int, a: Int16Array): double => v + 100);
        expect(mapped.at(0)).assertEqual(101);
        expect(mapped.at(-1)).assertEqual(103);
      }

      // --- [5] Verify at(0) remains unchanged after set with offset 1 ---
      {
        let arr: Int16Array = new Int16Array([5, 0, 0]);
        arr.set(Int16Array.of(99), 1);
        expect(arr.at(0)!).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_0700
     * @tc.name int16ArrayAtPart01Test007
     * @tc.desc Merged batch (5 tests): construction sources: reads across of(), from(), mapfn-derived, copy-constructed and direct-call arrays.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() reads the element at index 1 and the last element at index -1 on arrays built by of() and from() ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        expect(arr.at(1)).assertEqual(20);

        let arrFrom: Int16Array = Int16Array.from([10, 20, 30]);
        expect(arrFrom.at(1)).assertEqual(20);
        expect(arrFrom.at(-1)).assertEqual(30);
      }

      // --- [2] Verify at() element access across a run of positive and negative indices on an array built by of() ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        let cases: int[][] = [[0, 10], [1, 20], [2, 30], [3, 40], [4, 50], [-2, 40], [-3, 30], [-4, 20], [-5, 10]];
        for (let i: int = 0; i < cases.length; i++) {
          expect(arr.at(cases[i][0])).assertEqual(cases[i][1]);
        }
      }

      // --- [3] Verify at() reads mapped elements by index on an array built by from(Array, mapfn) ---
      {
        let src: int[] = [1, 2, 3];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v * 2);
        expect(arr.at(0)).assertEqual(2);
        expect(arr.at(2)).assertEqual(6);
        expect(arr.at(-1)).assertEqual(6);
        expect(arr.at(3)).assertUndefined();
      }

      // --- [4] Verify at() reads the first and last elements of a copy-constructed array ---
      {
        let base: Int16Array = Int16Array.of(7, 8, 9);
        let arr: Int16Array = Int16Array.from(base);
        expect(arr.at(0)).assertEqual(7);
        expect(arr.at(-1)).assertEqual(9);
        expect(arr.at(3)).assertUndefined();
      }

      // --- [5] Verify at() invoked directly on of() and from(Array) results reads an interior and the last element ---
      {
        expect(Int16Array.of(9, 8, 7).at(1)).assertEqual(8);
        expect(Int16Array.from([4, 5, 6]).at(-1)).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_0800
     * @tc.name int16ArrayAtPart01Test008
     * @tc.desc Merged batch (5 tests): construction sources: reads on Map, Set, Int16Array and ArrayBuffer sources, agreement with $_get, and shifted indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at(-length) equals at(0) on an array built by from(Map.values()) ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('k', 25);
        m.set('j', 35);
        let arr: Int16Array = Int16Array.from(m.values());
        expect(arr.at(-arr.length)).assertEqual(arr.$_get(0));
      }

      // --- [2] Verify at() equals $_get() at every index on from(Set<int>) and from(another Int16Array) arrays ---
      {
        let s: Set<int> = new Set<int>();
        s.add(30);
        s.add(20);
        s.add(10);
        let base: Int16Array = Int16Array.of(7, 14, 21, 28);
        let arrays: Int16Array[] = [Int16Array.from(s), Int16Array.from(base)];
        for (let a: int = 0; a < arrays.length; a++) {
          let arr: Int16Array = arrays[a];
          let ok: boolean = true;
          for (let i: int = 0; i < arr.length; i++) {
            if (arr.at(i) !== arr.$_get(i)) {
              ok = false;
            }
          }
          expect(ok).assertTrue();
        }
      }

      // --- [3] Verify at(0) on an ArrayBuffer-backed Int16Array reads the default zero element ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf);
        expect(arr.at(0)).assertEqual(0);
        expect(arr.at(-1)).assertEqual(0);
      }

      // --- [4] Verify at(-1) reads the unchanged last element after a lastIndexOf() query ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        expect(arr.lastIndexOf(30)).assertEqual(2);
        expect(arr.at(-1)).assertEqual(30);
      }

      // --- [5] Verify at() accepts an index of half the length via a right shift on from(Map.values()) ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 10);
        m.set('b', 20);
        m.set('c', 30);
        m.set('d', 40);
        let arr: Int16Array = Int16Array.from(m.values());
        let mid: int = arr.length >> 1;
        let lo: number | undefined = arr.at(mid - 1);
        let hi: number | undefined = arr.at(mid);
        expect(lo).assertEqual(20);
        expect(hi).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_0900
     * @tc.name int16ArrayAtPart01Test009
     * @tc.desc Merged batch (5 tests): index argument forms: floor, while-loop, helper, ternary and sibling-$_get derived indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() with an index produced by Math.floor on a double reads an element ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let x: double = 1.9;
        let idx: int = Math.floor(x).toInt();
        expect(arr.at(idx)).assertEqual(20);
      }

      // --- [2] Verify at() with an index advanced by a while loop reads an element ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let i: int = 0;
        while (i < 2) {
          i = i + 1;
        }
        expect(arr.at(i)).assertEqual(30);
        expect(i).assertEqual(2);
      }

      // --- [3] Verify at() reads elements at indices length-1 and length-2 produced by a helper ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        expect(arr.at(lastIndex(arr))).assertEqual(30);
        expect(arr.at(arr.length - 2)).assertEqual(20);
      }

      // --- [4] Verify at() with an index chosen by a ternary expression reads the selected element ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let flag: boolean = false;
        let idx: int = flag ? 0 : 1;
        expect(idx).assertEqual(1);
        expect(arr.at(idx)).assertEqual(20);
      }

      // --- [5] Verify at() with index equal to another array $_get(0) value reads element at that position ---
      {
        let idxSrc: Int16Array = Int16Array.of(2, 0, 0);
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let idx: int = idxSrc.$_get(0).toInt();
        expect(arr.at(idx)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_1000
     * @tc.name int16ArrayAtPart01Test010
     * @tc.desc Merged batch (5 tests): index argument forms: reduce, byteLength-derived, parseFloat, do-while and XOR derived indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() accepts an index accumulated by a reduce over the value list ---
      {
        let arr: Int16Array = Int16Array.of(9, 9, 9);
        let src: int[] = [0, 1];
        let idx: int = src.reduce((acc: int, cur: int): int => acc + cur, 0);
        expect(arr.at(idx)).assertEqual(9);
        expect(arr.at(idx - arr.length)).assertEqual(9);
      }

      // --- [2] Verify at() accepts an index derived from half the byteLength minus one ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        let idx: int = (arr.byteLength / 2 - 1).toInt();
        expect(arr.at(idx)).assertEqual(6);
      }

      // --- [3] Verify at() accepts an index converted from a fractional string via parseFloat ---
      {
        let arr: Int16Array = Int16Array.of(8, 16, 24);
        let idx: int = parseFloat('1.7').toInt();
        expect(arr.at(idx)).assertEqual(16);
        expect(arr.length).assertEqual(idx + 2);
      }

      // --- [4] Verify at() accepts an index advanced by a do-while counter ---
      {
        let arr: Int16Array = Int16Array.of(6, 7, 8);
        let idx: int = 0;
        let i: int = 0;
        do {
          idx = i;
          i = i + 1;
        } while (i < 2);
        expect(idx).assertEqual(1);
        expect(arr.at(idx)).assertEqual(7);
      }

      // --- [5] Verify at() accepts a non-degenerate bitwise-XOR index selecting the last element ---
      {
        let arr: Int16Array = Int16Array.of(1, 3, 5, 7);
        let idx: int = 2 ^ 1;
        expect(arr.at(idx)).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_1100
     * @tc.name int16ArrayAtPart01Test011
     * @tc.desc Merged batch (5 tests): equivalence with $_get and read-only behavior: return-value reassignment, query coexistence, loop equivalence and repeated stable reads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify reassigning at() return value does not mutate array ---
      {
        let arr: Int16Array = Int16Array.of(50);
        let result: Number | undefined = arr.at(0);
        result = 999;
        expect(arr.$_get(0)).assertEqual(50);
      }

      // --- [2] Verify at(0) is unchanged after a reduce accumulation over the values ---
      {
        let arr: Int16Array = Int16Array.of(9, 3, 5);
        let total: number = arr.reduce((acc: number, cur: number): number => acc + cur, 0);
        let r_1: number | undefined = arr.at(0);
        expect(total).assertEqual(17);
        expect(r_1).assertEqual(9);
      }

      // --- [3] Verify at(0) is unchanged after a toLocaleString query ---
      {
        let arr: Int16Array = Int16Array.of(12, 24);
        let text: string = arr.toLocaleString();
        let r_1: number | undefined = arr.at(0);
        expect(text).assertEqual('12,24');
        expect(r_1).assertEqual(12);
      }

      // --- [4] Verify for-loop at(i) equals $_get(i) for all indices ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
        let consistent: boolean = true;
        for (let i: int = 0; i < arr.length; i++) {
          if (arr.at(i) !== arr.$_get(i)) {
            consistent = false;
          }
        }
        expect(consistent).assertTrue();
      }

      // --- [5] Verify repeated at() calls return stable value and leave length and values unchanged ---
      {
        let arr: Int16Array = new Int16Array([42, 1, 2]);
        let firstVal: Number | undefined = arr.at(0);
        let consistent: boolean = true;
        for (let i: int = 0; i < 10; i++) {
          if (arr.at(0) !== firstVal) {
            consistent = false;
          }
        }
        expect(consistent).assertTrue();

        let arr2: Int16Array = new Int16Array([1, 2, 99]);
        let firstNeg: Number | undefined = arr2.at(-1);
        let consistent2: boolean = true;
        for (let i: int = 0; i < 10; i++) {
          if (arr2.at(-1) !== firstNeg) {
            consistent2 = false;
          }
        }
        expect(consistent2).assertTrue();

        let arr3: Int16Array = new Int16Array([1, 2, 3]);
        let allUndefined: boolean = true;
        for (let i: int = 0; i < 10; i++) {
          if (arr3.at(arr3.length) !== undefined) {
            allUndefined = false;
          }
        }
        expect(allUndefined).assertTrue();

        let arr4: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let origLen: number = arr4.length;
        for (let i: int = 0; i < 100; i++) {
          arr4.at(i % 3);
        }
        expect(arr4.length).assertEqual(origLen);
        expect(arr4.at(0)!).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_1200
     * @tc.name int16ArrayAtPart01Test012
     * @tc.desc Merged batch (5 tests): direct index reads: negative indices, element-driven chaining, and use inside every() and some() predicates.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at(-1) on length-1 array returns the only element ---
      {
        let seed: int[] = [99];
        let arr: Int16Array = Int16Array.from(seed);
        let last: Number | undefined = arr.at(-1);
        let first: Number | undefined = arr.at(0);
        expect(last).assertEqual(first);
        expect(last).assertEqual(99);
      }

      // --- [2] Verify at(-length) equals at(0) on multi-element array ---
      {
        let arr: Int16Array = Int16Array.of(33, 66, 99);
        expect(arr.at(-3)).assertEqual(arr.at(0));
      }

      // --- [3] Verify every() predicate reading at(index) equals the element counts all matches on a short array ---
      {
        let arr: Int16Array = Int16Array.of(6, 6, 6);
        let hits: int = 0;
        let all: boolean = arr.every((element: number, index: int): boolean => {
          if (arr.at(index) === element) {
            hits = hits + 1;
          }
          return true;
        });
        expect(all).assertTrue();
        expect(hits).assertEqual(3);
      }

      // --- [4] Verify some() predicate reading at(index) detects the sole negative element ---
      {
        let arr: Int16Array = Int16Array.of(4, 8, -2);
        let found: boolean = arr.some((element: number, index: int): boolean => {
          return (arr.at(index) as number) < 0;
        });
        expect(found).assertTrue();
      }

      // --- [5] Verify at() follows each element as the next index until it reads past the end ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let idx: int = 0;
        let steps: int = 0;
        let limit: int = 10;
        let v: number | undefined = arr.at(idx);
        while (v !== undefined && steps < limit) {
          steps = steps + 1;
          idx = (v as number).toInt();
          v = arr.at(idx);
        }
        let want: int = 3;
        expect(steps).assertEqual(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_1300
     * @tc.name int16ArrayAtPart01Test013
     * @tc.desc Merged batch (4 tests): algorithmic scans and aggregations: do-while sum, running maximum, multi-array aggregates and reverse traversal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() accumulates the element sum in a do-while loop ---
      {
        let arr: Int16Array = Int16Array.of(4, 8, 12);
        let i: int = 0;
        let total: number = 0;
        do {
          total = total + (arr.at(i) as number);
          i = i + 1;
        } while (i < arr.length);
        let want: int = 24;
        expect(total).assertEqual(want);
      }

      // --- [2] Verify at() computes the running maximum across a manual index scan ---
      {
        let arr: Int16Array = Int16Array.of(3, 9, 2, 7);
        let best: number = arr.at(0) as number;
        for (let i: int = 1; i < arr.length; i++) {
          let v: number = arr.at(i) as number;
          if (v > best) {
            best = v;
          }
        }
        let want: int = 9;
        expect(best).assertEqual(want);
      }

      // --- [3] Verify at() aggregations over one index scan of two arrays yield the signed difference sum 31, dot product 600 and absolute-gap sum 41 ---
      {
        let a: Int16Array = Int16Array.of(10, 20, 30);
        let b: Int16Array = Int16Array.of(1, 25, 3);
        let diff: number = 0;
        let dot: number = 0;
        let gaps: number = 0;
        for (let i: int = 0; i < a.length; i++) {
          let left: number = a.at(i) as number;
          let right: number = b.at(i) as number;
          diff = diff + (left - right);
          dot = dot + left * right;
          gaps = gaps + Math.abs(left - right);
        }
        let wantDiff: int = 31;
        expect(diff).assertEqual(wantDiff);
        let wantDot: int = 600;
        expect(dot).assertEqual(wantDot);
        let wantGaps: int = 41;
        expect(gaps).assertEqual(wantGaps);
      }

      // --- [4] Verify at() walks the array in reverse using an index of length minus one minus i ---
      {
        let arr: Int16Array = Int16Array.of(7, 14, 21);
        let joined: string = '';
        for (let i: int = 0; i < arr.length; i++) {
          let idx: int = arr.length - 1 - i;
          joined = joined + (arr.at(idx) as number).toString();
        }
        expect(joined).assertEqual('21147');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_1400
     * @tc.name int16ArrayAtPart01Test014
     * @tc.desc Merged batch (5 tests): buffer sharing and views: offset views, aliased shared buffers, non-overlapping views and subarray slices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() on ArrayBuffer-backed Int16Array returns stored values for offset views ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 25);
        expect(arr.at(0)).assertEqual(25);

        let buf2: ArrayBuffer = new ArrayBuffer(10);
        let arr2: Int16Array = new Int16Array(buf2, 2, 2);
        arr2.$_set(0, 50);
        expect(arr2.at(0)).assertEqual(50);
        arr2.$_set(1, 75);
        expect(arr2.at(1)).assertEqual(75);
        expect(arr2.at(-1)).assertEqual(75);
      }

      // --- [2] Verify shared buffer views: write via v1 $_set then v2.at(0) sees value ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let v1: Int16Array = new Int16Array(buf);
        let v2: Int16Array = new Int16Array(buf);
        v1.$_set(0, 42);
        expect(v2.at(0)!).assertEqual(42);
      }

      // --- [3] Verify at() on an offset view reads the aliased slot and returns undefined past the view length ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let full: Int16Array = new Int16Array(buf);
        let half: Int16Array = new Int16Array(buf, 4);
        full.$_set(3, 66);
        expect(half.at(1)).assertEqual(66);
        expect(half.at(2)).assertUndefined();
      }

      // --- [4] Verify non-overlapping views: v2.at(0) unaffected by v1 write ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let v1: Int16Array = new Int16Array(buf, 0, 2);
        let v2: Int16Array = new Int16Array(buf, 4, 2);
        v1.$_set(0, 33);
        v2.$_set(0, 77);
        expect(v2.at(0)!).assertEqual(77);
      }

      // --- [5] Verify subarray shares buffer: a parent $_set is visible through a fresh slice of the subarray ---
      {
        let parent: Int16Array = new Int16Array([10, 20, 30, 40]);
        let sub: Int16Array = parent.subarray(1, 3);
        parent.$_set(1, 99);
        let front: Int16Array = sub.slice(0, 1);
        expect(front.at(0)).assertEqual(99);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_1500
     * @tc.name int16ArrayAtPart01Test015
     * @tc.desc Merged batch (5 tests): out-of-range and empty arrays: empty and zero-length sources, past-end reads, and typeof over constructor families.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at(0) on Int16Array.from empty returns undefined ---
      {
        let empty: int[] = [];
        let arr: Int16Array = Int16Array.from(empty);
        expect(arr.at(0)).assertUndefined();
      }

      // --- [2] Verify at() reads the first and last elements and returns undefined beyond the end on an array built by from(Set) ---
      {
        let s: Set<int> = new Set<int>();
        s.add(5);
        s.add(15);
        s.add(25);
        let arr: Int16Array = Int16Array.from(s);
        expect(arr.at(0)).assertEqual(5);
        expect(arr.at(-1)).assertEqual(25);
        expect(arr.at(3)).assertUndefined();
      }

      // --- [3] Verify at() on a no-argument of() empty array returns undefined for index 0 and -1 ---
      {
        let arr: Int16Array = Int16Array.of();
        expect(arr.at(0)).assertUndefined();
        expect(arr.at(-1)).assertUndefined();
        expect(arr.length).assertEqual(0);
      }

      // --- [4] Verify at(0) and at(-1) on a zero-length ArrayBuffer view return undefined ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(0);
        let arr: Int16Array = new Int16Array(buf);
        expect(arr.length).assertEqual(0);
        expect(arr.at(0)).assertUndefined();
        expect(arr.at(-1)).assertUndefined();
      }

      // --- [5] Verify typeof at() on valid index returns number across constructor families and not undefined ---
      {
        let arr1: Int16Array = new Int16Array([42]);
        expect(typeof arr1.at(0)).assertEqual('number');

        let arr2: Int16Array = new Int16Array([0]);
        expect(typeof arr2.at(0)).assertEqual('number');

        let arr3: Int16Array = new Int16Array([32767]);
        expect(typeof arr3.at(0)).assertEqual('number');

        let arr4: Int16Array = new Int16Array([-32768]);
        expect(typeof arr4.at(0)).assertEqual('number');

        let arr5: Int16Array = Int16Array.of(10, 20, 30);
        expect(typeof arr5.at(2)).assertEqual('number');

        let arr6: Int16Array = Int16Array.of(5, 15, 25);
        expect(typeof arr6.at(-1)).assertEqual('number');

        let arr7: Int16Array = Int16Array.of(100, 200);
        expect(typeof arr7.at(-2)).assertEqual('number');

        let arr8: Int16Array = Int16Array.of(-7, -7, -7);
        expect(typeof arr8.at(0)).assertEqual('number');

        let arr9: Int16Array = new Int16Array(3);
        arr9.fill(32767);
        expect(typeof arr9.at(0)).assertEqual('number');

        let arr10: Int16Array = new Int16Array(1);
        arr10.$_set(0, -32768);
        expect(typeof arr10.at(0)).assertEqual('number');

        let arr11: Int16Array = Int16Array.from([77]);
        expect(typeof arr11.at(0)).assertEqual('number');

        let arr12: Int16Array = Int16Array.of(123);
        let result12: Number | undefined = arr12.at(0);
        expect(typeof result12).assertEqual('number');

        let r_13: boolean = result12 !== undefined;
        expect(r_13).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_1600
     * @tc.name int16ArrayAtPart01Test016
     * @tc.desc Merged batch (5 tests): out-of-range and empty arrays: constructor truncation, nested out-of-range indices, with()/$_set wrapping and hexadecimal bounds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Int16Array constructor truncates out-of-range and fractional values at at() ---
      {
        let arr1: Int16Array = Int16Array.of(32768);
        expect(arr1.at(0)!).assertEqual(-32768);

        let arr2: Int16Array = new Int16Array([3.7, -3.7]);
        expect(arr2.at(1)!).assertEqual(-3);
      }

      // --- [2] Verify nested at(at(0).toInt()) returns undefined for out-of-range index ---
      {
        let arr: Int16Array = new Int16Array([100, 2, 3]);
        let idx: int = arr.at(0)!.toInt();
        expect(arr.at(idx)).assertUndefined();
      }

      // --- [3] Verify with() writing an out-of-range value yields a truncated int16-boundary element read by at(0) ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3]);
        let newArr: Int16Array = arr.with(0, 32768);
        expect(newArr.at(0)!).assertEqual(-32768);
      }

      // --- [4] Verify at() reads the int16-wrapped value after $_set writes an out-of-range element at index 1 ---
      {
        let arr: Int16Array = new Int16Array(2);
        arr.$_set(0, 1);
        arr.$_set(1, 40000);
        expect(arr.at(0)).assertEqual(1);
        expect(arr.at(1)).assertEqual(-25536);
      }

      // --- [5] Verify at() reads hexadecimal element 0x8000 as the negative bound and returns undefined past the end ---
      {
        let arr: Int16Array = Int16Array.of(0x8000, 5, 0x8000);
        expect(arr.at(0)).assertEqual(-32768);
        expect(arr.at(3)).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_1700
     * @tc.name int16ArrayAtPart01Test017
     * @tc.desc Merged batch (5 tests): boundary values and truncation: NaN/Infinity to zero, fill at both bounds, overflow then copyWithin, and hexadecimal bound reads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the Int16Array constructor truncates NaN and infinities to 0 as read by at() ---
      {
        let arr: Int16Array = new Int16Array([Number.NaN]);
        expect(arr.at(0)!).assertEqual(0);

        let arr1: Int16Array = new Int16Array([Number.POSITIVE_INFINITY]);
        expect(arr1.at(0)!).assertEqual(0);

        let arr2: Int16Array = new Int16Array([-Number.POSITIVE_INFINITY]);
        expect(arr2.at(0)!).assertEqual(0);
      }

      // --- [2] Verify fill of 32767 on length 4 and of -32768 on length 3 then reverse() leaves at(0) and at(-1) at both bounds ---
      {
        let fills: int[] = [32767, -32768];
        let lengths: int[] = [4, 3];
        for (let i: int = 0; i < fills.length; i++) {
          let arr: Int16Array = new Int16Array(lengths[i]);
          arr.fill(fills[i]).reverse();
          expect(arr.at(0)!).assertEqual(fills[i]);
          expect(arr.at(-1)!).assertEqual(fills[i]);
        }
      }

      // --- [3] Verify $_set overflow then copyWithin then at(2) returns truncated value ---
      {
        let arr: Int16Array = new Int16Array([0, 1, 2, 3]);
        arr.$_set(0, 32768);
        arr.copyWithin(2, 0, 1);
        expect(arr.at(2)!).assertEqual(-32768);
      }

      // --- [4] Verify at(0) after $_set with hexadecimal 0x7FFF reads the positive int16 bound on an FR16 array ---
      {
        let base: Int16Array = Int16Array.of(0, 0);
        let arr: Int16Array = Int16Array.from(base);
        arr.$_set(0, 0x7FFF);
        expect(arr.at(0)).assertEqual(32767);
      }

      // --- [5] Verify at() reads hexadecimal element 0x7FFF at index 0 and -1 ---
      {
        let arr: Int16Array = Int16Array.of(0x7FFF, 5, 0x7FFF);
        expect(arr.at(0)).assertEqual(32767);
        expect(arr.at(-1)).assertEqual(32767);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_1800
     * @tc.name int16ArrayAtPart01Test018
     * @tc.desc Merged batch (5 tests): post-mutation reads: reverse/fill, sorted minimum, repeated $_set and before/after element reads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at(0) after reverse().fill() reads the filled value ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
        arr.reverse().fill(0, 0, 1);
        expect(arr.at(0)!).assertEqual(0);
      }

      // --- [2] Verify reverse then fill(0,0,1) keeps at(1) as reversed original ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
        let afterReverse: number = arr.reverse().$_get(1);
        arr.fill(0, 0, 1);
        expect(arr.at(1)!).assertEqual(afterReverse);
      }

      // --- [3] Verify $_set MIN then sort then at(0) returns sorted minimum ---
      {
        let arr: Int16Array = new Int16Array([0, 100, 50]);
        arr.$_set(0, -32768);
        arr.sort();
        expect(arr.at(0)!).assertEqual(-32768);
      }

      // --- [4] Verify at() reflects the latest value after a repeated $_set overwrites an element ---
      {
        let arr: Int16Array = new Int16Array([0, 0, 0]);
        arr.$_set(0, 42);
        expect(arr.at(0)!).assertEqual(42);
        arr.$_set(0, 99);
        expect(arr.at(0)!).assertEqual(99);
      }

      // --- [5] Verify at() reads the original element before $_set and the updated value after ---
      {
        let arr: Int16Array = new Int16Array([5, 10, 15]);
        expect(arr.at(0)).assertEqual(5);
        arr.$_set(0, 99);
        expect(arr.at(0)!).assertEqual(99);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_1900
     * @tc.name int16ArrayAtPart01Test019
     * @tc.desc Merged batch (5 tests): construction sources: mapfn, Map and entries-derived arrays with index/value pairing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() reads mapped elements at several indices on an array built by from(Array, mapfn) ---
      {
        let src: int[] = [0, 1, 2, 3, 4];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v * 10 + k);
        expect(arr.at(0)).assertEqual(0);
        expect(arr.at(1)).assertEqual(11);
        expect(arr.at(4)).assertEqual(44);
      }

      // --- [2] Verify at() reads elements at index 1 and -1 on an array built by from(Map.values()) ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 5);
        m.set('b', 15);
        let arr: Int16Array = Int16Array.from(m.values());
        expect(arr.at(1)).assertEqual(15);
        expect(arr.at(-1)).assertEqual(15);
      }

      // --- [3] Verify at() reads first and last keys on an array built by from(Map.keys()) ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(3, 'x');
        m.set(7, 'y');
        let arr: Int16Array = Int16Array.from(m.keys());
        expect(arr.at(0)).assertEqual(3);
        expect(arr.at(-1)).assertEqual(7);
      }

      // --- [4] Verify at(key) equals the entry value for every entry of the entries() iterator ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        let ok: boolean = true;
        let checks: int = 0;
        for (const entry of arr.entries()) {
          checks = checks + 1;
          if (arr.at(entry[0]) !== entry[1]) {
            ok = false;
          }
        }
        expect(ok).assertTrue();
        expect(checks).assertEqual(3);
      }

      // --- [5] Verify at() reads first and last of a from(Array, mapfn) result mapped through Math.ceil ---
      {
        let src: int[] = [1, 3, 5];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => Math.ceil(v * 0.5));
        expect(arr.at(0)).assertEqual(1);
        expect(arr.at(-1)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_2000
     * @tc.name int16ArrayAtPart01Test020
     * @tc.desc Merged batch (3 tests): construction sources: Set, Map and entries-count derived reads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at(-2) reads the penultimate element of a from(Set<int>) array ---
      {
        let s: Set<int> = new Set<int>();
        s.add(4);
        s.add(5);
        s.add(6);
        let arr: Int16Array = Int16Array.from(s);
        expect(arr.at(-2)).assertEqual(5);
      }

      // --- [2] Verify nested at() reads an element of from(Map.values()) using its own first value as index ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 1);
        m.set('b', 9);
        let arr: Int16Array = Int16Array.from(m.values());
        let inner: int = (arr.at(0) as number).toInt();
        expect(inner).assertEqual(1);
        expect(arr.at(inner)).assertEqual(9);
      }

      // --- [3] Verify at() with an index of the entries() count minus one reads the last FR16 element ---
      {
        let base: Int16Array = Int16Array.of(1, 2, 3, 4);
        let arr: Int16Array = Int16Array.from(base);
        let count: int = 0;
        for (const e of arr.entries()) {
          count = count + 1;
        }
        expect(arr.at(count - 1)).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_2100
     * @tc.name int16ArrayAtPart01Test021
     * @tc.desc Merged batch (5 tests): index argument forms: short, double, float, short and long toInt() conversions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() accepts a short-typed index variable for a positive and a negative index ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let idx: short = 1;
        expect(arr.at(idx)).assertEqual(20);

        let neg: short = -1;
        expect(arr.at(neg)).assertEqual(30);
      }

      // --- [2] Verify at() accepts a double.toInt() conversion expression as index ---
      {
        let arr: Int16Array = new Int16Array([5, 6, 7, 8]);
        let ratio: double = 2.7;
        expect(arr.at(ratio.toInt())).assertEqual(7);
      }

      // --- [3] Verify at() accepts a float.toInt() conversion expression as index ---
      {
        let arr: Int16Array = Int16Array.from([100, 200, 300]);
        let scale: float = 1.0f;
        expect(arr.at(scale.toInt())).assertEqual(200);
      }

      // --- [4] Verify at() accepts a short.toInt() conversion expression as index ---
      {
        let arr: Int16Array = new Int16Array(4);
        arr.$_set(0, 40);
        arr.$_set(1, 41);
        arr.$_set(2, 42);
        arr.$_set(3, 43);
        let pos: short = 3;
        expect(arr.at(pos.toInt())).assertEqual(43);
      }

      // --- [5] Verify at() accepts a long.toInt() conversion expression as index ---
      {
        let arr: Int16Array = new Int16Array(Int16Array.of(9, 8, 7, 6));
        let slot: long = 1;
        expect(arr.at(slot.toInt())).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_2200
     * @tc.name int16ArrayAtPart01Test022
     * @tc.desc Merged batch (5 tests): index argument forms: string length, Math.min clamp, ternary, Math.trunc and bitwise-AND indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() accepts an index equal to a token string length ---
      {
        let arr: Int16Array = Int16Array.of(4, 5, 6, 7);
        let token: string = 'abc';
        let idx: int = token.length;
        expect(arr.at(idx)).assertEqual(7);
      }

      // --- [2] Verify at() accepts an index clamped by Math.min against the last valid position ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9);
        let idx: int = Math.min(5, arr.length - 1).toInt();
        expect(arr.at(idx)).assertEqual(9);
        expect(arr.at(-1)).assertEqual(9);
      }

      // --- [3] Verify at() accepts an index chosen by a two-branch ternary over computed positions ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
        let head: int = 0;
        let tail: int = arr.length - 1;
        let pickHead: boolean = false;
        let idx: int = pickHead ? head : tail;
        expect(idx).assertEqual(tail);
        expect(arr.at(idx)).assertEqual(8);
      }

      // --- [4] Verify at() accepts an index of half the length produced by Math.trunc ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let idx: int = Math.trunc(arr.length / 2).toInt();
        expect(arr.at(idx)).assertEqual(3);
        expect(arr.at(-2)).assertEqual(3);
      }

      // --- [5] Verify at() accepts an index equal to the length bitwise AND one ---
      {
        let arr: Int16Array = Int16Array.of(6, 12, 18, 24);
        let idx: int = arr.length & 1;
        expect(arr.at(idx)).assertEqual(6);
        expect(arr.at(0)).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_2300
     * @tc.name int16ArrayAtPart01Test023
     * @tc.desc Merged batch (2 tests): equivalence with $_get and read-only behavior: unchanged reads after join() and reduceRight.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at(0) reads the unchanged first element after a join() query ---
      {
        let arr: Int16Array = Int16Array.of(8, 9, 10);
        expect(arr.join('-')).assertEqual('8-9-10');
        expect(arr.at(0)).assertEqual(8);
      }

      // --- [2] Verify at(0) is unchanged after a reduceRight accumulation over an FR16 array ---
      {
        let base: Int16Array = Int16Array.of(5, 10, 15);
        let arr: Int16Array = Int16Array.from(base);
        let total: number = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
        let r_1: number | undefined = arr.at(0);
        expect(total).assertEqual(30);
        expect(r_1).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART01_2400
     * @tc.name int16ArrayAtPart01Test024
     * @tc.desc Merged batch (5 tests): direct index reads: arithmetic-chain index, nested at() calls, forEach equivalence, full range coverage and post-mutation reads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() with an index from an int arithmetic chain a + b * 2 reads an element ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        let a: int = 0;
        let b: int = 2;
        let idx: int = a + b * 2;
        expect(arr.at(idx)).assertEqual(50);
      }

      // --- [2] Verify three-level nested at() calls read an element ---
      {
        let arr: Int16Array = new Int16Array([2, 1, 3, 4, 40]);
        let idx1: int = arr.at(0)!.toInt();
        let idx2: int = arr.at(idx1)!.toInt();
        expect(arr.at(idx2)!).assertEqual(4);
      }

      // --- [3] Verify forEach callback value equals at(index) for each element ---
      {
        let arr: Int16Array = new Int16Array([5, 15, 25, 35]);
        let match: boolean = true;
        let calls: int = 0;
        let idxOk: boolean = true;
        arr.forEach((val: number, idx: int) => {
          if (idx !== calls) {
            idxOk = false;
          }
          calls = calls + 1;
          if (arr.at(idx) !== val) {
            match = false;
          }
        });
        expect(match).assertTrue();
        expect(idxOk).assertTrue();
        expect(calls).assertEqual(4);
      }

      // --- [4] Verify at(i) is defined for every valid index in range ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let allDefined: boolean = true;
        for (let i: int = 0; i < arr.length; i++) {
          if (arr.at(i) === undefined) {
            allDefined = false;
          }
        }
        expect(allDefined).assertTrue();
      }

      // --- [5] Verify fill then copyWithin then at(0)/at(3) both return filled value ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        arr.fill(99, 0, 2);
        arr.copyWithin(3, 0, 2);
        expect(arr.at(3)!).assertEqual(99);
        expect(arr.at(0)!).assertEqual(99);
      }
    });

  });
}
