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

export default function typedUArraysConstructorTest11(): void {
  describe('TypedUArraysConstructorTest11', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_0100
     * @tc.name testTypedUArraysConstructor050101_001
     * @tc.desc Verify 0 1 Double dispatch Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array();
      const b = new Uint8Array(0);
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
      expect(b.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_0200
     * @tc.name testTypedUArraysConstructor050101_002
     * @tc.desc Verify 1 dispatch length Double Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len=  5.0;
      const arr = new Uint16Array(len);
      expect(arr.length).assertEqual(5);
      expect(arr.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_0300
     * @tc.name testTypedUArraysConstructor050101_003
     * @tc.desc Verify 1 dispatch Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array([1, 2, 3]);
      const copy = new Uint32Array(src);
      expect(copy.length).assertEqual(3);
      const val0 = copy[0];
      expect(val0).assertEqual(1);
      const val1 = copy[2];
      expect(val1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_0400
     * @tc.name testTypedUArraysConstructor050101_004
     * @tc.desc Verify 1 dispatch Array<number> Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const arr = new Uint8ClampedArray(src);
      expect(arr.length).assertEqual(3);
      const val2: number = arr[0];
      expect(val2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_0500
     * @tc.name testTypedUArraysConstructor050101_005
     * @tc.desc Verify 1 dispatch Iterable<number> BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1n, 2n, 3n];
      const arr = new BigUint64Array(src);
      expect(arr.length).assertEqual(3);
      const val3 = arr[0];
      expect(val3).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_0600
     * @tc.name testTypedUArraysConstructor050101_006
     * @tc.desc Verify 1 dispatch ArrayBuffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_0700
     * @tc.name testTypedUArraysConstructor050101_007
     * @tc.desc Verify 2 dispatch ArrayBuffer+int Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Uint16Array(buf, 4);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.byteLength).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_0800
     * @tc.name testTypedUArraysConstructor050101_008
     * @tc.desc Verify 3 dispatch ArrayBuffer+int +int Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Uint32Array(buf, 8, 2);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_0900
     * @tc.name testTypedUArraysConstructor050101_009
     * @tc.desc Verify 3 dispatch ArrayBuffer+undefined+undefined BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new BigUint64Array(buf, undefined, undefined);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(4);
      expect(arr.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_1000
     * @tc.name testTypedUArraysConstructor050101_010
     * @tc.desc Verify 0 1 length=0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray();
      const b = new Uint8ClampedArray(0);
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
      expect(b.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_1100
     * @tc.name testTypedUArraysConstructor050101_011
     * @tc.desc Verify 3 undefined 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const a = new Uint16Array(buf, 0, 3);
      const b = new Uint16Array(buf, undefined, 3);
      expect(a.length).assertEqual(3);
      expect(b.length).assertEqual(3);
      expect(a.byteOffset).assertEqual(0);
      expect(b.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_1200
     * @tc.name testTypedUArraysConstructor050101_012
     * @tc.desc Verify 3 undefined Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const a = new Uint32Array(buf, 8, 2);
      const b = new Uint32Array(buf, 8, undefined);
      expect(a.length).assertEqual(2);
      expect(b.length).assertEqual(4);
      expect(a.byteLength).assertEqual(8);
      expect(b.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_1300
     * @tc.name testTypedUArraysConstructor050101_013
     * @tc.desc Verify 0 ArrayBuffer(0) BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new BigUint64Array();
      const b = new BigUint64Array(new ArrayBuffer(0));
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
      expect(b.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_1400
     * @tc.name testTypedUArraysConstructor050101_014
     * @tc.desc Verify 3 undefined Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, undefined, undefined);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(16);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_1500
     * @tc.name testTypedUArraysConstructor050101_015
     * @tc.desc Verify Uint16Array 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Uint16Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_1600
     * @tc.name testTypedUArraysConstructor050101_016
     * @tc.desc Verify Uint16Array 2 RangeError buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Uint16Array(buf, 1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const valid = new Uint16Array(buf, 0);
      expect(valid.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_1700
     * @tc.name testTypedUArraysConstructor050101_017
     * @tc.desc Verify Uint32Array 4 RangeError buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Uint32Array(buf, 1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const valid = new Uint32Array(buf, 0);
      expect(valid.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_1800
     * @tc.name testTypedUArraysConstructor050101_018
     * @tc.desc Verify BigUint64Array 8 RangeError buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      try {
        new BigUint64Array(buf, 4);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const valid = new BigUint64Array(buf, 0);
      expect(valid.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_1900
     * @tc.name testTypedUArraysConstructor050101_019
     * @tc.desc Verify RangeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint8ClampedArray(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_2000
     * @tc.name testTypedUArraysConstructor050101_020
     * @tc.desc Verify RangeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Uint16Array(buf, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_2100
     * @tc.name testTypedUArraysConstructor050101_021
     * @tc.desc Verify buffer RangeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(8);
        new Uint32Array(buf, 16);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_2200
     * @tc.name testTypedUArraysConstructor050101_022
     * @tc.desc Verify 0 ArrayBuffer byteOffset Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array();
      const b = new Uint8Array(new ArrayBuffer(0));
      expect(a.byteOffset).assertEqual(0);
      expect(b.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_2300
     * @tc.name testTypedUArraysConstructor050101_023
     * @tc.desc Verify Uint8Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const copy = new Uint8Array(src);
      expect(copy.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_2400
     * @tc.name testTypedUArraysConstructor050101_024
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const copy = new Uint8Array(src);
      const val4 = src[0];
      expect(val4).assertEqual(1);
      const val5 = copy[0];
      expect(val5).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_2500
     * @tc.name testTypedUArraysConstructor050101_025
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const copy = new Uint8Array(src);
      const val6 = src[0];
      expect(val6).assertEqual(1);
      const val7 = copy[0];
      expect(val7).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_2600
     * @tc.name testTypedUArraysConstructor050101_026
     * @tc.desc Verify Array<number> Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src1 = new Uint8Array([10, 20, 30]);
      const src2: Array<number> = [10, 20, 30];
      const copy1 = new Uint8Array(src1);
      const copy2 = new Uint8Array(src2);
      const val8 = copy1[0];
      expect(val8).assertEqual(copy2[0]);
      const val9 = copy1[1];
      expect(val9).assertEqual(copy2[1]);
      const val10 = copy1[2];
      expect(val10).assertEqual(copy2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_2700
     * @tc.name testTypedUArraysConstructor050101_027
     * @tc.desc Verify Iterable<number> Array<number> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src1: Array<number> = [100, 200, 300];
      const src2: Iterable<number> = [100, 200, 300];
      const copy1 = new Uint16Array(src1);
      const copy2 = new Uint16Array(src2);
      expect(copy1.length).assertEqual(copy2.length);
      const val11 = copy1[0];
      expect(val11).assertEqual(copy2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_2800
     * @tc.name testTypedUArraysConstructor050101_028
     * @tc.desc Verify FixedArray Array Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src1: Array<number> = [1000, 2000];
      const src2: Array<number> = [1000, 2000];
      const copy1 = new Uint32Array(src1);
      const copy2 = new Uint32Array(src2);
      expect(copy1.length).assertEqual(copy2.length);
      const val12 = copy1[0];
      expect(val12).assertEqual(copy2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_2900
     * @tc.name testTypedUArraysConstructor050101_029
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint8Array(-5);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        const buf = new ArrayBuffer(16);
        new Uint8Array(buf, 0, -1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_3000
     * @tc.name testTypedUArraysConstructor050101_030
     * @tc.desc Verify null ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_3100
     * @tc.name testTypedUArraysConstructor050101_031
     * @tc.desc Verify undefined ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_3200
     * @tc.name testTypedUArraysConstructor050101_032
     * @tc.desc Verify RangeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint16Array(9007199254740991);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_3300
     * @tc.name testTypedUArraysConstructor050101_033
     * @tc.desc Verify RangeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Uint32Array(buf, 9007199254740991);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_3400
     * @tc.name testTypedUArraysConstructor050101_034
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3.9);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_3500
     * @tc.name testTypedUArraysConstructor050101_035
     * @tc.desc Verify ArrayBuffer - buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const parent = new Uint8Array(buf, 0, 16);
      const child = new Uint8Array(buf, 16, 16);
      expect(parent.buffer).assertEqual(child.buffer);
      expect(parent.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_3600
     * @tc.name testTypedUArraysConstructor050101_036
     * @tc.desc Verify ArrayBuffer - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      new Uint16Array(buf, 0, 8);
      const child = new Uint16Array(buf, 16, 8);
      const val13 = child[0];
      expect(val13).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_3700
     * @tc.name testTypedUArraysConstructor050101_037
     * @tc.desc Verify ArrayBuffer - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const parent = new Uint32Array(buf, 0, 8);
      new Uint32Array(buf, 16, 4);
      const val14 = parent[4];
      expect(val14).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_3800
     * @tc.name testTypedUArraysConstructor050101_038
     * @tc.desc Verify ArrayBuffer - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(48);
      const init = new Uint8Array(buf);
      init[0] = 1;
      init[16] = 2;
      init[32] = 3;
      const view1 = new BigUint64Array(buf, 0, 2);
      const view2 = new BigUint64Array(buf, 16, 2);
      const view3 = new BigUint64Array(buf, 32, 2);
      const val15 = view1[0];
      expect(val15).assertEqual(1n);
      const val16 = view2[0];
      expect(val16).assertEqual(2n);
      const val17 = view3[0];
      expect(val17).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_3900
     * @tc.name testTypedUArraysConstructor050101_039
     * @tc.desc Verify Uint8Array - buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([10, 20]);
      const copy = new Uint8Array(src);
      const val18 = src[0];
      expect(val18).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_4000
     * @tc.name testTypedUArraysConstructor050101_040
     * @tc.desc Verify ArrayBuffer - buffer buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const view = new Uint16Array(buf, 8, 2);
      expect(view.buffer).assertEqual(buf);
      expect(view.buffer.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_4100
     * @tc.name testTypedUArraysConstructor050101_041
     * @tc.desc Verify ArrayBuffer - buffer byteLength Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(40);
      const v1 = new Uint32Array(buf, 0, 5);
      const v2 = new Uint32Array(buf, 8, 4);
      const v3 = new Uint32Array(buf, 16, 3);
      expect(v1.buffer.byteLength).assertEqual(40);
      expect(v2.buffer.byteLength).assertEqual(40);
      expect(v3.buffer.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_4200
     * @tc.name testTypedUArraysConstructor050101_042
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const copy = new Uint8Array(src);
      expect(copy.length).assertEqual(src.length);
      expect(src.length).assertEqual(3);
      expect(copy.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_4300
     * @tc.name testTypedUArraysConstructor050101_043
     * @tc.desc Verify byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const src = new Uint8Array(buf, 8, 2);
      const copy = new Uint8Array(src);
      expect(copy.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_4400
     * @tc.name testTypedUArraysConstructor050101_044
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3, 4]);
      const copy = new Uint8Array(src);
      expect(copy.byteLength).assertEqual(src.byteLength);
      expect(copy.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_4500
     * @tc.name testTypedUArraysConstructor050101_045
     * @tc.desc Verify Iterable Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const values = [1, 2, 3];
      const arr = new Uint8Array(values);
      expect(arr.length).assertEqual(3);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_4600
     * @tc.name testTypedUArraysConstructor050101_046
     * @tc.desc Verify Iterable iterable Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const values = [10, 20];
      const arr1 = new Uint16Array(values);
      expect(arr1.length).assertEqual(2);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_4700
     * @tc.name testTypedUArraysConstructor050101_047
     * @tc.desc Verify Iterable Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count1 = 0;
      let count2 = 0;
      const values1 = [1, 2];
      const values2 = [3, 4];
      const arr1 = new Uint32Array(values1);
      const arr2 = new Uint32Array(values2);
      expect(arr1.length).assertEqual(2);
      expect(arr2.length).assertEqual(2);
      expect(count1).assertEqual(0);
      expect(count2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_4800
     * @tc.name testTypedUArraysConstructor050101_048
     * @tc.desc Verify Iterable BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const emptyValues: Array<bigint> = [];
      const arr = new BigUint64Array(emptyValues);
      expect(arr.length).assertEqual(0);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_4900
     * @tc.name testTypedUArraysConstructor050101_049
     * @tc.desc Verify Iterable Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const values = [0, 255, 128];
      const arr = new Uint8ClampedArray(values);
      expect(arr.length).assertEqual(3);
      const val19 = arr[0];
      expect(val19).assertEqual(0);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_5000
     * @tc.name testTypedUArraysConstructor050101_050
     * @tc.desc Verify 0 dispatch 0 length=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
  });
}
