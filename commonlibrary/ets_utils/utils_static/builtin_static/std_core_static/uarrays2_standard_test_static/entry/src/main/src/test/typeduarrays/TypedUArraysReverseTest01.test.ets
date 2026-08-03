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

export default function typedUArraysReverseTest01(): void {
  describe('TypedUArraysReverseTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_0100
     * @tc.name testTypedUArraysReverseTestFileA001
     * @tc.desc Verify Uint8Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = expect(arr.reverse()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_0200
     * @tc.name testTypedUArraysReverseTestFileA002
     * @tc.desc Verify Uint8ClampedArray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let result = expect(arr.reverse()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_0300
     * @tc.name testTypedUArraysReverseTestFileA003
     * @tc.desc Verify Uint16Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = expect(arr.reverse()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_0400
     * @tc.name testTypedUArraysReverseTestFileA004
     * @tc.desc Verify Uint32Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = expect(arr.reverse()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_0500
     * @tc.name testTypedUArraysReverseTestFileA005
     * @tc.desc Verify BigUint64Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = expect(arr.reverse()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_0600

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_0700

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_0600
     * @tc.name testTypedUArraysReverseTestFileA006
     * @tc.desc Verify Uint8Array reverse with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      const result = arr.reverse();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_0700
     * @tc.name testTypedUArraysReverseTestFileA007
     * @tc.desc Verify Uint8ClampedArray reverse with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const result = arr.reverse();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_0800
     * @tc.name testTypedUArraysReverseTestFileA008
     * @tc.desc Verify Uint16Array reverse with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      const result = arr.reverse();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_0900
     * @tc.name testTypedUArraysReverseTestFileA009
     * @tc.desc Verify Uint32Array reverse with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([]);
      const result = arr.reverse();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_1000
     * @tc.name testTypedUArraysReverseTestFileA010
     * @tc.desc Verify BigUint64Array reverse with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([]);
      const result = arr.reverse();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_1100
     * @tc.name testTypedUArraysReverseTestFileA011
     * @tc.desc Verify Uint8Array reverse with single element returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      expect(arr.reverse()).assertEqual(arr);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_1200
     * @tc.name testTypedUArraysReverseTestFileA012
     * @tc.desc Verify Uint8ClampedArray reverse with single element returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      expect(arr.reverse()).assertEqual(arr);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_1300
     * @tc.name testTypedUArraysReverseTestFileA013
     * @tc.desc Verify Uint16Array reverse with single element returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535]);
      expect(arr.reverse()).assertEqual(arr);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_1400
     * @tc.name testTypedUArraysReverseTestFileA014
     * @tc.desc Verify Uint32Array reverse with single element returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295]);
      expect(arr.reverse()).assertEqual(arr);
      expect(arr[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_1500
     * @tc.name testTypedUArraysReverseTestFileA015
     * @tc.desc Verify BigUint64Array reverse with single element returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615')]);
      expect(arr.reverse()).assertEqual(arr);
      expect(arr[0]).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_1600
     * @tc.name testTypedUArraysReverseTestFileA016
     * @tc.desc Verify Uint8Array reverse with 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_1700
     * @tc.name testTypedUArraysReverseTestFileA017
     * @tc.desc Verify Uint16Array reverse with 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200]);
      arr.reverse();
      expect(arr[0]).assertEqual(200);
      expect(arr[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_1800
     * @tc.name testTypedUArraysReverseTestFileA018
     * @tc.desc Verify Uint8Array reverse with 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_1900
     * @tc.name testTypedUArraysReverseTestFileA019
     * @tc.desc Verify Uint8ClampedArray reverse with 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.reverse();
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_2000
     * @tc.name testTypedUArraysReverseTestFileA020
     * @tc.desc Verify Uint32Array reverse with 5 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr[0]).assertEqual(5);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_2100
     * @tc.name testTypedUArraysReverseTestFileA021
     * @tc.desc Verify BigUint64Array reverse with 5 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.reverse();
      expect(arr[0]).assertEqual(5n);
      expect(arr[4]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_2200
     * @tc.name testTypedUArraysReverseTestFileA022
     * @tc.desc Verify Uint8Array reverse with 10 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      arr.reverse();
      expect(arr[0]).assertEqual(9);
      expect(arr[9]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_2300
     * @tc.name testTypedUArraysReverseTestFileA023
     * @tc.desc Verify Uint16Array reverse with 10 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      arr.reverse();
      expect(arr[0]).assertEqual(9);
      expect(arr[9]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_2400
     * @tc.name testTypedUArraysReverseTestFileA024
     * @tc.desc Verify Uint8Array reverse with 100 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      arr.reverse();
      expect(arr[0]).assertEqual(99);
      expect(arr[99]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_2500
     * @tc.name testTypedUArraysReverseTestFileA025
     * @tc.desc Verify Uint16Array reverse with 1000 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr[i] = i;
      }
      arr.reverse();
      expect(arr[0]).assertEqual(999);
      expect(arr[999]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_2600
     * @tc.name testTypedUArraysReverseTestFileA026
     * @tc.desc Verify Uint8Array reverse with max boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 0, 128]);
      arr.reverse();
      expect(arr[0]).assertEqual(128);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_2700
     * @tc.name testTypedUArraysReverseTestFileA027
     * @tc.desc Verify Uint8Array reverse with min-max values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 255]);
      arr.reverse();
      expect(arr[0]).assertEqual(255);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_2800
     * @tc.name testTypedUArraysReverseTestFileA028
     * @tc.desc Verify Uint16Array reverse with max boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 0, 32768]);
      arr.reverse();
      expect(arr[0]).assertEqual(32768);
      expect(arr[2]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_2900
     * @tc.name testTypedUArraysReverseTestFileA029
     * @tc.desc Verify Uint16Array reverse with min-max values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 1, 65535]);
      arr.reverse();
      expect(arr[0]).assertEqual(65535);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_3000
     * @tc.name testTypedUArraysReverseTestFileA030
     * @tc.desc Verify Uint32Array reverse with max boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0, 2147483648]);
      arr.reverse();
      expect(arr[0]).assertEqual(2147483648);
      expect(arr[2]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_3100
     * @tc.name testTypedUArraysReverseTestFileA031
     * @tc.desc Verify Uint32Array reverse with min-max values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 1, 4294967295]);
      arr.reverse();
      expect(arr[0]).assertEqual(4294967295);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_3200
     * @tc.name testTypedUArraysReverseTestFileA032
     * @tc.desc Verify BigUint64Array reverse with max boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 0n, 1n]);
      arr.reverse();
      expect(arr[0]).assertEqual(1n);
      expect(arr[2]).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_3300
     * @tc.name testTypedUArraysReverseTestFileA033
     * @tc.desc Verify BigUint64Array reverse with min-max values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, BigInt('18446744073709551615')]);
      arr.reverse();
      expect(arr[0]).assertEqual(BigInt('18446744073709551615'));
      expect(arr[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_3400
     * @tc.name testTypedUArraysReverseTestFileA034
     * @tc.desc Verify Uint8Array reverse with all zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_3500
     * @tc.name testTypedUArraysReverseTestFileA035
     * @tc.desc Verify Uint16Array reverse with all zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0, 0]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_3600
     * @tc.name testTypedUArraysReverseTestFileA036
     * @tc.desc Verify Uint8Array reverse with all same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7]);
      arr.reverse();
      expect(arr[0]).assertEqual(7);
      expect(arr[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_3700
     * @tc.name testTypedUArraysReverseTestFileA037
     * @tc.desc Verify Uint16Array reverse with all same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42, 42, 42, 42]);
      arr.reverse();
      expect(arr[0]).assertEqual(42);
      expect(arr[3]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_3800
     * @tc.name testTypedUArraysReverseTestFileA038
     * @tc.desc Verify Uint8Array reverse with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1, -2, -3, -4]);
      arr.reverse();
      expect(arr[0]).assertEqual(252);
      expect(arr[3]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_3900
     * @tc.name testTypedUArraysReverseTestFileA039
     * @tc.desc Verify Uint16Array reverse with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-1, -2, -3, -4]);
      arr.reverse();
      expect(arr[0]).assertEqual(65532);
      expect(arr[3]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_4000
     * @tc.name testTypedUArraysReverseTestFileA040
     * @tc.desc Verify Uint32Array reverse with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([-1, -2, -3, -4]);
      arr.reverse();
      expect(arr[0]).assertEqual(4294967292);
      expect(arr[3]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_4100
     * @tc.name testTypedUArraysReverseTestFileA041
     * @tc.desc Verify Uint16Array reverse with mixed positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-100, 0, 100, -200, 200]);
      arr.reverse();
      expect(arr[0]).assertEqual(200);
      expect(arr[4]).assertEqual(65436);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_4200
     * @tc.name testTypedUArraysReverseTestFileA042
     * @tc.desc Verify Uint8Array reverse with floating point values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1.9, 2.1, 3.5]);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_4300
     * @tc.name testTypedUArraysReverseTestFileA043
     * @tc.desc Verify Uint16Array reverse with floating point values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1.9, 2.1, 3.5]);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_4400
     * @tc.name testTypedUArraysReverseTestFileA044
     * @tc.desc Verify Uint8Array reverse with Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.POSITIVE_INFINITY, 0, -Number.POSITIVE_INFINITY]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_4500
     * @tc.name testTypedUArraysReverseTestFileA045
     * @tc.desc Verify Uint16Array reverse with Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([Number.POSITIVE_INFINITY, 0, -Number.POSITIVE_INFINITY]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_4600
     * @tc.name testTypedUArraysReverseTestFileA046
     * @tc.desc Verify Uint8Array reverse with NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.NaN, 1, 2]);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_4700
     * @tc.name testTypedUArraysReverseTestFileA047
     * @tc.desc Verify Uint16Array reverse with NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([Number.NaN, 1, 2]);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART101_4800
     * @tc.name testTypedUArraysReverseTestFileA048
     * @tc.desc Verify Uint8Array reverse with Uint8ClampedArray saturating behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverseTestFileA048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([300, 0, -1]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(255);
    });

  });
}
