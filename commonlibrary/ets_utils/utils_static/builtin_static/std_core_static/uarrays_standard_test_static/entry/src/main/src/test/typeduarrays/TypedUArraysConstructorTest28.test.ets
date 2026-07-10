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

export default function typedUArraysConstructorTest28(): void {
  describe('TypedUArraysConstructorTest28', (): void => {
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
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_5000
     * @tc.name testTypedUArraysConstructor050101_050
     * @tc.desc Verify 0 dispatch 0 length=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array();
      const b = new Uint8Array(0);
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
      expect(b.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_5100
     * @tc.name testTypedUArraysConstructor050101_051
     * @tc.desc Verify 1 dispatch length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_5200
     * @tc.name testTypedUArraysConstructor050101_052
     * @tc.desc Verify 2.5 dispatch Double length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(2.5);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_5300
     * @tc.name testTypedUArraysConstructor050101_053
     * @tc.desc Verify dispatch ArrayLike length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([5]);
      expect(arr.length).assertEqual(1);
      const val20 = arr[0];
      expect(val20).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_5400
     * @tc.name testTypedUArraysConstructor050101_054
     * @tc.desc Verify dispatch BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n]);
      expect(arr.length).assertEqual(1);
      const val21 = arr[0];
      expect(val21).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_5500
     * @tc.name testTypedUArraysConstructor050101_055
     * @tc.desc Verify dispatch ArrayLike Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_5600
     * @tc.name testTypedUArraysConstructor050101_056
     * @tc.desc Verify dispatch ArrayLike Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      expect(arr.length).assertEqual(5);
      const val22: number = arr[0];
      expect(val22).assertEqual(1);
      const val23: number = arr[4];
      expect(val23).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_5700
     * @tc.name testTypedUArraysConstructor050101_057
     * @tc.desc Verify ArrayBuffer dispatch ArrayBuffer ArrayLike Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_5800
     * @tc.name testTypedUArraysConstructor050101_058
     * @tc.desc Verify FixedArraydispatch FixedArray BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa = [1n, 2n, 3n];
      const arr = new BigUint64Array(fa);
      expect(arr.length).assertEqual(3);
      const val24 = arr[0];
      expect(val24).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_5900
     * @tc.name testTypedUArraysConstructor050101_059
     * @tc.desc Verify Uint8Array dispatch Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2]);
      const copy = new Uint8Array(src);
      expect(copy.length).assertEqual(2);
      const val25 = copy[0];
      expect(val25).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_6000
     * @tc.name testTypedUArraysConstructor050101_060
     * @tc.desc Verify NaN ArrayLikedispatch Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, Number.NaN, 3]);
      expect(arr.length).assertEqual(3);
      const val26: number = arr[0];
      expect(val26).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_6100
     * @tc.name testTypedUArraysConstructor050101_061
     * @tc.desc Verify ArrayLikedispatch Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-0, 0]);
      expect(arr.length).assertEqual(2);
      const val27: number = arr[0];
      expect(val27).assertEqual(0);
      const val28: number = arr[1];
      expect(val28).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_6200
     * @tc.name testTypedUArraysConstructor050101_062
     * @tc.desc Verify 0 name Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray();
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_6300
     * @tc.name testTypedUArraysConstructor050101_063
     * @tc.desc Verify length name Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(5);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_6400
     * @tc.name testTypedUArraysConstructor050101_064
     * @tc.desc Verify ArrayBuffer name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_6500
     * @tc.name testTypedUArraysConstructor050101_065
     * @tc.desc Verify BigUint64Array name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n]);
      const copy = new BigUint64Array(src);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_6600
     * @tc.name testTypedUArraysConstructor050101_066
     * @tc.desc Verify BYTES_PER_ELEMENT Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8Array();
      const b = new Uint8Array(5);
      const c = new Uint8Array([1, 2]);
      const buf = new ArrayBuffer(16);
      const d = new Uint8Array(buf);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_6700
     * @tc.name testTypedUArraysConstructor050101_067
     * @tc.desc Verify isView Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint16Array();
      const b = new Uint16Array(5);
      const c = new Uint16Array([1]);
      const buf = new ArrayBuffer(16);
      const d = new Uint16Array(buf);
      expect(typeof a).assertEqual('object');
      expect(typeof b).assertEqual('object');
      expect(typeof c).assertEqual('object');
      expect(typeof d).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_6800
     * @tc.name testTypedUArraysConstructor050101_068
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      new Uint8Array(src);
      const val29 = src[0];
      expect(val29).assertEqual(1);
      expect(src.length).assertEqual(3);
      expect(src.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_6900
     * @tc.name testTypedUArraysConstructor050101_069
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3]);
      const copy = new Uint16Array(src);
      const val30 = copy[0];
      expect(val30).assertEqual(1);
      expect(copy.length).assertEqual(3);
      expect(copy.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_7000
     * @tc.name testTypedUArraysConstructor050101_070
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const initView = new Uint32Array(buf);
      initView[2] = 777;
      new Uint32Array(buf, 0, 3);
      const child = new Uint32Array(buf, 8, 2);
      const val31 = child[0];
      expect(val31).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_7100
     * @tc.name testTypedUArraysConstructor050101_071
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const allBuf = new BigUint64Array(buf);
      allBuf[2] = 666n;
      const parent = new BigUint64Array(buf, 0, 3);
      new BigUint64Array(buf, 16, 1);
      const val32 = parent[2];
      expect(val32).assertEqual(666n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_7200
     * @tc.name testTypedUArraysConstructor050101_072
     * @tc.desc Verify buffer Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(48);
      const initArr = new Uint8Array(buf);
      initArr[0] = 1;
      initArr[16] = 2;
      initArr[32] = 3;
      const v1 = new Uint8ClampedArray(buf, 0, 16);
      const v2 = new Uint8ClampedArray(buf, 16, 16);
      const v3 = new Uint8ClampedArray(buf, 32, 16);
      const val33 = v1[0];
      expect(val33).assertEqual(1);
      const val34 = v2[0];
      expect(val34).assertEqual(2);
      const val35 = v3[0];
      expect(val35).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_7300
     * @tc.name testTypedUArraysConstructor050101_073
     * @tc.desc Verify - Double dispatch length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n=  3;
      const arr = new Uint8Array(n);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_7400
     * @tc.name testTypedUArraysConstructor050101_074
     * @tc.desc Verify - int dispatch int length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n=  3;
      const arr = new Uint16Array(n);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_7500
     * @tc.name testTypedUArraysConstructor050101_075
     * @tc.desc Verify undefined byteOffset 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const a = new Uint32Array(buf, 0, 3);
      const b = new Uint32Array(buf, undefined, 3);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_7600
     * @tc.name testTypedUArraysConstructor050101_076
     * @tc.desc Verify undefined length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const a = new BigUint64Array(buf, 8, 1);
      const b = new BigUint64Array(buf, 8, undefined);
      expect(a.length).assertEqual(1);
      expect(b.length).assertEqual(2);
      expect(a.byteLength).assertEqual(8);
      expect(b.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_7700
     * @tc.name testTypedUArraysConstructor050101_077
     * @tc.desc Verify undefined 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Uint8Array();
      const b = new Uint8Array(buf, undefined, undefined);
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(16);
      expect(b.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_7800
     * @tc.name testTypedUArraysConstructor050101_078
     * @tc.desc Verify - Uint8Array Array<number> dispatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa = new Uint8Array([1, 2]);
      const aa: Array<number> = [1, 2];
      const c1 = new Uint8Array(fa);
      const c2 = new Uint8Array(aa);
      expect(c1.length).assertEqual(c2.length);
      const val36 = c1[0];
      expect(val36).assertEqual(c2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_7900
     * @tc.name testTypedUArraysConstructor050101_079
     * @tc.desc Verify - FixedArray Array dispatch Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<number> = [1, 2];
      const aa: Array<number> = [1, 2];
      const c1 = new Uint16Array(fa);
      const c2 = new Uint16Array(aa);
      expect(c1.length).assertEqual(c2.length);
      const val37 = c1[0];
      expect(val37).assertEqual(c2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_8000
     * @tc.name testTypedUArraysConstructor050101_080
     * @tc.desc Verify - Iterable Array dispatch Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ia: Array<number> = [1, 2];
      const ii: Iterable<number> = [1, 2];
      const c1 = new Uint32Array(ia);
      const c2 = new Uint32Array(ii);
      expect(c1.length).assertEqual(c2.length);
      const val38 = c1[0];
      expect(val38).assertEqual(c2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_8100
     * @tc.name testTypedUArraysConstructor050101_081
     * @tc.desc Verify - ArrayBuffer ArrayLike dispatch ArrayBuffer BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new BigUint64Array(buf);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_8200
     * @tc.name testTypedUArraysConstructor050101_082
     * @tc.desc Verify - ArrayBuffer ArrayLike dispatch ArrayLike Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const al: Array<number> = [1, 2];
      const arr = new Uint8ClampedArray(al);
      expect(arr.length).assertEqual(2);
      const val39: number = arr[0];
      expect(val39).assertEqual(1);
      const val40: number = arr[1];
      expect(val40).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_8300
     * @tc.name testTypedUArraysConstructor050101_083
     * @tc.desc Verify 2 RangeError buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Uint16Array(buf, 3);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const valid = new Uint16Array(buf, 0);
      expect(valid.length).assertEqual(8);
      expect(valid.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_8400
     * @tc.name testTypedUArraysConstructor050101_084
     * @tc.desc Verify 4 RangeError buffer Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Uint32Array(buf, 2);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const valid = new Uint32Array(buf, 0);
      expect(valid.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_8500
     * @tc.name testTypedUArraysConstructor050101_085
     * @tc.desc Verify 8 RangeError buffer BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new BigUint64Array(buf, 4);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const valid = new BigUint64Array(buf, 0);
      expect(valid.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_8600
     * @tc.name testTypedUArraysConstructor050101_086
     * @tc.desc Verify + buffer RangeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        new Uint16Array(buf, 8, 4);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_8700
     * @tc.name testTypedUArraysConstructor050101_087
     * @tc.desc Verify + buffer Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint32Array(buf, 8, 1);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_8800
     * @tc.name testTypedUArraysConstructor050101_088
     * @tc.desc Verify Number|undefined Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        const off: number | undefined = -1;
        new Uint8Array(buf, off);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_8900
     * @tc.name testTypedUArraysConstructor050101_089
     * @tc.desc Verify Number|undefined Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf = new ArrayBuffer(16);
        const len: number | undefined = -1;
        new Uint16Array(buf, 0, len);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_9000
     * @tc.name testTypedUArraysConstructor050101_090
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Uint32Array(buf, 8.0);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_9100
     * @tc.name testTypedUArraysConstructor050101_091
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(5.7);
      expect(arr.length).assertEqual(5);
      expect(arr.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_9200
     * @tc.name testTypedUArraysConstructor050101_092
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0.9);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_9300
     * @tc.name testTypedUArraysConstructor050101_093
     * @tc.desc Verify buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const copy = new Uint8Array(src);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_9400
     * @tc.name testTypedUArraysConstructor050101_094
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([1, 2, 3]);
      const copy = new Uint16Array(src);
      const val41 = src[1];
      expect(val41).assertEqual(2);
      const val42 = copy[1];
      expect(val42).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_9500
     * @tc.name testTypedUArraysConstructor050101_095
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array([1, 2, 3]);
      const copy = new Uint32Array(src);
      const val43 = src[2];
      expect(val43).assertEqual(3);
      const val44 = copy[2];
      expect(val44).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_9600
     * @tc.name testTypedUArraysConstructor050101_096
     * @tc.desc Verify - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([1n, 2n, 3n]);
      const copy = new BigUint64Array(src);
      const val45 = copy[0];
      expect(val45).assertEqual(1n);
      const val46 = copy[1];
      expect(val46).assertEqual(2n);
      const val47 = copy[2];
      expect(val47).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_9700
     * @tc.name testTypedUArraysConstructor050101_097
     * @tc.desc Verify - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([0, 255, 128]);
      const copy = new Uint8ClampedArray(src);
      const val48 = copy[0];
      expect(val48).assertEqual(0);
      const val49 = copy[1];
      expect(val49).assertEqual(255);
      const val50 = copy[2];
      expect(val50).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_9800
     * @tc.name testTypedUArraysConstructor050101_098
     * @tc.desc Verify - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array();
      const copy = new Uint8Array(src);
      expect(copy.length).assertEqual(0);
      expect(copy.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_Constructor05_0101_9900
     * @tc.name testTypedUArraysConstructor050101_099
     * @tc.desc Verify - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructor050101_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([42]);
      const copy = new Uint16Array(src);
      expect(copy.length).assertEqual(1);
      const val51 = copy[0];
      expect(val51).assertEqual(42);
    });
  });
}
