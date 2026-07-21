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

export default function typedUArraysConstructorTest16(): void {
  describe('TypedUArraysConstructorTest16', (): void => {
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
      const buf = new ArrayBuffer(64);
      const a = new Uint8Array(buf, 0, 8);
      const b = new Uint16Array(buf, 8, 4);
      const c = new Uint32Array(buf, 16, 2);
      const d = new BigUint64Array(buf, 24, 1);
      expect(a.byteLength).assertEqual(8);
      expect(b.byteLength).assertEqual(8);
      expect(c.byteLength).assertEqual(8);
      expect(d.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0200
     * @tc.name testTypedUArraysConstructor050201_002
     * @tc.desc Verify - ArrayBuffer+undefined+undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array(buf, undefined, undefined);
      const b = new Uint16Array(buf, undefined, undefined);
      const c = new Uint32Array(buf, undefined, undefined);
      const d = new BigUint64Array(buf, undefined, undefined);
      expect(a.length).assertEqual(16);
      expect(b.length).assertEqual(8);
      expect(c.length).assertEqual(4);
      expect(d.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0300
     * @tc.name testTypedUArraysConstructor050201_003
     * @tc.desc Verify - isView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array(1);
      const b = new Uint16Array(1);
      const c = new Uint32Array(1);
      const d = new BigUint64Array(1);
      const e = new Uint8ClampedArray(1);
      expect(ArrayBuffer.isView(a)).assertTrue();
      expect(ArrayBuffer.isView(b)).assertTrue();
      expect(ArrayBuffer.isView(c)).assertTrue();
      expect(ArrayBuffer.isView(d)).assertTrue();
      expect(ArrayBuffer.isView(e)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0400
     * @tc.name testTypedUArraysConstructor050201_004
     * @tc.desc Verify - buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array(1);
      const b = new Uint16Array(1);
      const c = new Uint32Array(1);
      const d = new BigUint64Array(1);
      expect(typeof a.buffer).assertEqual('object');
      expect(typeof b.buffer).assertEqual('object');
      expect(typeof c.buffer).assertEqual('object');
      expect(typeof d.buffer).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0500
     * @tc.name testTypedUArraysConstructor050201_005
     * @tc.desc Verify - buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array();
      const b = new Uint16Array();
      const c = new Uint32Array();
      const d = new BigUint64Array();
      expect(typeof a.buffer).assertEqual('object');
      expect(typeof b.buffer).assertEqual('object');
      expect(typeof c.buffer).assertEqual('object');
      expect(typeof d.buffer).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0600
     * @tc.name testTypedUArraysConstructor050201_006
     * @tc.desc Verify - buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src1 = new Uint8Array([1, 2]);
      const src2 = new Uint16Array([1, 2]);
      const src3 = new Uint32Array([1, 2]);
      const copy1 = new Uint8Array(src1);
      const copy2 = new Uint16Array(src2);
      const copy3 = new Uint32Array(src3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0700
     * @tc.name testTypedUArraysConstructor050201_007
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array(buf);
      const b = new Uint16Array(buf);
      const c = new Uint32Array(buf);
      const d = new BigUint64Array(buf);
      expect(a.buffer).assertEqual(buf);
      expect(b.buffer).assertEqual(buf);
      expect(c.buffer).assertEqual(buf);
      expect(d.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0800
     * @tc.name testTypedUArraysConstructor050201_008
     * @tc.desc Verify - ArrayBuffer+ buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const a = new Uint8Array(buf, 4);
      const b = new Uint16Array(buf, 4);
      const c = new Uint32Array(buf, 4);
      const d = new BigUint64Array(buf, 8);
      expect(a.buffer).assertEqual(buf);
      expect(b.buffer).assertEqual(buf);
      expect(c.buffer).assertEqual(buf);
      expect(d.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_0900
     * @tc.name testTypedUArraysConstructor050201_009
     * @tc.desc Verify - ArrayBuffer+ + buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      const a = new Uint8Array(buf, 0, 8);
      const b = new Uint16Array(buf, 8, 4);
      const c = new Uint32Array(buf, 16, 2);
      const d = new BigUint64Array(buf, 24, 1);
      expect(a.buffer).assertEqual(buf);
      expect(b.buffer).assertEqual(buf);
      expect(c.buffer).assertEqual(buf);
      expect(d.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1000
     * @tc.name testTypedUArraysConstructor050201_010
     * @tc.desc Verify - buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array([1, 2]);
      const b = new Uint8Array([1, 2]);
      const val77 = b[0];
      expect(val77).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1100
     * @tc.name testTypedUArraysConstructor050201_011
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1 = new ArrayBuffer(8);
      const buf2 = new ArrayBuffer(8);
      const a = new Uint8Array(buf1);
      const b = new Uint8Array(buf2);
      expect(a.buffer).assertEqual(buf1);
      expect(b.buffer).assertEqual(buf2);
      const val78 = b[0];
      expect(val78).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1200
     * @tc.name testTypedUArraysConstructor050201_012
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const a = new Uint8Array(buf, 0, 8);
      const b = new Uint8Array(buf, 8, 8);
      expect(a.buffer).assertEqual(b.buffer);
      expect(a.buffer).assertEqual(buf);
      const val79 = b[0];
      expect(val79).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1300
     * @tc.name testTypedUArraysConstructor050201_013
     * @tc.desc Verify - ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const init = new Uint8Array(buf);
      init[4] = 100;
      const a = new Uint8Array(buf, 0, 8);
      const b = new Uint8Array(buf, 4, 8);
      const val80 = b[0];
      expect(val80).assertEqual(100);
      const val81 = a[4];
      expect(val81).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1400
     * @tc.name testTypedUArraysConstructor050201_014
     * @tc.desc Verify - ArrayBuffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array(buf);
      const b = new Uint16Array(buf);
      const c = new Uint32Array(buf);
      const d = new BigUint64Array(buf);
      expect(a.length).assertEqual(16);
      expect(b.length).assertEqual(8);
      expect(c.length).assertEqual(4);
      expect(d.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1500
     * @tc.name testTypedUArraysConstructor050201_015
     * @tc.desc Verify - ArrayBuffer+ length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const a = new Uint8Array(buf, 4);
      const b = new Uint16Array(buf, 4);
      const c = new Uint32Array(buf, 4);
      const d = new BigUint64Array(buf, 8);
      expect(a.length).assertEqual(28);
      expect(b.length).assertEqual(14);
      expect(c.length).assertEqual(7);
      expect(d.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1600
     * @tc.name testTypedUArraysConstructor050201_016
     * @tc.desc Verify - ArrayBuffer+ + length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      const a = new Uint8Array(buf, 0, 8);
      const b = new Uint16Array(buf, 8, 4);
      const c = new Uint32Array(buf, 16, 2);
      const d = new BigUint64Array(buf, 24, 1);
      expect(a.length).assertEqual(8);
      expect(b.length).assertEqual(4);
      expect(c.length).assertEqual(2);
      expect(d.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1700
     * @tc.name testTypedUArraysConstructor050201_017
     * @tc.desc Verify - ArrayBuffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array(buf);
      const b = new Uint16Array(buf);
      const c = new Uint32Array(buf);
      const d = new BigUint64Array(buf);
      expect(a.byteLength).assertEqual(16);
      expect(b.byteLength).assertEqual(16);
      expect(c.byteLength).assertEqual(16);
      expect(d.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1800
     * @tc.name testTypedUArraysConstructor050201_018
     * @tc.desc Verify - ArrayBuffer+ byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const a = new Uint8Array(buf, 4);
      const b = new Uint16Array(buf, 4);
      const c = new Uint32Array(buf, 4);
      const d = new BigUint64Array(buf, 8);
      expect(a.byteLength).assertEqual(28);
      expect(b.byteLength).assertEqual(28);
      expect(c.byteLength).assertEqual(28);
      expect(d.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_1900
     * @tc.name testTypedUArraysConstructor050201_019
     * @tc.desc Verify - ArrayBuffer+undefined+undefined byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array(buf, undefined, undefined);
      const b = new Uint16Array(buf, undefined, undefined);
      const c = new Uint32Array(buf, undefined, undefined);
      const d = new BigUint64Array(buf, undefined, undefined);
      expect(a.byteLength).assertEqual(16);
      expect(b.byteLength).assertEqual(16);
      expect(c.byteLength).assertEqual(16);
      expect(d.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2000
     * @tc.name testTypedUArraysConstructor050201_020
     * @tc.desc Verify - ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2100
     * @tc.name testTypedUArraysConstructor050201_021
     * @tc.desc Verify - ArrayBuffer+ byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const a = new Uint8Array(buf, 4);
      const b = new Uint16Array(buf, 4);
      const c = new Uint32Array(buf, 4);
      const d = new BigUint64Array(buf, 8);
      expect(a.byteOffset).assertEqual(4);
      expect(b.byteOffset).assertEqual(4);
      expect(c.byteOffset).assertEqual(4);
      expect(d.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2200
     * @tc.name testTypedUArraysConstructor050201_022
     * @tc.desc Verify - ArrayBuffer+ + byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      const a = new Uint8Array(buf, 0, 8);
      const b = new Uint16Array(buf, 8, 4);
      const c = new Uint32Array(buf, 16, 2);
      const d = new BigUint64Array(buf, 24, 1);
      expect(a.byteOffset).assertEqual(0);
      expect(b.byteOffset).assertEqual(8);
      expect(c.byteOffset).assertEqual(16);
      expect(d.byteOffset).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2300
     * @tc.name testTypedUArraysConstructor050201_023
     * @tc.desc Verify - ArrayBuffer+undefined+undefined byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array(buf, undefined, undefined);
      const b = new Uint16Array(buf, undefined, undefined);
      const c = new Uint32Array(buf, undefined, undefined);
      const d = new BigUint64Array(buf, undefined, undefined);
      expect(a.byteOffset).assertEqual(0);
      expect(b.byteOffset).assertEqual(0);
      expect(c.byteOffset).assertEqual(0);
      expect(d.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2400
     * @tc.name testTypedUArraysConstructor050201_024
     * @tc.desc Verify - ArrayBuffer BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array(buf);
      const b = new Uint16Array(buf);
      const c = new Uint32Array(buf);
      const d = new BigUint64Array(buf);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2500
     * @tc.name testTypedUArraysConstructor050201_025
     * @tc.desc Verify - ArrayBuffer instanceof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array(buf);
      const b = new Uint16Array(buf);
      const c = new Uint32Array(buf);
      const d = new BigUint64Array(buf);
      expect(typeof a).assertEqual('object');
      expect(typeof b).assertEqual('object');
      expect(typeof c).assertEqual('object');
      expect(typeof d).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2600
     * @tc.name testTypedUArraysConstructor050201_026
     * @tc.desc Verify - ArrayBuffer isView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array(buf);
      const b = new Uint16Array(buf);
      const c = new Uint32Array(buf);
      const d = new BigUint64Array(buf);
      expect(ArrayBuffer.isView(a)).assertTrue();
      expect(ArrayBuffer.isView(b)).assertTrue();
      expect(ArrayBuffer.isView(c)).assertTrue();
      expect(ArrayBuffer.isView(d)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2700
     * @tc.name testTypedUArraysConstructor050201_027
     * @tc.desc Verify - ArrayBuffer buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array(buf);
      const b = new Uint16Array(buf);
      const c = new Uint32Array(buf);
      const d = new BigUint64Array(buf);
      expect(a.buffer.byteLength).assertEqual(16);
      expect(b.buffer.byteLength).assertEqual(16);
      expect(c.buffer.byteLength).assertEqual(16);
      expect(d.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2800
     * @tc.name testTypedUArraysConstructor050201_028
     * @tc.desc Verify - ArrayBuffer buffer instanceof ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array(buf);
      const b = new Uint16Array(buf);
      const c = new Uint32Array(buf);
      const d = new BigUint64Array(buf);
      expect(typeof a.buffer).assertEqual('object');
      expect(typeof b.buffer).assertEqual('object');
      expect(typeof c.buffer).assertEqual('object');
      expect(typeof d.buffer).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_2900
     * @tc.name testTypedUArraysConstructor050201_029
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const init = new Uint8Array(buf);
      init[0] = 1;
      init[1] = 2;
      new Uint8Array(buf);
      const b = new Uint16Array(buf);
      const val82 = b[0];
      expect(val82).assertEqual(513);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3000
     * @tc.name testTypedUArraysConstructor050201_030
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array(buf);
      a[1] = 1;
      new Uint16Array(buf);
      const val83 = a[0];
      expect(val83).assertEqual(0);
      const val84 = a[1];
      expect(val84).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3100
     * @tc.name testTypedUArraysConstructor050201_031
     * @tc.desc Verify - ArrayBuffer buffer Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const init = new Uint8Array(buf);
      init[0] = 1;
      init[1] = 2;
      init[2] = 3;
      init[3] = 4;
      new Uint8Array(buf);
      const c = new Uint32Array(buf);
      const val85 = c[0];
      expect(val85).assertEqual(67305985);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3200
     * @tc.name testTypedUArraysConstructor050201_032
     * @tc.desc Verify - ArrayBuffer buffer BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const init = new Uint8Array(buf);
      init[0] = 193;
      init[1] = 222;
      init[2] = 79;
      init[3] = 123;
      init[4] = 210;
      init[5] = 127;
      init[6] = 179;
      init[7] = 84;
      new Uint8Array(buf);
      const d = new BigUint64Array(buf);
      const val86 = d[0];
      expect(val86).assertEqual(BigInt('6103362462005845697'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3300
     * @tc.name testTypedUArraysConstructor050201_033
     * @tc.desc Verify - ArrayBuffer buffer Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const init = new Uint8Array(buf);
      init[0] = 255;
      new Uint8ClampedArray(buf);
      const a = new Uint8Array(buf);
      const val87 = a[0];
      expect(val87).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3400
     * @tc.name testTypedUArraysConstructor050201_034
     * @tc.desc Verify - ArrayBuffer buffer Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const init = new Uint8Array(buf);
      init[0] = 255;
      const e = new Uint8ClampedArray(buf);
      new Uint8Array(buf);
      const val88 = e[0];
      expect(val88).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3500
     * @tc.name testTypedUArraysConstructor050201_035
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const init = new Uint8Array(buf);
      init[0] = 1;
      init[8] = 2;
      init[16] = 3;
      const a = new Uint8Array(buf, 0, 8);
      const b = new Uint16Array(buf, 8, 4);
      const c = new Uint32Array(buf, 16, 2);
      const val89 = a[0];
      expect(val89).assertEqual(1);
      const val90 = b[0];
      expect(val90).assertEqual(2);
      const val91 = c[0];
      expect(val91).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3600
     * @tc.name testTypedUArraysConstructor050201_036
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const init = new Uint8Array(buf);
      init[0] = 1;
      init[8] = 2;
      init[16] = 3;
      const a = new Uint8Array(buf, 0, 8);
      const b = new Uint16Array(buf, 8, 4);
      const c = new Uint32Array(buf, 16, 2);
      const val92 = a[0];
      expect(val92).assertEqual(1);
      const val93 = b[0];
      expect(val93).assertEqual(2);
      const val94 = c[0];
      expect(val94).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3700
     * @tc.name testTypedUArraysConstructor050201_037
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      const init = new Uint8Array(buf);
      init[0] = 1;
      init[8] = 2;
      init[16] = 3;
      init[24] = 4;
      const a = new Uint8Array(buf, 0, 8);
      const b = new Uint16Array(buf, 8, 4);
      const c = new Uint32Array(buf, 16, 2);
      const d = new BigUint64Array(buf, 24, 1);
      const val95 = a[0];
      expect(val95).assertEqual(1);
      const val96 = b[0];
      expect(val96).assertEqual(2);
      const val97 = c[0];
      expect(val97).assertEqual(3);
      const val98 = d[0];
      expect(val98).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3800
     * @tc.name testTypedUArraysConstructor050201_038
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      const init = new Uint8Array(buf);
      init[0] = 1;
      init[8] = 2;
      init[16] = 3;
      init[24] = 4;
      const a = new Uint8Array(buf, 0, 8);
      const b = new Uint16Array(buf, 8, 4);
      const c = new Uint32Array(buf, 16, 2);
      const d = new BigUint64Array(buf, 24, 1);
      const val99 = a[0];
      expect(val99).assertEqual(1);
      const val100 = b[0];
      expect(val100).assertEqual(2);
      const val101 = c[0];
      expect(val101).assertEqual(3);
      const val102 = d[0];
      expect(val102).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_3900
     * @tc.name testTypedUArraysConstructor050201_039
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const init = new Uint8Array(buf);
      init[8] = 100;
      init[9] = 0;
      const a = new Uint8Array(buf, 0, 16);
      const b = new Uint16Array(buf, 8, 8);
      const val103 = b[0];
      expect(val103).assertEqual(100);
      const val104 = a[8];
      expect(val104).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_4000
     * @tc.name testTypedUArraysConstructor050201_040
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const init = new Uint8Array(buf);
      init[8] = 100;
      const a = new Uint8Array(buf, 0, 16);
      const b = new Uint16Array(buf, 8, 8);
      const val105 = a[8];
      expect(val105).assertEqual(100);
      const val106 = b[0];
      expect(val106).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_4100
     * @tc.name testTypedUArraysConstructor050201_041
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const init = new Uint8Array(buf);
      init[8] = 44;
      init[9] = 1;
      init[10] = 144;
      init[11] = 1;
      const a = new Uint8Array(buf, 0, 16);
      const b = new Uint16Array(buf, 8, 8);
      const val107 = a[8];
      expect(val107).assertEqual(44);
      const val108 = a[9];
      expect(val108).assertEqual(1);
      const val109 = b[0];
      expect(val109).assertEqual(300);
      const val110 = b[1];
      expect(val110).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_4200
     * @tc.name testTypedUArraysConstructor050201_042
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const init = new Uint8Array(buf);
      init[8] = 100;
      init[9] = 200;
      const a = new Uint8Array(buf, 0, 16);
      const b = new Uint16Array(buf, 8, 8);
      const val111 = a[8];
      expect(val111).assertEqual(100);
      const val112 = a[9];
      expect(val112).assertEqual(200);
      const val113 = b[0];
      expect(val113).assertEqual(51300);
      const val114 = b[1];
      expect(val114).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_4300
     * @tc.name testTypedUArraysConstructor050201_043
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(48);
      const init = new Uint8Array(buf);
      init[8] = 200;
      init[16] = 44;
      init[17] = 1;
      const a = new Uint8Array(buf, 0, 16);
      const b = new Uint16Array(buf, 8, 8);
      const c = new Uint32Array(buf, 16, 2);
      const val115 = a[8];
      expect(val115).assertEqual(200);
      const val116 = b[0];
      expect(val116).assertEqual(200);
      const val117 = c[0];
      expect(val117).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0201_4400
     * @tc.name testTypedUArraysConstructor050201_044
     * @tc.desc Verify - ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050201_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(48);
      new Uint16Array(buf, 8, 8)[0] = 100;
      new Uint32Array(buf, 16, 2)[0] = 300;
      const a = new Uint8Array(buf, 0, 16);
      const b = new Uint16Array(buf, 8, 8);
      const c = new Uint32Array(buf, 16, 2);
      const val118 = a[8];
      expect(val118).assertEqual(100);
      const val119 = b[0];
      expect(val119).assertEqual(100);
      const val120 = c[0];
      expect(val120).assertEqual(300);
    });

  });
}