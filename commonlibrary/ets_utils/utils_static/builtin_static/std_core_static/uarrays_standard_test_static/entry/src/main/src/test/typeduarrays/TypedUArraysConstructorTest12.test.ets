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

export default function typedUArraysConstructorTest12(): void {
  describe('TypedUArraysConstructorTest12', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_0100
     * @tc.name testTypedUArraysConstructor050102_001
     * @tc.desc Verify - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(100);
      for (let i=  0; i < 100; i++) {
      }
      const copy = new Uint32Array(src);
      expect(copy.length).assertEqual(100);
      const val0 = copy[0];
      expect(val0).assertEqual(0);
      const val1 = copy[99];
      expect(val1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_0200
     * @tc.name testTypedUArraysConstructor050102_002
     * @tc.desc Verify - byteOffset Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(40);
      const parent = new Uint8Array(buf, 0, 20);
      const child = new Uint8Array(buf, 20, 20);
      expect(parent.byteOffset).assertEqual(0);
      expect(child.byteOffset).assertEqual(20);
      expect(child.byteOffset - parent.byteOffset).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_0300
     * @tc.name testTypedUArraysConstructor050102_003
     * @tc.desc Verify - byteLength Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(40);
      const child = new Uint16Array(buf, 20, 5);
      expect(child.byteLength).assertEqual(10);
      expect(child.buffer.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_0400
     * @tc.name testTypedUArraysConstructor050102_004
     * @tc.desc Verify - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(48);
      const v1 = new Uint32Array(buf, 0, 2);
      const v2 = new Uint32Array(buf, 8, 2);
      const v3 = new Uint32Array(buf, 16, 2);
      expect(v1.byteOffset).assertEqual(0);
      expect(v2.byteOffset).assertEqual(8);
      expect(v3.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_0500
     * @tc.name testTypedUArraysConstructor050102_005
     * @tc.desc Verify - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const v1 = new BigUint64Array(buf, 0, 4);
      const v2 = new BigUint64Array(buf, 8, 3);
      const val2 = v2[0];
      expect(val2).assertEqual(0n);
      const val3 = v1[2];
      expect(val3).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_0600
     * @tc.name testTypedUArraysConstructor050102_006
     * @tc.desc Verify - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const init = new Uint8Array(buf);
      init[0] = 1;
      init[8] = 2;
      init[16] = 3;
      const v1 = new Uint8ClampedArray(buf, 0, 16);
      const v2 = new Uint8ClampedArray(buf, 8, 16);
      const v3 = new Uint8ClampedArray(buf, 16, 16);
      const val4 = v1[0];
      expect(val4).assertEqual(1);
      const val5 = v2[0];
      expect(val5).assertEqual(2);
      const val6 = v3[0];
      expect(val6).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_0700
     * @tc.name testTypedUArraysConstructor050102_007
     * @tc.desc Verify - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const init = new Uint8Array(buf);
      init[0] = 10;
      init[1] = 20;
      init[16] = 30;
      init[17] = 40;
      const v1 = new Uint8Array(buf, 0, 16);
      const v2 = new Uint8Array(buf, 16, 16);
      const val7 = v1[0];
      expect(val7).assertEqual(10);
      const val8 = v1[1];
      expect(val8).assertEqual(20);
      const val9 = v2[0];
      expect(val9).assertEqual(30);
      const val10 = v2[1];
      expect(val10).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_0800
     * @tc.name testTypedUArraysConstructor050102_008
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const values = [100, 20, 3];
      const arr = new Uint8Array(values);
      expect(arr.length).assertEqual(3);
      const val11: number = arr[0];
      expect(val11).assertEqual(100);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_0900
     * @tc.name testTypedUArraysConstructor050102_009
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const values = [32767, 0, 65535];
      const arr = new Uint16Array(values);
      expect(arr.length).assertEqual(3);
      const val12: number = arr[0];
      expect(val12).assertEqual(32767);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_1000
     * @tc.name testTypedUArraysConstructor050102_010
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const values = [-1, 0, 1];
      const arr = new Uint32Array(values);
      expect(arr.length).assertEqual(3);
      const val13: number = arr[0];
      expect(val13).assertEqual(4294967295);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_1100
     * @tc.name testTypedUArraysConstructor050102_011
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const values = [0n, BigInt('18446744073709551615'), 1n];
      const arr = new BigUint64Array(values);
      expect(arr.length).assertEqual(3);
      const val14 = arr[0];
      expect(val14).assertEqual(0n);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_1200
     * @tc.name testTypedUArraysConstructor050102_012
     * @tc.desc Verify Uint8ClampedArray vs Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [256, -1, 300, 0];
      const clamped = new Uint8ClampedArray(src);
      const uint8 = new Uint8Array(src);
      const val15 = clamped[0];
      expect(val15).assertEqual(255);
      const val16 = uint8[0];
      expect(val16).assertEqual(0);
      const val17 = clamped[1];
      expect(val17).assertEqual(0);
      const val18 = uint8[1];
      expect(val18).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_1300
     * @tc.name testTypedUArraysConstructor050102_013
     * @tc.desc Verify BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [0n, 1n, BigInt('18446744073709551615')];
      const arr = new BigUint64Array(src);
      expect(arr.length).assertEqual(3);
      const val19 = arr[0];
      expect(val19).assertEqual(0n);
      const val20 = arr[1];
      expect(val20).assertEqual(1n);
      const val21 = arr[2];
      expect(val21).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_1400
     * @tc.name testTypedUArraysConstructor050102_014
     * @tc.desc Verify BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array(1);
      const b = new Uint16Array(1);
      const c = new Uint32Array(1);
      const d = new BigUint64Array(1);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_1500
     * @tc.name testTypedUArraysConstructor050102_015
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const v1 = new Uint8Array(buf, 1);
      const v2 = new Uint8Array(buf, 3);
      expect(v1.byteOffset).assertEqual(1);
      expect(v2.byteOffset).assertEqual(3);
      expect(v1.length).assertEqual(31);
      expect(v2.length).assertEqual(29);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_1600
     * @tc.name testTypedUArraysConstructor050102_016
     * @tc.desc Verify - length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array();
      const b = new Uint8Array(0);
      const c = new Uint8Array(5);
      const d = new Uint8Array([1, 2]);
      const e = new Uint8Array(new ArrayBuffer(16));
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(0);
      expect(c.length).assertEqual(5);
      expect(d.length).assertEqual(2);
      expect(e.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_1700
     * @tc.name testTypedUArraysConstructor050102_017
     * @tc.desc Verify - byteLength Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint16Array();
      const b = new Uint16Array(5);
      const c = new Uint16Array([1, 2, 3]);
      const d = new Uint16Array(new ArrayBuffer(24));
      expect(a.byteLength).assertEqual(0);
      expect(b.byteLength).assertEqual(10);
      expect(c.byteLength).assertEqual(6);
      expect(d.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_1800
     * @tc.name testTypedUArraysConstructor050102_018
     * @tc.desc Verify - byteOffset Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array();
      const b = new Uint32Array(5);
      const c = new Uint32Array([1]);
      const buf = new ArrayBuffer(16);
      const d = new Uint32Array(buf);
      expect(a.byteOffset).assertEqual(0);
      expect(b.byteOffset).assertEqual(0);
      expect(c.byteOffset).assertEqual(0);
      expect(d.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_1900
     * @tc.name testTypedUArraysConstructor050102_019
     * @tc.desc Verify - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      const copy = new BigUint64Array(src);
      expect(copy.length).assertEqual(src.length);
      expect(copy.byteLength).assertEqual(src.byteLength);
      expect(copy.byteOffset).assertEqual(src.byteOffset);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(BigUint64Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_2000
     * @tc.name testTypedUArraysConstructor050102_020
     * @tc.desc Verify - buffer Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(40);
      const view = new Uint8ClampedArray(buf, 8, 10);
      expect(view.buffer).assertEqual(buf);
      expect(view.buffer.byteLength).assertEqual(40);
      expect(view.byteLength).assertEqual(10);
      expect(view.byteOffset).assertEqual(8);
      expect(view.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0102_2100
     * @tc.name testTypedUArraysConstructor050102_021
     * @tc.desc Verify - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050102_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Uint16Array(buf, 1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const valid = new Uint16Array(buf, 0);
      expect(typeof valid).assertEqual('object');
      expect(valid.length).assertEqual(8);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

  });
}
