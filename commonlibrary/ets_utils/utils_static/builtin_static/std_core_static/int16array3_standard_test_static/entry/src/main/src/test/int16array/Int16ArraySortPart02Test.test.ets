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

export default function int16ArraySortPart02Test(): void {
  describe('Int16ArraySortPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_0100
     * @tc.name int16ArraySortPart02Test001
     * @tc.desc Single test: sort() on a zero-length array and on an empty ArrayBuffer view both keep length 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort() on empty Int16Array (new Int16Array(0) and ArrayBuffer view) keeps length 0 ---
      {
        let arr: Int16Array = new Int16Array(0);
        arr.sort();
        expect(arr.length).assertEqual(0);

        let buf: ArrayBuffer = new ArrayBuffer(0);
        let arr2: Int16Array = new Int16Array(buf);
        arr2.sort();
        expect(arr2.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_0200
     * @tc.name int16ArraySortPart02Test002
     * @tc.desc Merged batch (4 tests): bounds, wrapping and truncation before ordering: mixed boundary values, from() Infinity converted to zero, equal-MIN stability, and a two-element MAX/MIN pair keeping the smallest first.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort() with mixed int16 boundaries sorts ascending ---
      {
        let arr: Int16Array = new Int16Array([0, 32767, -32768, 0]);
        arr.sort();
        expect(arr.join(',')).assertEqual('-32768,0,0,32767');
      }

      // --- [2] Verify default sort() orders int16 boundary values ascending and from() converts Infinity to 0 ---
      {
        let arr: Int16Array = Int16Array.of(-32768, 32767, 0);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(32767);

        let arr2: Int16Array = Int16Array.from([32767 as number, Double.POSITIVE_INFINITY, -32768 as number]);
        arr2.sort();
        expect(arr2.$_get(0)).assertEqual(-32768);
        expect(arr2.$_get(1)).assertEqual(0);
        expect(arr2.$_get(2)).assertEqual(32767);

        let arr3: Int16Array = Int16Array.from([0 as number, 0 as number, 100 as number]);
        arr3.sort();
        expect(arr3.$_get(0)).assertEqual(0);
        expect(arr3.$_get(1)).assertEqual(0);
        expect(arr3.$_get(2)).assertEqual(100);
      }

      // --- [3] Verify sort() compareFn returning 0 for equal int16.MIN elements preserves stability ---
      {
        let arr: Int16Array = new Int16Array([-32768, 100, -32768]);
        arr.sort((a: number, b: number): int => { return 0; });
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(100);
        expect(arr.$_get(2)).assertEqual(-32768);
      }

      // --- [4] Verify sort() on int16.MIN and 0 then on -1 and int16.MAX in the same array keeps length 2 and the smallest element first ---
      {
        let arr: Int16Array = new Int16Array([-32768, 0]);
        let result: Int16Array = arr.sort();
        expect(result.length).assertEqual(2);
        expect(result.$_get(0)).assertEqual(-32768);
        arr.$_set(0, -1);
        arr.$_set(1, 32767);
        let resorted: Int16Array = arr.sort();
        expect(resorted.length).assertEqual(2);
        expect(resorted.$_get(0)).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_0300
     * @tc.name int16ArraySortPart02Test003
     * @tc.desc Merged batch (5 tests): bounds, wrapping and truncation before ordering: chained sorts over overflowed inputs, int extremes and fractions, int32-overflow clamping and indexOf finding the minimum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify chained sort().sort() applies default ordering and int16 overflow of out-of-range inputs ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -1, 32767, -32768);
        arr.sort().sort();
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(-32768);
        expect(arr.$_get(2)).assertEqual(-1);
        expect(arr.$_get(3)).assertEqual(0);
        expect(arr.$_get(4)).assertEqual(32767);
      }

      // --- [2] Verify sort(compareFn) with int.MAX/int.MIN/float 3.7/-3.7 signal returns sorts ascending endpoints ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767);
        arr.sort((a: number, b: number): int => {
          if (a > b) { return 2147483647; }
          if (a < b) { return -1; }
          return 0;
        });
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(3)).assertEqual(32767);

        let arr2: Int16Array = Int16Array.of(32768, -32768, 32767, 0);
        arr2.sort((a: number, b: number): int => {
          if (a > b) { return 1; }
          if (a < b) { return -2147483648; }
          return 0;
        });
        expect(arr2.$_get(0)).assertEqual(-32768);
        expect(arr2.$_get(3)).assertEqual(32767);

        let arr3: Int16Array = Int16Array.of(32768, 0, -32768, 32767);
        arr3.sort((a: number, b: number): int => {
          if (a > b) { return Double.toInt(3.7); }
          if (a < b) { return -1; }
          return 0;
        });
        expect(arr3.$_get(0)).assertEqual(-32768);
        expect(arr3.$_get(3)).assertEqual(32767);

        let arr4: Int16Array = Int16Array.of(32768, -32768, 0, 32767);
        arr4.sort((a: number, b: number): int => {
          if (a > b) { return 1; }
          if (a < b) { return Double.toInt(-3.7); }
          return 0;
        });
        expect(arr4.$_get(0)).assertEqual(-32768);
        expect(arr4.$_get(3)).assertEqual(32767);
      }

      // --- [3] Verify a compareFn whose scaled difference overflows the 32-bit int range is clamped and still sorts ascending ---
      {
        let arr: Int16Array = Int16Array.of(32767, -32768, 5, -5);
        arr.sort((a: number, b: number): int => {
          let scaled: number = (a - b) * 40000;
          if (scaled > 2147483647) { return 2147483647; }
          if (scaled < -2147483648) { return -2147483648; }
          return scaled.toInt();
        });
        expect(arr.join(',')).assertEqual('-32768,-5,5,32767');
      }

      // --- [4] Verify fill all then sort keeps equal overflow values ---
      {
        let arr: Int16Array = Int16Array.of(32768, -32768, 0, 32767);
        arr.fill(32768);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(3)).assertEqual(-32768);
      }

      // --- [5] Verify sort then indexOf finds min at index 0 ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767, -1, 50);
        arr.sort();
        expect(arr.indexOf(-32768)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_0400
     * @tc.name int16ArraySortPart02Test004
     * @tc.desc Merged batch (5 tests): views and shared buffers: reordering visible through a sibling Int16Array, Int8Array and Uint8Array byte views, bytes outside the view untouched and two offset views independent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify shared ArrayBuffer: sort one Int16Array is visible to another ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr1: Int16Array = new Int16Array(buf);
        arr1.$_set(0, 32768);
        arr1.$_set(1, -32768);
        arr1.$_set(2, 0);
        let arr2: Int16Array = new Int16Array(buf);
        arr1.sort();
        expect(arr2.$_get(0)).assertEqual(-32768);
        expect(arr2.$_get(2)).assertEqual(0);
      }

      // --- [2] Verify sort Int16Array reorders bytes observed via Int8Array view ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let i8: Int8Array = new Int8Array(buf);
        i8.$_set(0, 0);
        i8.$_set(1, -128);
        i8.$_set(2, 0);
        i8.$_set(3, 127);
        i8.$_set(4, -1);
        i8.$_set(5, -1);
        let arr: Int16Array = new Int16Array(buf);
        arr.sort();
        expect(i8.$_get(0)).assertEqual(0);
        expect(i8.$_get(1)).assertEqual(-128);
        expect(arr.$_get(0)).assertEqual(-32768);
      }

      // --- [3] Verify sort does not change bytes outside the typed array view ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(10);
        let trailing: Int8Array = new Int8Array(buf, 8, 2);
        trailing.$_set(0, 99);
        trailing.$_set(1, 88);
        let arr: Int16Array = new Int16Array(buf, 0, 4);
        arr.$_set(0, 32768);
        arr.$_set(1, -32768);
        arr.$_set(2, 0);
        arr.$_set(3, 32767);
        arr.sort();
        expect(trailing.$_get(0)).assertEqual(99);
        expect(trailing.$_get(1)).assertEqual(88);
      }

      // --- [4] Verify sort order via shared Uint8Array byte view ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 32768);
        arr.$_set(1, -32768);
        arr.sort();
        let u8: Uint8Array = new Uint8Array(buf);
        expect(u8.$_get(0)).assertEqual(0);
        expect(u8.$_get(2)).assertEqual(0);
        expect(arr.$_get(0)).assertEqual(-32768);
      }

      // --- [5] Verify sort first offset view does not reorder second offset view ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(12);
        let arr1: Int16Array = new Int16Array(buf, 0, 2);
        let arr2: Int16Array = new Int16Array(buf, 4, 4);
        arr1.$_set(0, 3);
        arr1.$_set(1, -1);
        arr2.$_set(0, 10);
        arr2.$_set(1, 20);
        arr2.$_set(2, 30);
        arr2.$_set(3, 40);
        let snapHead: number = arr2.$_get(0);
        let snapTail: number = arr2.$_get(3);
        arr1.sort();
        expect(arr2.$_get(0)).assertEqual(snapHead);
        expect(arr2.$_get(3)).assertEqual(snapTail);
        expect(arr1.$_get(0)).assertEqual(-1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_0500
     * @tc.name int16ArraySortPart02Test005
     * @tc.desc Merged batch (5 tests): compareFn return-value semantics: large negative reversing, int32 extremes preserving or reversing, constant zero preserving, constant -1 ascending and ±32769 keeping the two-element sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a sort() compareFn returning a large negative constant reverses element order ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        arr.sort((a: number, b: number): int => { return -100000; });
        expect(arr.$_get(0)).assertEqual(3);
      }

      // --- [2] Verify sort(compareFn) with constant int32 extreme returns preserves or reverses element order ---
      {
        let arr1: Int16Array = Int16Array.of(5, 10, 15);
        arr1.sort((a: number, b: number): int => { return 2147483647; });
        expect(arr1.$_get(0)).assertEqual(5);

        let arr2: Int16Array = Int16Array.of(5, 10, 15);
        arr2.sort((a: number, b: number): int => { return -2147483647 - 1; });
        expect(arr2.$_get(0)).assertEqual(15);
      }

      // --- [3] Verify sort(compareFn) constant 0 preserves the original order of distinct and all-equal arrays ---
      {
        let arr: Int16Array = Int16Array.of(10, 5, 8, 3);
        arr.sort((a: number, b: number): int => { return 0; });
        expect(arr.$_get(0)).assertEqual(10);
        expect(arr.$_get(1)).assertEqual(5);
        expect(arr.$_get(2)).assertEqual(8);
        expect(arr.$_get(3)).assertEqual(3);

        let arr2: Int16Array = Int16Array.of(7, 7, 7, 7, 7);
        arr2.sort((a: number, b: number): int => { return 0; });
        expect(arr2.$_get(0)).assertEqual(7);
        expect(arr2.$_get(4)).assertEqual(7);
      }

      // --- [4] Verify sort(compareFn) constant -1 sorts a descending array to ascending ---
      {
        let arr: Int16Array = new Int16Array([4 as number, 3 as number, 2 as number, 1 as number]);
        arr.sort((a: number, b: number): int => { return -1; });
        expect(arr.length).assertEqual(4);
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(3)).assertEqual(4);
      }

      // --- [5] Verify sort with compareFn returning -32769 and 1 both keep the two-element sum ---
      {
        let arr1: Int16Array = Int16Array.of(2, 1);
        arr1.sort((a: number, b: number): int => { return -32769; });
        let arr2: Int16Array = Int16Array.of(2, 1);
        arr2.sort((a: number, b: number): int => { return 1; });
        expect(arr1.reduce((acc: number, v: number, i: int, a2: Int16Array): number => acc + v, 0)).assertEqual(3);
        expect(arr2.reduce((acc: number, v: number, i: int, a2: Int16Array): number => acc + v, 0)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_0600
     * @tc.name int16ArraySortPart02Test006
     * @tc.desc Merged batch (5 tests): custom compareFn orderings: Math.sign ascending and descending on Set sources, block-body sign comparison, and ternary comparators over $_set-filled and Set sources, plus round-halving join text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Math.sign descending and ascending compareFn on from(Set) arrays yields 3,2,1 and 1,2,3 ---
      {
        let sources: int[][] = [[1, 3, 2], [3, 1, 2]];
        let descending: boolean[] = [true, false];
        let expected: int[][] = [[3, 2, 1], [1, 2, 3]];
        for (let i: int = 0; i < sources.length; i++) {
          let s: Set<int> = new Set<int>();
          for (let j: int = 0; j < sources[i].length; j++) {
            s.add(sources[i][j]);
          }
          let arr: Int16Array = Int16Array.from(s);
          let desc: boolean = descending[i];
          let r: Int16Array = arr.sort((a: number, b: number): int => Math.sign(desc ? b - a : a - b).toInt());
          for (let j: int = 0; j < expected[i].length; j++) {
            expect(r.$_get(j)).assertEqual(expected[i][j]);
          }
        }
      }

      // --- [2] Verify sort with a block-body Math.sign compareFn on a copy-constructed array yields ascending order ---
      {
        let cp: Int16Array = new Int16Array(Int16Array.of(5, 2, 8));
        let r: Int16Array = cp.sort((a: number, b: number): int => {
          let s: number = Math.sign(a - b);
          return s.toInt();
        });
        expect(r.$_get(0)).assertEqual(2);
        expect(r.$_get(2)).assertEqual(8);
      }

      // --- [3] Verify sort with a ternary compareFn on a length-constructed array filled via $_set yields ascending order ---
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 3);
        arr.$_set(1, 1);
        arr.$_set(2, 2);
        let r: Int16Array = arr.sort((a: number, b: number): int => a < b ? -1 : 1);
        expect(r.$_get(0)).assertEqual(1);
        expect(r.$_get(2)).assertEqual(3);
      }

      // --- [4] Verify sort with an explicit ternary compareFn on an array built by from(Set) yields ascending order ---
      {
        let s: Set<int> = new Set<int>();
        s.add(4);
        s.add(1);
        s.add(3);
        let arr: Int16Array = Int16Array.from(s);
        let r: Int16Array = arr.sort((a: number, b: number): int => a > b ? 1 : (a < b ? -1 : 0));
        expect(r.$_get(0)).assertEqual(1);
        expect(r.$_get(2)).assertEqual(4);
      }

      // --- [5] Verify sort with a Math.round-halving compareFn joins in ascending text order ---
      {
        let arr: Int16Array = Int16Array.of(5, 8, 2);
        arr.sort((a: number, b: number): int => (Math.round(a / 2) - Math.round(b / 2)).toInt());
        expect(arr.join(',')).assertEqual('2,5,8');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_0700
     * @tc.name int16ArraySortPart02Test007
     * @tc.desc Merged batch (5 tests): construction sources: Map.values() descending, identity-mapfn first pair, $_set-filled ascending, a four-entry Map with preserved length and byteLength, and Array.from join text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort(b-a) on an array built by from(Map.values()) returns descending values with the largest first and smallest last ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('p', 7);
        m.set('q', 2);
        m.set('r', 5);
        let arr: Int16Array = Int16Array.from(m.values());
        arr.sort((a: number, b: number): int => (b - a).toInt());
        expect(arr.length).assertEqual(3);
        expect(arr.$_get(0)).assertEqual(7);
        expect(arr.$_get(2)).assertEqual(2);
      }

      // --- [2] Verify default sort on an array built by from(Array, identity mapfn) reads back the ascending first two elements ---
      {
        let src: int[] = [3, 1, 2];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v);
        let r: Int16Array = arr.sort();
        expect(r.join(',')).assertEqual('1,2,3');
      }

      // --- [3] Verify sort(a-b) ascending on a length-constructed array filled via $_set yields ascending order ---
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 7);
        arr.$_set(1, 5);
        arr.$_set(2, 6);
        let r: Int16Array = arr.sort((a: number, b: number): int => (a - b).toInt());
        expect(r.at(0)).assertEqual(5);
        expect(r.at(2)).assertEqual(7);
      }

      // --- [4] Verify sort on an array built by from(Map.values()) of four entries keeps length and byteLength and the smallest first ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 3);
        m.set('b', 1);
        m.set('c', 2);
        m.set('d', 4);
        let arr: Int16Array = Int16Array.from(m.values());
        arr.sort();
        expect(arr.length).assertEqual(4);
        expect(arr.byteLength).assertEqual(8);
        expect(arr.$_get(0)).assertEqual(1);
      }

      // --- [5] Verify converting the sort() result with Array.from() and joining yields ascending text ---
      {
        let arr: Int16Array = Int16Array.of(4, 1, 3);
        arr.sort();
        let copy: number[] = Array.from(arr);
        expect(copy.join('|')).assertEqual('1|3|4');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_0800
     * @tc.name int16ArraySortPart02Test008
     * @tc.desc Merged batch (5 tests): return value and chaining: sort().reverse(), copyWithin after sorting, a descending comparator applied after the default sort, reverse-then-sort restoring order and an aliasing reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort().reverse() chain sorts then reverses ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767);
        arr.sort().reverse();
        expect(arr.$_get(0)).assertEqual(32767);
        expect(arr.$_get(3)).assertEqual(-32768);
      }

      // --- [2] Verify sort() chained with copyWithin() applies the sort before shifting elements ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767);
        arr.sort().copyWithin(0, 1);
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(0);
      }

      // --- [3] Verify chaining the default sort() then a descending compareFn yields descending order ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767);
        arr.sort().sort((a: number, b: number): int => { return (b - a).toInt(); });
        expect(arr.$_get(0)).assertEqual(32767);
        expect(arr.$_get(3)).assertEqual(-32768);
      }

      // --- [4] Verify chained sort().reverse().sort() results in original sorted order ---
      {
        let arr: Int16Array = Int16Array.of(100, -100, 0, 32767, -32768);
        arr.sort().reverse().sort();
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(4)).assertEqual(32767);
      }

      // --- [5] Verify sort() returned reference aliases original (mutations visible both ways) ---
      {
        let arr: Int16Array = new Int16Array([0, 3]);
        let result: Int16Array = arr.sort();
        result.$_set(0, 99);
        expect(arr.$_get(0)).assertEqual(99);

        let arr2: Int16Array = new Int16Array([3, 0]);
        let result2: Int16Array = arr2.sort();
        arr2.$_set(1, 88);
        expect(result2.$_get(1)).assertEqual(88);

        let arr3: Int16Array = new Int16Array([0, 3, 0]);
        let result3: Int16Array = arr3.sort();
        arr3.$_set(0, 10);
        arr3.$_set(1, 20);
        arr3.$_set(2, 30);
        expect(result3.$_get(0)).assertEqual(10);
        expect(result3.$_get(1)).assertEqual(20);
        expect(result3.$_get(2)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_0900
     * @tc.name int16ArraySortPart02Test009
     * @tc.desc Merged batch (5 tests): post-sort reads and derived consumers: filter and find for positives, findIndex of -1, findLast and findLastIndex over the sorted result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort then filter positive values stays ordered ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767, -1, 50);
        arr.sort();
        let f: Int16Array = arr.filter((v: number, idx: int, a: Int16Array): boolean => {
          return v > 0;
        });
        expect(f.$_get(0)).assertEqual(50);
        expect(f.$_get(f.length - 1)).assertEqual(32767);
      }

      // --- [2] Verify sort then find returns first positive value ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767, -1);
        arr.sort();
        let found: number | undefined = arr.find((v: number, idx: int, a: Int16Array): boolean => {
          return v > 0;
        });
        expect(found).assertEqual(32767);
      }

      // --- [3] Verify sort then findIndex returns index of -1 ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767, -1);
        arr.sort();
        let idx: int = arr.findIndex((v: number, idx2: int, a: Int16Array): boolean => {
          return v === -1;
        });
        expect(idx).assertEqual(2);
      }

      // --- [4] Verify sort then findLast returns last positive value ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767, -1, 50);
        arr.sort();
        let last: number | undefined = arr.findLast((v: number, idx: int, a: Int16Array): boolean => {
          return v > 0;
        });
        expect(last).assertEqual(32767);
      }

      // --- [5] Verify sort then findLastIndex returns positive last index ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767, -1, 50);
        arr.sort();
        let lastIdx: int = arr.findLastIndex((v: number, idx: int, a: Int16Array): boolean => {
          return v > 0;
        });
        let r_1: boolean = lastIdx > 0;
        expect(r_1).assertTrue();
        expect(lastIdx).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_1000
     * @tc.name int16ArraySortPart02Test010
     * @tc.desc Merged batch (4 tests): default ascending order and stability: ascending and descending comparators on ordered arrays, constant -1 in both directions, and non-descending order for equal and duplicate groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort((a,b)=>a-b) on already ascending array stays unchanged ---
      {
        let arr: Int16Array = Int16Array.of(-1, 0, 3, 32767);
        arr.sort((a: number, b: number): int => (a - b).toInt());
        expect(arr.join(',')).assertEqual('-1,0,3,32767');
        expect(arr.at(-1)).assertEqual(32767);
      }

      // --- [2] Verify sort((a,b)=>b-a) keeps descending array in descending order ---
      {
        let arr: Int16Array = Int16Array.of(32767, 3, 0, -1);
        arr.sort((a: number, b: number): int => (b - a).toInt());
        expect(arr.$_get(0)).assertEqual(32767);
        expect(arr.$_get(1)).assertEqual(3);
        expect(arr.$_get(2)).assertEqual(0);
        expect(arr.$_get(3)).assertEqual(-1);
      }

      // --- [3] Verify a constant-1 sort() compareFn leaves ascending input intact and swaps a descending pair ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        arr.sort((a: number, b: number): int => { return 1; });
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(3)).assertEqual(4);

        let arr2: Int16Array = Int16Array.of(2, 1);
        arr2.sort((a: number, b: number): int => { return 1; });
        expect(arr2.$_get(0)).assertEqual(2);
        expect(arr2.$_get(1)).assertEqual(1);
      }

      // --- [4] Verify default sort() orders every equal or duplicate value in non-descending order for all-equal, duplicate-group, overflow-equal and mixed boundary datasets ---
      {
        let inputs: Int16Array[] = [
          new Int16Array([0, 0, 0, 0]),
          Int16Array.of(32767, 32767, 32767),
          Int16Array.of(-32768, -32768, -32768),
          Int16Array.of(5, 2, 5, 2),
          Int16Array.of(3, 1, 3, 2, 1, 2),
          Int16Array.of(-1, -5, -1, -3, -1),
          new Int16Array([100, 0, -100, 0]),
          Int16Array.of(32768, 32768, 32768, 32768),
          Int16Array.of(-1, -1, 32767),
          Int16Array.of(0, -32768, 0, -32768)
        ];
        let expected: string[] = [
          '0,0,0,0',
          '32767,32767,32767',
          '-32768,-32768,-32768',
          '2,2,5,5',
          '1,1,2,2,3,3',
          '-5,-3,-1,-1,-1',
          '-100,0,0,100',
          '-32768,-32768,-32768,-32768',
          '-1,-1,32767',
          '-32768,-32768,0,0'
        ];
        for (let k: int = 0; k < inputs.length; k++) {
          inputs[k].sort();
          expect(inputs[k].join(',')).assertEqual(expected[k]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_1100
     * @tc.name int16ArraySortPart02Test011
     * @tc.desc Merged batch (5 tests): compareFn errors: RangeError propagation, a first-comparison throw, a second-comparison TypeError halting further calls, a value-triggered TypeError and a generic propagation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort() compareFn throwing RangeError propagates to caller ---
      {
        let arr: Int16Array = new Int16Array([0, -32768]);
        try {
          arr.sort((a: number, b: number): int => { throw new RangeError("range error cmp"); });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("RangeError");
        }
      }

      // --- [2] Verify sort() compareFn throwing on first comparison propagates error immediately ---
      {
        let arr: Int16Array = new Int16Array([-32768, 0, 32767]);
        let callCount: int = 0;
        try {
          arr.sort((a: number, b: number): int => {
            callCount = callCount + 1;
            throw new TypeError("fail on first cmp");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        expect(callCount).assertEqual(1);
      }

      // --- [3] Verify sort() compareFn that throws on the second comparison propagates the TypeError and stops further comparisons ---
      {
        let arr: Int16Array = new Int16Array([-32768, 0, 32767]);
        let callCount: int = 0;
        try {
          arr.sort((a: number, b: number): int => {
            callCount = callCount + 1;
            if (callCount >= 2) { throw new TypeError("fail after first cmp"); }
            return (a - b).toInt();
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        expect(callCount).assertEqual(2);
      }

      // --- [4] Verify a sort() compareFn that throws on a specific element value propagates the TypeError ---
      {
        let arr: Int16Array = new Int16Array([32767, 0, -32768]);
        try {
          arr.sort((a: number, b: number): int => {
            if (a === 0 as number) { throw new TypeError("cmp error at zero"); }
            return (a - b).toInt();
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
      }

      // --- [5] Verify sort(compareFn) propagates error thrown inside compareFn ---
      {
        let arr: Int16Array = Int16Array.of(32767, -1, 3);
        try {
            arr.sort((a: number, b: number): int => {
                throw new TypeError('compare error');
            });
            expect().assertFail();
        } catch (e) {
            expect(e.name).assertEqual('TypeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_1200
     * @tc.name int16ArraySortPart02Test012
     * @tc.desc Merged batch (3 tests): bounds, wrapping and truncation before ordering: a-b then b-a over MAX/0/-1, includes(32767) after sort, and stored int16 ordering for wrapped overflows and a $_set-filled source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort((a,b)=>a-b) orders int16.MAX, 0 and -1 ascending and a following b-a comparator reorders the same array descending ---
      {
        let arr: Int16Array = Int16Array.of(32767, 0, -1);
        arr.sort((a: number, b: number): int => (a - b).toInt());
        expect(arr.$_get(0)).assertEqual(-1);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(32767);
        arr.sort((a: number, b: number): int => (b - a).toInt());
        expect(arr.$_get(0)).assertEqual(32767);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(-1);
      }

      // --- [2] Verify sort().includes(32767) chain finds MAX after sort ---
      {
        let arr: Int16Array = Int16Array.of(0, -1, 32767);
        let found: boolean = arr.sort().includes(32767);
        let r_1: boolean = found;
        expect(r_1).assertTrue();
      }

      // --- [3] Verify default sort() orders wrapped overflows, overflow-equal ties and a partially set array by stored int16 value ---
      {
        let wrapped: Int16Array = Int16Array.of(32768, -32769, 0, -1);
        let ties: Int16Array = Int16Array.of(32767, -32769, -1, 0);
        let partial: Int16Array = new Int16Array(3);
        partial.$_set(0, 32767);
        partial.$_set(1, -32768);
        let inputs: Int16Array[] = [wrapped, ties, partial];
        let expected: string[] = ['-32768,-1,0,32767', '-1,0,32767,32767', '-32768,0,32767'];
        for (let k: int = 0; k < inputs.length; k++) {
          inputs[k].sort();
          expect(inputs[k].join(',')).assertEqual(expected[k]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_1300
     * @tc.name int16ArraySortPart02Test013
     * @tc.desc Merged batch (3 tests): bounds, wrapping and truncation before ordering: includes of boundary values after sort, a 0x7FFF hex literal sorting last and 0x7FFF alongside 32767 both at the end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort then includes finds boundary values ---
      {
        let arr: Int16Array = Int16Array.of(32768, -32768, 0, 32767);
        arr.sort();
        let r_1: boolean = arr.includes(-32768);
        expect(r_1).assertTrue();

        let r_2: boolean = arr.includes(32767);
        expect(r_2).assertTrue();
        expect(arr.join(',')).assertEqual('-32768,-32768,0,32767');
      }

      // --- [2] Verify sort() on array with 0x7FFF as hex literal element sorts to last position ---
      {
        let arr: Int16Array = Int16Array.of(0x7FFF, 0, -32768);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(0x7FFF);
      }

      // --- [3] Verify sort() on array with 0x7FFF and 32767 both sort to end position ---
      {
        let arr: Int16Array = Int16Array.of(0, 0x7FFF, -1, 32767);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-1);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(32767);
        expect(arr.$_get(3)).assertEqual(32767);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_1400
     * @tc.name int16ArraySortPart02Test014
     * @tc.desc Merged batch (5 tests): views and shared buffers: subarray sorting reordering the parent prefix, an ordered slice, little-endian DataView shorts, a from(copy) result at byteOffset 0 and offset views returning this.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify subarray().sort() reorders parent Int16Array prefix ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767, -1, 50);
        let sub: Int16Array = arr.subarray(0, 4);
        sub.sort();
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(3)).assertEqual(32767);
      }

      // --- [2] Verify sort then subarray slice remains ordered ---
      {
        let arr: Int16Array = Int16Array.of(32768, -32768, 0, 32767, -1, 50);
        arr.sort();
        let sub: Int16Array = arr.subarray(1, 4);
        expect(sub.$_get(0)).assertEqual(-32768);
        expect(sub.$_get(2)).assertEqual(0);
      }

      // --- [3] Verify sort then DataView reads little-endian ordered shorts ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 32768);
        arr.$_set(1, -32768);
        arr.sort();
        let dv: DataView = new DataView(buf);
        let b0: number = dv.getInt16(0, true);
        let b1: number = dv.getInt16(2, true);
        expect(b0).assertEqual(-32768);
        expect(b1).assertEqual(-32768);
      }

      // --- [4] Verify the array built by from(another Int16Array) starts at byteOffset 0 on its own buffer after sort ---
      {
        let src: Int16Array = Int16Array.of(4, 2, 6);
        let arr: Int16Array = Int16Array.from(src);
        arr.sort();
        let shared: boolean = arr.buffer === src.buffer;
        expect(shared).assertFalse();
        expect(arr.byteOffset).assertEqual(0);
        expect(arr.$_get(0)).assertEqual(2);
      }

      // --- [5] Verify sort() on buffer-backed Int16Array with non-zero byteOffset and with byteOffset 0 returns this and sorts ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf, 2, 2);
        arr.$_set(0, 32767);
        arr.$_set(1, -32768);
        expect(arr.sort()).assertEqual(arr);
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(32767);

        let buf2: ArrayBuffer = new ArrayBuffer(6);
        let arr2: Int16Array = new Int16Array(buf2, 0, 3);
        arr2.$_set(0, 0);
        arr2.$_set(1, -100);
        arr2.$_set(2, 100);
        arr2.sort();
        expect(arr2.$_get(0)).assertEqual(-100);
        expect(arr2.$_get(1)).assertEqual(0);
        expect(arr2.$_get(2)).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_1500
     * @tc.name int16ArraySortPart02Test015
     * @tc.desc Merged batch (5 tests): compareFn return-value semantics: duplicates with equality fallback, a scaled difference beyond int range, constants 0/±1/±2/-0, square-magnitude ordering and expression/if-else endpoints.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort(compareFn) returning 0 for equal values and a-b otherwise sorts an array with duplicates ---
      {
        let arr: Int16Array = Int16Array.of(4, 1, 4, 2, 4, 3);
        arr.sort((a: number, b: number): int => {
          if (a === b) { return 0; }
          return (a - b).toInt();
        });
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(5)).assertEqual(4);
      }

      // --- [2] Verify sort(compareFn) with scaled a-b beyond int range still sorts ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767);
        arr.sort((a: number, b: number): int => {
          let va: number = a * 100000;
          let vb: number = b * 100000;
          return (va - vb).toInt();
        });
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(3)).assertEqual(32767);
      }

      // --- [3] Verify sort(compareFn) constant returns 0, 1, -1, 2, -2 or -0 preserves or reverses the order accordingly ---
      {
        let arr: Int16Array = Int16Array.of(100, -32768, 0, 32767);
        arr.sort((a: number, b: number): int => { return 0; });
        expect(arr.$_get(0)).assertEqual(100);
        expect(arr.$_get(1)).assertEqual(-32768);
        expect(arr.$_get(2)).assertEqual(0);
        expect(arr.$_get(3)).assertEqual(32767);

        let arr2: Int16Array = Int16Array.of(100, -32768, 0);
        arr2.sort((a: number, b: number): int => { return 1; });
        expect(arr2.$_get(2)).assertEqual(0);
        expect(arr2.$_get(1)).assertEqual(-32768);
        expect(arr2.$_get(0)).assertEqual(100);

        let arr3: Int16Array = Int16Array.of(-32768, 0, 100);
        arr3.sort((a: number, b: number): int => { return -1; });
        expect(arr3.$_get(0)).assertEqual(100);
        expect(arr3.$_get(1)).assertEqual(0);
        expect(arr3.$_get(2)).assertEqual(-32768);

        let arr4: Int16Array = Int16Array.of(-32768, 0, 100);
        arr4.sort((a: number, b: number): int => { return 2; });
        expect(arr4.$_get(2)).assertEqual(100);
        expect(arr4.$_get(1)).assertEqual(0);
        expect(arr4.$_get(0)).assertEqual(-32768);

        let arr5: Int16Array = Int16Array.of(-32768, 0, 100);
        arr5.sort((a: number, b: number): int => { return -2; });
        expect(arr5.$_get(0)).assertEqual(100);
        expect(arr5.$_get(1)).assertEqual(0);
        expect(arr5.$_get(2)).assertEqual(-32768);

        let arr6: Int16Array = Int16Array.of(100, -32768, 0);
        let negZero: int = -0;
        arr6.sort((a: number, b: number): int => { return negZero; });
        expect(arr6.$_get(0)).assertEqual(100);
        expect(arr6.$_get(1)).assertEqual(-32768);
        expect(arr6.$_get(2)).assertEqual(0);
      }

      // --- [4] Verify compareFn returning computed expression a*a - b*b sorts by square magnitude ---
      {
        let arr: Int16Array = Int16Array.of(-5, 3, -1, 0);
        arr.sort((a: number, b: number): int => { return (a * a - b * b).toInt(); });
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(-1);
        expect(arr.$_get(2)).assertEqual(3);
        expect(arr.$_get(3)).assertEqual(-5);
      }

      // --- [5] Verify compareFn (a-b) expression, reverse if-else and large-positive a-b sorts endpoint values correctly ---
      {
        let arr: Int16Array = Int16Array.of(-100, 200, -50, 30);
        arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
        expect(arr.$_get(0)).assertEqual(-100);
        expect(arr.$_get(1)).assertEqual(-50);
        expect(arr.$_get(2)).assertEqual(30);
        expect(arr.$_get(3)).assertEqual(200);

        let arr2: Int16Array = Int16Array.of(-32768, 0, 100, 32767);
        arr2.sort((a: number, b: number): int => {
          if (a < b) { return 1; }
          if (a > b) { return -1; }
          return 0;
        });
        expect(arr2.$_get(0)).assertEqual(32767);
        expect(arr2.$_get(1)).assertEqual(100);
        expect(arr2.$_get(2)).assertEqual(0);
        expect(arr2.$_get(3)).assertEqual(-32768);

        let arr3: Int16Array = Int16Array.of(32767, -32768, 0);
        arr3.sort((a: number, b: number): int => { return (a - b).toInt(); });
        expect(arr3.$_get(0)).assertEqual(-32768);
        expect(arr3.$_get(1)).assertEqual(0);
        expect(arr3.$_get(2)).assertEqual(32767);
        expect(arr3.join(',')).assertEqual('-32768,0,32767');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_1600
     * @tc.name int16ArraySortPart02Test016
     * @tc.desc Merged batch (4 tests): custom compareFn orderings: Math.sign ascending on a copied source, floor-halving over Map values, descending ceil-halving join text and a reversed round-halving three-element sort.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort with Math.sign(a-b) on an array built by from(another Int16Array) yields ascending endpoints ---
      {
        let src: Int16Array = Int16Array.of(6, 1, 4);
        let arr: Int16Array = Int16Array.from(src);
        arr.sort((a: number, b: number): int => Math.sign(a - b).toInt());
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(2)).assertEqual(6);
      }

      // --- [2] Verify a Math.floor-halving compareFn on an array built by from(Map.values()) keeps the element sum and the smallest first ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('u', 9);
        m.set('v', 4);
        m.set('w', 7);
        let arr: Int16Array = Int16Array.from(m.values());
        arr.sort((a: number, b: number): int => (Math.floor(a / 2) - Math.floor(b / 2)).toInt());
        expect(arr.reduce((acc: number, v: number, i: int, a2: Int16Array): number => acc + v, 0)).assertEqual(20);
        expect(arr.$_get(0)).assertEqual(4);
      }

      // --- [3] Verify sort with a descending Math.ceil-halving compareFn on an array built by from(another Int16Array) joins descending ---
      {
        let src: Int16Array = Int16Array.of(2, 7, 4);
        let arr: Int16Array = Int16Array.from(src);
        arr.sort((a: number, b: number): int => (Math.ceil(b / 2) - Math.ceil(a / 2)).toInt());
        expect(arr.$_get(0)).assertEqual(7);
        expect(arr.$_get(2)).assertEqual(2);
      }

      // --- [4] Verify a reversed Math.round-halving compareFn sorts a three-element array descending ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 1);
        arr.sort((a: number, b: number): int => { return (Math.round(b / 2) - Math.round(a / 2)).toInt(); });
        expect(arr.$_get(0)).assertEqual(6);
        expect(arr.join(',')).assertEqual('6,3,1');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_1700
     * @tc.name int16ArraySortPart02Test017
     * @tc.desc Merged batch (5 tests): construction sources: mapfn ascending, Set descending, copy-constructed descending, Array.from versus at(-1) agreement and equal-element copies unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort(a-b) ascending on an array built by from(Array, mapfn) keeps ascending order ---
      {
        let src: int[] = [1, 2, 3, 4];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v * 10);
        let r: Int16Array = arr.sort((a: number, b: number): int => (a - b).toInt());
        expect(r.$_get(0)).assertEqual(10);
        expect(r.$_get(3)).assertEqual(40);
      }

      // --- [2] Verify sort(b-a) descending on an array built by from(Set) yields descending order ---
      {
        let s: Set<int> = new Set<int>();
        s.add(10);
        s.add(5);
        s.add(15);
        s.add(1);
        let arr: Int16Array = Int16Array.from(s);
        let r: Int16Array = arr.sort((a: number, b: number): int => (b - a).toInt());
        expect(r.$_get(0)).assertEqual(15);
        expect(r.$_get(3)).assertEqual(1);
      }

      // --- [3] Verify sort(b-a) descending on a copy-constructed array yields descending order ---
      {
        let cp: Int16Array = new Int16Array(Int16Array.of(-1, -3, -2));
        let r: Int16Array = cp.sort((a: number, b: number): int => (b - a).toInt());
        expect(r.$_get(0)).assertEqual(-1);
        expect(r.$_get(2)).assertEqual(-3);
      }

      // --- [4] Verify converting the sort() result with Array.from() and at(-1) agree on the minimum and maximum ---
      {
        let arr: Int16Array = Int16Array.of(10, 5, 8);
        arr.sort();
        let copy: number[] = Array.from(arr);
        let last: number | undefined = arr.at(-1);
        expect(copy[0]).assertEqual(5);
        expect(last).assertEqual(10);
      }

      // --- [5] Verify default sort on a copy-constructed array of equal elements keeps them unchanged ---
      {
        let cp: Int16Array = new Int16Array(Int16Array.of(5, 5, 5));
        let r: Int16Array = cp.sort();
        expect(r.length).assertEqual(3);
        expect(r.$_get(0)).assertEqual(5);
        expect(r.$_get(2)).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_1800
     * @tc.name int16ArraySortPart02Test018
     * @tc.desc Merged batch (5 tests): return value and chaining: copyWithin(0,1), every, some, find and findIndex over the sorted result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort().copyWithin(0,1) chain copies the sorted element to index 0 ---
      {
        let arr: Int16Array = new Int16Array([0, 3]);
        arr.sort().copyWithin(0, 1);
        expect(arr.$_get(0)).assertEqual(3);
      }

      // --- [2] Verify sort().every(predicate) chain returns true on the sorted elements ---
      {
        let arr: Int16Array = new Int16Array([0, 3]);
        let allGeZero: boolean = arr.sort().every((v: number): boolean => v >= 0 as number);
        expect(allGeZero).assertTrue();
        expect(arr.join(',')).assertEqual('0,3');
      }

      // --- [3] Verify sort().some(predicate) chain returns true on the sorted elements ---
      {
        let arr: Int16Array = new Int16Array([3, 0]);
        expect(arr.sort().some((v: number): boolean => v === 0 as number)).assertTrue();
        expect(arr.toString()).assertEqual('0,3');
      }

      // --- [4] Verify sort().find(predicate) chain returns the matching sorted element ---
      {
        let arr: Int16Array = new Int16Array([0, 3]);
        arr.sort();
        expect(arr.find((v: number): boolean => v === 3 as number)).assertEqual(3);
        expect(arr.indexOf(3)).assertEqual(1);
      }

      // --- [5] Verify sort().findIndex(predicate) chain returns the matching index ---
      {
        let arr: Int16Array = new Int16Array([3, 0, 3]);
        expect(arr.sort().findIndex((v: number): boolean => v === 0 as number)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_1900
     * @tc.name int16ArraySortPart02Test019
     * @tc.desc Merged batch (5 tests): post-sort reads and derived consumers: toSorted endpoints, values() first element, contiguous keys(), an odd-filter result and a with(index,0) result sorted ascending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort and toSorted produce equivalent ordered endpoints ---
      {
        let arr1: Int16Array = Int16Array.of(32768, 0, -32768, 32767, -1);
        let arr2: Int16Array = Int16Array.of(32768, 0, -32768, 32767, -1);
        arr1.sort();
        let sorted2: Int16Array = arr2.toSorted();
        expect(arr1.$_get(0)).assertEqual(sorted2.$_get(0));
        expect(arr1.$_get(4)).assertEqual(sorted2.$_get(4));
      }

      // --- [2] Verify sort then values() yields ordered first element ---
      {
        let arr: Int16Array = Int16Array.of(32768, -32768, 0, 32767, -1);
        arr.sort();
        let it: IterableIterator<Number> = arr.values();
        let first: IteratorResult<Number> = it.next();
        expect(first.value).assertEqual(-32768);

        let last: IteratorResult<Number> = it.next();
        expect(last.value).assertEqual(-32768);
      }

      // --- [3] Verify sort then keys() yields contiguous indexes from 0 ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767);
        arr.sort();
        let it: IterableIterator<int> = arr.keys();
        let k0: IteratorResult<int> = it.next();
        expect(k0.value).assertEqual(0);

        let k1: IteratorResult<int> = it.next();
        expect(k1.value).assertEqual(1);
        expect(arr.join(',')).assertEqual('-32768,-32768,0,32767');
      }

      // --- [4] Verify sort on the odd-filter result yields ascending order ---
      {
        let arr: Int16Array = Int16Array.of(5, 3, 1, 2, 4);
        let fl: Int16Array = arr.filter((value: number): boolean => value % 2 !== 0);
        let r: Int16Array = fl.sort();
        expect(r.length).assertEqual(3);
        expect(r.$_get(0)).assertEqual(1);
        expect(r.$_get(2)).assertEqual(5);
      }

      // --- [5] Verify default sort on the with(index,0) result yields ascending order ---
      {
        let arr: Int16Array = Int16Array.of(4, 2, 8);
        let w: Int16Array = arr.with(1, 0);
        let r: Int16Array = w.sort();
        expect(r.$_get(0)).assertEqual(0);
        expect(r.$_get(2)).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART02_2000
     * @tc.name int16ArraySortPart02Test020
     * @tc.desc Merged batch (4 tests): default ascending order and stability: duplicate copies grouped by size, a five-item sign-mixed input, alternating signs with repeats and a map-produced array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort(a-b) groups all copies of a smaller duplicate before all copies of a larger duplicate ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 10, 20, 10);
        arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
        expect(arr.$_get(0)).assertEqual(10);
        expect(arr.$_get(1)).assertEqual(10);
        expect(arr.$_get(2)).assertEqual(10);
        expect(arr.$_get(3)).assertEqual(20);
        expect(arr.$_get(4)).assertEqual(20);
      }

      // --- [2] Verify sort() orders a five-element mixed-sign array ascending ---
      {
        let arr: Int16Array = Int16Array.of(100, -100, 0, 50, -50);
        arr.sort();
        let first: number = arr.$_get(0);
        let last: number = arr.$_get(4);
        expect(first).assertEqual(-100);
        expect(last).assertEqual(100);
        expect(arr.join(',')).assertEqual('-100,-50,0,50,100');
      }

      // --- [3] Verify sort() sorts alternating negative/positive arrays and arrays with repeated values into ascending order ---
      {
        let arr: Int16Array = Int16Array.of(-50, 50, -30, 30, 0);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-50);
        expect(arr.$_get(1)).assertEqual(-30);
        expect(arr.$_get(2)).assertEqual(0);
        expect(arr.$_get(3)).assertEqual(30);
        expect(arr.$_get(4)).assertEqual(50);

        let dup: Int16Array = Int16Array.of(3, -3, 3, -3, 3);
        dup.sort();
        expect(dup.$_get(0)).assertEqual(-3);
        expect(dup.$_get(1)).assertEqual(-3);
        expect(dup.$_get(2)).assertEqual(3);
        expect(dup.$_get(3)).assertEqual(3);
        expect(dup.$_get(4)).assertEqual(3);
      }

      // --- [4] Verify default sort orders the elements of an Int16Array produced by map ---
      {
        let mapped: Int16Array = Int16Array.of(3, 1, 2).map((v: number): number => v * 2);
        mapped.sort();
        expect(mapped.$_get(0)).assertEqual(2);
        expect(mapped.$_get(2)).assertEqual(6);
        expect(mapped.join(',')).assertEqual('2,4,6');
      }
    });

  });
}
