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

export default function int16ArrayAtPart02Test(): void {
  describe('Int16ArrayAtPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_0100
     * @tc.name int16ArrayAtPart02Test001
     * @tc.desc Merged batch (5 tests): algorithmic scans and aggregations: early-break value search, paired parseInt-index sum, minimum-index scan, adjacent-order check and prefix sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() accepts an index located by an early-break search for a value ---
      {
        let arr: Int16Array = Int16Array.of(4, 8, 12, 16);
        let pos: int = -1;
        for (let i: int = 0; i < arr.length; i++) {
          if (arr.at(i) === 12) {
            pos = i;
            break;
          }
        }
        expect(pos).assertEqual(2);
        expect(arr.at(pos)).assertEqual(12);
      }

      // --- [2] Verify a loop reading at() with two Number.parseInt indices sums the selected elements ---
      {
        let arr: Int16Array = Int16Array.of(30, 40, 50, 60);
        let idxs: int[] = [Number.parseInt('0', 10).toInt(), Number.parseInt('3', 10).toInt()];
        let sum: number = 0;
        for (let i: int = 0; i < idxs.length; i++) {
          sum = sum + (arr.at(idxs[i]) as number);
        }
        expect(sum).assertEqual(90);
      }

      // --- [3] Verify at() finds the index of the smallest element by manual comparison ---
      {
        let arr: Int16Array = Int16Array.of(6, 1, 8, 3);
        let mi: int = 0;
        for (let i: int = 1; i < arr.length; i++) {
          if ((arr.at(i) as number) < (arr.at(mi) as number)) {
            mi = i;
          }
        }
        expect(arr.at(mi) as number).assertEqual(1);
      }

      // --- [4] Verify at() comparisons across adjacent indexes confirm ascending order ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let asc: boolean = true;
        for (let i: int = 1; i < arr.length; i++) {
          if ((arr.at(i) as number) < (arr.at(i - 1) as number)) {
            asc = false;
          }
        }
        expect(asc).assertTrue();
      }

      // --- [5] Verify at() accumulates a running prefix sum ending at the full total ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let running: number = 0;
        let last: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          running = running + (arr.at(i) as number);
          last = running;
        }
        let want: int = 10;
        expect(last).assertEqual(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_0200
     * @tc.name int16ArrayAtPart02Test002
     * @tc.desc Merged batch (5 tests): buffer sharing and views: subarray/parent writes, DataView interop, $_set readback and copyWithin().subarray() reads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify subarray shares buffer: a sub $_set updates only the shared parent slot ---
      {
        let parent: Int16Array = new Int16Array([10, 20, 30, 40]);
        let sub: Int16Array = parent.subarray(1, 3);
        sub.$_set(0, 88);
        expect(parent.at(1)).assertEqual(88);
        expect(parent.at(2)).assertEqual(30);
      }

      // --- [2] Verify a parent write outside the subarray range leaves the subarray view unchanged ---
      {
        let parent: Int16Array = new Int16Array([10, 20, 30, 40]);
        let sub: Int16Array = parent.subarray(1, 3);
        parent.$_set(0, 99);
        expect(sub.at(0)).assertEqual(20);
        expect(parent.at(0)).assertEqual(99);
      }

      // --- [3] Verify DataView.setInt16 values are read back by at() at the matching byte offsets ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf);
        let dv: DataView = new DataView(buf);
        dv.setInt16(0, 55, true);
        expect(arr.at(0)!).assertEqual(55);

        let buf2: ArrayBuffer = new ArrayBuffer(6);
        let arr2: Int16Array = new Int16Array(buf2);
        let dv2: DataView = new DataView(buf2);
        dv2.setInt16(2, 33, true);
        expect(arr2.at(1)!).assertEqual(33);
      }

      // --- [4] Verify Int16Array $_set then DataView.getInt16 equals at(0) ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let arr: Int16Array = new Int16Array(buf);
        let dv: DataView = new DataView(buf);
        arr.$_set(0, 77);
        let dvVal: number = dv.getInt16(0, true);
        expect(arr.at(0)!).assertEqual(dvVal);
      }

      // --- [5] Verify at(0) and at(-1) read the copied elements after a copyWithin().subarray() chain ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        let view: Int16Array = arr.copyWithin(0, 2).subarray(0, 2);
        expect(view.at(0)).assertEqual(30);
        expect(view.at(-1)).assertEqual(40);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_0300
     * @tc.name int16ArrayAtPart02Test003
     * @tc.desc Merged batch (5 tests): out-of-range and empty arrays: typeof and undefined results across positive/negative bounds, empty versus non-empty arrays, and constructor families.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify typeof at() on out-of-range index returns undefined for non-empty and empty arrays, and oob result equals undefined ---
      {
        let arr1: Int16Array = Int16Array.of(10, 20);
        let arr2: Int16Array = Int16Array.of(1, 2, 3);
        let arr3: Int16Array = Int16Array.of(5, 10);
        let arrs: Int16Array[] = [arr1, arr2, arr3];
        let oob: int[] = [2, 4, -3];
        for (let i: int = 0; i < arrs.length; i++) {
          let result: Number | undefined = arrs[i].at(oob[i]);
          expect(typeof result).assertEqual('undefined');
        }
        let empty: Int16Array = new Int16Array();
        let emptyOob: int[] = [0, -1, 5];
        for (let j: int = 0; j < emptyOob.length; j++) {
          let result: Number | undefined = empty.at(emptyOob[j]);
          expect(typeof result).assertEqual('undefined');
        }
        let arrX: Int16Array = Int16Array.of(1, 2);
        let resultX: Number | undefined = arrX.at(99);
        expect(typeof resultX).assertEqual('undefined');
        expect(resultX).assertUndefined();
      }

      // --- [2] Verify at() returns undefined for both positive out-of-bounds (at(length)) and negative out-of-bounds (at(-length-1)) ---
      {
        let arr: Int16Array = Int16Array.of(1, 2);
        expect(arr.at(arr.length)).assertUndefined();
        expect(arr.at(-arr.length - 1)).assertUndefined();
      }

      // --- [3] Verify at(0) on non-empty array is not undefined ---
      {
        let arr: Int16Array = Int16Array.of(42);
        let result: Number | undefined = arr.at(0);
        let r_1: boolean = result !== undefined;
        expect(r_1).assertTrue();
        expect(result as number).assertEqual(42);
      }

      // --- [4] Verify at() out-of-range index returns undefined across construction families ---
      {
        let arr1: Int16Array = Int16Array.of(42);
        let arr2: Int16Array = Int16Array.of(100, 200);
        let arr3: Int16Array = Int16Array.of(-32768);
        let arrs: Int16Array[] = [arr1, arr2, arr3];
        let oob: int[] = [1, 2, 1];
        for (let i: int = 0; i < arrs.length; i++) {
          expect(arrs[i].at(oob[i])).assertEqual(undefined);
        }
        let arr4: Int16Array = Int16Array.of(5, 10, 15);
        expect(arr4.at(3)).assertEqual(undefined);

        let arr5: Int16Array = Int16Array.from([10, 20, 30, 40]);
        expect(arr5.at(4)).assertEqual(undefined);

        let arr6: Int16Array = Int16Array.of(100, 200, 300);
        expect(arr6.at(3)).assertEqual(undefined);

        let buf1: ArrayBuffer = new ArrayBuffer(6);
        let arr7: Int16Array = new Int16Array(buf1);
        expect(arr7.at(3)).assertEqual(undefined);

        let buf2: ArrayBuffer = new ArrayBuffer(10);
        let arr8: Int16Array = new Int16Array(buf2, 2, 2);
        expect(arr8.at(2)).assertEqual(undefined);

        let arr9: Int16Array = new Int16Array(5);
        expect(arr9.at(10)).assertEqual(undefined);

        let arr10: Int16Array = Int16Array.of(2, 4, 6);
        expect(arr10.at(5)).assertEqual(undefined);

        let arr11: Int16Array = Int16Array.of(8, 16);
        let r11: Number | undefined = arr11.at(10);
        let r12: Number | undefined = arr11.at(20);
        let r13: Number | undefined = arr11.at(-10);
        expect(r11).assertEqual(undefined);
        expect(r12).assertEqual(undefined);
        expect(r13).assertEqual(undefined);
      }

      // --- [5] Verify at() returns undefined for a negative out-of-range index on empty and 10-element arrays ---
      {
        let empty: Int16Array = new Int16Array(0);
        let emptyOob: int[] = [-1];
        for (let i: int = 0; i < emptyOob.length; i++) {
          let result: Number | undefined = empty.at(emptyOob[i]);
          expect(result).assertEqual(undefined);
        }
        let arr: Int16Array = Int16Array.from([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        let arrOob: int[] = [-11];
        for (let j: int = 0; j < arrOob.length; j++) {
          let result: Number | undefined = arr.at(arrOob[j]);
          expect(result).assertEqual(undefined);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_0400
     * @tc.name int16ArrayAtPart02Test004
     * @tc.desc Single test: at() yields undefined beyond either end of an FR16 array, including a negative index before the start.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() on an FR16 array returns undefined for both a past-end and a negative past-start index ---
      {
        let base: Int16Array = Int16Array.of(4, 5);
        let arr: Int16Array = Int16Array.from(base);
        expect(arr.at(2)).assertUndefined();
        expect(arr.at(-3)).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_0500
     * @tc.name int16ArrayAtPart02Test005
     * @tc.desc Merged batch (5 tests): post-mutation reads: $_set fills, copy-constructed isolation, a negative index, repeated writes and reverse().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() reads elements after $_set fills a length-constructed array ---
      {
        let arr: Int16Array = new Int16Array(5);
        for (let i: int = 0; i < 5; i++) {
          arr.$_set(i, i * 3 + 1);
        }
        expect(arr.at(0)).assertEqual(1);
        expect(arr.at(3)).assertEqual(10);
        expect(arr.at(-1)).assertEqual(13);
        expect(arr.at(5)).assertUndefined();
      }

      // --- [2] Verify at() on a copy-constructed from(another) array sees a $_set write that leaves the source intact ---
      {
        let base: Int16Array = Int16Array.of(5, 10, 15);
        let arr: Int16Array = new Int16Array(Int16Array.from(base));
        arr.$_set(0, 99);
        expect(arr.at(0)).assertEqual(99);
        expect(base.at(0)).assertEqual(5);
      }

      // --- [3] Verify at() returns the $_set value by index 1 and by negative index -10 resolving to index 40 ---
      {
        let lengths: int[] = [3, 50];
        let setIndices: int[] = [1, 40];
        let written: int[] = [77, 555];
        let readIndices: int[] = [1, -10];
        for (let i: int = 0; i < lengths.length; i++) {
          let arr: Int16Array = new Int16Array(lengths[i]);
          arr.$_set(setIndices[i], written[i]);
          expect(arr.at(readIndices[i])).assertEqual(written[i]);
        }
      }

      // --- [4] Verify at(0) after multiple $_set writes returns the latest value ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        arr.$_set(0, 100);
        arr.$_set(0, 200);
        expect(arr.at(0)).assertEqual(200);
      }

      // --- [5] Verify at(0) after reverse() returns the reversed first element ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        arr.reverse();
        expect(arr.at(0)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_0600
     * @tc.name int16ArrayAtPart02Test006
     * @tc.desc Merged batch (5 tests): post-mutation reads: filled $_set sequence, with() copy isolation, reverse plus copyWithin, range-limited fill and set(Int16Array).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() reads elements at positive and negative indices after a filled $_set sequence ---
      {
        let arr: Int16Array = new Int16Array(5);
        for (let i: int = 0; i < arr.length; i++) {
          arr.$_set(i, i * 10);
        }
        expect(arr.at(0)!).assertEqual(0);
        expect(arr.at(2)!).assertEqual(20);
        expect(arr.at(-1)!).assertEqual(40);
      }

      // --- [2] Verify at() on the original array is unchanged after with() returns a modified copy ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30]);
        let newArr: Int16Array = arr.with(0, 99);
        expect(arr.at(0)!).assertEqual(10);
        expect(newArr.at(0)!).assertEqual(99);
      }

      // --- [3] Verify at() reads the reordered elements after reverse() then copyWithin() ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        arr.reverse();
        arr.copyWithin(0, 1);
        expect(arr.at(0)).assertEqual(3);
        expect(arr.at(1)).assertEqual(2);
      }

      // --- [4] Verify fill() zeroes only the selected index range leaving at(0) and at(3) unchanged ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7, 5);
        arr.fill(0, 1, 3);
        expect(arr.at(0)).assertEqual(5);
        expect(arr.at(1)).assertEqual(0);
        expect(arr.at(2)).assertEqual(0);
        expect(arr.at(3)).assertEqual(5);
      }

      // --- [5] Verify at() reads the copied elements after set(Int16Array) into a target ---
      {
        let arr: Int16Array = new Int16Array(4);
        arr.set(Int16Array.of(100, 200), 1);
        expect(arr.at(0)).assertEqual(0);
        expect(arr.at(1)).assertEqual(100);
        expect(arr.at(2)).assertEqual(200);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_0700
     * @tc.name int16ArrayAtPart02Test007
     * @tc.desc Merged batch (5 tests): construction sources: Uint8Array receiver, from(Array), length-constructed zero fill, copy-construction and from(Set) agreement with $_get.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() reads elements of an Int16Array whose source is a Uint8Array receiver ---
      {
        let src: Uint8Array = new Uint8Array([5, 6, 7]);
        let arr: Int16Array = new Int16Array(src);
        expect(arr.at(0)).assertEqual(5);
        expect(arr.at(-1)).assertEqual(7);
      }

      // --- [2] Verify at(0) on an array built by from(Array) returns the single element ---
      {
        let arr: Int16Array = Int16Array.from([88]);
        expect(arr.at(0)).assertEqual(88);
      }

      // --- [3] Verify at(0) on a zero-filled length-constructed array returns 0 ---
      {
        let arr: Int16Array = new Int16Array(3);
        expect(arr.at(0)).assertEqual(0);
      }

      // --- [4] Verify at(0) on copy-constructed Int16Array returns source value ---
      {
        let src: Int16Array = Int16Array.of(123);
        let arr: Int16Array = new Int16Array(src);
        expect(arr.at(0)).assertEqual(123);
      }

      // --- [5] Verify at() equals $_get() at the matching index on an array built by from(Set) ---
      {
        let s: Set<int> = new Set<int>();
        s.add(4);
        s.add(8);
        s.add(12);
        let arr: Int16Array = Int16Array.from(s);
        expect(arr.at(0)).assertEqual(arr.$_get(0));
        expect(arr.at(-1)).assertEqual(arr.$_get(2));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_0800
     * @tc.name int16ArrayAtPart02Test008
     * @tc.desc Merged batch (5 tests): index argument forms: literal/arithmetic, iterator count, Math.round, Math.ceil and lastIndexOf.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() accepts both a literal index and an arithmetic index expression ---
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300);
        expect(arr.at(0)).assertEqual(100);

        let n: int = 0;
        let idx: int = n + 1;
        expect(arr.at(idx)).assertEqual(200);
      }

      // --- [2] Verify at() with an index equal to the values() iterator count minus one reads the last element ---
      {
        let arr: Int16Array = Int16Array.of(9, 8, 7, 6);
        let count: int = 0;
        for (const v of arr.values()) {
          count = count + 1;
        }
        expect(arr.at(count - 1)).assertEqual(6);
      }

      // --- [3] Verify at() accepts an index produced by Math.round on a double ---
      {
        let arr: Int16Array = Int16Array.of(20, 40, 60);
        let tags: string[] = ['low', 'mid', 'high'];
        let x: double = 1.4;
        let idx: int = Math.round(x).toInt();
        expect(arr.at(idx)).assertEqual(40);
        expect(tags[idx]).assertEqual('mid');
      }

      // --- [4] Verify at() accepts an index produced by Math.ceil on a fractional double ---
      {
        let arr: Int16Array = Int16Array.of(7, 14, 21);
        let x: double = 0.2;
        let idx: int = Math.ceil(x).toInt();
        let tail: Int16Array = arr.subarray(idx);
        expect(arr.at(idx)).assertEqual(14);
        expect(tail.length).assertEqual(2);
      }

      // --- [5] Verify at() with the position from lastIndexOf reads the matched element ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 1, 2);
        let pos: int = arr.lastIndexOf(2);
        expect(arr.at(pos)).assertEqual(2);
        expect(pos).assertEqual(arr.length - 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_0900
     * @tc.name int16ArrayAtPart02Test009
     * @tc.desc Merged batch (5 tests): index argument forms: parseInt, four arithmetic operators, modulo hash, scientific notation and Math.trunc.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() accepts a parseInt(...).toInt() conversion expression as index ---
      {
        let arr: Int16Array = Int16Array.of(50, 51, 52, 53);
        expect(arr.at(parseInt('2').toInt())).assertEqual(52);
      }

      // --- [2] Verify at() accepts arithmetic index expressions using addition, subtraction, multiplication and division and reads the selected element ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60, 70, 80);

        let addA: int = 1;
        let addB: int = 2;
        expect(arr.at(addA + addB)).assertEqual(40);

        let subA: int = 6;
        let subB: int = 2;
        expect(arr.at(subA - subB)).assertEqual(50);

        let mulA: int = 1;
        let mulB: int = 5;
        expect(arr.at(mulA * mulB)).assertEqual(60);

        let divA: int = 14;
        let divB: int = 2;
        expect(arr.at((divA / divB).toInt())).assertEqual(80);
      }

      // --- [3] Verify at() accepts an int modulo expression hash % size as index ---
      {
        let arr: Int16Array = Int16Array.of(20, 21, 22, 23, 24);
        let hash: int = 17;
        let size: int = 5;
        expect(arr.at(hash % size)).assertEqual(22);
      }

      // --- [4] Verify at() accepts a scientific-notation index on an array built from scientific-notation values ---
      {
        let arr: Int16Array = Int16Array.of(1e2, 2e2, 3e2, 4e2);
        let idx: double = 2e0;
        expect(arr.at(idx.toInt())).assertEqual(300);
      }

      // --- [5] Verify at() accepts an index produced by Math.trunc on a double ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
        let x: double = 2.9;
        let idx: int = Math.trunc(x).toInt();
        expect(arr.at(idx)).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_1000
     * @tc.name int16ArrayAtPart02Test010
     * @tc.desc Merged batch (3 tests): index argument forms: nested at(), indexOf after includes, and a sibling at(0).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify nested at(at(0).toInt()) reads element 30 via inner index 3 and via negative index -2 ---
      {
        let heads: int[] = [3, -2];
        for (let i: int = 0; i < heads.length; i++) {
          let arr: Int16Array = new Int16Array([heads[i], 10, 20, 30, 40]);
          let idx: int = arr.at(0)!.toInt();
          expect(arr.at(idx)!).assertEqual(30);
        }
      }

      // --- [2] Verify at() with the position from indexOf reads the element after an includes check ---
      {
        let arr: Int16Array = Int16Array.of(3, 9, 27);
        let present: boolean = arr.includes(9);
        let pos: int = arr.indexOf(9);
        let r_1: number | undefined = arr.at(pos);
        expect(present).assertTrue();
        expect(r_1).assertEqual(9);
      }

      // --- [3] Verify at() with an index taken from the at(0) of a sibling array reads the chosen element ---
      {
        let other: Int16Array = Int16Array.of(0, 2);
        let arr: Int16Array = Int16Array.of(5, 10, 15);
        let idx: int = (other.at(-1) as number).toInt();
        let head: number | undefined = arr.at((other.at(0) as number).toInt());
        let picked: number | undefined = arr.at(idx);
        expect(head).assertEqual(5);
        expect(picked).assertEqual(15);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_1100
     * @tc.name int16ArrayAtPart02Test011
     * @tc.desc Merged batch (5 tests): direct index reads: of() constructions, last element, last keys() entry, findLastIndex and Array.from length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at(0) returns first element on Int16Array.of with single, all-zero, same-value, negative, and varied constructions ---
      {
        let arr: Int16Array = Int16Array.of(42);
        expect(arr.at(0)).assertEqual(42);

        let zero: Int16Array = Int16Array.of(0, 0, 0);
        expect(zero.at(0)).assertEqual(0);

        let same: Int16Array = Int16Array.of(7, 7, 7);
        expect(same.at(0)).assertEqual(7);

        let neg: Int16Array = Int16Array.of(-5, -10, -15);
        expect(neg.at(0)).assertEqual(-5);

        let pair: Int16Array = Int16Array.of(100, 200);
        expect(pair.at(0)).assertEqual(100);

        let three: Int16Array = Int16Array.of(100, 200, 300);
        expect(three.at(0)).assertEqual(100);
      }

      // --- [2] Verify at(-1) reads the last element directly, returning 50 ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        expect(arr.at(-1)).assertEqual(50);
      }

      // --- [3] Verify at() with the last key of the keys() iterator reads the last element ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33);
        let lastKey: int = 0;
        for (const k of arr.keys()) {
          lastKey = k;
        }
        expect(arr.at(lastKey)).assertEqual(33);
        expect(arr.length).assertEqual(lastKey + 1);
      }

      // --- [4] Verify at(findLastIndex) equals the findLast match value ---
      {
        let arr: Int16Array = Int16Array.of(5, 12, 5, 12);
        let idx: int = arr.findLastIndex((x: number): boolean => x === 12);
        expect(arr.at(idx)).assertEqual(arr.findLast((x: number): boolean => x === 12) as number);
      }

      // --- [5] Verify at() with an index of Array.from length minus one reads the trailing element ---
      {
        let src: number[] = [100, 200, 300];
        let arr: Int16Array = Int16Array.from(Array.from(src));
        expect(arr.at(arr.length - 1)).assertEqual(300);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_1200
     * @tc.name int16ArrayAtPart02Test012
     * @tc.desc Single test: negative and positive indices read the same three FR16 elements, pairing -1/-2/-3 with 2/1/0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() reads a three-element FR16 array at indices -1, -2 and -3 ---
      {
        let base: Int16Array = Int16Array.of(7, 8, 9);
        let arr: Int16Array = Int16Array.from(base);
        let r_1: number | undefined = arr.at(-1);
        let r_2: number | undefined = arr.at(-2);
        let r_3: number | undefined = arr.at(-3);
        expect(r_1).assertEqual(9);
        expect(r_2).assertEqual(8);
        expect(r_3).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_1300
     * @tc.name int16ArrayAtPart02Test013
     * @tc.desc Merged batch (5 tests): algorithmic scans and aggregations: alternating sum, index-weighted sum, even-index sum, while-loop sum and nested index-pair products.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() computes an alternating add and subtract sum over the indexes ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let total: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          if (i % 2 === 0) {
            total = total + (arr.at(i) as number);
          } else {
            total = total - (arr.at(i) as number);
          }
        }
        let want: int = -20;
        expect(total).assertEqual(want);
      }

      // --- [2] Verify at() computes an index-weighted sum of the elements in a scan ---
      {
        let arr: Int16Array = Int16Array.of(2, 3, 4);
        let total: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          total = total + i * (arr.at(i) as number);
        }
        let want: int = 11;
        expect(total).assertEqual(want);
      }

      // --- [3] Verify at() sums only the elements sitting at even indexes ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9, 12);
        let total: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          if (i % 2 === 0) {
            total = total + (arr.at(i) as number);
          }
        }
        let want: int = 12;
        expect(total).assertEqual(want);
      }

      // --- [4] Verify a while loop reading at(i) sums all elements of an FR16 array ---
      {
        let base: Int16Array = Int16Array.of(6, 12, 18);
        let arr: Int16Array = Int16Array.from(base);
        let i: int = 0;
        let sum: number = 0;
        while (i < arr.length) {
          sum = sum + (arr.at(i) as number);
          i = i + 1;
        }
        expect(sum).assertEqual(36);
      }

      // --- [5] Verify at() nested index scans sum the products of every index pair ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let total: number = 0;
        for (let i: int = 0; i < arr.length; i++) {
          for (let j: int = i + 1; j < arr.length; j++) {
            total = total + (arr.at(i) as number) * (arr.at(j) as number);
          }
        }
        let want: int = 11;
        expect(total).assertEqual(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_1400
     * @tc.name int16ArrayAtPart02Test014
     * @tc.desc Merged batch (3 tests): buffer sharing and views: subarray fill, DataView write and subarray $_set readback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify fill(-1) through a subarray(1,3) view makes the parent at(1) read -1 ---
      {
        let arr: Int16Array = Int16Array.of(0, 0, 0, 0);
        arr.subarray(1, 3).fill(-1);
        expect(arr.at(0)).assertEqual(0);
        expect(arr.at(1)).assertEqual(-1);
        expect(arr.at(3)).assertEqual(0);
      }

      // --- [2] Verify at() reads a value written through a DataView on the buffer of a from(another) array ---
      {
        let base: Int16Array = Int16Array.of(1, 2);
        let arr: Int16Array = Int16Array.from(base);
        let dv: DataView = new DataView(arr.buffer);
        dv.setInt16(0, 300, true);
        expect(arr.at(0)).assertEqual(300);
      }

      // --- [3] Verify a $_set through a subarray of an FR16 array is read back by the parent at() ---
      {
        let base: Int16Array = Int16Array.of(1, 2, 3, 4);
        let arr: Int16Array = Int16Array.from(base);
        let sub: Int16Array = arr.subarray(1, 3);
        sub.$_set(0, 77);
        expect(arr.at(1)).assertEqual(77);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_1500
     * @tc.name int16ArrayAtPart02Test015
     * @tc.desc Merged batch (5 tests): out-of-range and empty arrays: extreme boundary indices, stored zero versus undefined, large out-of-range values, length-derived index and array intact after out-of-range read.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() with far int boundary indices returns undefined ---
      {
        let arr1: Int16Array = Int16Array.of(10, 20, 30);
        expect(arr1.at(2147483647)).assertEqual(undefined);

        let arr2: Int16Array = Int16Array.of(5, 10, 15);
        expect(arr2.at(-2147483648)).assertEqual(undefined);
      }

      // --- [2] Verify at() distinguishes a stored zero element from an out-of-range undefined ---
      {
        let arr: Int16Array = Int16Array.of(0);
        let validResult: Number | undefined = arr.at(0);
        let oobResult: Number | undefined = arr.at(1);
        expect(validResult as number).assertEqual(0);
        expect(oobResult).assertEqual(undefined);
      }

      // --- [3] Verify at() returns undefined for index 100 and for Integer.MIN_VALUE plus one on a two-element array ---
      {
        let arr: Int16Array = Int16Array.of(10, 20);
        expect(arr.at(100)).assertUndefined();
        expect(arr.at(-2147483647)).assertUndefined();
      }

      // --- [4] Verify at() with length-derived variable index out-of-range returns undefined ---
      {
        let arr1: Int16Array = Int16Array.of(3, 6, 9);
        let len1: int = arr1.length;
        expect(arr1.at(len1)).assertEqual(undefined);

        let arr2: Int16Array = Int16Array.of(1, 2, 3, 4);
        let idx2: int = arr2.length + 1;
        expect(arr2.at(idx2)).assertEqual(undefined);

        let arr3: Int16Array = Int16Array.of(5, 10, 15);
        let idx3: int = -arr3.length - 1;
        expect(arr3.at(idx3)).assertEqual(undefined);

        let arr4: Int16Array = Int16Array.of(2, 4);
        let idx4: int = -arr4.length - 2;
        expect(arr4.at(idx4)).assertEqual(undefined);

        let arr5: Int16Array = Int16Array.of(5, 10, 15);
        expect(arr5.at(3)).assertEqual(undefined);
      }

      // --- [5] Verify at() reads the correct element after an out-of-range index left the array intact ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33);
        expect(arr.at(100)).assertEqual(undefined);

        let validResult: Number | undefined = arr.at(0);
        expect(validResult as number).assertEqual(11);
        expect(arr.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_1600
     * @tc.name int16ArrayAtPart02Test016
     * @tc.desc Merged batch (5 tests): boundary values and truncation: overflow wrap, MAX/MIN, hexadecimal 0x8000, all-32767 array and int16.MAX.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() reads the int16-wrapped value after an overflowing $_set ---
      {
        let arr: Int16Array = new Int16Array(2);
        arr.$_set(1, -32769);
        expect(arr.at(1)).assertEqual(32767);

        let arr2: Int16Array = new Int16Array(2);
        arr2.$_set(0, 32768);
        arr2.$_set(1, -32769);
        expect(arr2.at(-2)).assertEqual(-32768);
      }

      // --- [2] Verify at() reads int16 MAX and MIN boundary elements on an array built by from(Set) ---
      {
        let s: Set<int> = new Set<int>();
        s.add(32767);
        s.add(-32768);
        s.add(0);
        let arr: Int16Array = Int16Array.from(s);
        expect(arr.at(0)).assertEqual(32767);
        expect(arr.at(1)).assertEqual(-32768);
        expect(arr.at(-3)).assertEqual(32767);
      }

      // --- [3] Verify at() reads hexadecimal element literal 0x8000 as the wrapped negative int16 bound ---
      {
        let arr: Int16Array = Int16Array.of(0x8000, 1, 0x8000);
        expect(arr.at(0)).assertEqual(-32768);
        expect(arr.at(-1)).assertEqual(-32768);
      }

      // --- [4] Verify at() reads every position of an all-32767 array as the positive int16 bound ---
      {
        let arr: Int16Array = Int16Array.of(32767, 32767, 32767);
        let r_1: number | undefined = arr.at(0);
        let r_2: number | undefined = arr.at(1);
        let r_3: number | undefined = arr.at(2);
        expect(r_1).assertEqual(32767);
        expect(r_2).assertEqual(32767);
        expect(r_3).assertEqual(32767);
      }

      // --- [5] Verify at(0) returns the exact int16.MAX boundary value ---
      {
        let arr: Int16Array = new Int16Array([32767]);
        expect(arr.at(0)).assertEqual(32767);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_1700
     * @tc.name int16ArrayAtPart02Test017
     * @tc.desc Merged batch (5 tests): post-mutation reads: copyWithin, sort, agreement with $_get, toReversed and toSorted versus the original.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at(0) after copyWithin() reads the copied element ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        arr.copyWithin(0, 2);
        expect(arr.at(0)).assertEqual(3);
      }

      // --- [2] Verify at(0) after sort() returns the sorted first element ---
      {
        let arr: Int16Array = Int16Array.from([30, 10, 20]);
        arr.sort();
        expect(arr.at(0)).assertEqual(10);
      }

      // --- [3] Verify at() equals $_get() across indices on length-constructor Int16Array(4) filled via $_set ---
      {
        let arr: Int16Array = new Int16Array(4);
        for (let i: int = 0; i < 4; i++) {
          arr.$_set(i, 100 - i * 10);
        }
        expect(arr.at(0)).assertEqual(arr.$_get(0));
        expect(arr.at(3)).assertEqual(arr.$_get(3));
      }

      // --- [4] Verify at() reads the reversed-first and original-first elements from a toReversed() copy ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let rev: Int16Array = arr.toReversed();
        expect(rev.at(0)).assertEqual(30);
        expect(rev.at(-1)).assertEqual(10);
        expect(arr.at(0)).assertEqual(10);
      }

      // --- [5] Verify at() reads the sorted-first element from a toSorted() copy while the original first is unchanged ---
      {
        let arr: Int16Array = Int16Array.of(30, -5, 20);
        let sorted: Int16Array = arr.toSorted();
        expect(sorted.at(0)).assertEqual(-5);
        expect(sorted.at(-1)).assertEqual(30);
        expect(arr.at(0)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_1800
     * @tc.name int16ArrayAtPart02Test018
     * @tc.desc Merged batch (5 tests): post-mutation reads: copy-construction isolation, set(number[]) offsets, slice plus sort, range fill and slice(-2).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify $_set on a copy-constructed array does not affect the source and at() reads the source value ---
      {
        let src: Int16Array = Int16Array.of(7, 8, 9);
        let copy: Int16Array = new Int16Array(src);
        copy.$_set(0, 77);
        expect(src.at(0)).assertEqual(7);
        expect(copy.at(0)).assertEqual(77);
      }

      // --- [2] Verify at() reads set(number[]) elements at the offset indices ---
      {
        let arr: Int16Array = new Int16Array(4);
        let values: number[] = [3, 4];
        arr.set(values, 2);
        expect(arr.at(2)).assertEqual(3);
        expect(arr.at(3)).assertEqual(4);
      }

      // --- [3] Verify at(0) reads the unchanged first element after sort() on a slice() ---
      {
        let arr: Int16Array = Int16Array.of(9, 4, 7);
        let sl: Int16Array = arr.slice(0, 3);
        sl.sort();
        expect(sl.at(0)).assertEqual(4);
        expect(arr.at(0)).assertEqual(9);
      }

      // --- [4] Verify at(1) after fill(0,0,1) keeps the untouched middle element on an FR16 array ---
      {
        let base: Int16Array = Int16Array.of(2, 4, 6);
        let arr: Int16Array = Int16Array.from(base);
        arr.fill(0, 0, 1);
        expect(arr.at(1)).assertEqual(4);
      }

      // --- [5] Verify at() reads first and last of a slice(-2) of an FR16 array ---
      {
        let base: Int16Array = Int16Array.of(4, 8, 12, 16);
        let arr: Int16Array = Int16Array.from(base);
        let tail2: Int16Array = arr.slice(-2);
        expect(tail2.at(0)).assertEqual(12);
        expect(tail2.at(-1)).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_1900
     * @tc.name int16ArrayAtPart02Test019
     * @tc.desc Merged batch (4 tests): construction sources: mapfn, Map.values and Map.keys derived arrays plus an all-negative copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() equals $_get() at the matching index on an array built by from(Array, mapfn) ---
      {
        let src: int[] = [2, 4, 6];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v * 3);
        let r_1: number | undefined = arr.at(1);
        let g_1: number | undefined = arr.$_get(1);
        expect(r_1).assertEqual(g_1);
        expect(r_1).assertEqual(12);
      }

      // --- [2] Verify at(length-1) equals $_get(length-1) on an array built by from(Map.values()) ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('p', 8);
        m.set('q', 16);
        let arr: Int16Array = Int16Array.from(m.values());
        expect(arr.at(arr.length - 1)).assertEqual(arr.$_get(arr.length - 1));
      }

      // --- [3] Verify at(-1) equals $_get(length-1) on an array built by from(Map.keys()) ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(9, 'a');
        m.set(4, 'b');
        m.set(6, 'c');
        let arr: Int16Array = Int16Array.from(m.keys());
        expect(arr.at(-1)).assertEqual(arr.$_get(arr.length - 1));
      }

      // --- [4] Verify at() reads each element of an all-negative array built by from(another Int16Array) ---
      {
        let base: Int16Array = Int16Array.of(-1, -2, -3);
        let arr: Int16Array = Int16Array.from(base);
        expect(arr.at(0)).assertEqual(-1);
        expect(arr.at(1)).assertEqual(-2);
        expect(arr.at(-1)).assertEqual(-3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_2000
     * @tc.name int16ArrayAtPart02Test020
     * @tc.desc Merged batch (5 tests): index argument forms: Math.max, parseInt, switch dispatch, int variable and computed expression.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() accepts an index produced by Math.max of two integer candidates ---
      {
        let arr: Int16Array = Int16Array.of(4, 8, 12);
        let lo: number | undefined = arr.at(Math.min(0, 1).toInt());
        let hi: number | undefined = arr.at(Math.max(0, 1).toInt());
        expect(lo).assertEqual(4);
        expect(hi).assertEqual(8);
      }

      // --- [2] Verify at() with a Number.parseInt index reads the chosen element and the last element ---
      {
        let arr: Int16Array = Int16Array.of(5, 10, 15, 20);
        let idx: int = Number.parseInt('2', 10).toInt();
        let r_1: number | undefined = arr.at(idx);
        let r_2: number | undefined = arr.at(-1);
        expect(r_1).assertEqual(15);
        expect(r_2).assertEqual(20);
      }

      // --- [3] Verify at() reads the element selected by a switch dispatch on the index ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33);
        let idx: int = 1;
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
        let v: number = arr.at(idx) as number;
        expect(label).assertEqual('middle');
        expect(v).assertEqual(22);
      }

      // --- [4] Verify at() accepts an int-typed variable as the index argument ---
      {
        let arr: Int16Array = new Int16Array([5, 15, 25]);
        let idx: int = 0;
        let result: Number | undefined = arr.at(idx);
        expect(result as number).assertEqual(5);
      }

      // --- [5] Verify at() accepts a computed arithmetic index expression as the argument ---
      {
        let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
        let result: Number | undefined = arr.at(1 + 1);
        expect(result as number).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_2100
     * @tc.name int16ArrayAtPart02Test021
     * @tc.desc Merged batch (5 tests): index argument forms: Math.abs, bitwise AND, hexadecimal radix, negation and right shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() accepts an index produced by Math.abs negating a negative index ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9);
        let k: int = -1;
        let idx: int = Math.abs(k);
        expect(arr.at(-arr.length + idx)).assertEqual(6);
        expect(arr.at(idx)).assertEqual(6);
      }

      // --- [2] Verify at() accepts an index masked by a bitwise AND expression ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        let raw: int = 6;
        let idx: int = raw & 3;
        expect(arr.at(idx)).assertEqual(30);
      }

      // --- [3] Verify at() accepts an index parsed with a hexadecimal radix ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        let idx: int = Number.parseInt('3', 16).toInt();
        expect(arr.at(idx)).assertEqual(4);
        expect(arr.at(-1)).assertEqual(4);
      }

      // --- [4] Verify at() accepts a negated arithmetic index expression as a negative index ---
      {
        let arr: Int16Array = Int16Array.of(5, 15, 25);
        let k: int = 2;
        let idx: int = k * -1;
        expect(arr.at(idx)).assertEqual(15);
      }

      // --- [5] Verify at() accepts an index produced by a right-shift halving expression ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33, 44);
        let n: int = 6;
        let idx: int = n >> 1;
        expect(arr.at(idx)).assertEqual(44);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_2200
     * @tc.name int16ArrayAtPart02Test022
     * @tc.desc Merged batch (5 tests): equivalence with $_get and read-only behavior: same index, length-minus-one, reduced negative indices, and source/element invariance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() equals $_get() at the same in-range index on multi-element arrays ---
      {
        let arr: Int16Array = Int16Array.of(15, 25, 35);
        expect(arr.at(0)).assertEqual(arr.$_get(0));

        let mid: Int16Array = Int16Array.of(88, 99, 111);
        expect(mid.at(1)).assertEqual(mid.$_get(1));
      }

      // --- [2] Verify at(length-1) equals $_get(length-1) on multi-element array ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33, 44);
        let idx: int = 3;
        expect(arr.at(idx)).assertEqual(arr.$_get(idx));
      }

      // --- [3] Verify at(-1) and at(-2) equal $_get of the reduced indices on a multi-element array ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9, 12);
        expect(arr.at(-1)).assertEqual(arr.$_get(3));
        expect(arr.at(-2)).assertEqual(arr.$_get(2));
      }

      // --- [4] Verify at() reads without mutating the source: length and the addressed element are unchanged ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3);
        let lenBefore: int = arr.length;
        let midBefore: number = arr.$_get(1);
        expect(arr.at(1)).assertEqual(2);
        expect(arr.length).assertEqual(lenBefore);
        expect(arr.$_get(1)).assertEqual(midBefore);
      }

      // --- [5] Verify at(0) does not modify element at accessed index ---
      {
        let arr: Int16Array = new Int16Array([-32768, 0, 32767]);
        expect(arr.at(0)).assertEqual(-32768);
        expect(arr.$_get(0)).assertEqual(-32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_AT_PART02_2300
     * @tc.name int16ArrayAtPart02Test023
     * @tc.desc Merged batch (5 tests): direct index reads: reduceRight, indexOf, uniform-value scan, -0 and -length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayAtPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at() reads the last element after a reduceRight accumulation over the values ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9);
        let total: number = arr.reduceRight((acc: number, cur: number): number => acc + cur, 0);
        let r_1: number | undefined = arr.at(-1);
        expect(total).assertEqual(18);
        expect(r_1).assertEqual(9);
      }

      // --- [2] Verify at() with an index from indexOf equal to the searched value reads that element ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        let pos: int = arr.indexOf(20);
        expect(arr.at(pos)).assertEqual(20);
        expect(arr.at(-1)).assertEqual(30);
      }

      // --- [3] Verify at() confirms every element equals the first by a scan with early exit ---
      {
        let arr: Int16Array = Int16Array.of(5, 5, 5);
        let same: boolean = true;
        let first: number = arr.at(0) as number;
        for (let i: int = 1; i < arr.length; i++) {
          if ((arr.at(i) as number) !== first) {
            same = false;
            break;
          }
        }
        expect(same).assertTrue();
      }

      // --- [4] Verify at(-0) resolves to index 0 and reads the first element ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30);
        expect(arr.at(-0)).assertEqual(10);
        expect(arr.at(0)).assertEqual(10);
      }

      // --- [5] Verify at(-length) resolves to the array's first element ---
      {
        let arr: Int16Array = Int16Array.of(50, 60, 70);
        let head: Int16Array = arr.slice(0, 1);
        expect(arr.at(-3)).assertEqual(head.$_get(0));
      }
    });

  });
}
