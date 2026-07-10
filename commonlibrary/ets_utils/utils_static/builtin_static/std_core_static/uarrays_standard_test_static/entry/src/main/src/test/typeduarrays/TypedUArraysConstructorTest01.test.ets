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

function _getNullArg(): ArrayBuffer | null {
  return null;
}

export default function typedUArraysConstructorTest01(): void {
  describe('TypedUArraysConstructorTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_0100
     * @tc.name testTypedUArraysConstructor01001
     * @tc.desc Verify 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_0200
     * @tc.name testTypedUArraysConstructor01002
     * @tc.desc Verify 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_0300
     * @tc.name testTypedUArraysConstructor01003
     * @tc.desc Verify 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_0400
     * @tc.name testTypedUArraysConstructor01004
     * @tc.desc Verify 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_0500
     * @tc.name testTypedUArraysConstructor01005
     * @tc.desc Verify 0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_0600
     * @tc.name testTypedUArraysConstructor01006
     * @tc.desc Verify 0 TypedArray Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      expect(true).assertTrue();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_0700
     * @tc.name testTypedUArraysConstructor01007
     * @tc.desc Verify 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_0800
     * @tc.name testTypedUArraysConstructor01008
     * @tc.desc Verify 1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_0900
     * @tc.name testTypedUArraysConstructor01009
     * @tc.desc Verify length 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_1000
     * @tc.name testTypedUArraysConstructor01010
     * @tc.desc Verify length 1 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      const val0 = arr[0];
      expect(val0).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_1100
     * @tc.name testTypedUArraysConstructor01011
     * @tc.desc Verify length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3.9);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_1200
     * @tc.name testTypedUArraysConstructor01012
     * @tc.desc Verify length NaN 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(Number.NaN);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_1300
     * @tc.name testTypedUArraysConstructor01013
     * @tc.desc Verify 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(3);
      const val1 = arr[0];
      expect(val1).assertEqual(0);
      const val2 = arr[1];
      expect(val2).assertEqual(0);
      const val3 = arr[2];
      expect(val3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_1400
     * @tc.name testTypedUArraysConstructor01014
     * @tc.desc Verify Uint8ClampedArray 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      const val4 = arr[0];
      expect(val4).assertEqual(0);
      const val5: number = arr[1];
      expect(val5).assertEqual(0);
      const val6: number = arr[2];
      expect(val6).assertEqual(0);
      const val7: number = arr[3];
      expect(val7).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_1500
     * @tc.name testTypedUArraysConstructor01015
     * @tc.desc Verify BigUint64Array 0n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(2);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_1600
     * @tc.name testTypedUArraysConstructor01016
     * @tc.desc Verify length RangeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try { new Uint8Array(-1);  } catch (e) { expect(true).assertTrue(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_1700
     * @tc.name testTypedUArraysConstructor01017
     * @tc.desc Verify length RangeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try { new BigUint64Array(-5);  } catch (e) { expect(true).assertTrue(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_1800
     * @tc.name testTypedUArraysConstructor01018
     * @tc.desc Verify Infinity length RangeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try { new Uint8Array(Number.POSITIVE_INFINITY);  } catch (e) { expect(true).assertTrue(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_1900
     * @tc.name testTypedUArraysConstructor01019
     * @tc.desc Verify 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_2000
     * @tc.name testTypedUArraysConstructor01020
     * @tc.desc Verify 1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      const arr = new BigUint64Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_2100
     * @tc.name testTypedUArraysConstructor01021
     * @tc.desc Verify source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(0);
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_2200
     * @tc.name testTypedUArraysConstructor01022
     * @tc.desc Verify Uint8Array Uint16Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([10, 20]);
      const arr = new Uint16Array(src);
      expect(arr.length).assertEqual(2);
      const val10: number = arr[0];
      expect(val10).assertEqual(10);
      const val11: number = arr[1];
      expect(val11).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_2300
     * @tc.name testTypedUArraysConstructor01023
     * @tc.desc Verify Uint16Array BigUint64Array BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([100, 200]);
      const arr = new BigUint64Array([BigInt(src[0]), BigInt(src[1])]);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(100n);
      expect(arr[1]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_2400
     * @tc.name testTypedUArraysConstructor01024
     * @tc.desc Verify Uint8Array Uint32Array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([5, 10, 15]);
      const arr = new Uint32Array(src);
      expect(arr.length).assertEqual(3);
      const val14: number = arr[0];
      expect(val14).assertEqual(5);
      const val15: number = arr[1];
      expect(val15).assertEqual(10);
      const val16: number = arr[2];
      expect(val16).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_2500
     * @tc.name testTypedUArraysConstructor01025
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([10, 20, 30]);
      const arr = new Uint8Array(src);
      const val17: number = arr[0];
      expect(val17).assertEqual(10);
      const val18: number = arr[1];
      expect(val18).assertEqual(20);
      const val19: number = arr[2];
      expect(val19).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_2600
     * @tc.name testTypedUArraysConstructor01026
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const arr = new Uint8Array(src);
      const val20: number = arr[0];
      expect(val20).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_2700
     * @tc.name testTypedUArraysConstructor01027
     * @tc.desc Verify BigUint64Array BigInt BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([255n, 4294967296n]);
      const arr = new BigUint64Array(src);
      expect(arr[0]).assertEqual(255n);
      expect(arr[1]).assertEqual(4294967296n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_2800
     * @tc.name testTypedUArraysConstructor01028
     * @tc.desc Verify source null NullPointerError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try { new Uint8Array(_getNullArg()!); expect().assertFail(); } catch (e) { expect(e.name).assertEqual('NullPointerError'); }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_2900
     * @tc.name testTypedUArraysConstructor01029
     * @tc.desc Verify 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_3000
     * @tc.name testTypedUArraysConstructor01030
     * @tc.desc Verify 1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_3100
     * @tc.name testTypedUArraysConstructor01031
     * @tc.desc Verify TypedArray Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_3200
     * @tc.name testTypedUArraysConstructor01032
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const val23: number = arr[0];
      expect(val23).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_3300
     * @tc.name testTypedUArraysConstructor01033
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1000, 2000, 3000]);
      const val24: number = arr[0];
      expect(val24).assertEqual(1000);
      const val25: number = arr[1];
      expect(val25).assertEqual(2000);
      const val26: number = arr[2];
      expect(val26).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_3400
     * @tc.name testTypedUArraysConstructor01034
     * @tc.desc Verify Uint8ClampedArray Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([300, -10]);
      const val27: number = arr[0];
      expect(val27).assertEqual(255);
      const val28: number = arr[1];
      expect(val28).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_3500
     * @tc.name testTypedUArraysConstructor01035
     * @tc.desc Verify Uint8Array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([300, 400]);
      const val29: number = arr[0];
      expect(val29).assertEqual(44);
      const val30: number = arr[1];
      expect(val30).assertEqual(144);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_3600
     * @tc.name testTypedUArraysConstructor01036
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const val31: number = arr[0];
      expect(val31).assertEqual(1);
      const val32: number = arr[1];
      expect(val32).assertEqual(2);
      const val33: number = arr[2];
      expect(val33).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_3700
     * @tc.name testTypedUArraysConstructor01037
     * @tc.desc Verify BigUint64Array BigInt BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([255n, 65535n]);
      expect(arr[0]).assertEqual(255n);
      expect(arr[1]).assertEqual(65535n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_3800
     * @tc.name testTypedUArraysConstructor01038
     * @tc.desc Verify source null NullPointerError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try { new Uint8Array(_getNullArg()!); expect().assertFail(); } catch (e) { expect(e.name).assertEqual('NullPointerError'); }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_3900
     * @tc.name testTypedUArraysConstructor01039
     * @tc.desc Verify Uint8ClampedArray Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-5, 0, 128, 255, 300]);
      const val36: number = arr[0];
      expect(val36).assertEqual(0);
      const val37: number = arr[1];
      expect(val37).assertEqual(0);
      const val38: number = arr[2];
      expect(val38).assertEqual(128);
      const val39: number = arr[3];
      expect(val39).assertEqual(255);
      const val40: number = arr[4];
      expect(val40).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_4000
     * @tc.name testTypedUArraysConstructor01040
     * @tc.desc Verify Uint8Array 256 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 256, 257]);
      const val41: number = arr[0];
      expect(val41).assertEqual(255);
      const val42: number = arr[1];
      expect(val42).assertEqual(0);
      const val43: number = arr[2];
      expect(val43).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_4100
     * @tc.name testTypedUArraysConstructor01041
     * @tc.desc Verify Uint16Array 65536 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 65536, 65537]);
      const val44: number = arr[0];
      expect(val44).assertEqual(65535);
      const val45: number = arr[1];
      expect(val45).assertEqual(0);
      const val46: number = arr[2];
      expect(val46).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_4200
     * @tc.name testTypedUArraysConstructor01042
     * @tc.desc Verify Uint32Array 4294967296 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 4294967296]);
      const val47: number = arr[0];
      expect(val47).assertEqual(4294967295);
      const val48: number = arr[1];
      expect(val48).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_4300
     * @tc.name testTypedUArraysConstructor01043
     * @tc.desc Verify 1 ArrayBuffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_4400
     * @tc.name testTypedUArraysConstructor01044
     * @tc.desc Verify 2 ArrayBuffer+byteOffset Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_4500
     * @tc.name testTypedUArraysConstructor01045
     * @tc.desc Verify 3 ArrayBuffer+byteOffset+length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_4600
     * @tc.name testTypedUArraysConstructor01046
     * @tc.desc Verify 3 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new BigUint64Array(buf, 0, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_4700
     * @tc.name testTypedUArraysConstructor01047
     * @tc.desc Verify byteOffset 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf, 0);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_4800
     * @tc.name testTypedUArraysConstructor01048
     * @tc.desc Verify byteOffset Uint32Array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, 4, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_4900
     * @tc.name testTypedUArraysConstructor01049
     * @tc.desc Verify length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const arr = new Uint8Array(buf, 2, 5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_5000
     * @tc.name testTypedUArraysConstructor01050
     * @tc.desc Verify length offset buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const arr = new Uint8Array(buf, 3);
      expect(arr.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_5100
     * @tc.name testTypedUArraysConstructor01051
     * @tc.desc Verify length BigUint64Array BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new BigUint64Array(buf, 0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_5200
     * @tc.name testTypedUArraysConstructor01052
     * @tc.desc Verify buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new Uint8Array(buf);
      const writer = new Uint8Array(buf);
      writer.set([10, 20, 30, 40]);
      const val49: number = view[0];
      expect(val49).assertEqual(10);
      const val50: number = view[1];
      expect(val50).assertEqual(20);
      const val51: number = view[2];
      expect(val51).assertEqual(30);
      const val52: number = view[3];
      expect(val52).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_5300
     * @tc.name testTypedUArraysConstructor01053
     * @tc.desc Verify buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf);
      arr[0] = 255;
      const view2 = new Uint8Array(buf);
      const val53: number = view2[0];
      expect(val53).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_5400
     * @tc.name testTypedUArraysConstructor01054
     * @tc.desc Verify BigUint64Array BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new BigUint64Array(buf);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_5500
     * @tc.name testTypedUArraysConstructor01055
     * @tc.desc Verify Uint16Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Uint16Array(buf, 2, 3);
      expect(view.length).assertEqual(3);
      expect(view.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_5600
     * @tc.name testTypedUArraysConstructor01056
     * @tc.desc Verify byteOffset buffer RangeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      try { new Uint8Array(buf, 10);  } catch (e) { expect(true).assertTrue(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_5700
     * @tc.name testTypedUArraysConstructor01057
     * @tc.desc Verify byteOffset RangeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try { new Uint32Array(buf, 1);  } catch (e) { expect(true).assertTrue(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_5800
     * @tc.name testTypedUArraysConstructor01058
     * @tc.desc Verify byteOffset+length buffer RangeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      try { new Uint8Array(buf, 2, 3);  } catch (e) { expect(true).assertTrue(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_5900
     * @tc.name testTypedUArraysConstructor01059
     * @tc.desc Verify byteOffset RangeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      try { new Uint8Array(buf, -1);  } catch (e) { expect(true).assertTrue(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_6000
     * @tc.name testTypedUArraysConstructor01060
     * @tc.desc Verify BigUint64Array byteOffset 8 RangeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try { new BigUint64Array(buf, 1);  } catch (e) { expect(true).assertTrue(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_6100
     * @tc.name testTypedUArraysConstructor01061
     * @tc.desc Verify Uint16Array byteOffset 2 RangeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      try { new Uint16Array(buf, 1);  } catch (e) { expect(true).assertTrue(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor01_6200
     * @tc.name testTypedUArraysConstructor01062
     * @tc.desc Verify buffer null NullPointerError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor01062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try { new Uint8Array(_getNullArg()!); expect().assertFail(); } catch (e) { expect(e.name).assertEqual('NullPointerError'); }
      return;
    });

      return;
  });
}
