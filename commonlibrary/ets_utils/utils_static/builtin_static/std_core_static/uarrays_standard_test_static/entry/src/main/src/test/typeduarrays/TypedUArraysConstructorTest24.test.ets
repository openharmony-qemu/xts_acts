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

export default function typedUArraysConstructorTest24(): void {
  describe('TypedUArraysConstructorTest24', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_0100
     * @tc.name testTypedUArraysConstructor0301_001
     * @tc.desc Verify new Uint8ClampedArray 0 (length 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_0100
     * @tc.name testTypedUArraysConstructor0301_001
     * @tc.desc Verify Uint16Array fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-1, -2])
      expect(arr[0]).assertEqual(65535)
      expect(arr[1]).assertEqual(65534)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_0200
     * @tc.name testTypedUArraysConstructor0301_002
     * @tc.desc Verify Uint16Array 65536 fixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65536])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_0300
     * @tc.name testTypedUArraysConstructor0301_003
     * @tc.desc Verify Uint16Array 0x10000 fixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x10000])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_0400
     * @tc.name testTypedUArraysConstructor0301_004
     * @tc.desc Verify Uint16Array NaN fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([Number.NaN])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_0500
     * @tc.name testTypedUArraysConstructor0301_005
     * @tc.desc Verify Uint16Array Infinity fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([Number.POSITIVE_INFINITY])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_0600
     * @tc.name testTypedUArraysConstructor0301_006
     * @tc.desc Verify Uint16Array -Infinity fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-Number.POSITIVE_INFINITY])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_0700
     * @tc.name testTypedUArraysConstructor0301_007
     * @tc.desc Verify Uint16Array 32767 fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([32767])
      expect(arr[0]).assertEqual(32767)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_0800
     * @tc.name testTypedUArraysConstructor0301_008
     * @tc.desc Verify Uint16Array 0x8000 fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x8000])
      expect(arr[0]).assertEqual(32768)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_0900
     * @tc.name testTypedUArraysConstructor0301_009
     * @tc.desc Verify Uint16Array 1 fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1])
      expect(arr[0]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_1000
     * @tc.name testTypedUArraysConstructor0301_010
     * @tc.desc Verify Uint16Array fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([32768, 32768, 32768])
      expect(arr[0]).assertEqual(32768)
      expect(arr[1]).assertEqual(32768)
      expect(arr[2]).assertEqual(32768)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_1100
     * @tc.name testTypedUArraysConstructor0301_011
     * @tc.desc Verify Uint16Array fixedArray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
      const arr = new Uint16Array(src)
      expect(arr.length).assertEqual(16)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_1200
     * @tc.name testTypedUArraysConstructor0301_012
     * @tc.desc Verify Uint16Array fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-5, 0, 32768, 65535, 70000])
      expect(arr[0]).assertEqual(65531)
      expect(arr[1]).assertEqual(0)
      expect(arr[2]).assertEqual(32768)
      expect(arr[3]).assertEqual(65535)
      expect(arr[4]).assertEqual(4464)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_1300
     * @tc.name testTypedUArraysConstructor0301_013
     * @tc.desc Verify Uint16Array 0.5 fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0.5])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_1400
     * @tc.name testTypedUArraysConstructor0301_014
     * @tc.desc Verify Uint16Array 65535.9 fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535.9])
      expect(arr[0]).assertEqual(65535)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_1500
     * @tc.name testTypedUArraysConstructor0301_015
     * @tc.desc Verify Uint32Array fixedArray length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([])
      expect(arr.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_1600
     * @tc.name testTypedUArraysConstructor0301_016
     * @tc.desc Verify Uint32Array fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42])
      expect(arr.length).assertEqual(1)
      expect(arr[0]).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_1700
     * @tc.name testTypedUArraysConstructor0301_017
     * @tc.desc Verify Uint32Array fixedArray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5])
      expect(arr.length).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_1800
     * @tc.name testTypedUArraysConstructor0301_018
     * @tc.desc Verify Uint32Array 0 fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0])
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(0)
      expect(arr[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_1900
     * @tc.name testTypedUArraysConstructor0301_019
     * @tc.desc Verify Uint32Array 4294967295 fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295])
      expect(arr[0]).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_2000
     * @tc.name testTypedUArraysConstructor0301_020
     * @tc.desc Verify Uint32Array 0xFFFFFFFF fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF])
      expect(arr[0]).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_2100
     * @tc.name testTypedUArraysConstructor0301_021
     * @tc.desc Verify Uint32Array fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([-1, -2])
      expect(arr[0]).assertEqual(4294967295)
      expect(arr[1]).assertEqual(4294967294)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_2200
     * @tc.name testTypedUArraysConstructor0301_022
     * @tc.desc Verify Uint32Array 4294967296 fixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967296])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_2300
     * @tc.name testTypedUArraysConstructor0301_023
     * @tc.desc Verify Uint32Array 0x100000000 fixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x100000000])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_2400
     * @tc.name testTypedUArraysConstructor0301_024
     * @tc.desc Verify Uint32Array NaN fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([Number.NaN])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_2500
     * @tc.name testTypedUArraysConstructor0301_025
     * @tc.desc Verify Uint32Array Infinity fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([Number.POSITIVE_INFINITY])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_2600
     * @tc.name testTypedUArraysConstructor0301_026
     * @tc.desc Verify Uint32Array -Infinity fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([-Number.POSITIVE_INFINITY])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_2700
     * @tc.name testTypedUArraysConstructor0301_027
     * @tc.desc Verify Uint32Array 2147483647 fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([2147483647])
      expect(arr[0]).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_2800
     * @tc.name testTypedUArraysConstructor0301_028
     * @tc.desc Verify Uint32Array 0x80000000 fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x80000000])
      expect(arr[0]).assertEqual(2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_2900
     * @tc.name testTypedUArraysConstructor0301_029
     * @tc.desc Verify Uint32Array 1 fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1])
      expect(arr[0]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_3000
     * @tc.name testTypedUArraysConstructor0301_030
     * @tc.desc Verify Uint32Array fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([2147483648, 2147483648, 2147483648])
      expect(arr[0]).assertEqual(2147483648)
      expect(arr[1]).assertEqual(2147483648)
      expect(arr[2]).assertEqual(2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_3100
     * @tc.name testTypedUArraysConstructor0301_031
     * @tc.desc Verify Uint32Array fixedArray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
      const arr = new Uint32Array(src)
      expect(arr.length).assertEqual(16)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_3200
     * @tc.name testTypedUArraysConstructor0301_032
     * @tc.desc Verify Uint32Array fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([-5, 0, 2147483648, 4294967295, 4300000000])
      expect(arr[0]).assertEqual(4294967291)
      expect(arr[1]).assertEqual(0)
      expect(arr[2]).assertEqual(2147483648)
      expect(arr[3]).assertEqual(4294967295)
      expect(arr[4]).assertEqual(5032704)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_3300
     * @tc.name testTypedUArraysConstructor0301_033
     * @tc.desc Verify Uint32Array 0.5 fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0.5])
      expect(arr[0]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_3400
     * @tc.name testTypedUArraysConstructor0301_034
     * @tc.desc Verify Uint32Array 4294967295.9 fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295.9])
      expect(arr[0]).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_3500
     * @tc.name testTypedUArraysConstructor0301_035
     * @tc.desc Verify BigUint64Array fixedArray length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([])
      expect(arr.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_3600
     * @tc.name testTypedUArraysConstructor0301_036
     * @tc.desc Verify BigUint64Array fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n])
      expect(arr.length).assertEqual(1)
      expect(arr[0]).assertEqual(42n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_3700
     * @tc.name testTypedUArraysConstructor0301_037
     * @tc.desc Verify BigUint64Array fixedArray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n])
      expect(arr.length).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_3800
     * @tc.name testTypedUArraysConstructor0301_038
     * @tc.desc Verify BigUint64Array 0n fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n])
      expect(arr[0]).assertEqual(0n)
      expect(arr[1]).assertEqual(0n)
      expect(arr[2]).assertEqual(0n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_3900
     * @tc.name testTypedUArraysConstructor0301_039
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615') fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615')])
      expect(arr[0]).assertEqual(BigInt('18446744073709551615'))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_4000
     * @tc.name testTypedUArraysConstructor0301_040
     * @tc.desc Verify BigUint64Array 1n fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n])
      expect(arr[0]).assertEqual(1n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_4100
     * @tc.name testTypedUArraysConstructor0301_041
     * @tc.desc Verify BigUint64Array fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 100n, 100n])
      expect(arr[0]).assertEqual(100n)
      expect(arr[1]).assertEqual(100n)
      expect(arr[2]).assertEqual(100n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_4200
     * @tc.name testTypedUArraysConstructor0301_042
     * @tc.desc Verify BigUint64Array fixedArray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n, 11n, 12n, 13n, 14n, 15n]
      const arr = new BigUint64Array(src)
      expect(arr.length).assertEqual(16)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_4300
     * @tc.name testTypedUArraysConstructor0301_043
     * @tc.desc Verify BigUint64Array BigInt fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551616')])
      expect(arr[0]).assertEqual(0n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_4400
     * @tc.name testTypedUArraysConstructor0301_044
     * @tc.desc Verify BigUint64Array BigInt fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([-1n])
      expect(arr[0]).assertEqual(BigInt('18446744073709551615'))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_4500
     * @tc.name testTypedUArraysConstructor0301_045
     * @tc.desc Verify BigUint64Array BigInt fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, BigInt('18446744073709551615'), -1n])
      expect(arr[0]).assertEqual(0n)
      expect(arr[1]).assertEqual(1n)
      expect(arr[2]).assertEqual(BigInt('18446744073709551615'))
      expect(arr[3]).assertEqual(BigInt('18446744073709551615'))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_4600
     * @tc.name testTypedUArraysConstructor0301_046
     * @tc.desc Verify Uint8ClampedArray fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3])
      expect(typeof arr).assertEqual('object')
      expect(arr.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_4700
     * @tc.name testTypedUArraysConstructor0301_047
     * @tc.desc Verify Uint8Array fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      expect(typeof arr).assertEqual('object')
      expect(arr.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_4800
     * @tc.name testTypedUArraysConstructor0301_048
     * @tc.desc Verify Uint16Array fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3])
      expect(typeof arr).assertEqual('object')
      expect(arr.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_4900
     * @tc.name testTypedUArraysConstructor0301_049
     * @tc.desc Verify Uint32Array fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3])
      expect(typeof arr).assertEqual('object')
      expect(arr.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0301_5000
     * @tc.name testTypedUArraysConstructor0301_050
     * @tc.desc Verify BigUint64Array fixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0301_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      expect(typeof arr).assertEqual('object')
      expect(arr.length).assertEqual(3)
    });
  });
}
