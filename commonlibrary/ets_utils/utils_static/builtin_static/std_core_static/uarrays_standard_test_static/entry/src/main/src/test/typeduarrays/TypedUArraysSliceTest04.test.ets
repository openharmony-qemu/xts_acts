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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysSliceTest04(): void {
  describe('TypedUArraysSliceTest04', () => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_0100
     * @tc.name testTypedUArraysSlicePart202_001
     * @tc.desc Verify slice() Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      arr.slice();
      const val0 = arr[0] ;
      expect(val0).assertEqual(1);
      const val1 = arr[2] ;
      expect(val1).assertEqual(3);
      const val2 = arr[4] ;
      expect(val2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_0200
     * @tc.name testTypedUArraysSlicePart202_002
     * @tc.desc Verify slice() Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      arr.slice();
      const val3 = arr[0] ;
      expect(val3).assertEqual(1);
      const val4 = arr[2] ;
      expect(val4).assertEqual(3);
      const val5 = arr[4] ;
      expect(val5).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_0300
     * @tc.name testTypedUArraysSlicePart202_003
     * @tc.desc Verify slice() Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.slice();
      const val6 = arr[0] ;
      expect(val6).assertEqual(1);
      const val7 = arr[2] ;
      expect(val7).assertEqual(3);
      const val8 = arr[4] ;
      expect(val8).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_0400
     * @tc.name testTypedUArraysSlicePart202_004
     * @tc.desc Verify slice() BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.slice();
      const val9 = arr[0];
      expect(val9).assertEqual(1n);
      const val10 = arr[2];
      expect(val10).assertEqual(3n);
      const val11 = arr[4];
      expect(val11).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_0500
     * @tc.name testTypedUArraysSlicePart202_005
     * @tc.desc Verify slice(1, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      arr.slice(1, 3);
      const val12 = arr[0] ;
      expect(val12).assertEqual(10);
      const val13 = arr[1] ;
      expect(val13).assertEqual(20);
      const val14 = arr[2] ;
      expect(val14).assertEqual(30);
      const val15 = arr[3] ;
      expect(val15).assertEqual(40);
      const val16 = arr[4] ;
      expect(val16).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_0600
     * @tc.name testTypedUArraysSlicePart202_006
     * @tc.desc Verify slice(-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      arr.slice(-2);
      const val17 = arr[0] ;
      expect(val17).assertEqual(10);
      const val18 = arr[4] ;
      expect(val18).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_0700
     * @tc.name testTypedUArraysSlicePart202_007
     * @tc.desc Verify slice(100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      arr.slice(100);
      const val19 = arr[0] ;
      expect(val19).assertEqual(10);
      const val20 = arr[2] ;
      expect(val20).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_0800
     * @tc.name testTypedUArraysSlicePart202_008
     * @tc.desc Verify slice() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      arr.slice();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_0900
     * @tc.name testTypedUArraysSlicePart202_009
     * @tc.desc Verify slice() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.slice();
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_1000
     * @tc.name testTypedUArraysSlicePart202_010
     * @tc.desc Verify slice() Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(ret !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_1100
     * @tc.name testTypedUArraysSlicePart202_011
     * @tc.desc Verify slice(1) Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.slice(1);
      expect(ret !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_1200
     * @tc.name testTypedUArraysSlicePart202_012
     * @tc.desc Verify slice(2, 4) Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.slice(2, 4);
      expect(ret !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_1300
     * @tc.name testTypedUArraysSlicePart202_013
     * @tc.desc Verify slice(-2) Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.slice(-2);
      expect(ret !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_1400
     * @tc.name testTypedUArraysSlicePart202_014
     * @tc.desc Verify slice() Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(ret !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_1500
     * @tc.name testTypedUArraysSlicePart202_015
     * @tc.desc Verify slice() Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(ret !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_1600
     * @tc.name testTypedUArraysSlicePart202_016
     * @tc.desc Verify slice() Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(ret !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_1700
     * @tc.name testTypedUArraysSlicePart202_017
     * @tc.desc Verify slice() BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.slice();
      expect(ret !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_1800
     * @tc.name testTypedUArraysSlicePart202_018
     * @tc.desc Verify slice() constructor Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(ret instanceof Uint8Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_1900
     * @tc.name testTypedUArraysSlicePart202_019
     * @tc.desc Verify slice() constructor Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(ret instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_2000
     * @tc.name testTypedUArraysSlicePart202_020
     * @tc.desc Verify slice() constructor Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(ret instanceof Uint32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_2100
     * @tc.name testTypedUArraysSlicePart202_021
     * @tc.desc Verify slice() constructor Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(ret instanceof Uint8ClampedArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_2200
     * @tc.name testTypedUArraysSlicePart202_022
     * @tc.desc Verify slice() constructor BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.slice();
      expect(ret instanceof BigUint64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_2300
     * @tc.name testTypedUArraysSlicePart202_023
     * @tc.desc Verify slice() name Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_2400
     * @tc.name testTypedUArraysSlicePart202_024
     * @tc.desc Verify slice() name Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_2500
     * @tc.name testTypedUArraysSlicePart202_025
     * @tc.desc Verify slice() name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_2600
     * @tc.name testTypedUArraysSlicePart202_026
     * @tc.desc Verify slice() name Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_2700
     * @tc.name testTypedUArraysSlicePart202_027
     * @tc.desc Verify slice() name BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_2800
     * @tc.name testTypedUArraysSlicePart202_028
     * @tc.desc Verify slice() BYTES_PER_ELEMENT 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_2900
     * @tc.name testTypedUArraysSlicePart202_029
     * @tc.desc Verify slice() BYTES_PER_ELEMENT 2 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_3000
     * @tc.name testTypedUArraysSlicePart202_030
     * @tc.desc Verify slice() BYTES_PER_ELEMENT 4 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_3100
     * @tc.name testTypedUArraysSlicePart202_031
     * @tc.desc Verify slice() BYTES_PER_ELEMENT 1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_3200
     * @tc.name testTypedUArraysSlicePart202_032
     * @tc.desc Verify slice() BYTES_PER_ELEMENT 8 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_3300
     * @tc.name testTypedUArraysSlicePart202_033
     * @tc.desc Verify slice() ArrayBuffer.isView Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_3400
     * @tc.name testTypedUArraysSlicePart202_034
     * @tc.desc Verify slice() ArrayBuffer.isView Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_3500
     * @tc.name testTypedUArraysSlicePart202_035
     * @tc.desc Verify slice() ArrayBuffer.isView Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_3600
     * @tc.name testTypedUArraysSlicePart202_036
     * @tc.desc Verify slice() ArrayBuffer.isView Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_3700
     * @tc.name testTypedUArraysSlicePart202_037
     * @tc.desc Verify slice() ArrayBuffer.isView BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.slice();
      expect(ArrayBuffer.isView(ret)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_3800
     * @tc.name testTypedUArraysSlicePart202_038
     * @tc.desc Verify slice() Array.isArray Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(Array.isArray(ret)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_3900
     * @tc.name testTypedUArraysSlicePart202_039
     * @tc.desc Verify slice() Array.isArray Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(Array.isArray(ret)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_4000
     * @tc.name testTypedUArraysSlicePart202_040
     * @tc.desc Verify slice() Array.isArray Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(Array.isArray(ret)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_4100
     * @tc.name testTypedUArraysSlicePart202_041
     * @tc.desc Verify slice() Array.isArray Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(Array.isArray(ret)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_4200
     * @tc.name testTypedUArraysSlicePart202_042
     * @tc.desc Verify slice() Array.isArray BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.slice();
      expect(Array.isArray(ret)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_4300
     * @tc.name testTypedUArraysSlicePart202_043
     * @tc.desc Verify slice() Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const val21 = arr[0] ;
      expect(val21).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_4400
     * @tc.name testTypedUArraysSlicePart202_044
     * @tc.desc Verify slice(1) Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const val22 = arr[1] ;
      expect(val22).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_4500
     * @tc.name testTypedUArraysSlicePart202_045
     * @tc.desc Verify slice(2, 4) Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const val23 = arr[2] ;
      expect(val23).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_4600
     * @tc.name testTypedUArraysSlicePart202_046
     * @tc.desc Verify slice() Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const val24 = arr[2] ;
      expect(val24).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_4700
     * @tc.name testTypedUArraysSlicePart202_047
     * @tc.desc Verify slice() Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const val25 = arr[2] ;
      expect(val25).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_4800
     * @tc.name testTypedUArraysSlicePart202_048
     * @tc.desc Verify slice() Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const val26 = arr[2] ;
      expect(val26).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_4900
     * @tc.name testTypedUArraysSlicePart202_049
     * @tc.desc Verify slice() BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const val27 = arr[2];
      expect(val27).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_5000
     * @tc.name testTypedUArraysSlicePart202_050
     * @tc.desc Verify slice() Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      const val28 = ret[2];
      expect(val28).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_5100
     * @tc.name testTypedUArraysSlicePart202_051
     * @tc.desc Verify slice(1) Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.slice(1);
      const val29 = ret[1];
      expect(val29).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_5200
     * @tc.name testTypedUArraysSlicePart202_052
     * @tc.desc Verify slice(-2) Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.slice(-2);
      const val30 = ret[0];
      expect(val30).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_5300
     * @tc.name testTypedUArraysSlicePart202_053
     * @tc.desc Verify slice() byteOffset 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_5400
     * @tc.name testTypedUArraysSlicePart202_054
     * @tc.desc Verify slice(1) byteOffset 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.slice(1);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_5500
     * @tc.name testTypedUArraysSlicePart202_055
     * @tc.desc Verify slice(2, 4) byteOffset 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.slice(2, 4);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_5600
     * @tc.name testTypedUArraysSlicePart202_056
     * @tc.desc Verify slice(-2) byteOffset 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.slice(-2);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_5700
     * @tc.name testTypedUArraysSlicePart202_057
     * @tc.desc Verify slice() byteOffset 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_5800
     * @tc.name testTypedUArraysSlicePart202_058
     * @tc.desc Verify slice() byteOffset 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      const ret = arr.slice();
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_5900
     * @tc.name testTypedUArraysSlicePart202_059
     * @tc.desc Verify slice() byteOffset 0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const ret = arr.slice();
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_6000
     * @tc.name testTypedUArraysSlicePart202_060
     * @tc.desc Verify subarray - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(2);
      expect(sub[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_6100
     * @tc.name testTypedUArraysSlicePart202_061
     * @tc.desc Verify subarray no args - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      const sub = arr.subarray();
      expect(sub.length).assertEqual(5);
      expect(sub[0]).assertEqual(10);
      expect(sub[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_6200
     * @tc.name testTypedUArraysSlicePart202_062
     * @tc.desc Verify subarray BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const sub = arr.subarray(2);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_6300
     * @tc.name testTypedUArraysSlicePart202_063
     * @tc.desc Verify reverse - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.reverse();
      expect(ret[0]).assertEqual(5);
      expect(ret[4]).assertEqual(1);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_6400
     * @tc.name testTypedUArraysSlicePart202_064
     * @tc.desc Verify toReversed - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      const ret = arr.toReversed();
      expect(ret[0]).assertEqual(3);
      expect(ret[2]).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_6500
     * @tc.name testTypedUArraysSlicePart202_065
     * @tc.desc Verify sort - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 1, 4, 2, 3]);
      const ret = arr.sort();
      expect(ret[0]).assertEqual(1);
      expect(ret[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_6600
     * @tc.name testTypedUArraysSlicePart202_066
     * @tc.desc Verify sort with compareFn - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([5, 1, 4, 2, 3]);
      arr.sort((a: number, b: number) => {
        if (a > b) {
          return -1;
        }
        if (a < b) {
          return 1;
        }
        return 0;
      });
      expect(arr[0]).assertEqual(5);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_6700
     * @tc.name testTypedUArraysSlicePart202_067
     * @tc.desc Verify toSorted - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([5, 1, 4, 2, 3]);
      const ret = arr.toSorted();
      expect(ret[0]).assertEqual(1);
      expect(ret[4]).assertEqual(5);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_6800
     * @tc.name testTypedUArraysSlicePart202_068
     * @tc.desc Verify map - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const ret = arr.map((x: number) => {
        return x * 2;
      });
      expect(ret[0]).assertEqual(2);
      expect(ret[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_6900
     * @tc.name testTypedUArraysSlicePart202_069
     * @tc.desc Verify filter - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      const ret = arr.filter((x: number) => {
        return x > 3;
      });
      expect(ret.length).assertEqual(2);
      expect(ret[0]).assertEqual(4);
      expect(ret[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_7000
     * @tc.name testTypedUArraysSlicePart202_070
     * @tc.desc Verify reduce - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const result = arr.reduce((acc: number, val: number) => {
        return acc + val;
      }, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_7100
     * @tc.name testTypedUArraysSlicePart202_071
     * @tc.desc Verify reduceRight - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      const result = arr.reduceRight((acc: number, val: number) => {
        return acc - val;
      }, 6);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_7200
     * @tc.name testTypedUArraysSlicePart202_072
     * @tc.desc Verify join - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.join(',');
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_7300
     * @tc.name testTypedUArraysSlicePart202_073
     * @tc.desc Verify join default separator - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      const result = arr.join();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_7400
     * @tc.name testTypedUArraysSlicePart202_074
     * @tc.desc Verify join BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const result = arr.join('-');
      expect(result).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_7500
     * @tc.name testTypedUArraysSlicePart202_075
     * @tc.desc Verify toString - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(typeof arr.toString()).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_7600
     * @tc.name testTypedUArraysSlicePart202_076
     * @tc.desc Verify toLocaleString - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      expect(typeof arr.toLocaleString()).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_7700
     * @tc.name testTypedUArraysSlicePart202_077
     * @tc.desc Verify valueOf - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const val = arr.valueOf();
      expect(val).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_7800
     * @tc.name testTypedUArraysSlicePart202_078
     * @tc.desc Verify valueOf - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([10, 20, 30]);
      const val = arr.valueOf();
      expect(val).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_7900
     * @tc.name testTypedUArraysSlicePart202_079
     * @tc.desc Verify valueOf BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const val = arr.valueOf();
      expect(val).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_8000
     * @tc.name testTypedUArraysSlicePart202_080
     * @tc.desc Verify findLast - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 2n]);
      const result = arr.findLast((x: bigint) => {
        return x == 2n;
      });
      expect(result).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_8100
     * @tc.name testTypedUArraysSlicePart202_081
     * @tc.desc Verify findLastIndex - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([5, 12, 8, 12]);
      const result = arr.findLastIndex((x: number) => {
        return x > 10;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_8200
     * @tc.name testTypedUArraysSlicePart202_082
     * @tc.desc Verify BYTES_PER_ELEMENT - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_8300
     * @tc.name testTypedUArraysSlicePart202_083
     * @tc.desc Verify name property - all typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr8 = new Uint8Array(1);
      const arr16 = new Uint16Array(1);
      const arr32 = new Uint32Array(1);
      const arrClamped = new Uint8ClampedArray(1);
      const arrBig = new BigUint64Array(1);
      expect(arr8.length).assertEqual(1);
      expect(arr16.length).assertEqual(1);
      expect(arr32.length).assertEqual(1);
      expect(arrClamped.length).assertEqual(1);
      expect(arrBig.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_8400
     * @tc.name testTypedUArraysSlicePart202_084
     * @tc.desc Verify buffer property - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.buffer instanceof ArrayBuffer).assertEqual(true);
      expect(arr.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_8500
     * @tc.name testTypedUArraysSlicePart202_085
     * @tc.desc Verify buffer property - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      expect(arr.buffer instanceof ArrayBuffer).assertEqual(true);
      expect(arr.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_8600
     * @tc.name testTypedUArraysSlicePart202_086
     * @tc.desc Verify byteLength and length - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(5);
      expect(arr.length).assertEqual(5);
      expect(arr.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_8700
     * @tc.name testTypedUArraysSlicePart202_087
     * @tc.desc Verify byteOffset default - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_8800
     * @tc.name testTypedUArraysSlicePart202_088
     * @tc.desc Verify byteOffset with offset - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Uint32Array(buffer, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_8900
     * @tc.name testTypedUArraysSlicePart202_089
     * @tc.desc Verify subscript read write - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr[0] = 10;
      arr[2] = 30;
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_9000
     * @tc.name testTypedUArraysSlicePart202_090
     * @tc.desc Verify subscript Uint8ClampedArray clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = -10;
      arr[1] = 300;
      arr[2] = 100;
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_9100
     * @tc.name testTypedUArraysSlicePart202_091
     * @tc.desc Verify forEach - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let sum = 0;
      arr.forEach((x: number) => {
        sum += x;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_9200
     * @tc.name testTypedUArraysSlicePart202_092
     * @tc.desc Verify some returns true - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      expect(arr.some((x: number) => {
        return x > 3;
      })).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_9300
     * @tc.name testTypedUArraysSlicePart202_093
     * @tc.desc Verify every returns true - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([2, 4, 6]);
      expect(arr.every((x: number) => {
        return x > 0;
      })).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICE_PART202_9400
     * @tc.name testTypedUArraysSlicePart202_094
     * @tc.desc Verify every returns false - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePart202_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.every((x: number) => {
        return x > 2;
      })).assertEqual(false);
    });

  });
}
