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

export default function typedUArraysConstructorTest13(): void {
  describe('TypedUArraysConstructorTest13', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0100
     * @tc.name testTypedUArraysConstructor050201_001
     * @tc.desc Verify - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(-1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const valid = new Uint32Array(1);
      expect(valid.length).assertEqual(1);
      expect(typeof valid).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0200
     * @tc.name testTypedUArraysConstructor050201_002
     * @tc.desc Verify - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(8);
        new BigUint64Array(buf, 100);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const valid = new BigUint64Array(new ArrayBuffer(16), 0);
      expect(valid.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0300
     * @tc.name testTypedUArraysConstructor050201_003
     * @tc.desc Verify / - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3, 4]);
      new Uint8Array(src);
      expect(src.length).assertEqual(4);
      expect(src.byteLength).assertEqual(4);
      expect(src.byteOffset).assertEqual(0);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0400
     * @tc.name testTypedUArraysConstructor050201_004
     * @tc.desc Verify / - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3, 4]);
      const copy = new Uint16Array(src);
      expect(copy.length).assertEqual(4);
      expect(copy.byteLength).assertEqual(8);
      expect(copy.byteOffset).assertEqual(0);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0500
     * @tc.name testTypedUArraysConstructor050201_005
     * @tc.desc Verify / - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const parent = new Uint32Array(buf, 0, 4);
      new Uint32Array(buf, 16, 2);
      expect(parent.length).assertEqual(4);
      expect(parent.byteLength).assertEqual(16);
      expect(parent.byteOffset).assertEqual(0);
      expect(parent.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0600
     * @tc.name testTypedUArraysConstructor050201_006
     * @tc.desc Verify / - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      new BigUint64Array(buf, 0, 4);
      const child = new BigUint64Array(buf, 16, 2);
      expect(child.length).assertEqual(2);
      expect(child.byteLength).assertEqual(16);
      expect(child.byteOffset).assertEqual(16);
      expect(child.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0700
     * @tc.name testTypedUArraysConstructor050201_007
     * @tc.desc Verify - buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(48);
      const v1 = new Uint8Array(buf, 0, 16);
      const v2 = new Uint8Array(buf, 16, 16);
      const v3 = new Uint8Array(buf, 32, 16);
      expect(v1.buffer).assertEqual(v2.buffer);
      expect(v2.buffer).assertEqual(v3.buffer);
      expect(v1.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0800
     * @tc.name testTypedUArraysConstructor050201_008
     * @tc.desc Verify - buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3]);
      const copy = new Uint16Array(src);
      const val0 = copy[0];
      expect(val0).assertEqual(1);
      const val1 = copy[1];
      expect(val1).assertEqual(2);
      const val2 = src[0];
      expect(val2).assertEqual(1);
      const val3 = src[1];
      expect(val3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0900
     * @tc.name testTypedUArraysConstructor050201_009
     * @tc.desc Verify - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const init = new Uint8Array(buf);
      init[8] = 123;
      init[8 + 4 + 8 + 4] = 456;
      const v1 = new Uint32Array(buf, 0, 4);
      const v2 = new Uint32Array(buf, 8, 4);
      const val4 = v2[0];
      expect(val4).assertEqual(123);
      const val5 = v1[3];
      expect(val5).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1000
     * @tc.name testTypedUArraysConstructor050201_010
     * @tc.desc Verify - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      const copy = new BigUint64Array(src);
      const val6 = src[0];
      expect(val6).assertEqual(1n);
      const val7 = copy[0];
      expect(val7).assertEqual(1n);
      expect(src.length).assertEqual(3);
      expect(copy.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1100
     * @tc.name testTypedUArraysConstructor050201_011
     * @tc.desc Verify - buffer Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const copy = new Uint8ClampedArray(src);
      expect(src.buffer.byteLength).assertEqual(3);
      expect(copy.buffer.byteLength).assertEqual(3);
      const val8 = copy[0];
      expect(val8).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1200
     * @tc.name testTypedUArraysConstructor050201_012
     * @tc.desc Verify - byteOffset Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const src = new Uint8Array(buf, 8, 2);
      const copy = new Uint8Array(src);
      expect(src.byteOffset).assertEqual(8);
      expect(copy.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1300
     * @tc.name testTypedUArraysConstructor050201_013
     * @tc.desc Verify - byteLength Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3, 4]);
      const copy = new Uint16Array(src);
      expect(src.byteLength).assertEqual(copy.byteLength);
      expect(src.byteLength).assertEqual(8);
      expect(copy.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1400
     * @tc.name testTypedUArraysConstructor050201_014
     * @tc.desc Verify - BYTES_PER_ELEMENT Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array([1, 2]);
      const copy = new Uint32Array(src);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(Uint32Array.BYTES_PER_ELEMENT);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1500
     * @tc.name testTypedUArraysConstructor050201_015
     * @tc.desc Verify - name BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n]);
      const copy = new BigUint64Array(src);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(BigUint64Array.BYTES_PER_ELEMENT);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1600
     * @tc.name testTypedUArraysConstructor050201_016
     * @tc.desc Verify - instanceof Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2]);
      const copy = new Uint8ClampedArray(src);
      expect(typeof src).assertEqual('object');
      expect(typeof copy).assertEqual('object');
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1700
     * @tc.name testTypedUArraysConstructor050201_017
     * @tc.desc Verify - ArrayBuffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const copy = new Uint8Array(src);
      expect(typeof src.buffer).assertEqual('object');
      expect(typeof copy.buffer).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1800
     * @tc.name testTypedUArraysConstructor050201_018
     * @tc.desc Verify - buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const src = new Uint16Array(buf, 0, 3);
      const copy = new Uint16Array(src);
      expect(buf.byteLength).assertEqual(24);
      expect(src.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1900
     * @tc.name testTypedUArraysConstructor050201_019
     * @tc.desc Verify - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(48);
      const init = new Uint8Array(buf);
      init[0] = 1;
      init[4] = 2;
      init[16] = 3;
      init[20] = 4;
      init[32] = 5;
      init[36] = 6;
      const v1 = new Uint32Array(buf, 0, 4);
      const v2 = new Uint32Array(buf, 16, 2);
      const v3 = new Uint32Array(buf, 32, 2);
      const val9 = v1[0];
      expect(val9).assertEqual(1);
      const val10 = v1[1];
      expect(val10).assertEqual(2);
      const val11 = v2[0];
      expect(val11).assertEqual(3);
      const val12 = v2[1];
      expect(val12).assertEqual(4);
      const val13 = v3[0];
      expect(val13).assertEqual(5);
      const val14 = v3[1];
      expect(val14).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2000
     * @tc.name testTypedUArraysConstructor050201_020
     * @tc.desc Verify - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      new BigUint64Array(src);
      const val15 = src[0];
      expect(val15).assertEqual(1n);
      const val16 = src[1];
      expect(val16).assertEqual(2n);
      const val17 = src[2];
      expect(val17).assertEqual(3n);
      expect(src.length).assertEqual(3);
      expect(src.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2100
     * @tc.name testTypedUArraysConstructor050201_021
     * @tc.desc Verify - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const copy = new Uint8ClampedArray(src);
      const val18 = copy[0];
      expect(val18).assertEqual(1);
      const val19 = copy[1];
      expect(val19).assertEqual(2);
      const val20 = copy[2];
      expect(val20).assertEqual(3);
      expect(copy.length).assertEqual(3);
      expect(copy.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2200
     * @tc.name testTypedUArraysConstructor050201_022
     * @tc.desc Verify - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const init = new Uint8Array(buf);
      init[8] = 20;
      init[9] = 30;
      init[10] = 40;
      new Uint8Array(buf, 0, 16);
      const v2 = new Uint8Array(buf, 8, 16);
      const val21 = v2[0];
      expect(val21).assertEqual(20);
      const val22 = v2[1];
      expect(val22).assertEqual(30);
      const val23 = v2[2];
      expect(val23).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2300
     * @tc.name testTypedUArraysConstructor050201_023
     * @tc.desc Verify - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const init = new Uint8Array(buf);
      init[8] = 100;
      init[10] = 200;
      init[12] = 300;
      init[14] = 400;
      const parent = new Uint16Array(buf, 0, 8);
      new Uint16Array(buf, 8, 8);
      const val24 = parent[4];
      expect(val24).assertEqual(100);
      const val25 = parent[5];
      expect(val25).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2400
     * @tc.name testTypedUArraysConstructor050201_024
     * @tc.desc Verify - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      new Uint32Array(buf, 0, 8);
      const child = new Uint32Array(buf, 8, 6);
      const val26 = child[0];
      expect(val26).assertEqual(0);
      const val27 = child[1];
      expect(val27).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2500
     * @tc.name testTypedUArraysConstructor050201_025
     * @tc.desc Verify - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(48);
      const init = new Uint8Array(buf);
      init[0] = 1;
      init[8] = 4;
      init[16] = 2;
      init[24] = 5;
      init[32] = 3;
      init[40] = 6;
      const v1 = new BigUint64Array(buf, 0, 4);
      const v2 = new BigUint64Array(buf, 16, 2);
      const v3 = new BigUint64Array(buf, 32, 2);
      const val28 = v1[0];
      expect(val28).assertEqual(1n);
      const val29 = v1[1];
      expect(val29).assertEqual(4n);
      const val30 = v2[0];
      expect(val30).assertEqual(2n);
      const val31 = v2[1];
      expect(val31).assertEqual(5n);
      const val32 = v3[0];
      expect(val32).assertEqual(3n);
      const val33 = v3[1];
      expect(val33).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2600
     * @tc.name testTypedUArraysConstructor050201_026
     * @tc.desc Verify - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const copy = new Uint8ClampedArray(src);
      expect(copy.length).assertEqual(5);
      expect(copy.byteLength).assertEqual(5);
      expect(copy.byteOffset).assertEqual(0);
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
      const val34 = copy[0];
      expect(val34).assertEqual(1);
      const val35 = src[4];
      expect(val35).assertEqual(5);
      const val36 = copy[4];
      expect(val36).assertEqual(5);
      const val37 = src[0];
      expect(val37).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2700
     * @tc.name testTypedUArraysConstructor050201_027
     * @tc.desc Verify - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-10, 0, 255, 256, 1000];
      const arr = new Uint8ClampedArray(src);
      const val38: number = arr[0];
      expect(val38).assertEqual(0);
      const val39: number = arr[1];
      expect(val39).assertEqual(0);
      const val40: number = arr[2];
      expect(val40).assertEqual(255);
      const val41: number = arr[3];
      expect(val41).assertEqual(255);
      const val42: number = arr[4];
      expect(val42).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2800
     * @tc.name testTypedUArraysConstructor050201_028
     * @tc.desc Verify - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1, 0, 255, 256, 511];
      const arr = new Uint8Array(src);
      const val43: number = arr[0];
      expect(val43).assertEqual(255);
      const val44: number = arr[1];
      expect(val44).assertEqual(0);
      const val45: number = arr[2];
      expect(val45).assertEqual(255);
      const val46: number = arr[3];
      expect(val46).assertEqual(0);
      const val47: number = arr[4];
      expect(val47).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2900
     * @tc.name testTypedUArraysConstructor050201_029
     * @tc.desc Verify - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1, 0, 65535, 65536, 131071];
      const arr = new Uint16Array(src);
      const val48: number = arr[0];
      expect(val48).assertEqual(65535);
      const val49: number = arr[1];
      expect(val49).assertEqual(0);
      const val50: number = arr[2];
      expect(val50).assertEqual(65535);
      const val51: number = arr[3];
      expect(val51).assertEqual(0);
      const val52: number = arr[4];
      expect(val52).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3000
     * @tc.name testTypedUArraysConstructor050201_030
     * @tc.desc Verify - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1, 0, 4294967295, 4294967296, 8589934591];
      const arr = new Uint32Array(src);
      const val53: number = arr[0];
      expect(val53).assertEqual(4294967295);
      const val54: number = arr[1];
      expect(val54).assertEqual(0);
      const val55: number = arr[2];
      expect(val55).assertEqual(4294967295);
      const val56: number = arr[3];
      expect(val56).assertEqual(0);
      const val57: number = arr[4];
      expect(val57).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3100
     * @tc.name testTypedUArraysConstructor050201_031
     * @tc.desc Verify - BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [-1n, 0n, 1n];
      const arr = new BigUint64Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3200
     * @tc.name testTypedUArraysConstructor050201_032
     * @tc.desc Verify - BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [BigInt('18446744073709551616'), 0n, 1n];
      const arr = new BigUint64Array(src);
      const val58: BigInt = arr[0];
      expect(val58).assertEqual(0n);
      const val59: BigInt = arr[1];
      expect(val59).assertEqual(0n);
      const val60: BigInt = arr[2];
      expect(val60).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3300
     * @tc.name testTypedUArraysConstructor050201_033
     * @tc.desc Verify - toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array([1, 2]);
      const b = new Uint16Array([1, 2]);
      const c = new Uint32Array([1, 2]);
      const d = new BigUint64Array([1n, 2n]);
      expect(a.toString()).assertEqual('1,2');
      expect(b.toString()).assertEqual('1,2');
      expect(c.toString()).assertEqual('1,2');
      expect(d.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3400
     * @tc.name testTypedUArraysConstructor050201_034
     * @tc.desc Verify - valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array([1, 2]);
      const b = new Uint16Array([1, 2]);
      expect(a.valueOf()).assertEqual(a);
      expect(b.valueOf()).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3500
     * @tc.name testTypedUArraysConstructor050201_035
     * @tc.desc Verify - constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3600
     * @tc.name testTypedUArraysConstructor050201_036
     * @tc.desc Verify - "@@toStringTag"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array(1);
      const b = new Uint16Array(1);
      const c = new Uint32Array(1);
      const d = new BigUint64Array(1);
      expect(typeof a).assertEqual('object');
      expect(typeof b).assertEqual('object');
      expect(typeof c).assertEqual('object');
      expect(typeof d).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3700
     * @tc.name testTypedUArraysConstructor050201_037
     * @tc.desc Verify - Uint8ClampedArray Uint8Array vs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [300, -5, 256, 0];
      const clamped = new Uint8ClampedArray(src);
      const uint8 = new Uint8Array(src);
      const val61 = clamped[0];
      expect(val61).assertEqual(255);
      const val62 = uint8[0];
      expect(val62).assertEqual(44);
      const val63 = clamped[1];
      expect(val63).assertEqual(0);
      const val64 = uint8[1];
      expect(val64).assertEqual(251);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3800
     * @tc.name testTypedUArraysConstructor050201_038
     * @tc.desc Verify -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array(8);
      const b = new Uint16Array(4);
      const c = new Uint32Array(2);
      const d = new BigUint64Array(1);
      expect(a.byteLength).assertEqual(8);
      expect(b.byteLength).assertEqual(8);
      expect(c.byteLength).assertEqual(8);
      expect(d.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3900
     * @tc.name testTypedUArraysConstructor050201_039
     * @tc.desc Verify - ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const v1 = new Uint8Array(buf);
      const v2 = new Uint16Array(buf);
      const v3 = new Uint32Array(buf);
      expect(v1.length).assertEqual(16);
      expect(v2.length).assertEqual(8);
      expect(v3.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_4000
     * @tc.name testTypedUArraysConstructor050201_040
     * @tc.desc Verify - buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const init = new Uint8Array(buf);
      init[0] = 1;
      init[1] = 2;
      init[2] = 3;
      init[3] = 4;
      new Uint8Array(buf);
      const v2 = new Uint32Array(buf);
      const val65 = v2[0];
      expect(val65).assertEqual(67305985);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_4100
     * @tc.name testTypedUArraysConstructor050201_041
     * @tc.desc Verify -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array(4);
      const b = new Uint8Array([0, 0, 0, 0]);
      const c = new Uint8Array(new Uint8Array(4));
      expect(a.length).assertEqual(4);
      expect(b.length).assertEqual(4);
      expect(c.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_4200
     * @tc.name testTypedUArraysConstructor050201_042
     * @tc.desc Verify - Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iter: Iterable<number> = [1, 2, 3];
      const a = new Uint8Array(iter);
      const b = new Uint16Array(iter);
      expect(a.length).assertEqual(3);
      expect(b.length).assertEqual(3);
      const val66 = a[0];
      expect(val66).assertEqual(b[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_4300
     * @tc.name testTypedUArraysConstructor050201_043
     * @tc.desc Verify - FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<number> = [1, 2, 3];
      const a = new Uint8Array(fa);
      const b = new Uint16Array(fa);
      expect(a.length).assertEqual(3);
      expect(b.length).assertEqual(3);
      const val67 = a[0];
      expect(val67).assertEqual(b[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_4400
     * @tc.name testTypedUArraysConstructor050201_044
     * @tc.desc Verify - Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const a = new Uint8Array(arr);
      const b = new Uint32Array(arr);
      expect(a.length).assertEqual(3);
      expect(b.length).assertEqual(3);
      const val68 = a[0];
      expect(val68).assertEqual(b[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_4500
     * @tc.name testTypedUArraysConstructor050201_045
     * @tc.desc Verify - BigUint64Array Array<BigInt>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src1 = new BigUint64Array([1n, 2n, 3n]);
      const src2 = [1n, 2n, 3n];
      const copy1 = new BigUint64Array(src1);
      const copy2 = new BigUint64Array(src2);
      const val69 = copy1[0];
      expect(val69).assertEqual(copy2[0]);
      const val70 = copy1[1];
      expect(val70).assertEqual(copy2[1]);
      const val71 = copy1[2];
      expect(val71).assertEqual(copy2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_4600
     * @tc.name testTypedUArraysConstructor050201_046
     * @tc.desc Verify -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array();
      const b = new Uint16Array();
      const c = new Uint32Array();
      const d = new BigUint64Array();
      const e = new Uint8ClampedArray();
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(0);
      expect(c.length).assertEqual(0);
      expect(d.length).assertEqual(0);
      expect(e.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_4700
     * @tc.name testTypedUArraysConstructor050201_047
     * @tc.desc Verify -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array([1]);
      const b = new Uint16Array([1]);
      const c = new Uint32Array([1]);
      const d = new BigUint64Array([1n]);
      const e = new Uint8ClampedArray([1]);
      const val72 = a[0];
      expect(val72).assertEqual(1);
      const val73 = b[0];
      expect(val73).assertEqual(1);
      const val74 = c[0];
      expect(val74).assertEqual(1);
      const val75 = d[0];
      expect(val75).assertEqual(1n);
      const val76 = e[0];
      expect(val76).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_4800
     * @tc.name testTypedUArraysConstructor050201_048
     * @tc.desc Verify - ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array(buf);
      const b = new Uint16Array(buf);
      const c = new Uint32Array(buf);
      const d = new BigUint64Array(buf);
      expect(a.byteOffset).assertEqual(0);
      expect(b.byteOffset).assertEqual(0);
      expect(c.byteOffset).assertEqual(0);
      expect(d.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_4900
     * @tc.name testTypedUArraysConstructor050201_049
     * @tc.desc Verify - ArrayBuffer+
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const a = new Uint8Array(buf, 1);
      const b = new Uint16Array(buf, 2);
      const c = new Uint32Array(buf, 4);
      const d = new BigUint64Array(buf, 8);
      expect(a.byteOffset).assertEqual(1);
      expect(b.byteOffset).assertEqual(2);
      expect(c.byteOffset).assertEqual(4);
      expect(d.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_5000
     * @tc.name testTypedUArraysConstructor050201_050
     * @tc.desc Verify - ArrayBuffer+ +
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
  });
}
