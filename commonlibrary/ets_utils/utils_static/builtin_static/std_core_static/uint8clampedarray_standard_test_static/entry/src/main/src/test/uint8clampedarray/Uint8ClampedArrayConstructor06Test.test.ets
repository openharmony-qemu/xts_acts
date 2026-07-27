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

export default function uint8ClampedArrayConstructor06Test(): void {
  describe('uint8ClampedArrayConstructor06Test', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        },50);
      });
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_0100
     * @tc.name testUint8ClampedArrayConstructorSix001
     * @tc.desc Verify constructing empty array yields length b.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray();
      const b = new Uint8ClampedArray(0);
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_0200
     * @tc.name testUint8ClampedArrayConstructorSix002
     * @tc.desc Verify constructing empty array yields byteLength b.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray();
      const b = new Uint8ClampedArray(0);
      expect(a.byteLength).assertEqual(0);
      expect(b.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_0300
     * @tc.name testUint8ClampedArrayConstructorSix003
     * @tc.desc Verify constructing empty array yields byteOffset b.byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray();
      const b = new Uint8ClampedArray(0);
      expect(a.byteOffset).assertEqual(0);
      expect(b.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_0400
     * @tc.name testUint8ClampedArrayConstructorSix004
     * @tc.desc Verify constructing empty array yields length b.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray();
      const src: Array<number> = [];
      const b = new Uint8ClampedArray(src);
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_0500
     * @tc.name testUint8ClampedArrayConstructorSix005
     * @tc.desc Verify constructing empty array yields length b.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray();
      const b = new Uint8ClampedArray(new Array<int>());
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_0600
     * @tc.name testUint8ClampedArrayConstructorSix006
     * @tc.desc Verify length(int)=3 vs ArrayBuffer+offset length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(3);
      const buf = new ArrayBuffer(3);
      const b = new Uint8ClampedArray(buf, 0);
      expect(a.length).assertEqual(3);
      expect(b.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_0700
     * @tc.name testUint8ClampedArrayConstructorSix007
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length b.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf, 1);
      const b = new Uint8ClampedArray(buf, 1, 3);
      expect(a.length).assertEqual(3);
      expect(b.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_0800
     * @tc.name testUint8ClampedArrayConstructorSix008
     * @tc.desc Verify length=0 vs byteOffset=byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf, 4);
      const b = new Uint8ClampedArray(buf, 0, 0);
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_0900
     * @tc.name testUint8ClampedArrayConstructorSix009
     * @tc.desc Verify constructor element [0] equals 0 for length-5 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(5);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_1000
     * @tc.name testUint8ClampedArrayConstructorSix010
     * @tc.desc Verify constructor element [4] equals 0 for length-5 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(5);
      expect(a[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_1100
     * @tc.name testUint8ClampedArrayConstructorSix011
     * @tc.desc Verify constructing array from 3.0 yields length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(3.0);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_1200
     * @tc.name testUint8ClampedArrayConstructorSix012
     * @tc.desc Verify constructing array from 3.7 yields length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(3.7);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_1300
     * @tc.name testUint8ClampedArrayConstructorSix013
     * @tc.desc Verify Array<number> vs Array<int> length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Array<number> = [1, 2, 3];
      const arr: Array<int> = [1, 2, 3];
      const a = new Uint8ClampedArray(f);
      const b = new Uint8ClampedArray(arr);
      expect(a.length).assertEqual(3);
      expect(b.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_1400
     * @tc.name testUint8ClampedArrayConstructorSix014
     * @tc.desc Verify Array<number> vs Array<int> element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Array<number> = [10];
      const arr: Array<int> = [10];
      const a = new Uint8ClampedArray(f);
      const b = new Uint8ClampedArray(arr);
      expect(a[0]).assertEqual(10);
      expect(b[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_1500
     * @tc.name testUint8ClampedArrayConstructorSix015
     * @tc.desc Verify Array<number> vs Array<number> clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn: Array<number> = [256.5];
      const fi: Array<number> = [256];
      const a = new Uint8ClampedArray(fn);
      const b = new Uint8ClampedArray(fi);
      expect(a[0]).assertEqual(255);
      expect(b[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_1600
     * @tc.name testUint8ClampedArrayConstructorSix016
     * @tc.desc Verify Uint8ClampedArray copy length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const dst = new Uint8ClampedArray(src);
      expect(dst.length).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_1700
     * @tc.name testUint8ClampedArrayConstructorSix017
     * @tc.desc Verify Uint8ClampedArray copy element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const dst = new Uint8ClampedArray(src);
      expect(dst[0]).assertEqual(src[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_1800
     * @tc.name testUint8ClampedArrayConstructorSix018
     * @tc.desc Verify Set<Number> Iterable Iterable<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Number>();
      s.add(1); s.add(2);
      const a = new Uint8ClampedArray(s);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_1900
     * @tc.name testUint8ClampedArrayConstructorSix019
     * @tc.desc Verify Set<Number> Iterable FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Number>();
      s.add(10); s.add(20);
      const src: Array<number> = [10, 20];
      const a = new Uint8ClampedArray(s);
      const b = new Uint8ClampedArray(src);
      expect(a.length).assertEqual(2);
      expect(b.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_2000
     * @tc.name testUint8ClampedArrayConstructorSix020
     * @tc.desc Verify ArrayBuffer length byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const a = new Uint8ClampedArray(buf);
      expect(a.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_2100
     * @tc.name testUint8ClampedArrayConstructorSix021
     * @tc.desc Verify constructor element [0] equals 1 for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2]);
      const dst = new Uint8ClampedArray(src);
      dst[0] = 200;
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_2200
     * @tc.name testUint8ClampedArrayConstructorSix022
     * @tc.desc Verify constructor element [0] equals 77 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const firstView = new Uint8ClampedArray(buf);
      const secondView = new Uint8ClampedArray(buf);
      firstView[0] = 77;
      expect(secondView[0]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_2300
     * @tc.name testUint8ClampedArrayConstructorSix023
     * @tc.desc Verify constructor element [2] equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const dst = new Uint8ClampedArray(src);
      src[2] = 99;
      expect(dst[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_2400
     * @tc.name testUint8ClampedArrayConstructorSix024
     * @tc.desc Verify constructing array [1, 2, 3, 4] yields length src.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3, 4]);
      const dst = new Uint8ClampedArray(src);
      expect(dst.length).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_2500
     * @tc.name testUint8ClampedArrayConstructorSix025
     * @tc.desc Verify constructing array [1, 2] yields byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2]);
      const dst = new Uint8ClampedArray(src);
      expect(dst.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_2600
     * @tc.name testUint8ClampedArrayConstructorSix026
     * @tc.desc Verify constructor element [0] equals 1 for array from f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Array<number> = [1, 2, 3];
      const a = new Uint8ClampedArray(f);
      f[0] = 99;
      expect(a[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_2700
     * @tc.name testUint8ClampedArrayConstructorSix027
     * @tc.desc Verify constructor element [0] equals 1 for array from arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int> = [1, 2, 3];
      const a = new Uint8ClampedArray(arr);
      arr[0] = 99;
      expect(a[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_2800
     * @tc.name testUint8ClampedArrayConstructorSix028
     * @tc.desc Verify constructor buffer reference matches for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const v = new Uint8ClampedArray(buf, 0);
      expect(v.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_2900
     * @tc.name testUint8ClampedArrayConstructorSix029
     * @tc.desc Verify ArrayBuffer buffer identity (with offset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const v = new Uint8ClampedArray(buf, 1, 2);
      expect(v.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_3000
     * @tc.name testUint8ClampedArrayConstructorSix030
     * @tc.desc Verify constructing ArrayBuffer-backed array yields byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const v = new Uint8ClampedArray(buf, 2);
      expect(v.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_3100
     * @tc.name testUint8ClampedArrayConstructorSix031
     * @tc.desc Verify ArrayBuffer byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf, 0);
      const b = new Uint8ClampedArray(buf, 2);
      expect(a.buffer).assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_3200
     * @tc.name testUint8ClampedArrayConstructorSix032
     * @tc.desc Verify constructor element [0] equals 0xAB for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const v = new Uint8ClampedArray(buf, 0);
      v[0] = 0xAB;
      const secondView = new Uint8ClampedArray(buf, 0);
      expect(secondView[0]).assertEqual(0xAB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_3300
     * @tc.name testUint8ClampedArrayConstructorSix033
     * @tc.desc Verify constructor element [0] equals 50 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const a = new Uint8ClampedArray(buf, 0);
      const b = new Uint8ClampedArray(buf, 0);
      a[0] = 50;
      expect(b[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_3400
     * @tc.name testUint8ClampedArrayConstructorSix034
     * @tc.desc Verify constructor element [0] equals 0 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf, 0, 2);
      const b = new Uint8ClampedArray(buf, 2, 2);
      a[0] = 7;
      expect(b[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_3500
     * @tc.name testUint8ClampedArrayConstructorSix035
     * @tc.desc Verify constructor element [0] equals 88 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf, 0, 4);
      const b = new Uint8ClampedArray(buf, 2, 2);
      a[2] = 88;
      expect(b[0]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_3600
     * @tc.name testUint8ClampedArrayConstructorSix036
     * @tc.desc Verify constructing array from src yields byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const a = new Uint8ClampedArray(src);
      expect(a.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_3700
     * @tc.name testUint8ClampedArrayConstructorSix037
     * @tc.desc Verify ArrayBuffer byteOffset=0 byteOffset=0,length=byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf, 0);
      const b = new Uint8ClampedArray(buf, 0, 4);
      expect(a.length).assertEqual(b.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_3800
     * @tc.name testUint8ClampedArrayConstructorSix038
     * @tc.desc Verify ArrayBuffer byteOffset=0 length buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(7);
      const v = new Uint8ClampedArray(buf, 0);
      expect(v.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_3900
     * @tc.name testUint8ClampedArrayConstructorSix039
     * @tc.desc Verify ArrayBuffer byteOffset=2 length byteLength-byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(5);
      const v = new Uint8ClampedArray(buf, 2);
      expect(v.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_4000
     * @tc.name testUint8ClampedArrayConstructorSix040
     * @tc.desc Verify ArrayBuffer Number|undefined byteOffset=undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const v = new Uint8ClampedArray(buf, undefined, undefined);
      expect(v.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_4100
     * @tc.name testUint8ClampedArrayConstructorSix041
     * @tc.desc Verify ArrayBuffer Number|undefined length=undefined byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const v = new Uint8ClampedArray(buf, undefined, undefined);
      expect(v.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_4200
     * @tc.name testUint8ClampedArrayConstructorSix042
     * @tc.desc Verify ArrayBuffer Number|undefined byteOffset length=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const v = new Uint8ClampedArray(buf, 2, undefined);
      expect(v.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_4300
     * @tc.name testUint8ClampedArrayConstructorSix043
     * @tc.desc Verify ArrayBuffer Number|undefined byteOffset=undefined length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const v = new Uint8ClampedArray(buf, undefined, 3);
      expect(v.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_4400
     * @tc.name testUint8ClampedArrayConstructorSix044
     * @tc.desc Verify empty constructor creates buffer with byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray();
      expect(a.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_4500
     * @tc.name testUint8ClampedArrayConstructorSix045
     * @tc.desc Verify length constructor creates byteLength 3 and element [2] equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(3);
      expect(a.byteLength).assertEqual(3);
      expect(a[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_4600
     * @tc.name testUint8ClampedArrayConstructorSix046
     * @tc.desc Verify Array<number> construction preserves both source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2];
      const a = new Uint8ClampedArray(src);
      expect(a.length).assertEqual(2);
      expect(a[0]).assertEqual(1);
      expect(a[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_4700
     * @tc.name testUint8ClampedArrayConstructorSix047
     * @tc.desc Verify omitted length consumes the remaining supplied ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf, 0);
      expect(a.buffer).assertEqual(buf);
      expect(a.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_4800
     * @tc.name testUint8ClampedArrayConstructorSix048
     * @tc.desc Verify explicit length creates a four-element view over the supplied ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf, 0, 4);
      expect(a.buffer).assertEqual(buf);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_4900
     * @tc.name testUint8ClampedArrayConstructorSix049
     * @tc.desc Verify constructing length-2 array yields BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(2);
      expect(a.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_5000
     * @tc.name testUint8ClampedArrayConstructorSix050
     * @tc.desc Verify constructing array [1, 2, 3] yields byteLength a.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      expect(a.byteLength).assertEqual(a.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_5100
     * @tc.name testUint8ClampedArrayConstructorSix051
     * @tc.desc Verify constructing length-5 array yields byteLength 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(5);
      expect(a.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_5200
     * @tc.name testUint8ClampedArrayConstructorSix052
     * @tc.desc Verify constructing ArrayBuffer-backed array yields byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Uint8ClampedArray(buf, 2, 3);
      expect(a.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_5300
     * @tc.name testUint8ClampedArrayConstructorSix053
     * @tc.desc Verify constructing empty array yields length 0, byteLength 0 and byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray();
      expect(a.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
      expect(a.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_5400
     * @tc.name testUint8ClampedArrayConstructorSix054
     * @tc.desc Verify constructed view has correct length, byteLength and element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1]);
      expect(a.length).assertEqual(1);
      expect(a[0]).assertEqual(1);
      expect(a.byteLength).assertEqual(1);
      expect(a.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_5500
     * @tc.name testUint8ClampedArrayConstructorSix055
     * @tc.desc Verify ArrayLike ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const src = new Uint8ClampedArray([1, 2, 3, 4]);
      const a = new Uint8ClampedArray(buf, 0);
      const b = new Uint8ClampedArray(src);
      expect(a.buffer).not().assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_5600
     * @tc.name testUint8ClampedArrayConstructorSix056
     * @tc.desc Verify toString a equals b for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = (new Uint8ClampedArray()).toString().length;
      const b = (new Uint8ClampedArray(0)).toString().length;
      expect(a).assertEqual(0);
      expect(b).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_5700
     * @tc.name testUint8ClampedArrayConstructorSix057
     * @tc.desc Verify join a.join() equals b.join( for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2]);
      const src: Array<number> = [1, 2];
      const b = new Uint8ClampedArray(src);
      expect(a.join()).assertEqual('1,2');
      expect(b.join()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_5800
     * @tc.name testUint8ClampedArrayConstructorSix058
     * @tc.desc Verify toString a equals b for array(f)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Array<number> = [3, 4];
      const arr: Array<int> = [3, 4];
      const a = (new Uint8ClampedArray(f)).toString();
      const b = (new Uint8ClampedArray(arr)).toString();
      expect(a).assertEqual('3,4');
      expect(b).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_5900
     * @tc.name testUint8ClampedArrayConstructorSix059
     * @tc.desc Verify ArrayBuffer length=0 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const a = (new Uint8ClampedArray(buf, 0)).toString();
      const b = (new Uint8ClampedArray()).toString();
      expect(a).assertEqual('');
      expect(b).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_6000
     * @tc.name testUint8ClampedArrayConstructorSix060
     * @tc.desc Verify join a.join('|') equals b.join('|' for array [5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([5, 6]);
      const src: Array<number> = [5, 6];
      const b = new Uint8ClampedArray(src);
      expect(a.join('|')).assertEqual('5|6');
      expect(b.join('|')).assertEqual('5|6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_6100
     * @tc.name testUint8ClampedArrayConstructorSix061
     * @tc.desc Verify constructor buffer reference matches for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const v = new Uint8ClampedArray(buf, 0);
      expect(v.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_6200
     * @tc.name testUint8ClampedArrayConstructorSix062
     * @tc.desc Verify constructor result is false for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2]);
      const dst = new Uint8ClampedArray(src);
      expect(dst).not().assertEqual(src);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_6300
     * @tc.name testUint8ClampedArrayConstructorSix063
     * @tc.desc Verify constructor element [1] equals 11 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const p = new Uint8ClampedArray(buf, 0);
      const c = new Uint8ClampedArray(buf, 0);
      p[1] = 11;
      expect(c[1]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_6400
     * @tc.name testUint8ClampedArrayConstructorSix064
     * @tc.desc Verify constructor element [0] equals 22 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const p = new Uint8ClampedArray(buf, 0);
      const c = new Uint8ClampedArray(buf, 0);
      c[0] = 22;
      expect(p[0]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_6500
     * @tc.name testUint8ClampedArrayConstructorSix065
     * @tc.desc Verify constructor result is false for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2]);
      const a = new Uint8ClampedArray(src);
      const b = new Uint8ClampedArray(src);
      expect(a.buffer).not().assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_6600
     * @tc.name testUint8ClampedArrayConstructorSix066
     * @tc.desc Verify constructor element [0] equals 1 for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2]);
      const a = new Uint8ClampedArray(src);
      const b = new Uint8ClampedArray(src);
      a[0] = 88;
      expect(b[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_6700
     * @tc.name testUint8ClampedArrayConstructorSix067
     * @tc.desc Verify ArrayBuffer from(Uint8ClampedArray) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const v = new Uint8ClampedArray(buf, 0);
      const copy = new Uint8ClampedArray(v);
      expect(copy.buffer).not().assertEqual(v.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_6800
     * @tc.name testUint8ClampedArrayConstructorSix068
     * @tc.desc Verify constructor element [0] equals 5 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const v = new Uint8ClampedArray(buf, 0);
      v[0] = 5;
      const copy = new Uint8ClampedArray(v);
      copy[0] = 100;
      expect(v[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_6900
     * @tc.name testUint8ClampedArrayConstructorSix069
     * @tc.desc Verify ArrayBuffer byteOffset=2 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const v = new Uint8ClampedArray(buf, 2);
      expect(v.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_7000
     * @tc.name testUint8ClampedArrayConstructorSix070
     * @tc.desc Verify constructor result is false for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const v = new Uint8ClampedArray(buf, 0);
      const cp = new Uint8ClampedArray(v);
      expect(cp.buffer).not().assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_7100
     * @tc.name testUint8ClampedArrayConstructorSix071
     * @tc.desc Verify constructor element [0] equals 0 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const v = new Uint8ClampedArray(buf, 0);
      const cp = new Uint8ClampedArray(v);
      cp[0] = 99;
      const secondView = new Uint8ClampedArray(buf, 0);
      expect(secondView[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_7200
     * @tc.name testUint8ClampedArrayConstructorSix072
     * @tc.desc Verify copy constructor produces correct length, elements and distinct buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2]);
      const dst = new Uint8ClampedArray(src);
      expect(dst.length).assertEqual(2);
      expect(dst[0]).assertEqual(1);
      expect(dst[1]).assertEqual(2);
      expect(dst.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_7300
     * @tc.name testUint8ClampedArrayConstructorSix073
     * @tc.desc Verify constructor element [0] equals 0 for array from s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Number>();
      s.add(Number.NaN);
      const a = new Uint8ClampedArray(s);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_7400
     * @tc.name testUint8ClampedArrayConstructorSix074
     * @tc.desc Verify constructor element [0] equals 0 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1);
      const v = new Uint8ClampedArray(buf, 0);
      expect(v[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_7500
     * @tc.name testUint8ClampedArrayConstructorSix075
     * @tc.desc Verify copy from Uint8ClampedArray source preserves the already-clamped value 255 in dst[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([300]);
      const dst = new Uint8ClampedArray(src);
      expect(dst[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_CONSTRUCTOR_SIX_7600
     * @tc.name testUint8ClampedArrayConstructorSix076
     * @tc.desc Verify constructor element [0] equals 0 for array from s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayConstructorSix076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<Number>();
      s.add(-1.0);
      const a = new Uint8ClampedArray(s);
      expect(a[0]).assertEqual(0);
    });
  });
}
