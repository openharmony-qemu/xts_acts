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

export default function typedUArraysSliceTest06(): void {
  describe('TypedUArraysSliceTest06', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_0100
     * @tc.name testTypedUArraysSlicePart302_001
     * @tc.desc Verify Infinity start Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42, 42, 42, 42, 42]);
      let result = arr.slice(2147483647);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_0200
     * @tc.name testTypedUArraysSlicePart302_002
     * @tc.desc Verify NaN start NaN end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42, 42, 42, 42, 42]);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_0300
     * @tc.name testTypedUArraysSlicePart302_003
     * @tc.desc Verify -Infinity start Infinity end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42, 42, 42, 42, 42]);
      let result = arr.slice(-2147483647, 2147483647);
      expect(result.length).assertEqual(5);
      const val0 = result[0];
      expect(val0).assertEqual(42);
      const val1 = result[4];
      expect(val1).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_0400
     * @tc.name testTypedUArraysSlicePart302_004
     * @tc.desc Verify start=-length-1 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-6);
      expect(result.length).assertEqual(5);
      const val2 = result[0];
      expect(val2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_0500
     * @tc.name testTypedUArraysSlicePart302_005
     * @tc.desc Verify start=-length-2 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-7);
      expect(result.length).assertEqual(5);
      const val3 = result[0];
      expect(val3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_0600
     * @tc.name testTypedUArraysSlicePart302_006
     * @tc.desc Verify end=-length-1 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -6);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_0700
     * @tc.name testTypedUArraysSlicePart302_007
     * @tc.desc Verify end=-length-2 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -7);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_0800
     * @tc.name testTypedUArraysSlicePart302_008
     * @tc.desc Verify start=-length-1 end=length Uint8Array 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-6, 5);
      expect(result.length).assertEqual(5);
      const val4 = result[0];
      expect(val4).assertEqual(1);
      const val5 = result[4];
      expect(val5).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_0900
     * @tc.name testTypedUArraysSlicePart302_009
     * @tc.desc Verify start=length+1 end=length+1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(6, 6);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_1000
     * @tc.name testTypedUArraysSlicePart302_010
     * @tc.desc Verify start=-length-1 end=-length-1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-6, -6);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_1100
     * @tc.name testTypedUArraysSlicePart302_011
     * @tc.desc Verify 100 NaN start Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) { arr[i.toInt()] = i; }
      let result = arr.slice(0);
      expect(result.length).assertEqual(100);
      const val6 = result[0];
      expect(val6).assertEqual(0);
      const val7 = result[99];
      expect(val7).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_1200
     * @tc.name testTypedUArraysSlicePart302_012
     * @tc.desc Verify 100 Infinity start Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      let result = arr.slice(2147483647);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_1300
     * @tc.name testTypedUArraysSlicePart302_013
     * @tc.desc Verify 100 -Infinity start Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) { arr[i.toInt()] = i; }
      let result = arr.slice(-2147483647);
      expect(result.length).assertEqual(100);
      const val8 = result[0];
      expect(val8).assertEqual(0);
      const val9 = result[99];
      expect(val9).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_1400
     * @tc.name testTypedUArraysSlicePart302_014
     * @tc.desc Verify 100 1.5 start Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) { arr[i.toInt()] = i; }
      let result = arr.slice(1);
      expect(result.length).assertEqual(99);
      const val10 = result[0];
      expect(val10).assertEqual(1);
      const val11 = result[98];
      expect(val11).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_1500
     * @tc.name testTypedUArraysSlicePart302_015
     * @tc.desc Verify 100 NaN start Infinity end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) { arr[i.toInt()] = i; }
      let result = arr.slice(0, 2147483647);
      expect(result.length).assertEqual(100);
      const val12 = result[0];
      expect(val12).assertEqual(0);
      const val13 = result[99];
      expect(val13).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_1600
     * @tc.name testTypedUArraysSlicePart302_016
     * @tc.desc Verify 100 -Infinity start NaN end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      let result = arr.slice(-2147483647, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_1700
     * @tc.name testTypedUArraysSlicePart302_017
     * @tc.desc Verify 100 1.5 start 2.7 end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) { arr[i.toInt()] = i; }
      let result = arr.slice(1, 2);
      expect(result.length).assertEqual(1);
      const val14 = result[0];
      expect(val14).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_1800
     * @tc.name testTypedUArraysSlicePart302_018
     * @tc.desc Verify 100 -1.5 start 3.7 end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      let result = arr.slice(-1, 3);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_1900
     * @tc.name testTypedUArraysSlicePart302_019
     * @tc.desc Verify start=NaN end=-1 Uint8Array 0 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -1);
      expect(result.length).assertEqual(4);
      const val15 = result[0];
      expect(val15).assertEqual(1);
      const val16 = result[3];
      expect(val16).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_2000
     * @tc.name testTypedUArraysSlicePart302_020
     * @tc.desc Verify start=undefined end=length Uint8Array 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 5);
      expect(result.length).assertEqual(5);
      const val17 = result[0];
      expect(val17).assertEqual(1);
      const val18 = result[4];
      expect(val18).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_2100
     * @tc.name testTypedUArraysSlicePart302_021
     * @tc.desc Verify start=null end=-1 Uint8Array 0 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -1);
      expect(result.length).assertEqual(4);
      const val19 = result[0];
      expect(val19).assertEqual(1);
      const val20 = result[3];
      expect(val20).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_2200
     * @tc.name testTypedUArraysSlicePart302_022
     * @tc.desc Verify start=0.5 end=2.7 Uint8Array 0 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 2);
      expect(result.length).assertEqual(2);
      const val21 = result[0];
      expect(val21).assertEqual(1);
      const val22 = result[1];
      expect(val22).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_2300
     * @tc.name testTypedUArraysSlicePart302_023
     * @tc.desc Verify start=-1.5 end=-0.5 Uint8Array -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-1, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_2400
     * @tc.name testTypedUArraysSlicePart302_024
     * @tc.desc Verify start=2.7 end=1.5 Uint8Array start>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_2500
     * @tc.name testTypedUArraysSlicePart302_025
     * @tc.desc Verify start=NaN end=1.5 Uint8Array 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val23 = result[0];
      expect(val23).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_2600
     * @tc.name testTypedUArraysSlicePart302_026
     * @tc.desc Verify start=1.5 end=NaN Uint8Array 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_2700
     * @tc.name testTypedUArraysSlicePart302_027
     * @tc.desc Verify start=-1.5 end=NaN Uint8Array -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-1, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_2800
     * @tc.name testTypedUArraysSlicePart302_028
     * @tc.desc Verify start=0.5 end=-1.5 Uint8Array 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -1);
      expect(result.length).assertEqual(4);
      const v0 = result[0]; expect(v0).assertEqual(1);
      const v1 = result[3]; expect(v1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_2900
     * @tc.name testTypedUArraysSlicePart302_029
     * @tc.desc Verify start=Infinity end=1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2147483647, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_3000
     * @tc.name testTypedUArraysSlicePart302_030
     * @tc.desc Verify start=-Infinity end=1 Uint8Array 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-2147483647, 1);
      expect(result.length).assertEqual(1);
      const val24 = result[0];
      expect(val24).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_3100
     * @tc.name testTypedUArraysSlicePart302_031
     * @tc.desc Verify start=1 end=Infinity Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 2147483647);
      expect(result.length).assertEqual(4);
      const val25 = result[0];
      expect(val25).assertEqual(2);
      const val26 = result[3];
      expect(val26).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_3200
     * @tc.name testTypedUArraysSlicePart302_032
     * @tc.desc Verify start=1 end=-Infinity Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, -2147483647);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_3300
     * @tc.name testTypedUArraysSlicePart302_033
     * @tc.desc Verify start=NaN end=-1.5 Uint8Array 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -1);
      expect(result.length).assertEqual(4);
      const val27 = result[0];
      expect(val27).assertEqual(1);
      const val28 = result[3];
      expect(val28).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_3400
     * @tc.name testTypedUArraysSlicePart302_034
     * @tc.desc Verify start=-1.5 end=Infinity Uint8Array -1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-1, 2147483647);
      expect(result.length).assertEqual(1);
      const val29 = result[0];
      expect(val29).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_3500
     * @tc.name testTypedUArraysSlicePart302_035
     * @tc.desc Verify start=2.7 end=-1.5 Uint8Array 2 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2, -1);
      expect(result.length).assertEqual(2);
      const v0 = result[0]; expect(v0).assertEqual(3);
      const v1 = result[1]; expect(v1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_3600
     * @tc.name testTypedUArraysSlicePart302_036
     * @tc.desc Verify start=-2.7 end=1.5 Uint8Array -2 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-2, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_3700
     * @tc.name testTypedUArraysSlicePart302_037
     * @tc.desc Verify start=-2.7 end=3.7 Uint8Array -2 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-2, 3);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_3800
     * @tc.name testTypedUArraysSlicePart302_038
     * @tc.desc Verify start=-3.5 end=-1.5 Uint8Array -3 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-3, -1);
      expect(result.length).assertEqual(2);
      const val32 = result[0];
      expect(val32).assertEqual(3);
      const val33 = result[1];
      expect(val33).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_3900
     * @tc.name testTypedUArraysSlicePart302_039
     * @tc.desc Verify start=-5.5 end=-2.5 Uint8Array -5 -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-5, -2);
      expect(result.length).assertEqual(3);
      const val34 = result[0];
      expect(val34).assertEqual(1);
      const val35 = result[2];
      expect(val35).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_4000
     * @tc.name testTypedUArraysSlicePart302_040
     * @tc.desc Verify start=-5.5 end=-5.5 Uint8Array -5 -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-5, -5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_4100
     * @tc.name testTypedUArraysSlicePart302_041
     * @tc.desc Verify start=-6.5 end=-1.5 Uint8Array -6 -1 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-6, -1);
      expect(result.length).assertEqual(4);
      const val36 = result[0];
      expect(val36).assertEqual(1);
      const val37 = result[3];
      expect(val37).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_4200
     * @tc.name testTypedUArraysSlicePart302_042
     * @tc.desc Verify start=NaN end=-6 Uint8Array 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -6);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_4300
     * @tc.name testTypedUArraysSlicePart302_043
     * @tc.desc Verify start=-6 end=NaN Uint8Array 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-6, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_4400
     * @tc.name testTypedUArraysSlicePart302_044
     * @tc.desc Verify start=6 end=NaN Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(6, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_4500
     * @tc.name testTypedUArraysSlicePart302_045
     * @tc.desc Verify start=NaN end=6 Uint8Array 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 6);
      expect(result.length).assertEqual(5);
      const val38 = result[0];
      expect(val38).assertEqual(1);
      const val39 = result[4];
      expect(val39).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_4600
     * @tc.name testTypedUArraysSlicePart302_046
     * @tc.desc Verify start=100 end=NaN Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(100, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_4700
     * @tc.name testTypedUArraysSlicePart302_047
     * @tc.desc Verify start=NaN end=100 Uint8Array 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 100);
      expect(result.length).assertEqual(5);
      const val40 = result[0];
      expect(val40).assertEqual(1);
      const val41 = result[4];
      expect(val41).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_4800
     * @tc.name testTypedUArraysSlicePart302_048
     * @tc.desc Verify start=Number.MAX_SAFE_INTEGER end=NaN Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2147483647, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_4900
     * @tc.name testTypedUArraysSlicePart302_049
     * @tc.desc Verify start=NaN end=Number.MAX_SAFE_INTEGER Uint8Array 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 2147483647);
      expect(result.length).assertEqual(5);
      const val42 = result[0];
      expect(val42).assertEqual(1);
      const val43 = result[4];
      expect(val43).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_5000
     * @tc.name testTypedUArraysSlicePart302_050
     * @tc.desc Verify start=-Number.MAX_SAFE_INTEGER end=NaN Uint8Array 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-(2147483647), 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_5100
     * @tc.name testTypedUArraysSlicePart302_051
     * @tc.desc Verify start=NaN end=-Number.MAX_SAFE_INTEGER Uint8Array 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -(2147483647));
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_5200
     * @tc.name testTypedUArraysSlicePart302_052
     * @tc.desc Verify start=-Number.MAX_SAFE_INTEGER end=Number.MAX_SAFE_INTEGER Uint8Array 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-(2147483647), 2147483647);
      expect(result.length).assertEqual(5);
      const val44 = result[0];
      expect(val44).assertEqual(1);
      const val45 = result[4];
      expect(val45).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_5300
     * @tc.name testTypedUArraysSlicePart302_053
     * @tc.desc Verify start=1000000 end=NaN Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1000000, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_5400
     * @tc.name testTypedUArraysSlicePart302_054
     * @tc.desc Verify start=NaN end=1000000 Uint8Array 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 1000000);
      expect(result.length).assertEqual(5);
      const val46 = result[0];
      expect(val46).assertEqual(1);
      const val47 = result[4];
      expect(val47).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_5500
     * @tc.name testTypedUArraysSlicePart302_055
     * @tc.desc Verify start=-1000000 end=NaN Uint8Array 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-1000000, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_5600
     * @tc.name testTypedUArraysSlicePart302_056
     * @tc.desc Verify start=NaN end=-1000000 Uint8Array 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -1000000);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_5700
     * @tc.name testTypedUArraysSlicePart302_057
     * @tc.desc Verify start=-1000000 end=1000000 Uint8Array 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-1000000, 1000000);
      expect(result.length).assertEqual(5);
      const val48 = result[0];
      expect(val48).assertEqual(1);
      const val49 = result[4];
      expect(val49).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_5800
     * @tc.name testTypedUArraysSlicePart302_058
     * @tc.desc Verify lastIndexOf present - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 20, 40]);
      expect(arr.lastIndexOf(20)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_5900
     * @tc.name testTypedUArraysSlicePart302_059
     * @tc.desc Verify lastIndexOf not present - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      expect(arr.lastIndexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_6000
     * @tc.name testTypedUArraysSlicePart302_060
     * @tc.desc Verify lastIndexOf BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 2n]);
      expect(arr.lastIndexOf(2n)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_6100
     * @tc.name testTypedUArraysSlicePart302_061
     * @tc.desc Verify fill Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      arr.fill(99);
      arr.sort(); expect(arr[0]).assertEqual(99);
      expect(arr[4]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_6200
     * @tc.name testTypedUArraysSlicePart302_062
     * @tc.desc Verify fill Uint32Array with start end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      arr.fill(99, 1, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_6300
     * @tc.name testTypedUArraysSlicePart302_063
     * @tc.desc Verify fill Uint8ClampedArray clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr.fill(300);
      arr.sort(); expect(arr[0]).assertEqual(255);
      arr.fill(-10);
      arr.sort(); expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_6400
     * @tc.name testTypedUArraysSlicePart302_064
     * @tc.desc Verify copyWithin Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_6500
     * @tc.name testTypedUArraysSlicePart302_065
     * @tc.desc Verify copyWithin Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(1, 3, 5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_6600
     * @tc.name testTypedUArraysSlicePart302_066
     * @tc.desc Verify set Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      arr.set([50, 100, 200, 300, -1]);
      expect(arr[0]).assertEqual(50);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(200);
      expect(arr[3]).assertEqual(255);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_6700
     * @tc.name testTypedUArraysSlicePart302_067
     * @tc.desc Verify of Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 2, 3);
      expect(arr.length).assertEqual(3);
      arr.sort(); expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_6800
     * @tc.name testTypedUArraysSlicePart302_068
     * @tc.desc Verify of Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100, 200, 300);
      expect(arr.length).assertEqual(3);
      arr.sort(); expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_6900
     * @tc.name testTypedUArraysSlicePart302_069
     * @tc.desc Verify from Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.from([4, 5, 6]);
      expect(arr.length).assertEqual(3);
      arr.sort(); expect(arr[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_7000
     * @tc.name testTypedUArraysSlicePart302_070
     * @tc.desc Verify from BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.from([1n, 2n, 3n]);
      expect(arr.length).assertEqual(3);
      arr.sort(); expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_7100
     * @tc.name testTypedUArraysSlicePart302_071
     * @tc.desc Verify reduce BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const result = arr.reduce((acc: bigint, val: bigint) => {
        return acc + val;
      }, 0n);
      expect(result).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_7200
     * @tc.name testTypedUArraysSlicePart302_072
     * @tc.desc Verify reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const result = arr.reduceRight((acc: bigint, val: bigint) => {
        return acc - val;
      }, 6n);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_7300
     * @tc.name testTypedUArraysSlicePart302_073
     * @tc.desc Verify sort BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 1n, 4n, 2n, 3n]);
      const ret = arr.sort();
      expect(ret[0]).assertEqual(1n);
      expect(ret[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_7400
     * @tc.name testTypedUArraysSlicePart302_074
     * @tc.desc Verify toSorted BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 1n, 4n, 2n, 3n]);
      const ret = arr.toSorted();
      expect(ret[0]).assertEqual(1n);
      expect(ret[4]).assertEqual(5n);
      expect(arr[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_7500
     * @tc.name testTypedUArraysSlicePart302_075
     * @tc.desc Verify map BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const ret = arr.map((x: bigint) => {
        return x * 2n;
      });
      expect(ret[0]).assertEqual(2n);
      expect(ret[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_7600
     * @tc.name testTypedUArraysSlicePart302_076
     * @tc.desc Verify filter BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.filter((x: bigint) => {
        return x > 2n;
      });
      expect(ret.length).assertEqual(3);
      expect(ret[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_7700
     * @tc.name testTypedUArraysSlicePart302_077
     * @tc.desc Verify reverse BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      arr.reverse();
      expect(arr[0]).assertEqual(3n);
      expect(arr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART302_7800
     * @tc.name testTypedUArraysSlicePart302_078
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart302_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const ret = arr.toReversed();
      expect(ret[0]).assertEqual(3n);
      arr.sort(); expect(arr[0]).assertEqual(1n);
    });

  });
}
