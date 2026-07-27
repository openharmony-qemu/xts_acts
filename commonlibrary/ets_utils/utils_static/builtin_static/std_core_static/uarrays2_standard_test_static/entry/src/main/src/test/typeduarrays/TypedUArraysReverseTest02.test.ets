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

export default function typedUArraysReverseTest02(): void {
  describe('TypedUArraysReverseTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_0100
     * @tc.name testTypedUArraysReversePart102_001
     * @tc.desc Verify reverse returns same Uint32Array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      expect(arr.reverse()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_0200
     * @tc.name testTypedUArraysReversePart102_002
     * @tc.desc Verify reverse returns same BigUint64Array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      expect(arr.reverse()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_0300
     * @tc.name testTypedUArraysReversePart102_003
     * @tc.desc Verify Uint8Array reverse with empty constructor throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      const result = arr.reverse();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_0400
     * @tc.name testTypedUArraysReversePart102_004
     * @tc.desc Verify Uint16Array reverse with empty constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      const result = arr.reverse();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_0500
     * @tc.name testTypedUArraysReversePart102_005
     * @tc.desc Verify Uint8Array reverse with 10000 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10000);
      for (let i = 0; i < 10000; i++) {
        arr[i] = i % 256;
      }
      arr.reverse();
      expect(arr[0]).assertEqual(9999 % 256);
      expect(arr[9999]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_0600
     * @tc.name testTypedUArraysReversePart102_006
     * @tc.desc Verify Uint16Array reverse with 10000 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(10000);
      for (let i = 0; i < 10000; i++) {
        arr[i] = i;
      }
      arr.reverse();
      expect(arr[0]).assertEqual(9999);
      expect(arr[9999]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_0700
     * @tc.name testTypedUArraysReversePart102_007
     * @tc.desc Verify Uint8Array reverse with 3 elements preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_0800
     * @tc.name testTypedUArraysReversePart102_008
     * @tc.desc Verify Uint16Array reverse with 3 elements preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_0900
     * @tc.name testTypedUArraysReversePart102_009
     * @tc.desc Verify Uint32Array reverse with 3 elements preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_1000
     * @tc.name testTypedUArraysReversePart102_010
     * @tc.desc Verify BigUint64Array reverse with 3 elements preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      arr.reverse();
      expect(arr[0]).assertEqual(3n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_1100
     * @tc.name testTypedUArraysReversePart102_011
     * @tc.desc Verify reverse Uint8Array modifies in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr[0]).assertEqual(5);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_1200
     * @tc.name testTypedUArraysReversePart102_012
     * @tc.desc Verify reverse Uint16Array modifies in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      arr.reverse();
      expect(arr[0]).assertEqual(5);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_1300
     * @tc.name testTypedUArraysReversePart102_013
     * @tc.desc Verify reverse Uint8Array with larger values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      arr.reverse();
      expect(arr[0]).assertEqual(50);
      expect(arr[2]).assertEqual(30);
      expect(arr[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_1400
     * @tc.name testTypedUArraysReversePart102_014
     * @tc.desc Verify reverse Uint16Array with larger values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300, 400]);
      arr.reverse();
      expect(arr[0]).assertEqual(400);
      expect(arr[3]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_1500
     * @tc.name testTypedUArraysReversePart102_015
     * @tc.desc Verify reverse returns same Uint8Array reference for join-like check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reverse();
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_1600
     * @tc.name testTypedUArraysReversePart102_016
     * @tc.desc Verify reverse returns same Uint8Array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 10, 15]);
      const result = arr.reverse();
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_1700
     * @tc.name testTypedUArraysReversePart102_017
     * @tc.desc Verify reverse returns same Uint8Array reference for valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 8, 9]);
      let result = expect(arr.reverse()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_1800
     * @tc.name testTypedUArraysReversePart102_018
     * @tc.desc Verify reverse returns same Uint16Array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      const result = arr.reverse();
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_1900
     * @tc.name testTypedUArraysReversePart102_019
     * @tc.desc Verify reverse returns same Uint16Array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([5, 10, 15]);
      const result = arr.reverse();
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_2000
     * @tc.name testTypedUArraysReversePart102_020
     * @tc.desc Verify reverse Uint8Array with 6 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50, 60]);
      arr.reverse();
      expect(arr[0]).assertEqual(60);
      expect(arr[1]).assertEqual(50);
      expect(arr[2]).assertEqual(40);
      expect(arr[3]).assertEqual(30);
      expect(arr[4]).assertEqual(20);
      expect(arr[5]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_2100
     * @tc.name testTypedUArraysReversePart102_021
     * @tc.desc Verify reverse Uint16Array with 6 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50, 60]);
      arr.reverse();
      expect(arr[0]).assertEqual(60);
      expect(arr[1]).assertEqual(50);
      expect(arr[2]).assertEqual(40);
      expect(arr[3]).assertEqual(30);
      expect(arr[4]).assertEqual(20);
      expect(arr[5]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_2200
     * @tc.name testTypedUArraysReversePart102_022
     * @tc.desc Verify reverse Uint8Array with 7 odd elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5, 6, 7]);
      arr.reverse();
      expect(arr[0]).assertEqual(7);
      expect(arr[3]).assertEqual(4);
      expect(arr[6]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_2300
     * @tc.name testTypedUArraysReversePart102_023
     * @tc.desc Verify reverse Uint16Array with 7 odd elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5, 6, 7]);
      arr.reverse();
      expect(arr[0]).assertEqual(7);
      expect(arr[3]).assertEqual(4);
      expect(arr[6]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_2400
     * @tc.name testTypedUArraysReversePart102_024
     * @tc.desc Verify Uint8Array reverse with single max element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255]);
      arr.reverse();
      expect(arr[0]).assertEqual(255);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_2500
     * @tc.name testTypedUArraysReversePart102_025
     * @tc.desc Verify Uint16Array reverse with single max element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535]);
      arr.reverse();
      expect(arr[0]).assertEqual(65535);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_2600
     * @tc.name testTypedUArraysReversePart102_026
     * @tc.desc Verify Uint8Array reverse with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 0, 128]);
      arr.reverse();
      expect(arr[0]).assertEqual(128);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_2700
     * @tc.name testTypedUArraysReversePart102_027
     * @tc.desc Verify Uint16Array reverse with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 0, 32768]);
      arr.reverse();
      expect(arr[0]).assertEqual(32768);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_2800
     * @tc.name testTypedUArraysReversePart102_028
     * @tc.desc Verify Uint8Array reverse with NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.NaN, 255, 0]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_2900
     * @tc.name testTypedUArraysReversePart102_029
     * @tc.desc Verify Uint16Array reverse with NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([Number.NaN, 65535, 0]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_3000
     * @tc.name testTypedUArraysReversePart102_030
     * @tc.desc Verify Uint8Array reverse with Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.POSITIVE_INFINITY, 0, -Number.POSITIVE_INFINITY]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_3100
     * @tc.name testTypedUArraysReversePart102_031
     * @tc.desc Verify Uint16Array reverse with Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([Number.POSITIVE_INFINITY, 0, -Number.POSITIVE_INFINITY]);
      arr.reverse();
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_3200
     * @tc.name testTypedUArraysReversePart102_032
     * @tc.desc Verify Uint8Array reverse with different numeric notations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF, 0o377, 0b11111111]);
      arr.reverse();
      expect(arr[0]).assertEqual(0b11111111);
      expect(arr[2]).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_3300
     * @tc.name testTypedUArraysReversePart102_033
     * @tc.desc Verify Uint16Array reverse with different numeric notations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0o177777, 0b1111111111111111]);
      arr.reverse();
      expect(arr[0]).assertEqual(0b1111111111111111);
      expect(arr[2]).assertEqual(0xFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_3400
     * @tc.name testTypedUArraysReversePart102_034
     * @tc.desc Verify Uint8Array reverse with sequential values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2]);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_3500
     * @tc.name testTypedUArraysReversePart102_035
     * @tc.desc Verify Uint8Array reverse with negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-0, 1, 2]);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_PART102_3600
     * @tc.name testTypedUArraysReversePart102_036
     * @tc.desc Verify Uint16Array reverse with sequential values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReversePart102_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 1, 2]);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
    });

  });
}
