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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int16ArrayCopyWithinPart03Test(): void {
  describe('Int16ArrayCopyWithinPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_0100
     * @tc.name int16ArrayCopyWithinPart03Test001
     * @tc.desc Merged batch (5 tests): views and shared buffers: overlapping and disjoint views, zero-length view, and mutual subarray/source visibility.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin(0,2,4) on one view of a shared 8-byte buffer is observed through two other overlapping views ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let view1: Int16Array = new Int16Array(buf, 0, 4);
        view1.set(Int16Array.of(100, 200, 300, 400));
        let view2: Int16Array = new Int16Array(buf, 0, 4);
        let view3: Int16Array = new Int16Array(buf, 0, 4);
        view1.copyWithin(0, 2, 4);
        expect(view2.$_get(0)).assertEqual(300);
        expect(view3.$_get(0)).assertEqual(300);
        expect(view2.$_get(1)).assertEqual(400);
        expect(view3.$_get(1)).assertEqual(400);

        let buf2: ArrayBuffer = new ArrayBuffer(8);
        let view4: Int16Array = new Int16Array(buf2, 0, 4);
        view4.set(Int16Array.of(10, 20, 30, 40));
        let view5: Int16Array = new Int16Array(buf2, 0, 4);
        view4.copyWithin(0, 2, 4);
        expect(view5.$_get(0)).assertEqual(30);
        expect(view5.$_get(1)).assertEqual(40);
      }

      // --- [2] Verify copyWithin() on a buffer view leaves a disjoint sibling view unchanged ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let view1: Int16Array = new Int16Array(buf, 0, 2);
        view1.set(Int16Array.of(8, 16));
        let view2: Int16Array = new Int16Array(buf, 4, 2);
        view2.set(Int16Array.of(24, 32));
        view1.copyWithin(0, 1, 2);
        expect(view2.$_get(0)).assertEqual(24);
        expect(view2.$_get(1)).assertEqual(32);
      }

      // --- [3] Verify copyWithin on a zero-length view is a no-op while a non-empty view over the same buffer copies ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf);
        arr.set(Int16Array.of(1, 2, 3, 4));
        let empty: Int16Array = arr.subarray(0, 0);
        empty.copyWithin(0, 2);
        expect(arr.join(',')).assertEqual('1,2,3,4');

        let live: Int16Array = arr.subarray(0, 4);
        live.copyWithin(0, 2);
        expect(arr.join(',')).assertEqual('3,4,3,4');
      }

      // --- [4] Verify a subarray view reflects copyWithin() performed on its source array ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
        let sub: Int16Array = arr.subarray(2, 6);
        arr.copyWithin(3, 0, 2);
        expect(sub.$_get(0)).assertEqual(3);
        expect(sub.$_get(1)).assertEqual(1);
        expect(sub.$_get(2)).assertEqual(2);
        expect(sub.$_get(3)).assertEqual(6);
      }

      // --- [5] Verify copyWithin() called on a subarray mutates the shared source array ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        let sub: Int16Array = arr.subarray(1, 5);
        let ret: Int16Array = sub.copyWithin(0, 2, 4);
        ret.$_get(0);
        expect(arr.$_get(1)).assertEqual(40);
        expect(arr.$_get(2)).assertEqual(50);
        expect(arr.$_get(3)).assertEqual(40);
        expect(arr.$_get(4)).assertEqual(50);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_0200
     * @tc.name int16ArrayCopyWithinPart03Test002
     * @tc.desc Merged batch (5 tests): boundary values and truncation: int16 MIN, NaN-to-zero, signed Infinity-to-zero and fractional truncation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin() copies an explicitly stored int16 MIN element to a distant slot ---
      {
        let arr: Int16Array = Int16Array.of(0, -32768, 0, 0);
        arr.copyWithin(2, 1, 2);
        expect(arr.$_get(2)).assertEqual(-32768);
      }

      // --- [2] Verify copyWithin(0, 1, 2) preserves NaN truncation to 0 ---
      {
        let arr: Int16Array = Int16Array.of(1, Number.NaN, 3, 4);
        arr.copyWithin(0, 1, 2);
        expect(arr.$_get(0)).assertEqual(0);
      }

      // --- [3] Verify copyWithin() copies positive and negative Infinity elements as the int16-truncated zero ---
      {
        let sources: number[][] = [[10, Number.POSITIVE_INFINITY, 30], [5, -Number.POSITIVE_INFINITY, 15, 25]];
        let targets: int[] = [2, 3];
        for (let i: int = 0; i < sources.length; i++) {
          let arr: Int16Array = Int16Array.from(sources[i]);
          arr.copyWithin(targets[i], 1, 2);
          expect(arr.$_get(targets[i])).assertEqual(0);
        }
      }

      // --- [4] Verify copyWithin(0, 2, 3) preserves truncated float source values ---
      {
        let arr: Int16Array = Int16Array.of(0, 0, 3.7, 0);
        arr.copyWithin(0, 2, 3);
        expect(arr.at(0)).assertEqual(3);
        expect(arr.at(2)).assertEqual(3);
      }

      // --- [5] Verify copyWithin(1, 3, 4) preserves truncated float source values ---
      {
        let arr: Int16Array = Int16Array.of(0, 0, 0, -3.7);
        arr.copyWithin(1, 3, 4);
        expect(arr.join(',')).assertEqual('0,-3,0,-3');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_0300
     * @tc.name int16ArrayCopyWithinPart03Test003
     * @tc.desc Merged batch (4 tests): return value and chaining: aliasing through $_set, reverse/sort mutation of the source, and chained composition.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Int16Array.copyWithin(0,2,4) return value shares storage so $_set(0,99) is visible on the source ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let result: Int16Array = arr.copyWithin(0, 2, 4);
        result.$_set(0, 99);
        expect(arr.$_get(0)).assertEqual(99);
      }

      // --- [2] Verify reverse() on the reference returned by copyWithin(0,2,4) mutates the source array built by of() ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        let ret: Int16Array = arr.copyWithin(0, 2, 4);
        ret.reverse();
        expect(arr.$_get(0)).assertEqual(50);
        expect(arr.$_get(1)).assertEqual(40);
        expect(arr.$_get(2)).assertEqual(30);
        expect(arr.$_get(3)).assertEqual(40);
      }

      // --- [3] Verify sort() on the reference returned by copyWithin(0,2,4) mutates the source array built by of() ---
      {
        let arr: Int16Array = Int16Array.of(50, 10, 40, 20, 30);
        let ret: Int16Array = arr.copyWithin(0, 2, 4);
        ret.sort();
        expect(arr.join(',')).assertEqual('20,20,30,40,40');
      }

      // --- [4] Verify chained copyWithin() calls compose on the array returned by the first call ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
        arr.copyWithin(0, 2, 4).copyWithin(4, 0, 2);
        expect(arr.$_get(4)).assertEqual(3);
        expect(arr.$_get(5)).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_0400
     * @tc.name int16ArrayCopyWithinPart03Test004
     * @tc.desc Merged batch (4 tests): post-copy reads and derived consumers: Map from entries, toSorted copy, from/new construction and at/$_get readback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a Map built from the entries of a copyWithin(0,1,2) result maps each index to its element ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        arr.copyWithin(0, 1, 2);
        let mp: Map<int, number> = new Map<int, number>();
        for (const e of arr.entries()) {
          mp.set(e[0], e[1]);
        }
        let v0: number | undefined = mp.get(0);
        let v1: number | undefined = mp.get(1);
        expect(v0).assertEqual(4);
        expect(v1).assertEqual(4);
      }

      // --- [2] Verify copyWithin on a toSorted() copy copies the leading window onto the middle ---
      {
        let arr: Int16Array = Int16Array.of(5, 1, 4, 2, 3).toSorted();
        arr.copyWithin(2, 0, 2);
        expect(arr.$_get(2)).assertEqual(1);
        expect(arr.$_get(4)).assertEqual(5);
      }

      // --- [3] Verify Int16Array.from and new Int16Array accept a copyWithin result as source with the same contents ---
      {
        let arr: Int16Array = Int16Array.of(32767 as short, -1 as short, 3 as short);
        let ret: Int16Array = arr.copyWithin(0, 1);
        let fromCopy: Int16Array = Int16Array.from(ret);
        let ctorCopy: Int16Array = new Int16Array(ret);
        expect(fromCopy.join(',')).assertEqual('-1,3,3');
        expect(ctorCopy.join(',')).assertEqual('-1,3,3');
      }

      // --- [4] Verify two-arg copyWithin(0,1) on an array built by from(Array, mapfn) is read back through at(0) and $_get(2) ---
      {
        let src: int[] = [0, 5, 10];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v + k);
        arr.copyWithin(0, 1);
        expect(arr.at(0)).assertEqual(6);
        expect(arr.$_get(2)).assertEqual(12);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_0500
     * @tc.name int16ArrayCopyWithinPart03Test005
     * @tc.desc Merged batch (5 tests): post-copy reads and derived consumers: lastIndexOf, toLocaleString, toSorted plus findLastIndex, and entries/keys iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify lastIndexOf of two values on a copyWithin(0,2,4) result yields their last indices ---
      {
        let arr: Int16Array = Int16Array.of(7, 8, 9, 7, 8);
        arr.copyWithin(0, 2, 4);
        expect(arr.lastIndexOf(9)).assertEqual(2);
        expect(arr.lastIndexOf(7)).assertEqual(3);
      }

      // --- [2] Verify toLocaleString on a copyWithin(0,2,4) result equals the expected joined string ---
      {
        let arr: Int16Array = Int16Array.of(11, 12, 13, 14);
        arr.copyWithin(0, 2, 4);
        expect(arr.toLocaleString()).assertEqual('13,14,13,14');
      }

      // --- [3] Verify toSorted() then findLastIndex matching a value on an array built by from(Set) after copyWithin(1,0,2) yields the matching index ---
      {
        let s: Set<int> = new Set<int>();
        s.add(3);
        s.add(6);
        s.add(9);
        s.add(12);
        let arr: Int16Array = Int16Array.from(s);
        arr.copyWithin(1, 0, 2);
        let sorted: Int16Array = arr.toSorted();
        let idx: int = sorted.findLastIndex((v: number, _i: int, _a: Int16Array): boolean => {
          return v === 3;
        });
        let want: int = 1;
        expect(idx).assertEqual(want);
        expect(sorted.$_get(3)).assertEqual(12);
      }

      // --- [4] Verify entries() after copyWithin() on a from(Map.values()) array reflects copied values ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 2);
        m.set('b', 5);
        m.set('c', 8);
        m.set('d', 11);
        let arr: Int16Array = Int16Array.from(m.values());
        arr.copyWithin(0, 1, 3);
        let vals: int[] = [];
        for (const e of arr.entries()) {
          vals.push(e[1].toInt());
        }
        expect(vals[0]).assertEqual(5);
        expect(vals[2]).assertEqual(8);
      }

      // --- [5] Verify keys() after copyWithin() on a from(Map.keys()) array yields contiguous indices ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(4, 'a');
        m.set(5, 'b');
        m.set(6, 'c');
        let arr: Int16Array = Int16Array.from(m.keys());
        arr.copyWithin(0, 1, 2);
        let idxSum: number = 0;
        for (const k of arr.keys()) {
          idxSum = idxSum + k;
        }
        expect(idxSum).assertEqual(3);
        expect(arr.$_get(0)).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_0600
     * @tc.name int16ArrayCopyWithinPart03Test006
     * @tc.desc Merged batch (4 tests): construction sources: Array literal, Set, mapfn-derived omitted-end copy and copy-construction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin(1,0,3) on an array built from an Array literal writes the source window into indices 1,2,3 ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
        arr.copyWithin(1, 0, 3);
        let exp: int[] = [10, 10, 20, 30, 50];
        for (let i: int = 0; i < exp.length; i++) {
          expect(arr.$_get(i)).assertEqual(exp[i]);
        }
      }

      // --- [2] Verify copyWithin(0,2,4) on an array built by from(Set) copies the source window to the front ---
      {
        let s: Set<int> = new Set<int>();
        s.add(1);
        s.add(2);
        s.add(3);
        s.add(4);
        s.add(5);
        let arr: Int16Array = Int16Array.from(s);
        arr.copyWithin(0, 2, 4);
        let want: number[] = [3, 4, 3, 4, 5];
        expect(Array.from(arr)).assertDeepEquals(want);
      }

      // --- [3] Verify two-arg copyWithin(0,1) with omitted end on an array built by from(Array, mapfn) copies the tail from index 1 to the front ---
      {
        let src: int[] = [9, 8, 7, 6];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v * 10 + k);
        arr.copyWithin(0, 1);
        let exp: int[] = [81, 72, 63, 63];
        for (let i: int = 0; i < exp.length; i++) {
          expect(arr.$_get(i)).assertEqual(exp[i]);
        }
      }

      // --- [4] Verify copyWithin(0,2,4) on a copy-constructed array copies the source window to the front ---
      {
        let base: Int16Array = Int16Array.of(5, 6, 7, 8);
        let arr: Int16Array = new Int16Array(base);
        arr.copyWithin(0, 2, 4);
        let exp: int[] = [7, 8, 7, 8];
        for (let i: int = 0; i < exp.length; i++) {
          expect(arr.$_get(i)).assertEqual(exp[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_0700
     * @tc.name int16ArrayCopyWithinPart03Test007
     * @tc.desc Merged batch (5 tests): clamping, negative and no-op forms: negative target, below-front clamp, out-of-range argument combinations, negative start and end clamping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify three-arg copyWithin() with a negative target clamps it relative to length ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        arr.copyWithin(-1, 0, 2);
        let want: number[] = [10, 20, 30, 40, 10];
        expect(Array.from(arr)).assertDeepEquals(want);
      }

      // --- [2] Verify copyWithin(-5, 2, 4) clamps a negative target past the front to 0 and copies the source window to the front ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        arr.copyWithin(-5, 2, 4);
        expect(arr.$_get(0)).assertEqual(30);
        expect(arr.$_get(1)).assertEqual(40);
        expect(arr.$_get(2)).assertEqual(30);

        let arr2: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        arr2.copyWithin(-6, 2, 4);
        expect(arr2.$_get(0)).assertEqual(30);
        expect(arr2.$_get(1)).assertEqual(40);
        expect(arr2.$_get(2)).assertEqual(30);
      }

      // --- [3] Verify copyWithin with target out of range, start out of range, start equal to end, or start greater than end is a no-op leaving array unchanged ---
      {
        let cases: int[][] = [
          [5, 0, 3],
          [6, 0, 3],
          [2147483647, 0, 3],
          [0, 5, 8],
          [0, 6, 8],
          [0, 2147483647, 8],
          [0, 0, -1],
          [0, 0, -5],
          [0, 0, -6],
          [0, 2, 0],
          [0, 2, 2],
          [0, 3, 2],
          [1, 0, 0],
          [2, 1, 1],
          [-1, -1, 8],
          [-6, -6, 3],
          [6, 6, 8],
          [6, 0, 3],
          [0, 6, 8],
          [-6, 5, 8],
          [3, 3, 3],
          [-1, -1, -1],
          [99999, 0, 2],
          [0, 0, 5]
        ];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
          arr.copyWithin(cases[i][0], cases[i][1], cases[i][2]);
          expect(arr.$_get(0)).assertEqual(10);
          expect(arr.$_get(1)).assertEqual(20);
          expect(arr.$_get(2)).assertEqual(30);
          expect(arr.$_get(3)).assertEqual(40);
          expect(arr.$_get(4)).assertEqual(50);
        }
      }

      // --- [4] Verify copyWithin(2,-5,3) and copyWithin(2,-6,3) clamp a negative start to 0 and copy the source window to the target ---
      {
        let cases: int[][] = [
          [2, -5, 3],
          [2, -6, 3]
        ];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
          arr.copyWithin(cases[i][0], cases[i][1], cases[i][2]);
          expect(arr.$_get(2)).assertEqual(10);
          expect(arr.$_get(3)).assertEqual(20);
          expect(arr.$_get(4)).assertEqual(30);
        }
      }

      // --- [5] Verify Int16Array.copyWithin(0, 2, end) clamps end to length for end=length+1 and end=2147483647 ---
      {
        let cases: int[] = [6, 2147483647];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
          arr.copyWithin(0, 2, cases[i]);
          expect(arr.$_get(0)).assertEqual(30);
          expect(arr.$_get(1)).assertEqual(40);
          expect(arr.$_get(2)).assertEqual(50);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_0800
     * @tc.name int16ArrayCopyWithinPart03Test008
     * @tc.desc Merged batch (5 tests): copyWithin argument matrix: single-element window, one-arg defaults, negative one-arg, index-2 one-arg and omitted-end two-arg.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify three-arg copyWithin() with a one-element source window overwrites the target slot ---
      {
        let arr: Int16Array = Int16Array.of(10, 20);
        arr.copyWithin(0, 1, 2);
        expect(arr.$_get(0)).assertEqual(20);
        expect(arr.$_get(1)).assertEqual(20);
      }

      // --- [2] Verify one-arg copyWithin() defaults start to 0 and end to length ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        arr.copyWithin(1);
        let exp: int[] = [10, 10, 20, 30];
        for (let i: int = 0; i < exp.length; i++) {
          expect(arr.$_get(i)).assertEqual(exp[i]);
        }
      }

      // --- [3] Verify one-arg copyWithin(-1) with omitted start and end copies the first element into the last slot ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7, 8);
        arr.copyWithin(-1);
        expect(arr.join(',')).assertEqual('5,6,7,5');
      }

      // --- [4] Verify one-arg copyWithin(2) with omitted start and end keeps the first two elements and shifts the rest ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        arr.copyWithin(2);
        let a0: number | undefined = arr.at(0);
        let a2: number | undefined = arr.at(2);
        let a4: number | undefined = arr.at(4);
        expect(a0).assertEqual(1);
        expect(a2).assertEqual(1);
        expect(a4).assertEqual(3);
      }

      // --- [5] Verify two-arg copyWithin() with omitted end copies from start through the array end ---
      {
        let arr: Int16Array = Int16Array.of(100 as short, 32767 as short, -1 as short);
        let ret: Int16Array = arr.copyWithin(1, 0);
        expect(ret.$_get(1)).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_0900
     * @tc.name int16ArrayCopyWithinPart03Test009
     * @tc.desc Merged batch (4 tests): copyWithin argument matrix: pre/post $_get reads, one-arg index 3, threshold count and general [start,end) copies.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_get before and after copyWithin(1,0,2) keeps the pre-copy values and the shifted source pair ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let b0: number = arr.$_get(0);
        let b1: number = arr.$_get(1);
        arr.copyWithin(1, 0, 2);
        expect(b0).assertEqual(1);
        expect(b1).assertEqual(2);
        expect(arr.$_get(1)).assertEqual(1);
        expect(arr.$_get(2)).assertEqual(2);
      }

      // --- [2] Verify one-arg copyWithin(3) copies from index 0 into the final slot ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        arr.copyWithin(3);
        expect(arr.join(',')).assertEqual('1,2,3,1');
      }

      // --- [3] Verify counting the elements above a threshold after copyWithin(0,2,4) on a five-element array ---
      {
        let arr: Int16Array = Int16Array.of(3, 5, 7, 9, 11);
        arr.copyWithin(0, 2, 4);
        let bigCount: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          if (arr.$_get(i) > 8) {
            bigCount = bigCount + 1;
          }
        }
        expect(bigCount).assertEqual(3);
      }

      // --- [4] Verify copyWithin copies [start, end) elements into target for various target/start/end argument combinations ---
      {
        let cases: int[][] = [
          [6, 0, 4, 6, 128, 256, 512, 1024, 2048, 4096, 0, 1, 2048, 4096, -1],
          [6, 2, 0, 3, 500, 1500, 2500, 3500, 4500, 5500, 2, 3, 4, 500, 1500, 2500, -1],
          [6, 1, 3, 5, 500, 1500, 2500, 3500, 4500, 5500, 1, 2, 3500, 4500, -1],
          [5, 0, 1, 1, 12, 34, 56, 78, 90, 0, 1, 2, 12, 34, 56, -1],
          [6, 4, 0, 2, 12, 34, 56, 78, 90, 123, 4, 5, 12, 34, -1],
          [6, 1, 0, 4, 1000, 2000, 3000, 4000, 5000, 6000, 1, 2, 3, 4, 1000, 2000, 3000, 4000, -1],
          [8, 2, 4, 7, 8, 16, 24, 32, 40, 48, 56, 64, 2, 3, 4, 40, 48, 56, -1],
          [8, 2, 5, 7, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 2, 3, 4096, 8192, -1],
          [8, 3, 0, 2, 500, 1500, 2500, 3500, 4500, 5500, 6500, 7500, 3, 4, 500, 1500, -1],
          [8, 4, 0, 3, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 4, 5, 6, 128, 256, 512, -1],
          [6, 4, 0, 3, 12, 34, 56, 78, 90, 123, 4, 5, 12, 34, -1],
          [5, 4, 1, 2, 500, 1500, 2500, 3500, 4500, 4, 1500, -1],
          [6, -1, 0, 1, 128, 256, 512, 1024, 2048, 4096, 5, 0, 128, 128, -1],
          [8, -4, 0, 2, 500, 1500, 2500, 3500, 4500, 5500, 6500, 7500, 4, 5, 500, 1500, -1],
          [5, -15, 2, 4, 12, 34, 56, 78, 90, 0, 1, 56, 78, -1],
          [5, 100, 0, 2, 128, 256, 512, 1024, 2048, 0, 1, 2, 3, 4, 128, 256, 512, 1024, 2048, -1],
          [4, 32767, 0, 2, 500, 1500, 2500, 3500, 0, 1, 500, 1500, -1],
          [6, -16384, 3, 5, 12, 34, 56, 78, 90, 123, 0, 1, 78, 90, -1],
          [5, 0, 1, 3, 1000, 2000, 3000, 4000, 5000, 0, 1, 2000, 3000, -1],
          [5, 1, 0, 2, 1000, 2000, 3000, 4000, 5000, 1, 2, 1000, 2000, -1],
          [6, 0, 4, 6, 500, 1500, 2500, 3500, 4500, 5500, 0, 1, 4500, 5500, -1],
          [6, 0, 2, 5, 128, 256, 512, 1024, 2048, 4096, 0, 1, 2, 512, 1024, 2048, -1],
          [8, 0, 4, 7, 12, 34, 56, 78, 90, 123, 456, 789, 0, 1, 2, 90, 123, 456, -1],
          [8, 0, -4, 8, 500, 1500, 2500, 3500, 4500, 5500, 6500, 7500, 0, 1, 2, 3, 4500, 5500, 6500, 7500, -1],
          [5, 0, -1, 5, 128, 256, 512, 1024, 2048, 0, 2048, -1],
          [5, 2, -15, 3, 12, 34, 56, 78, 90, 2, 3, 4, 12, 34, 56, -1],
          [5, 0, 10, 5, 500, 1500, 2500, 3500, 4500, 0, 1, 4, 500, 1500, 4500, -1],
          [4, 0, 50, 4, 128, 256, 512, 1024, 0, 3, 128, 1024, -1],
          [4, 0, 32767, 4, 12, 34, 56, 78, 0, 3, 12, 78, -1],
          [4, 1, -32768, 3, 500, 1500, 2500, 3500, 1, 2, 500, 1500, -1],
          [6, 0, 1, 6, 1000, 2000, 3000, 4000, 5000, 6000, 0, 4, 2000, 6000, -1],
          [7, 0, 4, 7, 12, 34, 56, 78, 90, 123, 456, 0, 1, 2, 90, 123, 456, -1],
          [5, 2, 0, 3, 500, 1500, 2500, 3500, 4500, 2, 3, 4, 500, 1500, 2500, -1],
          [5, 2, 2, 4, 128, 256, 512, 1024, 2048, 2, 3, 512, 1024, -1],
          [4, 0, 2147483647, 4, 12, 34, 56, 78, 0, 3, 12, 78, -1],
          [6, 1, 3, 6, 500, 1500, 2500, 3500, 4500, 5500, 1, 2, 3, 3500, 4500, 5500, -1],
          [6, 3, 0, 3, 128, 256, 512, 1024, 2048, 4096, 3, 4, 5, 128, 256, 512, -1],
          [6, 0, 2, 5, 12, 34, 56, 78, 90, 123, 0, 1, 2, 56, 78, 90, -1],
          [6, 0, 0, 4, 500, 1500, 2500, 3500, 4500, 5500, 0, 1, 2, 3, 500, 1500, 2500, 3500, -1],
          [6, 0, 2, 4, 128, 256, 512, 1024, 2048, 4096, 0, 1, 512, 1024, -1],
          [6, 0, 1, 4, 12, 34, 56, 78, 90, 123, 0, 1, 2, 34, 56, 78, -1],
          [4, 1, 0, 0, 500, 1500, 2500, 3500, 0, 1, 500, 1500, -1],
          [6, 0, 1, -3, 128, 256, 512, 1024, 2048, 4096, 0, 1, 256, 512, -1],
          [6, 0, 0, -1, 12, 34, 56, 78, 90, 123, 0, 1, 2, 3, 4, 12, 34, 56, 78, 90, -1],
          [4, 0, 1, -15, 500, 1500, 2500, 3500, 0, 1, 500, 1500, -1],
          [4, 0, 2, 7, 128, 256, 512, 1024, 0, 1, 512, 1024, -1],
          [5, 0, 3, 100, 12, 34, 56, 78, 90, 0, 1, 78, 90, -1],
          [4, 0, 1, 32767, 500, 1500, 2500, 3500, 0, 1, 2, 1500, 2500, 3500, -1],
        ];
        for (let i: int = 0; i < cases.length; i++) {
          let len: int = cases[i][0];
          let arr: Int16Array = new Int16Array(len);
          for (let k: int = 0; k < len; k++) {
            arr.$_set(k, cases[i][4 + k]);
          }
          arr.copyWithin(cases[i][1], cases[i][2], cases[i][3]);
          let nAssert: int = (cases[i].length - 4 - len - 1) / 2;
          for (let k: int = 0; k < nAssert; k++) {
            let idx: int = cases[i][4 + len + k];
            expect(arr.$_get(idx)).assertEqual(cases[i][4 + len + nAssert + k]);
          }
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_1000
     * @tc.name int16ArrayCopyWithinPart03Test010
     * @tc.desc Merged batch (4 tests): views and shared buffers: DataView readback, byteOffset views and visibility through a fresh view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify DataView.getInt16 on a buffer-backed array reflects the copyWithin(1,2,4) result ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let arr: Int16Array = new Int16Array(buf);
        let dv: DataView = new DataView(buf);
        arr.$_set(0, 1);
        arr.$_set(1, 2);
        arr.$_set(2, 3);
        arr.$_set(3, 4);
        arr.$_set(4, 5);
        arr.copyWithin(1, 2, 4);
        expect(dv.getInt16(2, true)).assertEqual(3);
        expect(arr.$_get(0)).assertEqual(1);
      }

      // --- [2] Verify two-arg copyWithin(2,0) on a buffer-backed view duplicates the head, read back at each slot through a DataView ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf);
        let dv: DataView = new DataView(buf);
        arr.$_set(0, 111);
        arr.$_set(1, 222);
        arr.$_set(2, 333);
        arr.$_set(3, 444);
        arr.copyWithin(2, 0);
        expect(dv.getInt16(0, true)).assertEqual(111);
        expect(dv.getInt16(4, true)).assertEqual(111);
        expect(dv.getInt16(6, true)).assertEqual(222);
      }

      // --- [3] Verify copyWithin on buffer views at various byteOffsets copies the expected elements ---
      {
        let buf1: ArrayBuffer = new ArrayBuffer(8);
        let arr1: Int16Array = new Int16Array(buf1, 0, 4);
        arr1.set(Int16Array.of(1, 2, 3, 4));
        arr1.copyWithin(1, 0, 2);
        expect(arr1.join(',')).assertEqual('1,1,2,4');

        let buf2: ArrayBuffer = new ArrayBuffer(12);
        let arr2: Int16Array = new Int16Array(buf2, 4, 4);
        arr2.set(Int16Array.of(5, 6, 7, 8));
        arr2.copyWithin(1, 2, 4);
        expect(arr2.join(',')).assertEqual('5,7,8,8');

        let buf3: ArrayBuffer = new ArrayBuffer(10);
        let arr3: Int16Array = new Int16Array(buf3, 2, 4);
        arr3.set(Int16Array.of(10, 20, 30, 40));
        arr3.copyWithin(-3, -4, -1);
        expect(arr3.join(',')).assertEqual('10,10,20,30');

        let buf4: ArrayBuffer = new ArrayBuffer(8);
        let arr4: Int16Array = new Int16Array(buf4, 2, 3);
        arr4.set(Int16Array.of(9, 18, 27));
        arr4.copyWithin(5, 0, 1);
        expect(arr4.join(',')).assertEqual('9,18,27');
      }

      // --- [4] Verify copyWithin result is visible through a new view on the original buffer ---
      {
        let arr1: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        arr1.copyWithin(0, 3, 5);
        let view1: Int16Array = new Int16Array(arr1.buffer, 0, 5);
        expect(view1.$_get(0)).assertEqual(4);
        expect(view1.$_get(1)).assertEqual(5);

        let arr2: Int16Array = Int16Array.of(10, 20, 30, 40);
        let ret2: Int16Array = arr2.copyWithin(1, 2, 4);
        let view2: Int16Array = new Int16Array(ret2.buffer, 0, 4);
        expect(view2.$_get(1)).assertEqual(30);
        expect(view2.$_get(2)).assertEqual(40);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_1100
     * @tc.name int16ArrayCopyWithinPart03Test011
     * @tc.desc Merged batch (5 tests): boundary values and truncation: MAX windows, mixed int16 forms, MIN/NaN/Infinity, wrapped index-1 and 0x8000 elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify three-arg copyWithin() copies a wrapped-value window including int16 MAX to later slots ---
      {
        let arr: Int16Array = Int16Array.of(32768, -32769, 32767, -32768, Number.NaN, Number.POSITIVE_INFINITY);
        arr.copyWithin(3, 0, 3);
        expect(arr.$_get(3)).assertEqual(-32768);
        expect(arr.$_get(4)).assertEqual(32767);
        expect(arr.$_get(5)).assertEqual(32767);
      }

      // --- [2] Verify copyWithin() carries source elements of diverse int16 forms: MAX, wrap, fractional, negative ---
      {
        let arr: Int16Array = Int16Array.of(128, 256, 32767, 1024, 2048);
        arr.copyWithin(0, 2, 3);
        expect(arr.$_get(0)).assertEqual(32767);

        let arr2: Int16Array = Int16Array.of(0, 0, 32768, 0, 0);
        arr2.copyWithin(0, 2, 3);
        expect(arr2.$_get(0)).assertEqual(-32768);

        let arr3: Int16Array = Int16Array.of(0, 0, 3.7, 0, 0);
        arr3.copyWithin(0, 2, 3);
        expect(arr3.$_get(0)).assertEqual(3);

        let arr4: Int16Array = Int16Array.of(128, 256, -1, 1024);
        arr4.copyWithin(0, 2, 3);
        expect(arr4.$_get(0)).assertEqual(-1);
      }

      // --- [3] Verify copyWithin() carries int16 MIN, NaN and Infinity source elements as stored values ---
      {
        let arr: Int16Array = Int16Array.of(500, -32768, 2500, 3500, 4500);
        arr.copyWithin(0, 1, 2);
        expect(arr.$_get(0)).assertEqual(-32768);

        let arr2: Int16Array = Int16Array.of(128, Number.NaN, 512, 1024);
        arr2.copyWithin(0, 1, 2);
        expect(arr2.$_get(0)).assertEqual(0);

        let arr3: Int16Array = Int16Array.of(500, Number.POSITIVE_INFINITY, 2500, 3500);
        arr3.copyWithin(0, 1, 2);
        expect(arr3.$_get(0)).assertEqual(0);

        let arr4: Int16Array = Int16Array.of(32767, 0, -32768, 128);
        arr4.copyWithin(0, 1, 2);
        expect(arr4.$_get(0)).assertEqual(0);
      }

      // --- [4] Verify copyWithin(3, 1, 2) copies int16-wrapped index 1 element to index 3 ---
      {
        let arr: Int16Array = Int16Array.of(0, -32769, 0, 0, 0);
        arr.copyWithin(3, 1, 2);
        expect(arr.$_get(3)).assertEqual(32767);

        let arr2: Int16Array = Int16Array.of(128, 0x7fff, 512, 1024);
        arr2.copyWithin(3, 1, 2);
        expect(arr2.$_get(3)).assertEqual(32767);
      }

      // --- [5] Verify copyWithin(target, 0, 1) copies wrapped 0x8000 element to target ---
      {
        let arr: Int16Array = Int16Array.of(0x8000, 100, 200, 300);
        arr.copyWithin(1, 0, 1);
        expect(arr.$_get(1)).assertEqual(-32768);

        let arr2: Int16Array = Int16Array.of(32768, 10, 20, 30);
        arr2.copyWithin(2, 0, 1);
        expect(arr2.$_get(2)).assertEqual(-32768);

        let arr3: Int16Array = Int16Array.of(32768, 100, 200, 300);
        arr3.copyWithin(3, 0, 1);
        expect(arr3.$_get(3)).assertEqual(-32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_1200
     * @tc.name int16ArrayCopyWithinPart03Test012
     * @tc.desc Merged batch (4 tests): return value and chaining: toReversed/toSorted chains, reference identity, double chain and fill/reverse composition.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify chained toReversed().toSorted() on a copyWithin(1,0,2) result yields an ascending array ---
      {
        let arr: Int16Array = Int16Array.of(4, 1, 3, 2);
        arr.copyWithin(1, 0, 2);
        let sorted: Int16Array = arr.toReversed().toSorted();
        expect(sorted.$_get(0)).assertEqual(1);
        expect(sorted.$_get(3)).assertEqual(4);
      }

      // --- [2] Verify copyWithin return is the same object reference as original array for various argument forms ---
      {
        let arr1: Int16Array = Int16Array.of(3, 6, 9, 12, 15);
        expect(arr1.copyWithin(2, 0, 3)).assertEqual(arr1);

        let arr2: Int16Array = Int16Array.of(4, 8, 12, 16, 20);
        expect(arr2.copyWithin(0, 3)).assertEqual(arr2);

        let arr3: Int16Array = Int16Array.of(1, 3, 5, 7, 9);
        expect(arr3.copyWithin(-3, -5, -1)).assertEqual(arr3);

        let arr4: Int16Array = Int16Array.of(6, 12, 18);
        expect(arr4.copyWithin(3, 0, 2)).assertEqual(arr4);

        let arr5: Int16Array = Int16Array.of(25, 50, 75, 100);
        expect(arr5.copyWithin(1, 2, 2)).assertEqual(arr5);

        let arr6: Int16Array = Int16Array.of(13, 26, 39, 52);
        expect(arr6.copyWithin(0, 3, 1)).assertEqual(arr6);

        let arr7: Int16Array = Int16Array.of(7, 14, 21);
        expect(arr7.copyWithin(0, 5, 6)).assertEqual(arr7);
      }

      // --- [3] Verify double copyWithin chain returns same object reference ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
        expect(arr.copyWithin(0, 4, 6).copyWithin(2, 0, 2)).assertEqual(arr);
      }

      // --- [4] Verify three chained mutations copyWithin(), fill() and reverse() all apply to the same array ---
      {
        let arr: Int16Array = Int16Array.of(8, 16, 24, 32, 40);
        arr.copyWithin(0, 2, 4).fill(0, 3, 5).reverse();
        expect(arr.$_get(4)).assertEqual(24);
        expect(arr.$_get(3)).assertEqual(32);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_1300
     * @tc.name int16ArrayCopyWithinPart03Test013
     * @tc.desc Merged batch (5 tests): post-copy reads and derived consumers: first entries pair, last key, at(-1), Set size and with() result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the first entry of entries() on a copyWithin(1,0,2) result pairs index 0 with the unchanged first element ---
      {
        let arr: Int16Array = Int16Array.of(15, 25, 35);
        arr.copyWithin(1, 0, 2);
        let firstIdx: number = -1;
        let firstVal: number = -1;
        for (const e of arr.entries()) {
          firstIdx = e[0];
          firstVal = e[1];
          break;
        }
        expect(firstIdx).assertEqual(0);
        expect(firstVal).assertEqual(15);
      }

      // --- [2] Verify the last key from keys() on a copyWithin(0,2,4) result equals length minus one ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
        arr.copyWithin(0, 2, 4);
        let lastKey: number = -1;
        for (const k of arr.keys()) {
          lastKey = k;
        }
        let lenMinusOne: number = arr.length - 1;
        expect(lastKey).assertEqual(lenMinusOne);
        expect(arr.$_get(0)).assertEqual(3);
      }

      // --- [3] Verify at(-1) on a copyWithin(1,3,5) result returns the unchanged last element ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8, 10);
        arr.copyWithin(1, 3, 5);
        expect(arr.at(-1)).assertEqual(10);
        expect(arr.indexOf(8)).assertEqual(1);
      }

      // --- [4] Verify a Set built from a from(another Int16Array) source after copyWithin(1,0,2) has the expected size ---
      {
        let base: Int16Array = Int16Array.of(4, 9, 9);
        let arr: Int16Array = Int16Array.from(base);
        arr.copyWithin(1, 0, 2);
        let st: Set<int> = new Set<int>();
        for (let i: int = 0; i < arr.length; i++) {
          st.add(arr.$_get(i).toInt());
        }
        expect(st.size).assertEqual(2);
      }

      // --- [5] Verify copyWithin on a with() result shifts the elements after the substituted slot to the front ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4).with(0, 9);
        arr.copyWithin(0, 1);
        expect(arr.join(',')).assertEqual('2,3,4,4');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_1400
     * @tc.name int16ArrayCopyWithinPart03Test014
     * @tc.desc Merged batch (4 tests): post-copy reads and derived consumers: entries count, values scan, copied head read and copy-constructed entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify entries() on a copyWithin(2,0,2) result counts the entries matching an element value ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        arr.copyWithin(2, 0, 2);
        let matchCount: number = 0;
        for (const e of arr.entries()) {
          if (e[1] === 2) {
            matchCount = matchCount + 1;
          }
        }
        expect(matchCount).assertEqual(2);
      }

      // --- [2] Verify copyWithin(0,2) shifts the trailing elements to the front as read by a values() scan ---
      {
        let arr: Int16Array = Int16Array.of(7, 7, 3, 5);
        arr.copyWithin(0, 2);
        let firstAbove: number = -1;
        for (const v of arr.values()) {
          if (v > 4) {
            firstAbove = v;
            break;
          }
        }
        expect(firstAbove).assertEqual(5);
      }

      // --- [3] Verify at(0) on a copyWithin(0,3,5) result of a from(Map.values()) array returns the copied head ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 4);
        m.set('b', 8);
        m.set('c', 12);
        m.set('d', 16);
        m.set('e', 20);
        let arr: Int16Array = Int16Array.from(m.values());
        arr.copyWithin(0, 3, 5);
        expect(arr.at(0)).assertEqual(16);
      }

      // --- [4] Verify entries() on a copyWithin(1,0,2) result of a copy-constructed array exposes the copied element at index 1 ---
      {
        let base: Int16Array = Int16Array.of(3, 7, 11);
        let arr: Int16Array = new Int16Array(base);
        arr.copyWithin(1, 0, 2);
        let idx1: number = -1;
        for (const e of arr.entries()) {
          if (e[0] === 1) {
            idx1 = e[1];
          }
        }
        expect(idx1).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_1500
     * @tc.name int16ArrayCopyWithinPart03Test015
     * @tc.desc Merged batch (5 tests): construction sources: return metadata, set() from a copy, Map.values window, negative index and mapfn window.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin() return metadata: typeof object, byteLength equals 2 times length, BYTES_PER_ELEMENT equals 2, length is an int, and $_set on the result mutates the original ---
      {
        let arr: Int16Array = Int16Array.of(32767 as short, -1 as short, 3 as short);
        let ret: Int16Array = arr.copyWithin(0, 1);
        expect(typeof ret).assertEqual('object');
        expect(ret.byteLength).assertEqual(2 * ret.length);
        expect(ret.BYTES_PER_ELEMENT).assertEqual(2);
        expect(ret.byteLength).assertEqual(6);
        expect(typeof ret.length).assertEqual('int');
        ret.$_set(0, 99 as short);
        expect(arr.$_get(0)).assertEqual(99);
      }

      // --- [2] Verify set(Int16Array) copies elements from a copyWithin() result of an array built from an Array literal into an array built by of() ---
      {
        let srcArray: Int16Array = new Int16Array([1, 2, 3, 4]);
        let dst: Int16Array = Int16Array.of(0, 0, 0, 0);
        dst.set(srcArray.copyWithin(0, 2, 4));
        expect(dst.$_get(0)).assertEqual(3);
        expect(dst.$_get(3)).assertEqual(4);
      }

      // --- [3] Verify copyWithin(0,1,4) on a from(Map.values()) array copies the window to the front ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('p', 5);
        m.set('q', 6);
        m.set('r', 7);
        m.set('s', 8);
        let arr: Int16Array = Int16Array.from(m.values());
        arr.copyWithin(0, 1, 4);
        expect(arr.join(',')).assertEqual('6,7,8,8');
      }

      // --- [4] Verify copyWithin(0,-1) on a length-constructed array filled via $_set copies the last element to index 0 ---
      {
        let arr: Int16Array = new Int16Array(4);
        for (let i: int = 0; i < 4; i++) {
          arr.$_set(i, i + 1);
        }
        arr.copyWithin(0, -1);
        expect(arr.$_get(0)).assertEqual(4);
        expect(arr.$_get(1)).assertEqual(2);
      }

      // --- [5] Verify copyWithin(2,0,2) on an array built by from(Array, mapfn) copies the source window to indices 2,3 as read via at ---
      {
        let src: int[] = [7, 8, 9, 10];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v * 2);
        arr.copyWithin(2, 0, 2);
        expect(arr.at(2)).assertEqual(14);
        expect(arr.$_get(3)).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_1600
     * @tc.name int16ArrayCopyWithinPart03Test016
     * @tc.desc Merged batch (3 tests): clamping, negative and no-op forms: end beyond length, negative end, and simultaneous negative-start/oversized-end clamping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin(3,0,10) clamps an end beyond length and copies the leading window onto the trailing slots ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
        arr.copyWithin(3, 0, 10);
        let want: number[] = [1, 2, 3, 1, 2, 3];
        expect(Array.from(arr)).assertDeepEquals(want);
      }

      // --- [2] Verify three-arg copyWithin() with a negative end clamps it relative to length ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        let ret: Int16Array = arr.copyWithin(0, 2, -1);
        ret.$_get(0);
        expect(arr.$_get(0)).assertEqual(30);
        expect(arr.$_get(1)).assertEqual(40);
        expect(arr.$_get(2)).assertEqual(30);
      }

      // --- [3] Verify three-arg copyWithin() clamps a negative start and an end past length simultaneously ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        arr.copyWithin(0, -1, 6);
        expect(arr.$_get(0)).assertEqual(50);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_1700
     * @tc.name int16ArrayCopyWithinPart03Test017
     * @tc.desc Merged batch (4 tests): copyWithin argument matrix: multi-element window, interior window, copy-of-copy and a [2,4) window moved to the front.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify three-arg copyWithin() copies a multi-element source window onto earlier slots ---
      {
        let arr: Int16Array = Int16Array.of(100 as short, 200 as short, 32767 as short, -1 as short);
        let ret: Int16Array = arr.copyWithin(0, 1, 3);
        expect(ret.$_get(0)).assertEqual(200);
        expect(ret.$_get(1)).assertEqual(32767);
      }

      // --- [2] Verify copyWithin(2,0,3) copies the leading window onto the interior slots ---
      {
        let arr: Int16Array = Int16Array.of(4, 8, 12, 16, 20);
        arr.copyWithin(2, 0, 3);
        expect(arr.join(',')).assertEqual('4,8,4,8,12');
      }

      // --- [3] Verify copyWithin result can be source of another copyWithin ---
      {
        let arr: Int16Array = Int16Array.of(100 as short, 200 as short, 32767 as short, -1 as short, 3 as short, -3 as short);
        let ret: Int16Array = arr.copyWithin(0, 2);
        let ret2: Int16Array = ret.copyWithin(2, 0, 2);
        expect(ret2.$_get(2)).assertEqual(32767);
        expect(ret2.$_get(3)).assertEqual(-1);
      }

      // --- [4] Verify three-arg copyWithin(0,2,4) copies indices 2,3 onto 0,1 on 5- and 4-element arrays ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        arr.copyWithin(0, 2, 4);
        expect(arr.$_get(0)).assertEqual(30);
        expect(arr.$_get(1)).assertEqual(40);
        expect(arr.$_get(2)).assertEqual(30);

        let arr2: Int16Array = Int16Array.of(100, 200, 300, 400);
        arr2.copyWithin(0, 2, 4);
        expect(arr2.$_get(0)).assertEqual(300);
        expect(arr2.$_get(1)).assertEqual(400);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART03_1800
     * @tc.name int16ArrayCopyWithinPart03Test018
     * @tc.desc Merged batch (5 tests): copyWithin argument matrix: leading-to-trailing window, single middle element, single overwrite, duplicated leading pair and two-element copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin(2,0,4) copies the leading window onto the trailing slots ---
      {
        let arr: Int16Array = Int16Array.of(500, 1500, 2500, 3500, 4500, 5500);
        arr.copyWithin(2, 0, 4);
        let sum: number = 0;
        arr.forEach((value: number): void => {
          sum = sum + value;
        });
        expect(sum).assertEqual(10000);
      }

      // --- [2] Verify copyWithin(2,1,2) writes a single source element into the middle slot ---
      {
        let s: Set<int> = new Set<int>();
        s.add(12);
        s.add(34);
        s.add(56);
        s.add(78);
        s.add(90);
        let arr: Int16Array = Int16Array.from(s);
        arr.copyWithin(2, 1, 2);
        expect(arr.join(',')).assertEqual('12,34,34,78,90');
      }

      // --- [3] Verify copyWithin(0,2,3) overwrites the first slot with a single later element ---
      {
        let base: Int16Array = Int16Array.of(128, 256, 512, 1024);
        let arr: Int16Array = Int16Array.from(base);
        arr.copyWithin(0, 2, 3);
        expect(arr.$_get(0)).assertEqual(512);
        expect(arr.$_get(3)).assertEqual(1024);
      }

      // --- [4] Verify copyWithin(1,0,2) duplicates the leading pair into indices 1 and 2 ---
      {
        let arr: Int16Array = new Int16Array(4);
        arr.$_set(0, 500);
        arr.$_set(1, 1500);
        arr.$_set(2, 2500);
        arr.$_set(3, 3500);
        arr.copyWithin(1, 0, 2);
        expect(arr.$_get(1)).assertEqual(500);
        expect(arr.$_get(2)).assertEqual(1500);
        expect(arr.$_get(3)).assertEqual(3500);
      }

      // --- [5] Verify copyWithin(0, 2, 4) copies two elements to indices 0-1 ---
      {
        let arr: Int16Array = Int16Array.of(32767, -32768, 128, 256);
        arr.copyWithin(0, 2, 4);
        expect(arr.$_get(0)).assertEqual(128);
        expect(arr.$_get(1)).assertEqual(256);

        let arr2: Int16Array = Int16Array.of(-100, -200, -300, -400, -500);
        arr2.copyWithin(0, 2, 4);
        expect(arr2.$_get(0)).assertEqual(-300);
        expect(arr2.$_get(1)).assertEqual(-400);
      }
    });

  });
}
