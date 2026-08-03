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

export default function typedUArraysValueOfTest03(): void {
  describe('TypedUArraysValueOfTest03', (): void => {
    beforeAll((): void => {
    });

    beforeEach((): void => {
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_0100
     * @tc.name testTypedUArraysValueOf03_001
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615') valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('18446744073709551615')]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_0200
     * @tc.name testTypedUArraysValueOf03_002
     * @tc.desc Verify Uint8Array subarray valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      let result = sub.valueOf();
      expect(result).assertEqual(sub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_0300
     * @tc.name testTypedUArraysValueOf03_003
     * @tc.desc Verify Uint16Array subarray valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      let result = sub.valueOf();
      expect(result).assertEqual(sub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_0400
     * @tc.name testTypedUArraysValueOf03_004
     * @tc.desc Verify Uint32Array subarray valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      let result = sub.valueOf();
      expect(result).assertEqual(sub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_0500
     * @tc.name testTypedUArraysValueOf03_005
     * @tc.desc Verify BigUint64Array subarray valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const sub = arr.subarray(1, 4);
      let result = sub.valueOf();
      expect(result).assertEqual(sub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_0600
     * @tc.name testTypedUArraysValueOf03_006
     * @tc.desc Verify Uint8Array NaN valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.NaN, 1, 2]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_0700
     * @tc.name testTypedUArraysValueOf03_007
     * @tc.desc Verify Uint8Array Infinity valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.POSITIVE_INFINITY, 1, 2]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_0800
     * @tc.name testTypedUArraysValueOf03_008
     * @tc.desc Verify Uint8Array -0 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-0, 1, 2]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_0900
     * @tc.name testTypedUArraysValueOf03_009
     * @tc.desc Verify Uint8Array 0.5 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0.5, 1, 2]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_1000
     * @tc.name testTypedUArraysValueOf03_010
     * @tc.desc Verify Uint8Array -1 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1, 1, 2]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_1100
     * @tc.name testTypedUArraysValueOf03_011
     * @tc.desc Verify Uint32Array 4294967296 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967296, 1, 2]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_1200
     * @tc.name testTypedUArraysValueOf03_012
     * @tc.desc Verify Uint8Array 0x80 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x80, 0x40, 0xC0]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_1300
     * @tc.name testTypedUArraysValueOf03_013
     * @tc.desc Verify Uint16Array 0x8000 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x8000, 0x4000, 0xC000]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_1400
     * @tc.name testTypedUArraysValueOf03_014
     * @tc.desc Verify Uint32Array 0x80000000 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x80000000, 0x40000000, 0xC0000000]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_1500
     * @tc.name testTypedUArraysValueOf03_015
     * @tc.desc Verify BigUint64Array BigInt('0x8000000000000000') valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('0x8000000000000000'), BigInt('0x4000000000000000')]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_1600
     * @tc.name testTypedUArraysValueOf03_016
     * @tc.desc Verify Uint32Array 1e10 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1e10, 1e5, 1000]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_1700
     * @tc.name testTypedUArraysValueOf03_017
     * @tc.desc Verify Uint8Array 0b11111111 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0b11111111, 0b10000000, 0b01000000]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_1800
     * @tc.name testTypedUArraysValueOf03_018
     * @tc.desc Verify Uint8Array toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.toReversed();
      expect(result[0]).assertEqual(5);
      expect(result[4]).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_1900
     * @tc.name testTypedUArraysValueOf03_019
     * @tc.desc Verify Uint16Array toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.toReversed();
      expect(result[0]).assertEqual(5);
      expect(result[4]).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_2000
     * @tc.name testTypedUArraysValueOf03_020
     * @tc.desc Verify Uint32Array toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.toReversed();
      expect(result[0]).assertEqual(5);
      expect(result[4]).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_2100
     * @tc.name testTypedUArraysValueOf03_021
     * @tc.desc Verify BigUint64Array toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.toReversed();
      expect(result[0]).assertEqual(5n);
      expect(result[4]).assertEqual(1n);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_2200
     * @tc.name testTypedUArraysValueOf03_022
     * @tc.desc Verify Uint8Array sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 3, 1, 4, 2]);
      let result = arr.sort();
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_2300
     * @tc.name testTypedUArraysValueOf03_023
     * @tc.desc Verify Uint16Array sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([5, 3, 1, 4, 2]);
      let result = arr.sort();
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_2400
     * @tc.name testTypedUArraysValueOf03_024
     * @tc.desc Verify Uint32Array sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([5, 3, 1, 4, 2]);
      let result = arr.sort();
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_2500
     * @tc.name testTypedUArraysValueOf03_025
     * @tc.desc Verify BigUint64Array sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 3n, 1n, 4n, 2n]);
      let result = arr.sort();
      expect(result[0]).assertEqual(1n);
      expect(result[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_2600
     * @tc.name testTypedUArraysValueOf03_026
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 3, 1, 4, 2]);
      let result = arr.toSorted();
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_2700
     * @tc.name testTypedUArraysValueOf03_027
     * @tc.desc Verify Uint16Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([5, 3, 1, 4, 2]);
      let result = arr.toSorted();
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_2800
     * @tc.name testTypedUArraysValueOf03_028
     * @tc.desc Verify Uint32Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([5, 3, 1, 4, 2]);
      let result = arr.toSorted();
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_2900
     * @tc.name testTypedUArraysValueOf03_029
     * @tc.desc Verify BigUint64Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 3n, 1n, 4n, 2n]);
      let result = arr.toSorted();
      expect(result[0]).assertEqual(1n);
      expect(result[4]).assertEqual(5n);
      expect(arr[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_3000
     * @tc.name testTypedUArraysValueOf03_030
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.map(x => x * 2);
      expect(result[0]).assertEqual(2);
      expect(result[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_3100
     * @tc.name testTypedUArraysValueOf03_031
     * @tc.desc Verify Uint16Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.map(x => x * 2);
      expect(result[0]).assertEqual(2);
      expect(result[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_3200
     * @tc.name testTypedUArraysValueOf03_032
     * @tc.desc Verify Uint32Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.map(x => x * 2);
      expect(result[0]).assertEqual(2);
      expect(result[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_3300
     * @tc.name testTypedUArraysValueOf03_033
     * @tc.desc Verify BigUint64Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.map(x => x * 2n);
      expect(result[0]).assertEqual(2n);
      expect(result[4]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_3400
     * @tc.name testTypedUArraysValueOf03_034
     * @tc.desc Verify Uint8Array filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.filter(x => x > 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_3500
     * @tc.name testTypedUArraysValueOf03_035
     * @tc.desc Verify Uint16Array filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.filter(x => x > 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_3600
     * @tc.name testTypedUArraysValueOf03_036
     * @tc.desc Verify Uint32Array filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.filter(x => x > 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_3700
     * @tc.name testTypedUArraysValueOf03_037
     * @tc.desc Verify BigUint64Array filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.filter(x => x > 3n);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_3800
     * @tc.name testTypedUArraysValueOf03_038
     * @tc.desc Verify Uint8Array reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduce((acc, val) => acc + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_3900
     * @tc.name testTypedUArraysValueOf03_039
     * @tc.desc Verify Uint16Array reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.reduce((acc, val) => acc + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_4000
     * @tc.name testTypedUArraysValueOf03_040
     * @tc.desc Verify Uint32Array reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.reduce((acc, val) => acc + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_4100
     * @tc.name testTypedUArraysValueOf03_041
     * @tc.desc Verify BigUint64Array reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduce((acc, val) => acc + val);
      expect(result).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_4200
     * @tc.name testTypedUArraysValueOf03_042
     * @tc.desc Verify Uint8Array reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((acc, val) => acc + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_4300
     * @tc.name testTypedUArraysValueOf03_043
     * @tc.desc Verify Uint16Array reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((acc, val) => acc + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_4400
     * @tc.name testTypedUArraysValueOf03_044
     * @tc.desc Verify Uint32Array reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((acc, val) => acc + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_4500
     * @tc.name testTypedUArraysValueOf03_045
     * @tc.desc Verify BigUint64Array reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduceRight((acc, val) => acc + val);
      expect(result).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_4600
     * @tc.name testTypedUArraysValueOf03_046
     * @tc.desc Verify Uint8Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.join(',');
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_4700
     * @tc.name testTypedUArraysValueOf03_047
     * @tc.desc Verify Uint16Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.join(',');
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_4800
     * @tc.name testTypedUArraysValueOf03_048
     * @tc.desc Verify Uint32Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.join(',');
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_4900
     * @tc.name testTypedUArraysValueOf03_049
     * @tc.desc Verify BigUint64Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.join(',');
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_5000
     * @tc.name testTypedUArraysValueOf03_050
     * @tc.desc Verify Uint8Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.toString();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_5100
     * @tc.name testTypedUArraysValueOf03_051
     * @tc.desc Verify Uint16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.toString();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_5200
     * @tc.name testTypedUArraysValueOf03_052
     * @tc.desc Verify Uint32Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.toString();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_5300
     * @tc.name testTypedUArraysValueOf03_053
     * @tc.desc Verify BigUint64Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.toString();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_5400
     * @tc.name testTypedUArraysValueOf03_054
     * @tc.desc Verify Uint8Array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.toLocaleString();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_5500
     * @tc.name testTypedUArraysValueOf03_055
     * @tc.desc Verify Uint16Array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.toLocaleString();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_5600
     * @tc.name testTypedUArraysValueOf03_056
     * @tc.desc Verify Uint32Array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.toLocaleString();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_5700
     * @tc.name testTypedUArraysValueOf03_057
     * @tc.desc Verify BigUint64Array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.toLocaleString();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_5800
     * @tc.name testTypedUArraysValueOf03_058
     * @tc.desc Verify Uint8Array constructor by length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      expect(arr.length).assertEqual(5);
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_5900
     * @tc.name testTypedUArraysValueOf03_059
     * @tc.desc Verify Uint8ClampedArray constructor by length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      expect(arr.length).assertEqual(5);
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_6000
     * @tc.name testTypedUArraysValueOf03_060
     * @tc.desc Verify Uint8ClampedArray clamp semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      arr[0] = -1;
      arr[1] = 256;
      arr[2] = 128;
      arr[3] = 0.5;
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(128);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_6100
     * @tc.name testTypedUArraysValueOf03_061
     * @tc.desc Verify Uint8ClampedArray valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_6200
     * @tc.name testTypedUArraysValueOf03_062
     * @tc.desc Verify Uint8Array constructor from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Uint8Array(buffer, 4, 8);
      expect(arr.length).assertEqual(8);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_6300
     * @tc.name testTypedUArraysValueOf03_063
     * @tc.desc Verify Uint16Array constructor from Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3, 4, 5]);
      const arr = new Uint16Array(src);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_6400
     * @tc.name testTypedUArraysValueOf03_064
     * @tc.desc Verify Uint32Array constructor from array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF03_6500
     * @tc.name testTypedUArraysValueOf03_065
     * @tc.desc Verify BigUint64Array constructor from BiGint array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf03_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1n);
      expect(arr[4]).assertEqual(5n);
    });

  });
}
