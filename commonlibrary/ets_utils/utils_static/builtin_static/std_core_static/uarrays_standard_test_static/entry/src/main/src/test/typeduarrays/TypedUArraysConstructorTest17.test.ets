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

export default function typedUArraysConstructorTest17(): void {
  describe('TypedUArraysConstructorTest17', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_0100
     * @tc.name testTypedUArraysConstructor0302_001
     * @tc.desc Verify Uint8ClampedArray fixedArray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysConstructor0302_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2])
      expect(arr.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_0200
     * @tc.name testTypedUArraysConstructor0302_002
     * @tc.desc Verify Uint8ClampedArray -128 fixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-128])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_0300
     * @tc.name testTypedUArraysConstructor0302_003
     * @tc.desc Verify Uint8ClampedArray -1 fixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_0400
     * @tc.name testTypedUArraysConstructor0302_004
     * @tc.desc Verify Uint8ClampedArray 256 fixedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256])
      expect(arr[0]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_0500
     * @tc.name testTypedUArraysConstructor0302_005
     * @tc.desc Verify Uint8ClampedArray 1000 fixedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1000])
      expect(arr[0]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_0600
     * @tc.name testTypedUArraysConstructor0302_006
     * @tc.desc Verify Uint8ClampedArray -1000 fixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1000])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_0700
     * @tc.name testTypedUArraysConstructor0302_007
     * @tc.desc Verify Uint8Array -1 fixedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1])
      expect(arr[0]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_0800
     * @tc.name testTypedUArraysConstructor0302_008
     * @tc.desc Verify Uint8Array 256 fixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([256])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_0900
     * @tc.name testTypedUArraysConstructor0302_009
     * @tc.desc Verify Uint8Array 512 fixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([512])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_1000
     * @tc.name testTypedUArraysConstructor0302_010
     * @tc.desc Verify Uint16Array -1 fixedArray 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-1])
      expect(arr[0]).assertEqual(65535)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_1100
     * @tc.name testTypedUArraysConstructor0302_011
     * @tc.desc Verify Uint16Array 65536 fixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65536])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_1200
     * @tc.name testTypedUArraysConstructor0302_012
     * @tc.desc Verify Uint32Array -1 fixedArray 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([-1])
      expect(arr[0]).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_1300
     * @tc.name testTypedUArraysConstructor0302_013
     * @tc.desc Verify Uint32Array 4294967296 fixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967296])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_1400
     * @tc.name testTypedUArraysConstructor0302_014
     * @tc.desc Verify BigUint64Array -1n fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([-1n])
      expect(arr[0]).assertEqual(BigInt('18446744073709551615'))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_1500
     * @tc.name testTypedUArraysConstructor0302_015
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551616') fixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551616')])
      expect(arr[0]).assertEqual(0n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_1600
     * @tc.name testTypedUArraysConstructor0302_016
     * @tc.desc Verify Uint8ClampedArray 0.9 fixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.9])
      expect(arr[0]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_1700
     * @tc.name testTypedUArraysConstructor0302_017
     * @tc.desc Verify Uint8ClampedArray 255.1 fixedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255.1])
      expect(arr[0]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_1800
     * @tc.name testTypedUArraysConstructor0302_018
     * @tc.desc Verify Uint8Array 0.9 fixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0.9])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_1900
     * @tc.name testTypedUArraysConstructor0302_019
     * @tc.desc Verify Uint8Array 255.9 fixedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255.9])
      expect(arr[0]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_2000
     * @tc.name testTypedUArraysConstructor0302_020
     * @tc.desc Verify Uint8ClampedArray fixedArray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8ClampedArray([1, 2, 3])
      const arr2 = new Uint8ClampedArray(arr1)
      expect(arr1.buffer != arr2.buffer).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_2100
     * @tc.name testTypedUArraysConstructor0302_021
     * @tc.desc Verify Uint8Array fixedArray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8Array([1, 2, 3])
      const arr2 = new Uint8Array(arr1)
      expect(arr1.buffer != arr2.buffer).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_2200
     * @tc.name testTypedUArraysConstructor0302_022
     * @tc.desc Verify Uint16Array fixedArray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint16Array([1, 2, 3])
      const arr2 = new Uint16Array(arr1)
      expect(arr1.buffer != arr2.buffer).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_2300
     * @tc.name testTypedUArraysConstructor0302_023
     * @tc.desc Verify Uint32Array fixedArray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint32Array([1, 2, 3])
      const arr2 = new Uint32Array(arr1)
      expect(arr1.buffer != arr2.buffer).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_2400
     * @tc.name testTypedUArraysConstructor0302_024
     * @tc.desc Verify BigUint64Array fixedArray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new BigUint64Array([1n, 2n, 3n])
      const arr2 = new BigUint64Array(arr1)
      expect(arr1.buffer != arr2.buffer).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_2500
     * @tc.name testTypedUArraysConstructor0302_025
     * @tc.desc Verify Uint8ClampedArray fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8ClampedArray([1, 2, 3])
      const arr2 = new Uint8ClampedArray(arr1)
      expect(arr2[0]).assertEqual(arr1[0])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_2600
     * @tc.name testTypedUArraysConstructor0302_026
     * @tc.desc Verify Uint16Array fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint16Array([100, 200, 300])
      const arr2 = new Uint16Array(arr1)
      expect(arr2[0]).assertEqual(arr1[0])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_2700
     * @tc.name testTypedUArraysConstructor0302_027
     * @tc.desc Verify BigUint64Array fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new BigUint64Array([100n, 200n, 300n])
      const arr2 = new BigUint64Array(arr1)
      expect(arr2[0]).assertEqual(arr1[0])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_2800
     * @tc.name testTypedUArraysConstructor0302_028
     * @tc.desc Verify Uint8ClampedArray fixedArray BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3])
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_2900
     * @tc.name testTypedUArraysConstructor0302_029
     * @tc.desc Verify Uint8Array fixedArray BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_3000
     * @tc.name testTypedUArraysConstructor0302_030
     * @tc.desc Verify Uint16Array fixedArray BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3])
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_3100
     * @tc.name testTypedUArraysConstructor0302_031
     * @tc.desc Verify Uint32Array fixedArray BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3])
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0302_3200
     * @tc.name testTypedUArraysConstructor0302_032
     * @tc.desc Verify BigUint64Array fixedArray BYTES_PER_ELEMENT 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0302_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8)
    });

  });
}
