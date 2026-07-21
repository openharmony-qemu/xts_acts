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

export default function typedUArraysSubarrayTest02(): void {
  describe('TypedUArraysSubarrayTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_0100
     * @tc.name testTypedUArraysSubarrayPart102_001
     * @tc.desc Verify end=0 begin=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const result = arr.subarray(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_0200
     * @tc.name testTypedUArraysSubarrayPart102_002
     * @tc.desc Verify end=0 begin=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      const result = arr.subarray(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_0300
     * @tc.name testTypedUArraysSubarrayPart102_003
     * @tc.desc Verify end=1 begin=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = arr.subarray(0, 1);
      expect(result.length).assertEqual(1);
      const val0 = result[0];
      expect(val0).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_0400
     * @tc.name testTypedUArraysSubarrayPart102_004
     * @tc.desc Verify end=1 begin=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      const result = arr.subarray(0, 1);
      expect(result.length).assertEqual(1);
      const val1 = result[0];
      expect(val1).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_0500
     * @tc.name testTypedUArraysSubarrayPart102_005
     * @tc.desc Verify end=0 begin=1 Uint8Array end begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(1, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_0600
     * @tc.name testTypedUArraysSubarrayPart102_006
     * @tc.desc Verify end=2 begin=3 Uint8Array end begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(3, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_0700
     * @tc.name testTypedUArraysSubarrayPart102_007
     * @tc.desc Verify end=2 begin=3 Uint16Array end begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(3, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_0800
     * @tc.name testTypedUArraysSubarrayPart102_008
     * @tc.desc Verify end=2 begin=3 BigUint64Array end begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const result = arr.subarray(3, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_0900
     * @tc.name testTypedUArraysSubarrayPart102_009
     * @tc.desc Verify begin=0 end=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_1000
     * @tc.name testTypedUArraysSubarrayPart102_010
     * @tc.desc Verify begin=0 end=0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_1100
     * @tc.name testTypedUArraysSubarrayPart102_011
     * @tc.desc Verify begin=0 end=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const result = arr.subarray(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_1200
     * @tc.name testTypedUArraysSubarrayPart102_012
     * @tc.desc Verify begin=2 end=2 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(2, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_1300
     * @tc.name testTypedUArraysSubarrayPart102_013
     * @tc.desc Verify begin=2 end=2 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(2, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_1400
     * @tc.name testTypedUArraysSubarrayPart102_014
     * @tc.desc Verify begin=-1 end=-1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-1, -1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_1500
     * @tc.name testTypedUArraysSubarrayPart102_015
     * @tc.desc Verify begin=-2 end=-1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-2, -1);
      expect(result.length).assertEqual(1);
      const val2 = result[0];
      expect(val2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_1600
     * @tc.name testTypedUArraysSubarrayPart102_016
     * @tc.desc Verify begin=-3 end=-1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-3, -1);
      expect(result.length).assertEqual(2);
      const val3 = result[0];
      expect(val3).assertEqual(3);
      const val4 = result[1];
      expect(val4).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_1700
     * @tc.name testTypedUArraysSubarrayPart102_017
     * @tc.desc Verify begin=-3 end=-1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-3, -1);
      expect(result.length).assertEqual(2);
      const val5 = result[0];
      expect(val5).assertEqual(3);
      const val6 = result[1];
      expect(val6).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_1800
     * @tc.name testTypedUArraysSubarrayPart102_018
     * @tc.desc Verify begin=-2 end=-1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const result = arr.subarray(-2, -1);
      expect(result.length).assertEqual(1);
      const val7 = result[0];
      expect(val7).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_1900
     * @tc.name testTypedUArraysSubarrayPart102_019
     * @tc.desc Verify begin=-5 end=-1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-5, -1);
      expect(result.length).assertEqual(4);
      const val8 = result[0];
      expect(val8).assertEqual(1);
      const val9 = result[3];
      expect(val9).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_2000
     * @tc.name testTypedUArraysSubarrayPart102_020
     * @tc.desc Verify begin=-1 end=-5 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-1, -5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_2100
     * @tc.name testTypedUArraysSubarrayPart102_021
     * @tc.desc Verify begin=-6 end=-1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-6, -1);
      expect(result.length).assertEqual(4);
      const val10 = result[0];
      expect(val10).assertEqual(1);
      const val11 = result[3];
      expect(val11).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_2200
     * @tc.name testTypedUArraysSubarrayPart102_022
     * @tc.desc Verify begin=0 end=-6 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0, -6);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_2300
     * @tc.name testTypedUArraysSubarrayPart102_023
     * @tc.desc Verify begin=-1 end=100 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(-1, 100);
      expect(result.length).assertEqual(1);
      const val12 = result[0];
      expect(val12).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_2400
     * @tc.name testTypedUArraysSubarrayPart102_024
     * @tc.desc Verify begin=100 end=-1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(100, -1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_2500
     * @tc.name testTypedUArraysSubarrayPart102_025
     * @tc.desc Verify begin=0 end=Number.MAX_SAFE_INTEGER Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.subarray(0, Number.MAX_SAFE_INTEGER.toInt());
      expect(result.length).assertEqual(3);
      const val13 = result[0];
      expect(val13).assertEqual(1);
      const val14 = result[2];
      expect(val14).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_2600
     * @tc.name testTypedUArraysSubarrayPart102_026
     * @tc.desc Verify begin=Number.MAX_SAFE_INTEGER end=Number.MAX_SAFE_INTEGER Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.subarray(Number.MAX_SAFE_INTEGER.toInt(), Number.MAX_SAFE_INTEGER.toInt());
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_2700
     * @tc.name testTypedUArraysSubarrayPart102_027
     * @tc.desc Verify begin=0 end=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = arr.subarray(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_2800
     * @tc.name testTypedUArraysSubarrayPart102_028
     * @tc.desc Verify begin=0 end=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      const result = arr.subarray(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_2900
     * @tc.name testTypedUArraysSubarrayPart102_029
     * @tc.desc Verify begin=1 end=1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = arr.subarray(1, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_3000
     * @tc.name testTypedUArraysSubarrayPart102_030
     * @tc.desc Verify begin=1 end=1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42]);
      const result = arr.subarray(1, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_3100
     * @tc.name testTypedUArraysSubarrayPart102_031
     * @tc.desc Verify begin=0 end=1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = arr.subarray(0, 1);
      expect(result.length).assertEqual(1);
      const val15 = result[0];
      expect(val15).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_3200
     * @tc.name testTypedUArraysSubarrayPart102_032
     * @tc.desc Verify begin=0 end=1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42]);
      const result = arr.subarray(0, 1);
      expect(result.length).assertEqual(1);
      const val16 = result[0];
      expect(val16).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_3300
     * @tc.name testTypedUArraysSubarrayPart102_033
     * @tc.desc Verify begin=-1 end=1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = arr.subarray(-1, 1);
      expect(result.length).assertEqual(1);
      const val17 = result[0];
      expect(val17).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_3400
     * @tc.name testTypedUArraysSubarrayPart102_034
     * @tc.desc Verify begin=-1 end=1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      const result = arr.subarray(-1, 1);
      expect(result.length).assertEqual(1);
      const val18 = result[0];
      expect(val18).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_3500
     * @tc.name testTypedUArraysSubarrayPart102_035
     * @tc.desc Verify end=0x01 begin=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0, 0x01);
      expect(result.length).assertEqual(1);
      const val19 = result[0];
      expect(val19).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_3600
     * @tc.name testTypedUArraysSubarrayPart102_036
     * @tc.desc Verify end=0x03 begin=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0, 0x03);
      expect(result.length).assertEqual(3);
      const val20 = result[0];
      expect(val20).assertEqual(1);
      const val21 = result[2];
      expect(val21).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_3700
     * @tc.name testTypedUArraysSubarrayPart102_037
     * @tc.desc Verify end=0x01 begin=0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0, 0x01);
      expect(result.length).assertEqual(1);
      const val22 = result[0];
      expect(val22).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_3800
     * @tc.name testTypedUArraysSubarrayPart102_038
     * @tc.desc Verify end=0x03 begin=0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0, 0x03);
      expect(result.length).assertEqual(3);
      const val23 = result[0];
      expect(val23).assertEqual(1);
      const val24 = result[2];
      expect(val24).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_3900
     * @tc.name testTypedUArraysSubarrayPart102_039
     * @tc.desc Verify end=0x01 begin=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const result = arr.subarray(0, 0x01);
      expect(result.length).assertEqual(1);
      const val25 = result[0];
      expect(val25).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_4000
     * @tc.name testTypedUArraysSubarrayPart102_040
     * @tc.desc Verify end=0x05 begin=0 Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0, 0x05);
      expect(result.length).assertEqual(5);
      const val26 = result[0];
      expect(val26).assertEqual(1);
      const val27 = result[4];
      expect(val27).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_4100
     * @tc.name testTypedUArraysSubarrayPart102_041
     * @tc.desc Verify end=0x06 begin=0 Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0, 0x06);
      expect(result.length).assertEqual(5);
      const val28 = result[0];
      expect(val28).assertEqual(1);
      const val29 = result[4];
      expect(val29).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_4200
     * @tc.name testTypedUArraysSubarrayPart102_042
     * @tc.desc Verify end=0x00 begin=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0, 0x00);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_4300
     * @tc.name testTypedUArraysSubarrayPart102_043
     * @tc.desc Verify end=0x01 begin=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = arr.subarray(0, 0x01);
      expect(result.length).assertEqual(1);
      const val30 = result[0];
      expect(val30).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_4400
     * @tc.name testTypedUArraysSubarrayPart102_044
     * @tc.desc Verify end=0x01 begin=0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42]);
      const result = arr.subarray(0, 0x01);
      expect(result.length).assertEqual(1);
      const val31 = result[0];
      expect(val31).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_4500
     * @tc.name testTypedUArraysSubarrayPart102_045
     * @tc.desc Verify end=0x00 begin=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = arr.subarray(0, 0x00);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_4600
     * @tc.name testTypedUArraysSubarrayPart102_046
     * @tc.desc Verify end=0x00 begin=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      const result = arr.subarray(0, 0x00);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_4700
     * @tc.name testTypedUArraysSubarrayPart102_047
     * @tc.desc Verify end=0x02 begin=0x01 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0x01, 0x02);
      expect(result.length).assertEqual(1);
      const val32 = result[0];
      expect(val32).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_4800
     * @tc.name testTypedUArraysSubarrayPart102_048
     * @tc.desc Verify end=0x04 begin=0x01 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0x01, 0x04);
      expect(result.length).assertEqual(3);
      const val33 = result[0];
      expect(val33).assertEqual(2);
      const val34 = result[2];
      expect(val34).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_4900
     * @tc.name testTypedUArraysSubarrayPart102_049
     * @tc.desc Verify end=0x02 begin=0x01 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const result = arr.subarray(0x01, 0x02);
      expect(result.length).assertEqual(1);
      const val35 = result[0];
      expect(val35).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_5000
     * @tc.name testTypedUArraysSubarrayPart102_050
     * @tc.desc Verify end=0x00 begin=0x01 Uint8Array end begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0x01, 0x00);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_5100
     * @tc.name testTypedUArraysSubarrayPart102_051
     * @tc.desc Verify end=0x02 begin=0x03 Uint8Array end begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0x03, 0x02);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_5200
     * @tc.name testTypedUArraysSubarrayPart102_052
     * @tc.desc Verify end=0x02 begin=0x03 Uint32Array end begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0x03, 0x02);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_5300
     * @tc.name testTypedUArraysSubarrayPart102_053
     * @tc.desc Verify end=0x00 begin=0x00 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0x00, 0x00);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_5400
     * @tc.name testTypedUArraysSubarrayPart102_054
     * @tc.desc Verify end=0x00 begin=0x00 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0x00, 0x00);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_5500
     * @tc.name testTypedUArraysSubarrayPart102_055
     * @tc.desc Verify end=0x00 begin=0x00 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const result = arr.subarray(0x00, 0x00);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_5600
     * @tc.name testTypedUArraysSubarrayPart102_056
     * @tc.desc Verify end=0x02 begin=0x02 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0x02, 0x02);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_5700
     * @tc.name testTypedUArraysSubarrayPart102_057
     * @tc.desc Verify end=0x02 begin=0x02 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0x02, 0x02);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_5800
     * @tc.name testTypedUArraysSubarrayPart102_058
     * @tc.desc Verify end=0x01 begin=0x00 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const result = arr.subarray(0x00, 0x01);
      expect(result.length).assertEqual(1);
      const val36 = result[0];
      expect(val36).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_5900
     * @tc.name testTypedUArraysSubarrayPart102_059
     * @tc.desc Verify end=0x01 begin=0x00 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42]);
      const result = arr.subarray(0x00, 0x01);
      expect(result.length).assertEqual(1);
      const val37 = result[0];
      expect(val37).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_6000
     * @tc.name testTypedUArraysSubarrayPart102_060
     * @tc.desc Verify end=0x01 begin=0xff Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0xff, 0x01);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_6100
     * @tc.name testTypedUArraysSubarrayPart102_061
     * @tc.desc Verify end=0xfe begin=0xff Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0xff, 0xfe);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_6200
     * @tc.name testTypedUArraysSubarrayPart102_062
     * @tc.desc Verify end=0xff begin=0x00 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0x00, 0xff);
      expect(result.length).assertEqual(5);
      const val38 = result[0];
      expect(val38).assertEqual(1);
      const val39 = result[3];
      expect(val39).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_6300
     * @tc.name testTypedUArraysSubarrayPart102_063
     * @tc.desc Verify end=0xfe begin=0x00 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const result = arr.subarray(0x00, 0xfe);
      expect(result.length).assertEqual(5);
      const val40 = result[0];
      expect(val40).assertEqual(1);
      const val41 = result[2];
      expect(val41).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_6400
     * @tc.name testTypedUArraysSubarrayPart102_064
     * @tc.desc Verify end=0xff begin=0x00 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const result = arr.subarray(0x00, 0xff);
      expect(result.length).assertEqual(5);
      const val42 = result[0];
      expect(val42).assertEqual(1n);
      const val43 = result[3];
      expect(val43).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_6500
     * @tc.name testTypedUArraysSubarrayPart102_065
     * @tc.desc Verify Uint8Array set from regular array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr.set([10, 20, 30]);
      const val44 = arr[0];
      expect(val44).assertEqual(10);
      const val45 = arr[1];
      expect(val45).assertEqual(20);
      const val46 = arr[2];
      expect(val46).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_6600
     * @tc.name testTypedUArraysSubarrayPart102_066
     * @tc.desc Verify Uint16Array set from regular array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(5);
      arr.set([10, 20, 30]);
      const val47 = arr[0];
      expect(val47).assertEqual(10);
      const val48 = arr[1];
      expect(val48).assertEqual(20);
      const val49 = arr[2];
      expect(val49).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_6700
     * @tc.name testTypedUArraysSubarrayPart102_067
     * @tc.desc Verify Uint32Array set from regular array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(5);
      arr.set([10, 20, 30]);
      const val50 = arr[0];
      expect(val50).assertEqual(10);
      const val51 = arr[1];
      expect(val51).assertEqual(20);
      const val52 = arr[2];
      expect(val52).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_6800
     * @tc.name testTypedUArraysSubarrayPart102_068
     * @tc.desc Verify Uint8ClampedArray set from regular array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      arr.set([10, 20, 30]);
      const val53 = arr[0];
      expect(val53).assertEqual(10);
      const val54 = arr[1];
      expect(val54).assertEqual(20);
      const val55 = arr[2];
      expect(val55).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_6900
     * @tc.name testTypedUArraysSubarrayPart102_069
     * @tc.desc Verify BigUint64Array set from regular array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(5);
      arr.set([10n, 20n, 30n]);
      const val56 = arr[0];
      expect(val56).assertEqual(10n);
      const val57 = arr[1];
      expect(val57).assertEqual(20n);
      const val58 = arr[2];
      expect(val58).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_7000
     * @tc.name testTypedUArraysSubarrayPart102_070
     * @tc.desc Verify Uint8Array set with offset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.set([10, 20], 2);
      const val59 = arr[0];
      expect(val59).assertEqual(1);
      const val60 = arr[1];
      expect(val60).assertEqual(2);
      const val61 = arr[2];
      expect(val61).assertEqual(10);
      const val62 = arr[3];
      expect(val62).assertEqual(20);
      const val63 = arr[4];
      expect(val63).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_7100
     * @tc.name testTypedUArraysSubarrayPart102_071
     * @tc.desc Verify Uint16Array set with offset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(5);
      arr.set([10, 20], 1);
      const val64 = arr[0];
      expect(val64).assertEqual(0);
      const val65 = arr[1];
      expect(val65).assertEqual(10);
      const val66 = arr[2];
      expect(val66).assertEqual(20);
      const val67 = arr[3];
      expect(val67).assertEqual(0);
      const val68 = arr[4];
      expect(val68).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_7200
     * @tc.name testTypedUArraysSubarrayPart102_072
     * @tc.desc Verify BigUint64Array set with offset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(5);
      arr.set([10n, 20n], 1);
      const val69 = arr[0];
      expect(val69).assertEqual(0n);
      const val70 = arr[1];
      expect(val70).assertEqual(10n);
      const val71 = arr[2];
      expect(val71).assertEqual(20n);
      const val72 = arr[3];
      expect(val72).assertEqual(0n);
      const val73 = arr[4];
      expect(val73).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_7300
     * @tc.name testTypedUArraysSubarrayPart102_073
     * @tc.desc Verify Uint8Array copyWithin target 0 start 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2);
      const val74 = arr[0];
      expect(val74).assertEqual(3);
      const val75 = arr[1];
      expect(val75).assertEqual(4);
      const val76 = arr[2];
      expect(val76).assertEqual(5);
      const val77 = arr[3];
      expect(val77).assertEqual(4);
      const val78 = arr[4];
      expect(val78).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_7400
     * @tc.name testTypedUArraysSubarrayPart102_074
     * @tc.desc Verify Uint16Array copyWithin target 2 start 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      arr.copyWithin(2, 0);
      const val79 = arr[0];
      expect(val79).assertEqual(1);
      const val80 = arr[1];
      expect(val80).assertEqual(2);
      const val81 = arr[2];
      expect(val81).assertEqual(1);
      const val82 = arr[3];
      expect(val82).assertEqual(2);
      const val83 = arr[4];
      expect(val83).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_7500
     * @tc.name testTypedUArraysSubarrayPart102_075
     * @tc.desc Verify BigUint64Array copyWithin target 0 start 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(0, 2);
      const val84 = arr[0];
      expect(val84).assertEqual(3n);
      const val85 = arr[1];
      expect(val85).assertEqual(4n);
      const val86 = arr[2];
      expect(val86).assertEqual(5n);
      const val87 = arr[3];
      expect(val87).assertEqual(4n);
      const val88 = arr[4];
      expect(val88).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_7600
     * @tc.name testTypedUArraysSubarrayPart102_076
     * @tc.desc Verify Uint8Array fill with 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr.fill(9);
      const val89 = arr[0];
      expect(val89).assertEqual(9);
      const val90 = arr[4];
      expect(val90).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_7700
     * @tc.name testTypedUArraysSubarrayPart102_077
     * @tc.desc Verify Uint16Array fill with 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(5);
      arr.fill(42);
      const val91 = arr[0];
      expect(val91).assertEqual(42);
      const val92 = arr[4];
      expect(val92).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_7800
     * @tc.name testTypedUArraysSubarrayPart102_078
     * @tc.desc Verify Uint32Array fill with 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(5);
      arr.fill(999);
      const val93 = arr[0];
      expect(val93).assertEqual(999);
      const val94 = arr[4];
      expect(val94).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_7900
     * @tc.name testTypedUArraysSubarrayPart102_079
     * @tc.desc Verify Uint8ClampedArray fill with 300 clamp to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      arr.fill(300);
      const val95 = arr[0];
      expect(val95).assertEqual(255);
      const val96 = arr[4];
      expect(val96).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_8000
     * @tc.name testTypedUArraysSubarrayPart102_080
     * @tc.desc Verify BigUint64Array fill with 99n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(5);
      arr.fill(99n);
      const val97 = arr[0];
      expect(val97).assertEqual(99n);
      const val98 = arr[4];
      expect(val98).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_8100
     * @tc.name testTypedUArraysSubarrayPart102_081
     * @tc.desc Verify Uint8Array fill 7 from index 1 to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.fill(7, 1, 3);
      const val99 = arr[0];
      expect(val99).assertEqual(1);
      const val100 = arr[1];
      expect(val100).assertEqual(7);
      const val101 = arr[2];
      expect(val101).assertEqual(7);
      const val102 = arr[3];
      expect(val102).assertEqual(4);
      const val103 = arr[4];
      expect(val103).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART102_8200
     * @tc.name testTypedUArraysSubarrayPart102_082
     * @tc.desc Verify BigUint64Array fill 100n from index 0 to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart102_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.fill(100n, 0, 2);
      const val104 = arr[0];
      expect(val104).assertEqual(100n);
      const val105 = arr[1];
      expect(val105).assertEqual(100n);
      const val106 = arr[2];
      expect(val106).assertEqual(3n);
      const val107 = arr[3];
      expect(val107).assertEqual(4n);
      const val108 = arr[4];
      expect(val108).assertEqual(5n);
    });

  });
}
