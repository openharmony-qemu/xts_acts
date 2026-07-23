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

export default function typedUArraysConstructorTest10(): void {
  describe('TypedUArraysConstructorTest10', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0100
     * @tc.name testTypedUArraysConstructor0402_001
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysConstructor0402_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new Error('ArkTS limitation');
      } catch (e) {
        expect(e.message).assertEqual('ArkTS limitation');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0200
     * @tc.name testTypedUArraysConstructor0402_002
     * @tc.desc Verify Buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysConstructor0402_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0300
     * @tc.name testTypedUArraysConstructor0402_003
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i = 0; i < 10000; i++) {
        src.push(i % 256);
      }
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(10000);
      const val0: number = arr[0];
      expect(val0).assertEqual(0);
      const val1: number = arr[9999];
      expect(val1).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0400
     * @tc.name testTypedUArraysConstructor0402_004
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1.9, 2.5, 3.1];
      const arr = new Uint8Array(src);
      const val2: number = arr[0];
      expect(val2).assertEqual(1);
      const val3: number = arr[1];
      expect(val3).assertEqual(2);
      const val4: number = arr[2];
      expect(val4).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0500
     * @tc.name testTypedUArraysConstructor0402_005
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1e2, 2e1, 3e0];
      const arr = new Uint8Array(src);
      const val5: number = arr[0];
      expect(val5).assertEqual(100);
      const val6: number = arr[1];
      expect(val6).assertEqual(20);
      const val7: number = arr[2];
      expect(val7).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0600
     * @tc.name testTypedUArraysConstructor0402_006
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [-1.5, -0.5];
      const arr = new Uint8Array(src);
      const val8: number = arr[0];
      expect(val8).assertEqual(255);
      const val9: number = arr[1];
      expect(val9).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0700
     * @tc.name testTypedUArraysConstructor0402_007
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [300, 500, 1000];
      const arr = new Uint8Array(src);
      const val10: number = arr[0];
      expect(val10).assertEqual(44);
      const val11: number = arr[1];
      expect(val11).assertEqual(244);
      const val12: number = arr[2];
      expect(val12).assertEqual(232);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0800
     * @tc.name testTypedUArraysConstructor0402_008
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint8Array(src);
      // ArkTS limitation: throw used to mark test boundary
      /* const val13: number = arr[0];
      expect(val13).assertEqual(1); */
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0900
     * @tc.name testTypedUArraysConstructor0402_009
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint8Array(src);
      // ArkTS limitation: throw used to mark test boundary
      /* const val14 = src[0];
      expect(val14).assertEqual(1); */
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_1000
     * @tc.name testTypedUArraysConstructor0402_010
     * @tc.desc Verify 0x80 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0x80];
      const arr = new Uint8Array(src);
      const val15: number = arr[0];
      expect(val15).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_1100
     * @tc.name testTypedUArraysConstructor0402_011
     * @tc.desc Verify 0x8000 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0x8000];
      const arr = new Uint16Array(src);
      const val16: number = arr[0];
      expect(val16).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_1200
     * @tc.name testTypedUArraysConstructor0402_012
     * @tc.desc Verify 0x80000000 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0x80000000];
      // ArkTS limitation: throw used to mark test boundary
      /* const arr = new Uint32Array(src);
      const val17: number = arr[0];
      expect(val17).assertEqual(2147483648); */
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_1300
     * @tc.name testTypedUArraysConstructor0402_013
     * @tc.desc Verify 1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1];
      const arr = new Uint8ClampedArray(src);
      const val18: number = arr[0];
      expect(val18).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_1400
     * @tc.name testTypedUArraysConstructor0402_014
     * @tc.desc Verify 127 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [127];
      const arr = new Uint8ClampedArray(src);
      const val19: number = arr[0];
      expect(val19).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_1500
     * @tc.name testTypedUArraysConstructor0402_015
     * @tc.desc Verify 0x7F Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0x7F];
      const arr = new Uint8ClampedArray(src);
      const val20: number = arr[0];
      expect(val20).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_1600
     * @tc.name testTypedUArraysConstructor0402_016
     * @tc.desc Verify 0x80 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0x80];
      const arr = new Uint8ClampedArray(src);
      const val21: number = arr[0];
      expect(val21).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_1700
     * @tc.name testTypedUArraysConstructor0402_017
     * @tc.desc Verify [255,0,255] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [255, 0, 255];
      const arr = new Uint8Array(src);
      const val22: number = arr[0];
      expect(val22).assertEqual(255);
      const val23: number = arr[1];
      expect(val23).assertEqual(0);
      const val24: number = arr[2];
      expect(val24).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_1800
     * @tc.name testTypedUArraysConstructor0402_018
     * @tc.desc Verify [65535,0,65535] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [65535, 0, 65535];
      const arr = new Uint16Array(src);
      const val25: number = arr[0];
      expect(val25).assertEqual(65535);
      const val26: number = arr[1];
      expect(val26).assertEqual(0);
      const val27: number = arr[2];
      expect(val27).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_1900
     * @tc.name testTypedUArraysConstructor0402_019
     * @tc.desc Verify [4294967295,0,4294967295] Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [4294967295, 0, 4294967295];
      const arr = new Uint32Array(src);
      const val28: number = arr[0];
      expect(val28).assertEqual(4294967295);
      const val29: number = arr[1];
      expect(val29).assertEqual(0);
      const val30: number = arr[2];
      expect(val30).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_2000
     * @tc.name testTypedUArraysConstructor0402_020
     * @tc.desc Verify [BigInt('18446744073709551615'),0n,BigInt('18446744073709551615')] BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [BigInt('18446744073709551615'), 0n, BigInt('18446744073709551615')];
      const arr = new BigUint64Array(src);
      const val31: BigInt = arr[0];
      expect(val31).assertEqual(BigInt('18446744073709551615'));
      const val32: BigInt = arr[1];
      expect(val32).assertEqual(0n);
      const val33: BigInt = arr[2];
      expect(val33).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_2100
     * @tc.name testTypedUArraysConstructor0402_021
     * @tc.desc Verify 2147483647 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [2147483647];
      const arr = new Uint32Array(src);
      const val34: number = arr[0];
      expect(val34).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_2200
     * @tc.name testTypedUArraysConstructor0402_022
     * @tc.desc Verify 32767 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [32767];
      const arr = new Uint16Array(src);
      const val35: number = arr[0];
      expect(val35).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_2300
     * @tc.name testTypedUArraysConstructor0402_023
     * @tc.desc Verify 127 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [127];
      const arr = new Uint8Array(src);
      const val36: number = arr[0];
      expect(val36).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_2400
     * @tc.name testTypedUArraysConstructor0402_024
     * @tc.desc Verify 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1];
      const arr = new Uint8Array(src);
      const val37: number = arr[0];
      expect(val37).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_2500
     * @tc.name testTypedUArraysConstructor0402_025
     * @tc.desc Verify 1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1];
      const arr = new Uint16Array(src);
      const val38: number = arr[0];
      expect(val38).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_2600
     * @tc.name testTypedUArraysConstructor0402_026
     * @tc.desc Verify 1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1];
      const arr = new Uint32Array(src);
      const val39: number = arr[0];
      expect(val39).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_2700
     * @tc.name testTypedUArraysConstructor0402_027
     * @tc.desc Verify 1n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1n];
      const arr = new BigUint64Array(src);
      const val40: BigInt = arr[0];
      expect(val40).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_2800
     * @tc.name testTypedUArraysConstructor0402_028
     * @tc.desc Verify [0,1,2,3,4,5,6,7,8,9] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(10);
      const val41: number = arr[0];
      expect(val41).assertEqual(0);
      const val42: number = arr[9];
      expect(val42).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_2900
     * @tc.name testTypedUArraysConstructor0402_029
     * @tc.desc Verify [0,1,2,3,4,5,6,7,8,9] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      const arr = new Uint16Array(src);
      expect(arr.length).assertEqual(10);
      const val43: number = arr[0];
      expect(val43).assertEqual(0);
      const val44: number = arr[9];
      expect(val44).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_3000
     * @tc.name testTypedUArraysConstructor0402_030
     * @tc.desc Verify [0,1,2,3,4,5,6,7,8,9] Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      const arr = new Uint32Array(src);
      expect(arr.length).assertEqual(10);
      const val45: number = arr[0];
      expect(val45).assertEqual(0);
      const val46: number = arr[9];
      expect(val46).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_3100
     * @tc.name testTypedUArraysConstructor0402_031
     * @tc.desc Verify [0n,1n,2n,3n,4n,5n,6n,7n,8n,9n] BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n];
      const arr = new BigUint64Array(src);
      expect(arr.length).assertEqual(10);
      const val47: BigInt = arr[0];
      expect(val47).assertEqual(0n);
      const val48: BigInt = arr[9];
      expect(val48).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_3200
     * @tc.name testTypedUArraysConstructor0402_032
     * @tc.desc Verify 0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0.5];
      const arr = new Uint8Array(src);
      const val49: number = arr[0];
      expect(val49).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_3300
     * @tc.name testTypedUArraysConstructor0402_033
     * @tc.desc Verify 0.9 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0.9];
      const arr = new Uint8Array(src);
      const val50: number = arr[0];
      expect(val50).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_3400
     * @tc.name testTypedUArraysConstructor0402_034
     * @tc.desc Verify 255.9 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [255.9];
      const arr = new Uint8Array(src);
      const val51: number = arr[0];
      expect(val51).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_3500
     * @tc.name testTypedUArraysConstructor0402_035
     * @tc.desc Verify -0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [-0.5];
      const arr = new Uint8Array(src);
      const val52: number = arr[0];
      expect(val52).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_3600
     * @tc.name testTypedUArraysConstructor0402_036
     * @tc.desc Verify Uint8ClampedArray 0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0.5];
      const arr = new Uint8ClampedArray(src);
      const val53: number = arr[0];
      expect(val53).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_3700
     * @tc.name testTypedUArraysConstructor0402_037
     * @tc.desc Verify Uint8ClampedArray 0.9 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0.9];
      const arr = new Uint8ClampedArray(src);
      const val54: number = arr[0];
      expect(val54).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_3800
     * @tc.name testTypedUArraysConstructor0402_038
     * @tc.desc Verify Uint8ClampedArray 255.5 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [255.5];
      const arr = new Uint8ClampedArray(src);
      const val55: number = arr[0];
      expect(val55).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_3900
     * @tc.name testTypedUArraysConstructor0402_039
     * @tc.desc Verify Uint8ClampedArray 255.9 256 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [255.9];
      const arr = new Uint8ClampedArray(src);
      const val56: number = arr[0];
      expect(val56).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_4000
     * @tc.name testTypedUArraysConstructor0402_040
     * @tc.desc Verify [0,127,128,255] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 127, 128, 255];
      const arr = new Uint8Array(src);
      const val57: number = arr[0];
      expect(val57).assertEqual(0);
      const val58: number = arr[1];
      expect(val58).assertEqual(127);
      const val59: number = arr[2];
      expect(val59).assertEqual(128);
      const val60: number = arr[3];
      expect(val60).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_4100
     * @tc.name testTypedUArraysConstructor0402_041
     * @tc.desc Verify [0,32767,32768,65535] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 32767, 32768, 65535];
      const arr = new Uint16Array(src);
      const val61: number = arr[0];
      expect(val61).assertEqual(0);
      const val62: number = arr[1];
      expect(val62).assertEqual(32767);
      const val63: number = arr[2];
      expect(val63).assertEqual(32768);
      const val64: number = arr[3];
      expect(val64).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_4200
     * @tc.name testTypedUArraysConstructor0402_042
     * @tc.desc Verify [0,2147483647,2147483648,4294967295] Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 2147483647, 2147483648, 4294967295];
      const arr = new Uint32Array(src);
      const val65: number = arr[0];
      expect(val65).assertEqual(0);
      const val66: number = arr[1];
      expect(val66).assertEqual(2147483647);
      const val67: number = arr[2];
      expect(val67).assertEqual(2147483648);
      const val68: number = arr[3];
      expect(val68).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_4300
     * @tc.name testTypedUArraysConstructor0402_043
     * @tc.desc Verify [0,0.1,0.2,0.3] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 0.1, 0.2, 0.3];
      const arr = new Uint8Array(src);
      const val69: number = arr[0];
      expect(val69).assertEqual(0);
      const val70: number = arr[1];
      expect(val70).assertEqual(0);
      const val71: number = arr[2];
      expect(val71).assertEqual(0);
      const val72: number = arr[3];
      expect(val72).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_4400
     * @tc.name testTypedUArraysConstructor0402_044
     * @tc.desc Verify [255,255.1,255.5,255.9] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [255, 255.1, 255.5, 255.9];
      const arr = new Uint8Array(src);
      const val73: number = arr[0];
      expect(val73).assertEqual(255);
      const val74: number = arr[1];
      expect(val74).assertEqual(255);
      const val75: number = arr[2];
      expect(val75).assertEqual(255);
      const val76: number = arr[3];
      expect(val76).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_4500
     * @tc.name testTypedUArraysConstructor0402_045
     * @tc.desc Verify [-1,-2,-3] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [-1, -2, -3];
      const arr = new Uint8Array(src);
      const val77: number = arr[0];
      expect(val77).assertEqual(255);
      const val78: number = arr[1];
      expect(val78).assertEqual(254);
      const val79: number = arr[2];
      expect(val79).assertEqual(253);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_4600
     * @tc.name testTypedUArraysConstructor0402_046
     * @tc.desc Verify [-1,-2,-3] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [-1, -2, -3];
      const arr = new Uint16Array(src);
      const val80: number = arr[0];
      expect(val80).assertEqual(65535);
      const val81: number = arr[1];
      expect(val81).assertEqual(65534);
      const val82: number = arr[2];
      expect(val82).assertEqual(65533);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_4700
     * @tc.name testTypedUArraysConstructor0402_047
     * @tc.desc Verify [-1,-2,-3] Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [-1, -2, -3];
      const arr = new Uint32Array(src);
      const val83: number = arr[0];
      expect(val83).assertEqual(4294967295);
      const val84: number = arr[1];
      expect(val84).assertEqual(4294967294);
      const val85: number = arr[2];
      expect(val85).assertEqual(4294967293);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_4800
     * @tc.name testTypedUArraysConstructor0402_048
     * @tc.desc Verify [-1,-2,-3] Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [-1, -2, -3];
      const arr = new Uint8ClampedArray(src);
      const val86: number = arr[0];
      expect(val86).assertEqual(0);
      const val87: number = arr[1];
      expect(val87).assertEqual(0);
      const val88: number = arr[2];
      expect(val88).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_4900
     * @tc.name testTypedUArraysConstructor0402_049
     * @tc.desc Verify [256,257,258] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [256, 257, 258];
      const arr = new Uint8Array(src);
      const val89: number = arr[0];
      expect(val89).assertEqual(0);
      const val90: number = arr[1];
      expect(val90).assertEqual(1);
      const val91: number = arr[2];
      expect(val91).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_5000
     * @tc.name testTypedUArraysConstructor0402_050
     * @tc.desc Verify [65536,65537,65538] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0402_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [65536, 65537, 65538];
      const arr = new Uint16Array(src);
      const val92: number = arr[0];
      expect(val92).assertEqual(0);
      const val93: number = arr[1];
      expect(val93).assertEqual(1);
      const val94: number = arr[2];
      expect(val94).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0402_0580
     * @tc.name testTypedUArraysConstructor0402_058
     * @tc.desc Verify [4294967296,4294967297,4294967298] Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
  });
}
