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

export default function typedUArraysSubarrayTest01(): void {
  describe('TypedUArraysSubarrayTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_0100
     * @tc.name testTypedUArraysSubarrayPart101_001
     * @tc.desc Verify subarray 0 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray();
      expect(result.length).assertEqual(5);
      const val0 = result[0];
      expect(val0).assertEqual(1);
      const val1 = result[4];
      expect(val1).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_0200
     * @tc.name testTypedUArraysSubarrayPart101_002
     * @tc.desc Verify subarray 0 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = arr.subarray();
      expect(result.length).assertEqual(5);
      const val2 = result[0];
      expect(val2).assertEqual(1);
      const val3 = result[4];
      expect(val3).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_0300
     * @tc.name testTypedUArraysSubarrayPart101_003
     * @tc.desc Verify subarray 0 - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const result = arr.subarray();
      expect(result.length).assertEqual(5);
      const val4 = result[0];
      expect(val4).assertEqual(1);
      const val5 = result[4];
      expect(val5).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_0400
     * @tc.name testTypedUArraysSubarrayPart101_004
     * @tc.desc Verify subarray 0 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const result = arr.subarray();
      expect(result.length).assertEqual(5);
      const val6 = result[0];
      expect(val6).assertEqual(1);
      const val7 = result[4];
      expect(val7).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_0500
     * @tc.name testTypedUArraysSubarrayPart101_005
     * @tc.desc Verify subarray 0 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const result = arr.subarray();
      expect(result.length).assertEqual(5);
      const val8 = result[0];
      expect(val8).assertEqual(1n);
      const val9 = result[4];
      expect(val9).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_0600
     * @tc.name testTypedUArraysSubarrayPart101_006
     * @tc.desc Verify subarray 1 - begin=2 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(2);
      expect(result.length).assertEqual(3);
      const val10 = result[0];
      expect(val10).assertEqual(3);
      const val11 = result[2];
      expect(val11).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_0700
     * @tc.name testTypedUArraysSubarrayPart101_007
     * @tc.desc Verify subarray 1 - begin=2 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(2);
      expect(result.length).assertEqual(3);
      const val12 = result[0];
      expect(val12).assertEqual(3);
      const val13 = result[2];
      expect(val13).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_0800
     * @tc.name testTypedUArraysSubarrayPart101_008
     * @tc.desc Verify subarray 1 - begin=2 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(2);
      expect(result.length).assertEqual(3);
      const val14 = result[0];
      expect(val14).assertEqual(3);
      const val15 = result[2];
      expect(val15).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_0900
     * @tc.name testTypedUArraysSubarrayPart101_009
     * @tc.desc Verify subarray 1 - begin=2 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const result = arr.subarray(2);
      expect(result.length).assertEqual(3);
      const val16 = result[0];
      expect(val16).assertEqual(3);
      const val17 = result[2];
      expect(val17).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_1000
     * @tc.name testTypedUArraysSubarrayPart101_010
     * @tc.desc Verify subarray 1 - begin=2 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const result = arr.subarray(2);
      expect(result.length).assertEqual(3);
      const val18 = result[0];
      expect(val18).assertEqual(3n);
      const val19 = result[2];
      expect(val19).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_1100
     * @tc.name testTypedUArraysSubarrayPart101_011
     * @tc.desc Verify subarray 2 - begin=1 end=4 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(1, 4);
      expect(result.length).assertEqual(3);
      const val20 = result[0];
      expect(val20).assertEqual(2);
      const val21 = result[2];
      expect(val21).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_1200
     * @tc.name testTypedUArraysSubarrayPart101_012
     * @tc.desc Verify subarray 2 - begin=1 end=4 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(1, 4);
      expect(result.length).assertEqual(3);
      const val22 = result[0];
      expect(val22).assertEqual(2);
      const val23 = result[2];
      expect(val23).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_1300
     * @tc.name testTypedUArraysSubarrayPart101_013
     * @tc.desc Verify subarray 2 - begin=1 end=4 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(1, 4);
      expect(result.length).assertEqual(3);
      const val24 = result[0];
      expect(val24).assertEqual(2);
      const val25 = result[2];
      expect(val25).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_1400
     * @tc.name testTypedUArraysSubarrayPart101_014
     * @tc.desc Verify subarray 2 - begin=1 end=4 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const result = arr.subarray(1, 4);
      expect(result.length).assertEqual(3);
      const val26 = result[0];
      expect(val26).assertEqual(2);
      const val27 = result[2];
      expect(val27).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_1500
     * @tc.name testTypedUArraysSubarrayPart101_015
     * @tc.desc Verify subarray 2 - begin=1 end=4 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const result = arr.subarray(1, 4);
      expect(result.length).assertEqual(3);
      const val28 = result[0];
      expect(val28).assertEqual(2n);
      const val29 = result[2];
      expect(val29).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_1600
     * @tc.name testTypedUArraysSubarrayPart101_016
     * @tc.desc Verify begin=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0);
      expect(result.length).assertEqual(5);
      const val30 = result[0];
      expect(val30).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_1700
     * @tc.name testTypedUArraysSubarrayPart101_017
     * @tc.desc Verify begin=1 Uint8Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(1);
      expect(result.length).assertEqual(4);
      const val31 = result[0];
      expect(val31).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_1800
     * @tc.name testTypedUArraysSubarrayPart101_018
     * @tc.desc Verify begin=2 Uint8Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(2);
      expect(result.length).assertEqual(3);
      const val32 = result[0];
      expect(val32).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_1900
     * @tc.name testTypedUArraysSubarrayPart101_019
     * @tc.desc Verify begin=3 Uint8Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(3);
      expect(result.length).assertEqual(2);
      const val33 = result[0];
      expect(val33).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_2000
     * @tc.name testTypedUArraysSubarrayPart101_020
     * @tc.desc Verify begin=4 Uint8Array 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(4);
      expect(result.length).assertEqual(1);
      const val34 = result[0];
      expect(val34).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_2100
     * @tc.name testTypedUArraysSubarrayPart101_021
     * @tc.desc Verify begin=0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0);
      expect(result.length).assertEqual(5);
      const val35 = result[0];
      expect(val35).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_2200
     * @tc.name testTypedUArraysSubarrayPart101_022
     * @tc.desc Verify begin=2 Uint16Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(2);
      expect(result.length).assertEqual(3);
      const val36 = result[0];
      expect(val36).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_2300
     * @tc.name testTypedUArraysSubarrayPart101_023
     * @tc.desc Verify begin=0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0);
      expect(result.length).assertEqual(5);
      const val37 = result[0];
      expect(val37).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_2400
     * @tc.name testTypedUArraysSubarrayPart101_024
     * @tc.desc Verify begin=2 Uint32Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(2);
      expect(result.length).assertEqual(3);
      const val38 = result[0];
      expect(val38).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_2500
     * @tc.name testTypedUArraysSubarrayPart101_025
     * @tc.desc Verify begin=0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const result = arr.subarray(0);
      expect(result.length).assertEqual(5);
      const val39 = result[0];
      expect(val39).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_2600
     * @tc.name testTypedUArraysSubarrayPart101_026
     * @tc.desc Verify begin=2 Uint8ClampedArray 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const result = arr.subarray(2);
      expect(result.length).assertEqual(3);
      const val40 = result[0];
      expect(val40).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_2700
     * @tc.name testTypedUArraysSubarrayPart101_027
     * @tc.desc Verify begin=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const result = arr.subarray(0);
      expect(result.length).assertEqual(5);
      const val41 = result[0];
      expect(val41).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_2800
     * @tc.name testTypedUArraysSubarrayPart101_028
     * @tc.desc Verify begin=2 BigUint64Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const result = arr.subarray(2);
      expect(result.length).assertEqual(3);
      const val42 = result[0];
      expect(val42).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_2900
     * @tc.name testTypedUArraysSubarrayPart101_029
     * @tc.desc Verify begin=-1 Uint8Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-1);
      expect(result.length).assertEqual(1);
      const val43 = result[0];
      expect(val43).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_3000
     * @tc.name testTypedUArraysSubarrayPart101_030
     * @tc.desc Verify begin=-2 Uint8Array length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-2);
      expect(result.length).assertEqual(2);
      const val44 = result[0];
      expect(val44).assertEqual(4);
      const val45 = result[1];
      expect(val45).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_3100
     * @tc.name testTypedUArraysSubarrayPart101_031
     * @tc.desc Verify begin=-3 Uint8Array length-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-3);
      expect(result.length).assertEqual(3);
      const val46 = result[0];
      expect(val46).assertEqual(3);
      const val47 = result[2];
      expect(val47).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_3200
     * @tc.name testTypedUArraysSubarrayPart101_032
     * @tc.desc Verify begin=-5 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-5);
      expect(result.length).assertEqual(5);
      const val48 = result[0];
      expect(val48).assertEqual(1);
      const val49 = result[4];
      expect(val49).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_3300
     * @tc.name testTypedUArraysSubarrayPart101_033
     * @tc.desc Verify begin=-6 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-6);
      expect(result.length).assertEqual(5);
      const val50 = result[0];
      expect(val50).assertEqual(1);
      const val51 = result[4];
      expect(val51).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_3400
     * @tc.name testTypedUArraysSubarrayPart101_034
     * @tc.desc Verify begin=-1 Uint16Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-1);
      expect(result.length).assertEqual(1);
      const val52 = result[0];
      expect(val52).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_3500
     * @tc.name testTypedUArraysSubarrayPart101_035
     * @tc.desc Verify begin=-2 Uint16Array length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-2);
      expect(result.length).assertEqual(2);
      const val53 = result[0];
      expect(val53).assertEqual(4);
      const val54 = result[1];
      expect(val54).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_3600
     * @tc.name testTypedUArraysSubarrayPart101_036
     * @tc.desc Verify begin=-1 Uint32Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-1);
      expect(result.length).assertEqual(1);
      const val55 = result[0];
      expect(val55).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_3700
     * @tc.name testTypedUArraysSubarrayPart101_037
     * @tc.desc Verify begin=-1 BigUint64Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const result = arr.subarray(-1);
      expect(result.length).assertEqual(1);
      const val56 = result[0];
      expect(val56).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_3800
     * @tc.name testTypedUArraysSubarrayPart101_038
     * @tc.desc Verify begin=-2 BigUint64Array length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const result = arr.subarray(-2);
      expect(result.length).assertEqual(2);
      const val57 = result[0];
      expect(val57).assertEqual(4n);
      const val58 = result[1];
      expect(val58).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_3900
     * @tc.name testTypedUArraysSubarrayPart101_039
     * @tc.desc Verify begin=length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_4000
     * @tc.name testTypedUArraysSubarrayPart101_040
     * @tc.desc Verify begin=length+1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(6);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_4100
     * @tc.name testTypedUArraysSubarrayPart101_041
     * @tc.desc Verify begin=100 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.subarray(100);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_4200
     * @tc.name testTypedUArraysSubarrayPart101_042
     * @tc.desc Verify begin=Number.MAX_SAFE_INTEGER Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.subarray(Number.MAX_SAFE_INTEGER.toInt());
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_4300
     * @tc.name testTypedUArraysSubarrayPart101_043
     * @tc.desc Verify begin=length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_4400
     * @tc.name testTypedUArraysSubarrayPart101_044
     * @tc.desc Verify begin=length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_4500
     * @tc.name testTypedUArraysSubarrayPart101_045
     * @tc.desc Verify begin=length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const result = arr.subarray(5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_4600
     * @tc.name testTypedUArraysSubarrayPart101_046
     * @tc.desc Verify begin=length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const result = arr.subarray(5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_4700
     * @tc.name testTypedUArraysSubarrayPart101_047
     * @tc.desc Verify begin=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const result = arr.subarray(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_4800
     * @tc.name testTypedUArraysSubarrayPart101_048
     * @tc.desc Verify begin=0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      const result = arr.subarray(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_4900
     * @tc.name testTypedUArraysSubarrayPart101_049
     * @tc.desc Verify begin=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      const result = arr.subarray(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_5000
     * @tc.name testTypedUArraysSubarrayPart101_050
     * @tc.desc Verify begin=1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const result = arr.subarray(1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_5100
     * @tc.name testTypedUArraysSubarrayPart101_051
     * @tc.desc Verify new Uint8Array(length) construction - length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      expect(arr.length).assertEqual(3);
      const val0 = arr[0];
      expect(val0).assertEqual(0);
      const val1 = arr[1];
      expect(val1).assertEqual(0);
      const val2 = arr[2];
      expect(val2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_5200
     * @tc.name testTypedUArraysSubarrayPart101_052
     * @tc.desc Verify new Uint16Array(length) construction - length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_5300
     * @tc.name testTypedUArraysSubarrayPart101_053
     * @tc.desc Verify new Uint32Array(length) construction - length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_5400
     * @tc.name testTypedUArraysSubarrayPart101_054
     * @tc.desc Verify new Uint8ClampedArray(length) construction - length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_5500
     * @tc.name testTypedUArraysSubarrayPart101_055
     * @tc.desc Verify new BigUint64Array(length) construction - length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_5600
     * @tc.name testTypedUArraysSubarrayPart101_056
     * @tc.desc Verify new Uint8Array(typedArray) construction - same type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(3);
      const val0 = arr[0];
      expect(val0).assertEqual(1);
      const val1 = arr[1];
      expect(val1).assertEqual(2);
      const val2 = arr[2];
      expect(val2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_5700
     * @tc.name testTypedUArraysSubarrayPart101_057
     * @tc.desc Verify new Uint16Array(typedArray) construction - same type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3]);
      const arr = new Uint16Array(src);
      expect(arr.length).assertEqual(3);
      const val0 = arr[0];
      expect(val0).assertEqual(1);
      const val1 = arr[1];
      expect(val1).assertEqual(2);
      const val2 = arr[2];
      expect(val2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_5800
     * @tc.name testTypedUArraysSubarrayPart101_058
     * @tc.desc Verify new BigUint64Array(typedArray) construction - same type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      const arr = new BigUint64Array(src);
      expect(arr.length).assertEqual(3);
      const val0 = arr[0];
      expect(val0).assertEqual(1n);
      const val1 = arr[1];
      expect(val1).assertEqual(2n);
      const val2 = arr[2];
      expect(val2).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_5900
     * @tc.name testTypedUArraysSubarrayPart101_059
     * @tc.desc Verify new Uint8Array(ArrayBuffer) construction - length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const arr = new Uint8Array(buf);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_6000
     * @tc.name testTypedUArraysSubarrayPart101_060
     * @tc.desc Verify new Uint16Array(ArrayBuffer) construction - length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint16Array(buf);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_6100
     * @tc.name testTypedUArraysSubarrayPart101_061
     * @tc.desc Verify Uint8Array.BYTES_PER_ELEMENT = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_6200
     * @tc.name testTypedUArraysSubarrayPart101_062
     * @tc.desc Verify Uint16Array.BYTES_PER_ELEMENT = 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_6300
     * @tc.name testTypedUArraysSubarrayPart101_063
     * @tc.desc Verify Uint32Array.BYTES_PER_ELEMENT = 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_6400
     * @tc.name testTypedUArraysSubarrayPart101_064
     * @tc.desc Verify Uint8ClampedArray.BYTES_PER_ELEMENT = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_6500
     * @tc.name testTypedUArraysSubarrayPart101_065
     * @tc.desc Verify BigUint64Array.BYTES_PER_ELEMENT = 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_6600
     * @tc.name testTypedUArraysSubarrayPart101_066
     * @tc.desc Verify Uint8Array length property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART101_6700
     * @tc.name testTypedUArraysSubarrayPart101_067
     * @tc.desc Verify BigUint64Array length property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart101_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(5);
      expect(arr.length).assertEqual(5);
    });

  });
}
