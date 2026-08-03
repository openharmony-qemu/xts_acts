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

export default function typedUArraysSetTest03(): void {
  describe('TypedUArraysSetTest03', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0100
     * @tc.name testTypedUArraysSetTestFileC001
     * @tc.desc Verify set(source) 8 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      const src = new Uint8Array([10, 20, 30, 40, 50, 60, 70, 80]);
      arr.set(src);
      const val0 = arr[0];
      expect(val0).assertEqual(10);
      const val1 = arr[7];
      expect(val1).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0200
     * @tc.name testTypedUArraysSetTestFileC002
     * @tc.desc Verify set(source) 8 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(8);
      const src = new Uint16Array([100, 200, 300, 400, 500, 600, 700, 800]);
      arr.set(src);
      const val2 = arr[0];
      expect(val2).assertEqual(100);
      const val3 = arr[7];
      expect(val3).assertEqual(800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0300
     * @tc.name testTypedUArraysSetTestFileC003
     * @tc.desc Verify set(source) 8 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(8);
      const src = new Uint32Array([1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000]);
      arr.set(src);
      const val4 = arr[0];
      expect(val4).assertEqual(1000);
      const val5 = arr[7];
      expect(val5).assertEqual(8000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0400
     * @tc.name testTypedUArraysSetTestFileC004
     * @tc.desc Verify set(source) 8 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8);
      const src = new Uint8ClampedArray([10, 20, 30, 40, 50, 60, 70, 80]);
      arr.set(src);
      const val6 = arr[0];
      expect(val6).assertEqual(10);
      const val7 = arr[7];
      expect(val7).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0500
     * @tc.name testTypedUArraysSetTestFileC005
     * @tc.desc Verify set(source) 8 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(8);
      const src = new BigUint64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n, 80n]);
      arr.set(src);
      const val8 = arr[0];
      expect(val8).assertEqual(10n);
      const val9 = arr[7];
      expect(val9).assertEqual(80n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0600
     * @tc.name testTypedUArraysSetTestFileC006
     * @tc.desc Verify set(source, offset) offset=0 Uint8Array 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(6);
      const src = new Uint8Array([1, 2, 3]);
      arr.set(src, 0);
      const val10 = arr[0];
      expect(val10).assertEqual(1);
      const val11 = arr[2];
      expect(val11).assertEqual(3);
      const val12 = arr[3];
      expect(val12).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0700
     * @tc.name testTypedUArraysSetTestFileC007
     * @tc.desc Verify set(source, offset) offset=3 Uint16Array 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(6);
      const src = new Uint16Array([10, 20]);
      arr.set(src, 3);
      const val13 = arr[0];
      expect(val13).assertEqual(0);
      const val14 = arr[3];
      expect(val14).assertEqual(10);
      const val15 = arr[4];
      expect(val15).assertEqual(20);
      const val16 = arr[5];
      expect(val16).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0800
     * @tc.name testTypedUArraysSetTestFileC008
     * @tc.desc Verify offset length-1+ Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([0, 0, 0, 0]);
        arr.set([1, 2, 3], 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_0900
     * @tc.name testTypedUArraysSetTestFileC009
     * @tc.desc Verify offset 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.set([99], 3);
      const val17 = arr[0];
      expect(val17).assertEqual(0);
      const val18 = arr[2];
      expect(val18).assertEqual(0);
      const val19 = arr[3];
      expect(val19).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_1000
     * @tc.name testTypedUArraysSetTestFileC010
     * @tc.desc Verify offset n Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0, 0]);
      arr.set([10, 20], 2);
      const val20 = arr[0];
      expect(val20).assertEqual(0);
      const val21 = arr[1];
      expect(val21).assertEqual(0);
      const val22 = arr[2];
      expect(val22).assertEqual(10);
      const val23 = arr[3];
      expect(val23).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_1100
     * @tc.name testTypedUArraysSetTestFileC011
     * @tc.desc Verify offset n Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0, 0]);
      arr.set([100, 200], 2);
      const val24 = arr[0];
      expect(val24).assertEqual(0);
      const val25 = arr[1];
      expect(val25).assertEqual(0);
      const val26 = arr[2];
      expect(val26).assertEqual(100);
      const val27 = arr[3];
      expect(val27).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_1200
     * @tc.name testTypedUArraysSetTestFileC012
     * @tc.desc Verify offset 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set([1, 2, 3], 0);
      const val28 = arr[0];
      expect(val28).assertEqual(1);
      const val29 = arr[1];
      expect(val29).assertEqual(2);
      const val30 = arr[2];
      expect(val30).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_1300
     * @tc.name testTypedUArraysSetTestFileC013
     * @tc.desc Verify offset=2 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.set([255, 128], 2);
      const val31 = arr[0];
      expect(val31).assertEqual(0);
      const val32 = arr[1];
      expect(val32).assertEqual(0);
      const val33 = arr[2];
      expect(val33).assertEqual(255);
      const val34 = arr[3];
      expect(val34).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_1400
     * @tc.name testTypedUArraysSetTestFileC014
     * @tc.desc Verify offset=1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      arr.set([100, 200], 2);
      const val35 = arr[0];
      expect(val35).assertEqual(10);
      const val36 = arr[1];
      expect(val36).assertEqual(20);
      const val37 = arr[2];
      expect(val37).assertEqual(100);
      const val38 = arr[3];
      expect(val38).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_1500
     * @tc.name testTypedUArraysSetTestFileC015
     * @tc.desc Verify BigUint64Array offset=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n, 0n]);
      arr.set([42n, 99n], 2);
      const val39 = arr[0];
      expect(val39).assertEqual(0n);
      const val40 = arr[1];
      expect(val40).assertEqual(0n);
      const val41 = arr[2];
      expect(val41).assertEqual(42n);
      const val42 = arr[3];
      expect(val42).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_1600
     * @tc.name testTypedUArraysSetTestFileC016
     * @tc.desc Verify set offset=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr.set([1, 1, 1], 0);
      arr.set([2, 2, 2], 0);
      const val43 = arr[0];
      expect(val43).assertEqual(2);
      const val44 = arr[1];
      expect(val44).assertEqual(2);
      const val45 = arr[2];
      expect(val45).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_1700
     * @tc.name testTypedUArraysSetTestFileC017
     * @tc.desc Verify set offset=0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      arr.set([10, 20, 30], 0);
      arr.set([99], 0);
      const val46 = arr[0];
      expect(val46).assertEqual(99);
      const val47 = arr[1];
      expect(val47).assertEqual(20);
      const val48 = arr[2];
      expect(val48).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_1800
     * @tc.name testTypedUArraysSetTestFileC018
     * @tc.desc Verify set offset=0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(4);
      arr.set([1, 2, 3], 0);
      arr.set([9, 9], 0);
      const val49 = arr[0];
      expect(val49).assertEqual(9);
      const val50 = arr[1];
      expect(val50).assertEqual(9);
      const val51 = arr[2];
      expect(val51).assertEqual(3);
      const val52 = arr[3];
      expect(val52).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_1900
     * @tc.name testTypedUArraysSetTestFileC019
     * @tc.desc Verify set offset=0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr.set([10, 20, 30], 0);
      arr.set([0], 0);
      const val53 = arr[0];
      expect(val53).assertEqual(0);
      const val54 = arr[1];
      expect(val54).assertEqual(20);
      const val55 = arr[2];
      expect(val55).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_2000
     * @tc.name testTypedUArraysSetTestFileC020
     * @tc.desc Verify set offset=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(3);
      arr.set([10n, 20n, 30n], 0);
      arr.set([99n, 88n], 0);
      const val56 = arr[0];
      expect(val56).assertEqual(99n);
      const val57 = arr[1];
      expect(val57).assertEqual(88n);
      const val58 = arr[2];
      expect(val58).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_2100
     * @tc.name testTypedUArraysSetTestFileC021
     * @tc.desc Verify offset=0 offset=1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(4);
      arr.set([1, 2], 0);
      arr.set([3, 4], 2);
      const val59 = arr[0];
      expect(val59).assertEqual(1);
      const val60 = arr[1];
      expect(val60).assertEqual(2);
      const val61 = arr[2];
      expect(val61).assertEqual(3);
      const val62 = arr[3];
      expect(val62).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_2200
     * @tc.name testTypedUArraysSetTestFileC022
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.set([]);
      const val63 = arr[0];
      expect(val63).assertEqual(1);
      const val64 = arr[1];
      expect(val64).assertEqual(2);
      const val65 = arr[2];
      expect(val65).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_2300
     * @tc.name testTypedUArraysSetTestFileC023
     * @tc.desc Verify Uint8Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const empty = new Uint8Array(0);
      arr.set(empty);
      const val66 = arr[0];
      expect(val66).assertEqual(100);
      const val67 = arr[2];
      expect(val67).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_2400
     * @tc.name testTypedUArraysSetTestFileC024
     * @tc.desc Verify Uint16Array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000]);
      const empty = new Uint16Array(0);
      arr.set(empty);
      const val68 = arr[0];
      expect(val68).assertEqual(1000);
      const val69 = arr[1];
      expect(val69).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_2500
     * @tc.name testTypedUArraysSetTestFileC025
     * @tc.desc Verify Uint8ClampedArray Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const empty = new Uint8ClampedArray(0);
      arr.set(empty);
      const val70 = arr[0];
      expect(val70).assertEqual(10);
      const val71 = arr[2];
      expect(val71).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_2600
     * @tc.name testTypedUArraysSetTestFileC026
     * @tc.desc Verify BigUint64Array BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const empty = new BigUint64Array(0);
      arr.set(empty);
      const val72 = arr[0];
      expect(val72).assertEqual(1n);
      const val73 = arr[2];
      expect(val73).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_2700
     * @tc.name testTypedUArraysSetTestFileC027
     * @tc.desc Verify offset Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.set([], 1);
      const val74 = arr[0];
      expect(val74).assertEqual(1);
      const val75 = arr[1];
      expect(val75).assertEqual(2);
      const val76 = arr[2];
      expect(val76).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_2800
     * @tc.name testTypedUArraysSetTestFileC028
     * @tc.desc Verify subarray set Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(0, 3);
      arr.set(sub, 2);
      const val77 = arr[0];
      expect(val77).assertEqual(1);
      const val78 = arr[1];
      expect(val78).assertEqual(2);
      const val79 = arr[2];
      expect(val79).assertEqual(1);
      const val80 = arr[3];
      expect(val80).assertEqual(2);
      const val81 = arr[4];
      expect(val81).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_2900
     * @tc.name testTypedUArraysSetTestFileC029
     * @tc.desc Verify subarray set Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40]);
      const sub = arr.subarray(1, 3);
      arr.set(sub, 0);
      const val82 = arr[0];
      expect(val82).assertEqual(20);
      const val83 = arr[1];
      expect(val83).assertEqual(30);
      const val84 = arr[2];
      expect(val84).assertEqual(30);
      const val85 = arr[3];
      expect(val85).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_3000
     * @tc.name testTypedUArraysSetTestFileC030
     * @tc.desc Verify subarray set Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400]);
      const sub = arr.subarray(0, 2);
      arr.set(sub, 2);
      const val86 = arr[0];
      expect(val86).assertEqual(100);
      const val87 = arr[1];
      expect(val87).assertEqual(200);
      const val88 = arr[2];
      expect(val88).assertEqual(100);
      const val89 = arr[3];
      expect(val89).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_3100
     * @tc.name testTypedUArraysSetTestFileC031
     * @tc.desc Verify subarray set Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = arr.subarray(2, 4);
      arr.set(sub, 0);
      const val90 = arr[0];
      expect(val90).assertEqual(30);
      const val91 = arr[1];
      expect(val91).assertEqual(40);
      const val92 = arr[2];
      expect(val92).assertEqual(30);
      const val93 = arr[3];
      expect(val93).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_3200
     * @tc.name testTypedUArraysSetTestFileC032
     * @tc.desc Verify subarray set BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const sub = arr.subarray(0, 2);
      arr.set(sub, 2);
      const val94 = arr[0];
      expect(val94).assertEqual(1n);
      const val95 = arr[1];
      expect(val95).assertEqual(2n);
      const val96 = arr[2];
      expect(val96).assertEqual(1n);
      const val97 = arr[3];
      expect(val97).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_3300
     * @tc.name testTypedUArraysSetTestFileC033
     * @tc.desc Verify offset undefined 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set([1, 2, 3], 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_3400
     * @tc.name testTypedUArraysSetTestFileC034
     * @tc.desc Verify offset null 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.set([10, 20, 30], 0);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_3500
     * @tc.name testTypedUArraysSetTestFileC035
     * @tc.desc Verify offset false 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      arr.set([100, 200, 300], 0);
      expect(arr[0]).assertEqual(100);
      expect(arr[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_3600
     * @tc.name testTypedUArraysSetTestFileC036
     * @tc.desc Verify offset 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set([10, 20, 30], 0);
      const val105 = arr[0];
      expect(val105).assertEqual(10);
      const val106 = arr[2];
      expect(val106).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_3700
     * @tc.name testTypedUArraysSetTestFileC037
     * @tc.desc Verify offset 1.9 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.set(new Uint8Array([1, 2]), Math.trunc(1.9).toInt());
      const val107 = arr[0];
      expect(val107).assertEqual(0);
      const val108 = arr[1];
      expect(val108).assertEqual(1);
      const val109 = arr[2];
      expect(val109).assertEqual(2);
      const val110 = arr[3];
      expect(val110).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_3800
     * @tc.name testTypedUArraysSetTestFileC038
     * @tc.desc Verify offset 0.6 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set(new Uint8Array([1, 2, 3]), Math.trunc(0.6).toInt());
      const val111 = arr[0];
      expect(val111).assertEqual(1);
      const val112 = arr[2];
      expect(val112).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_3900
     * @tc.name testTypedUArraysSetTestFileC039
     * @tc.desc Verify offset -0.5 -0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.set(new Uint8Array([1, 2]), Math.trunc(-0.5).toInt());
      const val113 = arr[0];
      expect(val113).assertEqual(1);
      const val114 = arr[1];
      expect(val114).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_4000
     * @tc.name testTypedUArraysSetTestFileC040
     * @tc.desc Verify set buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const arr1 = new Uint8Array(buffer);
      const arr2 = new Uint8Array(buffer);
      arr1.set([10, 20, 30, 40]);
      const val115 = arr2[0];
      expect(val115).assertEqual(10);
      const val116 = arr2[1];
      expect(val116).assertEqual(20);
      const val117 = arr2[2];
      expect(val117).assertEqual(30);
      const val118 = arr2[3];
      expect(val118).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_4100
     * @tc.name testTypedUArraysSetTestFileC041
     * @tc.desc Verify set Uint8Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const u8 = new Uint8Array(buffer);
      u8.set([0x12, 0x34, 0x56, 0x78]);
      const u16 = new Uint16Array(buffer);
      const val119 = u16[0];
      expect(val119).assertEqual(0x3412);
      const val120 = u16[1];
      expect(val120).assertEqual(0x7856);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_4200
     * @tc.name testTypedUArraysSetTestFileC042
     * @tc.desc Verify set Uint8ClampedArray Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(3);
      const clamped = new Uint8ClampedArray(buffer);
      const u8 = new Uint8Array(buffer);
      clamped.set([100, 200, 255]);
      const val121 = u8[0];
      expect(val121).assertEqual(100);
      const val122 = u8[1];
      expect(val122).assertEqual(200);
      const val123 = u8[2];
      expect(val123).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_4300
     * @tc.name testTypedUArraysSetTestFileC043
     * @tc.desc Verify set Uint32Array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      const u32 = new Uint32Array(buffer);
      const u8 = new Uint8Array(buffer);
      u32.set([0x12345678]);
      const val124 = u8[0];
      expect(val124).assertEqual(0x78);
      const val125 = u8[1];
      expect(val125).assertEqual(0x56);
      const val126 = u8[2];
      expect(val126).assertEqual(0x34);
      const val127 = u8[3];
      expect(val127).assertEqual(0x12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_4400
     * @tc.name testTypedUArraysSetTestFileC044
     * @tc.desc Verify set BigUint64Array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const big = new BigUint64Array(buffer);
      const u32 = new Uint32Array(buffer);
      big.set([BigInt('0x123456789ABCDEF0')]);
      const val128 = u32[0];
      expect(val128).assertEqual(0x9ABCDEF0);
      const val129 = u32[1];
      expect(val129).assertEqual(0x12345678);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_4500
     * @tc.name testTypedUArraysSetTestFileC045
     * @tc.desc Verify set Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr.set([11, 22, 33, 44, 55]);
      const val130 = arr[0];
      expect(val130).assertEqual(11);
      const val131 = arr[1];
      expect(val131).assertEqual(22);
      const val132 = arr[2];
      expect(val132).assertEqual(33);
      const val133 = arr[3];
      expect(val133).assertEqual(44);
      const val134 = arr[4];
      expect(val134).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_4600
     * @tc.name testTypedUArraysSetTestFileC046
     * @tc.desc Verify set Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(4);
      arr.set([100, 200, 300, 400]);
      let sum: number = 0;
      for (let i = 0; i < arr.length; i++) {
        sum += arr[i.toInt()];
      }
      expect(sum).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_4700
     * @tc.name testTypedUArraysSetTestFileC047
     * @tc.desc Verify source type mismatch Uint8Array set Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const src = new Uint16Array([256, 512, 1024]);
      arr.set(src);
      const val135 = arr[0];
      expect(val135).assertEqual(0);
      const val136 = arr[1];
      expect(val136).assertEqual(0);
      const val137 = arr[2];
      expect(val137).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_4800
     * @tc.name testTypedUArraysSetTestFileC048
     * @tc.desc Verify source type mismatch Uint16Array set Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      const src = new Uint32Array([65536, 131072, 262144]);
      arr.set(src);
      const val138 = arr[0];
      expect(val138).assertEqual(0);
      const val139 = arr[1];
      expect(val139).assertEqual(0);
      const val140 = arr[2];
      expect(val140).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_4900
     * @tc.name testTypedUArraysSetTestFileC049
     * @tc.desc Verify Uint8ClampedArray set Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8Array([10, 128, 255]);
      arr.set(src);
      const val141 = arr[0];
      expect(val141).assertEqual(10);
      const val142 = arr[1];
      expect(val142).assertEqual(128);
      const val143 = arr[2];
      expect(val143).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET02_5000
     * @tc.name testTypedUArraysSetTestFileC050
     * @tc.desc Verify Uint16Array set BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileC050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      const src = new BigUint64Array([BigInt('0x10000'), BigInt('0x20000'), BigInt('0x30000')]);
      for (let i = 0; i < src.length; i++) {
        arr[i.toInt()] = Number(src[i.toInt()]);
      }
      const val144 = arr[0];
      expect(val144).assertEqual(0);
      const val145 = arr[1];
      expect(val145).assertEqual(0);
      const val146 = arr[2];
      expect(val146).assertEqual(0);
    });

  });
}
