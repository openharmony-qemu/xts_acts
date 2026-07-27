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

export default function uint8ClampedArrayFindLastIndex02Test(): void {
  describe('uint8ClampedArrayFindLastIndex02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_0100
     * @tc.name testUint8ClampedArrayFindLastIndexTwo001
     * @tc.desc Verify findLastIndex idx1 equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8ClampedArray([1, 2, 3]);
      const arr2 = new Uint8ClampedArray([10, 20, 30]);
      const idx1 = arr1.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 2);
      const idx2 = arr2.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 30);
      expect(idx1).assertEqual(1);
      expect(idx2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_0200
     * @tc.name testUint8ClampedArrayFindLastIndexTwo002
     * @tc.desc Verify findLastIndex returns index 2 when value 3 follows value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => {
        if (i > 0) {
          return a[i - 1] === 2 && v === 3;
        }
        return false;
      });
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_0300
     * @tc.name testUint8ClampedArrayFindLastIndexTwo003
     * @tc.desc Verify predicate v >= 100 && v <= 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 150, 75, 175, 25]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v >= 100 && v <= 200);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_0400
     * @tc.name testUint8ClampedArrayFindLastIndexTwo004
     * @tc.desc Verify findLastIndex idx equals 3 for array [10, 100, 250, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 100, 250, 20]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v < 50 || v > 200);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_0500
     * @tc.name testUint8ClampedArrayFindLastIndexTwo005
     * @tc.desc Verify findLastIndex idx equals 4 for array [10, 20, 30, 40, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => i % 2 === 0);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_0600
     * @tc.name testUint8ClampedArrayFindLastIndexTwo006
     * @tc.desc Verify findLastIndex idx equals 3 for array [10, 20, 30, 40, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => i % 2 === 1);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_0700
     * @tc.name testUint8ClampedArrayFindLastIndexTwo007
     * @tc.desc Verify findLastIndex idx equals 4 for array [0, 1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2, 3, 4]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === a.length - 1);
      expect(idx).assertEqual(4);
    });

    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_0800
     * @tc.name testUint8ClampedArrayFindLastIndexTwo008
     * @tc.desc Verify findLastIndex idx equals -1 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = 10;
      arr[1] = 256;
      arr[2] = 20;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 256);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_0900
     * @tc.name testUint8ClampedArrayFindLastIndexTwo009
     * @tc.desc Verify findLastIndex idx equals -1 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = 10;
      arr[1] = -1;
      arr[2] = 20;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === -1);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_1000
     * @tc.name testUint8ClampedArrayFindLastIndexTwo010
     * @tc.desc Verify findLastIndex idx equals -1 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = 10;
      arr[1] = Number.NaN;
      arr[2] = 20;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => isNaN(v));
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_1100
     * @tc.name testUint8ClampedArrayFindLastIndexTwo011
     * @tc.desc Verify findLastIndex idx equals -1 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = 10;
      arr[1] = Number.POSITIVE_INFINITY;
      arr[2] = 20;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === Number.POSITIVE_INFINITY);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_1200
     * @tc.name testUint8ClampedArrayFindLastIndexTwo012
     * @tc.desc Verify findLastIndex idx equals 4 for length-5 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      arr[0] = -1;
      arr[1] = Number.NaN;
      arr[2] = -Number.POSITIVE_INFINITY;
      arr[3] = 50;
      arr[4] = -100;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 0);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_1300
     * @tc.name testUint8ClampedArrayFindLastIndexTwo013
     * @tc.desc Verify findLastIndex idx equals 3 for length-5 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      arr[0] = 256;
      arr[1] = 1000;
      arr[2] = 50;
      arr[3] = Number.POSITIVE_INFINITY;
      arr[4] = 100;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 255);
      expect(idx).assertEqual(3);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_1400
     * @tc.name testUint8ClampedArrayFindLastIndexTwo014
     * @tc.desc Verify subarray idx equals 1 for array [10, 20, 30, 40, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = parent.subarray(1, 4);
      const idx = sub.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 30);
      expect(idx).assertEqual(1);
      expect(parent[0]).assertEqual(10);
      expect(parent[1]).assertEqual(20);
      expect(parent[2]).assertEqual(30);
      expect(parent[3]).assertEqual(40);
      expect(parent[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_1500
     * @tc.name testUint8ClampedArrayFindLastIndexTwo015
     * @tc.desc Verify subarray predicate a length subarray.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = parent.subarray(1, 4);
      let seenLen: int = -1;
      sub.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => {
        seenLen = a.length;
        return false;
      });
      expect(seenLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_1600
     * @tc.name testUint8ClampedArrayFindLastIndexTwo016
     * @tc.desc Verify slice idx equals 1 for array [10, 20, 30, 40, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const slice = parent.slice(1, 4);
      parent[2] = 99;
      const idx = slice.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 30);
      expect(idx).assertEqual(1);
      expect(slice[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_1700
     * @tc.name testUint8ClampedArrayFindLastIndexTwo017
     * @tc.desc Verify findLastIndex idx equals 4 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(5);
      const a1 = new Uint8ClampedArray(buf);
      const a2 = new Uint8ClampedArray(buf);
      a1[0] = 10;
      a1[2] = 20;
      a1[4] = 10;
      const idx = a2.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 10);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_1800
     * @tc.name testUint8ClampedArrayFindLastIndexTwo018
     * @tc.desc Verify subarray idx equals 3 for length-5 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray(5);
      parent[0] = 100;
      parent[3] = 256;
      const sub = parent.subarray(0, 5);
      const idx = sub.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 255);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_1900
     * @tc.name testUint8ClampedArrayFindLastIndexTwo019
     * @tc.desc Verify findIndex predicate findLastIndex >= findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 5, 3, 5, 7]);
      const first = arr.findIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 5);
      const last = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 5);
      expect(last >= first).assertTrue();
      expect(first).assertEqual(1);
      expect(last).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_2000
     * @tc.name testUint8ClampedArrayFindLastIndexTwo020
     * @tc.desc Verify lastIndexOf li equals fli for array [1, 7, 3, 7, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 7, 3, 7, 5]);
      const li = arr.lastIndexOf(7);
      const fli = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 7);
      expect(li).assertEqual(fli);
    });

    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_2100
     * @tc.name testUint8ClampedArrayFindLastIndexTwo021
     * @tc.desc Verify findLastIndex idx equals -1 for length-10 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v !== 0);
      expect(idx).assertEqual(-1);
    });

    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_2200
     * @tc.name testUint8ClampedArrayFindLastIndexTwo022
     * @tc.desc Verify findLastIndex idx equals 9 for length-10 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      arr[9] = 1;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v !== 0);
      expect(idx).assertEqual(9);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_2300
     * @tc.name testUint8ClampedArrayFindLastIndexTwo023
     * @tc.desc Verify findLastIndex idx equals 2 for array [99, 50, 99, 60]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: number = 99;
      const arr = new Uint8ClampedArray([99, 50, 99, 60]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === target);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_2400
     * @tc.name testUint8ClampedArrayFindLastIndexTwo024
     * @tc.desc Verify subarray idx equals 1 for array [1, 2, 3, 4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6]);
      const idx = arr.subarray(2, 5).findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 4);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_TWO_2500
     * @tc.name testUint8ClampedArrayFindLastIndexTwo025
     * @tc.desc Verify slice idx equals 1 for array [10, 20, 30, 40, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const idx = arr.slice(1, 4).findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 30);
      expect(idx).assertEqual(1);
    });
  });
}
