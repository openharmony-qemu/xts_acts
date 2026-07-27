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

export default function typedUArraysSetTest02(): void {
  describe('TypedUArraysSetTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_0100
     * @tc.name testTypedUArraysSetPart102_001
     * @tc.desc Verify offset 1.5 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.set(new Uint8Array([1, 2]), 1.5.valueOf().toInt());
      const val0 = arr[1];
      expect(val0).assertEqual(1);
      const val1 = arr[2];
      expect(val1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_0200
     * @tc.name testTypedUArraysSetPart102_002
     * @tc.desc Verify offset -Number.MAX_SAFE_INTEGER source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([0, 0, 0]);
        arr.set(new Uint8Array([1, 2]), (-Number.MAX_SAFE_INTEGER).valueOf().toInt());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_0300
     * @tc.name testTypedUArraysSetPart102_003
     * @tc.desc Verify source 128 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([128]);
      const val2 = arr[0];
      expect(val2).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_0400
     * @tc.name testTypedUArraysSetPart102_004
     * @tc.desc Verify source 0x80 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([0x80]);
      const val3 = arr[0];
      expect(val3).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_0500
     * @tc.name testTypedUArraysSetPart102_005
     * @tc.desc Verify source 0o100 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([0o100]);
      const val4 = arr[0];
      expect(val4).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_0600
     * @tc.name testTypedUArraysSetPart102_006
     * @tc.desc Verify source 0b10000000 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([0b10000000]);
      const val5 = arr[0];
      expect(val5).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_0700
     * @tc.name testTypedUArraysSetPart102_007
     * @tc.desc Verify source 1e2 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([1e2]);
      const val6 = arr[0];
      expect(val6).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_0800
     * @tc.name testTypedUArraysSetPart102_008
     * @tc.desc Verify source 0xFFFF Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0]);
      arr.set([0xFFFF]);
      const val7 = arr[0];
      expect(val7).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_0900
     * @tc.name testTypedUArraysSetPart102_009
     * @tc.desc Verify source 0xFFFFFFFF Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      arr.set([0xFFFFFFFF]);
      const val8 = arr[0];
      expect(val8).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_1000
     * @tc.name testTypedUArraysSetPart102_010
     * @tc.desc Verify source BigInt BigInt('0xFFFFFFFFFFFFFFFF') BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n]);
      arr.set([BigInt('0xFFFFFFFFFFFFFFFF')]);
      const val9 = arr[0];
      expect(val9).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_1100
     * @tc.name testTypedUArraysSetPart102_011
     * @tc.desc Verify source Uint16Array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0]);
      const src = new Uint16Array([256, 512]);
      arr.set(src);
      const val10 = arr[0];
      expect(val10).assertEqual(0);
      const val11 = arr[1];
      expect(val11).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_1200
     * @tc.name testTypedUArraysSetPart102_012
     * @tc.desc Verify source Uint32Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0]);
      const src = new Uint32Array([65536, 131072]);
      arr.set(src);
      const val12 = arr[0];
      expect(val12).assertEqual(0);
      const val13 = arr[1];
      expect(val13).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_1300
     * @tc.name testTypedUArraysSetPart102_013
     * @tc.desc Verify source Uint8Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      const src = new Uint8Array([10, 20, 30]);
      arr.set(src);
      const val14 = arr[0];
      expect(val14).assertEqual(10);
      const val15 = arr[1];
      expect(val15).assertEqual(20);
      const val16 = arr[2];
      expect(val16).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_1400
     * @tc.name testTypedUArraysSetPart102_014
     * @tc.desc Verify source Uint8ClampedArray Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const src = new Uint8ClampedArray([10, 20, 30]);
      arr.set(src);
      const val17 = arr[0];
      expect(val17).assertEqual(10);
      const val18 = arr[1];
      expect(val18).assertEqual(20);
      const val19 = arr[2];
      expect(val19).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_1500
     * @tc.name testTypedUArraysSetPart102_015
     * @tc.desc Verify source Uint8Array Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8Array([10, 20, 30]);
      arr.set(src);
      const val20 = arr[0];
      expect(val20).assertEqual(10);
      const val21 = arr[1];
      expect(val21).assertEqual(20);
      const val22 = arr[2];
      expect(val22).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_1600
     * @tc.name testTypedUArraysSetPart102_016
     * @tc.desc Verify source null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      try {
        arr.set([1, 2, 3, 4], 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_1700
     * @tc.name testTypedUArraysSetPart102_017
     * @tc.desc Verify source undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([0, 0, 0]);
        arr.set([1, 2, 3, 4], 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_2100
     * @tc.name testTypedUArraysSetPart102_021
     * @tc.desc Verify offset -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([0, 0, 0]);
        arr.set([1], -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_2200
     * @tc.name testTypedUArraysSetPart102_022
     * @tc.desc Verify source 100 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      const src = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
        src[i.toInt()] = i;
      }
      arr.set(src);
      const val23 = arr[0];
      expect(val23).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_2300
     * @tc.name testTypedUArraysSetPart102_023
     * @tc.desc Verify source 1000 Uint8Array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const src = new Uint8Array([1, 2, 3]);
      arr.set(src);
      const val25 = arr[0];
      expect(val25).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_2400
     * @tc.name testTypedUArraysSetPart102_024
     * @tc.desc Verify source -1 Uint8Array 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([-1]);
      const val27 = arr[0];
      expect(val27).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_2500
     * @tc.name testTypedUArraysSetPart102_025
     * @tc.desc Verify source -256 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      arr.set([-256]);
      const val28 = arr[0];
      expect(val28).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_2600
     * @tc.name testTypedUArraysSetPart102_026
     * @tc.desc Verify source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set([-1, 0, 256]);
      const val29 = arr[0];
      expect(val29).assertEqual(255);
      const val30 = arr[1];
      expect(val30).assertEqual(0);
      const val31 = arr[2];
      expect(val31).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_2700
     * @tc.name testTypedUArraysSetPart102_027
     * @tc.desc Verify source -1 Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0]);
      arr.set([-1]);
      const val32 = arr[0];
      expect(val32).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_2800
     * @tc.name testTypedUArraysSetPart102_028
     * @tc.desc Verify source -1 Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      arr.set([-1]);
      const val33 = arr[0];
      expect(val33).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_2900
     * @tc.name testTypedUArraysSetPart102_029
     * @tc.desc Verify set undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      let result = arr.set([1, 2, 3]);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_3000
     * @tc.name testTypedUArraysSetPart102_030
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      arr.set([1, 2], 1);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_3100
     * @tc.name testTypedUArraysSetPart102_031
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set([10, 20, 30]);
      const val34 = arr[0];
      expect(val34).assertEqual(10);
      const val35 = arr[1];
      expect(val35).assertEqual(20);
      const val36 = arr[2];
      expect(val36).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_3200
     * @tc.name testTypedUArraysSetPart102_032
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const arr = new Uint8Array([0, 0, 0]);
      arr.set(src);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_3300
     * @tc.name testTypedUArraysSetPart102_033
     * @tc.desc Verify set source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.set([]);
      const val38 = arr[0];
      expect(val38).assertEqual(1);
      const val39 = arr[1];
      expect(val39).assertEqual(2);
      const val40 = arr[2];
      expect(val40).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_3400
     * @tc.name testTypedUArraysSetPart102_034
     * @tc.desc Verify set Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set([1, 2, 3]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_3500
     * @tc.name testTypedUArraysSetPart102_035
     * @tc.desc Verify set Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.set([1, 2, 3]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_3600
     * @tc.name testTypedUArraysSetPart102_036
     * @tc.desc Verify set BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      arr.set([1n, 2n, 3n]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_3700
     * @tc.name testTypedUArraysSetPart102_037
     * @tc.desc Verify offset Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([0, 0, 0]);
        arr.set([1, 2, 3], 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_3800
     * @tc.name testTypedUArraysSetPart102_038
     * @tc.desc Verify offset Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint16Array([0, 0, 0]);
        arr.set([1, 2, 3], 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_3900
     * @tc.name testTypedUArraysSetPart102_039
     * @tc.desc Verify offset Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint32Array([0, 0, 0]);
        arr.set([1, 2, 3], 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_4000
     * @tc.name testTypedUArraysSetPart102_040
     * @tc.desc Verify offset Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8ClampedArray([0, 0, 0]);
        arr.set([1, 2, 3], 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_4100
     * @tc.name testTypedUArraysSetPart102_041
     * @tc.desc Verify offset BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new BigUint64Array([0n, 0n, 0n]);
        arr.set([1n, 2n, 3n], 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_4200
     * @tc.name testTypedUArraysSetPart102_042
     * @tc.desc Verify source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.set([]);
      const val41 = arr[0];
      expect(val41).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_4300
     * @tc.name testTypedUArraysSetPart102_043
     * @tc.desc Verify source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set([42]);
      const val42 = arr[0];
      expect(val42).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SET_PART102_4400
     * @tc.name testTypedUArraysSetPart102_044
     * @tc.desc Verify offset source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetPart102_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([0, 0, 0]);
        arr.set([1, 2, 3, 4], -2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

  });
}
