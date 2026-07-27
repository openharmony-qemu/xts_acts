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

export default function uint8ClampedArrayIndexOf02Test(): void {
  describe('uint8ClampedArrayIndexOf02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_0100
     * @tc.name testUint8ClampedArrayIndexOfTwo001
     * @tc.desc Verify indexOf r equals 1 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.indexOf(20);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_0200
     * @tc.name testUint8ClampedArrayIndexOfTwo002
     * @tc.desc Verify indexOf arr.indexOf(42) equals 0 for array [42, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42, 1, 2]);
      expect(arr.indexOf(42)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_0300
     * @tc.name testUint8ClampedArrayIndexOfTwo003
     * @tc.desc Verify indexOf arr.indexOf(0) equals 1 for array [1, 0, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 0, 2]);
      expect(arr.indexOf(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_0400
     * @tc.name testUint8ClampedArrayIndexOfTwo004
     * @tc.desc Verify indexOf arr.indexOf(255) equals 2 for array [0, 100, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 100, 255]);
      expect(arr.indexOf(255)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_0500
     * @tc.name testUint8ClampedArrayIndexOfTwo005
     * @tc.desc Verify indexOf arr.indexOf(Number.NaN) equals -1 for array [0, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      expect(arr.indexOf(Number.NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_0600
     * @tc.name testUint8ClampedArrayIndexOfTwo006
     * @tc.desc Verify indexOf arr.indexOf(-1) equals -1 for array [100, 200, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200, 50]);
      expect(arr.indexOf(-1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_0700
     * @tc.name testUint8ClampedArrayIndexOfTwo007
     * @tc.desc Verify indexOf yields length 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      expect(arr.indexOf(2)).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_0800
     * @tc.name testUint8ClampedArrayIndexOfTwo008
     * @tc.desc Verify indexOf yields byteLength 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      expect(arr.indexOf(2)).assertEqual(1);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_0900
     * @tc.name testUint8ClampedArrayIndexOfTwo009
     * @tc.desc Verify indexOf element at arr[0] equals 11 for array [11, 22, 33]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([11, 22, 33]);
      expect(arr.indexOf(22)).assertEqual(1);
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_1000
     * @tc.name testUint8ClampedArrayIndexOfTwo010
     * @tc.desc Verify indexOf buffer reference matches for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4;
      expect(arr.indexOf(3)).assertEqual(2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_1100
     * @tc.name testUint8ClampedArrayIndexOfTwo011
     * @tc.desc Verify indexOf r equals -1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.indexOf(99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_1200
     * @tc.name testUint8ClampedArrayIndexOfTwo012
     * @tc.desc Verify indexOf(3) returns 2 in [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.indexOf(3);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_1300
     * @tc.name testUint8ClampedArrayIndexOfTwo013
     * @tc.desc Verify indexOf element at arr[r] equals 8 for array [7, 8, 9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      const r = arr.indexOf(8);
      expect(arr[r]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_1400
     * @tc.name testUint8ClampedArrayIndexOfTwo014
     * @tc.desc Verify indexOf r1 equals r2 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r1 = arr.indexOf(20);
      const r2 = arr.indexOf(20);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_1500
     * @tc.name testUint8ClampedArrayIndexOfTwo015
     * @tc.desc Verify indexOf r1 equals r2 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r1 = arr.indexOf(99);
      const r2 = arr.indexOf(99);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_1600
     * @tc.name testUint8ClampedArrayIndexOfTwo016
     * @tc.desc Verify indexOf arr.$_get(idx) equals 150 for array [100, 150, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 150, 200]);
      const idx = arr.indexOf(150);
      expect(arr.$_get(idx)).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_1700
     * @tc.name testUint8ClampedArrayIndexOfTwo017
     * @tc.desc Verify indexOf arr.indexOf(0) equals 1 for array [5, 0, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 0, 5]);
      expect(arr.indexOf(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_1800
     * @tc.name testUint8ClampedArrayIndexOfTwo018
     * @tc.desc Verify indexOf element at arr[r] equals 70 for array [50, 60, 70, 80]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 60, 70, 80]);
      const r = arr.indexOf(70);
      expect(arr[r]).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_1900
     * @tc.name testUint8ClampedArrayIndexOfTwo019
     * @tc.desc Verify indexOf element at arr[r] equals 9 for array [9, 9, 9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 9, 9]);
      const r = arr.indexOf(9);
      expect(arr[r]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_2000
     * @tc.name testUint8ClampedArrayIndexOfTwo020
     * @tc.desc Verify indexOf arr.at(r) equals 30 for array [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const r = arr.indexOf(30);
      expect(arr.at(r)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_2100
     * @tc.name testUint8ClampedArrayIndexOfTwo021
     * @tc.desc Verify indexOf r equals 50 for length-100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(100);
      arr[50] = 77;
      const r = arr.indexOf(77);
      expect(r).assertEqual(50);
      expect(r < arr.length).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_2200
     * @tc.name testUint8ClampedArrayIndexOfTwo022
     * @tc.desc Verify indexOf arr.indexOf(10, -100) equals 0 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      expect(arr.indexOf(10, -100)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_2300
     * @tc.name testUint8ClampedArrayIndexOfTwo023
     * @tc.desc Verify indexOf arr.indexOf(0x20) equals 1 for array [0x10, 0x20, 0x30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0x10, 0x20, 0x30]);
      expect(arr.indexOf(0x20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_2400
     * @tc.name testUint8ClampedArrayIndexOfTwo024
     * @tc.desc Verify indexOf r equals 1 for array [5, 6, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const r: int = arr.indexOf(6, 0 - 2);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_2500
     * @tc.name testUint8ClampedArrayIndexOfTwo025
     * @tc.desc Verify fromIndex=0 clamp (256 255) 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 256, 100]);
      const r: int = arr.indexOf(255, 0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_2600
     * @tc.name testUint8ClampedArrayIndexOfTwo026
     * @tc.desc Verify fromIndex=2 clamp (256 255) 255 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 256, 100]);
      const r: int = arr.indexOf(255, 2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_2700
     * @tc.name testUint8ClampedArrayIndexOfTwo027
     * @tc.desc Verify indexOf r equals 1 for array [5, -1, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, -1, 6]);
      const r: int = arr.indexOf(0, 0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_2800
     * @tc.name testUint8ClampedArrayIndexOfTwo028
     * @tc.desc Verify indexOf r equals -1 for array [5, -1, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, -1, 6]);
      const r: int = arr.indexOf(0, 2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_2900
     * @tc.name testUint8ClampedArrayIndexOfTwo029
     * @tc.desc Verify indexOf r equals 1 for array [5, Number.NaN, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, Number.NaN, 6]);
      const r: int = arr.indexOf(0, 0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_3000
     * @tc.name testUint8ClampedArrayIndexOfTwo030
     * @tc.desc Verify fromIndex=0 clamp (Infinity 255) 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, Number.POSITIVE_INFINITY, 100]);
      const r: int = arr.indexOf(255, 0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_3100
     * @tc.name testUint8ClampedArrayIndexOfTwo031
     * @tc.desc Verify fromIndex=0 0.5 0 (half-even) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 0.5, 6]);
      const r: int = arr.indexOf(0, 0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_3200
     * @tc.name testUint8ClampedArrayIndexOfTwo032
     * @tc.desc Verify fromIndex=0 127.5 128 (half-even) 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 127.5, 6]);
      const r: int = arr.indexOf(128, 0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_3300
     * @tc.name testUint8ClampedArrayIndexOfTwo033
     * @tc.desc Verify fromIndex=0 128.5 128 (half-even) 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 128.5, 6]);
      const r: int = arr.indexOf(128, 0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_3400
     * @tc.name testUint8ClampedArrayIndexOfTwo034
     * @tc.desc Verify indexOf r equals 1 for array [5, 0.9, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 0.9, 6]);
      const r: int = arr.indexOf(1, 0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_TWO_3500
     * @tc.name testUint8ClampedArrayIndexOfTwo035
     * @tc.desc Verify indexOf r equals 1 for array [5, 0.4, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 0.4, 6]);
      const r: int = arr.indexOf(0, 0);
      expect(r).assertEqual(1);
    });
  });
}
