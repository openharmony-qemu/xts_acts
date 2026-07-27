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

export default function uint8ClampedArrayFull09Test(): void {
  describe('uint8ClampedArrayFull09Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_0100
     * @tc.name testUint8ClampedArrayFullNine001
     * @tc.desc Verify constructing 127-element array yields length 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(127);
      expect(a.length).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_0200
     * @tc.name testUint8ClampedArrayFullNine002
     * @tc.desc Verify constructing array from Double.toInt(0.9 yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(Double.toInt(0.9));
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_0300
     * @tc.name testUint8ClampedArrayFullNine003
     * @tc.desc Verify constructing array from src yields length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0, 127, 128, 255, 256];
      const a = new Uint8ClampedArray(src);
      expect(a.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_0400
     * @tc.name testUint8ClampedArrayFullNine004
     * @tc.desc Verify constructing array from s yields length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>();
      s.add(200);
      const a = new Uint8ClampedArray(s);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_0500
     * @tc.name testUint8ClampedArrayFullNine005
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Uint8ClampedArray(buf, 0);
      expect(a.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_0600
     * @tc.name testUint8ClampedArrayFullNine006
     * @tc.desc Verify 3 buffer + offset + length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Uint8ClampedArray(buf, 4, 0);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_0700
     * @tc.name testUint8ClampedArrayFullNine007
     * @tc.desc Verify 3 buffer + offset=4 + length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Uint8ClampedArray(buf, 4, 4);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_0800
     * @tc.name testUint8ClampedArrayFullNine008
     * @tc.desc Verify Uint8ClampedArray.of yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.of();
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_0900
     * @tc.name testUint8ClampedArrayFullNine009
     * @tc.desc Verify Uint8ClampedArray.of yields length 5 for of(5, 10, 15, 20, 25)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.of(5, 10, 15, 20, 25);
      expect(a.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_1000
     * @tc.name testUint8ClampedArrayFullNine010
     * @tc.desc Verify Uint8ClampedArray.from 1 Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const a = Uint8ClampedArray.from(src);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_1100
     * @tc.name testUint8ClampedArrayFullNine011
     * @tc.desc Verify Uint8ClampedArray.from 2 FixedArray + mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10.0, 20.0, 30.0];
      const a = Uint8ClampedArray.from(src, (v: number, _i: number): number => v);
      expect(a[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_1200
     * @tc.name testUint8ClampedArrayFullNine012
     * @tc.desc Verify .set element at a[0] equals 10 for length-4 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(4);
      const src: Array<number> = [10, 20];
      a.set(src);
      expect(a[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_1300
     * @tc.name testUint8ClampedArrayFullNine013
     * @tc.desc Verify .set element at a[1] equals 50 for length-4 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(4);
      const src: Array<number> = [50, 60];
      a.set(src, 1);
      expect(a[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_1400
     * @tc.name testUint8ClampedArrayFullNine014
     * @tc.desc Verify subarray yields length 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const s = a.subarray();
      expect(s.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_1500
     * @tc.name testUint8ClampedArrayFullNine015
     * @tc.desc Verify slice yields length 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const s = a.slice();
      expect(s.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_1600
     * @tc.name testUint8ClampedArrayFullNine016
     * @tc.desc Verify fill element at a[2] equals 7 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(3);
      a.fill(7);
      expect(a[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_1700
     * @tc.name testUint8ClampedArrayFullNine017
     * @tc.desc Verify fill element at a[2] equals 9 for length-4 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(4);
      a.fill(9, 2);
      expect(a[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_1800
     * @tc.name testUint8ClampedArrayFullNine018
     * @tc.desc Verify copyWithin element at a[1] equals 4 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4]);
      a.copyWithin(0, 2);
      expect(a[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_1900
     * @tc.name testUint8ClampedArrayFullNine019
     * @tc.desc Verify indexOf a.indexOf(1, 1) equals 2 for array [1, 2, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 1, 2]);
      expect(a.indexOf(1, 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_2000
     * @tc.name testUint8ClampedArrayFullNine020
     * @tc.desc Verify lastIndexOf 1 fromIndex=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 1]);
      expect(a.lastIndexOf(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_2100
     * @tc.name testUint8ClampedArrayFullNine021
     * @tc.desc Verify join a.join() equals '1,2,3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      expect(a.join()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_2200
     * @tc.name testUint8ClampedArrayFullNine022
     * @tc.desc Verify reduce accumulated sum equals 60 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([10, 20, 30]);
      const sum = a.reduce((acc: number, cur: number): number => acc + cur);
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_2300
     * @tc.name testUint8ClampedArrayFullNine023
     * @tc.desc Verify reduce accumulated sum equals 106 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const sum = a.reduce((acc: number, cur: number): number => acc + cur, 100);
      expect(sum).assertEqual(106);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_2400
     * @tc.name testUint8ClampedArrayFullNine024
     * @tc.desc Verify constructor element [0] equals 0 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(1);
      a[0] = Number.MIN_VALUE;
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_2500
     * @tc.name testUint8ClampedArrayFullNine025
     * @tc.desc Verify constructor element [0] equals 0 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(1);
      a[0] = -Number.POSITIVE_INFINITY;
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_2600
     * @tc.name testUint8ClampedArrayFullNine026
     * @tc.desc Verify constructor element [0] equals 0 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(1);
      a[0] = 0.5;
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_2700
     * @tc.name testUint8ClampedArrayFullNine027
     * @tc.desc Verify constructor element [0] equals 128 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(1);
      a[0] = 127.5;
      expect(a[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_2800
     * @tc.name testUint8ClampedArrayFullNine028
     * @tc.desc Verify constructor element [0] equals 128 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(1);
      a[0] = 128.5;
      expect(a[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_2900
     * @tc.name testUint8ClampedArrayFullNine029
     * @tc.desc Verify constructor element [0] equals 0 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(1);
      a[0] = 0.4;
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_3000
     * @tc.name testUint8ClampedArrayFullNine030
     * @tc.desc Verify constructor element [0] equals 1 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(1);
      a[0] = 0.9;
      expect(a[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_3100
     * @tc.name testUint8ClampedArrayFullNine031
     * @tc.desc Verify constructor element [0] equals 0 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(1);
      a[0] = -0;
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_3200
     * @tc.name testUint8ClampedArrayFullNine032
     * @tc.desc Verify constructor element [0] equals 255 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(1);
      a[0] = 256;
      expect(a[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_3300
     * @tc.name testUint8ClampedArrayFullNine033
     * @tc.desc Verify constructor element [0] equals 0 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(1);
      a[0] = -1;
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_3400
     * @tc.name testUint8ClampedArrayFullNine034
     * @tc.desc Verify constructor a.$_get(0) equals 255 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(1);
      a.$_set(0, 256);
      expect(a.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_3500
     * @tc.name testUint8ClampedArrayFullNine035
     * @tc.desc Verify constructor a.$_get(0) equals 0 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(1);
      a.$_set(0, -1);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_3600
     * @tc.name testUint8ClampedArrayFullNine036
     * @tc.desc Verify fill element at a[2] equals 255 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(3);
      a.fill(300);
      expect(a[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_3700
     * @tc.name testUint8ClampedArrayFullNine037
     * @tc.desc Verify fill element at a[0] equals 0 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(3);
      a.fill(5);
      a.fill(-50);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_3800
     * @tc.name testUint8ClampedArrayFullNine038
     * @tc.desc Verify clamp - via with(0, 999) 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const b = a.with(0, 999);
      expect(b[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_3900
     * @tc.name testUint8ClampedArrayFullNine039
     * @tc.desc Verify clamp - via set([1000, -1, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(3);
      const src: Array<number> = [1000, -1, 0];
      a.set(src);
      expect(a[0]).assertEqual(255);
      expect(a[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_4000
     * @tc.name testUint8ClampedArrayFullNine040
     * @tc.desc Verify map element at b[2] equals 0 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([10, 20, 30]);
      const b = a.map((_v: number, _i: int, _a: Uint8ClampedArray): number => -100);
      expect(b[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_4100
     * @tc.name testUint8ClampedArrayFullNine041
     * @tc.desc Verify clamp - via from + mapfn 1024 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const a = Uint8ClampedArray.from(src, (_v: number, _i: number): number => 1024.0);
      expect(a[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_4200
     * @tc.name testUint8ClampedArrayFullNine042
     * @tc.desc Verify constructor throws RangeError for [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      try {
        a[2147483647];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_4300
     * @tc.name testUint8ClampedArrayFullNine043
     * @tc.desc Verify constructor throws RangeError for [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      try {
        a[-2147483648];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_4400
     * @tc.name testUint8ClampedArrayFullNine044
     * @tc.desc Verify constructor throws RangeError for [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      try {
        a[0x7FFFFFFF];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_4500
     * @tc.name testUint8ClampedArrayFullNine045
     * @tc.desc Verify constructor throws RangeError for [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      try {
        a[2147483647] = 99;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_4600
     * @tc.name testUint8ClampedArrayFullNine046
     * @tc.desc Verify constructor throws RangeError for [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      try {
        a[-2147483648] = 99;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_4700
     * @tc.name testUint8ClampedArrayFullNine047
     * @tc.desc Verify constructor throws RangeError for [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      try {
        a.$_set(2147483647, 88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_4800
     * @tc.name testUint8ClampedArrayFullNine048
     * @tc.desc Verify constructor throws RangeError for [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      try {
        a.$_get(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_4900
     * @tc.name testUint8ClampedArrayFullNine049
     * @tc.desc Verify at a.at(2147483647) equals undefined for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      expect(a.at(2147483647)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_5000
     * @tc.name testUint8ClampedArrayFullNine050
     * @tc.desc Verify at a.at(-3) equals 7 for array [7, 8, 9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([7, 8, 9]);
      expect(a.at(-3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_5100
     * @tc.name testUint8ClampedArrayFullNine051
     * @tc.desc Verify at a.at(-4) equals undefined for array [7, 8, 9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([7, 8, 9]);
      expect(a.at(-4)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_5200
     * @tc.name testUint8ClampedArrayFullNine052
     * @tc.desc Verify with(INT_MAX) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      try {
        a.with(2147483647, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_5300
     * @tc.name testUint8ClampedArrayFullNine053
     * @tc.desc Verify with(-length-1) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      try {
        a.with(-4, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_5400
     * @tc.name testUint8ClampedArrayFullNine054
     * @tc.desc Verify constructor element [126] equals 0 for 127-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(127);
      expect(a[126]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_5500
     * @tc.name testUint8ClampedArrayFullNine055
     * @tc.desc Verify constructing 255-element array yields length 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(255);
      expect(a.length).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_5600
     * @tc.name testUint8ClampedArrayFullNine056
     * @tc.desc Verify constructing 256-element array yields length 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(256);
      expect(a.length).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_5700
     * @tc.name testUint8ClampedArrayFullNine057
     * @tc.desc Verify constructing 1024-element array yields length 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(1024);
      expect(a.length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_5800
     * @tc.name testUint8ClampedArrayFullNine058
     * @tc.desc Verify constructing 65535-element array yields length 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(65535);
      expect(a.length).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_5900
     * @tc.name testUint8ClampedArrayFullNine059
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf, 4);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_6000
     * @tc.name testUint8ClampedArrayFullNine060
     * @tc.desc Verify byteOffset > byteLength RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      try {
        new Uint8ClampedArray(buf, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_6100
     * @tc.name testUint8ClampedArrayFullNine061
     * @tc.desc Verify byteOffset + length > byteLength RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      try {
        new Uint8ClampedArray(buf, 2, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_6200
     * @tc.name testUint8ClampedArrayFullNine062
     * @tc.desc Verify constructor element [0] equals 77 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Uint8ClampedArray(buf);
      const b = new Uint8ClampedArray(buf);
      a[0] = 77;
      expect(b[0]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_6300
     * @tc.name testUint8ClampedArrayFullNine063
     * @tc.desc Verify subarray element at s[0] equals 200 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = a.subarray(1, 3);
      a[1] = 200;
      expect(s[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_6400
     * @tc.name testUint8ClampedArrayFullNine064
     * @tc.desc Verify subarray element at a[1] equals 150 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = a.subarray(1, 3);
      s[0] = 150;
      expect(a[1]).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_6500
     * @tc.name testUint8ClampedArrayFullNine065
     * @tc.desc Verify subarray.buffer === parent.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = a.subarray(0, 2);
      expect(s.buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_6600
     * @tc.name testUint8ClampedArrayFullNine066
     * @tc.desc Verify slice.buffer !== parent.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = a.slice();
      expect(s.buffer).not().assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_6700
     * @tc.name testUint8ClampedArrayFullNine067
     * @tc.desc Verify slice element at a[0] equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = a.slice();
      s[0] = 99;
      expect(a[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_6800
     * @tc.name testUint8ClampedArrayFullNine068
     * @tc.desc Verify from(Uint8ClampedArray) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const a = Uint8ClampedArray.from(src);
      expect(a.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_6900
     * @tc.name testUint8ClampedArrayFullNine069
     * @tc.desc Verify Uint8ClampedArray.from element at src[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const a = Uint8ClampedArray.from(src);
      a[0] = 200;
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_7000
      * @tc.name testUint8ClampedArrayFullNine070
      * @tc.desc Verify map returns new array with copied elements and independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const b = a.map((v: number, _i: int, _a: Uint8ClampedArray): number => v);
      expect(b.length).assertEqual(3);
      expect(b[0]).assertEqual(1);
      expect(b[1]).assertEqual(2);
      expect(b[2]).assertEqual(3);
      expect(b.buffer).not().assertEqual(a.buffer);
      expect(a[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_7100
      * @tc.name testUint8ClampedArrayFullNine071
      * @tc.desc Verify filter returns new array with copied elements and independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const b = a.filter((_v: number, _i: int, _a: Uint8ClampedArray): boolean => true);
      expect(b.length).assertEqual(3);
      expect(b[0]).assertEqual(1);
      expect(b[1]).assertEqual(2);
      expect(b[2]).assertEqual(3);
      expect(b.buffer).not().assertEqual(a.buffer);
      expect(a[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_7200
      * @tc.name testUint8ClampedArrayFullNine072
      * @tc.desc Verify toReversed returns new array with reversed elements and independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      const b = a.toReversed();
      expect(b.length).assertEqual(3);
      expect(b[0]).assertEqual(3);
      expect(b[1]).assertEqual(2);
      expect(b[2]).assertEqual(1);
      expect(b.buffer).not().assertEqual(a.buffer);
      expect(a[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_7300
      * @tc.name testUint8ClampedArrayFullNine073
      * @tc.desc Verify toSorted returns new array with sorted elements and independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([3, 1, 2]);
      const b = a.toSorted();
      expect(b.length).assertEqual(3);
      expect(b[0]).assertEqual(1);
      expect(b[1]).assertEqual(2);
      expect(b[2]).assertEqual(3);
      expect(b.buffer).not().assertEqual(a.buffer);
      expect(a[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_7400
     * @tc.name testUint8ClampedArrayFullNine074
     * @tc.desc Verify constructor element [0] equals 255 for array from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0xFF, 0o17, 0b101, 10, 0x80];
      const a = new Uint8ClampedArray(src);
      expect(a[0]).assertEqual(255);
      expect(a[1]).assertEqual(15);
      expect(a[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_7500
     * @tc.name testUint8ClampedArrayFullNine075
     * @tc.desc Verify constructor element [0] equals 128 for array from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [127.5, 128.5, 129.5];
      const a = new Uint8ClampedArray(src);
      expect(a[0]).assertEqual(128);
      expect(a[1]).assertEqual(128);
      expect(a[2]).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_7600
     * @tc.name testUint8ClampedArrayFullNine076
     * @tc.desc Verify constructing array from src yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const a = new Uint8ClampedArray(src);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_7700
     * @tc.name testUint8ClampedArrayFullNine077
     * @tc.desc Verify constructor element [0] equals 0 for array from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0];
      const a = new Uint8ClampedArray(src);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_7800
     * @tc.name testUint8ClampedArrayFullNine078
     * @tc.desc Verify fill yields length 256 for length-256 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint8ClampedArray(256);
      values.fill(7)
      expect(values.length).assertEqual(256);
      expect(values[255]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_7900
     * @tc.name testUint8ClampedArrayFullNine079
     * @tc.desc Verify constructor element [0] equals 255 for array from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [300, 300, 300, 300];
      const a = new Uint8ClampedArray(src);
      expect(a[0]).assertEqual(255);
      expect(a[3]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_8000
     * @tc.name testUint8ClampedArrayFullNine080
     * @tc.desc Verify constructor element [1] equals 0 for array from src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0, 0, 0];
      const a = new Uint8ClampedArray(src);
      expect(a[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_8100
     * @tc.name testUint8ClampedArrayFullNine081
     * @tc.desc Verify Array<number> -50 100 -200 200 clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-50, 100, -200, 200];
      const a = new Uint8ClampedArray(src);
      expect(a[0]).assertEqual(0);
      expect(a[2]).assertEqual(0);
      expect(a[3]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_8200
     * @tc.name testUint8ClampedArrayFullNine082
     * @tc.desc Verify constructing array from s yields length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>();
      const a = new Uint8ClampedArray(s);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_8300
     * @tc.name testUint8ClampedArrayFullNine083
     * @tc.desc Verify Uint8ClampedArray.from yields length 2 for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>();
      s.add(500);
      s.add(-10);
      const a = Uint8ClampedArray.from(s);
      expect(a.length).assertEqual(2);
      expect(a[0]).assertEqual(255);
      expect(a[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_8400
     * @tc.name testUint8ClampedArrayFullNine084
     * @tc.desc Verify Uint8ClampedArray.from element at a[0] equals 0 for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>();
      s.add(Number.NaN);
      const a = Uint8ClampedArray.from(s);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_8500
     * @tc.name testUint8ClampedArrayFullNine085
     * @tc.desc Verify Uint8ClampedArray.from yields length 100 for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>();
      for (let i = 0; i < 100; i++) {
        s.add(i);
      }
      const a = Uint8ClampedArray.from(s);
      expect(a.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_8600
     * @tc.name testUint8ClampedArrayFullNine086
     * @tc.desc Verify Uint8ClampedArray.from element at a[0] equals 0 for from(src, (v: number, _i:)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0];
      const a = Uint8ClampedArray.from(src, (v: number, _i: number): number => v);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_8700
     * @tc.name testUint8ClampedArrayFullNine087
     * @tc.desc Verify Uint8ClampedArray.from element at a[0] equals 255 for from(src, (v: number, _i:)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [255];
      const a = Uint8ClampedArray.from(src, (v: number, _i: number): number => v);
      expect(a[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_8800
     * @tc.name testUint8ClampedArrayFullNine088
     * @tc.desc Verify ArrayLike<number> 256 255 clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [256];
      const a = Uint8ClampedArray.from(src, (v: number, _i: number): number => v);
      expect(a[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_8900
     * @tc.name testUint8ClampedArrayFullNine089
     * @tc.desc Verify ArrayLike<number> -1 0 clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1];
      const a = Uint8ClampedArray.from(src, (v: number, _i: number): number => v);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_9000
     * @tc.name testUint8ClampedArrayFullNine090
     * @tc.desc Verify ArrayLike<number> 9223372036854775807 255 clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [9223372036854775807];
      const a = Uint8ClampedArray.from(src, (v: number, _i: number): number => v);
      expect(a[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_9100
     * @tc.name testUint8ClampedArrayFullNine091
     * @tc.desc Verify .set element at a[0] equals 255 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray(3);
      const src: Array<number> = [300 , -5 , Number(128) ];
      a.set(src);
      expect(a[0]).assertEqual(255);
      expect(a[1]).assertEqual(0);
      expect(a[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_NINE_9200
     * @tc.name testUint8ClampedArrayFullNine092
     * @tc.desc Verify join a.join('|') equals '1|2|3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullNine092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint8ClampedArray([1, 2, 3]);
      expect(a.join('|')).assertEqual('1|2|3');
    });
  });
}
