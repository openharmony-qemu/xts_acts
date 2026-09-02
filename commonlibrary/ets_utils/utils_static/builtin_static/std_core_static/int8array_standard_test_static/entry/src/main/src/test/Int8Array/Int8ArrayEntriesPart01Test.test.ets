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

export default function int8ArrayEntriesPart01Test(): void {
  describe('Int8ArrayEntriesPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_0100
     * @tc.name int8ArrayEntriesPart01Test001
     * @tc.desc Verify entries() with 0 arg on 2-element array, first value equals 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(11, 22);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(11);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_0200
     * @tc.name int8ArrayEntriesPart01Test002
     * @tc.desc Verify entries() with 0 arg on 3-element array, first next().done is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 8, 9);
      let iter = arr.entries();
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_0300
     * @tc.name int8ArrayEntriesPart01Test003
     * @tc.desc Verify new Int8Array() empty array, entries() first next().done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array();
      let iter = arr.entries();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_0400
     * @tc.name int8ArrayEntriesPart01Test004
     * @tc.desc Verify Int8Array.of() zero-arg variadic empty array, entries() first next().done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of();
      let iter = arr.entries();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_0500
     * @tc.name int8ArrayEntriesPart01Test005
     * @tc.desc Verify empty ArrayBuffer zero-length view entries() first next().done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int8Array = new Int8Array(buf, 0, 0);
      let iter = arr.entries();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_0600
     * @tc.name int8ArrayEntriesPart01Test006
     * @tc.desc Verify from empty Set<int> creates empty array, entries() first next().done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      let arr: Int8Array = Int8Array.from(src);
      let iter = arr.entries();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_0700
     * @tc.name int8ArrayEntriesPart01Test007
     * @tc.desc Verify subarray(2,2) zero-length view, entries() first next().done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(10, 20, 30, 40);
      let view: Int8Array = base.subarray(2, 2);
      let iter = view.entries();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_0800
     * @tc.name int8ArrayEntriesPart01Test008
     * @tc.desc Verify entries() on Int8Array.of(42) yields exactly one entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let iter = arr.entries();
      let count: number = 0;
      let r = iter.next();
      while (!r.done) {
        count = count + 1;
        r = iter.next();
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_0900
     * @tc.name int8ArrayEntriesPart01Test009
     * @tc.desc Verify entries() on Int8Array.of(42) yields value 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(42);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_1000
     * @tc.name int8ArrayEntriesPart01Test010
     * @tc.desc Verify element -1 (negative unit) entries returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(-1);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_1100
     * @tc.name int8ArrayEntriesPart01Test011
     * @tc.desc Verify writing -129 negative overflow wraps to 127, entries returns 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, -129);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(INT8_MAX);
        break;
      }
      arr.$_set(0, 127.9);
      for (const entry2 of arr.entries()) {
        let r1: number = entry2[1];
        let e1: number = INT8_MAX;
        expect(r1).assertEqual(e1);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_1200
     * @tc.name int8ArrayEntriesPart01Test012
     * @tc.desc Verify writing 256 positive overflow wraps to 0, entries returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 256);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(0);
        break;
      }
      arr.$_set(0, 1.9);
      for (const entry2 of arr.entries()) {
        let r1: number = entry2[1];
        let e1: int = 1;
        expect(r1).assertEqual(e1);
        break;
      }
      arr.$_set(0, -1.9);
      for (const entry3 of arr.entries()) {
        let r2: number = entry3[1];
        let e2: int = -1;
        expect(r2).assertEqual(e2);
        break;
      }
      arr.$_set(0, 0.5);
      for (const entry4 of arr.entries()) {
        let r3: number = entry4[1];
        let e3: int = 0;
        expect(r3).assertEqual(e3);
        break;
      }
      arr.$_set(0, -0.5);
      for (const entry5 of arr.entries()) {
        let r4: number = entry5[1];
        let e4: int = 0;
        expect(r4).assertEqual(e4);
        break;
      }
      arr.$_set(0, -0.0);
      for (const entry6 of arr.entries()) {
        let r5: number = entry6[1];
        let e5: int = 0;
        expect(r5).assertEqual(e5);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_1300
     * @tc.name int8ArrayEntriesPart01Test013
     * @tc.desc Verify writing 129 wraps to -127, entries returns -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 129);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(-INT8_MAX);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_1400
     * @tc.name int8ArrayEntriesPart01Test014
     * @tc.desc Verify writing -128.9 truncates toward zero to -128, entries returns -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, -128.9);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(INT8_MIN);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_1500
     * @tc.name int8ArrayEntriesPart01Test015
     * @tc.desc Verify writing very large positive value overflow wraps to 127, entries returns 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 25727);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(INT8_MAX);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_1600
     * @tc.name int8ArrayEntriesPart01Test016
     * @tc.desc Verify entries() on Int8Array.of(INT8_MIN, INT8_MAX) yields INT8_MIN at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MIN, INT8_MAX);
      let pos: number = 0;
      for (const entry of arr.entries()) {
        if (pos === 0) {
          let [i1, v1]: [number, number] = entry;
          expect(v1).assertEqual(INT8_MIN);
        }
        pos = pos + 1;
      }
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_1700
     * @tc.name int8ArrayEntriesPart01Test017
     * @tc.desc Verify entries() on Int8Array.of(INT8_MIN, INT8_MAX) yields INT8_MAX at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MIN, INT8_MAX);
      let pos: number = 0;
      for (const entry of arr.entries()) {
        if (pos === 1) {
          let [i1, v1]: [number, number] = entry;
          expect(v1).assertEqual(INT8_MAX);
        }
        pos = pos + 1;
      }
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_1800
     * @tc.name int8ArrayEntriesPart01Test018
     * @tc.desc Verify entries() [7, 7, 7] index of third element is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 7, 7);
      let pos: number = 0;
      for (const entry of arr.entries()) {
        if (pos === 2) {
          let [i0, v0]: [number, number] = entry;
          expect(i0).assertEqual(2);
          expect(v0).assertEqual(7);
        }
        pos = pos + 1;
      }
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_1900
     * @tc.name int8ArrayEntriesPart01Test019
     * @tc.desc Verify entries() [127, -128, 0] third element is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MAX, INT8_MIN, 0);
      let pos: number = 0;
      for (const entry of arr.entries()) {
        if (pos === 2) {
          let [i1, v1]: [number, number] = entry;
          expect(v1).assertEqual(0);
        }
        pos = pos + 1;
      }
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_2000
     * @tc.name int8ArrayEntriesPart01Test020
     * @tc.desc Verify entries() on Int8Array.of(0, -1) yields 0 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, -1);
      let pos: number = 0;
      for (const entry of arr.entries()) {
        if (pos === 0) {
          let [i1, v1]: [number, number] = entry;
          expect(v1).assertEqual(0);
        }
        pos = pos + 1;
      }
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_2100
     * @tc.name int8ArrayEntriesPart01Test021
     * @tc.desc Verify entries() on Int8Array.of(0, -1) yields -1 at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, -1);
      let pos: number = 0;
      for (const entry of arr.entries()) {
        if (pos === 1) {
          let [i1, v1]: [number, number] = entry;
          expect(v1).assertEqual(-1);
        }
        pos = pos + 1;
      }
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_2200
     * @tc.name int8ArrayEntriesPart01Test022
     * @tc.desc Verify entries() FixedArray<int> source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [5, 6, 7];
      let arr: Int8Array = new Int8Array(src);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(5);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_2300
     * @tc.name int8ArrayEntriesPart01Test023
     * @tc.desc Verify entries() Array<int> source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [8, 9];
      let arr: Int8Array = new Int8Array(src);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(8);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_2400
     * @tc.name int8ArrayEntriesPart01Test024
     * @tc.desc Verify entries() Iterable<Number> source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<Number> = [3.0, 4.0];
      let arr: Int8Array = new Int8Array(src);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(3);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_2500
     * @tc.name int8ArrayEntriesPart01Test025
     * @tc.desc Verify entries() copy construct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(11, 22);
      let arr: Int8Array = new Int8Array(src);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(11);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_2600
     * @tc.name int8ArrayEntriesPart01Test026
     * @tc.desc Verify entries() from(Set<int>) insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(21);
      src.add(22);
      let arr: Int8Array = Int8Array.from(src);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(21);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_2700
     * @tc.name int8ArrayEntriesPart01Test027
     * @tc.desc Verify entries() from(Array<number>) number-to-int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [41.0, 42.0];
      let arr: Int8Array = Int8Array.from(src);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(41);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_2800
     * @tc.name int8ArrayEntriesPart01Test028
     * @tc.desc Verify entries() from(FixedArray<int>) construct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [13, 14];
      let arr: Int8Array = Int8Array.from(src);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(13);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_2900
     * @tc.name int8ArrayEntriesPart01Test029
     * @tc.desc Verify entries() from(Int8Array) same-type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = Int8Array.of(31, 32);
      let arr: Int8Array = Int8Array.from(src);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(31);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_3000
     * @tc.name int8ArrayEntriesPart01Test030
     * @tc.desc Verify entries() from FixedArray<int> source with INT8_MIN and INT8_MAX, second element is INT8_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [INT8_MIN, INT8_MAX];
      let arr: Int8Array = new Int8Array(src);
      let pos: number = 0;
      for (const entry of arr.entries()) {
        if (pos === 1) {
          let [i1, v1]: [number, number] = entry;
          expect(v1).assertEqual(INT8_MAX);
        }
        pos = pos + 1;
      }
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_3100
     * @tc.name int8ArrayEntriesPart01Test031
     * @tc.desc Verify entries() from(Set<int>) source with INT8_MIN and INT8_MAX, first element is INT8_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(INT8_MIN);
      src.add(INT8_MAX);
      let arr: Int8Array = Int8Array.from(src);
      let pos: number = 0;
      for (const entry of arr.entries()) {
        if (pos === 0) {
          let [i1, v1]: [number, number] = entry;
          expect(v1).assertEqual(INT8_MIN);
        }
        pos = pos + 1;
      }
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_3200
     * @tc.name int8ArrayEntriesPart01Test032
     * @tc.desc Verify entries() fill(-5) full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(-5);
      let pos: number = 0;
      for (const entry of arr.entries()) {
        if (pos === 2) {
          let [i1, v1]: [number, number] = entry;
          expect(v1).assertEqual(-5);
        }
        pos = pos + 1;
      }
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_3300
     * @tc.name int8ArrayEntriesPart01Test033
     * @tc.desc Verify entries() reverse() first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      arr.reverse();
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(3);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_3400
     * @tc.name int8ArrayEntriesPart01Test034
     * @tc.desc Verify entries() set(src, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      let src: Int8Array = Int8Array.of(9, 8);
      arr.set(src, 0);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(9);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_3500
     * @tc.name int8ArrayEntriesPart01Test035
     * @tc.desc Verify length 100 array fill then entries, last index equals 99 (large array full traversal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      arr.fill(5);
      let lastIndex: number = -1;
      for (const entry of arr.entries()) {
        let [lastIdx, lastVal]: [number, number] = entry;
        lastIndex = lastIdx;
      }
      expect(lastIndex).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_3600
     * @tc.name int8ArrayEntriesPart01Test036
     * @tc.desc Verify entries() subarray(-2) negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = base.subarray(-2);
      for (const entry of view.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(40);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_3700
     * @tc.name int8ArrayEntriesPart01Test037
     * @tc.desc Verify entries() subarray(1) single-arg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = base.subarray(1);
      for (const entry of view.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(20);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_3800
     * @tc.name int8ArrayEntriesPart01Test038
     * @tc.desc Verify entries() subarray(-1) last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = base.subarray(-1);
      let iter = view.entries();
      let count: number = 0;
      let r = iter.next();
      while (!r.done) {
        count = count + 1;
        r = iter.next();
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_3900
     * @tc.name int8ArrayEntriesPart01Test039
     * @tc.desc Verify entries() constructor from ArrayLike source [1, 2], first value is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(1);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_4000
     * @tc.name int8ArrayEntriesPart01Test040
     * @tc.desc Verify entries() constructor from ArrayLike source [2, 3], first value is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([2, 3]);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(2);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_4100
     * @tc.name int8ArrayEntriesPart01Test041
     * @tc.desc Verify writing Number.POSITIVE_INFINITY truncates to 0, entries returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(0);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_4200
     * @tc.name int8ArrayEntriesPart01Test042
     * @tc.desc Verify writing Number.NEGATIVE_INFINITY truncates to 0, entries returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, Number.NEGATIVE_INFINITY);
      for (const entry of arr.entries()) {
        let [i1, v1]: [number, number] = entry;
        expect(v1).assertEqual(0);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_ENTRIES_PART01_4300
     * @tc.name int8ArrayEntriesPart01Test043
     * @tc.desc Verify entries() yields 0 for both POSITIVE_INFINITY and NEGATIVE_INFINITY elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEntriesPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      arr.$_set(1, Number.NEGATIVE_INFINITY);
      let pos: number = 0;
      for (const entry of arr.entries()) {
        if (pos === 0) {
          let [i1, v1]: [number, number] = entry;
          expect(v1).assertEqual(0);
        }
        if (pos === 1) {
          let [i1, v1]: [number, number] = entry;
          expect(v1).assertEqual(0);
        }
        pos = pos + 1;
      }
      expect(pos).assertEqual(2);
    });
  });
}
