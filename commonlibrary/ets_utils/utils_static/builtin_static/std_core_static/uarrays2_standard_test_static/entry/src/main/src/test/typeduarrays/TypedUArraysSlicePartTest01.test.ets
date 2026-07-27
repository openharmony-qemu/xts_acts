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

export default function typedUArraysSlicePartTest01(): void {
  describe('TypedUArraysSlicePartTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_0100
     * @tc.name testTypedUArraysSlicePart101_001
     * @tc.desc Verify slice 0 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val1 = result[0];
      expect(val1).assertEqual(1);
      const val2 = result[4];
      expect(val2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_0200
     * @tc.name testTypedUArraysSlicePart101_002
     * @tc.desc Verify slice 0 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val3 = result[0];
      expect(val3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_0300
     * @tc.name testTypedUArraysSlicePart101_003
     * @tc.desc Verify slice 0 - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val4 = result[0];
      expect(val4).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_0400
     * @tc.name testTypedUArraysSlicePart101_004
     * @tc.desc Verify slice 0 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val5 = result[0];
      expect(val5).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_0500
     * @tc.name testTypedUArraysSlicePart101_005
     * @tc.desc Verify slice 0 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val6 = result[0];
      expect(val6).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_0600
     * @tc.name testTypedUArraysSlicePart101_006
     * @tc.desc Verify slice - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice();
      expect(result.length).assertEqual(5);
      const val7 = result[0];
      expect(val7).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_0700
     * @tc.name testTypedUArraysSlicePart101_007
     * @tc.desc Verify slice - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice();
      expect(result.length).assertEqual(5);
      const val8 = result[0];
      expect(val8).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_0800
     * @tc.name testTypedUArraysSlicePart101_008
     * @tc.desc Verify slice - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice();
      expect(result.length).assertEqual(5);
      const val9 = result[0];
      expect(val9).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_0900
     * @tc.name testTypedUArraysSlicePart101_009
     * @tc.desc Verify slice - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice();
      expect(result.length).assertEqual(5);
      const val10 = result[0];
      expect(val10).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_1000
     * @tc.name testTypedUArraysSlicePart101_010
     * @tc.desc Verify slice - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice();
      expect(result.length).assertEqual(5);
      const val11 = result[0];
      expect(val11).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_1100
     * @tc.name testTypedUArraysSlicePart101_011
     * @tc.desc Verify slice 1 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1);
      expect(result.length).assertEqual(4);
      const val12 = result[0];
      expect(val12).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_1200
     * @tc.name testTypedUArraysSlicePart101_012
     * @tc.desc Verify slice 1 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1);
      expect(result.length).assertEqual(4);
      const val13 = result[0];
      expect(val13).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_1300
     * @tc.name testTypedUArraysSlicePart101_013
     * @tc.desc Verify slice 1 - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1);
      expect(result.length).assertEqual(4);
      const val14 = result[0];
      expect(val14).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_1400
     * @tc.name testTypedUArraysSlicePart101_014
     * @tc.desc Verify slice 1 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(1);
      expect(result.length).assertEqual(4);
      const val15 = result[0];
      expect(val15).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_1500
     * @tc.name testTypedUArraysSlicePart101_015
     * @tc.desc Verify slice 1 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(1);
      expect(result.length).assertEqual(4);
      const val16 = result[0];
      expect(val16).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_1600
     * @tc.name testTypedUArraysSlicePart101_016
     * @tc.desc Verify slice 0 empty Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.slice(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_1700
     * @tc.name testTypedUArraysSlicePart101_017
     * @tc.desc Verify slice 0 empty Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      let result = arr.slice(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_1800
     * @tc.name testTypedUArraysSlicePart101_018
     * @tc.desc Verify slice 0 empty Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let result = arr.slice(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_1900
     * @tc.name testTypedUArraysSlicePart101_019
     * @tc.desc Verify slice empty Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.slice();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_2000
     * @tc.name testTypedUArraysSlicePart101_020
     * @tc.desc Verify slice empty BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      let result = arr.slice();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_2100
     * @tc.name testTypedUArraysSlicePart101_021
     * @tc.desc Verify slice -1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      const val17 = result[0];
      expect(val17).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_2200
     * @tc.name testTypedUArraysSlicePart101_022
     * @tc.desc Verify slice -1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      const val18 = result[0];
      expect(val18).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_2300
     * @tc.name testTypedUArraysSlicePart101_023
     * @tc.desc Verify slice -1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      const val19 = result[0];
      expect(val19).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_2400
     * @tc.name testTypedUArraysSlicePart101_024
     * @tc.desc Verify slice -1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      const val20 = result[0];
      expect(val20).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_2500
     * @tc.name testTypedUArraysSlicePart101_025
     * @tc.desc Verify slice -1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      const val21 = result[0];
      expect(val21).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_2600
     * @tc.name testTypedUArraysSlicePart101_026
     * @tc.desc Verify slice 0 3 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val22 = result[0];
      expect(val22).assertEqual(1);
      const val23 = result[2];
      expect(val23).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_2700
     * @tc.name testTypedUArraysSlicePart101_027
     * @tc.desc Verify slice 0 3 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val24 = result[0];
      expect(val24).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_2800
     * @tc.name testTypedUArraysSlicePart101_028
     * @tc.desc Verify slice 0 3 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val25 = result[0];
      expect(val25).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_2900
     * @tc.name testTypedUArraysSlicePart101_029
     * @tc.desc Verify slice 0 3 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val26 = result[0];
      expect(val26).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_3000
     * @tc.name testTypedUArraysSlicePart101_030
     * @tc.desc Verify slice 0 3 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val27 = result[0];
      expect(val27).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_3100
     * @tc.name testTypedUArraysSlicePart101_031
     * @tc.desc Verify slice 1 4 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      const val28 = result[0];
      expect(val28).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_3200
     * @tc.name testTypedUArraysSlicePart101_032
     * @tc.desc Verify slice 1 4 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      const val29 = result[0];
      expect(val29).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_3300
     * @tc.name testTypedUArraysSlicePart101_033
     * @tc.desc Verify slice 1 4 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      const val30 = result[0];
      expect(val30).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_3400
     * @tc.name testTypedUArraysSlicePart101_034
     * @tc.desc Verify slice 1 4 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      const val31 = result[0];
      expect(val31).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_3500
     * @tc.name testTypedUArraysSlicePart101_035
     * @tc.desc Verify slice 1 4 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      const val32 = result[0];
      expect(val32).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_3600
     * @tc.name testTypedUArraysSlicePart101_036
     * @tc.desc Verify slice -2 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-2);
      expect(result.length).assertEqual(2);
      const val33 = result[0];
      expect(val33).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_3700
     * @tc.name testTypedUArraysSlicePart101_037
     * @tc.desc Verify slice -2 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-2);
      expect(result.length).assertEqual(2);
      const val34 = result[0];
      expect(val34).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_3800
     * @tc.name testTypedUArraysSlicePart101_038
     * @tc.desc Verify slice -2 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-2);
      expect(result.length).assertEqual(2);
      const val35 = result[0];
      expect(val35).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_3900
     * @tc.name testTypedUArraysSlicePart101_039
     * @tc.desc Verify slice -2 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(-2);
      expect(result.length).assertEqual(2);
      const val36 = result[0];
      expect(val36).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_4000
     * @tc.name testTypedUArraysSlicePart101_040
     * @tc.desc Verify slice -2 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(-2);
      expect(result.length).assertEqual(2);
      const val37 = result[0];
      expect(val37).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_4100
     * @tc.name testTypedUArraysSlicePart101_041
     * @tc.desc Verify slice -3 -1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-3, -1);
      expect(result.length).assertEqual(2);
      const val38 = result[0];
      expect(val38).assertEqual(3);
      const val39 = result[1];
      expect(val39).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_4200
     * @tc.name testTypedUArraysSlicePart101_042
     * @tc.desc Verify slice -3 -1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-3, -1);
      expect(result.length).assertEqual(2);
      const val40 = result[0];
      expect(val40).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_4300
     * @tc.name testTypedUArraysSlicePart101_043
     * @tc.desc Verify slice -3 -1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(-3, -1);
      expect(result.length).assertEqual(2);
      const val41 = result[0];
      expect(val41).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_4400
     * @tc.name testTypedUArraysSlicePart101_044
     * @tc.desc Verify slice 1 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_4500
     * @tc.name testTypedUArraysSlicePart101_045
     * @tc.desc Verify slice 1 1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_4600
     * @tc.name testTypedUArraysSlicePart101_046
     * @tc.desc Verify slice 1 1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(1, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_4700
     * @tc.name testTypedUArraysSlicePart101_047
     * @tc.desc Verify slice 1 0 Uint32Array end start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_4800
     * @tc.name testTypedUArraysSlicePart101_048
     * @tc.desc Verify slice 1 0 Uint8ClampedArray end start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_4900
     * @tc.name testTypedUArraysSlicePart101_049
     * @tc.desc Verify slice 100 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.slice(100);
      expect(result.length).assertEqual(0);
    });
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_5000
     * @tc.name testTypedUArraysSlicePart101_050
     * @tc.desc Verify start=0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      let result = arr.slice(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_5100
     * @tc.name testTypedUArraysSlicePart101_051
     * @tc.desc Verify start=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      let result = arr.slice(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_5200
     * @tc.name testTypedUArraysSlicePart101_052
     * @tc.desc Verify end=1 start=0 Uint8Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val62 = result[0];
      expect(val62).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_5300
     * @tc.name testTypedUArraysSlicePart101_053
     * @tc.desc Verify end=2 start=0 Uint8Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 2);
      expect(result.length).assertEqual(2);
      const val63 = result[0];
      expect(val63).assertEqual(1);
      const val64 = result[1];
      expect(val64).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_5400

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_5500
     * @tc.name testTypedUArraysSlicePart101_055
     * @tc.desc Verify end=5 start=0 Uint8Array 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 5);
      expect(result.length).assertEqual(5);
      const val67 = result[0];
      expect(val67).assertEqual(1);
      const val68 = result[4];
      expect(val68).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_5600
     * @tc.name testTypedUArraysSlicePart101_056
     * @tc.desc Verify end=0 start=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_5700
     * @tc.name testTypedUArraysSlicePart101_057
     * @tc.desc Verify end=1 start=0 Uint16Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val69 = result[0];
      expect(val69).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_5800
     * @tc.name testTypedUArraysSlicePart101_058
     * @tc.desc Verify end=3 start=0 Uint16Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val70 = result[0];
      expect(val70).assertEqual(1);
      const val71 = result[2];
      expect(val71).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_5900
     * @tc.name testTypedUArraysSlicePart101_059
     * @tc.desc Verify end=1 start=0 Uint32Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val72 = result[0];
      expect(val72).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_6000
     * @tc.name testTypedUArraysSlicePart101_060
     * @tc.desc Verify end=3 start=0 Uint32Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val73 = result[0];
      expect(val73).assertEqual(1);
      const val74 = result[2];
      expect(val74).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_6100
     * @tc.name testTypedUArraysSlicePart101_061
     * @tc.desc Verify end=1 start=0 Uint8ClampedArray 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val75 = result[0];
      expect(val75).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_6200
     * @tc.name testTypedUArraysSlicePart101_062
     * @tc.desc Verify end=3 start=0 Uint8ClampedArray 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val76 = result[0];
      expect(val76).assertEqual(1);
      const val77 = result[2];
      expect(val77).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_6300
     * @tc.name testTypedUArraysSlicePart101_063
     * @tc.desc Verify end=1 start=0 BigUint64Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val78 = result[0];
      expect(val78).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_6400
     * @tc.name testTypedUArraysSlicePart101_064
     * @tc.desc Verify end=3 start=0 BigUint64Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val79 = result[0];
      expect(val79).assertEqual(1n);
      const val80 = result[2];
      expect(val80).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_6500
     * @tc.name testTypedUArraysSlicePart101_065
     * @tc.desc Verify end=-1 start=0 Uint8Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -1);
      expect(result.length).assertEqual(4);
      const val81 = result[0];
      expect(val81).assertEqual(1);
      const val82 = result[3];
      expect(val82).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_6600
     * @tc.name testTypedUArraysSlicePart101_066
     * @tc.desc Verify end=-2 start=0 Uint8Array length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -2);
      expect(result.length).assertEqual(3);
      const val83 = result[0];
      expect(val83).assertEqual(1);
      const val84 = result[2];
      expect(val84).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_6700
     * @tc.name testTypedUArraysSlicePart101_067
     * @tc.desc Verify end=-3 start=0 Uint8Array length-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -3);
      expect(result.length).assertEqual(2);
      const val85 = result[0];
      expect(val85).assertEqual(1);
      const val86 = result[1];
      expect(val86).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_6800
     * @tc.name testTypedUArraysSlicePart101_068
     * @tc.desc Verify end=-5 start=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_6900
     * @tc.name testTypedUArraysSlicePart101_069
     * @tc.desc Verify end=-6 start=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -6);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_7000
     * @tc.name testTypedUArraysSlicePart101_070
     * @tc.desc Verify end=-1 start=0 Uint16Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -1);
      expect(result.length).assertEqual(4);
      const val87 = result[0];
      expect(val87).assertEqual(1);
      const val88 = result[3];
      expect(val88).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_7100
     * @tc.name testTypedUArraysSlicePart101_071
     * @tc.desc Verify end=-2 start=0 Uint16Array length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -2);
      expect(result.length).assertEqual(3);
      const val89 = result[0];
      expect(val89).assertEqual(1);
      const val90 = result[2];
      expect(val90).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_7200
     * @tc.name testTypedUArraysSlicePart101_072
     * @tc.desc Verify end=-1 start=0 Uint32Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -1);
      expect(result.length).assertEqual(4);
      const val91 = result[0];
      expect(val91).assertEqual(1);
      const val92 = result[3];
      expect(val92).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_7300
     * @tc.name testTypedUArraysSlicePart101_073
     * @tc.desc Verify end=-1 start=0 BigUint64Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(0, -1);
      expect(result.length).assertEqual(4);
      const val93 = result[0];
      expect(val93).assertEqual(1n);
      const val94 = result[3];
      expect(val94).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_7400

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_7500
     * @tc.name testTypedUArraysSlicePart101_075
     * @tc.desc Verify end=length+1 Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 6);
      expect(result.length).assertEqual(5);
      const val97 = result[0];
      expect(val97).assertEqual(1);
      const val98 = result[4];
      expect(val98).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_7600
     * @tc.name testTypedUArraysSlicePart101_076
     * @tc.desc Verify end=100 Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.slice(0, 100);
      expect(result.length).assertEqual(3);
      const val99 = result[0];
      expect(val99).assertEqual(1);
      const val100 = result[2];
      expect(val100).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_7700
     * @tc.name testTypedUArraysSlicePart101_077
     * @tc.desc Verify end=Number.MAX_SAFE_INTEGER Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.slice(0, 2147483647);
      expect(result.length).assertEqual(3);
      const val101 = result[0];
      expect(val101).assertEqual(1);
      const val102 = result[2];
      expect(val102).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_7800
     * @tc.name testTypedUArraysSlicePart101_078
     * @tc.desc Verify end=length Uint16Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 5);
      expect(result.length).assertEqual(5);
      const val103 = result[0];
      expect(val103).assertEqual(1);
      const val104 = result[4];
      expect(val104).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_7900
     * @tc.name testTypedUArraysSlicePart101_079
     * @tc.desc Verify end=length Uint32Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 5);
      expect(result.length).assertEqual(5);
      const val105 = result[0];
      expect(val105).assertEqual(1);
      const val106 = result[4];
      expect(val106).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_8000
     * @tc.name testTypedUArraysSlicePart101_080
     * @tc.desc Verify end=length Uint8ClampedArray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 5);
      expect(result.length).assertEqual(5);
      const val107 = result[0];
      expect(val107).assertEqual(1);
      const val108 = result[4];
      expect(val108).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_8100
     * @tc.name testTypedUArraysSlicePart101_081
     * @tc.desc Verify end=length BigUint64Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(0, 5);
      expect(result.length).assertEqual(5);
      const val109 = result[0];
      expect(val109).assertEqual(1n);
      const val110 = result[4];
      expect(val110).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_8200
     * @tc.name testTypedUArraysSlicePart101_082
     * @tc.desc Verify end=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_8300
     * @tc.name testTypedUArraysSlicePart101_083
     * @tc.desc Verify end=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_8400
     * @tc.name testTypedUArraysSlicePart101_084
     * @tc.desc Verify end=1 start=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val111 = result[0];
      expect(val111).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_8500
     * @tc.name testTypedUArraysSlicePart101_085
     * @tc.desc Verify end=1 start=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val112 = result[0];
      expect(val112).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_8600
     * @tc.name testTypedUArraysSlicePart101_086
     * @tc.desc Verify end=0 start=1 Uint8Array end start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_8700
     * @tc.name testTypedUArraysSlicePart101_087
     * @tc.desc Verify end=2 start=3 Uint8Array end start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(3, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_8800
     * @tc.name testTypedUArraysSlicePart101_088
     * @tc.desc Verify end=2 start=3 Uint16Array end start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(3, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_8900
     * @tc.name testTypedUArraysSlicePart101_089
     * @tc.desc Verify end=2 start=3 BigUint64Array end start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(3, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_9000

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_9100
     * @tc.name testTypedUArraysSlicePart101_091
     * @tc.desc Verify start=0 end=0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_9200
     * @tc.name testTypedUArraysSlicePart101_092
     * @tc.desc Verify start=0 end=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_9300
     * @tc.name testTypedUArraysSlicePart101_093
     * @tc.desc Verify start=2 end=2 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_9400
     * @tc.name testTypedUArraysSlicePart101_094
     * @tc.desc Verify start=2 end=2 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_9500
     * @tc.name testTypedUArraysSlicePart101_095
     * @tc.desc Verify start=-1 end=-1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-1, -1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_9600
     * @tc.name testTypedUArraysSlicePart101_096
     * @tc.desc Verify start=-2 end=-1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-2, -1);
      expect(result.length).assertEqual(1);
      const val113 = result[0];
      expect(val113).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_9700

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_9800
     * @tc.name testTypedUArraysSlicePart101_098
     * @tc.desc Verify start=-3 end=-1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-3, -1);
      expect(result.length).assertEqual(2);
      const val116 = result[0];
      expect(val116).assertEqual(3);
      const val117 = result[1];
      expect(val117).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART101_9900
     * @tc.name testTypedUArraysSlicePart101_099
     * @tc.desc Verify start=-2 end=-1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart101_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(-2, -1);
      expect(result.length).assertEqual(1);
      const val118 = result[0];
      expect(val118).assertEqual(4n);
    });
  });
}
