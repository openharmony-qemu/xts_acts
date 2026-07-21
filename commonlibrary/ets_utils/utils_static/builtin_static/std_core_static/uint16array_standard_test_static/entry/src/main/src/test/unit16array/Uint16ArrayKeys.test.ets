'use static'


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

export default function uint16ArrayKeysTest(): void {
  describe('Uint16ArrayKeysTest', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_0100
     * @tc.name testUint16ArrayKeys001
     * @tc.desc Verify 1 for...of keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(1);
      arr[0] = 100;
      let count: int = 0;
      let expected: int[] = [0];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_0200
     * @tc.name testUint16ArrayKeys002
     * @tc.desc Verify 2 for...of keys 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(2);
      arr[0] = 10;
      arr[1] = 20;
      let count: int = 0;
      let expected: int[] = [0, 1];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_0300
     * @tc.name testUint16ArrayKeys003
     * @tc.desc Verify 3 for...of keys 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      let count: int = 0;
      let expected: int[] = [0, 1, 2];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_0400
     * @tc.name testUint16ArrayKeys004
     * @tc.desc Verify 5 for...of keys 0-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      let count: int = 0;
      let expected: int[] = [0, 1, 2, 3, 4];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_0500
     * @tc.name testUint16ArrayKeys005
     * @tc.desc Verify 10 for...of keys 0-9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(10);
      let count: int = 0;
      for (const k of arr.keys()) {
        expect(k).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_0600
     * @tc.name testUint16ArrayKeys006
     * @tc.desc Verify keys() for...of empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array();
      let executed: boolean = false;
      for (const k of arr.keys()) {
        executed = true;
      }
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_0700
     * @tc.name testUint16ArrayKeys007
     * @tc.desc Verify 0 keys() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(0);
      let executed: boolean = false;
      for (const k of arr.keys()) {
        executed = true;
      }
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_0800
     * @tc.name testUint16ArrayKeys008
     * @tc.desc Verify FixedArray keys() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([]);
      let executed: boolean = false;
      for (const k of arr.keys()) {
        executed = true;
      }
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_0900
     * @tc.name testUint16ArrayKeys009
     * @tc.desc Verify 3 keys() next() full iteration 0,1,2 done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      const iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      expect(result.value).assertEqual(0);
      expect(result.done).assertFalse();
      result = iter.next();
      expect(result.value).assertEqual(1);
      expect(result.done).assertFalse();
      result = iter.next();
      expect(result.value).assertEqual(2);
      expect(result.done).assertFalse();
      result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_1000
     * @tc.name testUint16ArrayKeys010
     * @tc.desc Verify keys() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array();
      const iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_1100
     * @tc.name testUint16ArrayKeys011
     * @tc.desc Verify for...of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      let count: int = 0;
      for (const k of arr.keys()) {
        if (k === 2) {
          break;
        }
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_1200
     * @tc.name testUint16ArrayKeys012
     * @tc.desc Verify for...of 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(7);
      let count: int = 0;
      for (const k of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_1300
     * @tc.name testUint16ArrayKeys013
     * @tc.desc Verify break for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      for (const k of arr.keys()) {
        if (k === 2) {
          break;
        }
      }
      let count: int = 0;
      for (const k of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_1400
     * @tc.name testUint16ArrayKeys014
     * @tc.desc Verify Uint16Array.of() keys() 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100, 200);
      let count: int = 0;
      let expected: int[] = [0, 1];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_1500
     * @tc.name testUint16ArrayKeys015
     * @tc.desc Verify FixedArray keys() 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([5, 10, 15]);
      let count: int = 0;
      let expected: int[] = [0, 1, 2];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_1600
     * @tc.name testUint16ArrayKeys016
     * @tc.desc Verify keys() 0,1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: Uint16Array = new Uint16Array(4);
      const arr: Uint16Array = new Uint16Array(source);
      let count: int = 0;
      let expected: int[] = [0, 1, 2, 3];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_1700
     * @tc.name testUint16ArrayKeys017
     * @tc.desc Verify ArrayBuffer keys() 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint16Array = new Uint16Array(buf);
      let count: int = 0;
      let expected: int[] = [0, 1];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_1800
     * @tc.name testUint16ArrayKeys018
     * @tc.desc Verify keys() multiple iterators independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      let iter1: IterableIterator<int> = arr.keys();
      let iter2: IterableIterator<int> = arr.keys();
      let v1: int = iter1.next().value!;
      let v2: int = iter2.next().value!;
      expect(v1).assertEqual(v2);
      expect(v1).assertEqual(0);
      iter1.next();
      iter1.next();
      iter1.next();
      v2 = iter2.next().value!;
      expect(v2).assertEqual(1);
      let iter3: IterableIterator<int> = arr.keys();
      expect(iter2.next().value!).assertEqual(2);
      expect(iter3.next().value!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_1900
     * @tc.name testUint16ArrayKeys019
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      let iter1: IterableIterator<int> = arr.keys();
      let iter2: IterableIterator<int> = arr.keys();
      iter1.next();
      iter1.next();
      iter1.next();
      let v2: int = iter2.next().value!;
      expect(v2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_2000
     * @tc.name testUint16ArrayKeys020
     * @tc.desc Verify for...of twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      let count1: int = 0;
      for (const k of arr.keys()) {
        count1++;
      }
      let count2: int = 0;
      for (const k of arr.keys()) {
        count2++;
      }
      expect(count1).assertEqual(count2);
      expect(count1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_2100
     * @tc.name testUint16ArrayKeys021
     * @tc.desc Verify 100 keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(100);
      const iter: IterableIterator<int> = arr.keys();
      let first: int = iter.next().value!;
      expect(first).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_2200
     * @tc.name testUint16ArrayKeys022
     * @tc.desc Verify 100 keys() 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(100);
      const iter: IterableIterator<int> = arr.keys();
      let last: int = 0;
      for (let i: int = 0; i < 100; i++) {
        let r = iter.next();
        expect(r.value).assertEqual(i);
        expect(r.done).assertFalse();
        if (i === 99) {
          last = r.value!;
        }
      }
      expect(last).assertEqual(99);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_2300
     * @tc.name testUint16ArrayKeys023
     * @tc.desc Verify 256 keys() 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(256);
      const iter: IterableIterator<int> = arr.keys();
      let last: int = 0;
      for (let i: int = 0; i < 256; i++) {
        let r = iter.next();
        expect(r.value).assertEqual(i);
        expect(r.done).assertFalse();
        if (i === 255) {
          last = r.value!;
        }
      }
      expect(last).assertEqual(255);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_2400
     * @tc.name testUint16ArrayKeys024
     * @tc.desc Verify fill() keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(4);
      arr.fill(42);
      let count: int = 0;
      let expected: int[] = [0, 1, 2, 3];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_2500
     * @tc.name testUint16ArrayKeys025
     * @tc.desc Verify set() keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const src: Uint16Array = Uint16Array.of(7, 8, 9);
      const arr: Uint16Array = new Uint16Array(5);
      arr.set(src);
      let count: int = 0;
      let expected: int[] = [0, 1, 2, 3, 4];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_2600
     * @tc.name testUint16ArrayKeys026
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      let count: int = 0;
      let expected: int[] = [0, 1, 2];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_2700
     * @tc.name testUint16ArrayKeys027
     * @tc.desc Verify keys modify array via key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(4);
      let count: int = 0;
      for (const k of arr.keys()) {
        arr[k] = 99;
        count++;
      }
      expect(count).assertEqual(4);
      for (let i: int = 0; i < 4; i++) {
        expect(arr.at(i)).assertEqual(99);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_2800
     * @tc.name testUint16ArrayKeys028
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      const iter1: IterableIterator<int> = arr.keys();
      const iter2: IterableIterator<int> = arr.keys();
      iter1.next();
      expect(iter2.next().value!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_2900
     * @tc.name testUint16ArrayKeys029
     * @tc.desc Verify keys() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      const iter: IterableIterator<int> = arr.keys();
      let count: int = 0;
      for (const k of iter) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_3000
     * @tc.name testUint16ArrayKeys030
     * @tc.desc Verify keys() 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([0, 0, 0]);
      let count: int = 0;
      let expected: int[] = [0, 1, 2];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_3100
     * @tc.name testUint16ArrayKeys031
     * @tc.desc Verify keys() 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([65535, 65535, 65535]);
      let count: int = 0;
      let expected: int[] = [0, 1, 2];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_3200
     * @tc.name testUint16ArrayKeys032
     * @tc.desc Verify keys() 0,1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([0, 32768, 65535, 1]);
      let count: int = 0;
      let expected: int[] = [0, 1, 2, 3];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_3300
     * @tc.name testUint16ArrayKeys033
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let seq1: int[] = [0, 0, 0];
      let idx1: int = 0;
      for (const k of arr.keys()) {
        seq1[idx1] = k;
        idx1++;
      }
      let seq2: int[] = [0, 0, 0];
      let idx2: int = 0;
      for (const k of arr.keys()) {
        seq2[idx2] = k;
        idx2++;
      }
      expect(seq1.at(0)).assertEqual(seq2[0]);
      expect(seq1.at(1)).assertEqual(seq2[1]);
      expect(seq1.at(2)).assertEqual(seq2[2]);
      expect(seq1.at(0)).assertEqual(0);
      expect(seq1.at(1)).assertEqual(1);
      expect(seq1.at(2)).assertEqual(2);
      expect(idx1).assertEqual(3);
      expect(idx2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_3400
     * @tc.name testUint16ArrayKeys034
     * @tc.desc Verify keys() no side effect on length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      let beforeLen: int = arr.length;
      for (const k of arr.keys()) {
      }
      let afterLen: int = arr.length;
      expect(beforeLen).assertEqual(afterLen);
      expect(afterLen).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_3500
     * @tc.name testUint16ArrayKeys035
     * @tc.desc Verify keys() no side effect on values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let before: number[] = [arr.at(0)!, arr.at(1)!, arr.at(2)!];
      for (const k of arr.keys()) {
      }
      expect(arr.at(0)).assertEqual(before[0]);
      expect(arr.at(1)).assertEqual(before[1]);
      expect(arr.at(2)).assertEqual(before[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_3600
     * @tc.name testUint16ArrayKeys036
     * @tc.desc Verify subarray() keys() 0,1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      const sub: Uint16Array = arr.subarray(0, 4);
      let count: int = 0;
      let expected: int[] = [0, 1, 2, 3];
      for (const k of sub.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_3700
     * @tc.name testUint16ArrayKeys037
     * @tc.desc Verify slice() keys() 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      const sliced: Uint16Array = arr.slice(0, 3);
      let count: int = 0;
      let expected: int[] = [0, 1, 2];
      for (const k of sliced.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_3800
     * @tc.name testUint16ArrayKeys038
     * @tc.desc Verify subarray(1,3) keys() 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([10, 20, 30, 40]);
      const sub: Uint16Array = arr.subarray(1, 3);
      let count: int = 0;
      let expected: int[] = [0, 1];
      for (const k of sub.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_3900
     * @tc.name testUint16ArrayKeys039
     * @tc.desc Verify number keys() 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3.0);
      let count: int = 0;
      let expected: int[] = [0, 1, 2];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_4000
     * @tc.name testUint16ArrayKeys040
     * @tc.desc Verify Uint16Array keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: Uint16Array = Uint16Array.of(7, 14, 21);
      const arr: Uint16Array = new Uint16Array(source);
      let count: int = 0;
      let expected: int[] = [0, 1, 2];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_4100
     * @tc.name testUint16ArrayKeys041
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0x0, 0x7FFF, 0xFFFF);
      let count: int = 0;
      let expected: int[] = [0, 1, 2];
      for (const k of arr.keys()) {
        expect(k).assertEqual(expected[count]);
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_4200
     * @tc.name testUint16ArrayKeys042
     * @tc.desc Verify keys() next() after exhaustion returns done=true repeatedly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(2);
      const iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      expect(result.value).assertEqual(0);
      expect(result.done).assertFalse();
      result = iter.next();
      expect(result.value).assertEqual(1);
      expect(result.done).assertFalse();
      result = iter.next();
      expect(result.done).assertTrue();
      result = iter.next();
      expect(result.done).assertTrue();
      result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_4300
     * @tc.name testUint16ArrayKeys043
     * @tc.desc Verify empty array keys() next() multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(0);
      const iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      expect(result.done).assertTrue();
      result = iter.next();
      expect(result.done).assertTrue();
      result = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_4400
     * @tc.name testUint16ArrayKeys044
     * @tc.desc Verify keys() iterator for single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(42);
      const iter: IterableIterator<int> = arr.keys();
      let result: IteratorResult<int> = iter.next();
      expect(result.value).assertEqual(0);
      expect(result.done).assertFalse();
      result = iter.next();
      expect(result.done).assertTrue();
      let count: int = 0;
      for (const k of arr.keys()) {
        expect(k).assertEqual(0);
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_4500
     * @tc.name testUint16ArrayKeys045
     * @tc.desc Verify empty keys iterator is immediately done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint16Array().keys().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_4600
     * @tc.name testUint16ArrayKeys046
     * @tc.desc Verify keys iterator remains done after exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterator = Uint16Array.of(1).keys();
            iterator.next();
            expect(iterator.next().done).assertTrue();
            expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_4700
     * @tc.name testUint16ArrayKeys047
     * @tc.desc Verify keys iterator reports all indices in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterator = Uint16Array.of(5, 6, 7).keys();
            expect(iterator.next().value).assertEqual(0);
            expect(iterator.next().value).assertEqual(1);
            expect(iterator.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_4800
     * @tc.name testUint16ArrayKeys048
     * @tc.desc Verify keys are unchanged when source values mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
            let iterator = arr.keys();
            arr[0] = 99;
            expect(iterator.next().value).assertEqual(0);
            expect(iterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_4900
     * @tc.name testUint16ArrayKeys049
     * @tc.desc Verify keys are relative to an offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(10);
            let view: Uint16Array = new Uint16Array(buffer, 4, 2);
            let iterator = view.keys();
            expect(iterator.next().value).assertEqual(0);
            expect(iterator.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_5000
     * @tc.name testUint16ArrayKeys050
     * @tc.desc Verify two keys iterators maintain independent positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
            let first = arr.keys();
            let second = arr.keys();
            first.next();
            expect(first.next().value).assertEqual(1);
            expect(second.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_5100
     * @tc.name testUint16ArrayKeys051
     * @tc.desc Verify keys iterator length is fixed by the receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(3);
            let count: int = 0;
            for (let key of arr.keys()) { count++; }
            expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_KEYS_5200
     * @tc.name testUint16ArrayKeys052
     * @tc.desc Verify keys iterator after copyWithin still reports receiver indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayKeys052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
            arr.copyWithin(1, 0, 2);
            let keys: Array<number> = [];
            for (let key of arr.keys()) { keys.push(key); }
            expect(keys.length).assertEqual(3);
            expect(keys.at(0)).assertEqual(0);
            expect(keys.at(1)).assertEqual(1);
            expect(keys.at(2)).assertEqual(2);
    });

  });
}
