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

export default function uint8ClampedArrayLastIndexOf02Test(): void {
  describe('uint8ClampedArrayLastIndexOf02Test', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        },50);
      });
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_0100
     * @tc.name testUint8ClampedArrayLastIndexOfTwo001
     * @tc.desc Verify lastIndexOf r equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.lastIndexOf(2);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_0200
     * @tc.name testUint8ClampedArrayLastIndexOfTwo002
     * @tc.desc Verify lastIndexOf last key equals 1 for array [0, 7, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 7, 2, 3]);
      expect(arr.lastIndexOf(7)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_0300
     * @tc.name testUint8ClampedArrayLastIndexOfTwo003
     * @tc.desc Verify lastIndexOf last key equals 2 for array [0, 1, 7, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 7, 3]);
      expect(arr.lastIndexOf(7)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_0400
     * @tc.name testUint8ClampedArrayLastIndexOfTwo004
     * @tc.desc Verify lastIndexOf last key equals 3 for array [5, 5, 5, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5, 5, 5]);
      expect(arr.lastIndexOf(5)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_0500
     * @tc.name testUint8ClampedArrayLastIndexOfTwo005
     * @tc.desc Verify lastIndexOf last key equals 3 for array [8, 1, 2, 8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([8, 1, 2, 8]);
      expect(arr.lastIndexOf(8)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_0600
     * @tc.name testUint8ClampedArrayLastIndexOfTwo006
     * @tc.desc Verify lastIndexOf returns -1 for not-found element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.lastIndexOf(250);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_0700
     * @tc.name testUint8ClampedArrayLastIndexOfTwo007
     * @tc.desc Verify lastIndexOf yields length lenBefore for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const lenBefore = arr.length;
      arr.lastIndexOf(2);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_0800
     * @tc.name testUint8ClampedArrayLastIndexOfTwo008
     * @tc.desc Verify lastIndexOf yields byteLength beforeBL for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const beforeBL = arr.byteLength;
      arr.lastIndexOf(3);
      expect(arr.byteLength).assertEqual(beforeBL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_0900
     * @tc.name testUint8ClampedArrayLastIndexOfTwo009
     * @tc.desc Verify lastIndexOf fromIndex length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.lastIndexOf(3, 2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_1000
     * @tc.name testUint8ClampedArrayLastIndexOfTwo010
     * @tc.desc Verify lastIndexOf r equals 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.lastIndexOf(3, 2);
      expect(r).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_1100
     * @tc.name testUint8ClampedArrayLastIndexOfTwo011
     * @tc.desc Verify lastIndexOf r equals 0 for array [9, 8, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 8, 7]);
      const r = arr.lastIndexOf(9, -2);
      expect(r).assertEqual(0);
      expect(arr[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_1200
     * @tc.name testUint8ClampedArrayLastIndexOfTwo012
     * @tc.desc Verify lastIndexOf yields length 5 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.lastIndexOf(3);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_1300
     * @tc.name testUint8ClampedArrayLastIndexOfTwo013
     * @tc.desc Verify lastIndexOf byteLength length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.lastIndexOf(2);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_1400
     * @tc.name testUint8ClampedArrayLastIndexOfTwo014
     * @tc.desc Verify lastIndexOf yields byteOffset 0 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.lastIndexOf(2);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_1500
     * @tc.name testUint8ClampedArrayLastIndexOfTwo015
     * @tc.desc Verify lastIndexOf buffer reference matches for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Uint8ClampedArray(buf);
      const b = new Uint8ClampedArray(buf);
      a.lastIndexOf(0);
      expect(a.buffer).assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_1600
     * @tc.name testUint8ClampedArrayLastIndexOfTwo016
     * @tc.desc Verify lastIndexOf buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf);
      arr.lastIndexOf(0);
      expect(arr.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_1700
     * @tc.name testUint8ClampedArrayLastIndexOfTwo017
     * @tc.desc Verify subarray buffer reference matches for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(1, 3);
      sub.lastIndexOf(2);
      expect(sub.buffer).assertEqual(arr.buffer);
      expect(sub.lastIndexOf(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_1800
     * @tc.name testUint8ClampedArrayLastIndexOfTwo018
     * @tc.desc Verify subarray last key equals 2 for array [5, 6, 7, 6, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7, 6, 5]);
      const sub = arr.subarray(1, 4);
      expect(sub.lastIndexOf(6)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_1900
     * @tc.name testUint8ClampedArrayLastIndexOfTwo019
     * @tc.desc Verify subarray last key equals -1 for array [5, 6, 7, 8, 9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7, 8, 9]);
      const sub = arr.subarray(0, 3);
      expect(sub.lastIndexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_2000
     * @tc.name testUint8ClampedArrayLastIndexOfTwo020
     * @tc.desc Verify lastIndexOf(5) equals indexOf(5) for single-match array [0, 5, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 5, 0, 0]);
      expect(arr.lastIndexOf(5)).assertEqual(arr.indexOf(5));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_2100
     * @tc.name testUint8ClampedArrayLastIndexOfTwo021
     * @tc.desc Verify lastIndexOf(3) returns 4 and indexOf(3) returns 0 for array [3, 1, 3, 1, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 3, 1, 3]);
      expect(arr.lastIndexOf(3)).assertEqual(4);
      expect(arr.indexOf(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_2200
     * @tc.name testUint8ClampedArrayLastIndexOfTwo022
     * @tc.desc Verify lastIndexOf(99) equals indexOf(99) for absent value array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      expect(arr.lastIndexOf(99)).assertEqual(arr.indexOf(99));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_2300
     * @tc.name testUint8ClampedArrayLastIndexOfTwo023
     * @tc.desc Verify lastIndexOf(42) equals indexOf(42) for singleton array [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      expect(arr.lastIndexOf(42)).assertEqual(arr.indexOf(42));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_2400
     * @tc.name testUint8ClampedArrayLastIndexOfTwo024
     * @tc.desc Verify lastIndexOf Math.floor(r) equals r for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.lastIndexOf(2);
      expect(Math.floor(r)).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_2500
     * @tc.name testUint8ClampedArrayLastIndexOfTwo025
     * @tc.desc Verify lastIndexOf -1 Math.floor -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.lastIndexOf(99);
      expect(Math.floor(r)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_2600
     * @tc.name testUint8ClampedArrayLastIndexOfTwo026
     * @tc.desc Verify lastIndexOf returns index 1 for element 2 in array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.lastIndexOf(2);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_2700
     * @tc.name testUint8ClampedArrayLastIndexOfTwo027
     * @tc.desc Verify subarray r equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(0, 2);
      const r = sub.lastIndexOf(2);
      expect(r).assertEqual(1);
      expect(parent[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_2800
     * @tc.name testUint8ClampedArrayLastIndexOfTwo028
     * @tc.desc Verify subarray r equals 0 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(0, 2);
      const r = sub.lastIndexOf(1);
      expect(r).assertEqual(0);
      expect(parent.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_2900
     * @tc.name testUint8ClampedArrayLastIndexOfTwo029
     * @tc.desc Verify lastIndexOf r equals 0 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Uint8ClampedArray(buf, 0, 4);
      const b = new Uint8ClampedArray(buf, 4, 4);
      a[0] = 9;
      b[0] = 99;
      const r = a.lastIndexOf(9);
      expect(r).assertEqual(0);
      expect(b[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_3000
     * @tc.name testUint8ClampedArrayLastIndexOfTwo030
     * @tc.desc Verify lastIndexOf r equals 3 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Uint8ClampedArray(buf, 0, 4);
      const b = new Uint8ClampedArray(buf, 4, 4);
      const r = a.lastIndexOf(0);
      expect(r).assertEqual(3);
      expect(b.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_3100
     * @tc.name testUint8ClampedArrayLastIndexOfTwo031
     * @tc.desc Verify lastIndexOf last key equals -1 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const v: byte = 99;
      expect(arr.lastIndexOf(v)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_3200
     * @tc.name testUint8ClampedArrayLastIndexOfTwo032
     * @tc.desc Verify lastIndexOf r equals 2 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const v: byte = 30;
      const r = arr.lastIndexOf(v);
      expect(r).assertEqual(2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_3300
     * @tc.name testUint8ClampedArrayLastIndexOfTwo033
     * @tc.desc Verify lastIndexOf r equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const bufBefore = arr.buffer;
      const v: byte = 2;
      const r = arr.lastIndexOf(v);
      expect(r).assertEqual(1);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_3400
     * @tc.name testUint8ClampedArrayLastIndexOfTwo034
     * @tc.desc Verify lastIndexOf r1 equals r2 for array [5, 5, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5, 5]);
      const v: byte = 5;
      const r1 = arr.lastIndexOf(v);
      const r2 = arr.lastIndexOf(v);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_3500
     * @tc.name testUint8ClampedArrayLastIndexOfTwo035
     * @tc.desc Verify lastIndexOf last key equals 1023 for length-1024 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      arr[1023] = 7;
      expect(arr.lastIndexOf(7)).assertEqual(1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_3600
     * @tc.name testUint8ClampedArrayLastIndexOfTwo036
     * @tc.desc Verify lastIndexOf last key equals -1 for length-1024 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      expect(arr.lastIndexOf(200)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_3700
     * @tc.name testUint8ClampedArrayLastIndexOfTwo037
     * @tc.desc Verify lastIndexOf last key equals 255 for length-256 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      arr[255] = 88;
      expect(arr.lastIndexOf(88)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_3800
     * @tc.name testUint8ClampedArrayLastIndexOfTwo038
     * @tc.desc Verify lastIndexOf last key equals 4 for length-5 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      expect(arr.lastIndexOf(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_TWO_3900
     * @tc.name testUint8ClampedArrayLastIndexOfTwo039
     * @tc.desc Verify lastIndexOf last key equals 0 for array [255, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 0]);
      expect(arr.lastIndexOf(255)).assertEqual(0);
    });
  });
}
