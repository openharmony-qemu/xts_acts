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

export default function uint8ClampedArrayFill03Test(): void {
  describe('uint8ClampedArrayFill03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_0100
     * @tc.name testUint8ClampedArrayFillThree001
     * @tc.desc Verify fill element at arr[0] equals 10 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 10;
      arr.fill(v);
      expect(arr[0]).assertEqual(10);
      expect(arr[3]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_0200
     * @tc.name testUint8ClampedArrayFillThree002
     * @tc.desc Verify fill element at arr[0] equals 50 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(50);
      expect(arr[0]).assertEqual(50);
      expect(arr[3]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_0300
     * @tc.name testUint8ClampedArrayFillThree003
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 7;
      arr.fill(v, 1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(7);
      expect(arr[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_0400
     * @tc.name testUint8ClampedArrayFillThree004
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(77, 1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(77);
      expect(arr[3]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_0500
     * @tc.name testUint8ClampedArrayFillThree005
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 9;
      arr.fill(v, 1, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(9);
      expect(arr[2]).assertEqual(9);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_0600
     * @tc.name testUint8ClampedArrayFillThree006
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(88, 1, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(88);
      expect(arr[2]).assertEqual(88);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_0700
     * @tc.name testUint8ClampedArrayFillThree007
     * @tc.desc Verify fill element at arr[0] equals 100 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      const v: byte = 100;
      arr.fill(v);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_0800
     * @tc.name testUint8ClampedArrayFillThree008
     * @tc.desc Verify fill element at a[0] equals b[0] for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(3);
      const b = new Uint8ClampedArray(3);
      const v: byte = 42;
      a.fill(v);
      b.fill(42);
      expect(a[0]).assertEqual(b[0]);
      expect(a[1]).assertEqual(b[1]);
      expect(a[2]).assertEqual(b[2]);
      expect(a[0]).assertEqual(42);
      expect(a[1]).assertEqual(42);
      expect(a[2]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_0900
     * @tc.name testUint8ClampedArrayFillThree009
     * @tc.desc Verify fill element at a[0] equals b[0] for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const b = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 0;
      a.fill(v);
      b.fill(0);
      expect(a[0]).assertEqual(b[0]);
      expect(a[1]).assertEqual(b[1]);
      expect(a[2]).assertEqual(b[2]);
      expect(a[0]).assertEqual(0);
      expect(a[1]).assertEqual(0);
      expect(a[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_1000
     * @tc.name testUint8ClampedArrayFillThree010
     * @tc.desc Verify fill element at a[0] equals b[0] for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(2);
      const b = new Uint8ClampedArray(2);
      const v: byte = 127;
      a.fill(v);
      b.fill(127);
      expect(a[0]).assertEqual(b[0]);
      expect(a[1]).assertEqual(b[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_1100
     * @tc.name testUint8ClampedArrayFillThree011
     * @tc.desc Verify number byte fill round (5.7->6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(2);
      const b = new Uint8ClampedArray(2);
      const v: byte = 5;
      a.fill(v);
      b.fill(5.7);
      expect(a[0]).assertEqual(5);
      expect(b[0]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_1200
     * @tc.name testUint8ClampedArrayFillThree012
     * @tc.desc Verify fill element at a[1] equals b[1] for array [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([10, 20, 30, 40]);
      const b = new Uint8ClampedArray([10, 20, 30, 40]);
      const v: byte = 1;
      a.fill(v, 2);
      b.fill(1, 2);
      expect(a[1]).assertEqual(b[1]);
      expect(a[2]).assertEqual(b[2]);
      expect(a[3]).assertEqual(b[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_1300
     * @tc.name testUint8ClampedArrayFillThree013
     * @tc.desc Verify fill element at a[0] equals b[0] for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4]);
      const b = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 9;
      a.fill(v, 0, 4);
      b.fill(9, 0, 4);
      expect(a[0]).assertEqual(b[0]);
      expect(a[3]).assertEqual(b[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_1400
     * @tc.name testUint8ClampedArrayFillThree014
     * @tc.desc Verify fill(byte) on length-3 array fills all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 8;
      arr.fill(v);
      expect(arr[0]).assertEqual(8);
      expect(arr[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_1500
     * @tc.name testUint8ClampedArrayFillThree015
     * @tc.desc Verify fill(number) on length-3 array fills all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(80);
      expect(arr[0]).assertEqual(80);
      expect(arr[2]).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_1600
     * @tc.name testUint8ClampedArrayFillThree016
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 6;
      arr.fill(v, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(6);
      expect(arr[3]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_1700
     * @tc.name testUint8ClampedArrayFillThree017
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(66, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(66);
      expect(arr[3]).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_1800
     * @tc.name testUint8ClampedArrayFillThree018
     * @tc.desc Verify fill element at a[0] equals b[0] for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const b = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 4;
      a.fill(v);
      b.fill(4);
      expect(a[0]).assertEqual(b[0]);
      expect(a[1]).assertEqual(b[1]);
      expect(a[2]).assertEqual(b[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_1900
     * @tc.name testUint8ClampedArrayFillThree019
     * @tc.desc Verify fill yields length before for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const before = arr.length;
      arr.fill(99, 1, 3);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_2000
     * @tc.name testUint8ClampedArrayFillThree020
     * @tc.desc Verify fill yields byteLength before for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const before = arr.byteLength;
      arr.fill(50);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_2100
     * @tc.name testUint8ClampedArrayFillThree021
     * @tc.desc Verify fill buffer reference matches for array new ArrayBuffer(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(4));
      const bufBefore = arr.buffer;
      arr.fill(7);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_2200
     * @tc.name testUint8ClampedArrayFillThree022
     * @tc.desc Verify fill yields byteOffset offsetBefore for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      const offsetBefore = arr.byteOffset;
      arr.fill(11);
      expect(arr.byteOffset).assertEqual(offsetBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_2300
     * @tc.name testUint8ClampedArrayFillThree023
     * @tc.desc Verify fill yields BYTES_PER_ELEMENT 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(5);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_2400
     * @tc.name testUint8ClampedArrayFillThree024
     * @tc.desc Verify fill ref1 equals ref2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const ref1 = arr.fill(1);
      const ref2 = ref1.fill(2);
      expect(ref1).assertEqual(ref2);
      expect(ref2).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_2500
     * @tc.name testUint8ClampedArrayFillThree025
     * @tc.desc Verify fill element at arr[0] equals 20 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(10);
      arr.fill(20);
      expect(arr[0]).assertEqual(20);
      expect(arr[3]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_2600
     * @tc.name testUint8ClampedArrayFillThree026
     * @tc.desc Verify fill element at arr[0] equals 5 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(10, 1, 3);
      arr.fill(5);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(5);
      expect(arr[3]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_2700
     * @tc.name testUint8ClampedArrayFillThree027
     * @tc.desc Verify fill ret equals arr for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 5;
      const ret = arr.fill(v);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_2800
     * @tc.name testUint8ClampedArrayFillThree028
     * @tc.desc Verify fill ret equals arr for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const ret = arr.fill(50);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_2900
     * @tc.name testUint8ClampedArrayFillThree029
     * @tc.desc Verify fill retA equals a for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const b = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 5;
      const retA = a.fill(v);
      const retB = b.fill(50);
      expect(retA).assertEqual(a);
      expect(retB).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_3000
     * @tc.name testUint8ClampedArrayFillThree030
     * @tc.desc Verify fill yields length 4 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 7;
      const ret = arr.fill(v).fill(v, 1).fill(v, 2, 3);
      expect(ret.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_3100
     * @tc.name testUint8ClampedArrayFillThree031
     * @tc.desc Verify fill yields length 4 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const ret = arr.fill(70).fill(71, 1).fill(72, 2, 3);
      expect(ret.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_3200
     * @tc.name testUint8ClampedArrayFillThree032
     * @tc.desc Verify fill byte then number returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 3;
      const ret = arr.fill(v).fill(99);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_3300
     * @tc.name testUint8ClampedArrayFillThree033
     * @tc.desc Verify fill byte then number overwrites all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 3;
      arr.fill(v).fill(99);
      expect(arr[0]).assertEqual(99);
      expect(arr[3]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_3400
     * @tc.name testUint8ClampedArrayFillThree034
     * @tc.desc Verify fill arr.toString() equals '8,8,8' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(8);
      expect(arr.toString()).assertEqual('8,8,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_3500
     * @tc.name testUint8ClampedArrayFillThree035
     * @tc.desc Verify fill a.toString() equals b.toString() for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const b = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 8;
      a.fill(v);
      b.fill(8);
      expect(a.toString()).assertEqual(b.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_3600
     * @tc.name testUint8ClampedArrayFillThree036
     * @tc.desc Verify fill arr.join('|') equals '5|5|5' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 5;
      arr.fill(v);
      expect(arr.join('|')).assertEqual('5|5|5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_3700
     * @tc.name testUint8ClampedArrayFillThree037
     * @tc.desc Verify fill a.join(',') equals b.join(',') for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const b = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 5;
      a.fill(v);
      b.fill(5);
      expect(a.join(',')).assertEqual(b.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_3800
     * @tc.name testUint8ClampedArrayFillThree038
     * @tc.desc Verify fill element at arr[0] equals arr.$_get(0) for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 11;
      arr.fill(v);
      expect(arr[0]).assertEqual(arr.$_get(0));
      expect(arr[1]).assertEqual(arr.$_get(1));
      expect(arr[2]).assertEqual(arr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_3900
     * @tc.name testUint8ClampedArrayFillThree039
     * @tc.desc Verify subarray element at sub[0] equals 9 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(1, 3);
      parent.fill(9);
      expect(sub[0]).assertEqual(9);
      expect(sub[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_4000
     * @tc.name testUint8ClampedArrayFillThree040
     * @tc.desc Verify subarray element at parent[1] equals 7 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(1, 3);
      sub.fill(7);
      expect(parent[1]).assertEqual(7);
      expect(parent[2]).assertEqual(7);
      expect(parent[0]).assertEqual(1);
      expect(parent[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_4100
     * @tc.name testUint8ClampedArrayFillThree041
     * @tc.desc Verify fill element at secondView[0] equals 5 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const firstView = new Uint8ClampedArray(buf);
      const secondView = new Uint8ClampedArray(buf);
      firstView.fill(5);
      expect(secondView[0]).assertEqual(5);
      expect(secondView[3]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_4200
     * @tc.name testUint8ClampedArrayFillThree042
     * @tc.desc Verify fill buffer reference matches for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const firstView = new Uint8ClampedArray(buf);
      const secondView = new Uint8ClampedArray(buf);
      firstView.fill(5);
      expect(firstView.buffer).assertEqual(secondView.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_4300
     * @tc.name testUint8ClampedArrayFillThree043
     * @tc.desc Verify subarray buffer reference matches for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(0, 2);
      parent.fill(8);
      expect(sub.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_4400
     * @tc.name testUint8ClampedArrayFillThree044
     * @tc.desc Verify slice element at cp[0] equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const cp = parent.slice(0, 2);
      parent.fill(9);
      expect(cp[0]).assertEqual(1);
      expect(cp[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_4500
     * @tc.name testUint8ClampedArrayFillThree045
     * @tc.desc Verify slice result shares no buffer with parent after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const cp = parent.slice();
      parent.fill(99);
      expect(cp.buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_4600
     * @tc.name testUint8ClampedArrayFillThree046
     * @tc.desc Verify fill element at full[0] equals 0 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const full = new Uint8ClampedArray(buf);
      const window = new Uint8ClampedArray(buf, 2, 2);
      window.fill(3);
      expect(full[0]).assertEqual(0);
      expect(full[1]).assertEqual(0);
      expect(full[2]).assertEqual(3);
      expect(full[3]).assertEqual(3);
      expect(full[4]).assertEqual(0);
      expect(full[5]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_4700
     * @tc.name testUint8ClampedArrayFillThree047
     * @tc.desc Verify slice yields byteOffset offBefore for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const cp = parent.slice();
      const offBefore = cp.byteOffset;
      parent.fill(1);
      expect(cp.byteOffset).assertEqual(offBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_4800
     * @tc.name testUint8ClampedArrayFillThree048
     * @tc.desc Verify fill element at a[0] equals 127 for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(2);
      const b = new Uint8ClampedArray(2);
      const v: byte = 127;
      a.fill(v);
      b.fill(256);
      expect(a[0]).assertEqual(127);
      expect(b[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_4900
     * @tc.name testUint8ClampedArrayFillThree049
     * @tc.desc Verify fill element at arr[0] equals 0 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.fill(Number.NaN);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_5000
     * @tc.name testUint8ClampedArrayFillThree050
     * @tc.desc Verify number fill(POSITIVE_INFINITY) 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr.fill(Number.POSITIVE_INFINITY);
      expect(arr[0]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_5100
     * @tc.name testUint8ClampedArrayFillThree051
     * @tc.desc Verify number fill(-POSITIVE_INFINITY) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5, 5]);
      arr.fill(-Number.POSITIVE_INFINITY);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_5200
     * @tc.name testUint8ClampedArrayFillThree052
     * @tc.desc Verify number fill(0.5) 0 (half-even)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr.fill(0.5);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_5300
     * @tc.name testUint8ClampedArrayFillThree053
     * @tc.desc Verify number fill(1.5) 2 (half-even)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr.fill(1.5);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_5400
     * @tc.name testUint8ClampedArrayFillThree054
     * @tc.desc Verify number fill(2.5) 2 (half-even)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr.fill(2.5);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_5500
     * @tc.name testUint8ClampedArrayFillThree055
     * @tc.desc Verify fill element at arr[0] equals 0 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr.fill(-1);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_5600
     * @tc.name testUint8ClampedArrayFillThree056
     * @tc.desc Verify fill element at arr[0] equals 0 for array [5, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5]);
      arr.fill(-0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_5700
     * @tc.name testUint8ClampedArrayFillThree057
     * @tc.desc Verify fill element at arr[0] equals 255 for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr.fill(1e9);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_5800
     * @tc.name testUint8ClampedArrayFillThree058
     * @tc.desc Verify fill element at arr[0] equals 0 for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr.fill(-1e9);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_5900
     * @tc.name testUint8ClampedArrayFillThree059
     * @tc.desc Verify number fill(256, 1, 3) clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      arr.fill(256, 1, 3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
      expect(arr[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_6000
     * @tc.name testUint8ClampedArrayFillThree060
     * @tc.desc Verify fill element at arr[0] equals 0 for array [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      arr.fill(-5, 0, 2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_6100
     * @tc.name testUint8ClampedArrayFillThree061
     * @tc.desc Verify fill element at arr[0] equals 10 for array [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      arr.fill(Number.NaN, 1);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_6200
     * @tc.name testUint8ClampedArrayFillThree062
     * @tc.desc Verify number fill(255.4) 255 clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr.fill(255.4);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_6300
     * @tc.name testUint8ClampedArrayFillThree063
     * @tc.desc Verify number fill(255.6) 255 clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr.fill(255.6);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_6400
     * @tc.name testUint8ClampedArrayFillThree064
     * @tc.desc Verify number fill(254.5) 254 (half-even)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr.fill(254.5);
      expect(arr[0]).assertEqual(254);
      expect(arr[1]).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_6500
     * @tc.name testUint8ClampedArrayFillThree065
     * @tc.desc Verify fill element at a[0] equals b[0] for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4]);
      const b = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 9;
      a.fill(v, -2);
      b.fill(v, 2);
      expect(a[0]).assertEqual(b[0]);
      expect(a[1]).assertEqual(b[1]);
      expect(a[2]).assertEqual(b[2]);
      expect(a[3]).assertEqual(b[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_6600
     * @tc.name testUint8ClampedArrayFillThree066
     * @tc.desc Verify fill element at a[0] equals b[0] for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4]);
      const b = new Uint8ClampedArray([1, 2, 3, 4]);
      a.fill(9, -2);
      b.fill(9, 2);
      expect(a[0]).assertEqual(b[0]);
      expect(a[3]).assertEqual(b[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_6700
     * @tc.name testUint8ClampedArrayFillThree067
     * @tc.desc Verify fill element at a[0] equals b[0] for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4]);
      const b = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 7;
      a.fill(v, 0, -1);
      b.fill(v, 0, 3);
      expect(a[0]).assertEqual(b[0]);
      expect(a[2]).assertEqual(b[2]);
      expect(a[3]).assertEqual(b[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_6800
     * @tc.name testUint8ClampedArrayFillThree068
     * @tc.desc Verify fill element at a[0] equals b[0] for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4]);
      const b = new Uint8ClampedArray([1, 2, 3, 4]);
      a.fill(7, 0, -1);
      b.fill(7, 0, 3);
      expect(a[0]).assertEqual(b[0]);
      expect(a[3]).assertEqual(b[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_6900
     * @tc.name testUint8ClampedArrayFillThree069
     * @tc.desc Verify byte and number fill with negative start end equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4]);
      const b = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 5;
      a.fill(v, -3, -1);
      b.fill(5, -3, -1);
      expect(a[0]).assertEqual(b[0]);
      expect(a[1]).assertEqual(b[1]);
      expect(a[2]).assertEqual(b[2]);
      expect(a[3]).assertEqual(b[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_7000
     * @tc.name testUint8ClampedArrayFillThree070
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 9;
      arr.fill(v, 2, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_7100
     * @tc.name testUint8ClampedArrayFillThree071
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 9;
      arr.fill(v, 3, 1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_7200
     * @tc.name testUint8ClampedArrayFillThree072
     * @tc.desc Verify fill ret equals arr for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 5;
      const ret = arr.fill(v, 2, 1);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_7300
     * @tc.name testUint8ClampedArrayFillThree073
     * @tc.desc Verify fill element at a[0] equals b[0] for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const b = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 9;
      a.fill(v, 3, 3);
      b.fill(9, 3, 3);
      expect(a[0]).assertEqual(b[0]);
      expect(a[1]).assertEqual(b[1]);
      expect(a[2]).assertEqual(b[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_7400
     * @tc.name testUint8ClampedArrayFillThree074
     * @tc.desc Verify fill ret equals arr for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const v: byte = 7;
      const ret = arr.fill(v);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_7500
     * @tc.name testUint8ClampedArrayFillThree075
     * @tc.desc Verify fill yields length 0 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const v: byte = 5;
      arr.fill(v);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_7600
     * @tc.name testUint8ClampedArrayFillThree076
     * @tc.desc Verify fill yields length retB.length for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(0);
      const b = new Uint8ClampedArray(0);
      const v: byte = 3;
      const retA = a.fill(v);
      const retB = b.fill(3);
      expect(retA.length).assertEqual(retB.length);
      expect(retA).assertEqual(a);
      expect(retB).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_7700
     * @tc.name testUint8ClampedArrayFillThree077
     * @tc.desc Verify fill ret equals arr for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const ret = arr.fill(9, 0, 0);
      expect(ret).assertEqual(arr);
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_7800
     * @tc.name testUint8ClampedArrayFillThree078
     * @tc.desc Verify fill ret equals arr for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const v: byte = 4;
      const ret = arr.fill(v, 5, 10);
      expect(ret).assertEqual(arr);
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_7900
     * @tc.name testUint8ClampedArrayFillThree079
     * @tc.desc Verify fill element at full[0] equals 100 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const full = new Uint8ClampedArray(buf);
      full[0] = 100;
      full[5] = 200;
      const window = new Uint8ClampedArray(buf, 2, 2);
      const v: byte = 9;
      window.fill(v);
      expect(full[0]).assertEqual(100);
      expect(full[5]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_8000
     * @tc.name testUint8ClampedArrayFillThree080
     * @tc.desc Verify slice element at cp[0] equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const cp = arr.slice();
      const v: byte = 5;
      arr.fill(v);
      expect(cp[0]).assertEqual(1);
      expect(cp[1]).assertEqual(2);
      expect(cp[2]).assertEqual(3);
      expect(cp[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_8100
     * @tc.name testUint8ClampedArrayFillThree081
     * @tc.desc Verify fill element at arr[50] equals 127 for length-100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 127;
      const arr = new Uint8ClampedArray(100);
      arr.fill(v);
      expect(arr[50]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_8200
     * @tc.name testUint8ClampedArrayFillThree082
     * @tc.desc Verify fill element at arr[50] equals 0 for length-100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -1;
      const arr = new Uint8ClampedArray(100);
      arr.fill(v);
      expect(arr[50]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_8300
     * @tc.name testUint8ClampedArrayFillThree083
     * @tc.desc Verify fill element at arr[3] equals 6 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 6;
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 0, 4);
      arr.fill(v);
      expect(arr[3]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_8400
     * @tc.name testUint8ClampedArrayFillThree084
     * @tc.desc Verify fill element at all[2] equals 0 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const buf = new ArrayBuffer(4);
      const view = new Uint8ClampedArray(buf, 0, 2);
      view.fill(v);
      const all = new Uint8ClampedArray(buf);
      expect(all[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_8500
     * @tc.name testUint8ClampedArrayFillThree085
     * @tc.desc Verify fill arr.$_get(0) equals 42 for array [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      arr.fill(42.0);
      expect(arr.$_get(0)).assertEqual(42);
      expect(arr.$_get(1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_8600
     * @tc.name testUint8ClampedArrayFillThree086
     * @tc.desc Verify fill element at arr[0] equals 123 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr.fill(123.0);
      expect(arr[0]).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_8700
     * @tc.name testUint8ClampedArrayFillThree087
     * @tc.desc Verify fill element at arr[0] equals 77 for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr.fill(77.0);
      expect(arr[0]).assertEqual(77);
      expect(arr[1]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_8800
     * @tc.name testUint8ClampedArrayFillThree088
     * @tc.desc Verify fill element at arr[0] equals 5 for length-10 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      arr.fill(5.0);
      expect(arr[0]).assertEqual(5);
      expect(arr[9]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_8900
     * @tc.name testUint8ClampedArrayFillThree089
     * @tc.desc Verify fill element at arr[0] equals 200 for length-256 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      arr.fill(200.0);
      expect(arr[0]).assertEqual(200);
      expect(arr[255]).assertEqual(200);
      expect(arr.length).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_9000
     * @tc.name testUint8ClampedArrayFillThree090
     * @tc.desc Verify fill element at arr[0] equals 150 for length-1024 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      arr.fill(150.0);
      expect(arr[0]).assertEqual(150);
      expect(arr[1023]).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_9100
     * @tc.name testUint8ClampedArrayFillThree091
     * @tc.desc Verify fill element at arr[0] equals 255 for length-65535 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(65535);
      arr.fill(256.0);
      expect(arr[0]).assertEqual(255);
      expect(arr[65534]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_THREE_9200
     * @tc.name testUint8ClampedArrayFillThree092
     * @tc.desc Verify fill number in range 100..200 of length-1000 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillThree092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1000);
      arr.fill(88.0, 100, 200);
      expect(arr[99]).assertEqual(0);
      expect(arr[100]).assertEqual(88);
      expect(arr[199]).assertEqual(88);
      expect(arr[200]).assertEqual(0);
    });
  });
}
