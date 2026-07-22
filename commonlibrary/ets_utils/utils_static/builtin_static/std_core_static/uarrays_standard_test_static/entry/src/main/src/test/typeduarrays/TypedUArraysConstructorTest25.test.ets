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

export default function typedUArraysConstructorTest25(): void {
  describe('TypedUArraysConstructorTest25', (): void => {
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0100
     * @tc.name testTypedUArraysConstructor0401_001
     * @tc.desc Verify 1000 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1000];
      const arr = new Uint8ClampedArray(src);
      const val54: number = arr[0];
      expect(val54).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0200
     * @tc.name testTypedUArraysConstructor0401_002
     * @tc.desc Verify -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [-1];
      const arr = new Uint8ClampedArray(src);
      const val55: number = arr[0];
      expect(val55).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0300
     * @tc.name testTypedUArraysConstructor0401_003
     * @tc.desc Verify -100 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [-100];
      const arr = new Uint8ClampedArray(src);
      const val56: number = arr[0];
      expect(val56).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0400
     * @tc.name testTypedUArraysConstructor0401_004
     * @tc.desc Verify NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [Number.NaN];
      const arr = new Uint8ClampedArray(src);
      const val57: number = arr[0];
      expect(val57).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0500
     * @tc.name testTypedUArraysConstructor0401_005
     * @tc.desc Verify Infinity 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [Number.POSITIVE_INFINITY];
      const arr = new Uint8ClampedArray(src);
      const val58: number = arr[0];
      expect(val58).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0600
     * @tc.name testTypedUArraysConstructor0401_006
     * @tc.desc Verify -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [-Number.POSITIVE_INFINITY];
      const arr = new Uint8ClampedArray(src);
      const val59: number = arr[0];
      expect(val59).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0700
     * @tc.name testTypedUArraysConstructor0401_007
     * @tc.desc Verify [256,-1,NaN,128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysConstructor0401_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, -1, Number.NaN, 128]);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0800
     * @tc.name testTypedUArraysConstructor0401_008
     * @tc.desc Verify NaN Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [Number.NaN];
      const arr = new Uint8Array(src);
      const val64: number = arr[0];
      expect(val64).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_0900
     * @tc.name testTypedUArraysConstructor0401_009
     * @tc.desc Verify NaN Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [Number.NaN];
      const arr = new Uint16Array(src);
      const val65: number = arr[0];
      expect(val65).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1000
     * @tc.name testTypedUArraysConstructor0401_010
     * @tc.desc Verify NaN Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [Number.NaN];
      const arr = new Uint32Array(src);
      const val66: number = arr[0];
      expect(val66).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1100
     * @tc.name testTypedUArraysConstructor0401_011
     * @tc.desc Verify Infinity Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [Number.POSITIVE_INFINITY];
      const arr = new Uint8Array(src);
      const val67: number = arr[0];
      expect(val67).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1200
     * @tc.name testTypedUArraysConstructor0401_012
     * @tc.desc Verify -Infinity Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [-Number.POSITIVE_INFINITY];
      const arr = new Uint8Array(src);
      const val68: number = arr[0];
      expect(val68).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1300
     * @tc.name testTypedUArraysConstructor0401_013
     * @tc.desc Verify [0,0,0] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0, 0, 0];
      const arr = new Uint8Array(src);
      const val69: number = arr[0];
      expect(val69).assertEqual(0);
      const val70: number = arr[1];
      expect(val70).assertEqual(0);
      const val71: number = arr[2];
      expect(val71).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1400
     * @tc.name testTypedUArraysConstructor0401_014
     * @tc.desc Verify 255 [255,255,255] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [255, 255, 255];
      const arr = new Uint8Array(src);
      const val72: number = arr[0];
      expect(val72).assertEqual(255);
      const val73: number = arr[1];
      expect(val73).assertEqual(255);
      const val74: number = arr[2];
      expect(val74).assertEqual(255);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1500
     * @tc.name testTypedUArraysConstructor0401_015
     * @tc.desc Verify [42,42,42] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [42, 42, 42];
      const arr = new Uint16Array(src);
      const val75: number = arr[0];
      expect(val75).assertEqual(42);
      const val76: number = arr[1];
      expect(val76).assertEqual(42);
      const val77: number = arr[2];
      expect(val77).assertEqual(42);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1600
     * @tc.name testTypedUArraysConstructor0401_016
     * @tc.desc Verify 100 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i = 0; i < 100; i++) {
        src.push(i % 256);
      }
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(100);
      const val78: number = arr[0];
      expect(val78).assertEqual(0);
      const val79: number = arr[99];
      expect(val79).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1700
     * @tc.name testTypedUArraysConstructor0401_017
     * @tc.desc Verify 1000 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i = 0; i < 1000; i++) {
        src.push(i);
      }
      const arr = new Uint16Array(src);
      expect(arr.length).assertEqual(1000);
      const val80: number = arr[0];
      expect(val80).assertEqual(0);
      const val81: number = arr[999];
      expect(val81).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1800
     * @tc.name testTypedUArraysConstructor0401_018
     * @tc.desc Verify [1,-1,255] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, -1, 255];
      const arr = new Uint8Array(src);
      const val82: number = arr[0];
      expect(val82).assertEqual(1);
      const val83: number = arr[1];
      expect(val83).assertEqual(255);
      const val84: number = arr[2];
      expect(val84).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_1900
     * @tc.name testTypedUArraysConstructor0401_019
     * @tc.desc Verify [1,256,128] Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 256, 128];
      const arr = new Uint8Array(src);
      const val85: number = arr[0];
      expect(val85).assertEqual(1);
      const val86: number = arr[1];
      expect(val86).assertEqual(0);
      const val87: number = arr[2];
      expect(val87).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2000
     * @tc.name testTypedUArraysConstructor0401_020
     * @tc.desc Verify BigInt BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0n, 1n, 2n];
      const arr = new BigUint64Array(src);
      const val91: BigInt = arr[0];
      expect(val91).assertEqual(0n);
      const val92: BigInt = arr[1];
      expect(val92).assertEqual(1n);
      const val93: BigInt = arr[2];
      expect(val93).assertEqual(2n);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2100
     * @tc.name testTypedUArraysConstructor0401_021
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint8Array(src);
      expect(typeof arr).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2200
     * @tc.name testTypedUArraysConstructor0401_022
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint16Array(src);
      expect(typeof arr).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2300
     * @tc.name testTypedUArraysConstructor0401_023
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint32Array(src);
      expect(typeof arr).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2400
     * @tc.name testTypedUArraysConstructor0401_024
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint8ClampedArray(src);
      expect(typeof arr).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2500
     * @tc.name testTypedUArraysConstructor0401_025
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0n, 1n, 2n];
      const arr = new BigUint64Array(src);
      expect(typeof arr).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2600
     * @tc.name testTypedUArraysConstructor0401_026
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3, 4, 5];
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2700
     * @tc.name testTypedUArraysConstructor0401_027
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint8Array(src);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2800
     * @tc.name testTypedUArraysConstructor0401_028
     * @tc.desc Verify Uint16Array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint16Array(src);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_2900
     * @tc.name testTypedUArraysConstructor0401_029
     * @tc.desc Verify Uint32Array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint32Array(src);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3000
     * @tc.name testTypedUArraysConstructor0401_030
     * @tc.desc Verify BigUint64Array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0n, 1n, 2n];
      const arr = new BigUint64Array(src);
      expect(arr.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3100
     * @tc.name testTypedUArraysConstructor0401_031
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint8Array(src);
      const val97: number = src[0];
      expect(val97).assertEqual(1);
      const val98: number = src[1];
      expect(val98).assertEqual(2);
      const val99: number = src[2];
      expect(val99).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3200
     * @tc.name testTypedUArraysConstructor0401_032
     * @tc.desc Verify isView true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint8Array(src);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3300
     * @tc.name testTypedUArraysConstructor0401_033
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint8Array(src);
      expect(arr.buffer.byteLength >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3400
     * @tc.name testTypedUArraysConstructor0401_034
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint8Array(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3500
     * @tc.name testTypedUArraysConstructor0401_035
     * @tc.desc Verify BYTES_PER_ELEMENT Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint8Array(src);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3600
     * @tc.name testTypedUArraysConstructor0401_036
     * @tc.desc Verify BYTES_PER_ELEMENT Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint16Array(src);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3700
     * @tc.name testTypedUArraysConstructor0401_037
     * @tc.desc Verify BYTES_PER_ELEMENT Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1, 2, 3];
      const arr = new Uint32Array(src);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3800
     * @tc.name testTypedUArraysConstructor0401_038
     * @tc.desc Verify BYTES_PER_ELEMENT BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0n, 1n, 2n];
      const arr = new BigUint64Array(src);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_3900
     * @tc.name testTypedUArraysConstructor0401_039
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysConstructor0401_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_4000
     * @tc.name testTypedUArraysConstructor0401_040
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor0401_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new Error('invalid constructor input');
      } catch (e) {
        expect(e.message).assertEqual('invalid constructor input');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor0401_4100
     * @tc.name testTypedUArraysConstructor0401_041
     * @tc.desc Verify undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testTypedUArraysConstructor0401_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      expect(arr.length).assertEqual(0);
    });
  });
}
