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

export default function uint8ClampedArrayUnderIteratorTest(): void {
  describe('Uint8ClampedArrayUnderIteratorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_0100
     * @tc.name testUint8ClampedArrayUnderIterator001
     * @tc.desc Verify for..of sum on [1,2,3] equals 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let sum: number = 0;
      for (const v of arr) {
        sum += v;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_0200
     * @tc.name testUint8ClampedArrayUnderIterator002
     * @tc.desc Verify for..of element typeof is number on [7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7]);
      let typeStr: string = '';
      for (const v of arr) {
        typeStr = typeof v;
      }
      expect(typeStr).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_0300
     * @tc.name testUint8ClampedArrayUnderIterator003
     * @tc.desc Verify for..of on empty array iterates 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let count: number = 0;
      for (const v of arr) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_0400
     * @tc.name testUint8ClampedArrayUnderIterator004
     * @tc.desc Verify $_iterator and values produce equal sum on [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let sumA: number = 0;
      let sumB: number = 0;
      const itA = arr.$_iterator();
      let r = itA.next();
      while (!r.done) {
        sumA += r.value ?? 0.0;
        r = itA.next();
      }
      const itB = arr.values();
      let r2 = itB.next();
      while (!r2.done) {
        sumB += r2.value ?? 0.0;
        r2 = itB.next();
      }
      expect(sumA).assertEqual(sumB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_0500
     * @tc.name testUint8ClampedArrayUnderIterator005
     * @tc.desc Verify next() done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const it = arr.$_iterator();
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_0600
     * @tc.name testUint8ClampedArrayUnderIterator006
     * @tc.desc Verify next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const it = arr.$_iterator();
      expect(it.next().value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_0700
     * @tc.name testUint8ClampedArrayUnderIterator007
     * @tc.desc Verify next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const it = arr.$_iterator();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_0800
     * @tc.name testUint8ClampedArrayUnderIterator008
     * @tc.desc Verify for..of clamp: 256→255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_0900
     * @tc.name testUint8ClampedArrayUnderIterator009
     * @tc.desc Verify for..of clamp: -1→0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_1000
     * @tc.name testUint8ClampedArrayUnderIterator010
     * @tc.desc Verify for..of clamp: NaN→0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_1100
     * @tc.name testUint8ClampedArrayUnderIterator011
     * @tc.desc Verify for..of clamp: Infinity→255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_1200
     * @tc.name testUint8ClampedArrayUnderIterator012
     * @tc.desc Verify for..of clamp: 127.5→128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_1300
     * @tc.name testUint8ClampedArrayUnderIterator013
     * @tc.desc Verify for..of clamp: 128.5→128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128.5]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_1400
     * @tc.name testUint8ClampedArrayUnderIterator014
     * @tc.desc Verify two $_iterator instances are independent on [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const itA = arr.$_iterator();
      const itB = arr.$_iterator();
      itA.next();
      expect(itB.next().value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_1500
     * @tc.name testUint8ClampedArrayUnderIterator015
     * @tc.desc Verify subarray(1,4) for..of elements match [2,3,4] on [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      let sum: number = 0;
      for (const v of sub) {
        sum += v;
      }
      expect(arr.length).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_1600
     * @tc.name testUint8ClampedArrayUnderIterator016
     * @tc.desc Verify slice for..of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const s = arr.slice(0, 2);
      let sum: number = 0;
      for (const v of s) {
        sum += v;
      }
      expect(sum).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_1700
     * @tc.name testUint8ClampedArrayUnderIterator017
     * @tc.desc Verify ArrayBuffer for..of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const arr = new Uint8ClampedArray(buf);
      let sum: number = 0;
      for (const v of arr) {
        sum += v;
      }
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_1800
     * @tc.name testUint8ClampedArrayUnderIterator018
     * @tc.desc Verify ArrayBuffer(buf, 2, 3) for..of iterates 3 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(5);
      const arr = new Uint8ClampedArray(buf, 2, 3);
      let count: number = 0;
      for (const v of arr) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_1900
     * @tc.name testUint8ClampedArrayUnderIterator019
     * @tc.desc Verify for..of throw inside loop propagates Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        for (const v of arr) {
          throw new Error('inner');
        }
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_2000
     * @tc.name testUint8ClampedArrayUnderIterator020
     * @tc.desc Verify for..of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let count: number = 0;
      for (const v of arr) {
        count++;
        if (count === 2) {
          break;
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_2100
     * @tc.name testUint8ClampedArrayUnderIterator021
     * @tc.desc Verify for..of continue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let sum: number = 0;
      let idx: number = 0;
      for (const v of arr) {
        if (idx % 2 === 0) {
          idx++;
          continue;
        }
        sum += v;
        idx++;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_2200
     * @tc.name testUint8ClampedArrayUnderIterator022
     * @tc.desc Verify next() value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const it = arr.$_iterator();
      it.next();
      it.next();
      const r = it.next();
      expect(r.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_2300
     * @tc.name testUint8ClampedArrayUnderIterator023
     * @tc.desc Verify for..of single last 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      let v: number = -1;
      for (const x of arr) {
        v = x;
      }
      expect(v).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_2400
     * @tc.name testUint8ClampedArrayUnderIterator024
     * @tc.desc Verify for..of two first 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      let first: number = -1;
      for (const x of arr) {
        first = x;
        break;
      }
      expect(first).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_2500
     * @tc.name testUint8ClampedArrayUnderIterator025
     * @tc.desc Verify for..of two last 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      let v: number = -1;
      for (const x of arr) {
        v = x;
      }
      expect(v).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_2600
     * @tc.name testUint8ClampedArrayUnderIterator026
     * @tc.desc Verify for..of count 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let count: number = 0;
      for (const x of arr) {
        count++;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_2700
     * @tc.name testUint8ClampedArrayUnderIterator027
     * @tc.desc Verify for..of prod 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 3, 4]);
      let prod: number = 1;
      for (const x of arr) {
        prod *= x;
      }
      expect(prod).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_2800
     * @tc.name testUint8ClampedArrayUnderIterator028
     * @tc.desc Verify for..of count 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let count: number = 0;
      for (const x of arr) {
        count++;
      }
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_2900
     * @tc.name testUint8ClampedArrayUnderIterator029
     * @tc.desc Verify for..of empty sum 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let sum: number = 100;
      for (const x of arr) {
        sum += x;
      }
      expect(sum).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_3000
     * @tc.name testUint8ClampedArrayUnderIterator030
     * @tc.desc Verify for..of empty ArrayBuffer count 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Uint8ClampedArray(buf);
      let count: number = 0;
      for (const x of arr) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_3100
     * @tc.name testUint8ClampedArrayUnderIterator031
     * @tc.desc Verify for..of zero subarray count 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(1, 1);
      let count: number = 0;
      for (const x of sub) {
        count++;
      }
      expect(arr.length).assertEqual(3);
      expect(sub.length).assertEqual(0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_3200
     * @tc.name testUint8ClampedArrayUnderIterator032
     * @tc.desc Verify iterator values first 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const itA = arr.$_iterator();
      const itB = arr.values();
      expect(itA.next().value).assertEqual(10);
      expect(itB.next().value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_3300
     * @tc.name testUint8ClampedArrayUnderIterator033
     * @tc.desc Verify iterator values empty done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.$_iterator().next().done).assertTrue();
      expect(arr.values().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_3400
     * @tc.name testUint8ClampedArrayUnderIterator034
     * @tc.desc Verify iterator values single first 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([88]);
      expect(arr.$_iterator().next().value).assertEqual(88);
      expect(arr.values().next().value).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_3500
     * @tc.name testUint8ClampedArrayUnderIterator035
     * @tc.desc Verify iterator values single second done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([88]);
      const itA = arr.$_iterator();
      const itB = arr.values();
      itA.next();
      itB.next();
      expect(itA.next().done).assertTrue();
      expect(itB.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_3600
     * @tc.name testUint8ClampedArrayUnderIterator036
     * @tc.desc Verify next idempotent third done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const it = arr.$_iterator();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_3700
     * @tc.name testUint8ClampedArrayUnderIterator037
     * @tc.desc Verify next second value 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const it = arr.$_iterator();
      it.next();
      expect(it.next().value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_3800
     * @tc.name testUint8ClampedArrayUnderIterator038
     * @tc.desc Verify next third value 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const it = arr.$_iterator();
      it.next();
      it.next();
      expect(it.next().value).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_3900
     * @tc.name testUint8ClampedArrayUnderIterator039
     * @tc.desc Verify for..of clamp: -Infinity→0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-Number.POSITIVE_INFINITY]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_4000
     * @tc.name testUint8ClampedArrayUnderIterator040
     * @tc.desc Verify for..of clamp: 0→0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_4100
     * @tc.name testUint8ClampedArrayUnderIterator041
     * @tc.desc Verify for..of clamp: 255→255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_4200
     * @tc.name testUint8ClampedArrayUnderIterator042
     * @tc.desc Verify for..of clamp: 1e9→255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e9]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_4300
     * @tc.name testUint8ClampedArrayUnderIterator043
     * @tc.desc Verify for..of clamp: -1e9→0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1e9]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_4400
     * @tc.name testUint8ClampedArrayUnderIterator044
     * @tc.desc Verify for..of clamp: 0.9→1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.9]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_4500
     * @tc.name testUint8ClampedArrayUnderIterator045
     * @tc.desc Verify for..of clamp: 0.4→0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.4]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_4600
     * @tc.name testUint8ClampedArrayUnderIterator046
     * @tc.desc Verify for..of clamp: 0xFF→255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_4700
     * @tc.name testUint8ClampedArrayUnderIterator047
     * @tc.desc Verify for..of clamp: 0o17→15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o17]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_4800
     * @tc.name testUint8ClampedArrayUnderIterator048
     * @tc.desc Verify for..of clamp: 0b1010→10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b1010]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_4900
     * @tc.name testUint8ClampedArrayUnderIterator049
     * @tc.desc Verify for..of clamp: 1e2→100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e2]);
      let v: number = -1;
      for (const x of arr) { v = x; }
      expect(v).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_5000
     * @tc.name testUint8ClampedArrayUnderIterator050
     * @tc.desc Verify for..of sum=6 then source arr.length=3 on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let sum: number = 0;
      for (const x of arr) {
        sum += x;
      }
      expect(arr.length).assertEqual(3);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_5100
     * @tc.name testUint8ClampedArrayUnderIterator051
     * @tc.desc Verify for..of sum=6 and arr[0]=1 unchanged on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let sum: number = 0;
      for (const x of arr) {
        sum += x;
      }
      expect(sum).assertEqual(6);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_5200
     * @tc.name testUint8ClampedArrayUnderIterator052
     * @tc.desc Verify for..of sum=6 and arr[2]=3 unchanged on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let sum: number = 0;
      for (const x of arr) {
        sum += x;
      }
      expect(sum).assertEqual(6);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_5300
     * @tc.name testUint8ClampedArrayUnderIterator053
     * @tc.desc Verify two iterator full sum 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const itA = arr.$_iterator();
      let sumA: number = 0;
      let r = itA.next();
      while (!r.done) {
        sumA += r.value ?? 0.0;
        r = itA.next();
      }
      const itB = arr.$_iterator();
      let sumB: number = 0;
      let r2 = itB.next();
      while (!r2.done) {
        sumB += r2.value ?? 0.0;
        r2 = itB.next();
      }
      expect(sumA).assertEqual(6);
      expect(sumB).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_ITERATOR_5400
     * @tc.name testUint8ClampedArrayUnderIterator054
     * @tc.desc Verify subarray(1,4) for..of elements match [2,3,4] on [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderIterator054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      let count: number = 0;
      for (const x of sub) {
        count++;
      }
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
    });
  });
}
