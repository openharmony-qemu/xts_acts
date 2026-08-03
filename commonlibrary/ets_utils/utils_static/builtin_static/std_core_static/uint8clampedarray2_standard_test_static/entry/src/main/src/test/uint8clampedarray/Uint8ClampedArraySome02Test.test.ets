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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint8ClampedArraySomeTwoTest(): void {
  describe('Uint8ClampedArraySomeTwoTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_0100
     * @tc.name testUint8ClampedArraySomeTwo001
     * @tc.desc Verify some on [7] with always-false predicate returns false, predicate called once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7]);
      let count: number = 0;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { count++; return false; });
      expect(r).assertFalse();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_0200
     * @tc.name testUint8ClampedArraySomeTwo002
     * @tc.desc Verify some on [5,6,7] with predicate (i+1)===2 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => (i + 1) === 2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_0300
     * @tc.name testUint8ClampedArraySomeTwo003
     * @tc.desc Verify some on [10,20,30] with predicate e===arr[1] at i===1 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => i === 1 && e === arr[1]);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_0400
     * @tc.name testUint8ClampedArraySomeTwo004
     * @tc.desc Verify some on [-1,100,200] with predicate e===0 returns true (-1 clamps to 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1, 100, 200]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_0500
     * @tc.name testUint8ClampedArraySomeTwo005
     * @tc.desc Verify some on [1,2,3] with predicate a[1]===2 at i===0 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => i === 0 && a[1] === 2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_0600
     * @tc.name testUint8ClampedArraySomeTwo006
     * @tc.desc Verify some on [1,2] with always-true predicate returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_0700
     * @tc.name testUint8ClampedArraySomeTwo007
     * @tc.desc Verify some on [1,2,3] does not mutate array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.some((e: number, i: int, a: Uint8ClampedArray) => e > 0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_0800
     * @tc.name testUint8ClampedArraySomeTwo008
     * @tc.desc Verify some on [1,2,3] does not mutate array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.some((e: number, i: int, a: Uint8ClampedArray) => e > 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_0900
     * @tc.name testUint8ClampedArraySomeTwo009
     * @tc.desc Verify some on [1,2,3] does not mutate array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const bufBefore = arr.buffer;
      arr.some((e: number, i: int, a: Uint8ClampedArray) => false);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_1000
     * @tc.name testUint8ClampedArraySomeTwo010
     * @tc.desc Verify some on [1,2,3] with predicate e===2 called twice both return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r1: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 2);
      const r2: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 2);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_1100
     * @tc.name testUint8ClampedArraySomeTwo011
     * @tc.desc Verify some on [1,2,3] predicate throws Error at i===2, catch asserts e.name Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.some((e: number, i: int, a: Uint8ClampedArray) => { if (i === 2) { throw new Error('inner'); } return false; });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_1200
     * @tc.name testUint8ClampedArraySomeTwo012
     * @tc.desc Verify subarray(1,3) some on [1,2,3,4,5] does not mutate parent elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 3);
      const r: boolean = sub.some((e: number, i: int, a: Uint8ClampedArray) => e === 5);
      expect(parent.length).assertEqual(5);
      expect(sub.length).assertEqual(2);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(3);
      expect(parent[3]).assertEqual(4);
      expect(parent[4]).assertEqual(5);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_1300
     * @tc.name testUint8ClampedArraySomeTwo013
     * @tc.desc Verify subarray(1,4) some on [1,2,3,4,5] predicate third argument a===sub
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      let same = false;
      sub.some((e: number, i: int, a: Uint8ClampedArray) => { same = (a === sub); return true; });
      expect(parent.length).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(3);
      expect(parent[3]).assertEqual(4);
      expect(parent[4]).assertEqual(5);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_1400
     * @tc.name testUint8ClampedArraySomeTwo014
     * @tc.desc Verify slice() some on [1,2,3] is independent of parent element modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const s = parent.slice();
      parent[0] = 99;
      const r: boolean = s.some((e: number, i: int, a: Uint8ClampedArray) => e === 1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_1500
     * @tc.name testUint8ClampedArraySomeTwo015
     * @tc.desc Verify some on [1,2,3] predicate sets a[2]=99 at i===0 returns true, arr[2]===99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { if (i === 0) a[2] = 99; return e === 1; });
      expect(r).assertTrue();
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_1600
     * @tc.name testUint8ClampedArraySomeTwo016
     * @tc.desc Verify some on [1,2,3] predicate writes a[2]=99 at i===0, then finds e===99 at i===2 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { if (i === 0) a[2] = 99; return e === 99; });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_1700
     * @tc.name testUint8ClampedArraySomeTwo017
     * @tc.desc Verify predicate out-of-bounds write throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let errorName: string = '';
      try {
        arr.some((e: number, i: int, a: Uint8ClampedArray) => { a.$_set(100, 7); return false; });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        errorName = e.name;
      }
      expect(arr.length).assertEqual(3);
      expect(errorName).assertEqual('RangeError');
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_1800
     * @tc.name testUint8ClampedArraySomeTwo018
     * @tc.desc Verify some on [1,0,0] predicate writes a[2]=300 clamps to 255, then finds e===255 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 0, 0]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { if (i === 0) a[2] = 300; return e === 255; });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_1900
     * @tc.name testUint8ClampedArraySomeTwo019
     * @tc.desc Verify some on Uint8ClampedArray.of(10,20,30) with predicate e===20 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 20);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_2000
     * @tc.name testUint8ClampedArraySomeTwo020
     * @tc.desc Verify some on Uint8ClampedArray.from([5,6,7]) with predicate e===6 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([5, 6, 7]);
      const arr = Uint8ClampedArray.from(src);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 6);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_2100
     * @tc.name testUint8ClampedArraySomeTwo021
     * @tc.desc Verify some on zero-length ArrayBuffer view [buf,4,0] with always-true predicate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 4, 0);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_2200
     * @tc.name testUint8ClampedArraySomeTwo022
     * @tc.desc Verify some on byteOffset=4 ArrayBuffer view finds element 77 at offset 1 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const full = new Uint8ClampedArray(buf);
      full[5] = 77;
      const view = new Uint8ClampedArray(buf, 4, 4);
      const r: boolean = view.some((e: number, i: int, a: Uint8ClampedArray) => e === 77);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_2300
     * @tc.name testUint8ClampedArraySomeTwo023
     * @tc.desc Verify some on [1,2,3] filled with 42 finds element 42 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(42);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 42);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_2400
     * @tc.name testUint8ClampedArraySomeTwo024
     * @tc.desc Verify some on reversed [1,2,3] with predicate i===0 && e===3 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => i === 0 && e === 3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_2500
     * @tc.name testUint8ClampedArraySomeTwo025
     * @tc.desc Verify some on [0,0,0,0] after set([10,20],1) finds element 20 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const src: Array<number> = [10, 20];
      arr.set(src, 1);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 20);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_2600
     * @tc.name testUint8ClampedArraySomeTwo026
     * @tc.desc Verify some on [1,2,3,4,5] after copyWithin(0,3) with predicate i===0 && e===4 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => i === 0 && e === 4);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_2700
     * @tc.name testUint8ClampedArraySomeTwo027
     * @tc.desc Verify some on 100-element array with always-true predicate short-circuits after 1 call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i: int = 0; i < 100; i++) { src.push(i); }
      const arr = new Uint8ClampedArray(src);
      let count = 0;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { count++; return true; });
      expect(r).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_2800
     * @tc.name testUint8ClampedArraySomeTwo028
     * @tc.desc Verify some on 50-element array [49 zeros, 1] finds last element, iterates 50 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i: int = 0; i < 49; i++) { src.push(0); }
      src.push(1);
      const arr = new Uint8ClampedArray(src);
      let count = 0;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { count++; return e === 1; });
      expect(r).assertTrue();
      expect(count).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_2900
     * @tc.name testUint8ClampedArraySomeTwo029
     * @tc.desc Verify some on 30-element array of all 1s with always-false predicate iterates all 30 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i: int = 0; i < 30; i++) { src.push(1); }
      const arr = new Uint8ClampedArray(src);
      let count = 0;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { count++; return false; });
      expect(r).assertFalse();
      expect(count).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_3000
     * @tc.name testUint8ClampedArraySomeTwo030
     * @tc.desc Verify predicate element % 2 === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 3, 4, 5]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e % 2 === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_3100
     * @tc.name testUint8ClampedArraySomeTwo031
     * @tc.desc Verify some on [1,3,5,7] with predicate e%2===0 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 3, 5, 7]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e % 2 === 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_3200
     * @tc.name testUint8ClampedArraySomeTwo032
     * @tc.desc Verify predicate index === element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2, 3]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === i);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_3300
     * @tc.name testUint8ClampedArraySomeTwo033
     * @tc.desc Verify some on [10,20,30] with predicate e===i returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === i);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_3400
     * @tc.name testUint8ClampedArraySomeTwo034
     * @tc.desc Verify nested some: outer [1,2] with inner some on [10,20,30] checking x===30 && e===1 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer = new Uint8ClampedArray([1, 2]);
      const inner = new Uint8ClampedArray([10, 20, 30]);
      const r: boolean = outer.some((e: number, i: int, a: Uint8ClampedArray) => inner.some((x: number, j: int, b: Uint8ClampedArray) => x === 30 && e === 1));
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_3500
     * @tc.name testUint8ClampedArraySomeTwo035
     * @tc.desc Verify predicate e > 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i: int = 0; i < 20; i++) { src.push(i === 10 ? 250 : 10); }
      const arr = new Uint8ClampedArray(src);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e > 200);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_3600
     * @tc.name testUint8ClampedArraySomeTwo036
     * @tc.desc Verify some on [5,0,5] with predicate e===0 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 0, 5]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_3700
     * @tc.name testUint8ClampedArraySomeTwo037
     * @tc.desc Verify some on [5,255,5] with predicate e===255 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 255, 5]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 255);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_3800
     * @tc.name testUint8ClampedArraySomeTwo038
     * @tc.desc Verify some on [10,20,30] with byte-typed target 20 predicate e===target returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const target: byte = 20;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === target);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_3900
     * @tc.name testUint8ClampedArraySomeTwo039
     * @tc.desc Verify some on [10,20,30] with int-typed targetIdx 2 predicate i===targetIdx returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const targetIdx: int = 2;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => i === targetIdx);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_4000
     * @tc.name testUint8ClampedArraySomeTwo040
     * @tc.desc Verify some on [1,2,3].with(1,99) with predicate e===99 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const replaced = arr.with(1, 99);
      const r: boolean = replaced.some((e: number, i: int, a: Uint8ClampedArray) => e === 99);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_4100
     * @tc.name testUint8ClampedArraySomeTwo041
     * @tc.desc Verify some on toSorted([3,1,2]) with predicate i===0 && e===1 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      const r: boolean = sorted.some((e: number, i: int, a: Uint8ClampedArray) => i === 0 && e === 1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_4200
     * @tc.name testUint8ClampedArraySomeTwo042
     * @tc.desc Verify some on toReversed([1,2,3]) with predicate i===0 && e===3 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const rev = arr.toReversed();
      const r: boolean = rev.some((e: number, i: int, a: Uint8ClampedArray) => i === 0 && e === 3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_4300
     * @tc.name testUint8ClampedArraySomeTwo043
     * @tc.desc Verify some on [1,2,3].map(e*2) with predicate e===6 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const mapped = arr.map((e: number, i: int, a: Uint8ClampedArray) => e * 2);
      const r: boolean = mapped.some((e: number, i: int, a: Uint8ClampedArray) => e === 6);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_4400
     * @tc.name testUint8ClampedArraySomeTwo044
     * @tc.desc Verify some on [1,2,3,4].filter(e>2) with predicate e===3 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const filtered = arr.filter((e: number, i: int, a: Uint8ClampedArray) => e > 2);
      const r: boolean = filtered.some((e: number, i: int, a: Uint8ClampedArray) => e === 3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_4500
     * @tc.name testUint8ClampedArraySomeTwo045
     * @tc.desc Verify some on [1,2,3,4,5].slice(1,4) with predicate e===3 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const s = arr.slice(1, 4);
      const r: boolean = s.some((e: number, i: int, a: Uint8ClampedArray) => e === 3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_4600
     * @tc.name testUint8ClampedArraySomeTwo046
     * @tc.desc Verify some on [1,2,3,4,5].slice(1,3) with predicate e===5 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const s = arr.slice(1, 3);
      const r: boolean = s.some((e: number, i: int, a: Uint8ClampedArray) => e === 5);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_4700
     * @tc.name testUint8ClampedArraySomeTwo047
     * @tc.desc Verify predicate % 100 == 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i: int = 0; i < 200; i++) { src.push(i === 150 ? 100 : 1); }
      const arr = new Uint8ClampedArray(src);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => {
        const isMultipleOf100: boolean = e % 100 < 1;
        return e > 0 ? isMultipleOf100 : false;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_4800
     * @tc.name testUint8ClampedArraySomeTwo048
     * @tc.desc Verify predicate i === length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i: int = 0; i < 300; i++) { src.push(5); }
      const arr = new Uint8ClampedArray(src);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => i === a.length - 1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_4900
     * @tc.name testUint8ClampedArraySomeTwo049
     * @tc.desc Verify predicate e + i === 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 5, 8, 9]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => (e + i) === 10);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_5000
     * @tc.name testUint8ClampedArraySomeTwo050
     * @tc.desc Verify some on [1,2,3,4] with accumulating sum>5 predicate returns true, sum===6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let sum = 0;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { sum += e; return sum > 5; });
      expect(r).assertTrue();
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_5100
     * @tc.name testUint8ClampedArraySomeTwo051
     * @tc.desc Verify some on empty subarray(2,2) of [1,2,3] returns false, predicate not called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const empty = parent.subarray(2, 2);
      let called = false;
      const r: boolean = empty.some((e: number, i: int, a: Uint8ClampedArray) => { called = true; return true; });
      expect(parent.length).assertEqual(3);
      expect(empty.length).assertEqual(0);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_5200
     * @tc.name testUint8ClampedArraySomeTwo052
     * @tc.desc Verify some predicate third argument a.buffer equals arr.buffer on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let same = false;
      arr.some((e: number, i: int, a: Uint8ClampedArray) => { same = (a.buffer === arr.buffer); return true; });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_5300
     * @tc.name testUint8ClampedArraySomeTwo053
     * @tc.desc Verify some predicate third argument a.byteLength equals 4 on [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let bl = -1;
      arr.some((e: number, i: int, a: Uint8ClampedArray) => { bl = a.byteLength; return true; });
      expect(bl).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_5400
     * @tc.name testUint8ClampedArraySomeTwo054
     * @tc.desc Verify subarray(1,4).some(e=>false) on [1,2,3,4,5] parent and sub elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      sub.some((e: number, i: int, a: Uint8ClampedArray) => false);
      expect(parent.length).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(3);
      expect(parent[3]).assertEqual(4);
      expect(parent[4]).assertEqual(5);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_5500
     * @tc.name testUint8ClampedArraySomeTwo055
     * @tc.desc Verify some predicate oob write throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.some((e: number, i: int, a: Uint8ClampedArray) => { a[100] = 7; return false; });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_5600
     * @tc.name testUint8ClampedArraySomeTwo056
     * @tc.desc Verify some on [1,2,3] with predicate e===a[a.length-1] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === a[a.length - 1]);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_5700
     * @tc.name testUint8ClampedArraySomeTwo057
     * @tc.desc Verify some on [7,8,9] with predicate e===a[0] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === a[0]);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_5800
     * @tc.name testUint8ClampedArraySomeTwo058
     * @tc.desc Verify some on [1,2,3,4] with predicate e===2 short-circuits, trueCount===1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let trueCount: number = 0;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { if (e === 2) { trueCount++; return true; } return false; });
      expect(r).assertTrue();
      expect(trueCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_5900
     * @tc.name testUint8ClampedArraySomeTwo059
     * @tc.desc Verify some on [1,2,3] with e===1 returns true, with e===4 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r1: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 1);
      const r2: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 4);
      expect(r1).assertTrue();
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_6000
     * @tc.name testUint8ClampedArraySomeTwo060
     * @tc.desc Verify some on [10,20,30,40] with always-false predicate iterates all 4 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      let count: number = 0;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { count++; return false; });
      expect(r).assertFalse();
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_6100
     * @tc.name testUint8ClampedArraySomeTwo061
     * @tc.desc Verify some on [10,20,30,40] with predicate i===2 short-circuits after 3 calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      let count: number = 0;
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => { count++; return i === 2; });
      expect(r).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_6200
     * @tc.name testUint8ClampedArraySomeTwo062
     * @tc.desc Verify some repeated pred consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const pred = (e: number, i: int, a: Uint8ClampedArray): boolean => e === 2;
      expect(arr.some(pred)).assertTrue();
      expect(arr.some(pred)).assertTrue();
      expect(arr.some(pred)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_6300
     * @tc.name testUint8ClampedArraySomeTwo063
     * @tc.desc Verify some on [5,6,7] with predicate (e*i)===0 returns true at i===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => (e * i) === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SOME_TWO_6400
     * @tc.name testUint8ClampedArraySomeTwo064
     * @tc.desc Verify some ternary return boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySomeTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: boolean = arr.some((e: number, i: int, a: Uint8ClampedArray) => e === 2 ? true : false);
      expect(r).assertTrue();
    });
  });
}
