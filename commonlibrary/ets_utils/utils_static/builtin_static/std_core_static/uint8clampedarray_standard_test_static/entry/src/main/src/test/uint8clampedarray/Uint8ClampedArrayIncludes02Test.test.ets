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

export default function uint8ClampedArrayIncludes02Test(): void {
  describe('uint8ClampedArrayIncludes02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_0100
     * @tc.name testUint8ClampedArrayIncludesTwo001
     * @tc.desc Verify includes result is true for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.includes(2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_0200
     * @tc.name testUint8ClampedArrayIncludesTwo002
     * @tc.desc Verify includes result is false for array [0, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1]);
      const r = arr.includes(Number.NaN);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_0300
     * @tc.name testUint8ClampedArrayIncludesTwo003
     * @tc.desc Verify includes(byte 5) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6]);
      const b: byte = 5;
      const r = arr.includes(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_0400
     * @tc.name testUint8ClampedArrayIncludesTwo004
     * @tc.desc Verify includes result is true for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.includes(3, 1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_0500
     * @tc.name testUint8ClampedArrayIncludesTwo005
     * @tc.desc Verify includes(10) true for present element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      expect(arr.includes(10)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_0600
     * @tc.name testUint8ClampedArrayIncludesTwo006
     * @tc.desc Verify includes(99) false for absent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      expect(arr.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_0700
     * @tc.name testUint8ClampedArrayIncludesTwo007
     * @tc.desc Verify includes result is false for array [100, 200, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200, 255]);
      expect(arr.includes(256)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_0800
     * @tc.name testUint8ClampedArrayIncludesTwo008
     * @tc.desc Verify includes(50) true for single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50]);
      const r = arr.includes(50);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_0900
     * @tc.name testUint8ClampedArrayIncludesTwo009
     * @tc.desc Verify includes(51) false for absent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50]);
      const r = arr.includes(51);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_1000
     * @tc.name testUint8ClampedArrayIncludesTwo010
     * @tc.desc Verify includes yields length before for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const before = arr.length;
      expect(arr.includes(2)).assertTrue();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_1100
     * @tc.name testUint8ClampedArrayIncludesTwo011
     * @tc.desc Verify includes yields byteLength before for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const before = arr.byteLength;
      expect(arr.includes(3)).assertTrue();
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_1200
     * @tc.name testUint8ClampedArrayIncludesTwo012
     * @tc.desc Verify includes byteLength length BYTES_PER_ELEMENT=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6]);
      expect(arr.includes(4)).assertTrue();
      expect(arr.byteLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_1300
     * @tc.name testUint8ClampedArrayIncludesTwo013
     * @tc.desc Verify includes yields length 0 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      expect(arr.includes(0)).assertFalse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_1400
     * @tc.name testUint8ClampedArrayIncludesTwo014
     * @tc.desc Verify includes yields byteLength 0 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      expect(arr.includes(0)).assertFalse();
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_1500
     * @tc.name testUint8ClampedArrayIncludesTwo015
     * @tc.desc Verify includes yields byteOffset before for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      const before = arr.byteOffset;
      expect(arr.includes(0)).assertTrue();
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_1600
     * @tc.name testUint8ClampedArrayIncludesTwo016
     * @tc.desc Verify includes yields byteOffset 2 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      expect(arr.includes(1)).assertFalse();
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_1700
     * @tc.name testUint8ClampedArrayIncludesTwo017
     * @tc.desc Verify includes value in length 1024 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      arr[1023] = 7;
      expect(arr.includes(7)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_1800
     * @tc.name testUint8ClampedArrayIncludesTwo018
     * @tc.desc Verify includes BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      expect(arr.includes(2)).assertTrue();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_1900
     * @tc.name testUint8ClampedArrayIncludesTwo019
     * @tc.desc Verify includes does not mutate first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([11, 22, 33]);
      expect(arr.includes(22)).assertTrue();
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_2000
     * @tc.name testUint8ClampedArrayIncludesTwo020
     * @tc.desc Verify includes does not mutate all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15, 20]);
      expect(arr.includes(99)).assertFalse();
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(15);
      expect(arr[3]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_2100
     * @tc.name testUint8ClampedArrayIncludesTwo021
     * @tc.desc Verify join arr.join(',') equals before for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const before = arr.join(',');
      expect(arr.includes(2)).assertTrue();
      expect(arr.join(',')).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_2200
     * @tc.name testUint8ClampedArrayIncludesTwo022
     * @tc.desc Verify toString arr.toString() equals before for array [7, 8, 9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      const before = arr.toString();
      expect(arr.includes(99)).assertFalse();
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_2300
     * @tc.name testUint8ClampedArrayIncludesTwo023
     * @tc.desc Verify includes(2, 1) returns true and array element at index 1 remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.includes(2, 1);
      expect(r).assertTrue();
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_2400
     * @tc.name testUint8ClampedArrayIncludesTwo024
     * @tc.desc Verify includes(10, -2) returns false with negative fromIndex and array element at index 0 remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.includes(10, -2);
      expect(r).assertFalse();
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_2500
     * @tc.name testUint8ClampedArrayIncludesTwo025
     * @tc.desc Verify includes element at arr[0] equals 0 for array [0, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      expect(arr.includes(Number.NaN)).assertFalse();
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_2600
     * @tc.name testUint8ClampedArrayIncludesTwo026
     * @tc.desc Verify includes buffer reference matches for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const bufBefore = arr.buffer;
      expect(arr.includes(2)).assertTrue();
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_2700
     * @tc.name testUint8ClampedArrayIncludesTwo027
     * @tc.desc Verify includes yields byteLength before for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const before = arr.buffer.byteLength;
      expect(arr.includes(3)).assertTrue();
      expect(arr.buffer.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_2800
     * @tc.name testUint8ClampedArrayIncludesTwo028
     * @tc.desc Verify includes buffer.byteLength 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      expect(arr.includes(0)).assertFalse();
      expect(arr.buffer.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_2900
     * @tc.name testUint8ClampedArrayIncludesTwo029
     * @tc.desc Verify two includes(2) calls return equal results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r1 = arr.includes(2);
      const r2 = arr.includes(2);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_3000
     * @tc.name testUint8ClampedArrayIncludesTwo030
     * @tc.desc Verify includes returns true for present and false for absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const a = arr.includes(10);
      const b = arr.includes(99);
      expect(a).assertTrue();
      expect(b).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_3100
     * @tc.name testUint8ClampedArrayIncludesTwo031
     * @tc.desc Verify subarray buffer reference matches for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(1, 3);
      expect(sub.includes(2)).assertTrue();
      expect(sub.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_3200
     * @tc.name testUint8ClampedArrayIncludesTwo032
     * @tc.desc Verify includes returns true for element in subarray(1, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(1, 3);
      expect(sub.includes(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_3300
     * @tc.name testUint8ClampedArrayIncludesTwo033
     * @tc.desc Verify subarray includes byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(1, 3);
      const before = sub.byteOffset;
      expect(sub.includes(2)).assertTrue();
      expect(sub.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_3400
     * @tc.name testUint8ClampedArrayIncludesTwo034
     * @tc.desc Verify subarray yields length 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(1, 3);
      expect(sub.includes(2)).assertTrue();
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_3500
     * @tc.name testUint8ClampedArrayIncludesTwo035
     * @tc.desc Verify includes returns true for slice element and slice shares no buffer with parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = parent.slice(0, 2);
      expect(s.includes(1)).assertTrue();
      expect(s.buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_3600
     * @tc.name testUint8ClampedArrayIncludesTwo036
     * @tc.desc Verify includes returns true for element in slice(0, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = parent.slice(0, 2);
      expect(s.includes(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_3700
     * @tc.name testUint8ClampedArrayIncludesTwo037
     * @tc.desc Verify includes returns true for slice element after parent mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = parent.slice(0, 2);
      parent[0] = 99;
      expect(s.includes(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_3800
     * @tc.name testUint8ClampedArrayIncludesTwo038
     * @tc.desc Verify includes result is true for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const firstView = new Uint8ClampedArray(buf);
      const secondView = new Uint8ClampedArray(buf);
      firstView[0] = 77;
      expect(secondView.includes(77)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_3900
     * @tc.name testUint8ClampedArrayIncludesTwo039
     * @tc.desc Verify includes buffer reference matches for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const firstView = new Uint8ClampedArray(buf);
      const secondView = new Uint8ClampedArray(buf);
      expect(secondView.includes(0)).assertTrue();
      expect(firstView.buffer).assertEqual(secondView.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_4000
     * @tc.name testUint8ClampedArrayIncludesTwo040
     * @tc.desc Verify includes returns false for empty subarray(1, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const empty = parent.subarray(1, 1);
      expect(empty.includes(2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_4100
     * @tc.name testUint8ClampedArrayIncludesTwo041
     * @tc.desc Verify subarray yields length 0 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const empty = parent.subarray(1, 1);
      expect(empty.includes(0)).assertFalse();
      expect(empty.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_4200
     * @tc.name testUint8ClampedArrayIncludesTwo042
     * @tc.desc Verify subarray includes parent.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const empty = parent.subarray(2, 2);
      expect(empty.includes(0)).assertFalse();
      expect(empty.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_4300
     * @tc.name testUint8ClampedArrayIncludesTwo043
     * @tc.desc Verify includes result is false for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const full = new Uint8ClampedArray(buf);
      full[0] = 100;
      full[5] = 200;
      const mid = new Uint8ClampedArray(buf, 1, 3);
      expect(mid.includes(100)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_4400
     * @tc.name testUint8ClampedArrayIncludesTwo044
     * @tc.desc Verify includes result is true for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const full = new Uint8ClampedArray(buf);
      full[2] = 55;
      const mid = new Uint8ClampedArray(buf, 1, 3);
      expect(mid.includes(55)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_4500
     * @tc.name testUint8ClampedArrayIncludesTwo045
     * @tc.desc Verify includes yields byteOffset 3 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Uint8ClampedArray(buf, 3, 4);
      expect(view.includes(0)).assertTrue();
      expect(view.byteOffset).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_4600
     * @tc.name testUint8ClampedArrayIncludesTwo046
     * @tc.desc Verify includes yields length 4 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Uint8ClampedArray(buf, 3, 4);
      expect(view.includes(0)).assertTrue();
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_4700
     * @tc.name testUint8ClampedArrayIncludesTwo047
     * @tc.desc Verify includes yields byteLength 10 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const arr = new Uint8ClampedArray(buf);
      expect(arr.includes(0)).assertTrue();
      expect(buf.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_4800
     * @tc.name testUint8ClampedArrayIncludesTwo048
     * @tc.desc Verify includes result is true for array [1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.includes(1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_4900
     * @tc.name testUint8ClampedArrayIncludesTwo049
     * @tc.desc Verify includes(2) result === false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r = arr.includes(2);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_5000
     * @tc.name testUint8ClampedArrayIncludesTwo050
     * @tc.desc Verify includes r1 equals r2 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r1 = arr.includes(2);
      const r2 = arr.includes(2, 0);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_5100
     * @tc.name testUint8ClampedArrayIncludesTwo051
     * @tc.desc Verify includes NaN false and zero true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const rNaN = arr.includes(Number.NaN);
      const r0 = arr.includes(0);
      expect(rNaN).assertFalse();
      expect(r0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INCLUDES_TWO_5200
     * @tc.name testUint8ClampedArrayIncludesTwo052
     * @tc.desc Verify includes(byte) includes(number )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIncludesTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42, 43]);
      const b: byte = 42;
      expect(arr.includes(b)).assertEqual(arr.includes(42));
    });
  });
}
