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

export default function int16ArraySortPart03Test(): void {
  describe('Int16ArraySortPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_0100
     * @tc.name int16ArraySortPart03Test001
     * @tc.desc Merged batch (2 tests): compareFn errors: an Error on the first comparison keeping the original order and a mid-sort throw preserving the length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort(compareFn) throwing Error on first comparison keeps original order ---
      {
        let arr: Int16Array = Int16Array.of(3, 1, 2);
        try {
          arr.sort((a: number, b: number): int => { throw new Error("first compare"); });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(arr.$_get(0)).assertEqual(3);
          expect(arr.$_get(1)).assertEqual(1);
          expect(arr.$_get(2)).assertEqual(2);
        }
      }

      // --- [2] Verify a compareFn throwing mid-sort propagates the error and keeps the array length ---
      {
        let callCount: int = 0;
        let arr: Int16Array = Int16Array.of(5, 1, 4, 2, 3);
        try {
          arr.sort((a: number, b: number): int => {
            callCount = callCount + 1;
            if (callCount === 3) { throw new Error('mid sort error'); }
            return (a - b).toInt();
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(callCount).assertEqual(3);
        expect(arr.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_0200
     * @tc.name int16ArraySortPart03Test002
     * @tc.desc Merged batch (3 tests): bounds, wrapping and truncation before ordering: int extremes descending and ascending, NaN and +Infinity reading as zero with order kept, and copied boundaries ascending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify int.MAX and int.MIN compareFn returns order descending for MAX-first and ascending for MIN-first ---
      {
        let sources: int[][] = [[0, -1, 32767], [32767, 0, -1]];
        let descending: boolean[] = [true, false];
        let expected: int[][] = [[32767, 0, -1], [-1, 0, 32767]];
        for (let i: int = 0; i < sources.length; i++) {
          let arr: Int16Array = Int16Array.from(sources[i]);
          let desc: boolean = descending[i];
          arr.sort((a: number, b: number): int => {
            if (a < b) { return desc ? 2147483647 : -2147483648; }
            if (a > b) { return desc ? -2147483648 : 2147483647; }
            return 0;
          });
          for (let j: int = 0; j < expected[i].length; j++) {
            expect(arr.$_get(j)).assertEqual(expected[i][j]);
          }
        }
      }

      // --- [2] Verify sort() treats NaN and +Infinity both as 0 and keeps relative order ---
      {
        let arr: Int16Array = new Int16Array(4);
        arr.$_set(0, Double.NaN);
        arr.$_set(1, Double.POSITIVE_INFINITY);
        arr.$_set(2, -1);
        arr.$_set(3, 32767);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-1);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(0);
        expect(arr.$_get(3)).assertEqual(32767);
      }

      // --- [3] Verify default sort on an array built by from(another Int16Array) of int16 boundaries yields ascending boundary order ---
      {
        let src: Int16Array = Int16Array.of(32767, -32768, 0);
        let arr: Int16Array = Int16Array.from(src);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(32767);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_0300
     * @tc.name int16ArraySortPart03Test003
     * @tc.desc Merged batch (4 tests): bounds, wrapping and truncation before ordering: hex 0x8000 leaving the pair, int32.MIN reversing a full range, ±2147483648/2147483649 wrapping to swap or keep, and Double.MAX via toInt.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a compareFn returning the hex literal 0x8000 leaves the pair order unchanged ---
      {
        let arr: Int16Array = Int16Array.of(-32768, 0);
        arr.sort((a: number, b: number): int => { return 0x8000; });
        let want: number[] = [-32768, 0];
        expect(Array.from(arr)).assertDeepEquals(want);
      }

      // --- [2] Verify sort() compareFn returning int32.MIN -2147483648 reverses a full-range array ---
      {
        let arr: Int16Array = Int16Array.of(-32768, 0, 32767);
        arr.sort((a: number, b: number): int => { return -2147483648; });
        expect(arr.$_get(0)).assertEqual(32767);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(-32768);
      }

      // --- [3] Verify 2147483648 and 2147483649 wrap negative to swap while -2147483649 wraps positive to keep order ---
      {
        let sources: int[][] = [[1, 0], [0, -32768], [-32768, 0]];
        let expected: int[][] = [[0, 1], [-32768, 0], [-32768, 0]];
        for (let i: int = 0; i < sources.length; i++) {
          let arr: Int16Array = Int16Array.from(sources[i]);
          let which: int = i;
          arr.sort((a: number, b: number): int => {
            if (which === 0) { return (2147483648).toInt(); }
            if (which === 1) { return (2147483649).toInt(); }
            return (-2147483649).toInt();
          });
          for (let j: int = 0; j < expected[i].length; j++) {
            expect(arr.$_get(j)).assertEqual(expected[i][j]);
          }
        }
      }

      // --- [4] Verify a compareFn returning Double.MAX converted via toInt keeps the pair order unchanged ---
      {
        let arr: Int16Array = Int16Array.of(0, -32768);
        arr.sort((a: number, b: number): int => { return (1.7976931348623157e+308).toInt(); });
        expect(arr.$_get(0)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_0400
     * @tc.name int16ArraySortPart03Test004
     * @tc.desc Merged batch (5 tests): views and shared buffers: a sorted slice copy, a zero-length view leaving its sibling untouched, subarray(0) length and first element, sibling visibility and descending sort mutating shared data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort() chained with slice() yields a sorted subarray copy ---
      {
        let arr: Int16Array = Int16Array.of(32767, -32768, 0);
        let sliced: Int16Array = arr.sort().slice(0, 2);
        expect(sliced.$_get(0)).assertEqual(-32768);
        expect(sliced.$_get(1)).assertEqual(0);
        expect(sliced.length).assertEqual(2);
      }

      // --- [2] Verify sort() on a zero-length view leaves the sibling view's data unchanged ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let full: Int16Array = new Int16Array(buf);
        full.$_set(0, 4);
        full.$_set(1, 1);
        full.$_set(2, 3);
        full.$_set(3, 2);
        let v: Int16Array = new Int16Array(buf, 4, 0);
        expect(v.sort()).assertEqual(v);
        expect(v.length).assertEqual(0);
        expect(full.join(',')).assertEqual('4,1,3,2');
      }

      // --- [3] Verify sort().subarray(0) chain keeps the length and reads the sorted first element ---
      {
        let arr: Int16Array = new Int16Array([3, 0, 0]);
        let sub: Int16Array = arr.sort().subarray(0);
        expect(sub.length).assertEqual(3);
        expect(sub.$_get(0)).assertEqual(0);
      }

      // --- [4] Verify sort() on shared-buffer view is visible to sibling views ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 3);
        arr.$_set(1, 0);
        arr.$_set(2, 0);
        arr.sort();
        let view2: Int16Array = new Int16Array(buf);
        expect(view2.$_get(0)).assertEqual(0);
        expect(view2.$_get(1)).assertEqual(0);
        expect(view2.$_get(2)).assertEqual(3);

        let buf2: ArrayBuffer = new ArrayBuffer(6);
        let parent: Int16Array = new Int16Array(buf2);
        parent.$_set(0, 3);
        parent.$_set(1, 0);
        parent.$_set(2, 0);
        parent.sort();
        let child: Int16Array = parent.subarray(0);
        expect(child.$_get(0)).assertEqual(0);
        expect(child.$_get(1)).assertEqual(0);
        expect(child.$_get(2)).assertEqual(3);
      }

      // --- [5] Verify sort((a,b)=>b-a) on a buffer view mutates the shared underlying data ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 0);
        arr.$_set(1, 3);
        arr.$_set(2, 0);
        arr.sort((a: number, b: number): int => { return (b - a).toInt(); });
        let view2: Int16Array = new Int16Array(buf);
        expect(view2.$_get(0)).assertEqual(3);
        expect(view2.$_get(1)).assertEqual(0);
        expect(view2.$_get(2)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_0500
     * @tc.name int16ArraySortPart03Test005
     * @tc.desc Merged batch (3 tests): compareFn return-value semantics: negatives grouped first by sign, an inline ternary yielding descending order and a positive 131072 leaving the pair.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort() compareFn returning -1 when a < 0 and b >= 0 groups negatives first ---
      {
        let arr: Int16Array = Int16Array.of(0, -100, 32767, -32768);
        arr.sort((a: number, b: number): int => {
          let aNeg: boolean = a < 0;
          let bNeg: boolean = b < 0;
          if (aNeg && !bNeg) { return -1; }
          if (!aNeg && bNeg) { return 1; }
          return (a - b).toInt();
        });
        let r_1: boolean = arr.$_get(0) < 0;
        expect(r_1).assertTrue();

        let r_2: boolean = arr.$_get(1) < 0;
        expect(r_2).assertTrue();

        let r_3: boolean = arr.$_get(2) >= 0;
        expect(r_3).assertTrue();

        let r_4: boolean = arr.$_get(3) >= 0;
        expect(r_4).assertTrue();
      }

      // --- [2] Verify an inline ternary compareFn returning -1/1/0 yields descending order ---
      {
        let arr: Int16Array = Int16Array.of(-100, 0, 100, 32767);
        arr.sort((a: number, b: number): int => a > b ? -1 : (a < b ? 1 : 0));
        expect(arr.$_get(0)).assertEqual(32767);
        expect(arr.$_get(1)).assertEqual(100);
        expect(arr.$_get(2)).assertEqual(0);
        expect(arr.$_get(3)).assertEqual(-100);
      }

      // --- [3] Verify sort() compareFn returning 131072 (positive int32) keeps the pair order unchanged ---
      {
        let arr: Int16Array = Int16Array.of(0, -32768);
        arr.sort((a: number, b: number): int => { return 131072; });
        let head: number | undefined = arr.at(0);
        let tail: number | undefined = arr.at(1);
        expect(head).assertEqual(0);
        expect(tail).assertEqual(-32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_0600
     * @tc.name int16ArraySortPart03Test006
     * @tc.desc Merged batch (5 tests): construction sources: Set returning the same reference, copy-construction with the source untouched, identity-mapfn, $_set-filled and copied sources ascending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify default sort() on from(Set) arrays returns the same array reference and ascending values ---
      {
        let first: Set<int> = new Set<int>();
        first.add(30);
        first.add(10);
        first.add(20);
        let second: Set<int> = new Set<int>();
        second.add(2);
        second.add(1);
        second.add(3);
        let sets: Set<int>[] = [first, second];
        let expected: string[] = ['10,20,30', '1,2,3'];
        for (let k: int = 0; k < sets.length; k++) {
          let arr: Int16Array = Int16Array.from(sets[k]);
          let r: Int16Array = arr.sort();
          expect(r).assertEqual(arr);
          expect(r.join(',')).assertEqual(expected[k]);
        }
      }

      // --- [2] Verify default sort on a copy-constructed array yields ascending order leaving the source unmutated ---
      {
        let src: Int16Array = Int16Array.of(5, 1, 3);
        let cp: Int16Array = new Int16Array(src);
        let r: Int16Array = cp.sort();
        expect(r.$_get(0)).assertEqual(1);
        expect(r.$_get(2)).assertEqual(5);
        expect(src.$_get(0)).assertEqual(5);
      }

      // --- [3] Verify default sort on an array built by from(Array, identity mapfn) yields ascending order ---
      {
        let src: int[] = [9, 4, 7, 1, 5];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v);
        arr.sort();
        expect(arr.join(',')).assertEqual('1,4,5,7,9');
      }

      // --- [4] Verify default sort on a length-constructed array filled via $_set yields ascending order ---
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 5);
        arr.$_set(1, 2);
        arr.$_set(2, 8);
        let r: Int16Array = arr.sort();
        expect(r.$_get(0)).assertEqual(2);
        expect(r.$_get(2)).assertEqual(8);
      }

      // --- [5] Verify sort(a-b) ascending on a copy-constructed array yields ascending order ---
      {
        let src: Int16Array = Int16Array.of(6, 2, 4);
        let cp: Int16Array = new Int16Array(src);
        let r: Int16Array = cp.sort((a: number, b: number): int => (a - b).toInt());
        expect(r.$_get(0)).assertEqual(2);
        expect(r.$_get(2)).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_0700
     * @tc.name int16ArraySortPart03Test007
     * @tc.desc Merged batch (5 tests): construction sources: equal elements kept from mapfn, same-reference $_set-filled result, copy-constructed with zero in the middle, Map values join text and copied length/endpoints.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify default sort on an array built by from(Array, identity mapfn) keeps both equal elements ---
      {
        let src: int[] = [30000, 30000];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v);
        let r: Int16Array = arr.sort();
        expect(r.length).assertEqual(2);
        expect(r.$_get(0)).assertEqual(30000);
        expect(r.$_get(1)).assertEqual(30000);
      }

      // --- [2] Verify default sort on a length-constructed array filled via $_set returns the same reference ---
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 1);
        arr.$_set(1, 2);
        arr.$_set(2, 3);
        expect(arr.sort()).assertEqual(arr);
      }

      // --- [3] Verify default sort on a copy-constructed array yields ascending order with 0 in the middle ---
      {
        let cp: Int16Array = new Int16Array(Int16Array.of(0, -1, 1));
        let r: Int16Array = cp.sort();
        expect(r.at(-1)).assertEqual(1);
        expect(r.at(0)).assertEqual(-1);
      }

      // --- [4] Verify default sort on an array built by from(Map.values()) joins in ascending text order ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('m', 5);
        m.set('n', 1);
        m.set('o', 3);
        let arr: Int16Array = Int16Array.from(m.values());
        arr.sort();
        expect(arr.join(',')).assertEqual('1,3,5');
      }

      // --- [5] Verify default sort on an array built by from(another Int16Array) keeps length and ordered endpoints ---
      {
        let src: Int16Array = Int16Array.of(8, 3, 5, 1);
        let arr: Int16Array = Int16Array.from(src);
        arr.sort();
        expect(arr.length).assertEqual(4);
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(3)).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_0800
     * @tc.name int16ArraySortPart03Test008
     * @tc.desc Merged batch (5 tests): return value and chaining: map, filter, reduce and reduceRight over the sorted result, and lastIndexOf on the sorted array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort().map(callback) chain maps the sorted elements ---
      {
        let arr: Int16Array = new Int16Array([3, 0]);
        let mapped: Int16Array = arr.sort().map((v: number): number => (v * 2));
        expect(mapped.$_get(0)).assertEqual(0);
        expect(mapped.$_get(1)).assertEqual(6);
      }

      // --- [2] Verify sort().filter(predicate) chain keeps only the matching element ---
      {
        let arr: Int16Array = new Int16Array([0, 3, 0]);
        let filtered: Int16Array = arr.sort().filter((v: number): boolean => v > 0 as number);
        expect(filtered.length).assertEqual(1);
        expect(filtered.$_get(0)).assertEqual(3);
        expect(arr.join(',')).assertEqual('0,0,3');
      }

      // --- [3] Verify sort().reduce(callback,init) chain sums the sorted elements ---
      {
        let arr: Int16Array = new Int16Array([3, 0, 0]);
        expect(arr.sort().reduce((acc: number, v: number): number => (acc + v), 0)).assertEqual(3);
        expect(arr.$_get(0)).assertEqual(0);
      }

      // --- [4] Verify sort().reduceRight(callback,init) chain sums the sorted elements ---
      {
        let arr: Int16Array = new Int16Array([0, 3]);
        expect(arr.sort().reduceRight((acc: number, v: number): number => (acc + v), 0)).assertEqual(3);
        let second: number | undefined = arr.at(1);
        expect(second).assertEqual(3);
      }

      // --- [5] Verify sort().lastIndexOf query on the sorted array returns the last matching index ---
      {
        let arr: Int16Array = new Int16Array([3, 0, 0]);
        expect(arr.sort().lastIndexOf(0)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_0900
     * @tc.name int16ArraySortPart03Test009
     * @tc.desc Merged batch (5 tests): post-sort reads and derived consumers: entries totals with byteLength, at(0)/at(-1) minimum and maximum, ascending entries values, values().next() and keys().next().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterating sort() result with entries() sums all values and preserves the element byteLength ---
      {
        let arr: Int16Array = Int16Array.of(6, 2, 4, 8);
        arr.sort();
        let runningSum: number = 0;
        for (const e of arr.entries()) {
          runningSum = runningSum + e[1];
        }
        expect(runningSum).assertEqual(20);
        expect(arr.byteLength).assertEqual(8);
        expect(arr.join(',')).assertEqual('2,4,6,8');
      }

      // --- [2] Verify at(0) and at(-1) on the sort() result return the minimum and maximum respectively ---
      {
        let arr: Int16Array = Int16Array.of(11, 3, 7);
        arr.sort();
        let first: number | undefined = arr.at(0);
        let last: number | undefined = arr.at(-1);
        expect(first).assertEqual(3);
        expect(last).assertEqual(11);
      }

      // --- [3] Verify iterating the sort() result with entries() reads the values in ascending order ---
      {
        let arr: Int16Array = Int16Array.of(9, 4, 7);
        arr.sort();
        let seq: string = '';
        for (const e of arr.entries()) {
          seq = seq + e[1].toString() + ',';
        }
        expect(seq).assertEqual('4,7,9,');
      }

      // --- [4] Verify sort() then values().next() yields the first element of the sorted array ---
      {
        let arr: Int16Array = new Int16Array([3, 0]);
        arr.sort();
        let iter: IterableIterator<Number> = arr.values();
        let nxt: IteratorResult<Number> = iter.next();
        expect(nxt.value!).assertEqual(0);
      }

      // --- [5] Verify sort() then keys().next() yields the first index of the sorted array ---
      {
        let arr: Int16Array = new Int16Array([0, 3]);
        arr.sort();
        let iter: IterableIterator<int> = arr.keys();
        let nxt: IteratorResult<int> = iter.next();
        expect(nxt.value).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_1000
     * @tc.name int16ArraySortPart03Test010
     * @tc.desc Merged batch (2 tests): default ascending order and stability: boundary, opposite-sign and full-range data sorted upward, and duplicate zeros sorted up then down.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort((a,b)=>a-b) orders boundary, opposite-signed and full-range datasets ascending ---
      {
        let datasets: number[][] = [[32767, 100, -50, 0], [3, -3], [32767, -32768, 100, -100, 0]];
        let expected: string[] = ['-50,0,100,32767', '-3,3', '-32768,-100,0,100,32767'];
        for (let d: int = 0; d < datasets.length; d++) {
          let arr: Int16Array = Int16Array.from(datasets[d]);
          arr.sort((a: number, b: number): int => (a - b).toInt());
          expect(arr.join(',')).assertEqual(expected[d]);
        }
      }

      // --- [2] Verify sort(compareFn a-b) then b-a on an array with duplicate zeros yields ascending then descending order ---
      {
        let arr: Int16Array = new Int16Array([3, 0, 0]);
        arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(3);
        arr.sort((a: number, b: number): int => { return (b - a).toInt(); });
        expect(arr.join(',')).assertEqual('3,0,0');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_1100
     * @tc.name int16ArraySortPart03Test011
     * @tc.desc Merged batch (5 tests): compareFn errors: a throw on every even call, a late throw propagating unchanged, an Error after a side effect, RangeError over Set and Error over a $_set-filled source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a sort() compareFn that throws on every even invocation propagates the error ---
      {
        let count: int = 0;
        let arr: Int16Array = Int16Array.of(7, 3, 9, 1, 5);
        try {
          arr.sort((a: number, b: number): int => {
            count = count + 1;
            if (count % 2 === 0) { throw new TypeError("even call error"); }
            return (a - b).toInt();
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
      }

      // --- [2] Verify a sort() compareFn that throws after several comparisons propagates the error unchanged ---
      {
        let hitCount: int = 0;
        let arr: Int16Array = Int16Array.of(4, 1, 3, 2);
        try {
          arr.sort((a: number, b: number): int => {
            hitCount = hitCount + 1;
            if (hitCount >= 5) { throw new Error("threshold exceeded"); }
            return (a - b).toInt();
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.message).assertEqual('threshold exceeded');
        }
      }

      // --- [3] Verify sort(compareFn) throwing Error after side effect updates external state ---
      {
        let sideEffect: int = 0;
        let arr: Int16Array = Int16Array.of(6, 2, 4);
        try {
          arr.sort((a: number, b: number): int => {
            sideEffect = sideEffect + 10;
            throw new Error("side effect error");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(sideEffect).assertEqual(10);
        }
      }

      // --- [4] Verify sort compareFn throwing RangeError on an array built by from(Set) propagates RangeError ---
      {
        let s: Set<int> = new Set<int>();
        s.add(2);
        s.add(1);
        let arr: Int16Array = Int16Array.from(s);
        try {
          arr.sort((a: number, b: number): int => {
            throw new RangeError('set sort range error');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      // --- [5] Verify sort compareFn throwing Error on a length-3 Int16Array filled via $_set propagates Error ---
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 9);
        arr.$_set(1, 4);
        arr.$_set(2, 7);
        try {
          arr.sort((a: number, b: number): int => {
            throw new Error('length ctor sort error');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_1200
     * @tc.name int16ArraySortPart03Test012
     * @tc.desc Merged batch (5 tests): bounds, wrapping and truncation before ordering: Array.from ends giving min and max, 32767/-32768 signs, 32768/-32769 overflow boundaries, NaN to zero and underflow truncation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify converting the sort() result with Array.from() yields an array whose ends are the min and max ---
      {
        let arr: Int16Array = Int16Array.of(6, 2, 9, 4);
        arr.sort();
        let copy: number[] = Array.from(arr);
        expect(copy[0]).assertEqual(2);
        expect(copy[copy.length - 1]).assertEqual(9);
      }

      // --- [2] Verify constant compareFn returns 32767 and -32768 are treated as positive and negative ---
      {
        let constants: int[] = [32767, -32768];
        let expected: int[][] = [[1, 2], [2, 1]];
        for (let i: int = 0; i < constants.length; i++) {
          let value: int = constants[i];
          let arr: Int16Array = Int16Array.of(1, 2);
          arr.sort((a: number, b: number): int => { return value; });
          expect(arr.$_get(0)).assertEqual(expected[i][0]);
          expect(arr.$_get(1)).assertEqual(expected[i][1]);
        }
      }

      // --- [3] Verify sort(compareFn) returning 32768/-32769 overflow boundary preserves element set ---
      {
        let arr1: Int16Array = Int16Array.of(100, 200);
        arr1.sort((a: number, b: number): int => { return 32768; });
        expect(arr1.$_get(0)).assertEqual(100);

        let sum1: number = 0;
        for (let i: int = 0; i < arr1.length; i++) {
          sum1 = sum1 + arr1.$_get(i);
        }
        expect(sum1).assertEqual(300);

        let arr2: Int16Array = Int16Array.of(200, 100);
        arr2.sort((a: number, b: number): int => { return -32769; });
        let sum2: number = 0;
        for (let i: int = 0; i < arr2.length; i++) {
          sum2 = sum2 + arr2.$_get(i);
        }
        expect(sum2).assertEqual(300);
      }

      // --- [4] Verify sort() converts NaN elements to 0 before ordering ---
      {
        let arr1: Int16Array = new Int16Array(3);
        arr1.$_set(0, Double.NaN);
        arr1.$_set(1, Double.NaN);
        arr1.$_set(2, Double.NaN);
        arr1.sort();
        expect(arr1.$_get(0)).assertEqual(0);
        expect(arr1.$_get(1)).assertEqual(0);
        expect(arr1.$_get(2)).assertEqual(0);

        let arr2: Int16Array = new Int16Array(3);
        arr2.$_set(0, 5);
        arr2.$_set(1, Double.NaN);
        arr2.$_set(2, -1);
        arr2.sort();
        expect(arr2.$_get(0)).assertEqual(-1);
      }

      // --- [5] Verify sort() truncates underflow/overflow elements before ordering ---
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 0);
        arr.$_set(1, 100);
        arr.$_set(2, -32769 as number);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(32767);

        let arr2: Int16Array = new Int16Array(3);
        arr2.$_set(0, 0);
        arr2.$_set(1, 100);
        arr2.$_set(2, 32768 as number);
        arr2.sort();
        expect(arr2.$_get(0)).assertEqual(-32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_1300
     * @tc.name int16ArraySortPart03Test013
     * @tc.desc Merged batch (4 tests): bounds, wrapping and truncation before ordering: 0x10000 truncated to zero, returns just outside versus exact bounds, 0x8000-offset overflow and ±65536/65537 keeping 3 before 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort on array where 0x10000 stored as 0 via truncation sorts with other zeros ---
      {
        let arr: Int16Array = Int16Array.of(-1, 0, 32767);
        arr.$_set(1, 0x10000);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-1);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(32767);
      }

      // --- [2] Verify compareFn 32768 and -32769 just outside plus exact 32767 and -32768 keep or swap by sign ---
      {
        let sources: int[][] = [[-32768, 0], [0, -32768], [0, -32768], [-32768, 0]];
        let constants: int[] = [32768, -32769, 32767, -32768];
        let expected: int[][] = [[-32768, 0], [-32768, 0], [0, -32768], [0, -32768]];
        for (let i: int = 0; i < sources.length; i++) {
          let arr: Int16Array = Int16Array.from(sources[i]);
          let constant: int = constants[i];
          arr.sort((a: number, b: number): int => { return constant; });
          for (let j: int = 0; j < expected[i].length; j++) {
            expect(arr.$_get(j)).assertEqual(expected[i][j]);
          }
        }
      }

      // --- [3] Verify sort on array where all elements overflow via 0x8000+ offset sorts by stored values ---
      {
        let arr: Int16Array = Int16Array.of(-100, -50, 0);
        arr.$_set(0, 0x8001);
        arr.$_set(1, 0x8000);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(-32767);
        expect(arr.$_get(2)).assertEqual(0);
      }

      // --- [4] Verify compareFn 65536 keeps order and -65537 swaps, both leaving 3 before 0 ---
      {
        let sources: int[][] = [[3, 0], [0, 3]];
        let constants: int[] = [65536, -65537];
        for (let i: int = 0; i < sources.length; i++) {
          let arr: Int16Array = Int16Array.from(sources[i]);
          let constant: int = constants[i];
          arr.sort((a: number, b: number): int => { return constant; });
          expect(arr.$_get(0)).assertEqual(3);
          expect(arr.$_get(1)).assertEqual(0);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_1400
     * @tc.name int16ArraySortPart03Test014
     * @tc.desc Single test: a view starting at a non-zero byteOffset sorts only the elements inside that view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify default sort() on a view with a non-zero byteOffset sorts only its own elements ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let arr: Int16Array = new Int16Array(buf, 2, 3);
        arr.$_set(0, 3);
        arr.$_set(1, 0);
        arr.$_set(2, 0);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_1500
     * @tc.name int16ArraySortPart03Test015
     * @tc.desc Merged batch (4 tests): custom compareFn orderings: ceil-halving over of() and copied sources, floor-halving with sum kept, round-halving smallest first and a Map-values ceil-halving join.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort with a Math.ceil-halving compareFn orders by the ceiling half for of() and from(another Int16Array) sources ---
      {
        let src: Int16Array = Int16Array.of(6, 1, 4);
        let arrays: Int16Array[] = [Int16Array.of(7, 2, 5), Int16Array.from(src)];
        let expected: string[] = ['2-5-7', '1-4-6'];
        for (let a: int = 0; a < arrays.length; a++) {
          arrays[a].sort((x: number, y: number): int => (Math.ceil(x / 2) - Math.ceil(y / 2)).toInt());
          expect(arrays[a].join('-')).assertEqual(expected[a]);
        }
      }

      // --- [2] Verify sort with a Math.floor-halving compareFn orders by the floor of half the element and keeps the element sum ---
      {
        let arr: Int16Array = Int16Array.of(9, 4, 1, 6);
        arr.sort((a: number, b: number): int => (Math.floor(a / 2) - Math.floor(b / 2)).toInt());
        expect(arr.reduce((acc: number, v: number, i: int, a2: Int16Array): number => acc + v, 0)).assertEqual(20);
        expect(arr.$_get(0)).assertEqual(1);
      }

      // --- [3] Verify sort with a Math.round-halving compareFn keeps the element sum and yields the smallest value first ---
      {
        let arr: Int16Array = Int16Array.of(6, 1, 4, 3);
        arr.sort((a: number, b: number): int => (Math.round(a / 2) - Math.round(b / 2)).toInt());
        expect(arr.reduce((acc: number, v: number, i: int, a2: Int16Array): number => acc + v, 0)).assertEqual(14);
        expect(arr.$_get(0)).assertEqual(1);
      }

      // --- [4] Verify a Math.ceil-halving compareFn on an array built by from(Map.values()) joins in ascending text order ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('x', 4);
        m.set('y', 1);
        m.set('z', 6);
        let arr: Int16Array = Int16Array.from(m.values());
        arr.sort((a: number, b: number): int => (Math.ceil(a / 2) - Math.ceil(b / 2)).toInt());
        expect(arr.join('-')).assertEqual('1-4-6');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_1600
     * @tc.name int16ArraySortPart03Test016
     * @tc.desc Merged batch (4 tests): construction sources: copied-source ascending with the source unmutated, copied-source descending join, and Map values ascending and descending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify default sort on an array built by from(another Int16Array) yields ascending order while the source stays unmutated ---
      {
        let src: Int16Array = Int16Array.of(30, 10, 20);
        let arr: Int16Array = Int16Array.from(src);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(10);
        expect(arr.$_get(1)).assertEqual(20);
        expect(arr.$_get(2)).assertEqual(30);
        expect(src.$_get(0)).assertEqual(30);
      }

      // --- [2] Verify sort(b-a) descending on an array built by from(another Int16Array) joins in descending text order ---
      {
        let src: Int16Array = Int16Array.of(5, 2, 9);
        let arr: Int16Array = Int16Array.from(src);
        arr.sort((a: number, b: number): int => (b - a).toInt());
        expect(arr.join('-')).assertEqual('9-5-2');
      }

      // --- [3] Verify default sort on an array built by from(Map.values()) uses the map values ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 3);
        m.set('b', 1);
        m.set('c', 2);
        let arr: Int16Array = Int16Array.from(m.values());
        arr.sort();
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(2)).assertEqual(3);
      }

      // --- [4] Verify sort(b-a) on an array built by from(Map.values()) yields descending text order ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 3);
        m.set('b', 1);
        m.set('c', 2);
        let arr: Int16Array = Int16Array.from(m.values());
        arr.sort((a: number, b: number): int => (b - a).toInt());
        expect(arr.join(',')).assertEqual('3,2,1');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_1700
     * @tc.name int16ArraySortPart03Test017
     * @tc.desc Single test: Map keys read through from() sort numerically, so the least key comes first.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify default sort on an array built by from(Map.keys()) keeps the smallest key first ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(5, 'e');
        m.set(2, 'b');
        m.set(4, 'd');
        let arr: Int16Array = Int16Array.from(m.keys());
        arr.sort();
        expect(arr.join('-')).assertEqual('2-4-5');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_1800
     * @tc.name int16ArraySortPart03Test018
     * @tc.desc Merged batch (2 tests): return value and chaining: includes on the sorted result and ascending-then-descending comparators ending descending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort().includes query on the sorted array returns true ---
      {
        let arr: Int16Array = new Int16Array([0, 3]);
        let found: boolean = arr.sort().includes(3);
        expect(found).assertTrue();
        expect(arr.lastIndexOf(3)).assertEqual(1);
      }

      // --- [2] Verify chaining ascending then descending compareFns leaves the array descending ---
      {
        let arr: Int16Array = new Int16Array([3, 0, 0]);
        arr.sort((a: number, b: number): int => { return (a - b).toInt(); })
           .sort((a: number, b: number): int => { return (b - a).toInt(); });
        expect(arr.$_get(0)).assertEqual(3);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_1900
     * @tc.name int16ArraySortPart03Test019
     * @tc.desc Merged batch (2 tests): post-sort reads and derived consumers: contiguous entries indexes from zero and at(0) returning the minimum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterating sort() result with entries() exposes contiguous indexes starting at 0 ---
      {
        let arr: Int16Array = Int16Array.of(4, 2, 3);
        arr.sort();
        let contiguous: boolean = true;
        let expectedIndex: int = 0;
        for (const e of arr.entries()) {
          if (e[0] !== expectedIndex) {
            contiguous = false;
          }
          expectedIndex = expectedIndex + 1;
        }
        expect(contiguous).assertTrue();
        expect(expectedIndex).assertEqual(3);
        expect(arr.join(',')).assertEqual('2,3,4');
      }

      // --- [2] Verify at(0) on the sort() result of a four-element array returns the minimum ---
      {
        let arr: Int16Array = Int16Array.of(7, 3, 9, 5);
        arr.sort();
        expect(arr.at(0)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART03_2000
     * @tc.name int16ArraySortPart03Test020
     * @tc.desc Merged batch (5 tests): ordering behavior: descending reorder of opposite signs, a comparator re-entering sort preserving the multiset, invocation with element values, and $_get first/last extremes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort((a,b)=>b-a) reorders two opposite-signed elements descending ---
      {
        let arr: Int16Array = Int16Array.of(-3, 3);
        arr.sort((a: number, b: number): int => (b - a).toInt());
        expect(arr.$_get(0)).assertEqual(3);
        expect(arr.$_get(1)).assertEqual(-3);
      }

      // --- [2] Verify a compareFn that re-enters sort() preserves the element multiset ---
      {
        let arr: Int16Array = Int16Array.of(3, 1, 2);
        arr.sort((a: number, b: number): int => {
          arr.sort();
          return (a - b).toInt();
        });
        expect(arr.$_get(0) + arr.$_get(1) + arr.$_get(2)).assertEqual(6);
      }

      // --- [3] Verify the sort compareFn is invoked at least once and receives only element values ---
      {
        let arr: Int16Array = Int16Array.of(3, 1, 4, 2);
        let calls: int = 0;
        let allMembers: boolean = true;
        arr.sort((a: number, b: number): int => {
          calls = calls + 1;
          if (!arr.includes(a) || !arr.includes(b)) {
            allMembers = false;
          }
          return (a - b).toInt();
        });
        let r_members: boolean = allMembers;
        expect(r_members).assertTrue();

        let r_called: boolean = calls > 0;
        expect(r_called).assertTrue();
        expect(arr.$_get(0)).assertEqual(1);
      }

      // --- [4] Verify sort() then $_get(0) is the minimum value ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, 32767, -32768, -1);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-32768);
      }

      // --- [5] Verify sort() then $_get(length-1) is the maximum value ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 1, 32767);
        arr.sort();
        expect(arr.$_get(arr.length - 1)).assertEqual(32767);
      }
    });

  });
}
