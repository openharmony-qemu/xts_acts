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

export default function typedUArraysSortTest01(): void {
  describe('TypedUArraysSortTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_0100
     * @tc.name testTypedUArraysSortPart1_001
     * @tc.desc Verify sort Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      expect(arr.sort()).assertEqual(1);
      const val1 = arr[1] ;
      expect(val1 === 2).assertTrue();
      const val2 = arr[2] ;
      expect(val2 === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_0200
     * @tc.name testTypedUArraysSortPart1_002
     * @tc.desc Verify sort Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      expect(arr.sort()).assertEqual(100);
      const val4 = arr[1] ;
      expect(val4 === 200).assertTrue();
      const val5 = arr[2] ;
      expect(val5 === 300).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_0300
     * @tc.name testTypedUArraysSortPart1_003
     * @tc.desc Verify sort Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000000000, 1000000000, 2000000000]);
      expect(arr.sort()).assertEqual(1000000000);
      const val7 = arr[1] ;
      expect(val7 === 2000000000).assertTrue();
      const val8 = arr[2] ;
      expect(val8 === 3000000000).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_0400
     * @tc.name testTypedUArraysSortPart1_004
     * @tc.desc Verify sort Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      expect(arr.sort()).assertEqual(1);
      const val10 = arr[1] ;
      expect(val10 === 2).assertTrue();
      const val11 = arr[2] ;
      expect(val11 === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_0500
     * @tc.name testTypedUArraysSortPart1_005
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      expect(arr.sort()).assertEqual(1n);
      const val13 = arr[1];
      expect(val13 === 2n).assertTrue();
      const val14 = arr[2];
      expect(val14 === 3n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_0600
     * @tc.name testTypedUArraysSortPart1_006
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      expect(arr.sort()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_0700
     * @tc.name testTypedUArraysSortPart1_007
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      expect(arr.sort()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_0800
     * @tc.name testTypedUArraysSortPart1_008
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      expect(arr.sort()).assertEqual(1);
      const val17 = arr[4] ;
      expect(val17 === 5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_0900
     * @tc.name testTypedUArraysSortPart1_009
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 4, 3, 2, 1]);
      expect(arr.sort()).assertEqual(1);
      const val19 = arr[4] ;
      expect(val19 === 5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_1000
     * @tc.name testTypedUArraysSortPart1_010
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      expect(arr.sort()).assertEqual(0);
      const val21 = arr[3] ;
      expect(val21 === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_1100
     * @tc.name testTypedUArraysSortPart1_011
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7]);
      expect(arr.sort()).assertEqual(7);
      const val23 = arr[3] ;
      expect(val23 === 7).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_1200
     * @tc.name testTypedUArraysSortPart1_012
     * @tc.desc Verify sort Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 0, 127]);
      expect(arr.sort()).assertEqual(0);
      const val25 = arr[1] ;
      expect(val25 === 127).assertTrue();
      const val26 = arr[2] ;
      expect(val26 === 255).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_1300
     * @tc.name testTypedUArraysSortPart1_013
     * @tc.desc Verify sort Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF, 0x01, 0x80]);
      expect(arr.sort()).assertEqual(0x01);
      const val28 = arr[1] ;
      expect(val28).assertEqual(0x80);
      const val29 = arr[2] ;
      expect(val29).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_1400
     * @tc.name testTypedUArraysSortPart1_014
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
      }
      expect(arr.sort()).assertEqual(0);
      const val31 = arr[99];
      expect(val31 === 99).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_1500
     * @tc.name testTypedUArraysSortPart1_015
     * @tc.desc Verify sort Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 0, 32767]);
      expect(arr.sort()).assertEqual(0);
      const val33 = arr[1] ;
      expect(val33 === 32767).assertTrue();
      const val34 = arr[2] ;
      expect(val34 === 65535).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_1600
     * @tc.name testTypedUArraysSortPart1_016
     * @tc.desc Verify sort Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0, 2147483647]);
      expect(arr.sort()).assertEqual(0);
      const val36 = arr[1] ;
      expect(val36 === 2147483647).assertTrue();
      const val37 = arr[2] ;
      expect(val37 === 4294967295).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_1700
     * @tc.name testTypedUArraysSortPart1_017
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 0n, 9223372036854775807n]);
      expect(arr.sort()).assertEqual(0n);
      const val39 = arr[1];
      expect(val39 === 9223372036854775807n).assertTrue();
      const val40 = arr[2];
      expect(val40 === BigInt('18446744073709551615')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_1800
     * @tc.name testTypedUArraysSortPart1_018
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([2, 1]);
      expect(arr.sort()).assertEqual(1);
      const val42 = arr[1] ;
      expect(val42 === 2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_1900
     * @tc.name testTypedUArraysSortPart1_019
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 0, 1]);
      expect(arr.sort()).assertEqual(0);
      const val44 = arr[1] ;
      expect(val44 === 1).assertTrue();
      const val45 = arr[2] ;
      expect(val45 === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_2000
     * @tc.name testTypedUArraysSortPart1_020
     * @tc.desc Verify sort Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 1, 128]);
      expect(arr.sort()).assertEqual(1);
      const val47 = arr[1] ;
      expect(val47 === 128).assertTrue();
      const val48 = arr[2] ;
      expect(val48 === 255).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_2100
     * @tc.name testTypedUArraysSortPart1_021
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      expect(arr.sort()).assertEqual(0n);
      const val50 = arr[2];
      expect(val50 === 0n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_2200
     * @tc.name testTypedUArraysSortPart1_022
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 5n, 5n]);
      expect(arr.sort()).assertEqual(5n);
      const val52 = arr[2];
      expect(val52 === 5n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_2300
     * @tc.name testTypedUArraysSortPart1_023
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([2n, 1n]);
      expect(arr.sort()).assertEqual(1n);
      const val54 = arr[1];
      expect(val54 === 2n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_2400
     * @tc.name testTypedUArraysSortPart1_024
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 0n, 1n]);
      expect(arr.sort()).assertEqual(0n);
      const val56 = arr[1];
      expect(val56 === 1n).assertTrue();
      const val57 = arr[2];
      expect(val57 === 3n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_2500
     * @tc.name testTypedUArraysSortPart1_025
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      expect(arr.sort()).assertEqual(1n);
      const val59 = arr[4];
      expect(val59 === 5n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_2600
     * @tc.name testTypedUArraysSortPart1_026
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 4n, 3n, 2n, 1n]);
      expect(arr.sort()).assertEqual(1n);
      const val61 = arr[4];
      expect(val61 === 5n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_2700
     * @tc.name testTypedUArraysSortPart1_027
     * @tc.desc Verify sort compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      arr.sort();
      const val62 = arr[0] ;
      expect(val62 === 1).assertTrue();
      const val63 = arr[1] ;
      expect(val63 === 2).assertTrue();
      const val64 = arr[2] ;
      expect(val64 === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_2800
     * @tc.name testTypedUArraysSortPart1_028
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      arr.sort();
      const val65 = arr[0];
      expect(val65 === 1n).assertTrue();
      const val66 = arr[1];
      expect(val66 === 2n).assertTrue();
      const val67 = arr[2];
      expect(val67 === 3n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_2900
     * @tc.name testTypedUArraysSortPart1_029
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      arr.sort();
      const val68 = arr[0];
      expect(val68 === 3n).assertTrue();
      const val69 = arr[1];
      expect(val69 === 2n).assertTrue();
      const val70 = arr[2];
      expect(val70 === 1n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_3000
     * @tc.name testTypedUArraysSortPart1_030
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 0n, 1n]);
      arr.sort();
      const val71 = arr[0];
      expect(val71 === 0n).assertTrue();
      const val72 = arr[1];
      expect(val72 === 1n).assertTrue();
      const val73 = arr[2];
      expect(val73 === BigInt('18446744073709551615')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_3100
     * @tc.name testTypedUArraysSortPart1_031
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([9223372036854775807n, 0n, BigInt('18446744073709551615')]);
      arr.sort();
      const val74 = arr[0];
      expect(val74 === 0n).assertTrue();
      const val75 = arr[1];
      expect(val75 === 9223372036854775807n).assertTrue();
      const val76 = arr[2];
      expect(val76 === BigInt('18446744073709551615')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_3200
     * @tc.name testTypedUArraysSortPart1_032
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      arr.sort();
      expect(arr.length === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_3300
     * @tc.name testTypedUArraysSortPart1_033
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      arr.sort();
      const val77 = arr[0];
      expect(val77 === 42n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_3400
     * @tc.name testTypedUArraysSortPart1_034
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([2n, 1n]);
      arr.sort();
      const val78 = arr[0];
      expect(val78 === 1n).assertTrue();
      const val79 = arr[1];
      expect(val79 === 2n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_3500
     * @tc.name testTypedUArraysSortPart1_035
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 5n, 5n]);
      arr.sort();
      const val80 = arr[0];
      expect(val80 === 5n).assertTrue();
      const val81 = arr[2];
      expect(val81 === 5n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_3600
     * @tc.name testTypedUArraysSortPart1_036
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 0n, 1n]);
      arr.sort();
      const val82 = arr[0];
      expect(val82 === 0n).assertTrue();
      const val83 = arr[1];
      expect(val83 === 1n).assertTrue();
      const val84 = arr[2];
      expect(val84 === 3n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_3700
     * @tc.name testTypedUArraysSortPart1_037
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.sort();
      const val85 = arr[0];
      expect(val85 === 1n).assertTrue();
      const val86 = arr[4];
      expect(val86 === 5n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_3800
     * @tc.name testTypedUArraysSortPart1_038
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 4n, 3n, 2n, 1n]);
      arr.sort();
      const val87 = arr[0];
      expect(val87 === 1n).assertTrue();
      const val88 = arr[4];
      expect(val88 === 5n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_3900
     * @tc.name testTypedUArraysSortPart1_039
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(100);
      for (let i = 0; i < 100; i++) {
      }
      arr.sort();
      const val89 = arr[0];
      expect(val89 === 0n).assertTrue();
      const val90 = arr[99];
      expect(val90 === 99n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_4000
     * @tc.name testTypedUArraysSortPart1_040
     * @tc.desc Verify compareFunction a-b Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      arr.sort();
      const val91 = arr[0] ;
      expect(val91 === 1).assertTrue();
      const val92 = arr[1] ;
      expect(val92 === 2).assertTrue();
      const val93 = arr[2] ;
      expect(val93 === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_4100
     * @tc.name testTypedUArraysSortPart1_041
     * @tc.desc Verify compareFunction a-b Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      arr.sort();
      const val94 = arr[0] ;
      expect(val94 === 100).assertTrue();
      const val95 = arr[1] ;
      expect(val95 === 200).assertTrue();
      const val96 = arr[2] ;
      expect(val96 === 300).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_4200
     * @tc.name testTypedUArraysSortPart1_042
     * @tc.desc Verify compareFunction a-b Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000000000, 1000000000, 2000000000]);
      arr.sort();
      const val97 = arr[0] ;
      expect(val97 === 1000000000).assertTrue();
      const val98 = arr[1] ;
      expect(val98 === 2000000000).assertTrue();
      const val99 = arr[2] ;
      expect(val99 === 3000000000).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_4300
     * @tc.name testTypedUArraysSortPart1_043
     * @tc.desc Verify compareFunction a-b BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      arr.sort();
      const val100 = arr[0];
      expect(val100 === 1n).assertTrue();
      const val101 = arr[1];
      expect(val101 === 2n).assertTrue();
      const val102 = arr[2];
      expect(val102 === 3n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_4400
     * @tc.name testTypedUArraysSortPart1_044
     * @tc.desc Verify compareFunction b-a Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.sort();
      const val103 = arr[0] ;
      expect(val103 === 3).assertTrue();
      const val104 = arr[1] ;
      expect(val104 === 2).assertTrue();
      const val105 = arr[2] ;
      expect(val105 === 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_4500
     * @tc.name testTypedUArraysSortPart1_045
     * @tc.desc Verify compareFunction b-a Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      arr.sort();
      const val106 = arr[0] ;
      expect(val106 === 300).assertTrue();
      const val107 = arr[1] ;
      expect(val107 === 200).assertTrue();
      const val108 = arr[2] ;
      expect(val108 === 100).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_4600
     * @tc.name testTypedUArraysSortPart1_046
     * @tc.desc Verify compareFunction b-a BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      arr.sort();
      const val109 = arr[0];
      expect(val109 === 3n).assertTrue();
      const val110 = arr[1];
      expect(val110 === 2n).assertTrue();
      const val111 = arr[2];
      expect(val111 === 1n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_4700
     * @tc.name testTypedUArraysSortPart1_047
     * @tc.desc Verify toSorted Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted[0] === 1).assertTrue();
      expect(sorted[1] === 2).assertTrue();
      expect(sorted[2] === 3).assertTrue();
      expect(arr[0] === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_4800
     * @tc.name testTypedUArraysSortPart1_048
     * @tc.desc Verify toSorted Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const sorted = arr.toSorted();
      expect(sorted[0] === 100).assertTrue();
      expect(sorted[1] === 200).assertTrue();
      expect(sorted[2] === 300).assertTrue();
      expect(arr[0] === 300).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_4900
     * @tc.name testTypedUArraysSortPart1_049
     * @tc.desc Verify toSorted Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000000000, 1000000000, 2000000000]);
      const sorted = arr.toSorted();
      expect(sorted[0] === 1000000000).assertTrue();
      expect(sorted[1] === 2000000000).assertTrue();
      expect(sorted[2] === 3000000000).assertTrue();
      expect(arr[0] === 3000000000).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5000
     * @tc.name testTypedUArraysSortPart1_050
     * @tc.desc Verify toSorted Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted[0] === 1).assertTrue();
      expect(sorted[1] === 2).assertTrue();
      expect(sorted[2] === 3).assertTrue();
      expect(arr[0] === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5100
     * @tc.name testTypedUArraysSortPart1_051
     * @tc.desc Verify toSorted BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(1n);
      expect(sorted[1]).assertEqual(2n);
      expect(sorted[2]).assertEqual(3n);
      expect(arr[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5200
     * @tc.name testTypedUArraysSortPart1_052
     * @tc.desc Verify toSorted empty Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(0);
      expect(arr !== sorted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5300
     * @tc.name testTypedUArraysSortPart1_053
     * @tc.desc Verify toSorted BigUint64Array does not mutate original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 4n, 3n, 2n, 1n]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(1n);
      expect(sorted[4]).assertEqual(5n);
      expect(arr[0]).assertEqual(5n);
      expect(arr[4]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5400
     * @tc.name testTypedUArraysSortPart1_054
     * @tc.desc Verify toSorted Uint8Array with duplicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7]);
      const sorted = arr.toSorted();
      expect(sorted[0] === 7).assertTrue();
      expect(sorted[3] === 7).assertTrue();
      expect(arr[0] === 7).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5500
     * @tc.name testTypedUArraysSortPart1_055
     * @tc.desc Verify toSorted Uint8Array return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(arr !== sorted).assertTrue();
    });

  });
}
