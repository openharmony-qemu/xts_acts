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

export default function typedUArraysSetTest01(): void {
  describe('TypedUArraysSetTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_0100
     * @tc.name testTypedUArraysSetTestFileA001
     * @tc.desc Verify set(source) Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const src = new Uint8Array([1, 2, 3]);
      arr.set(src);
      const val0 = arr[0];
      expect(val0).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_0200
     * @tc.name testTypedUArraysSetTestFileA002
     * @tc.desc Verify set(source) Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      const src = new Uint16Array([1, 2, 3]);
      arr.set(src);
      const val1 = arr[0];
      expect(val1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_0300
     * @tc.name testTypedUArraysSetTestFileA003
     * @tc.desc Verify set(source) Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      const src = new Uint32Array([1, 2, 3]);
      arr.set(src);
      const val2 = arr[0];
      expect(val2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_0400
     * @tc.name testTypedUArraysSetTestFileA004
     * @tc.desc Verify set(source) Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([1, 2, 3]);
      arr.set(src);
      const val3 = arr[0];
      expect(val3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_0500
     * @tc.name testTypedUArraysSetTestFileA005
     * @tc.desc Verify set(source) BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      const src = new BigUint64Array([1n, 2n, 3n]);
      arr.set(src);
      const val4 = arr[0];
      expect(val4).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_0600
     * @tc.name testTypedUArraysSetTestFileA006
     * @tc.desc Verify set(source, offset) Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      const src = new Uint8Array([1, 2]);
      arr.set(src, 1);
      const val5 = arr[1];
      expect(val5).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_0700
     * @tc.name testTypedUArraysSetTestFileA007
     * @tc.desc Verify set(source, offset) Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0, 0]);
      const src = new Uint16Array([1, 2]);
      arr.set(src, 1);
      const val6 = arr[1];
      expect(val6).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_0800
     * @tc.name testTypedUArraysSetTestFileA008
     * @tc.desc Verify set(source, offset) Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0, 0]);
      const src = new Uint32Array([1, 2]);
      arr.set(src, 1);
      const val7 = arr[1];
      expect(val7).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_0900
     * @tc.name testTypedUArraysSetTestFileA009
     * @tc.desc Verify set(source, offset) Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const src = new Uint8ClampedArray([1, 2]);
      arr.set(src, 1);
      const val8 = arr[1];
      expect(val8).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_1000
     * @tc.name testTypedUArraysSetTestFileA010
     * @tc.desc Verify set(source, offset) BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n, 0n]);
      const src = new BigUint64Array([1n, 2n]);
      arr.set(src, 1);
      const val9 = arr[1];
      expect(val9).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_1100
     * @tc.name testTypedUArraysSetTestFileA011
     * @tc.desc Verify set(source) source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set([1, 2, 3]);
      const val10 = arr[0];
      expect(val10).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_1200
     * @tc.name testTypedUArraysSetTestFileA012
     * @tc.desc Verify set(source, offset) source offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.set([1, 2], 1);
      const val11 = arr[1];
      expect(val11).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_1300
     * @tc.name testTypedUArraysSetTestFileA013
     * @tc.desc Verify source Uint8Array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const src = new Uint8Array([10, 20, 30]);
      arr.set(src);
      const val12 = arr[0];
      expect(val12).assertEqual(10);
      const val13 = arr[1];
      expect(val13).assertEqual(20);
      const val14 = arr[2];
      expect(val14).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_1400
     * @tc.name testTypedUArraysSetTestFileA014
     * @tc.desc Verify source Uint16Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      const src = new Uint16Array([100, 200, 300]);
      arr.set(src);
      const val15 = arr[0];
      expect(val15).assertEqual(100);
      const val16 = arr[1];
      expect(val16).assertEqual(200);
      const val17 = arr[2];
      expect(val17).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_1500
     * @tc.name testTypedUArraysSetTestFileA015
     * @tc.desc Verify source Uint32Array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      const src = new Uint32Array([1000, 2000, 3000]);
      arr.set(src);
      const val18 = arr[0];
      expect(val18).assertEqual(1000);
      const val19 = arr[1];
      expect(val19).assertEqual(2000);
      const val20 = arr[2];
      expect(val20).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_1600
     * @tc.name testTypedUArraysSetTestFileA016
     * @tc.desc Verify source Uint8ClampedArray Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([10, 20, 30]);
      arr.set(src);
      const val21 = arr[0];
      expect(val21).assertEqual(10);
      const val22 = arr[1];
      expect(val22).assertEqual(20);
      const val23 = arr[2];
      expect(val23).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_1700
     * @tc.name testTypedUArraysSetTestFileA017
     * @tc.desc Verify source BigUint64Array BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      const src = new BigUint64Array([10n, 20n, 30n]);
      arr.set(src);
      const val24 = arr[0];
      expect(val24).assertEqual(10n);
      const val25 = arr[1];
      expect(val25).assertEqual(20n);
      const val26 = arr[2];
      expect(val26).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_1800
     * @tc.name testTypedUArraysSetTestFileA018
     * @tc.desc Verify source Double Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set([10, 20, 30]);
      const val27 = arr[0];
      expect(val27).assertEqual(10);
      const val28 = arr[1];
      expect(val28).assertEqual(20);
      const val29 = arr[2];
      expect(val29).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_1900
     * @tc.name testTypedUArraysSetTestFileA019
     * @tc.desc Verify source Double Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.set([100, 200, 300]);
      const val30 = arr[0];
      expect(val30).assertEqual(100);
      const val31 = arr[1];
      expect(val31).assertEqual(200);
      const val32 = arr[2];
      expect(val32).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_2000
     * @tc.name testTypedUArraysSetTestFileA020
     * @tc.desc Verify source Double Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      arr.set([1000, 2000, 3000]);
      const val33 = arr[0];
      expect(val33).assertEqual(1000);
      const val34 = arr[1];
      expect(val34).assertEqual(2000);
      const val35 = arr[2];
      expect(val35).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_2100
     * @tc.name testTypedUArraysSetTestFileA021
     * @tc.desc Verify source BigInt BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      arr.set([10n, 20n, 30n]);
      const val36 = arr[0];
      expect(val36).assertEqual(10n);
      const val37 = arr[1];
      expect(val37).assertEqual(20n);
      const val38 = arr[2];
      expect(val38).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_2200
     * @tc.name testTypedUArraysSetTestFileA022
     * @tc.desc Verify source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.set([]);
      const val39 = arr[0];
      expect(val39).assertEqual(1);
      const val40 = arr[1];
      expect(val40).assertEqual(2);
      const val41 = arr[2];
      expect(val41).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_2300
     * @tc.name testTypedUArraysSetTestFileA023
     * @tc.desc Verify source Uint8Array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const src = new Uint8Array(0);
      arr.set(src);
      const val42 = arr[0];
      expect(val42).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_2400
     * @tc.name testTypedUArraysSetTestFileA024
     * @tc.desc Verify source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set([42]);
      const val43 = arr[0];
      expect(val43).assertEqual(42);
      const val44 = arr[1];
      expect(val44).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_2500
     * @tc.name testTypedUArraysSetTestFileA025
     * @tc.desc Verify source Uint8Array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const src = new Uint8Array([42]);
      arr.set(src);
      const val45 = arr[0];
      expect(val45).assertEqual(42);
      const val46 = arr[1];
      expect(val46).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_2600
     * @tc.name testTypedUArraysSetTestFileA026
     * @tc.desc Verify source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.set([0, 0, 0]);
      const val47 = arr[0];
      expect(val47).assertEqual(0);
      const val48 = arr[1];
      expect(val48).assertEqual(0);
      const val49 = arr[2];
      expect(val49).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_2700
     * @tc.name testTypedUArraysSetTestFileA027
     * @tc.desc Verify source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set([7, 7, 7]);
      const val50 = arr[0];
      expect(val50).assertEqual(7);
      const val51 = arr[1];
      expect(val51).assertEqual(7);
      const val52 = arr[2];
      expect(val52).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_2800
     * @tc.name testTypedUArraysSetTestFileA028
     * @tc.desc Verify source 10 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      arr.set([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      const val53 = arr[0];
      expect(val53).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_2900
     * @tc.name testTypedUArraysSetTestFileA029
     * @tc.desc Verify source Uint8Array 10 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const src = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      arr.set(src);
      const val55 = arr[0];
      expect(val55).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_3000
     * @tc.name testTypedUArraysSetTestFileA030
     * @tc.desc Verify source Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([0]);
      const val57 = arr[0];
      expect(val57).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_3100
     * @tc.name testTypedUArraysSetTestFileA031
     * @tc.desc Verify source Uint8Array 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([255]);
      const val58 = arr[0];
      expect(val58).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_3200
     * @tc.name testTypedUArraysSetTestFileA032
     * @tc.desc Verify source Uint8Array 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([127]);
      const val59 = arr[0];
      expect(val59).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_3300
     * @tc.name testTypedUArraysSetTestFileA033
     * @tc.desc Verify source Uint8Array 0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([0x80]);
      const val60 = arr[0];
      expect(val60).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_3400
     * @tc.name testTypedUArraysSetTestFileA034
     * @tc.desc Verify source Uint8Array 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([0xFF]);
      const val61 = arr[0];
      expect(val61).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_3500
     * @tc.name testTypedUArraysSetTestFileA035
     * @tc.desc Verify source Uint8Array 0x00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([0x00]);
      const val62 = arr[0];
      expect(val62).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_3600
     * @tc.name testTypedUArraysSetTestFileA036
     * @tc.desc Verify source Uint8Array 256 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([256]);
      const val63 = arr[0];
      expect(val63).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_3700
     * @tc.name testTypedUArraysSetTestFileA037
     * @tc.desc Verify source Uint8Array -1 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([-1]);
      const val64 = arr[0];
      expect(val64).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_3800
     * @tc.name testTypedUArraysSetTestFileA038
     * @tc.desc Verify source Uint8Array 0x100 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([0x100]);
      const val65 = arr[0];
      expect(val65).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_3900
     * @tc.name testTypedUArraysSetTestFileA039
     * @tc.desc Verify source Uint16Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0]);
      arr.set([0]);
      const val66 = arr[0];
      expect(val66).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_4000
     * @tc.name testTypedUArraysSetTestFileA040
     * @tc.desc Verify source Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0]);
      arr.set([65535]);
      const val67 = arr[0];
      expect(val67).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_4100
     * @tc.name testTypedUArraysSetTestFileA041
     * @tc.desc Verify source Uint16Array 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0]);
      arr.set([32767]);
      const val68 = arr[0];
      expect(val68).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_4200
     * @tc.name testTypedUArraysSetTestFileA042
     * @tc.desc Verify source Uint16Array 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0]);
      arr.set([0x8000]);
      const val69 = arr[0];
      expect(val69).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_4300
     * @tc.name testTypedUArraysSetTestFileA043
     * @tc.desc Verify source Uint16Array 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0]);
      arr.set([0xFFFF]);
      const val70 = arr[0];
      expect(val70).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_4400
     * @tc.name testTypedUArraysSetTestFileA044
     * @tc.desc Verify source Uint16Array 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0]);
      arr.set([65536]);
      const val71 = arr[0];
      expect(val71).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_4500
     * @tc.name testTypedUArraysSetTestFileA045
     * @tc.desc Verify source Uint16Array -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0]);
      arr.set([-1]);
      const val72 = arr[0];
      expect(val72).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_4600
     * @tc.name testTypedUArraysSetTestFileA046
     * @tc.desc Verify source Uint16Array 0x10000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0]);
      arr.set([0x10000]);
      const val73 = arr[0];
      expect(val73).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_4700
     * @tc.name testTypedUArraysSetTestFileA047
     * @tc.desc Verify source Uint32Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      arr.set([0]);
      const val74 = arr[0];
      expect(val74).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_4800
     * @tc.name testTypedUArraysSetTestFileA048
     * @tc.desc Verify source Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      arr.set([4294967295]);
      const val75 = arr[0];
      expect(val75).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_4900
     * @tc.name testTypedUArraysSetTestFileA049
     * @tc.desc Verify source Uint32Array 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      arr.set([2147483647]);
      const val76 = arr[0];
      expect(val76).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_5000
     * @tc.name testTypedUArraysSetTestFileA050
     * @tc.desc Verify source Uint32Array 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      arr.set([0x80000000]);
      const val77 = arr[0];
      expect(val77).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_5100
     * @tc.name testTypedUArraysSetTestFileA051
     * @tc.desc Verify source Uint32Array 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      arr.set([0xFFFFFFFF]);
      const val78 = arr[0];
      expect(val78).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_5200
     * @tc.name testTypedUArraysSetTestFileA052
     * @tc.desc Verify source Uint32Array Uint8Array 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      const src = new Uint32Array([0xFFFFFFFF]);
      arr.set(src);
      const val79 = arr[0];
      expect(val79).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_5300
     * @tc.name testTypedUArraysSetTestFileA053
     * @tc.desc Verify source Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set([256, -1, 128]);
      const val80 = arr[0];
      expect(val80).assertEqual(255);
      const val81 = arr[1];
      expect(val81).assertEqual(0);
      const val82 = arr[2];
      expect(val82).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_5400
     * @tc.name testTypedUArraysSetTestFileA054
     * @tc.desc Verify source BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n]);
      arr.set([BigInt('18446744073709551615'), BigInt('0')]);
      const val83 = arr[0];
      expect(val83).assertEqual(BigInt('18446744073709551615'));
      const val84 = arr[1];
      expect(val84).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST01_5500
     * @tc.name testTypedUArraysSetTestFileA055
     * @tc.desc Verify set Uint8Array offset bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileA055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.set(new Uint8Array([1, 2]), 2);
      const val85 = arr[2];
      expect(val85).assertEqual(1);
      const val86 = arr[3];
      expect(val86).assertEqual(2);
    });

  });
}
