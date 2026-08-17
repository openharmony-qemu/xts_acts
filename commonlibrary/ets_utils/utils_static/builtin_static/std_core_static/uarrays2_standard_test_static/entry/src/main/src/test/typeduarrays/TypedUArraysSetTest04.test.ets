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

export default function typedUArraysSetTest04(): void {
  describe('TypedUArraysSetTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_0100
     * @tc.name testTypedUArraysSetTestFileD001
     * @tc.desc Verify set(source) Uint8Array 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      const src = new Uint8Array([1, 2, 3, 4, 5]);
      arr.set(src);
      const val0 = arr[0];
      expect(val0).assertEqual(1);
      const val1 = arr[4];
      expect(val1).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_0200
     * @tc.name testTypedUArraysSetTestFileD002
     * @tc.desc Verify set(source) Uint16Array 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(5);
      const src = new Uint16Array([10, 20, 30, 40, 50]);
      arr.set(src);
      const val2 = arr[0];
      expect(val2).assertEqual(10);
      const val3 = arr[4];
      expect(val3).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_0300
     * @tc.name testTypedUArraysSetTestFileD003
     * @tc.desc Verify set(source) Uint32Array 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(5);
      const src = new Uint32Array([100, 200, 300, 400, 500]);
      arr.set(src);
      const val4 = arr[0];
      expect(val4).assertEqual(100);
      const val5 = arr[4];
      expect(val5).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_0400
     * @tc.name testTypedUArraysSetTestFileD004
     * @tc.desc Verify set(source) Uint8ClampedArray 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      const src = new Uint8ClampedArray([255, 128, 0, 10, 5]);
      arr.set(src);
      const val6 = arr[0];
      expect(val6).assertEqual(255);
      const val7 = arr[2];
      expect(val7).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_0500
     * @tc.name testTypedUArraysSetTestFileD005
     * @tc.desc Verify set(source) BigUint64Array 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(5);
      const src = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.set(src);
      const val8 = arr[0];
      expect(val8).assertEqual(1n);
      const val9 = arr[4];
      expect(val9).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_0600
     * @tc.name testTypedUArraysSetTestFileD006
     * @tc.desc Verify set(source, offset) Uint8Array 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      const src = new Uint8Array([1, 2, 3]);
      arr.set(src, 2);
      const val10 = arr[0];
      expect(val10).assertEqual(0);
      const val11 = arr[2];
      expect(val11).assertEqual(1);
      const val12 = arr[4];
      expect(val12).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_0700
     * @tc.name testTypedUArraysSetTestFileD007
     * @tc.desc Verify set(source, offset) Uint16Array 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(5);
      const src = new Uint16Array([10, 20]);
      arr.set(src, 3);
      const val13 = arr[0];
      expect(val13).assertEqual(0);
      const val14 = arr[3];
      expect(val14).assertEqual(10);
      const val15 = arr[4];
      expect(val15).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_0800
     * @tc.name testTypedUArraysSetTestFileD008
     * @tc.desc Verify set(source, offset) Uint32Array 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(5);
      const src = new Uint32Array([100, 200]);
      arr.set(src, 1);
      const val16 = arr[0];
      expect(val16).assertEqual(0);
      const val17 = arr[1];
      expect(val17).assertEqual(100);
      const val18 = arr[2];
      expect(val18).assertEqual(200);
      const val19 = arr[3];
      expect(val19).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_0900
     * @tc.name testTypedUArraysSetTestFileD009
     * @tc.desc Verify set(source, offset) Uint8ClampedArray 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      const src = new Uint8ClampedArray([255, 0]);
      arr.set(src, 0);
      const val20 = arr[0];
      expect(val20).assertEqual(255);
      const val21 = arr[1];
      expect(val21).assertEqual(0);
      const val22 = arr[2];
      expect(val22).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_1000
     * @tc.name testTypedUArraysSetTestFileD010
     * @tc.desc Verify set(source, offset) BigUint64Array 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(5);
      const src = new BigUint64Array([99n]);
      arr.set(src, 4);
      const val23 = arr[0];
      expect(val23).assertEqual(0n);
      const val24 = arr[3];
      expect(val24).assertEqual(0n);
      const val25 = arr[4];
      expect(val25).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_1100
     * @tc.name testTypedUArraysSetTestFileD011
     * @tc.desc Verify set(source) Uint8Array Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const src = new Uint8Array([10, 20, 30]);
      arr.set(src);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_1200
     * @tc.name testTypedUArraysSetTestFileD012
     * @tc.desc Verify set(source) Uint8Array array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set([10, 20, 30]);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_1300
     * @tc.name testTypedUArraysSetTestFileD013
     * @tc.desc Verify set(source) Uint16Array array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.set([100, 200, 300]);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_1400
     * @tc.name testTypedUArraysSetTestFileD014
     * @tc.desc Verify set(source, offset) Uint8Array offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.set([1, 2, 3], 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_1500
     * @tc.name testTypedUArraysSetTestFileD015
     * @tc.desc Verify set(source, offset) Uint16Array offset=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0, 0]);
      arr.set([10, 20], 2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_1600
     * @tc.name testTypedUArraysSetTestFileD016
     * @tc.desc Verify set(source, offset) Uint32Array offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      arr.set([100, 200, 300], 0);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_1700
     * @tc.name testTypedUArraysSetTestFileD017
     * @tc.desc Verify set(source, offset) Uint8ClampedArray offset=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.set([255, 128], 1);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(128);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_1800
     * @tc.name testTypedUArraysSetTestFileD018
     * @tc.desc Verify set empty source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.set([]);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_1900
     * @tc.name testTypedUArraysSetTestFileD019
     * @tc.desc Verify set empty TypedArray source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const src = new Uint8Array(0);
      arr.set(src);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_2000
     * @tc.name testTypedUArraysSetTestFileD020
     * @tc.desc Verify set Uint8Array source BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      arr.set([1n, 2n, 3n]);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_2100
     * @tc.name testTypedUArraysSetTestFileD021
     * @tc.desc Verify Uint8ClampedArray saturation behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set([-1, 256, 128]);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_2200
     * @tc.name testTypedUArraysSetTestFileD022
     * @tc.desc Verify set Uint8Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0]);
      arr.set([0, 255]);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_2300
     * @tc.name testTypedUArraysSetTestFileD023
     * @tc.desc Verify set Uint16Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0]);
      arr.set([0, 65535]);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_2400
     * @tc.name testTypedUArraysSetTestFileD024
     * @tc.desc Verify set Uint32Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0]);
      arr.set([0, 4294967295]);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_2500
     * @tc.name testTypedUArraysSetTestFileD025
     * @tc.desc Verify set BigUint64Array boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n]);
      arr.set([0n, BigInt('18446744073709551615')]);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SETTEST04_2600
     * @tc.name testTypedUArraysSetTestFileD026
     * @tc.desc Verify set BigUint64Array overflow behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSetTestFileD026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n]);
      arr.set([BigInt('18446744073709551616')]);
      expect(arr[0]).assertEqual(0n);
    });

  });
}
