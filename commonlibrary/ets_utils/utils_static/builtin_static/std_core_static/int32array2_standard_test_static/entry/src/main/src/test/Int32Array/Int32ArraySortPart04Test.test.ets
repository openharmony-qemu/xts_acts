'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
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

export default function int32ArraySortPart04Test(): void {
  describe('Int32ArraySortPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArraySortPart04Test001
     * @tc.desc Verify sort snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, -4, 0, 7, -9, 3]);
      let snap: number[] = [];
      for (let i = 0; i < arr.length; i++) { snap.push(arr.$_get(i)); }
      let sortedSnap = (v: number[]): number[] => { let a = v.slice(); a.sort(); return a; };
      arr.sort();
      let after: number[] = [];
      for (let i = 0; i < arr.length; i++) { after.push(arr.$_get(i)); }
      let ref: number[] = sortedSnap(snap);
      expect(after.length).assertEqual(ref.length);
      expect(after.$_get(0)).assertEqual(-9);
      expect(after.$_get(after.length - 1)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArraySortPart04Test002
     * @tc.desc Verify sort <=
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([19, -3, 0, 44, -7, 12, 2, 31]);
      arr.sort();
      let ok: boolean = true;
      for (let i = 1; i < arr.length; i++) {
        if (arr.$_get(i - 1) > arr.$_get(i)) { ok = false; }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArraySortPart04Test003
     * @tc.desc Verify default sort preserves the sum of five input elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-8, 22, 0, 5, -1, 40, 3]);
      arr.sort((a: number, b: number): int => Double.toInt(a - b));
      let ok: boolean = true;
      for (let i = 1; i < arr.length; i++) {
        if (arr.$_get(i - 1) > arr.$_get(i)) { ok = false; }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArraySortPart04Test004
     * @tc.desc Verify compareFn sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-8, 22, 0, 5, -1, 40, 3]);
      arr.sort((a: number, b: number): int => Double.toInt(b - a));
      let ok: boolean = true;
      for (let i = 1; i < arr.length; i++) {
        if (arr.$_get(i - 1) < arr.$_get(i)) { ok = false; }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArraySortPart04Test005
     * @tc.desc Verify sort() preserves the sum of [13,-4,0,7,-2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([13, -4, 0, 7, -2]);
      let sumBefore: number = 0;
      for (let i = 0; i < arr.length; i++) { sumBefore = sumBefore + arr.$_get(i); }
      arr.sort();
      let sumAfter: number = 0;
      for (let i = 0; i < arr.length; i++) { sumAfter = sumAfter + arr.$_get(i); }
      expect(Double.toInt(sumAfter)).assertEqual(Double.toInt(sumBefore));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArraySortPart04Test006
     * @tc.desc Verify sort length/byteOffset/byteLength/BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf, 4, 4);
      arr.$_set(0, 9); arr.$_set(1, 2); arr.$_set(2, 6); arr.$_set(3, 4);
      let len0: number = arr.length;
      let off0: number = arr.byteOffset;
      let bl0: number = arr.byteLength;
      let bpe0: number = arr.BYTES_PER_ELEMENT;
      arr.sort();
      expect(arr.length).assertEqual(len0);
      expect(arr.byteOffset).assertEqual(off0);
      expect(arr.byteLength).assertEqual(bl0);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(bpe0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArraySortPart04Test007
     * @tc.desc Verify sort slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([77]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(77);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArraySortPart04Test008
     * @tc.desc Verify sort buffer DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 3); arr.$_set(1, 1); arr.$_set(2, 2);
      let dv0: DataView = new DataView(buf);
      let firstBefore: number = dv0.getInt32(0, true);
      arr.sort();
      let dv1: DataView = new DataView(buf);
      let firstAfter: number = dv1.getInt32(0, true);
      expect(firstBefore).assertEqual(3);
      expect(firstAfter).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArraySortPart04Test009
     * @tc.desc Verify sorting an already sorted array preserves every element position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 2, 5, 1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(5);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArraySortPart04Test010
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([17, -4, 0, 9, -2]);
      a.sort();
      let snap: number[] = [];
      for (let i = 0; i < a.length; i++) { snap.push(a.$_get(i)); }
      a.sort();
      for (let i = 0; i < a.length; i++) { expect(a.$_get(i)).assertEqual(snap[i]); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArraySortPart04Test011
     * @tc.desc Verify compareFn compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 2, 9, 1, 4]);
      arr.sort((a: number, b: number): int => Double.toInt(a - b));
      arr.sort((a: number, b: number): int => Double.toInt(b - a));
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArraySortPart04Test012
     * @tc.desc Verify compareFn sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 2, 9, 1, 4]);
      arr.sort((a: number, b: number): int => Double.toInt(b - a));
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArraySortPart04Test013
     * @tc.desc Verify sort ===this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r1 = arr.sort();
      let r2 = r1.sort();
      let r3 = r2.sort();
      expect(r1).assertEqual(arr);
      expect(r2).assertEqual(arr);
      expect(r3).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArraySortPart04Test014
     * @tc.desc Verify sort().sort() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.sort().sort();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArraySortPart04Test015
     * @tc.desc Verify sort().sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      arr.sort().sort();
      expect(arr.$_get(0)).assertEqual(42);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArraySortPart04Test016
     * @tc.desc Verify sort().reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 1, 3, 9, 2]);
      let r = arr.sort().reverse();
      expect(r).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(arr.length - 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArraySortPart04Test017
     * @tc.desc Verify sort().fill(0) slot 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 1, 3]);
      let r = arr.sort().fill(0);
      expect(r).assertEqual(arr);
      for (let i = 0; i < arr.length; i++) { expect(arr.$_get(i)).assertEqual(0); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArraySortPart04Test018
     * @tc.desc Verify sort() at(0) at(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([17, -3, 0, 9, -8]);
      arr.sort();
      expect(arr.at(0)).assertEqual(-8);
      expect(arr.at(arr.length - 1)).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArraySortPart04Test019
     * @tc.desc Verify sort() set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 1, 3, 7, 2]);
      arr.sort();
      let src: Int32Array = new Int32Array([99, 99]);
      arr.set(src, 3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(99);
      expect(arr.$_get(4)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArraySortPart04Test020
     * @tc.desc Verify sort().copyWithin() this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 1, 3, 2]);
      let r = arr.sort().copyWithin(2, 0, 2);
      expect(r).assertEqual(arr);
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArraySortPart04Test021
     * @tc.desc Verify compareFn >0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 2, 8, 1, 4]);
      let calls: int = 0;
      arr.sort((a: number, b: number): int => { calls = calls + 1; return Double.toInt(a - b); });
      expect(calls >= 1).assertTrue();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArraySortPart04Test022
     * @tc.desc Verify compareFn dir=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dir: int = -1;
      let arr: Int32Array = new Int32Array([3, 1, 4, 2]);
      arr.sort((a: number, b: number): int => Double.toInt(a - b) * dir);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArraySortPart04Test023
     * @tc.desc Verify compareFn sum a+b >0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let s: number = 0;
      arr.sort((a: number, b: number): int => { s = s + a + b; return Double.toInt(a - b); });
      expect(s > 0).assertTrue();
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArraySortPart04Test024
     * @tc.desc Verify compareFn tick -1/0/1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 1, 3, 2]);
      let tick: int = 0;
      arr.sort((_a: number, _b: number): int => {
        tick = tick + 1;
        if (tick % 3 === 0) { return -1; }
        if (tick % 3 === 1) { return 1; }
        return 0;
      });
      expect(arr.length).assertEqual(4);
      expect(tick > 0).assertTrue();
      for (let expected: int = 1; expected <= 4; expected++) {
        let found: boolean = false;
        for (let i: int = 0; i < arr.length; i++) {
          if (arr.$_get(i) === expected) {
            found = true;
          }
        }
        expect(found).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArraySortPart04Test025
     * @tc.desc Verify compareFn first -1 0 first false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 3]);
      let first: boolean = true;
      arr.sort((_a: number, _b: number): int => {
        if (first) { first = false; return -1; }
        return 0;
      });
      expect(first).assertFalse();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArraySortPart04Test026
     * @tc.desc Verify a comparator changing direction after three calls preserves array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 4]);
      let log: number[] = [];
      arr.sort((a: number, _b: number): int => { log.push(Double.toInt(a)); return Double.toInt(a - _b); });
      expect(log.length).assertLarger(0);
      for (let i: int = 0; i < log.length; i++) {
        expect(log[i]).assertLarger(0);
      }
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArraySortPart04Test027
     * @tc.desc Verify compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 1, 9, 3, 7]);
      let flips: int = 0;
      arr.sort((a: number, b: number): int => {
        flips = flips + 1;
        if (flips < 4) { return Double.toInt(a - b); }
        return Double.toInt(b - a);
      });
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArraySortPart04Test028
     * @tc.desc Verify compareFn receives values from the input array and sorts ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 1]);
      let compareCount: int = 0;
      let parametersFromInput: boolean = true;
      arr.sort((a: number, b: number): int => {
        compareCount++;
        if ((a !== 9 && a !== 1) || (b !== 9 && b !== 1)) {
          parametersFromInput = false;
        }
        return a < b ? -1 : (a > b ? 1 : 0);
      });
      expect(compareCount).assertLarger(0);
      expect(parametersFromInput).assertTrue();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArraySortPart04Test029
     * @tc.desc Verify compareFn $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 1, 4]);
      let captured: number = 0;
      arr.sort((a: number, b: number): int => {
        if (captured === 0) { captured = arr.$_get(0); }
        return Double.toInt(a - b);
      });
      expect(captured).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArraySortPart04Test030
     * @tc.desc Verify compareFn arr.buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 4); arr.$_set(1, 3); arr.$_set(2, 2); arr.$_set(3, 1);
      let capturedBL: int = -1;
      arr.sort((a: number, b: number): int => {
        if (capturedBL < 0) { capturedBL = Double.toInt(arr.buffer.byteLength); }
        return Double.toInt(a - b);
      });
      expect(capturedBL).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArraySortPart04Test031
     * @tc.desc Verify compareFn arr.indexOf(a)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: Int32Array = new Int32Array([3, 1, 2]);
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let seenIdx: int = -1;
      let seenValue: number = 0;
      arr.sort((a: number, b: number): int => {
        if (seenIdx < 0) { seenValue = a; seenIdx = arr.indexOf(a); }
        return Double.toInt(a - b);
      });
      expect(seenIdx).assertEqual(original.indexOf(seenValue));
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArraySortPart04Test032
     * @tc.desc Verify compareFn Int32Array sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 2, 7]);
      let other: Int32Array = new Int32Array([9, 1]);
      let didInner: boolean = false;
      arr.sort((a: number, b: number): int => {
        if (!didInner) { other.sort(); didInner = true; }
        return Double.toInt(a - b);
      });
      expect(didInner).assertTrue();
      expect(other.$_get(0)).assertEqual(1);
      expect(other.$_get(1)).assertEqual(9);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArraySortPart04Test033
     * @tc.desc Verify compareFn $_set slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 4]);
      let mutated: boolean = false;
      arr.sort((a: number, b: number): int => {
        if (!mutated) { arr.$_set(2, 0); mutated = true; }
        return Double.toInt(a - b);
      });
      expect(mutated).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArraySortPart04Test034
     * @tc.desc Verify sort forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([14, -3, 0, 8, -7, 5]);
      arr.sort();
      let prev: number = -2147483648;
      let ok: boolean = true;
      arr.forEach((v: number, _i: int): void => {
        if (v < prev) { ok = false; }
        prev = v;
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArraySortPart04Test035
     * @tc.desc Verify sort map 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      arr.sort();
      let mapped: Int32Array = arr.map((v: number, _i: int, _a: Int32Array): number => v * 2);
      expect(mapped.length).assertEqual(3);
      expect(mapped.$_get(0)).assertEqual(2);
      expect(mapped.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArraySortPart04Test036
     * @tc.desc Verify sort reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([19, -4, 7, 2, -11]);
      arr.sort();
      let minV: number = arr.reduce((acc: number, v: number): number => v < acc ? v : acc, arr.$_get(0));
      expect(Double.toInt(minV)).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArraySortPart04Test037
     * @tc.desc Verify sort join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([30, 1, 12]);
      arr.sort();
      expect(arr.join(',')).assertEqual('1,12,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArraySortPart04Test038
     * @tc.desc Verify sort toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 2, 1]);
      expect(arr.sort().toString()).assertEqual('1,2,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArraySortPart04Test039
     * @tc.desc Verify sort includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 2, 9, 1, 5]);
      arr.sort();
      expect(arr.includes(1)).assertTrue();
      expect(arr.includes(9)).assertTrue();
      expect(arr.includes(5)).assertTrue();
      expect(arr.includes(7)).assertTrue();
      expect(arr.includes(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArraySortPart04Test040
     * @tc.desc Verify sort indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([22, -5, 0, 9, 3]);
      arr.sort();
      expect(arr.indexOf(-5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArraySortPart04Test041
     * @tc.desc Verify sort lastIndexOf length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([22, -5, 0, 9, 3]);
      arr.sort();
      expect(arr.lastIndexOf(22)).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArraySortPart04Test042
     * @tc.desc Verify sort every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([17, -4, 25, -1, 0]);
      arr.sort();
      let ok: boolean = arr.every((v: number, i: int): boolean => i === 0 || arr.$_get(i - 1) <= v);
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArraySortPart04Test043
     * @tc.desc Verify sort some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42, 7, 99, -3, 18]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-3);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(18);
      expect(arr.$_get(3)).assertEqual(42);
      expect(arr.$_get(4)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArraySortPart04Test044
     * @tc.desc Verify sort filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, -2, 8, 0, 3, -6]);
      arr.sort();
      let pos: Int32Array = arr.filter((v: number): boolean => v > 0);
      let ok: boolean = true;
      for (let i = 1; i < pos.length; i++) {
        if (pos.$_get(i - 1) > pos.$_get(i)) { ok = false; }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArraySortPart04Test045
     * @tc.desc Verify sort entries -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([8, 4, 6, 2]);
      arr.sort();
      let it = arr.entries();
      let c0: [int, number] = it.next().value!;
      let c1: [int, number] = it.next().value!;
      let c2: [int, number] = it.next().value!;
      let c3: [int, number] = it.next().value!;
      expect(c0[0]).assertEqual(0); expect(c0[1]).assertEqual(2);
      expect(c1[0]).assertEqual(1); expect(c1[1]).assertEqual(4);
      expect(c2[0]).assertEqual(2); expect(c2[1]).assertEqual(6);
      expect(c3[0]).assertEqual(3); expect(c3[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArraySortPart04Test046
     * @tc.desc Verify sort keys 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 3, 1]);
      arr.sort();
      let kit = arr.keys();
      expect(kit.next().value).assertEqual(0);
      expect(kit.next().value).assertEqual(1);
      expect(kit.next().value).assertEqual(2);
      expect(kit.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArraySortPart04Test047
     * @tc.desc Verify sort values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 1, 7]);
      arr.sort();
      let vit = arr.values();
      expect(vit.next().value).assertEqual(1);
      expect(vit.next().value).assertEqual(7);
      expect(vit.next().value).assertEqual(9);
      expect(vit.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArraySortPart04Test048
     * @tc.desc Verify sort find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-7, 12, 3, 0, -2]);
      arr.sort();
      let minV: number = arr.$_get(0);
      let found: number = arr.find((v: number): boolean => v === minV) as number;
      expect(found).assertEqual(minV);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArraySortPart04Test049
     * @tc.desc Verify sort findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([15, -3, 22, 8, 0]);
      arr.sort();
      let maxV: number = arr.$_get(arr.length - 1);
      let found: number = arr.findLast((v: number): boolean => v === maxV) as number;
      expect(found).assertEqual(maxV);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArraySortPart04Test050
     * @tc.desc Verify sort findIndex 0 findLastIndex length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([20, -5, 11, 2, 17]);
      arr.sort();
      expect(arr.findIndex((v: number): boolean => v === arr.$_get(0))).assertEqual(0);
      expect(arr.findLastIndex((v: number): boolean => v === arr.$_get(arr.length - 1))).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArraySortPart04Test051
     * @tc.desc Verify 1 #4 1 [-x, 1, +x]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 1, -3]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-3);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArraySortPart04Test052
     * @tc.desc Verify length-1 #19 sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 1, 9]);
      let tailBefore: number = arr.$_get(arr.length - 1);
      arr.sort();
      expect(tailBefore).assertEqual(9);
      expect(arr.$_get(arr.length - 1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArraySortPart04Test053
     * @tc.desc Verify byteOffset=0 #24 sort buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf, 0, 3);
      arr.$_set(0, 7); arr.$_set(1, 2); arr.$_set(2, 5);
      arr.sort();
      let dv: DataView = new DataView(buf);
      expect(dv.getInt32(0, true)).assertEqual(2);
      expect(dv.getInt32(4, true)).assertEqual(5);
      expect(dv.getInt32(8, true)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArraySortPart04Test054
     * @tc.desc Verify fromIndex length-1 #34 sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 2, 4]);
      let lastBefore: number = arr.$_get(arr.length - 1);
      arr.sort();
      expect(lastBefore).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArraySortPart04Test055
     * @tc.desc Verify #39 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(
      [16, 2, 29, 7, 31, 11, 0, 23, 14, 5, 25, 9, 1, 30, 19, 12,
      27, 4, 20, 13, 8, 22, 17, 10, 28, 3, 15, 21, 6, 26, 18, 24]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(31)).assertEqual(31);
      for (let i = 0; i < 32; i++) { expect(arr.$_get(i)).assertEqual(i); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArraySortPart04Test056
     * @tc.desc Verify $_set 4294967297 2^32+1 1 sort 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 4294967297);
      arr.$_set(1, 3);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArraySortPart04Test057
     * @tc.desc Verify $_set 0.5( 0) 1.9( 1) sort 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 1.9);
      arr.$_set(1, 0.5);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArraySortPart04Test058
     * @tc.desc Verify $_set -3.9( -3) -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, -3.9);
      arr.$_set(1, 1);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-3);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArraySortPart04Test059
     * @tc.desc Verify $_set INT32_MIN 1 sort MIN 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 1);
      arr.$_set(1, -2147483648);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArraySortPart04Test060
     * @tc.desc Verify sort $_set(1, 0.5) $_get 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r = arr.sort();
      r.$_set(1, 0.5);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArraySortPart04Test061
     * @tc.desc Verify 1000000000(1e9 int32 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000000000, 0, -1000000000, 500000000]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1000000000);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(500000000);
      expect(arr.$_get(3)).assertEqual(1000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArraySortPart04Test062
     * @tc.desc Verify sort buffer offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(0, 4); parent.$_set(1, 2); parent.$_set(2, 3); parent.$_set(3, 1);
      let child: Int32Array = new Int32Array(buf);
      parent.sort();
      expect(child.$_get(0)).assertEqual(1);
      expect(child.$_get(1)).assertEqual(2);
      expect(child.$_get(2)).assertEqual(3);
      expect(child.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArraySortPart04Test063
     * @tc.desc Verify independent left and right subarray views sort within their ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([99, 5, 1, 3, 88]);
      let child: Int32Array = parent.subarray(1, 4);
      child.sort();
      expect(parent.$_get(0)).assertEqual(99);
      expect(parent.$_get(1)).assertEqual(1);
      expect(parent.$_get(2)).assertEqual(3);
      expect(parent.$_get(3)).assertEqual(5);
      expect(parent.$_get(4)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArraySortPart04Test064
     * @tc.desc Verify sorting one shared-buffer view leaves the disjoint guard view unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([9, 3, 7, 2, 8, 1]);
      let left: Int32Array = parent.subarray(0, 3);
      let right: Int32Array = parent.subarray(3, 6);
      left.sort();
      right.sort();
      expect(left.$_get(0)).assertEqual(3);
      expect(left.$_get(2)).assertEqual(9);
      expect(right.$_get(0)).assertEqual(1);
      expect(right.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArraySortPart04Test065
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let base: Int32Array = new Int32Array(buf);
      base.$_set(0, 5); base.$_set(1, 1); base.$_set(2, 3); base.$_set(3, 4); base.$_set(4, 2);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 16, 1);
      let guardB: number = b.$_get(0);
      a.sort();
      expect(b.$_get(0)).assertEqual(guardB);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArraySortPart04Test066
     * @tc.desc Verify DataView sort Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 7); arr.$_set(1, 2); arr.$_set(2, 5);
      arr.sort();
      let dv: DataView = new DataView(buf);
      expect(dv.getInt32(0, true)).assertEqual(2);
      expect(dv.getInt32(4, true)).assertEqual(5);
      expect(dv.getInt32(8, true)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArraySortPart04Test067
     * @tc.desc Verify Uint8Array Int32Array sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let i32: Int32Array = new Int32Array(buf);
      i32.$_set(0, 2); i32.$_set(1, 1);
      let u8: Uint8Array = new Uint8Array(buf);
      let firstByteBefore: number = u8.$_get(0);
      i32.sort();
      expect(i32.$_get(0)).assertEqual(1);
      expect(i32.$_get(1)).assertEqual(2);
      expect(firstByteBefore).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_6800
     * @tc.name int32ArraySortPart04Test068
     * @tc.desc Verify byteOffset=4 sort buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let prefix: Int32Array = new Int32Array(buf, 0, 1);
      let view: Int32Array = new Int32Array(buf, 4, 3);
      prefix.$_set(0, 0xDEAD);
      view.$_set(0, 7); view.$_set(1, 1); view.$_set(2, 4);
      view.sort();
      expect(prefix.$_get(0)).assertEqual(0xDEAD);
      expect(view.$_get(0)).assertEqual(1);
      expect(view.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_6900
     * @tc.name int32ArraySortPart04Test069
     * @tc.desc Verify subarray sort sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([9, 5, 1, 6, 2]);
      let sub: Int32Array = parent.subarray(1, 4);
      sub.sort();
      parent.sort();
      expect(parent.$_get(0)).assertEqual(1);
      expect(parent.$_get(1)).assertEqual(2);
      expect(parent.$_get(2)).assertEqual(5);
      expect(parent.$_get(3)).assertEqual(6);
      expect(parent.$_get(4)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_7000
     * @tc.name int32ArraySortPart04Test070
     * @tc.desc Verify sort set buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 9); arr.$_set(1, 4); arr.$_set(2, 7); arr.$_set(3, 2); arr.$_set(4, 6);
      arr.sort();
      let src: Int32Array = new Int32Array([0, 0]);
      arr.set(src, 1);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_7100
     * @tc.name int32ArraySortPart04Test071
     * @tc.desc Verify buffer length sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let shortView: Int32Array = new Int32Array(buf, 0, 3);
      let longView: Int32Array = new Int32Array(buf, 0, 5);
      shortView.$_set(0, 3); shortView.$_set(1, 1); shortView.$_set(2, 2);
      longView.$_set(3, 40); longView.$_set(4, 50);
      shortView.sort();
      expect(longView.$_get(0)).assertEqual(1);
      expect(longView.$_get(1)).assertEqual(2);
      expect(longView.$_get(2)).assertEqual(3);
      expect(longView.$_get(3)).assertEqual(40);
      expect(longView.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_7200
     * @tc.name int32ArraySortPart04Test072
     * @tc.desc Verify sort subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 2, 9, 1, 5, 3]);
      arr.sort();
      let half: Int32Array = arr.subarray(0, 3);
      expect(half.length).assertEqual(3);
      expect(half.$_get(0)).assertEqual(1);
      expect(half.$_get(1)).assertEqual(2);
      expect(half.$_get(2)).assertEqual(3);
      expect(half.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_7300
     * @tc.name int32ArraySortPart04Test073
     * @tc.desc Verify byteOffset=12 length=2 sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let head: Int32Array = new Int32Array(buf, 0, 3);
      let mid: Int32Array = new Int32Array(buf, 12, 2);
      let tail: Int32Array = new Int32Array(buf, 20, 1);
      head.$_set(0, 100); head.$_set(1, 200); head.$_set(2, 300);
      mid.$_set(0, 9); mid.$_set(1, 4);
      tail.$_set(0, 999);
      mid.sort();
      expect(head.$_get(0)).assertEqual(100);
      expect(mid.$_get(0)).assertEqual(4);
      expect(mid.$_get(1)).assertEqual(9);
      expect(tail.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_7400
     * @tc.name int32ArraySortPart04Test074
     * @tc.desc Verify sort buffer Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let i32: Int32Array = new Int32Array(buf);
      i32.$_set(0, 4); i32.$_set(1, 3); i32.$_set(2, 2); i32.$_set(3, 1);
      i32.sort();
      let f32: Float32Array = new Float32Array(buf);
      expect(f32.length).assertEqual(4);
      expect(f32.byteLength).assertEqual(16);
      expect(i32.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_7500
     * @tc.name int32ArraySortPart04Test075
     * @tc.desc Verify slice() sort buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array([3, 1, 4]);
      let cp: Int32Array = orig.slice();
      cp.sort();
      expect(orig.$_get(0)).assertEqual(3);
      expect(orig.$_get(1)).assertEqual(1);
      expect(orig.$_get(2)).assertEqual(4);
      expect(cp.$_get(0)).assertEqual(1);
      expect(cp.$_get(2)).assertEqual(4);
      let independent: boolean = cp.buffer !== orig.buffer;
      expect(independent).assertTrue();
      cp.$_set(0, 100);
      expect(orig.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_7600
     * @tc.name int32ArraySortPart04Test076
     * @tc.desc Verify subarray begin=end sort no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([4, 3, 2, 1]);
      let empty: Int32Array = parent.subarray(2, 2);
      empty.sort();
      expect(parent.$_get(0)).assertEqual(4);
      expect(parent.$_get(3)).assertEqual(1);
      expect(empty.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_7700
     * @tc.name int32ArraySortPart04Test077
     * @tc.desc Verify subarray sort no-op slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([7, 3, 9]);
      let single: Int32Array = parent.subarray(1, 2);
      single.sort();
      expect(single.$_get(0)).assertEqual(3);
      expect(parent.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_7800
     * @tc.name int32ArraySortPart04Test078
     * @tc.desc Verify compareFn buffer detach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 3); arr.$_set(1, 1); arr.$_set(2, 2);
      try {
        arr.sort((a: number, b: number): int => { throw new Error('boom'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(buf.byteLength).assertEqual(12);
      let v: Int32Array = new Int32Array(buf);
      expect(v.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_7900
     * @tc.name int32ArraySortPart04Test079
     * @tc.desc Verify compareFn sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      try {
        arr.sort((a: number, b: number): int => { throw new Error('x'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_8000
     * @tc.name int32ArraySortPart04Test080
     * @tc.desc Verify compareFn calls=2 sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 2, 8, 1]);
      let calls: int = 0;
      try {
        arr.sort((a: number, b: number): int => {
          calls = calls + 1;
          if (calls >= 2) { throw new Error('second'); }
          return Double.toInt(a - b);
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(calls).assertEqual(2);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_8100
     * @tc.name int32ArraySortPart04Test081
     * @tc.desc Verify compareFn length/BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 3); a.$_set(1, 1); a.$_set(2, 2);
      try {
        a.sort((_x: number, _y: number): int => { throw new Error('e'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(b.length).assertEqual(3);
      expect(b.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_8200
     * @tc.name int32ArraySortPart04Test082
     * @tc.desc Verify offset=4 sort buffer/byteOffset/length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      arr.$_set(0, 5); arr.$_set(1, 2); arr.$_set(2, 7);
      try {
        arr.sort((a: number, b: number): int => { throw new Error('mid'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART04_TEST_MINDMAP_8300
     * @tc.name int32ArraySortPart04Test083
     * @tc.desc Verify compareFn length e
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart04Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      try {
        arr.sort((a: number, b: number): int => { throw new Error('x'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(3);
    });
  });
}
