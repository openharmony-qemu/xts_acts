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

export default function uint8ClampedArrayCopyWithin02Test(): void {
  describe('uint8ClampedArrayCopyWithin02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_0100
     * @tc.name testUint8ClampedArrayCopyWithinTwo001
     * @tc.desc Verify copyWithin(0,3) returns the receiver and copies the trailing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.copyWithin(0, 3);
      expect(r).assertEqual(arr);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_0200
     * @tc.name testUint8ClampedArrayCopyWithinTwo002
     * @tc.desc Verify copyWithin(0,1) result arr[0] equals 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.copyWithin(0, 1);
      expect(r[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_0300
     * @tc.name testUint8ClampedArrayCopyWithinTwo003
     * @tc.desc Verify copyWithin(0,2,5) returns the receiver and respects the end bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6]);
      const r = arr.copyWithin(0, 2, 5);
      expect(r).assertEqual(arr);
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(5);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_0400
     * @tc.name testUint8ClampedArrayCopyWithinTwo004
     * @tc.desc Verify copyWithin on an empty array returns the unchanged receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.copyWithin(0, 0);
      expect(r).assertEqual(arr);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_0500
     * @tc.name testUint8ClampedArrayCopyWithinTwo005
     * @tc.desc Verify copyWithin(0,0) returns the receiver without changing its only value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      const r = arr.copyWithin(0, 0);
      expect(r).assertEqual(arr);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_0600
     * @tc.name testUint8ClampedArrayCopyWithinTwo006
     * @tc.desc Verify an inverted copyWithin source range leaves the receiver unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.copyWithin(0, 3, 1);
      expect(r).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_0700
     * @tc.name testUint8ClampedArrayCopyWithinTwo007
     * @tc.desc Verify a negative copyWithin target writes at the resolved receiver offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.copyWithin(-2, 0);
      expect(r).assertEqual(arr);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_0800
     * @tc.name testUint8ClampedArrayCopyWithinTwo008
     * @tc.desc Verify copyWithin(0,-2) result arr[0] equals 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7, 8]);
      const r = arr.copyWithin(0, -2);
      expect(r[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_0900
     * @tc.name testUint8ClampedArrayCopyWithinTwo009
     * @tc.desc Verify a negative copyWithin end excludes the final source element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 10, 11, 12]);
      const r = arr.copyWithin(0, 1, -1);
      expect(r).assertEqual(arr);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(11);
      expect(arr[2]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_1000
     * @tc.name testUint8ClampedArrayCopyWithinTwo010
     * @tc.desc Verify copyWithin returns receiver and modifies array correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.copyWithin(0, 1);
      expect(r).assertEqual(arr);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_1100
     * @tc.name testUint8ClampedArrayCopyWithinTwo011
     * @tc.desc Verify copyWithin element at arr[2] equals 100 for array [1e2, 0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e2, 0, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_1200
     * @tc.name testUint8ClampedArrayCopyWithinTwo012
     * @tc.desc Verify copyWithin r equals arr for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.copyWithin(0, 2);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_1300
     * @tc.name testUint8ClampedArrayCopyWithinTwo013
     * @tc.desc Verify copyWithin r.length === arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const r = arr.copyWithin(0, 2);
      expect(r.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_1400
     * @tc.name testUint8ClampedArrayCopyWithinTwo014
     * @tc.desc Verify copyWithin r.buffer === arr.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.copyWithin(0, 2);
      expect(r.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_1500
     * @tc.name testUint8ClampedArrayCopyWithinTwo015
     * @tc.desc Verify copyWithin r equals arr for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.copyWithin(0, 2).copyWithin(1, 0);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_1600
     * @tc.name testUint8ClampedArrayCopyWithinTwo016
     * @tc.desc Verify copyWithin yields byteLength 5 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2);
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_1700
     * @tc.name testUint8ClampedArrayCopyWithinTwo017
     * @tc.desc Verify copyWithin yields byteOffset 0 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.copyWithin(0, 2);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_1800
     * @tc.name testUint8ClampedArrayCopyWithinTwo018
     * @tc.desc Verify copyWithin byteOffset ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      arr.copyWithin(0, 1);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_1900
     * @tc.name testUint8ClampedArrayCopyWithinTwo019
     * @tc.desc Verify copyWithin arr.buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(5);
      const arr = new Uint8ClampedArray(buf);
      arr.copyWithin(0, 2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_2000
     * @tc.name testUint8ClampedArrayCopyWithinTwo020
     * @tc.desc Verify copyWithin element at b[0] equals 30 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf);
      const b = new Uint8ClampedArray(buf);
      a[0] = 10; a[1] = 20; a[2] = 30; a[3] = 40;
      a.copyWithin(0, 2);
      expect(b[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_2100
     * @tc.name testUint8ClampedArrayCopyWithinTwo021
     * @tc.desc Verify r arr element consistency after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.copyWithin(0, 2);
      expect(r[0]).assertEqual(arr[0]);
      expect(r[1]).assertEqual(arr[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_2200
     * @tc.name testUint8ClampedArrayCopyWithinTwo022
     * @tc.desc Verify a no-op copyWithin leaves the first element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      const r = arr.copyWithin(0, 1, 1);
      expect(r[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_2300
     * @tc.name testUint8ClampedArrayCopyWithinTwo023
     * @tc.desc Verify copyWithin element at r[1] equals 8 for array [7, 8, 9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      const r = arr.copyWithin(0, 1, 1);
      expect(r[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_2400
     * @tc.name testUint8ClampedArrayCopyWithinTwo024
     * @tc.desc Verify copyWithin element at r[2] equals 9 for array [7, 8, 9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      const r = arr.copyWithin(0, 1, 1);
      expect(r[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_2500
     * @tc.name testUint8ClampedArrayCopyWithinTwo025
     * @tc.desc Verify copyWithin shared buffer visibility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(5);
      const a = new Uint8ClampedArray(buf);
      const b = new Uint8ClampedArray(buf);
      a[0] = 1; a[1] = 2; a[2] = 3; a[3] = 4; a[4] = 5;
      a.copyWithin(0, 3);
      expect(b[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_2600
     * @tc.name testUint8ClampedArrayCopyWithinTwo026
     * @tc.desc Verify copyWithin element at b[1] equals 5 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(5);
      const a = new Uint8ClampedArray(buf);
      const b = new Uint8ClampedArray(buf);
      a[0] = 1; a[1] = 2; a[2] = 3; a[3] = 4; a[4] = 5;
      a.copyWithin(0, 3);
      expect(b[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_2700
     * @tc.name testUint8ClampedArrayCopyWithinTwo027
     * @tc.desc Verify copyWithin element at b[2] equals 3 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(5);
      const a = new Uint8ClampedArray(buf);
      const b = new Uint8ClampedArray(buf);
      a[0] = 1; a[1] = 2; a[2] = 3; a[3] = 4; a[4] = 5;
      a.copyWithin(0, 3);
      expect(b[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_2800
     * @tc.name testUint8ClampedArrayCopyWithinTwo028
     * @tc.desc Verify copyWithin yields length 4 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf);
      const b = new Uint8ClampedArray(buf);
      a.copyWithin(0, 2);
      expect(b.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_2900
     * @tc.name testUint8ClampedArrayCopyWithinTwo029
     * @tc.desc Verify copyWithin element at arr[0] equals 200 for array [0, 0, 200, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 200, 0]);
      arr.copyWithin(0, 2, 3);
      expect(arr[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_3000
     * @tc.name testUint8ClampedArrayCopyWithinTwo030
     * @tc.desc Verify copyWithin element at arr[0] equals 64 for array [0, 0, 64, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 64, 0]);
      arr.copyWithin(0, 2, 3);
      expect(arr[0]).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_3100
     * @tc.name testUint8ClampedArrayCopyWithinTwo031
     * @tc.desc Verify copyWithin yields length 256 for length-256 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      for (let i = 0; i < 256; i++) { arr[i] = i; }
      const r = arr.copyWithin(0, 128);
      expect(r.length).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_3200
     * @tc.name testUint8ClampedArrayCopyWithinTwo032
     * @tc.desc Verify copyWithin element at r[0] equals 128 for length-256 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      for (let i = 0; i < 256; i++) { arr[i] = i; }
      const r = arr.copyWithin(0, 128);
      expect(r[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_3300
     * @tc.name testUint8ClampedArrayCopyWithinTwo033
     * @tc.desc Verify copyWithin element at r[127] equals 255 for length-256 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      for (let i = 0; i < 256; i++) { arr[i] = i; }
      const r = arr.copyWithin(0, 128);
      expect(r[127]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_3400
     * @tc.name testUint8ClampedArrayCopyWithinTwo034
     * @tc.desc Verify copyWithin element at r[128] equals 128 for length-256 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      for (let i = 0; i < 256; i++) { arr[i] = i; }
      const r = arr.copyWithin(0, 128);
      expect(r[128]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_3500
     * @tc.name testUint8ClampedArrayCopyWithinTwo035
     * @tc.desc Verify copyWithin r equals arr for length-256 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      const r = arr.copyWithin(0, 128);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_3600
     * @tc.name testUint8ClampedArrayCopyWithinTwo036
     * @tc.desc Verify copyWithin yields length 1024 for length-1024 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      const r = arr.copyWithin(0, 512);
      expect(r.length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_3700
     * @tc.name testUint8ClampedArrayCopyWithinTwo037
     * @tc.desc Verify copyWithin yields byteLength 1024 for length-1024 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      const r = arr.copyWithin(0, 512);
      expect(r.byteLength).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_3800
     * @tc.name testUint8ClampedArrayCopyWithinTwo038
     * @tc.desc Verify copyWithin element at arr[2] equals 128 for array [0x80, 0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0x80, 0, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_3900
     * @tc.name testUint8ClampedArrayCopyWithinTwo039
     * @tc.desc Verify copyWithin element at arr[2] equals 255 for array [0xFF, 0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF, 0, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_4000
     * @tc.name testUint8ClampedArrayCopyWithinTwo040
     * @tc.desc Verify copyWithin element at arr[2] equals 255 for array [0b11111111, 0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b11111111, 0, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_TWO_4100
     * @tc.name testUint8ClampedArrayCopyWithinTwo041
     * @tc.desc Verify copyWithin element at arr[2] equals 255 for array [0o377, 0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o377, 0, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(255);
    });
  });
}
