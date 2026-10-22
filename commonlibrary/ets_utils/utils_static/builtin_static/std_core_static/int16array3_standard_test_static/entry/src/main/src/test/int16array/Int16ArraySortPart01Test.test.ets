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

function descendCompare(a: number, b: number): int {
  if (a > b) { return -1; }
  if (a < b) { return 1; }
  return 0;
}

function ascendCompare(a: number, b: number): int {
  if (a < b) { return -1; }
  if (a > b) { return 1; }
  return 0;
}

export default function int16ArraySortPart01Test(): void {
  describe('Int16ArraySortPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_0100
     * @tc.name int16ArraySortPart01Test001
     * @tc.desc Merged batch (5 tests): empty and single-element arrays: identical empty instance with out-of-range RangeError, no compareFn call on empty or single-element arrays, and single elements unchanged in both directions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort() on an empty Int16Array returns the same empty instance and an out-of-range set on the result throws RangeError ---
      {
        let arr: Int16Array = new Int16Array(0);
        let result: Int16Array = arr.sort();
        expect(result).assertEqual(arr);
        expect(arr.length).assertEqual(0);
        expect(result).assertEqual(arr);
        try {
          result.$_set(0, 99 as number);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      // --- [2] Verify sort() on empty array with compareFn never invokes compareFn ---
      {
        let arr: Int16Array = new Int16Array(0);
        let called: boolean = false;
        let result: Int16Array = arr.sort((a: number, b: number): int => { called = true; return 0; });
        expect(called).assertFalse();
        expect(result.length).assertEqual(0);
      }

      // --- [3] Verify sort() on single element array with compareFn never invokes compareFn ---
      {
        let arr: Int16Array = new Int16Array([-32768]);
        let called: boolean = false;
        arr.sort((a: number, b: number): int => { called = true; return 0; });
        expect(called).assertFalse();
        expect(arr.$_get(0)).assertEqual(-32768);
      }

      // --- [4] Verify sort() on single int16.MAX and -1 elements stays unchanged ---
      {
        let arr: Int16Array = Int16Array.of(32767);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(32767);

        let arr2: Int16Array = Int16Array.of(-1);
        arr2.sort();
        expect(arr2.$_get(0)).assertEqual(-1);
      }

      // --- [5] Verify sort(compareFn) on single -1 and int16.MAX elements stays unchanged for both comparator directions ---
      {
        let arr: Int16Array = Int16Array.of(-1);
        arr.sort((a: number, b: number): int => (b - a).toInt());
        expect(arr.$_get(0)).assertEqual(-1);

        let arr2: Int16Array = Int16Array.of(32767);
        arr2.sort((a: number, b: number): int => (a - b).toInt());
        expect(arr2.$_get(0)).assertEqual(32767);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_0200
     * @tc.name int16ArraySortPart01Test002
     * @tc.desc Merged batch (5 tests): compareFn errors: throwing compareFn over a Set-built array, a counter stopped at one, an always-zero comparator, a shared Int32Array buffer and an equal-pair throw.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort compareFn on an array built by from(Set) that throws when a given element is compared propagates Error ---
      {
        let s: Set<int> = new Set<int>();
        s.add(2);
        s.add(8);
        s.add(5);
        let arr: Int16Array = Int16Array.from(s);
        try {
          arr.sort((a: number, b: number): int => {
            if (a === 8 || b === 8) {
              throw new Error('compared eight');
            }
            return (a - b).toInt();
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
      }

      // --- [2] Verify sort compareFn on an array built by from(Set) that increments a counter then throws leaves the counter at 1 ---
      {
        let s: Set<int> = new Set<int>();
        s.add(1);
        s.add(2);
        s.add(3);
        let arr: Int16Array = Int16Array.from(s);
        let counter: int = 0;
        try {
          arr.sort((a: number, b: number): int => {
            counter = counter + 1;
            throw new Error('counted sort error');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        let e_cnt: int = 1;
        expect(counter).assertEqual(e_cnt);
      }

      // --- [3] Verify sort(compareFn) always returning 0 keeps original order ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767, -1);
        arr.sort((a: number, b: number): int => { return 0; });
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(4)).assertEqual(-1);
      }

      // --- [4] Verify sort Int16Array on buffer shared with Int32Array does not throw ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 32768);
        arr.$_set(1, -32768);
        arr.$_set(2, 0);
        arr.$_set(3, 32767);
        let i32: Int32Array = new Int32Array(buf);
        arr.sort();
        expect(arr.join(',')).assertEqual('-32768,-32768,0,32767');
        expect(i32.length).assertEqual(2);
      }

      // --- [5] Verify compareFn returning 0 when a equals b sorts only unequal elements and throwing compareFn propagates error and keeps length ---
      {
        let arr: Int16Array = Int16Array.of(0, 32767, 0, -32768, 32767);
        arr.sort((a: number, b: number): int => {
          if (a === b) { return 0; }
          return (a - b).toInt();
        });
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(0);
        expect(arr.$_get(3)).assertEqual(32767);
        expect(arr.$_get(4)).assertEqual(32767);

        let callIdx: int = 0;
        let arr2: Int16Array = Int16Array.of(32767, 0, -32768, 100, -100);
        try {
          arr2.sort((a: number, b: number): int => {
            callIdx = callIdx + 1;
            if (callIdx >= 3) { throw new TypeError("stop at call 3"); }
            return (a - b).toInt();
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        let r_6: boolean = callIdx >= 3;
        expect(r_6).assertTrue();

        let arr3: Int16Array = Int16Array.of(0, -32768, 32767);
        let lenBefore: int = arr3.length;
        try {
          arr3.sort((a: number, b: number): int => { throw new TypeError("fail"); });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');
        }
        expect(arr3.length).assertEqual(lenBefore);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_0300
     * @tc.name int16ArraySortPart01Test003
     * @tc.desc Merged batch (5 tests): bounds, wrapping and truncation before ordering: positive and negative fractions truncated, Infinity to zero, extreme comparator returns keeping the sum, and NaN with Infinity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort() truncates a positive fractional element toward zero before ordering ---
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 3.7 as number);
        arr.$_set(1, 1);
        arr.$_set(2, 5);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(2)).assertEqual(5);
      }

      // --- [2] Verify sort() truncates a negative fractional element toward zero before ordering ---
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, -3.7 as number);
        arr.$_set(1, 0);
        arr.$_set(2, 10);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-3);
      }

      // --- [3] Verify sort() converts +/-Infinity elements to 0 before ordering ---
      {
        let arr1: Int16Array = new Int16Array(3);
        arr1.$_set(0, 10);
        arr1.$_set(1, Double.POSITIVE_INFINITY);
        arr1.$_set(2, -2);
        arr1.sort();
        expect(arr1.$_get(0)).assertEqual(-2);

        let arr2: Int16Array = new Int16Array(3);
        arr2.$_set(0, 5);
        arr2.$_set(1, 10);
        arr2.$_set(2, -Double.POSITIVE_INFINITY);
        arr2.sort();
        expect(arr2.$_get(0)).assertEqual(0);
      }

      // --- [4] Verify sort with compareFn returning 32768 and -1 both keep the length-2 element sum ---
      {
        let arr1: Int16Array = Int16Array.of(1, 2);
        arr1.sort((a: number, b: number): int => { return 32768; });
        let arr2: Int16Array = Int16Array.of(1, 2);
        arr2.sort((a: number, b: number): int => { return -1; });
        let r1: number = arr1.$_get(0);
        let r2: number = arr2.$_get(0);
        expect(arr1.length).assertEqual(2);
        expect(arr2.length).assertEqual(2);
        expect(r1 + arr1.$_get(1)).assertEqual(3);
        expect(r2 + arr2.$_get(1)).assertEqual(3);
      }

      // --- [5] Verify sort() converts NaN and Infinity elements to 0 ---
      {
        let arr: Int16Array = new Int16Array(4);
        arr.$_set(0, Double.NaN);
        arr.$_set(1, Double.POSITIVE_INFINITY);
        arr.$_set(2, -Double.POSITIVE_INFINITY);
        arr.$_set(3, 0);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(3)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_0400
     * @tc.name int16ArraySortPart01Test004
     * @tc.desc Merged batch (4 tests): bounds, wrapping and truncation before ordering: wrapped $_set values, copied boundary elements, out-of-range wrap in a filled array and mapfn products.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort() keeps int16-wrapped $_set values in ascending order ---
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 32768);
        arr.$_set(1, 0);
        arr.$_set(2, 3);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(3);

        let arr2: Int16Array = new Int16Array(3);
        arr2.$_set(0, -32769);
        arr2.$_set(1, 0);
        arr2.$_set(2, 3);
        arr2.sort();
        expect(arr2.$_get(0)).assertEqual(0);
        expect(arr2.$_get(1)).assertEqual(3);
        expect(arr2.$_get(2)).assertEqual(32767);
      }

      // --- [2] Verify default sort on a copy-constructed array holding the int16 boundaries yields ascending order ---
      {
        let cp: Int16Array = new Int16Array(Int16Array.of(32767, -32768, 0));
        let r: Int16Array = cp.sort();
        expect(r.$_get(0)).assertEqual(-32768);
        expect(r.$_get(1)).assertEqual(0);
        expect(r.$_get(2)).assertEqual(32767);
      }

      // --- [3] Verify default sort on a length-constructed array filled via $_set with out-of-range values wraps them into the int16 range ---
      {
        let arr: Int16Array = new Int16Array(2);
        arr.$_set(0, 40000);
        arr.$_set(1, -40000);
        let r: Int16Array = arr.sort();
        let copy: Int16Array = r.slice(0);
        expect(copy.$_get(0)).assertEqual(-25536);
        expect(copy.$_get(1)).assertEqual(25536);
      }

      // --- [4] Verify default sort on an array built by from(Array, mapfn) whose products wrap sorts ascending ---
      {
        let src: int[] = [20000, 10000];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v * 2);
        let r: Int16Array = arr.sort();
        expect(r.$_get(0)).assertEqual(-25536);
        expect(r.$_get(1)).assertEqual(20000);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_0500
     * @tc.name int16ArraySortPart01Test005
     * @tc.desc Merged batch (5 tests): compareFn return-value semantics: zero keeping relative order, positive declaring greater, constant -1 reversing, always-zero preserving order and a large positive leaving the pair unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort() compareFn returning 0 treats elements as equal maintaining relative order ---
      {
        let arr: Int16Array = new Int16Array([0, -32768]);
        arr.sort((a: number, b: number): int => { return 0; });
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(-32768);
      }

      // --- [2] Verify sort() compareFn returning 1 declares first argument greater than second ---
      {
        let arr: Int16Array = new Int16Array([0, -32768]);
        arr.sort((a: number, b: number): int => { return 1; });
        expect(arr.join(',')).assertEqual('0,-32768');
        expect(arr.at(1)).assertEqual(-32768);
      }

      // --- [3] Verify sort() compareFn returning constant -1 reverses a two-element array ---
      {
        let arr: Int16Array = new Int16Array([-32768, 0]);
        arr.sort((a: number, b: number): int => { return -1; });
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(-32768);
      }

      // --- [4] Verify sort() compareFn always returning 0 on multi-element array preserves original order ---
      {
        let arr: Int16Array = new Int16Array([32767, -32768, 0]);
        arr.sort((a: number, b: number): int => { return 0; });
        expect(arr.$_get(0)).assertEqual(32767);
        expect(arr.$_get(1)).assertEqual(-32768);
        expect(arr.$_get(2)).assertEqual(0);
      }

      // --- [5] Verify sort() with a compareFn returning a large positive value leaves the pair order unchanged ---
      {
        let arr: Int16Array = new Int16Array([1 as number, 0 as number]);
        arr.sort((a: number, b: number): int => { return 32768; });
        expect(arr.$_get(0)).assertEqual(1 as number);
        expect(arr.$_get(1)).assertEqual(0 as number);
        arr.sort((a: number, b: number): int => { return 65535; });
        expect(arr.$_get(0)).assertEqual(1 as number);
        expect(arr.$_get(1)).assertEqual(0 as number);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_0600
     * @tc.name int16ArraySortPart01Test006
     * @tc.desc Merged batch (4 tests): custom compareFn orderings: ceil-halving with BYTES_PER_ELEMENT, a block-body if-else comparator, and named ascending and descending functions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a Math.ceil-halving compareFn sorts a three-element array and keeps BYTES_PER_ELEMENT 2 ---
      {
        let arr: Int16Array = Int16Array.of(8, 3, 5);
        arr.sort((a: number, b: number): int => (Math.ceil(a / 2) - Math.ceil(b / 2)).toInt());
        expect(arr.BYTES_PER_ELEMENT).assertEqual(2);
        expect(arr.$_get(0)).assertEqual(3);
      }

      // --- [2] Verify a block-body arrow compareFn using if-else returns -1/1/0 and sorts ascending ---
      {
        let arr: Int16Array = Int16Array.of(32767, -100, 0, 100);
        arr.sort((a: number, b: number): int => {
          if (a < b) { return -1; }
          if (a > b) { return 1; }
          return 0;
        });
        expect(arr.$_get(0)).assertEqual(-100);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(100);
        expect(arr.$_get(3)).assertEqual(32767);
      }

      // --- [3] Verify compareFn as named top-level function with explicit return types sorts ascending ---
      {
        let arr: Int16Array = Int16Array.of(0, -100, 100, -32768);
        arr.sort(ascendCompare);
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(-100);
        expect(arr.$_get(2)).assertEqual(0);
        expect(arr.$_get(3)).assertEqual(100);
      }

      // --- [4] Verify compareFn as named top-level function sorts descending ---
      {
        let arr: Int16Array = Int16Array.of(-32768, 0, 32767, -100);
        arr.sort(descendCompare);
        expect(arr.$_get(0)).assertEqual(32767);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(-100);
        expect(arr.$_get(3)).assertEqual(-32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_0700
     * @tc.name int16ArraySortPart01Test007
     * @tc.desc Merged batch (5 tests): construction sources: Set, identity-mapfn, mapfn, $_set-filled and copied sources sorted in either direction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort(a-b) ascending on an array built by from(Set) yields ascending order ---
      {
        let s: Set<int> = new Set<int>();
        s.add(9);
        s.add(7);
        s.add(8);
        let arr: Int16Array = Int16Array.from(s);
        let r: Int16Array = arr.sort((a: number, b: number): int => (a - b).toInt());
        expect(r.$_get(0)).assertEqual(7);
        expect(r.$_get(2)).assertEqual(9);
      }

      // --- [2] Verify sort(b-a) descending on an array built by from(Array, identity mapfn) yields descending order ---
      {
        let src: int[] = [3, 1, 2];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v);
        let r: Int16Array = arr.sort((a: number, b: number): int => (b - a).toInt());
        expect(r.$_get(0)).assertEqual(3);
        expect(r.$_get(2)).assertEqual(1);
      }

      // --- [3] Verify default sort on an array built by from(Array, mapfn) yields ascending order ---
      {
        let src: int[] = [4, 3, 2, 1];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v * 2);
        let r: Int16Array = arr.sort();
        expect(r.$_get(0)).assertEqual(2);
        expect(r.$_get(3)).assertEqual(8);
      }

      // --- [4] Verify sort(b-a) descending on a length-constructed array filled via $_set yields descending order ---
      {
        let arr: Int16Array = new Int16Array(3);
        arr.$_set(0, 1);
        arr.$_set(1, 5);
        arr.$_set(2, 3);
        let r: Int16Array = arr.sort((a: number, b: number): int => (b - a).toInt());
        expect(r.$_get(0)).assertEqual(5);
        expect(r.$_get(2)).assertEqual(1);
      }

      // --- [5] Verify sort(a-b) on an array built by from(another Int16Array) yields ascending discrete values ---
      {
        let src: Int16Array = Int16Array.of(3, 1, 2);
        let arr: Int16Array = Int16Array.from(src);
        arr.sort((a: number, b: number): int => (a - b).toInt());
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(1)).assertEqual(2);
        expect(arr.$_get(2)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_0800
     * @tc.name int16ArraySortPart01Test008
     * @tc.desc Merged batch (5 tests): return value and chaining: same-instance mutation, then $_get(0), fill, reverse and toReversed chains.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort(compareFn) returns same Int16Array instance verified by same-instance mutation ---
      {
        let arr: Int16Array = new Int16Array([32767, 0, -32768]);
        let result: Int16Array = arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
        result.$_set(1, 88 as number);
        expect(arr.$_get(1)).assertEqual(88 as number);
      }

      // --- [2] Verify chained sort().$_get(0) returns correct sorted first element ---
      {
        let arr: Int16Array = new Int16Array([32767, -32768, 0]);
        expect(arr.sort().$_get(0)).assertEqual(-32768);
      }

      // --- [3] Verify chained sort().fill(0).$_get(0) returns 0 after fill ---
      {
        let arr: Int16Array = new Int16Array([32767, -32768, 0]);
        arr.sort().fill(0);
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(0);
      }

      // --- [4] Verify chained sort().reverse().$_get(0) returns last element of sorted order ---
      {
        let arr: Int16Array = new Int16Array([0, -32768, 32767]);
        expect(arr.sort().reverse().$_get(0)).assertEqual(32767);
      }

      // --- [5] Verify chained sort().toReversed() reverses the ascending order ---
      {
        let arr: Int16Array = Int16Array.of(3, 1, 2);
        let r: Int16Array = arr.sort().toReversed();
        expect(r.$_get(0)).assertEqual(3);
        expect(r.$_get(2)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_0900
     * @tc.name int16ArraySortPart01Test009
     * @tc.desc Merged batch (5 tests): post-sort reads and derived consumers: entries values and indexes, at(-1), a non-decreasing entries scan ending at the maximum, join text and values order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify iterating sort() result with entries() reads ascending values and contiguous indexes ---
      {
        let arr: Int16Array = Int16Array.of(3, 1, 2);
        arr.sort();
        let runningSum: number = 0;
        let indexSum: number = 0;
        let seen: string = '';
        for (const e of arr.entries()) {
          runningSum = runningSum + e[1];
          indexSum = indexSum + e[0];
          seen = seen + e[1].toString() + ',';
        }
        expect(runningSum).assertEqual(6);
        expect(indexSum).assertEqual(3);
        expect(seen).assertEqual('1,2,3,');
      }

      // --- [2] Verify at(-1) on the sort() result returns the maximum element ---
      {
        let arr: Int16Array = Int16Array.of(11, 3, 8);
        arr.sort();
        expect(arr.at(-1)).assertEqual(11);
      }

      // --- [3] Verify the values seen through entries() after sort() are non-decreasing and end at the maximum ---
      {
        let arr: Int16Array = Int16Array.of(5, 3, 8, 1);
        arr.sort();
        let nonDecreasing: boolean = true;
        let prev: number = arr.$_get(0);
        for (const e of arr.entries()) {
          if (e[1] < prev) {
            nonDecreasing = false;
          }
          prev = e[1];
        }
        expect(nonDecreasing).assertTrue();
        expect(prev).assertEqual(8);
      }

      // --- [4] Verify sort() then join(",") matches expected ascending text ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767, -1);
        arr.sort();
        expect(arr.join(",")).assertEqual("-32768,-32768,-1,0,32767");
      }

      // --- [5] Verify sort() then values() iterates in non-decreasing order ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767);
        arr.sort();
        let prev: number = -99999;
        let ordered: boolean = true;
        let it: IterableIterator<Number> = arr.values();
        let next: IteratorResult<Number> = it.next();
        while (!next.done) {
          let val: number = next.value as number;
          if (val < prev) {
            ordered = false;
          }
          prev = val;
          next = it.next();
        }
        expect(ordered).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_1000
     * @tc.name int16ArraySortPart01Test010
     * @tc.desc Merged batch (4 tests): default ascending order and stability: ascending results across sign classes, a-b versus b-a on boundaries, an equal-value comparator call and a twenty-item descending input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort() default ascending on single elements, mixed-sign, all-positive and all-negative arrays returns ascending order ---
      {
        let arr: Int16Array = new Int16Array([0]);
        expect(arr.sort()).assertEqual(arr);
        expect(arr.$_get(0)).assertEqual(0);

        let arr2: Int16Array = new Int16Array([-32768]);
        arr2.sort();
        expect(arr2.$_get(0)).assertEqual(-32768);
        expect(arr2.length).assertEqual(1);

        let arr3: Int16Array = new Int16Array([100, -100, 0]);
        arr3.sort();
        expect(arr3.$_get(0)).assertEqual(-100);
        expect(arr3.$_get(1)).assertEqual(0);
        expect(arr3.$_get(2)).assertEqual(100);

        let arr4: Int16Array = new Int16Array([50, 10, 30]);
        arr4.sort();
        expect(arr4.$_get(0)).assertEqual(10);
        expect(arr4.$_get(1)).assertEqual(30);
        expect(arr4.$_get(2)).assertEqual(50);

        let arr5: Int16Array = new Int16Array([-10, -50, -30]);
        arr5.sort();
        expect(arr5.$_get(0)).assertEqual(-50);
        expect(arr5.$_get(1)).assertEqual(-30);
        expect(arr5.$_get(2)).assertEqual(-10);
      }

      // --- [2] Verify a-b sorts ascending and b-a sorts descending over the same int16 bounds ---
      {
        let sources: int[][] = [[32767, -32768, 0], [-32768, 0, 32767]];
        let ascending: boolean[] = [true, false];
        let expected: int[][] = [[-32768, 0, 32767], [32767, 0, -32768]];
        for (let i: int = 0; i < sources.length; i++) {
          let arr: Int16Array = Int16Array.from(sources[i]);
          let asc: boolean = ascending[i];
          arr.sort((a: number, b: number): int => { return asc ? (a - b).toInt() : (b - a).toInt(); });
          for (let j: int = 0; j < expected[i].length; j++) {
            expect(arr.$_get(j)).assertEqual(expected[i][j]);
          }
        }
      }

      // --- [3] Verify a sort((a,b)=>a-b) compareFn is invoked with an equal-value pair when duplicates exist ---
      {
        let arr: Int16Array = new Int16Array([0, 0, -32768]);
        let equalPairSeen: boolean = false;
        arr.sort((a: number, b: number): int => {
          if (a === b) { equalPairSeen = true; }
          return (a - b).toInt();
        });
        expect(equalPairSeen).assertTrue();
      }

      // --- [4] Verify sort() multi-passes a twenty-element descending Int16Array into ascending order ---
      {
        let arr: Int16Array = new Int16Array(20);
        for (let i: int = 0; i < 20; i++) {
          arr.$_set(i, 20 - i);
        }
        arr.sort();
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(19)).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_1100
     * @tc.name int16ArraySortPart01Test011
     * @tc.desc Merged batch (5 tests): ordering behavior: non-decreasing adjacent pairs, a tail write followed by a second sort, identity-map endpoints, with() isolation and descending two-element order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort() makes adjacent pairs monotonically non-decreasing ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, 32767, -32768, -1, 100, -100);
        arr.sort();
        let monotonic: boolean = true;
        for (let i: int = 0; i < arr.length - 1; i = i + 1) {
          if (arr.$_get(i) > arr.$_get(i + 1)) {
            monotonic = false;
          }
        }
        expect(monotonic).assertTrue();
      }

      // --- [2] Verify sort then set tail then sort again orders correctly ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767);
        arr.sort();
        let src: Int16Array = Int16Array.of(-1000, -2000);
        arr.set(src, 2);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(3)).assertEqual(-1000);
      }

      // --- [3] Verify sort then map identity preserves sorted endpoints ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767, -1);
        arr.sort();
        let mapped: Int16Array = arr.map((v: number, idx: int, a: Int16Array): number => {
          return v;
        });
        expect(mapped.$_get(0)).assertEqual(-32768);
        expect(mapped.$_get(4)).assertEqual(32767);
      }

      // --- [4] Verify sort then with creates new array without mutating original ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767);
        arr.sort();
        let substitute: Int16Array = arr.with(0, 999);
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(substitute.$_get(0)).assertEqual(999);
      }

      // --- [5] Verify sort(compareFn b-a) orders a two-element array descending ---
      {
        let arr: Int16Array = new Int16Array([0, 3]);
        let result: Int16Array = arr.sort((a: number, b: number): int => { return (b - a).toInt(); });
        expect(result.$_get(0)).assertEqual(3);
        expect(result.$_get(1)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_1200
     * @tc.name int16ArraySortPart01Test012
     * @tc.desc Merged batch (5 tests): zero-length and single-element sources: the same reference comes back with visible mutation, chaining and empty cases, no compareFn call, and values kept.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort() and sort(compareFn) return the same reference as original array, mutation visible through result, empty and single-element arrays return the same reference ---
      {
        let arr: Int16Array = Int16Array.of(32767, -1, 3);
        expect(arr.sort()).assertEqual(arr);

        let arr2: Int16Array = Int16Array.of(-1, 32767);
        expect(arr2.sort((a: number, b: number): int => (a - b).toInt())).assertEqual(arr2);

        let arr3: Int16Array = Int16Array.of(-1, 32767, 0);
        let result3: Int16Array = arr3.sort();
        arr3.$_set(1, 50);
        expect(result3.$_get(1)).assertEqual(50);

        let arr4: Int16Array = new Int16Array();
        expect(arr4.sort()).assertEqual(arr4);

        let arr5: Int16Array = Int16Array.of(-1);
        expect(arr5.sort()).assertEqual(arr5);
      }

      // --- [2] Verify sort() returns this same reference (chaining and empty array) ---
      {
        let arr: Int16Array = Int16Array.of(5, 1, 3);
        let result: Int16Array = arr.sort().fill(0);
        expect(result.$_get(0)).assertEqual(0);
        expect(result).assertEqual(arr);

        let arr2: Int16Array = new Int16Array(0);
        let result2: Int16Array = arr2.sort();
        expect(result2).assertEqual(arr2);
        expect(result2.length).assertEqual(0);
      }

      // --- [3] Verify sort() does not invoke compareFn for empty or single-element arrays ---
      {
        let called: boolean = false;
        let arr: Int16Array = new Int16Array(0);
        arr.sort((a: number, b: number): int => {
          called = true;
          return 0;
        });
        expect(called).assertFalse();
        expect(arr.length).assertEqual(0);

        let arr2: Int16Array = Int16Array.of(99);
        arr2.sort((a: number, b: number): int => {
          called = true;
          return (a - b).toInt();
        });
        expect(arr2.$_get(0)).assertEqual(99);
        expect(called).assertFalse();
      }

      // --- [4] Verify sort() on single-element Int16Array keeps value ---
      {
        let arr: Int16Array = Int16Array.of(42);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(42);

        let arr2: Int16Array = Int16Array.of(77);
        arr2.sort();
        expect(arr2.length).assertEqual(1);

        let arr3: Int16Array = Int16Array.of(-32768);
        arr3.sort();
        expect(arr3.$_get(0)).assertEqual(-32768);
      }

      // --- [5] Verify sort() on single-element Int16Array is a no-op ---
      {
        let arr: Int16Array = Int16Array.of(32768);
        arr.sort();
        expect(arr.length).assertEqual(1);
        expect(arr.$_get(0)).assertEqual(-32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_1300
     * @tc.name int16ArraySortPart01Test013
     * @tc.desc Single test: a value-triggered throw inside a sort() comparator reaches the caller.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort() compareFn conditionally throws on a specific value triggers error propagation ---
      {
        let arr: Int16Array = Int16Array.of(-32768, 0, 32767, 100);
        let thrown: boolean = false;
        try {
          arr.sort((a: number, b: number): int => {
            if (a === 32767) { throw new TypeError("hit MAX"); }
            return (a - b).toInt();
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('TypeError');

          thrown = true;
        }
        expect(thrown).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_1400
     * @tc.name int16ArraySortPart01Test014
     * @tc.desc Merged batch (4 tests): bounds, wrapping and truncation before ordering: fractional $_set truncation, Set boundaries, repeated 32768 wraps and a four-element boundary array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify default sort on a length-constructed array filled via $_set with fractional values truncates them toward zero ---
      {
        let arr: Int16Array = new Int16Array(2);
        arr.$_set(0, 3.7);
        arr.$_set(1, -3.7);
        let r: Int16Array = arr.sort();
        expect(r.$_get(0)).assertEqual(-3);
        expect(r.$_get(1)).assertEqual(3);
      }

      // --- [2] Verify default sort on an array built by from(Set) with the int16 boundaries yields the ascending boundary order ---
      {
        let s: Set<int> = new Set<int>();
        s.add(32767);
        s.add(-32768);
        let arr: Int16Array = Int16Array.from(s);
        let r: Int16Array = arr.sort();
        expect(r.$_get(0)).assertEqual(-32768);
        expect(r.$_get(1)).assertEqual(32767);
      }

      // --- [3] Verify default sort() orders wrapped 32768 elements as -32768 ahead of positive and negative remainders for one overflow and for three repeated overflows ---
      {
        let single: Int16Array = Int16Array.of(32768, 0, 1, -1, 32767);
        let repeated: Int16Array = Int16Array.of(32768, 100, 32768, -100, 32768);
        let inputs: Int16Array[] = [single, repeated];
        let expected: string[] = ['-32768,-1,0,1,32767', '-32768,-32768,-32768,-100,100'];
        for (let k: int = 0; k < inputs.length; k++) {
          inputs[k].sort();
          expect(inputs[k].join(',')).assertEqual(expected[k]);
        }
      }

      // --- [4] Verify default sort() orders a four-element array containing an int16 boundary ascending ---
      {
        let arr: Int16Array = Int16Array.of(3, -32768, 0, 32767);
        arr.sort();
        let want: number[] = [-32768, 0, 3, 32767];
        expect(Array.from(arr)).assertDeepEquals(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_1500
     * @tc.name int16ArraySortPart01Test015
     * @tc.desc Merged batch (5 tests): views and shared buffers: length and first element of a buffer-backed sort, comparator updating shared data, offset-view buffer identity, preserved metadata and subarray sharing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify buffer-backed sort() length and sorted first element ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 32767);
        arr.$_set(1, -1);
        let result: Int16Array = arr.sort();
        expect(result.length).assertEqual(2);
        expect(result.$_get(0)).assertEqual(-1);
      }

      // --- [2] Verify buffer-backed sort(compareFn) updates shared buffer data order ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, -1);
        arr.$_set(1, 32767);
        arr.$_set(2, 3);
        arr.sort((a: number, b: number): int => (b - a).toInt());
        let view: Int16Array = new Int16Array(buf);
        expect(view.$_get(0)).assertEqual(32767);
        expect(view.$_get(1)).assertEqual(3);
        expect(view.$_get(2)).assertEqual(-1);
      }

      // --- [3] Verify non-zero offset view sort() keeps original buffer reference ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf, 2, 2);
        arr.$_set(0, -1);
        arr.$_set(1, 32767);
        let result: Int16Array = arr.sort();
        expect(result.buffer).assertEqual(buf);
      }

      // --- [4] Verify sort() preserves length byteLength byteOffset BYTES_PER_ELEMENT and buffer on a non-zero-offset view ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf, 2, 2);
        arr.$_set(0, 32768);
        arr.$_set(1, -1);
        let lenBefore: int = arr.length;
        let bytesBefore: int = arr.byteLength;
        let offBefore: int = arr.byteOffset;
        let bpe: int = arr.BYTES_PER_ELEMENT;
        let bufBefore: ArrayBuffer = arr.buffer;
        arr.sort();
        expect(arr.length).assertEqual(lenBefore);
        expect(arr.byteLength).assertEqual(bytesBefore);
        expect(arr.byteOffset).assertEqual(offBefore);
        expect(arr.BYTES_PER_ELEMENT).assertEqual(bpe);
        expect(arr.buffer).assertEqual(bufBefore);
        expect(arr.$_get(0)).assertEqual(-32768);
      }

      // --- [5] Verify sort() then subarray().sort() mutates shared parent range ---
      {
        let arr: Int16Array = Int16Array.of(32768, -1, 0, 32767, -32768);
        arr.sort();
        let sub: Int16Array = arr.subarray(0, 3);
        sub.sort((a: number, b: number): int => { return (b - a).toInt(); });
        expect(arr.$_get(0)).assertEqual(-1);
        expect(arr.$_get(2)).assertEqual(-32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_1600
     * @tc.name int16ArraySortPart01Test016
     * @tc.desc Merged batch (5 tests): compareFn return-value semantics: -32769 swapping a pair, a-b on negatives, positive meaning greater, sign inversion yielding descending and a large constant leaving order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort() compareFn returning -32769 swaps pair order ---
      {
        let arr: Int16Array = new Int16Array([0 as number, 1 as number]);
        arr.sort((a: number, b: number): int => { return -32769; });
        expect(arr.$_get(0)).assertEqual(1 as number);
        expect(arr.$_get(1)).assertEqual(0 as number);
      }

      // --- [2] Verify compareFn returning a minus b as int sorts negative values correctly ---
      {
        let arr: Int16Array = new Int16Array([-100, -32768, -1]);
        arr.sort((a: number, b: number): int => { return (a - b).toInt(); });
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(-100);
        expect(arr.$_get(2)).assertEqual(-1);
      }

      // --- [3] Verify sort(compareFn) returning positive int means a > b ---
      {
        let arr: Int16Array = Int16Array.of(0, -1, 32767);
        arr.sort((a: number, b: number): int => {
            if (a > b) { return 1; }
            if (a < b) { return -1; }
            return 0;
        });
        expect(arr.$_get(0)).assertEqual(-1);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(32767);
      }

      // --- [4] Verify a sort() compareFn returning positive when a<b and negative when a>b yields descending order ---
      {
        let arr: Int16Array = Int16Array.of(-1, 32767, 0);
        arr.sort((a: number, b: number): int => {
            if (a > b) { return -1; }
            if (a < b) { return 1; }
            return 0;
        });
        expect(arr.$_get(0)).assertEqual(32767);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(-1);
      }

      // --- [5] Verify a sort() compareFn returning a large positive constant leaves element order unchanged ---
      {
        let arr: Int16Array = Int16Array.of(5, 4, 3, 2);
        let copy: Int16Array = Int16Array.from(arr);
        arr.sort((a: number, b: number): int => { return 200000; });
        for (let i: int = 0; i < arr.length; i++) {
          expect(arr.$_get(i)).assertEqual(copy.$_get(i));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_1700
     * @tc.name int16ArraySortPart01Test017
     * @tc.desc Merged batch (5 tests): custom compareFn orderings: a function expression, evens before odds, external weights, absolute-value ordering and an undefined comparator acting as default.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify compareFn as function expression assigned to variable sorts ascending ---
      {
        let ascFn: (a: number, b: number) => int = (a: number, b: number): int => {
          return (a - b).toInt();
        };
        let arr: Int16Array = Int16Array.of(100, -100, 0, -32768);
        arr.sort(ascFn);
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(-100);
        expect(arr.$_get(2)).assertEqual(0);
        expect(arr.$_get(3)).assertEqual(100);
      }

      // --- [2] Verify a sort() compareFn can impose a non-numeric ordering such as evens before odds ---
      {
        let arr: Int16Array = Int16Array.of(0, 1, 2, 3, 4, 5);
        arr.sort((a: number, b: number): int => {
          let aEven: boolean = (a % 2) === 0;
          let bEven: boolean = (b % 2) === 0;
          if (aEven && !bEven) { return -1; }
          if (!aEven && bEven) { return 1; }
          return (a - b).toInt();
        });
        expect(arr.$_get(0) % 2).assertEqual(0);
        expect(arr.$_get(1) % 2).assertEqual(0);
        expect(arr.$_get(2) % 2).assertEqual(0);
      }

      // --- [3] Verify sort(compareFn) ordering by an external weight array sorts elements by weight ---
      {
        let weights: Int16Array = Int16Array.of(3, 1, 2);
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        arr.sort((a: number, b: number): int => {
          let ia: int = (a / 10 - 1).toInt();
          let ib: int = (b / 10 - 1).toInt();
          return (weights.$_get(ia) - weights.$_get(ib)).toInt();
        });
        expect(arr.$_get(0)).assertEqual(20);
        expect(arr.$_get(2)).assertEqual(10);
      }

      // --- [4] Verify compareFn using Math.abs to sort by absolute value ---
      {
        let arr: Int16Array = Int16Array.of(-100, 0, 50, -32768);
        arr.sort((a: number, b: number): int => {
          let absA: int = Math.abs(a).toInt();
          let absB: int = Math.abs(b).toInt();
          return (absA - absB).toInt();
        });
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(50);
        expect(arr.$_get(2)).assertEqual(-100);
        expect(arr.$_get(3)).assertEqual(-32768);
      }

      // --- [5] Verify compareFn passed as undefined to sort on multi-element array acts as default ---
      {
        let arr: Int16Array = Int16Array.of(32767, -100, 0, -32768);
        arr.sort(undefined);
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(-100);
        expect(arr.$_get(2)).assertEqual(0);
        expect(arr.$_get(3)).assertEqual(32767);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_1800
     * @tc.name int16ArraySortPart01Test018
     * @tc.desc Merged batch (5 tests): construction sources: Map keys ascending and descending, of(), a copied source's maximum at the last index and Array.from preservation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify default sort on an array built by from(Map.keys()) orders the numeric keys ascending ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(3, 'c');
        m.set(1, 'a');
        m.set(2, 'b');
        let arr: Int16Array = Int16Array.from(m.keys());
        arr.sort();
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(2)).assertEqual(3);
      }

      // --- [2] Verify sort(b-a) on an array built by from(Map.keys()) yields descending text order ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(3, 'c');
        m.set(1, 'a');
        m.set(2, 'b');
        let arr: Int16Array = Int16Array.from(m.keys());
        arr.sort((a: number, b: number): int => (b - a).toInt());
        expect(arr.join(',')).assertEqual('3,2,1');
      }

      // --- [3] Verify sort() default numeric ascending order on an array built by of() ---
      {
        let arr: Int16Array = Int16Array.of(5, 1, 3);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(1)).assertEqual(3);
        expect(arr.$_get(2)).assertEqual(5);
      }

      // --- [4] Verify sort(a-b) on an array built by from(another Int16Array) yields the largest value at the last index ---
      {
        let src: Int16Array = Int16Array.of(9, 4, 7);
        let arr: Int16Array = Int16Array.from(src);
        arr.sort((a: number, b: number): int => (a - b).toInt());
        expect(arr.lastIndexOf(9)).assertEqual(2);
      }

      // --- [5] Verify converting the sort() result with Array.from() preserves length and ordered endpoints ---
      {
        let arr: Int16Array = Int16Array.of(2, 9, 5);
        arr.sort();
        let copy: number[] = Array.from(arr);
        expect(copy.length).assertEqual(3);
        expect(copy[0]).assertEqual(2);
        expect(copy[2]).assertEqual(9);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_1900
     * @tc.name int16ArraySortPart01Test019
     * @tc.desc Merged batch (5 tests): return value and chaining: with(0,100), reverse, join(',') and repeated ascending or descending-then-ascending comparator chains.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify chained sort().with(0,100) overwrites index 0 of the ascending order ---
      {
        let arr: Int16Array = Int16Array.of(2, 3, 1);
        let r: Int16Array = arr.sort().with(0, 100);
        expect(r.$_get(0)).assertEqual(100);
        expect(r.$_get(1)).assertEqual(2);
        expect(r.$_get(2)).assertEqual(3);
      }

      // --- [2] Verify sort().reverse() chain reverses the sorted result ---
      {
        let arr: Int16Array = Int16Array.of(0, -1, 32767);
        let result: Int16Array = arr.sort().reverse();
        expect(result.$_get(0)).assertEqual(32767);
        expect(result.$_get(1)).assertEqual(0);
        expect(result.$_get(2)).assertEqual(-1);
      }

      // --- [3] Verify sort().join(',') chain returns sorted string representation ---
      {
        let arr: Int16Array = Int16Array.of(32767, -1, 3);
        expect(arr.sort().join(',')).assertEqual('-1,3,32767');
      }

      // --- [4] Verify chaining an ascending compareFn twice leaves the array sorted ascending ---
      {
        let arr: Int16Array = Int16Array.of(32768, -32768, 0, 32767);
        arr.sort((a: number, b: number): int => { return (a - b).toInt(); })
           .sort((a: number, b: number): int => { return (a - b).toInt(); });
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(3)).assertEqual(32767);
      }

      // --- [5] Verify chaining a descending then an ascending compareFn results in ascending order ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767);
        arr.sort((a: number, b: number): int => { return (b - a).toInt(); })
           .sort((a: number, b: number): int => { return (a - b).toInt(); });
        expect(arr.join(',')).assertEqual('-32768,-32768,0,32767');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_2000
     * @tc.name int16ArraySortPart01Test020
     * @tc.desc Merged batch (5 tests): post-sort reads and derived consumers: copyWithin before and after sort, partial set then sort, fill over the first half and a slice subsequence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin then sort produces ascending order ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767, -1, 100);
        arr.copyWithin(0, 3, 6);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-1);
        expect(arr.$_get(arr.length - 1)).assertEqual(32767);
      }

      // --- [2] Verify sort then copyWithin overwrites leading elements ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767, -1, 50);
        arr.sort();
        arr.copyWithin(0, 3, 5);
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(50);
      }

      // --- [3] Verify set partial elements then sort orders correctly ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767);
        let src: Int16Array = Int16Array.of(500, 600);
        arr.set(src, 2);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(3)).assertEqual(600);
      }

      // --- [4] Verify sort then fill covers first half with zeros ---
      {
        let arr: Int16Array = Int16Array.of(32768, 0, -32768, 32767, -1, 50);
        arr.sort();
        arr.fill(0, 0, 3);
        expect(arr.$_get(0)).assertEqual(0);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(0);
      }

      // --- [5] Verify sort then slice keeps ordered subsequence ---
      {
        let arr: Int16Array = Int16Array.of(32768, -32768, 0, 32767, -1);
        arr.sort();
        let sliced: Int16Array = arr.slice(1, 4);
        expect(sliced.$_get(0)).assertEqual(-32768);
        expect(sliced.$_get(2)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_2100
     * @tc.name int16ArraySortPart01Test021
     * @tc.desc Merged batch (4 tests): default ascending order and stability: always-zero comparator on three- and four-element arrays, an already-ascending array, descending and positive reordering, and a two-element pair.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort(compareFn) always returning 0 keeps original relative order on 3-element and descending 4-element arrays ---
      {
        let arr: Int16Array = Int16Array.of(32767, -1, 3);
        arr.sort((a: number, b: number): int => { return 0; });
        expect(arr.$_get(0)).assertEqual(32767);
        expect(arr.$_get(1)).assertEqual(-1);
        expect(arr.$_get(2)).assertEqual(3);

        let arr2: Int16Array = Int16Array.of(32767, 3, 0, -1);
        arr2.sort((a: number, b: number): int => { return 0; });
        expect(arr2.$_get(0)).assertEqual(32767);
        expect(arr2.$_get(1)).assertEqual(3);
        expect(arr2.$_get(2)).assertEqual(0);
        expect(arr2.$_get(3)).assertEqual(-1);
      }

      // --- [2] Verify sort() on already ascending array stays unchanged ---
      {
        let arr: Int16Array = Int16Array.of(-32768, -1, 0, 3, 32767);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(-1);
        expect(arr.$_get(2)).assertEqual(0);
        expect(arr.$_get(3)).assertEqual(3);
        expect(arr.$_get(4)).assertEqual(32767);
      }

      // --- [3] Verify sort() reorders a descending array and an unsorted all-positive array to ascending order ---
      {
        let arr: Int16Array = Int16Array.of(32767, 3, 0, -1, -32768);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(-1);
        expect(arr.$_get(2)).assertEqual(0);
        expect(arr.$_get(3)).assertEqual(3);
        expect(arr.$_get(4)).assertEqual(32767);

        let pos: Int16Array = Int16Array.of(30, 10, 20);
        pos.sort();
        expect(pos.$_get(0)).assertEqual(10);
        expect(pos.$_get(1)).assertEqual(20);
        expect(pos.$_get(2)).assertEqual(30);
      }

      // --- [4] Verify default sort() reorders a two-element descending pair into ascending order ---
      {
        let arr: Int16Array = Int16Array.of(32767, -1);
        arr.sort();
        expect(arr.$_get(0)).assertEqual(-1);
        expect(arr.$_get(1)).assertEqual(32767);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SORT_PART01_2200
     * @tc.name int16ArraySortPart01Test022
     * @tc.desc Merged batch (2 tests): ordering behavior: toString() and toLocaleString() text after sort().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArraySortPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify sort() then toString() renders the sorted elements as comma-separated text ---
      {
        let arr: Int16Array = new Int16Array([3, 0, 0]);
        expect(arr.sort().toString()).assertEqual('0,0,3');
      }

      // --- [2] Verify sort() then toLocaleString() renders text containing the sorted elements ---
      {
        let arr: Int16Array = new Int16Array([3, 0]);
        let str: string = arr.sort().toLocaleString();
        let r_1: int = str.indexOf('0');
        let e_1: int = -1;
        expect(r_1).not().assertEqual(e_1);
        let r_2: int = str.indexOf('3');
        let e_2: int = -1;
        expect(r_2).not().assertEqual(e_2);
        let r_3: boolean = str.indexOf('0') < str.indexOf('3');
        expect(r_3).assertTrue();
        expect(arr.join(',')).assertEqual('0,3');
      }
    });

  });
}
