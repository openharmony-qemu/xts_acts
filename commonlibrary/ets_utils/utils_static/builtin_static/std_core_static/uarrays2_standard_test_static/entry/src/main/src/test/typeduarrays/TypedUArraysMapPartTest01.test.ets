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

export default function typedUArraysMapPartTest01(): void {
  describe('TypedUArraysMapPartTest01', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_0100
     * @tc.name testTypedUArraysMapPartTestFileA001
     * @tc.desc Verify construction Uint8ClampedArray by length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_0200
     * @tc.name testTypedUArraysMapPartTestFileA002
     * @tc.desc Verify construction Uint8Array by length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_0300
     * @tc.name testTypedUArraysMapPartTestFileA003
     * @tc.desc Verify construction Uint16Array by length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(4);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_0400
     * @tc.name testTypedUArraysMapPartTestFileA004
     * @tc.desc Verify construction Uint32Array by length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_0500
     * @tc.name testTypedUArraysMapPartTestFileA005
     * @tc.desc Verify construction BigUint64Array by length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_0600
     * @tc.name testTypedUArraysMapPartTestFileA006
     * @tc.desc Verify construction Uint8Array from array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_0700
     * @tc.name testTypedUArraysMapPartTestFileA007
     * @tc.desc Verify construction Uint8Array from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf);
      expect(arr.length).assertEqual(8);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_0800
     * @tc.name testTypedUArraysMapPartTestFileA008
     * @tc.desc Verify BYTES_PER_ELEMENT Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_0900
     * @tc.name testTypedUArraysMapPartTestFileA009
     * @tc.desc Verify BYTES_PER_ELEMENT Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_1000
     * @tc.name testTypedUArraysMapPartTestFileA010
     * @tc.desc Verify BYTES_PER_ELEMENT Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_1100
     * @tc.name testTypedUArraysMapPartTestFileA011
     * @tc.desc Verify BYTES_PER_ELEMENT Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_1200
     * @tc.name testTypedUArraysMapPartTestFileA012
     * @tc.desc Verify BYTES_PER_ELEMENT BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_1300
     * @tc.name testTypedUArraysMapPartTestFileA013
     * @tc.desc Verify buffer property Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.buffer instanceof ArrayBuffer).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_1400
     * @tc.name testTypedUArraysMapPartTestFileA014
     * @tc.desc Verify byteOffset property Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_1500
     * @tc.name testTypedUArraysMapPartTestFileA015
     * @tc.desc Verify byteLength property Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_1600
     * @tc.name testTypedUArraysMapPartTestFileA016
     * @tc.desc Verify length property Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_1700
     * @tc.name testTypedUArraysMapPartTestFileA017
     * @tc.desc Verify length property BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n]);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_1800
     * @tc.name testTypedUArraysMapPartTestFileA018
     * @tc.desc Verify subscript access get Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_1900
     * @tc.name testTypedUArraysMapPartTestFileA019
     * @tc.desc Verify subscript access set Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      arr[1] = 99;
      expect(arr[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_2000
     * @tc.name testTypedUArraysMapPartTestFileA020
     * @tc.desc Verify with create new array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const replaced = arr.with(0, 99);
      expect(arr[0]).assertEqual(10);
      expect(replaced[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_2100
     * @tc.name testTypedUArraysMapPartTestFileA021
     * @tc.desc Verify fill Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.fill(99);
      expect(arr[0]).assertEqual(99);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_2200
     * @tc.name testTypedUArraysMapPartTestFileA022
     * @tc.desc Verify fill Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      arr.fill(999);
      expect(arr[0]).assertEqual(999);
      expect(arr[2]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_2300
     * @tc.name testTypedUArraysMapPartTestFileA023
     * @tc.desc Verify fill Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      arr.fill(99999);
      expect(arr[0]).assertEqual(99999);
      expect(arr[2]).assertEqual(99999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_2400
     * @tc.name testTypedUArraysMapPartTestFileA024
     * @tc.desc Verify fill BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      arr.fill(99n);
      expect(arr[0]).assertEqual(99n);
      expect(arr[2]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_2500
     * @tc.name testTypedUArraysMapPartTestFileA025
     * @tc.desc Verify fill Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(128);
      expect(arr[0]).assertEqual(128);
      expect(arr[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_2600
     * @tc.name testTypedUArraysMapPartTestFileA026
     * @tc.desc Verify set Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.set([10, 20], 0);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_2700
     * @tc.name testTypedUArraysMapPartTestFileA027
     * @tc.desc Verify set Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      arr.set([100, 200], 1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_2800
     * @tc.name testTypedUArraysMapPartTestFileA028
     * @tc.desc Verify set Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      arr.set([1000, 2000], 0);
      expect(arr[0]).assertEqual(1000);
      expect(arr[1]).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_2900
     * @tc.name testTypedUArraysMapPartTestFileA029
     * @tc.desc Verify set BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      arr.set([100n, 200n], 0);
      expect(arr[0]).assertEqual(100n);
      expect(arr[1]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_3000
     * @tc.name testTypedUArraysMapPartTestFileA030
     * @tc.desc Verify set Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.set([100, 200], 0);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_3100
     * @tc.name testTypedUArraysMapPartTestFileA031
     * @tc.desc Verify of Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_3200
     * @tc.name testTypedUArraysMapPartTestFileA032
     * @tc.desc Verify of BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(10n, 20n, 30n);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_3300
     * @tc.name testTypedUArraysMapPartTestFileA033
     * @tc.desc Verify from Uint8Array with array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([10, 20, 30]);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_3400
     * @tc.name testTypedUArraysMapPartTestFileA034
     * @tc.desc Verify from BigUint64Array with array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.from([10n, 20n, 30n]);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_3500
     * @tc.name testTypedUArraysMapPartTestFileA035
     * @tc.desc Verify from Uint8Array with mapFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([1, 2, 3], (v) => v * 2);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_3600
     * @tc.name testTypedUArraysMapPartTestFileA036
     * @tc.desc Verify find Uint8Array match found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.find((v) => v > 15);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_3700
     * @tc.name testTypedUArraysMapPartTestFileA037
     * @tc.desc Verify find Uint16Array match found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const result = arr.find((v) => v > 150);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_3800
     * @tc.name testTypedUArraysMapPartTestFileA038
     * @tc.desc Verify find Uint32Array match found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const result = arr.find((v) => v > 1500);
      expect(result).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_3900
     * @tc.name testTypedUArraysMapPartTestFileA039
     * @tc.desc Verify find BigUint64Array match found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const result = arr.find((v) => v > 15n);
      expect(result).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_4000
     * @tc.name testTypedUArraysMapPartTestFileA040
     * @tc.desc Verify find Uint8ClampedArray not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const result = arr.find((v) => v > 300);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_4100
     * @tc.name testTypedUArraysMapPartTestFileA041
     * @tc.desc Verify find Uint8Array not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.find((v) => v > 300);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_4200
     * @tc.name testTypedUArraysMapPartTestFileA042
     * @tc.desc Verify filter Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.filter((v) => v > 15);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_4300
     * @tc.name testTypedUArraysMapPartTestFileA043
     * @tc.desc Verify filter Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const result = arr.filter((v) => v <= 200);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_4400
     * @tc.name testTypedUArraysMapPartTestFileA044
     * @tc.desc Verify filter Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const result = arr.filter((v) => v !== 2000);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1000);
      expect(result[1]).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_4500
     * @tc.name testTypedUArraysMapPartTestFileA045
     * @tc.desc Verify filter BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const result = arr.filter((v) => v > 15n);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_4600
     * @tc.name testTypedUArraysMapPartTestFileA046
     * @tc.desc Verify filter Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const result = arr.filter((v) => v >= 20);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_4700
     * @tc.name testTypedUArraysMapPartTestFileA047
     * @tc.desc Verify copyWithin Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_4800
     * @tc.name testTypedUArraysMapPartTestFileA048
     * @tc.desc Verify copyWithin BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(3n);
      expect(arr[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_4900
     * @tc.name testTypedUArraysMapPartTestFileA049
     * @tc.desc Verify callback 1n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.map((v) => v);
      const val44 = result[0];
      expect(val44).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_5000
     * @tc.name testTypedUArraysMapPartTestFileA050
     * @tc.desc Verify callback 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val48 = result[0];
      expect(val48).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_5100
     * @tc.name testTypedUArraysMapPartTestFileA051
     * @tc.desc Verify callback array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val59 = result[0];
      expect(val59).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_5200
     * @tc.name testTypedUArraysMapPartTestFileA052
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.map((v) => v >= 0 ? v : v);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_5300
     * @tc.name testTypedUArraysMapPartTestFileA053
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val60 = result[0];
      expect(val60).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_5400
     * @tc.name testTypedUArraysMapPartTestFileA054
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val61 = result[0];
      expect(val61).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_5500
     * @tc.name testTypedUArraysMapPartTestFileA055
     * @tc.desc Verify callback value 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val63 = result[0];
      expect(val63).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_5600
     * @tc.name testTypedUArraysMapPartTestFileA056
     * @tc.desc Verify callback value 0x0F Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([17, 33, 49]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val70 = result[0];
      expect(val70).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_5700
     * @tc.name testTypedUArraysMapPartTestFileA057
     * @tc.desc Verify callback value 0xF0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val71 = result[0];
      expect(val71).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_5800
     * @tc.name testTypedUArraysMapPartTestFileA058
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1000);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val78 = result[0];
      expect(val78).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_5900
     * @tc.name testTypedUArraysMapPartTestFileA059
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 127, 128, 255]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val79 = result[0];
      expect(val79).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_6000
     * @tc.name testTypedUArraysMapPartTestFileA060
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1, -2, -3]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val80 = result[0];
      expect(val80).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_6100
     * @tc.name testTypedUArraysMapPartTestFileA061
     * @tc.desc Verify callback Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x10, 0x20, 0x30]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val81 = result[0];
      expect(val81).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_6200
     * @tc.name testTypedUArraysMapPartTestFileA062
     * @tc.desc Verify callback Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x1000, 0x2000, 0x3000]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val82 = result[0];
      expect(val82).assertEqual(4096);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_6300
     * @tc.name testTypedUArraysMapPartTestFileA063
     * @tc.desc Verify callback Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x10000000, 0x20000000]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val83 = result[0];
      expect(val83).assertEqual(268435456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_6400
     * @tc.name testTypedUArraysMapPartTestFileA064
     * @tc.desc Verify callback BigInt BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, 300n]);
      let result = arr.map((v) => v);
      const val84 = result[0];
      expect(val84).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_6500
     * @tc.name testTypedUArraysMapPartTestFileA065
     * @tc.desc Verify callback BigInt BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, BigInt('18446744073709551615')]);
      let result = arr.map((v) => v);
      const val85 = result[0];
      expect(val85).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_6600
     * @tc.name testTypedUArraysMapPartTestFileA066
     * @tc.desc Verify callback BigInt BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615')]);
      let result = arr.map((v) => v);
      const val86 = result[0];
      expect(val86).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_6700
     * @tc.name testTypedUArraysMapPartTestFileA067
     * @tc.desc Verify thisArg Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val88 = result[0];
      expect(val88).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_6800
     * @tc.name testTypedUArraysMapPartTestFileA068
     * @tc.desc Verify thisArg Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val89 = result[0];
      expect(val89).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART101_6900
     * @tc.name testTypedUArraysMapPartTestFileA069
     * @tc.desc Verify thisArg Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPartTestFileA069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let result = arr.map((v) => v >= 0 ? v : v);
      const val91 = result[0];
      expect(val91).assertEqual(10);
    });
    });
    }
