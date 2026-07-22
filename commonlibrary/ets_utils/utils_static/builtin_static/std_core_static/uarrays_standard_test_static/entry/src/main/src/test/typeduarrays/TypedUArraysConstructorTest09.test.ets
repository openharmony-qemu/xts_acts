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

import { afterAll, afterEach, beforeAll, beforeEach, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import { hypiumDescribe as describe } from '../../../../hypium/hypiumApi';
import Utils from '../Util.test';

export default function typedUArraysConstructorTest09(): void {
  describe('TypedUArraysConstructorTest09', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0100
     * @tc.name testTypedUArraysConstructor0401_001
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysConstructor0401_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0200
     * @tc.name testTypedUArraysConstructor0401_002
     * @tc.desc Verify 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0300
     * @tc.name testTypedUArraysConstructor0401_003
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0400
     * @tc.name testTypedUArraysConstructor0401_004
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const arr = new Uint16Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0500
     * @tc.name testTypedUArraysConstructor0401_005
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const arr = new Uint32Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0600
     * @tc.name testTypedUArraysConstructor0401_006
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0700
     * @tc.name testTypedUArraysConstructor0401_007
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0800
     * @tc.name testTypedUArraysConstructor0401_008
     * @tc.desc Verify [0] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0];
      const arr = new Uint8Array(src);
      const val0: number = arr[0];
      expect(val0).assertEqual(0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0900
     * @tc.name testTypedUArraysConstructor0401_009
     * @tc.desc Verify [255] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [255];
      const arr = new Uint8Array(src);
      const val1: number = arr[0];
      expect(val1).assertEqual(255);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1000
     * @tc.name testTypedUArraysConstructor0401_010
     * @tc.desc Verify [0xFF] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0xFF];
      const arr = new Uint8Array(src);
      const val2: number = arr[0];
      expect(val2).assertEqual(255);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1100
     * @tc.name testTypedUArraysConstructor0401_011
     * @tc.desc Verify [0] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0];
      const arr = new Uint16Array(src);
      const val3: number = arr[0];
      expect(val3).assertEqual(0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1200
     * @tc.name testTypedUArraysConstructor0401_012
     * @tc.desc Verify [65535] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [65535];
      const arr = new Uint16Array(src);
      const val4: number = arr[0];
      expect(val4).assertEqual(65535);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1300
     * @tc.name testTypedUArraysConstructor0401_013
     * @tc.desc Verify [0xFFFF] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0xFFFF];
      const arr = new Uint16Array(src);
      const val5: number = arr[0];
      expect(val5).assertEqual(65535);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1400
     * @tc.name testTypedUArraysConstructor0401_014
     * @tc.desc Verify [0] Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0];
      const arr = new Uint32Array(src);
      const val6: number = arr[0];
      expect(val6).assertEqual(0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1500
     * @tc.name testTypedUArraysConstructor0401_015
     * @tc.desc Verify [4294967295] Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysConstructor0401_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [4294967295];
      const arr = new Uint32Array(src);
      expect(arr[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1600
     * @tc.name testTypedUArraysConstructor0401_016
     * @tc.desc Verify [0] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0];
      const arr = new Uint8ClampedArray(src);
      const val9: number = arr[0];
      expect(val9).assertEqual(0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1700
     * @tc.name testTypedUArraysConstructor0401_017
     * @tc.desc Verify [255] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [255];
      const arr = new Uint8ClampedArray(src);
      const val10: number = arr[0];
      expect(val10).assertEqual(0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1800
     * @tc.name testTypedUArraysConstructor0401_018
     * @tc.desc Verify [0n] BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0n];
      const arr = new BigUint64Array(src);
      const val11: BigInt = arr[0];
      expect(val11).assertEqual(0n);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1900
     * @tc.name testTypedUArraysConstructor0401_019
     * @tc.desc Verify [BigInt('18446744073709551615')] BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [BigInt('18446744073709551615')];
      const arr = new BigUint64Array(src);
      const val12: BigInt = arr[0];
      expect(val12).assertEqual(BigInt('18446744073709551615'));
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2000
     * @tc.name testTypedUArraysConstructor0401_020
     * @tc.desc Verify [1,2,3] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint8Array(src);
      const val13: number = arr[0];
      expect(val13).assertEqual(1);
      const val14: number = arr[1];
      expect(val14).assertEqual(2);
      const val15: number = arr[2];
      expect(val15).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2100
     * @tc.name testTypedUArraysConstructor0401_021
     * @tc.desc Verify [0,127,255] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 127, 255];
      const arr = new Uint8Array(src);
      const val16: number = arr[0];
      expect(val16).assertEqual(0);
      const val17: number = arr[1];
      expect(val17).assertEqual(127);
      const val18: number = arr[2];
      expect(val18).assertEqual(255);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2200
     * @tc.name testTypedUArraysConstructor0401_022
     * @tc.desc Verify [0x00,0x7F,0xFF] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0x00, 0x7F, 0xFF];
      const arr = new Uint8Array(src);
      const val19: number = arr[0];
      expect(val19).assertEqual(0);
      const val20: number = arr[1];
      expect(val20).assertEqual(127);
      const val21: number = arr[2];
      expect(val21).assertEqual(255);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2300
     * @tc.name testTypedUArraysConstructor0401_023
     * @tc.desc Verify [0,1,65535] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 65535];
      const arr = new Uint16Array(src);
      const val22: number = arr[0];
      expect(val22).assertEqual(0);
      const val23: number = arr[1];
      expect(val23).assertEqual(1);
      const val24: number = arr[2];
      expect(val24).assertEqual(65535);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2400
     * @tc.name testTypedUArraysConstructor0401_024
     * @tc.desc Verify [0,1,4294967295] Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 4294967295];
      const arr = new Uint32Array(src);
      const val25: number = arr[0];
      expect(val25).assertEqual(0);
      const val26: number = arr[1];
      expect(val26).assertEqual(1);
      const val27: number = arr[2];
      expect(val27).assertEqual(4294967295);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2500
     * @tc.name testTypedUArraysConstructor0401_025
     * @tc.desc Verify [0n,1n,BigInt('18446744073709551615')] BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0n, 1n, BigInt('18446744073709551615')];
      const arr = new BigUint64Array(src);
      const val28: BigInt = arr[0];
      expect(val28).assertEqual(0n);
      const val29: BigInt = arr[1];
      expect(val29).assertEqual(1n);
      const val30: BigInt = arr[2];
      expect(val30).assertEqual(BigInt('18446744073709551615'));
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2600
     * @tc.name testTypedUArraysConstructor0401_026
     * @tc.desc Verify 255 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [255];
      const arr = new Uint8Array(src);
      const val31: number = arr[0];
      expect(val31).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2700
     * @tc.name testTypedUArraysConstructor0401_027
     * @tc.desc Verify 0xFF Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0xFF];
      const arr = new Uint8Array(src);
      const val32: number = arr[0];
      expect(val32).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2800
     * @tc.name testTypedUArraysConstructor0401_028
     * @tc.desc Verify 65535 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [65535];
      const arr = new Uint16Array(src);
      const val33: number = arr[0];
      expect(val33).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2900
     * @tc.name testTypedUArraysConstructor0401_029
     * @tc.desc Verify 0xFFFF Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0xFFFF];
      const arr = new Uint16Array(src);
      const val34: number = arr[0];
      expect(val34).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3000
     * @tc.name testTypedUArraysConstructor0401_030
     * @tc.desc Verify 4294967295 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysConstructor0401_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [4294967295];
      const arr = new Uint32Array(src);
      expect(arr[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3100
     * @tc.name testTypedUArraysConstructor0401_031
     * @tc.desc Verify 0xFFFFFFFF Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysConstructor0401_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0xFFFFFFFF];
      const arr = new Uint32Array(src);
      expect(arr[0]).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3200
     * @tc.name testTypedUArraysConstructor0401_032
     * @tc.desc Verify BigInt('18446744073709551615') BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [BigInt('18446744073709551615')];
      const arr = new BigUint64Array(src);
      const val37: BigInt = arr[0];
      expect(val37).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3300
     * @tc.name testTypedUArraysConstructor0401_033
     * @tc.desc Verify 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0];
      const arr = new Uint8Array(src);
      const val38: number = arr[0];
      expect(val38).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3400
     * @tc.name testTypedUArraysConstructor0401_034
     * @tc.desc Verify 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0];
      const arr = new Uint16Array(src);
      const val39: number = arr[0];
      expect(val39).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3500
     * @tc.name testTypedUArraysConstructor0401_035
     * @tc.desc Verify 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0];
      const arr = new Uint32Array(src);
      const val40: number = arr[0];
      expect(val40).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3600
     * @tc.name testTypedUArraysConstructor0401_036
     * @tc.desc Verify 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0];
      const arr = new Uint8ClampedArray(src);
      const val41: number = arr[0];
      expect(val41).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3700
     * @tc.name testTypedUArraysConstructor0401_037
     * @tc.desc Verify 0n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0n];
      const arr = new BigUint64Array(src);
      const val42: BigInt = arr[0];
      expect(val42).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3800
     * @tc.name testTypedUArraysConstructor0401_038
     * @tc.desc Verify -1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [-1];
      const arr = new Uint8Array(src);
      const val43: number = arr[0];
      expect(val43).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3900
     * @tc.name testTypedUArraysConstructor0401_039
     * @tc.desc Verify -1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [-1];
      const arr = new Uint16Array(src);
      const val44: number = arr[0];
      expect(val44).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_4000
     * @tc.name testTypedUArraysConstructor0401_040
     * @tc.desc Verify -1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [-1];
      const arr = new Uint32Array(src);
      const val45: number = arr[0];
      expect(val45).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_4100
     * @tc.name testTypedUArraysConstructor0401_041
     * @tc.desc Verify -1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [-1];
      const arr = new Uint8ClampedArray(src);
      const val46: number = arr[0];
      expect(val46).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_4200
     * @tc.name testTypedUArraysConstructor0401_042
     * @tc.desc Verify 256 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [256];
      const arr = new Uint8Array(src);
      const val47: number = arr[0];
      expect(val47).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_4300
     * @tc.name testTypedUArraysConstructor0401_043
     * @tc.desc Verify 0x100 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0x100];
      const arr = new Uint8Array(src);
      const val48: number = arr[0];
      expect(val48).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_4400
     * @tc.name testTypedUArraysConstructor0401_044
     * @tc.desc Verify 65536 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [65536];
      const arr = new Uint16Array(src);
      const val49: number = arr[0];
      expect(val49).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_4500
     * @tc.name testTypedUArraysConstructor0401_045
     * @tc.desc Verify 0x10000 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0x10000];
      const arr = new Uint16Array(src);
      const val50: number = arr[0];
      expect(val50).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_4600
     * @tc.name testTypedUArraysConstructor0401_046
     * @tc.desc Verify 4294967296 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysConstructor0401_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [4294967296];
      const arr = new Uint32Array(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_4700
     * @tc.name testTypedUArraysConstructor0401_047
     * @tc.desc Verify 0x100000000 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysConstructor0401_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x100000000];
      const arr = new Uint32Array(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_5000
     * @tc.name testTypedUArraysConstructor0401_050
     * @tc.desc Verify 256 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
  });
}
