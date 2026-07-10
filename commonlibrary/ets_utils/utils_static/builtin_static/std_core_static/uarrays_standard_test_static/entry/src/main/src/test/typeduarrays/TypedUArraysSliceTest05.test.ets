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

export default function typedUArraysSliceTest05(): void {
  describe('TypedUArraysSliceTest05', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_0100
     * @tc.name testTypedUArraysSlicePart301_001
     * @tc.desc Verify NaN - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val0 = result[0];
      expect(val0).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_0200
     * @tc.name testTypedUArraysSlicePart301_002
     * @tc.desc Verify NaN - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val1 = result[0];
      expect(val1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_0300
     * @tc.name testTypedUArraysSlicePart301_003
     * @tc.desc Verify NaN - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val2 = result[0];
      expect(val2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_0400
     * @tc.name testTypedUArraysSlicePart301_004
     * @tc.desc Verify undefined - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val3 = result[0];
      expect(val3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_0500
     * @tc.name testTypedUArraysSlicePart301_005
     * @tc.desc Verify null - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val4 = result[0];
      expect(val4).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_0600
     * @tc.name testTypedUArraysSlicePart301_006
     * @tc.desc Verify start=NaN Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val5 = result[0];
      expect(val5).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_0700
     * @tc.name testTypedUArraysSlicePart301_007
     * @tc.desc Verify start=undefined Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val6 = result[0];
      expect(val6).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_0800
     * @tc.name testTypedUArraysSlicePart301_008
     * @tc.desc Verify start=null Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val7 = result[0];
      expect(val7).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_0900
     * @tc.name testTypedUArraysSlicePart301_009
     * @tc.desc Verify start=Infinity Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2147483647);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_1000
     * @tc.name testTypedUArraysSlicePart301_010
     * @tc.desc Verify start=-Infinity Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-2147483647);
      expect(result.length).assertEqual(5);
      const val8 = result[0];
      expect(val8).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_1100
     * @tc.name testTypedUArraysSlicePart301_011
     * @tc.desc Verify start=1.5 Uint8Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1);
      expect(result.length).assertEqual(4);
      const val9 = result[0];
      expect(val9).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_1200
     * @tc.name testTypedUArraysSlicePart301_012
     * @tc.desc Verify start=2.7 Uint8Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2);
      expect(result.length).assertEqual(3);
      const val10 = result[0];
      expect(val10).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_1300
     * @tc.name testTypedUArraysSlicePart301_013
     * @tc.desc Verify start=-1.5 Uint8Array -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      const val11 = result[0];
      expect(val11).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_1400
     * @tc.name testTypedUArraysSlicePart301_014
     * @tc.desc Verify start=0.5 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val12 = result[0];
      expect(val12).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_1500
     * @tc.name testTypedUArraysSlicePart301_015
     * @tc.desc Verify start=-0.5 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val13 = result[0];
      expect(val13).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_1600
     * @tc.name testTypedUArraysSlicePart301_016
     * @tc.desc Verify start=-Number.MAX_SAFE_INTEGER Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.slice(-2147483647);
      expect(result.length).assertEqual(3);
      const val14 = result[0];
      expect(val14).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_1700
     * @tc.name testTypedUArraysSlicePart301_017
     * @tc.desc Verify start=-1000000 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.slice(-1000000);
      expect(result.length).assertEqual(3);
      const val15 = result[0];
      expect(val15).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_1800
     * @tc.name testTypedUArraysSlicePart301_018
     * @tc.desc Verify start=0x0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0x0);
      expect(result.length).assertEqual(5);
      const val16 = result[0];
      expect(val16).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_1900
     * @tc.name testTypedUArraysSlicePart301_019
     * @tc.desc Verify start=0b101 Uint8Array 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0b101);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_2000
     * @tc.name testTypedUArraysSlicePart301_020
     * @tc.desc Verify start=0o10 Uint8Array 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.slice(0o10);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_2100
     * @tc.name testTypedUArraysSlicePart301_021
     * @tc.desc Verify start=NaN Uint16Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val17 = result[0];
      expect(val17).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_2200
     * @tc.name testTypedUArraysSlicePart301_022
     * @tc.desc Verify start=Infinity Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2147483647);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_2300
     * @tc.name testTypedUArraysSlicePart301_023
     * @tc.desc Verify start=1.5 Uint16Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1);
      expect(result.length).assertEqual(4);
      const val18 = result[0];
      expect(val18).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_2400
     * @tc.name testTypedUArraysSlicePart301_024
     * @tc.desc Verify start=NaN Uint32Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val19 = result[0];
      expect(val19).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_2500
     * @tc.name testTypedUArraysSlicePart301_025
     * @tc.desc Verify start=1.5 Uint32Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1);
      expect(result.length).assertEqual(4);
      const val20 = result[0];
      expect(val20).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_2600
     * @tc.name testTypedUArraysSlicePart301_026
     * @tc.desc Verify start=NaN Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val21 = result[0];
      expect(val21).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_2700
     * @tc.name testTypedUArraysSlicePart301_027
     * @tc.desc Verify start=1.5 BigUint64Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(1);
      expect(result.length).assertEqual(4);
      const val22 = result[0];
      expect(val22).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_2800
     * @tc.name testTypedUArraysSlicePart301_028
     * @tc.desc Verify start=Infinity BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(2147483647);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_2900
     * @tc.name testTypedUArraysSlicePart301_029
     * @tc.desc Verify start=-Infinity BigUint64Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(-2147483647);
      expect(result.length).assertEqual(5);
      const val23 = result[0];
      expect(val23).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_3000
     * @tc.name testTypedUArraysSlicePart301_030
     * @tc.desc Verify start=0.5 BigUint64Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(0);
      expect(result.length).assertEqual(5);
      const val24 = result[0];
      expect(val24).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_3100
     * @tc.name testTypedUArraysSlicePart301_031
     * @tc.desc Verify end=NaN start=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_3200
     * @tc.name testTypedUArraysSlicePart301_032
     * @tc.desc Verify end=undefined start=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_3300
     * @tc.name testTypedUArraysSlicePart301_033
     * @tc.desc Verify end=null start=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_3400
     * @tc.name testTypedUArraysSlicePart301_034
     * @tc.desc Verify end=Infinity start=0 Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 2147483647);
      expect(result.length).assertEqual(5);
      const val25 = result[0];
      expect(val25).assertEqual(1);
      const val26 = result[4];
      expect(val26).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_3500
     * @tc.name testTypedUArraysSlicePart301_035
     * @tc.desc Verify end=-Infinity start=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -2147483647);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_3600
     * @tc.name testTypedUArraysSlicePart301_036
     * @tc.desc Verify end=1.5 start=0 Uint8Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val27 = result[0];
      expect(val27).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_3700
     * @tc.name testTypedUArraysSlicePart301_037
     * @tc.desc Verify end=2.7 start=0 Uint8Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 2);
      expect(result.length).assertEqual(2);
      const val28 = result[0];
      expect(val28).assertEqual(1);
      const val29 = result[1];
      expect(val29).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_3800
     * @tc.name testTypedUArraysSlicePart301_038
     * @tc.desc Verify end=-1.5 start=0 Uint8Array -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -1);
      expect(result.length).assertEqual(4);
      const val30 = result[0];
      expect(val30).assertEqual(1);
      const val31 = result[3];
      expect(val31).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_3900
     * @tc.name testTypedUArraysSlicePart301_039
     * @tc.desc Verify end=0.5 start=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_4000
     * @tc.name testTypedUArraysSlicePart301_040
     * @tc.desc Verify end=-0.5 start=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_4100
     * @tc.name testTypedUArraysSlicePart301_041
     * @tc.desc Verify end=-Number.MAX_SAFE_INTEGER start=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.slice(0, -2147483647);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_4200
     * @tc.name testTypedUArraysSlicePart301_042
     * @tc.desc Verify end=-1000000 start=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.slice(0, -1000000);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_4300
     * @tc.name testTypedUArraysSlicePart301_043
     * @tc.desc Verify end=0x0 start=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 0x0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_4400
     * @tc.name testTypedUArraysSlicePart301_044
     * @tc.desc Verify end=0b101 start=0 Uint8Array 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 0b101);
      expect(result.length).assertEqual(5);
      const val32 = result[0];
      expect(val32).assertEqual(1);
      const val33 = result[4];
      expect(val33).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_4500
     * @tc.name testTypedUArraysSlicePart301_045
     * @tc.desc Verify end=0o10 start=0 Uint8Array 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.slice(0, 0o10);
      expect(result.length).assertEqual(3);
      const val34 = result[0];
      expect(val34).assertEqual(1);
      const val35 = result[2];
      expect(val35).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_4600
     * @tc.name testTypedUArraysSlicePart301_046
     * @tc.desc Verify end=NaN start=0 Uint16Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_4700
     * @tc.name testTypedUArraysSlicePart301_047
     * @tc.desc Verify end=Infinity start=0 Uint16Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 2147483647);
      expect(result.length).assertEqual(5);
      const val36 = result[0];
      expect(val36).assertEqual(1);
      const val37 = result[4];
      expect(val37).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_4800
     * @tc.name testTypedUArraysSlicePart301_048
     * @tc.desc Verify end=1.5 start=0 Uint16Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val38 = result[0];
      expect(val38).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_4900
     * @tc.name testTypedUArraysSlicePart301_049
     * @tc.desc Verify end=NaN start=0 Uint32Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_5000
     * @tc.name testTypedUArraysSlicePart301_050
     * @tc.desc Verify end=1.5 start=0 Uint32Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val21 = result[0];
      expect(val21).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_5100
     * @tc.name testTypedUArraysSlicePart301_051
     * @tc.desc Verify indexOf value present - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.indexOf(20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_5200
     * @tc.name testTypedUArraysSlicePart301_052
     * @tc.desc Verify indexOf fromIndex - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.indexOf(20, 2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_5300
     * @tc.name testTypedUArraysSlicePart301_053
     * @tc.desc Verify indexOf value not present - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      expect(arr.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_5400
     * @tc.name testTypedUArraysSlicePart301_054
     * @tc.desc Verify indexOf BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 2n]);
      expect(arr.indexOf(2n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_5500
     * @tc.name testTypedUArraysSlicePart301_055
     * @tc.desc Verify includes value present - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      expect(arr.includes(20)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_5600
     * @tc.name testTypedUArraysSlicePart301_056
     * @tc.desc Verify includes value not present - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      expect(arr.includes(99)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_5700
     * @tc.name testTypedUArraysSlicePart301_057
     * @tc.desc Verify includes BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      expect(arr.includes(3n)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_5800
     * @tc.name testTypedUArraysSlicePart301_058
     * @tc.desc Verify find first match - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 12, 8, 130]);
      const result = arr.find((x: number) => {
        return x > 10;
      });
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_5900
     * @tc.name testTypedUArraysSlicePart301_059
     * @tc.desc Verify find undefined - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 12, 8, 130]);
      const result = arr.find((x: number) => {
        return x > 200;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_6000
     * @tc.name testTypedUArraysSlicePart301_060
     * @tc.desc Verify findIndex - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([5, 12, 8, 130]);
      const result = arr.findIndex((x: number) => {
        return x > 10;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_6100
     * @tc.name testTypedUArraysSlicePart301_061
     * @tc.desc Verify entries iteration - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.entries();
      expect(iter).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_6200
     * @tc.name testTypedUArraysSlicePart301_062
     * @tc.desc Verify keys iteration - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.keys();
      expect(iter).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_6300
     * @tc.name testTypedUArraysSlicePart301_063
     * @tc.desc Verify values iteration - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.values();
      expect(iter).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART301_6400
     * @tc.name testTypedUArraysSlicePart301_064
     * @tc.desc Verify forEach iteration - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart301_064', 0, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let count = 0;
      arr.forEach((x: number) => {
        count++;
      });
      expect(count).assertEqual(3);
    });

  });
}