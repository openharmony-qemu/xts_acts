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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

function referenceCopyWithin(base: number[], target: int, start: int, end: int): number[] {
  let size: int = base.length;
  let to: int = target;
  if (to < 0) {
    to = size + to;
    if (to < 0) {
      to = 0;
    }
  } else if (to > size) {
    to = size;
  }
  let from: int = start;
  if (from < 0) {
    from = size + from;
    if (from < 0) {
      from = 0;
    }
  } else if (from > size) {
    from = size;
  }
  let last: int = end;
  if (last < 0) {
    last = size + last;
    if (last < 0) {
      last = 0;
    }
  } else if (last > size) {
    last = size;
  }
  let count: int = last - from;
  let room: int = size - to;
  if (count > room) {
    count = room;
  }
  if (count < 0) {
    count = 0;
  }
  let result: number[] = [];
  for (let i: int = 0; i < size; i++) {
    if (i >= to && i < to + count) {
      result.push(base[from + (i - to)]);
    } else {
      result.push(base[i]);
    }
  }
  return result;
}

export default function int16ArrayCopyWithinPart01Test(): void {
  describe('Int16ArrayCopyWithinPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_0100
     * @tc.name int16ArrayCopyWithinPart01Test001
     * @tc.desc Merged batch (2 tests): reference implementations and rotations: copies match an independent forward-copy model across overlap, negative and clamped forms, plus a left-rotation loop.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin matches an independently computed forward-copy reference for overlapping, negative and clamped forms ---
      {
        let arrA: Int16Array = Int16Array.of(4, 8, 12, 16, 20);
        let modelA: number[] = [4, 8, 12, 16, 20];
        arrA.copyWithin(1, 0, 3);
        expect(Array.from(arrA)).assertDeepEquals(referenceCopyWithin(modelA, 1, 0, 3));

        let arrB: Int16Array = Int16Array.of(3, 6, 9, 12, 15);
        let modelB: number[] = [3, 6, 9, 12, 15];
        arrB.copyWithin(-3, -5, -2);
        expect(Array.from(arrB)).assertDeepEquals(referenceCopyWithin(modelB, -3, -5, -2));

        let arrC: Int16Array = Int16Array.of(7, 14, 21, 28);
        let modelC: number[] = [7, 14, 21, 28];
        arrC.copyWithin(3, 0);
        expect(Array.from(arrC)).assertDeepEquals(referenceCopyWithin(modelC, 3, 0, modelC.length));

        let arrD: Int16Array = Int16Array.of(2, 4, 6, 8);
        let modelD: number[] = [2, 4, 6, 8];
        arrD.copyWithin(10, 0, 2);
        expect(Array.from(arrD)).assertDeepEquals(referenceCopyWithin(modelD, 10, 0, 2));
      }

      // --- [2] Verify copyWithin() drives a while loop that left-rotates the array until the minimum reaches the front ---
      {
        let arr: Int16Array = Int16Array.of(3, 1, 2);
        let limit: int = 10;
        let steps: int = 0;
        while (arr.$_get(0) !== 1 && steps < limit) {
          let head: number = arr.$_get(0);
          arr.copyWithin(0, 1);
          arr.$_set(2, head);
          steps = steps + 1;
        }
        expect(steps).assertEqual(1);
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(1)).assertEqual(2);
        expect(arr.$_get(2)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_0200
     * @tc.name int16ArrayCopyWithinPart01Test002
     * @tc.desc Merged batch (3 tests): views and shared buffers: view construction from the return value, window copy on an ArrayBuffer view, and DataView readback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin return can construct ArrayBuffer view ---
      {
        let arr: Int16Array = Int16Array.of(7, 8, 9, 10);
        let ret: Int16Array = arr.copyWithin(2, 0, 2);
        let view: Int16Array = new Int16Array(ret.buffer, ret.byteOffset, ret.length);
        expect(view.$_get(0)).assertEqual(7);
        expect(view.$_get(2)).assertEqual(7);
      }

      // --- [2] Verify copyWithin(0,1,3) on an ArrayBuffer view filled via $_set copies the source window to the front ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let arr: Int16Array = new Int16Array(buf, 0, 4);
        arr.$_set(0, 2);
        arr.$_set(1, 4);
        arr.$_set(2, 6);
        arr.$_set(3, 8);
        arr.copyWithin(0, 1, 3);
        let exp: int[] = [4, 6, 6, 8];
        for (let i: int = 0; i < exp.length; i++) {
          expect(arr.$_get(i)).assertEqual(exp[i]);
        }
      }

      // --- [3] Verify a DataView over the buffer of a copyWithin(0,1,2) result reads the copied value ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 10);
        arr.$_set(1, 20);
        arr.$_set(2, 30);
        arr.copyWithin(0, 1, 2);
        let dv: DataView = new DataView(arr.buffer);
        expect(dv.getInt16(0, true)).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_0300
     * @tc.name int16ArrayCopyWithinPart01Test003
     * @tc.desc Merged batch (5 tests): boundary values and truncation: int16 wrapping of copied literals, hexadecimal 0x8000, -Infinity, DBL_MAX, and no throw for empty/NaN/Infinity datasets.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin copies an out-of-int16 literal and the element wraps to -25536 ---
      {
        let arr: Int16Array = Int16Array.of(40000, 2, 3, 4, 5);
        let wrapped: number = arr.$_get(0);
        arr.copyWithin(3, 0, 1);
        expect(arr.$_get(3)).assertEqual(wrapped);
        expect(wrapped).assertEqual(-25536);
      }

      // --- [2] Verify copyWithin with 0x8000 keeps truncated value readable via buffer ---
      {
        let arr: Int16Array = Int16Array.of(0x8000, 1, 2, 3);
        arr.copyWithin(2, 0, 2);
        let view: Int16Array = new Int16Array(arr.buffer, 0, 4);
        expect(view.$_get(2)).assertEqual(-32768);
        expect(view.$_get(3)).assertEqual(1);
      }

      // --- [3] Verify copyWithin copies Number.NEGATIVE_INFINITY as 0 ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, Number.NEGATIVE_INFINITY, 4);
        arr.copyWithin(1, 2, 3);
        expect(arr.$_get(1)).assertEqual(0);
      }

      // --- [4] Verify copyWithin of a DBL_MAX source element propagates the int16-wrapped value 0 to the destination slot ---
      {
        let arr: Int16Array = Int16Array.of(1.7976931348623157e308, 2, 3);
        arr.copyWithin(2, 0, 1);
        expect(arr.$_get(2)).assertEqual(0);
      }

      // --- [5] Verify copyWithin does not throw for empty array, NaN, Infinity, and huge double element sets ---
      {
        let arr1: Int16Array = new Int16Array(0);
        let ret1: Int16Array = arr1.copyWithin(0, 0, 0);
        expect(ret1.length).assertEqual(0);

        let arr2: Int16Array = Int16Array.of(Number.NaN, 2, 3, 4);
        arr2.copyWithin(0, 1, 3);
        expect(arr2.$_get(0)).assertEqual(2);

        let arr3: Int16Array = Int16Array.of(Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY, 1, 2);
        arr3.copyWithin(2, 0, 2);
        expect(arr3.$_get(2)).assertEqual(0);

        let arr4: Int16Array = Int16Array.of(1, 1.7976931348623157e308, 3);
        arr4.copyWithin(0, 1, 2);
        expect(arr4.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_0400
     * @tc.name int16ArrayCopyWithinPart01Test004
     * @tc.desc Merged batch (5 tests): return value and chaining: fill and reverse chains, a four-call chain, set-target reuse and forEach iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify target>=length copyWithin chained with fill still works ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9);
        arr.copyWithin(5, 0, 1).fill(99, 1, 2);
        expect(arr.join(',')).assertEqual('3,99,9');
      }

      // --- [2] Verify negative-arg copyWithin chained with reverse content ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
        let ret: Int16Array = arr.copyWithin(-3, -5, -2);
        ret.reverse();
        expect(arr.$_get(0)).assertEqual(33);
        expect(arr.$_get(1)).assertEqual(22);
        expect(arr.$_get(2)).assertEqual(11);
        expect(arr.$_get(3)).assertEqual(22);
        expect(arr.$_get(4)).assertEqual(11);
      }

      // --- [3] Verify a four-call copyWithin/fill/reverse/sort chain returns the same array reference ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8, 10);
        expect(arr.copyWithin(2, 0, 1).fill(1, 0, 1).reverse().sort()).assertEqual(arr);
      }

      // --- [4] Verify copyWithin return can be used as set target array ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        let ret: Int16Array = arr.copyWithin(0, 2, 4);
        let other: Int16Array = Int16Array.of(88, 99);
        ret.set(other, 3);
        expect(arr.$_get(3)).assertEqual(88);
        expect(arr.$_get(4)).assertEqual(99);
      }

      // --- [5] Verify copyWithin return can be iterated with forEach ---
      {
        let arr: Int16Array = Int16Array.of(3, 6, 9, 12);
        let ret: Int16Array = arr.copyWithin(1, 2, 4);
        let acc: number = 0;
        ret.forEach((v: number, _idx: int, _src: Int16Array) => {
          acc = acc + v;
        });
        expect(acc).assertEqual(36);
        expect(arr.$_get(0)).assertEqual(3);
        expect(arr.$_get(1)).assertEqual(9);
        expect(arr.$_get(2)).assertEqual(12);
        expect(arr.$_get(3)).assertEqual(12);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_0500
     * @tc.name int16ArrayCopyWithinPart01Test005
     * @tc.desc Merged batch (5 tests): post-copy reads and derived consumers: joined string, keys(), entries() sums, filtered tail shift and includes/$_get head.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two-arg copyWithin(0,1) with omitted end on a copy-constructed array yields the expected joined string ---
      {
        let arr: Int16Array = new Int16Array(Int16Array.of(3, 1, 4, 1));
        arr.copyWithin(0, 1);
        expect(arr.join(',')).assertEqual('1,4,1,1');
      }

      // --- [2] Verify keys() on a copyWithin(0,1,3) result yields contiguous indexes ending at length minus one ---
      {
        let arr: Int16Array = Int16Array.of(4, 5, 6);
        arr.copyWithin(0, 1, 3);
        let count: number = 0;
        let last: number = -1;
        for (const k of arr.keys()) {
          count = count + 1;
          last = k;
        }
        expect(count).assertEqual(3);
        expect(last).assertEqual(2);
      }

      // --- [3] Verify entries() on a copyWithin(1,0,2) result of a from(Map.keys()) array sums index and value together ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(10, 'a');
        m.set(20, 'b');
        m.set(30, 'c');
        let arr: Int16Array = Int16Array.from(m.keys());
        arr.copyWithin(1, 0, 2);
        let sumIdx: number = 0;
        let sumVal: number = 0;
        for (const e of arr.entries()) {
          sumIdx = sumIdx + e[0];
          sumVal = sumVal + e[1];
        }
        expect(sumIdx).assertEqual(3);
        expect(sumVal).assertEqual(40);
      }

      // --- [4] Verify copyWithin on a filtered array shifts the even-valued tail to the front ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6).filter((v: number): boolean => v % 2 === 0);
        arr.copyWithin(0, 1);
        expect(arr.join(',')).assertEqual('4,6,6');
      }

      // --- [5] Verify the copied head of a copyWithin(0,2,4) result of a from(Set) array is found by includes and read by $_get ---
      {
        let s: Set<int> = new Set<int>();
        s.add(5);
        s.add(6);
        s.add(7);
        s.add(8);
        let arr: Int16Array = Int16Array.from(s);
        arr.copyWithin(0, 2, 4);
        let has: boolean = arr.includes(7);
        expect(has).assertTrue();
        expect(arr.$_get(0)).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_0600
     * @tc.name int16ArrayCopyWithinPart01Test006
     * @tc.desc Merged batch (5 tests): post-copy reads and derived consumers: Map-key duplication, key sequence, entry values, slice head and last key index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin(1,0,1) on an array built by from(Map.keys()) duplicates the first key into index 1 ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(12, 'a');
        m.set(13, 'b');
        m.set(14, 'c');
        let arr: Int16Array = Int16Array.from(m.keys());
        arr.copyWithin(1, 0, 1);
        let exp: int[] = [12, 12, 14];
        for (let i: int = 0; i < exp.length; i++) {
          expect(arr.$_get(i)).assertEqual(exp[i]);
        }
      }

      // --- [2] Verify keys() on a copyWithin(1,2,4) result gives the contiguous index sequence ---
      {
        let arr: Int16Array = Int16Array.of(2, 3, 4, 5);
        arr.copyWithin(1, 2, 4);
        expect(arr.join(',')).assertEqual('2,4,5,5');
        let seq: string = '';
        for (const k of arr.keys()) {
          seq = seq + k;
        }
        expect(seq).assertEqual('0123');
      }

      // --- [3] Verify entries() on a copyWithin(0,2,4) result of a from(Set) array reproduces the copied values ---
      {
        let s: Set<int> = new Set<int>();
        s.add(2);
        s.add(4);
        s.add(6);
        s.add(8);
        let arr: Int16Array = Int16Array.from(s);
        arr.copyWithin(0, 2, 4);
        let vals: int[] = [];
        for (const e of arr.entries()) {
          vals.push(e[1].toInt());
        }
        let exp: int[] = [6, 8, 6, 8];
        for (let i: int = 0; i < exp.length; i++) {
          expect(vals[i]).assertEqual(exp[i]);
        }
      }

      // --- [4] Verify slice() after copyWithin() on an Array-literal array reflects the copied head ---
      {
        let arr: Int16Array = new Int16Array([9, 4, 7, 2, 5]);
        arr.copyWithin(0, 1, 3);
        let head: Int16Array = arr.slice(0, 2);
        expect(head.join(',')).assertEqual('4,7');
        expect(arr.$_get(4)).assertEqual(5);
      }

      // --- [5] Verify keys() on a copyWithin(0,3,5) result of a from(Map.keys()) array ends at the last index ---
      {
        let m: Map<number, string> = new Map<number, string>();
        m.set(1, 'a');
        m.set(2, 'b');
        m.set(3, 'c');
        m.set(4, 'd');
        m.set(5, 'e');
        let arr: Int16Array = Int16Array.from(m.keys());
        arr.copyWithin(0, 3, 5);
        let last: number = -1;
        for (const k of arr.keys()) {
          last = k;
        }
        expect(last).assertEqual(4);
        expect(arr.$_get(0)).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_0700
     * @tc.name int16ArrayCopyWithinPart01Test007
     * @tc.desc Merged batch (5 tests): construction sources: Set clamping, Map single/window copies, length-constructed window, mapfn window and two-arg shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin(0,2,10) on an array built by from(Set) clamps an end past the length so the source window lands at the front ---
      {
        let s: Set<int> = new Set<int>();
        s.add(5);
        s.add(6);
        s.add(7);
        s.add(8);
        s.add(9);
        let arr: Int16Array = Int16Array.from(s);
        arr.copyWithin(0, 2, 10);
        let exp: int[] = [7, 8, 9, 8, 9];
        for (let i: int = 0; i < exp.length; i++) {
          expect(arr.$_get(i)).assertEqual(exp[i]);
        }
      }

      // --- [2] Verify copyWithin(target,start,end) over from(Map.values()) copies a single value or a two-value window while start greater than end leaves the array unchanged ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 11);
        m.set('b', 22);
        m.set('c', 33);
        m.set('d', 44);
        let target: int[] = [0, 0, 0];
        let start: int[] = [2, 1, 1];
        let end: int[] = [1, 2, 3];
        let expected: string[] = ['11,22,33,44', '22,22,33,44', '22,33,33,44'];
        for (let k: int = 0; k < target.length; k++) {
          let arr: Int16Array = Int16Array.from(m.values());
          arr.copyWithin(target[k], start[k], end[k]);
          expect(arr.length).assertEqual(4);
          expect(arr.join(',')).assertEqual(expected[k]);
        }
      }

      // --- [3] Verify copyWithin(0,1,3) on a length-constructed array filled via $_set copies the source window [1,3) into target index 0 ---
      {
        let arr: Int16Array = new Int16Array(4);
        for (let i: int = 0; i < 4; i++) {
          arr.$_set(i, i + 5);
        }
        arr.copyWithin(0, 1, 3);
        let exp: int[] = [6, 7, 7, 8];
        for (let i: int = 0; i < exp.length; i++) {
          expect(arr.$_get(i)).assertEqual(exp[i]);
        }
      }

      // --- [4] Verify copyWithin(1,3,5) on an array built by from(Array, mapfn) copies the window [3,5) into target index 1 ---
      {
        let src: int[] = [1, 2, 3, 4, 5];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v * 3);
        arr.copyWithin(1, 3, 5);
        expect(arr.join(',')).assertEqual('3,12,15,12,15');
      }

      // --- [5] Verify two-arg copyWithin(3,0) on an array built by from(another Int16Array) shifts the window [0,length) so index 3 keeps the original element ---
      {
        let base: Int16Array = Int16Array.of(7, 8, 9, 10, 11);
        let arr: Int16Array = Int16Array.from(base);
        arr.copyWithin(3, 0);
        let exp: int[] = [7, 8, 9, 7, 8];
        for (let i: int = 0; i < exp.length; i++) {
          expect(arr.$_get(i)).assertEqual(exp[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_0800
     * @tc.name int16ArrayCopyWithinPart01Test008
     * @tc.desc Merged batch (5 tests): clamping, negative and no-op forms: out-of-range target, negative argument resolution, last-index single copy, argument state matrix and -10/10 clamping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify three-arg copyWithin() with an out-of-range target is a no-op ---
      {
        let arr: Int16Array = Int16Array.of(-32768, 0, 32767);
        arr.copyWithin(99999, 0, 2);
        expect(arr.$_get(0)).assertEqual(-32768);
        expect(arr.$_get(1)).assertEqual(0);
        expect(arr.$_get(2)).assertEqual(32767);
      }

      // --- [2] Verify three-arg copyWithin() resolves negative target, start and end arguments relative to length, including an end equal to length and a length-1 negative-target clamp ---
      {
        let inputs: Int16Array[] = [
          Int16Array.of(50, 100, 150, 200, 250),
          Int16Array.of(10, 20, 30, 40, 50),
          Int16Array.of(77),
          Int16Array.of(10, 20, 30, 40, 50)
        ];
        let targets: int[] = [-2, -2, -1, -1];
        let starts: int[] = [-4, -4, 0, 0];
        let ends: int[] = [-1, 5, 1, -1];
        let expected: string[] = [
          '50,100,150,100,150',
          '10,20,30,20,30',
          '77',
          '10,20,30,40,10'
        ];
        for (let k: int = 0; k < inputs.length; k++) {
          inputs[k].copyWithin(targets[k], starts[k], ends[k]);
          expect(inputs[k].join(',')).assertEqual(expected[k]);
        }
      }

      // --- [3] Verify two-arg copyWithin() with start at the last index copies a single element ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        arr.copyWithin(3, 4);
        expect(arr.slice(3).join(',')).assertEqual('50,50');
      }

      // --- [4] Verify copyWithin element state across normal, negative, oversized and no-op target/start/end combinations ---
      {
        let cases: number[][] = [
          [5, 10, 20, 30, 40, 50, 0, 2, 5, 30, 40, 50, 40, 50],
          [5, 10, 20, 30, 40, 50, 0, 1, 3, 20, 30, 30, 40, 50],
          [5, 5, 6, 7, 8, 9, 0, 3, 5, 8, 9, 7, 8, 9],
          [4, 11, 22, 33, 44, 0, 3, 0, 1, 11, 22, 33, 11, 0],
          [4, 1, 2, 3, 4, 0, 4, 0, 2, 1, 2, 3, 4, 0],
          [3, 10, 20, 30, 0, 0, 4, 0, 1, 10, 20, 30, 0, 0],
          [4, 100, 200, 300, 400, 0, -1, 0, 1, 100, 200, 300, 100, 0],
          [4, 7, 8, 9, 10, 0, -4, 2, 4, 9, 10, 9, 10, 0],
          [4, 1, 2, 3, 4, 0, -10, 1, 2, 2, 2, 3, 4, 0],
          [4, 5, 10, 15, 20, 0, 2147483647, 0, 2, 5, 10, 15, 20, 0],
          [4, 8, 16, 24, 32, 0, 2, 0, 2, 8, 16, 8, 16, 0],
          [3, 3, 6, 9, 0, 0, 0, 3, 3, 3, 6, 9, 0, 0],
          [4, 50, 60, 70, 80, 0, 0, -1, 4, 80, 60, 70, 80, 0],
          [3, 1, 2, 3, 0, 0, 1, -10, 2, 1, 1, 2, 0, 0],
          [4, 10, 20, 30, 40, 0, 0, 3, 1, 10, 20, 30, 40, 0],
          [3, 5, 10, 15, 0, 0, 0, 2147483647, 1, 5, 10, 15, 0, 0],
          [4, 7, 14, 21, 28, 0, 1, 0, 0, 7, 14, 21, 28, 0],
          [3, 100, 200, 300, 0, 0, 0, 1, 3, 200, 300, 300, 0, 0],
          [5, 1, 2, 3, 4, 5, 0, 1, -1, 2, 3, 4, 4, 5],
          [3, 9, 18, 27, 0, 0, 0, 0, -10, 9, 18, 27, 0, 0],
          [4, 2, 4, 6, 8, 0, 1, 2, 2, 2, 4, 6, 8, 0],
          [3, 33, 66, 99, 0, 0, 0, 1, 2147483647, 66, 99, 99, 0, 0],
          [5, 1, 2, 3, 4, 5, 0, 2, 4, 3, 4, 3, 4, 5],
          [4, 11, 22, 33, 44, 0, 0, 0, 8, 11, 22, 33, 44],
          [4, 3, 6, 9, 12, 0, 4, 0, 2, 3, 6, 9, 12],
          [4, 10, 20, 30, 40, 0, 0, 2, 4, 30, 40, 30, 40],
          [4, 7, 8, 9, 10, 0, 2, 0, 2, 7, 8, 7, 8],
          [5, 10, 20, 30, 40, 50, 2, 1, 4, 10, 20, 20, 30, 40],
          [3, 77, 88, 99, 0, 0, 2, 1, 2, 77, 88, 88, 0, 0]
        ];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array;
          if (cases[i][0] === 3) {
            arr = Int16Array.of(cases[i][1], cases[i][2], cases[i][3]);
          } else if (cases[i][0] === 4) {
            arr = Int16Array.of(cases[i][1], cases[i][2], cases[i][3], cases[i][4]);
          } else {
            arr = Int16Array.of(cases[i][1], cases[i][2], cases[i][3], cases[i][4], cases[i][5]);
          }
          arr.copyWithin(cases[i][6].toInt(), cases[i][7].toInt(), cases[i][8].toInt());
          for (let j: int = 0; j < cases[i][0]; j++) {
            expect(arr.$_get(j)).assertEqual(cases[i][9 + j]);
          }
        }
      }

      // --- [5] Verify copyWithin clamps a start below -length (-10) to 0 and an end above length (10) to length ---
      {
        let arr: Int16Array = Int16Array.of(100, 200, 300);
        arr.copyWithin(1, -10, 10);
        expect(arr.$_get(0)).assertEqual(100);
        expect(arr.$_get(1)).assertEqual(100);
        expect(arr.$_get(2)).assertEqual(200);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_0900
     * @tc.name int16ArrayCopyWithinPart01Test009
     * @tc.desc Merged batch (4 tests): copyWithin argument matrix: explicit window, interior or single-prefix copy, negative start and omitted-end two-arg form.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Int16Array.copyWithin(0, 1, 3) copies the source window to the front ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
        arr.copyWithin(0, 1, 3);
        expect(arr.toString()).assertEqual('20,30,30,40');
      }

      // --- [2] Verify three-arg copyWithin() copies an interior window or a single-element prefix into the requested target slot ---
      {
        let target: int[] = [1, 3];
        let start: int[] = [3, 0];
        let end: int[] = [5, 1];
        let expected: string[] = ['10,40,50,40,50', '10,20,30,10,50'];
        for (let k: int = 0; k < target.length; k++) {
          let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
          arr.copyWithin(target[k], start[k], end[k]);
          expect(arr.join(',')).assertEqual(expected[k]);
        }
      }

      // --- [3] Verify copyWithin(0,-1) copies the last element onto index 0 on 5-element and 1-element arrays ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        arr.copyWithin(0, -1);
        expect(arr.$_get(0)).assertEqual(50);

        let arr2: Int16Array = Int16Array.of(55);
        arr2.copyWithin(0, -1);
        expect(arr2.$_get(0)).assertEqual(55);
      }

      // --- [4] Verify two-arg copyWithin(0, 2) shifts the source window to the front ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        arr.copyWithin(0, 2);
        expect(arr.$_get(0)).assertEqual(3);
        expect(arr.$_get(1)).assertEqual(4);
        expect(arr.$_get(2)).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_1000
     * @tc.name int16ArrayCopyWithinPart01Test010
     * @tc.desc Merged batch (2 tests): copyWithin argument matrix: an omitted end filling from a start index, and one trailing value written into a middle slot.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin(1,0) omitted end copies from start to end ---
      {
        let arr: Int16Array = Int16Array.of(15, 25, 35, 45, 55);
        let first: number = arr.$_get(0);
        arr.copyWithin(1, 0);
        expect(arr.$_get(1)).assertEqual(first);
        expect(arr.toString()).assertEqual('15,15,25,35,45');
      }

      // --- [2] Verify copyWithin(2,4) writes a single trailing element into the middle slot ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
        arr.copyWithin(2, 4);
        expect(arr.length).assertEqual(5);
        expect(arr.$_get(2)).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_1100
     * @tc.name int16ArrayCopyWithinPart01Test011
     * @tc.desc Merged batch (4 tests): views and shared buffers: chained subarray exposure, parent buffer sharing, front shift and leading-element duplication.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify chained copyWithin().subarray(0,2) exposes the copied leading window for two- and three-argument forms ---
      {
        let inputs: number[][] = [[32767, -1, 3, -3], [12, 34, 56, 78, 90, 123]];
        let starts: int[] = [1, 3];
        let ends: int[] = [0, 5];
        let omitEnd: boolean[] = [true, false];
        let expected: string[] = ['-1,3', '78,90'];
        for (let c: int = 0; c < inputs.length; c++) {
          let arr: Int16Array = Int16Array.from(inputs[c]);
          let sub: Int16Array = omitEnd[c] ? arr.copyWithin(0, starts[c]).subarray(0, 2)
            : arr.copyWithin(0, starts[c], ends[c]).subarray(0, 2);
          expect(sub.join(',')).assertEqual(expected[c]);
        }
      }

      // --- [2] Verify subarray copyWithin(0,1) leaves the view as 3,-3,-3 and the returned view still shares the parent buffer ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(12);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 32767 as short);
        arr.$_set(1, -1 as short);
        arr.$_set(2, 3 as short);
        arr.$_set(3, -3 as short);
        arr.$_set(4, 100 as short);
        arr.$_set(5, 200 as short);
        let sub: Int16Array = arr.subarray(1, 4);
        let ret: Int16Array = sub.copyWithin(0, 1);
        expect(ret.join(',')).assertEqual('3,-3,-3');
        expect(ret.buffer).assertEqual(buf);
      }

      // --- [3] Verify subarray copyWithin(0,1) shifts the subarray elements to the front ---
      {
        let buf: ArrayBuffer = new ArrayBuffer(12);
        let arr: Int16Array = new Int16Array(buf);
        arr.$_set(0, 32767);
        arr.$_set(1, -1);
        arr.$_set(2, 3);
        arr.$_set(3, -3);
        arr.$_set(4, 100);
        arr.$_set(5, 200);
        let sub: Int16Array = arr.subarray(1, 4);
        sub.copyWithin(0, 1);
        expect(sub.join(',')).assertEqual('3,-3,-3');
      }

      // --- [4] Verify subarray copyWithin(1,0,2) duplicates the leading elements within the view ---
      {
        let base: Int16Array = Int16Array.of(32767, -1, 3, -3, 100, 200);
        let sub: Int16Array = base.subarray(1, 4);
        sub.copyWithin(1, 0, 2);
        expect(sub.join(',')).assertEqual('-1,-1,3');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_1200
     * @tc.name int16ArrayCopyWithinPart01Test012
     * @tc.desc Merged batch (5 tests): boundary values and truncation: int16 MAX/MIN preservation across argument forms, float truncation and NaN/Infinity-to-zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two-arg and three-arg copyWithin both front-copy the window on arrays holding the int16 boundaries 32767/-1 ---
      {
        let arr: Int16Array = Int16Array.of(32767, -1, 3, -3);
        arr.copyWithin(0, 2);
        expect(arr.join(',')).assertEqual('3,-3,3,-3');

        let arr2: Int16Array = Int16Array.of(32767, -1, 3, -3);
        arr2.copyWithin(0, 1, 3);
        expect(arr2.join(',')).assertEqual('-1,3,3,-3');

        let arr3: Int16Array = Int16Array.of(32767, -1, 3);
        arr3.copyWithin(0, 1);
        expect(arr3.join(',')).assertEqual('-1,3,3');

        let arr4: Int16Array = Int16Array.of(-1, 32767, 3);
        arr4.copyWithin(0, 1, 2);
        expect(arr4.join(',')).assertEqual('32767,32767,3');

        let arr5: Int16Array = Int16Array.of(-1, 32767, 3);
        arr5.copyWithin(0, 1);
        expect(arr5.join(',')).assertEqual('32767,3,3');
      }

      // --- [2] Verify copyWithin(0,2) copies the trailing pair onto indices 0,1 over element sets holding 32767 ---
      {
        let cases: number[][] = [
          [100, 200, 32767, -1],
          [32767, -1, 3, -3],
          [32767, -1, 100, 200]
        ];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = Int16Array.of(cases[i][0], cases[i][1], cases[i][2], cases[i][3]);
          let ret: Int16Array = arr.copyWithin(0, 2);
          expect(ret.$_get(0)).assertEqual(cases[i][2]);
          expect(ret.$_get(1)).assertEqual(cases[i][3]);
        }
      }

      // --- [3] Verify two-arg copyWithin() with omitted end copies a negative element over the int16 MAX slot ---
      {
        let arr: Int16Array = Int16Array.of(32767 as short, -1 as short);
        let ret: Int16Array = arr.copyWithin(0, 1);
        expect(ret.$_get(0)).assertEqual(-1);
      }

      // --- [4] Verify copyWithin(0,2) preserves int16 MAX, float truncation, and NaN/Infinity-to-zero element values ---
      {
        let cases: number[][] = [
          [100, 200, 32767, 32767],
          [100, 200, -1, -1],
          [100, 200, 3.7, 3],
          [100, 200, -3.7, -3],
          [100, 200, Number.NaN, 0],
          [100, 200, Number.POSITIVE_INFINITY, 0],
          [100, 200, -Number.POSITIVE_INFINITY, 0],
          [100, 200, -0.0, 0],
          [100, 200, 0.9, 0],
          [100, 200, -0.9, 0]
        ];
        for (let i: int = 0; i < cases.length; i++) {
          let arr: Int16Array = Int16Array.of(cases[i][0], cases[i][1], cases[i][2]);
          let ret: Int16Array = arr.copyWithin(0, 2);
          expect(ret.$_get(0)).assertEqual(cases[i][3]);
        }
      }

      // --- [5] Verify copyWithin preserves int16 MIN value -32768 ---
      {
        let arr: Int16Array = Int16Array.of(100 as short, 200 as short, -32768 as short);
        let ret: Int16Array = arr.copyWithin(0, 2);
        expect(ret.$_get(0)).assertEqual(-32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_1300
     * @tc.name int16ArrayCopyWithinPart01Test013
     * @tc.desc Merged batch (2 tests): boundary values and truncation: wrapped literals copied from an Array literal and from Map.values().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin(0,1,2) on an array built from an Array literal whose elements wrap into the int16 range copies the wrapped element into index 0 ---
      {
        let arr: Int16Array = new Int16Array([32768, -32769]);
        arr.copyWithin(0, 1, 2);
        expect(arr.$_get(0)).assertEqual(32767);
        expect(arr.$_get(1)).assertEqual(32767);
      }

      // --- [2] Verify copyWithin(0,1,2) on a from(Map.values()) array copies a wrapped 32768 to -32768 at the front ---
      {
        let m: Map<string, number> = new Map<string, number>();
        m.set('a', 0);
        m.set('b', 32768);
        m.set('c', 5);
        let arr: Int16Array = Int16Array.from(m.values());
        arr.copyWithin(0, 1, 2);
        expect(arr.$_get(0)).assertEqual(-32768);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_1400
     * @tc.name int16ArrayCopyWithinPart01Test014
     * @tc.desc Merged batch (3 tests): return value and chaining: reference identity for one-arg, two-call and double-chained copies.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin(0,1,4) on an array built by from(Set) returns the same object reference and joins to the expected string ---
      {
        let s: Set<int> = new Set<int>();
        s.add(4);
        s.add(5);
        s.add(6);
        s.add(7);
        let arr: Int16Array = Int16Array.from(s);
        let ref: Int16Array = arr.copyWithin(0, 1, 4);
        expect(ref).assertEqual(arr);
        expect(ref.join(',')).assertEqual('5,6,7,7');
      }

      // --- [2] Verify double-chained copyWithin(0,1,3).copyWithin(0,1,2) on an array built by from(Set) returns the same reference and yields the expected elements ---
      {
        let s: Set<int> = new Set<int>();
        s.add(1);
        s.add(2);
        s.add(3);
        s.add(4);
        let arr: Int16Array = Int16Array.from(s);
        expect(arr.copyWithin(0, 1, 3).copyWithin(0, 1, 2)).assertEqual(arr);
        expect(arr.join(',')).assertEqual('3,3,3,4');
      }

      // --- [3] Verify one-arg copyWithin(1) returns the same object reference as the original array ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6);
        let returned: Int16Array = arr.copyWithin(1);
        expect(returned).assertEqual(arr);

        let want: number[] = [2, 2, 4];
        expect(Array.from(returned)).assertDeepEquals(want);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_1500
     * @tc.name int16ArrayCopyWithinPart01Test015
     * @tc.desc Merged batch (5 tests): post-copy reads and derived consumers: at(-2), every(), some(), find() and includes() over copied results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify at(-2) on a copyWithin(1,0,3) result reads the second element from the end ---
      {
        let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
        arr.copyWithin(1, 0, 3);
        expect(arr.at(-2)).assertEqual(4);
        expect(arr.$_get(3)).assertEqual(6);
      }

      // --- [2] Verify every(v>1) over the copyWithin(0,2,4) result returns true ---
      {
        let arr: Int16Array = Int16Array.of(2, 2, 3, 3);
        arr.copyWithin(0, 2, 4);
        let allMatch: boolean = arr.every((v: number, _idx: int, _src: Int16Array): boolean => {
          return v > 1;
        });
        expect(allMatch).assertTrue();
        expect(arr.$_get(0)).assertEqual(3);
        expect(arr.$_get(1)).assertEqual(3);
      }

      // --- [3] Verify some(v===3) over the copyWithin(0,2,4) result returns true ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
        arr.copyWithin(0, 2, 4);
        let hasThree: boolean = arr.some((v: number, _idx: int, _src: Int16Array): boolean => {
          return v === 3;
        });
        expect(hasThree).assertTrue();
        expect(arr.$_get(0)).assertEqual(3);
      }

      // --- [4] Verify find(v===8) over the copyWithin(1,3,4) result returns 8 ---
      {
        let arr: Int16Array = Int16Array.of(5, 6, 7, 8);
        arr.copyWithin(1, 3, 4);
        let found: Number | undefined = arr.find((v: number, _idx: int, _src: Int16Array): boolean => {
          return v === 8;
        });
        expect(found as number).assertEqual(8);
        expect(arr.$_get(1)).assertEqual(8);
      }

      // --- [5] Verify includes(22) and includes(33) are both true on the copyWithin(0,1,3) result ---
      {
        let arr: Int16Array = Int16Array.of(11, 22, 33, 44);
        arr.copyWithin(0, 1, 3);
        let r_1: boolean = arr.includes(22);
        expect(r_1).assertTrue();

        let r_2: boolean = arr.includes(33);
        expect(r_2).assertTrue();
        expect(arr.$_get(0)).assertEqual(22);
        expect(arr.$_get(1)).assertEqual(33);
        expect(arr.$_get(3)).assertEqual(44);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_1600
     * @tc.name int16ArrayCopyWithinPart01Test016
     * @tc.desc Merged batch (5 tests): post-copy reads and derived consumers: slice and toReversed copies, predicate check, includes() and toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify copyWithin on a slice() copy moves the tail window to the front ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5).slice(1);
        arr.copyWithin(0, 2);
        expect(arr.join(',')).assertEqual('4,5,4,5');
      }

      // --- [2] Verify copyWithin on a toReversed() copy copies the inner window to the front ---
      {
        let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5).toReversed();
        arr.copyWithin(0, 2, 4);
        expect(arr.join(',')).assertEqual('3,2,3,2,1');
      }

      // --- [3] Verify every() over a copyWithin(1,0,3) result holds and the copied content joins as expected ---
      {
        let arr: Int16Array = Int16Array.of(4, 8, 12, 16);
        arr.copyWithin(1, 0, 3);
        let allPositive: boolean = arr.every((v: number, _i: int, _a: Int16Array): boolean => {
          return v > 0;
        });
        expect(allPositive).assertTrue();
        expect(arr.join(',')).assertEqual('4,4,8,12');
      }

      // --- [4] Verify copyWithin return can be searched with includes ---
      {
        let arr: Int16Array = Int16Array.of(15, 25, 35, 45);
        let ret: Int16Array = arr.copyWithin(0, 2, 4);
        let r_1: boolean = ret.includes(35);
        expect(r_1).assertTrue();

        let r_2: boolean = ret.includes(25);
        expect(r_2).assertFalse();
      }

      // --- [5] Verify toString on a copy-constructed array after copyWithin(1,2,4) equals the expected joined string ---
      {
        let arr: Int16Array = new Int16Array(Int16Array.of(1, 2, 3, 4, 5));
        arr.copyWithin(1, 2, 4);
        expect(arr.toString()).assertEqual('1,3,4,4,5');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_1700
     * @tc.name int16ArrayCopyWithinPart01Test017
     * @tc.desc Merged batch (4 tests): construction sources: length-constructed array, source isolation, Array literal and mapfn-derived array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify one-arg copyWithin(3) on a length-constructed array filled via $_set shifts the head into the last slot ---
      {
        let arr: Int16Array = new Int16Array(4);
        arr.$_set(0, 10);
        arr.$_set(1, 20);
        arr.$_set(2, 30);
        arr.$_set(3, 40);
        arr.copyWithin(3);
        expect(arr.join(',')).assertEqual('10,20,30,10');
      }

      // --- [2] Verify copyWithin(1,0,2) on an array built by from(another Int16Array) leaves the source unmutated while the copy changes the target ---
      {
        let src: Int16Array = Int16Array.of(5, 6, 7, 8);
        let arr: Int16Array = Int16Array.from(src);
        arr.copyWithin(1, 0, 2);
        expect(arr.join(',')).assertEqual('5,5,6,8');
        expect(src.join(',')).assertEqual('5,6,7,8');
      }

      // --- [3] Verify copyWithin(0,1,3) on an array built from an Array literal reads back the element at index 0 ---
      {
        let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
        let ref: Int16Array = arr.copyWithin(0, 1, 3);
        expect(ref.$_get(0)).assertEqual(20);
      }

      // --- [4] Verify copyWithin(0,2,4) on an array built by from(Array, mapfn) copies the source window to the front and keeps the length ---
      {
        let src: int[] = [1, 2, 3, 4, 5];
        let arr: Int16Array = Int16Array.from(src, (v: int, k: double): double => v * 2);
        arr.copyWithin(0, 2, 4);
        expect(arr.$_get(0)).assertEqual(6);
        expect(arr.$_get(1)).assertEqual(8);
        expect(arr.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_1800
     * @tc.name int16ArrayCopyWithinPart01Test018
     * @tc.desc Merged batch (5 tests): clamping, negative and no-op forms: length-1 identity, window copy, one-arg no-op, negative start beyond end and mixed forms.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two successive copyWithin() calls on a length-1 array are both identity operations ---
      {
        let arr: Int16Array = Int16Array.of(99);
        arr.copyWithin(0, 0, 0);
        arr.copyWithin(0, 0, 1);
        expect(arr.$_get(0)).assertEqual(99);
      }

      // --- [2] Verify copyWithin(1, 2, 4) writes the source window to indices 1,2 and leaves the other indices unchanged ---
      {
        let arr: Int16Array = Int16Array.of(32767, 32767, 128, 256, -32768, -32768);
        arr.copyWithin(1, 2, 4);
        expect(arr.$_get(0)).assertEqual(32767);
        expect(arr.$_get(1)).assertEqual(128);
        expect(arr.$_get(2)).assertEqual(256);
        expect(arr.$_get(4)).assertEqual(-32768);
        expect(arr.$_get(5)).assertEqual(-32768);
      }

      // --- [3] Verify one-arg copyWithin(0) is a no-op that leaves every element untouched ---
      {
        let arr: Int16Array = Int16Array.of(6, 7, 8);
        let before: string = arr.join(',');
        arr.copyWithin(0);
        let after: string = arr.join(',');
        expect(after).assertEqual('6,7,8');
        expect(after).assertEqual(before);
      }

      // --- [4] Verify copyWithin with a fully-negative start greater than end is a no-op ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        arr.copyWithin(0, -1, -3);
        expect(arr.join(',')).assertEqual('10,20,30,40,50');
      }

      // --- [5] Verify copyWithin three-arg, omitted-end and negative-index forms, and no-op when target exceeds length ---
      {
        let arr1: Int16Array = Int16Array.of(12, 24, 36, 48, 60);
        arr1.copyWithin(1, 2, 4);
        expect(arr1.join(',')).assertEqual('12,36,48,48,60');

        let arr2: Int16Array = Int16Array.of(5, 10, 15, 20, 25, 30);
        arr2.copyWithin(1, 3);
        expect(arr2.join(',')).assertEqual('5,20,25,30,25,30');

        let arr3: Int16Array = Int16Array.of(7, 14, 21, 28, 35);
        arr3.copyWithin(-2, -5, -3);
        expect(arr3.join(',')).assertEqual('7,14,21,7,14');

        let arr4: Int16Array = Int16Array.of(33, 66, 99);
        arr4.copyWithin(5, 0, 2);
        expect(arr4.join(',')).assertEqual('33,66,99');

        let arr5: Int16Array = Int16Array.of(8, 16, 24, 32);
        arr5.copyWithin(0, 3, 1);
        expect(arr5.join(',')).assertEqual('8,16,24,32');

        let arr6: Int16Array = Int16Array.of(1, Number.NaN, 3, 4);
        arr6.copyWithin(0, 2, 4);
        expect(arr6.join(',')).assertEqual('3,4,3,4');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_COPYWITHIN_PART01_1900
     * @tc.name int16ArrayCopyWithinPart01Test019
     * @tc.desc Merged batch (5 tests): copyWithin argument matrix: tail-to-front and early-to-index-4 windows, last-index single copy, two-element windows and omitted-end equivalence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int16ArrayCopyWithinPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify three-arg copyWithin() moving a tail window to index 0 and an early window to index 4 keeps sources ---
      {
        let sources: int[][] = [[-32768, 32767, 0, -1, 1, 100, 200], [1, 2, 3, 4, 5, 6, 7]];
        let targets: int[] = [0, 4];
        let starts: int[] = [3, 0];
        let ends: int[] = [7, 2];
        let checkedIndices: int[][] = [[0, 1, 2, 3], [4, 5, 0, 1]];
        let expected: int[][] = [[-1, 1, 100, 200], [1, 2, 1, 2]];
        for (let i: int = 0; i < sources.length; i++) {
          let arr: Int16Array = Int16Array.from(sources[i]);
          arr.copyWithin(targets[i], starts[i], ends[i]);
          for (let j: int = 0; j < checkedIndices[i].length; j++) {
            expect(arr.$_get(checkedIndices[i][j])).assertEqual(expected[i][j]);
          }
        }
      }

      // --- [2] Verify two-arg copyWithin() targeting the last index copies only the first element ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        let src: number = arr.$_get(0);
        arr.copyWithin(4, 0);
        expect(arr.$_get(4)).assertEqual(src);
        expect(arr.$_get(0)).assertEqual(src);
      }

      // --- [3] Verify three-arg copyWithin() writes a two-element front window into the trailing slots ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        arr.copyWithin(3, 0, 2);
        expect(arr.$_get(2)).assertEqual(30);
        expect(arr.join(',')).assertEqual('10,20,30,10,20');
      }

      // --- [4] Verify three-arg copyWithin() copies a trailing window onto the leading slots ---
      {
        let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
        arr.copyWithin(0, 3, 5);
        let front: Int16Array = arr.subarray(0, 2);
        expect(front.join(',')).assertEqual('40,50');
      }

      // --- [5] Verify omitted-end two-arg copyWithin() equals the three-arg form with end equal to length ---
      {
        let arr1: Int16Array = Int16Array.of(1, 2, 3, 4);
        let arr2: Int16Array = Int16Array.of(1, 2, 3, 4);
        arr1.copyWithin(1, 2);
        arr2.copyWithin(1, 2, 4);
        expect(arr1.$_get(0)).assertEqual(arr2.$_get(0));
        expect(arr1.$_get(1)).assertEqual(arr2.$_get(1));
        expect(arr1.$_get(2)).assertEqual(arr2.$_get(2));
        expect(arr1.$_get(3)).assertEqual(arr2.$_get(3));
      }
    });

  });
}
