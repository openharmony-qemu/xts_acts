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

export default function uint8ClampedArrayFrom01Test(): void {
  describe('uint8ClampedArrayFrom01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_0100
     * @tc.name testUint8ClampedArrayFromOne001
     * @tc.desc Verify Uint8ClampedArray.from yields length 3 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr = Uint8ClampedArray.from(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_0200
     * @tc.name testUint8ClampedArrayFromOne002
     * @tc.desc Verify Uint8ClampedArray.from yields length 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const arr = Uint8ClampedArray.from(parent);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_0300
     * @tc.name testUint8ClampedArrayFromOne003
     * @tc.desc Verify Uint8ClampedArray.from yields length 3 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const arr = Uint8ClampedArray.from(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_0400
     * @tc.name testUint8ClampedArrayFromOne004
     * @tc.desc Verify Iterable<number> Set 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0); set.add(2.0); set.add(3.0);
      const arr = Uint8ClampedArray.from(set);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_0500
     * @tc.name testUint8ClampedArrayFromOne005
     * @tc.desc Verify Uint8ClampedArray.from yields length 2 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0); set.add(2.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => v + 10.0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(11);
      expect(arr[1]).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_0600
     * @tc.name testUint8ClampedArrayFromOne006
     * @tc.desc Verify from([256]) clamps 256 to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [256];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_0700
     * @tc.name testUint8ClampedArrayFromOne007
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_0800
     * @tc.name testUint8ClampedArrayFromOne008
     * @tc.desc Verify Array<number> INT_MAX clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [2147483647];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_0900
     * @tc.name testUint8ClampedArrayFromOne009
     * @tc.desc Verify Array<number> INT_MIN clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-2147483648];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_1000
     * @tc.name testUint8ClampedArrayFromOne010
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0xFF];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_1100
     * @tc.name testUint8ClampedArrayFromOne011
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0o377];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_1200
     * @tc.name testUint8ClampedArrayFromOne012
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0b11111111];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_1300
     * @tc.name testUint8ClampedArrayFromOne013
     * @tc.desc Verify Array<number> 0 127 255 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0, 1, 127, 128, 255];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_1400
     * @tc.name testUint8ClampedArrayFromOne014
     * @tc.desc Verify Array<number> 10 elements length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const arr = Uint8ClampedArray.from(src);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_1500
     * @tc.name testUint8ClampedArrayFromOne015
     * @tc.desc Verify Array<number> 1000 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1000];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_1600
     * @tc.name testUint8ClampedArrayFromOne016
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1000];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_1700
     * @tc.name testUint8ClampedArrayFromOne017
     * @tc.desc Verify Uint8ClampedArray.from yields length 0 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray(0);
      const arr = Uint8ClampedArray.from(parent);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_1800
     * @tc.name testUint8ClampedArrayFromOne018
     * @tc.desc Verify Uint8ClampedArray element 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([42]);
      const arr = Uint8ClampedArray.from(parent);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_1900
     * @tc.name testUint8ClampedArrayFromOne019
     * @tc.desc Verify Uint8ClampedArray length=5 element 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const arr = Uint8ClampedArray.from(parent);
      expect(arr.length).assertEqual(5);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_2000
     * @tc.name testUint8ClampedArrayFromOne020
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for array [0, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([0, 255]);
      const arr = Uint8ClampedArray.from(parent);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_2100
     * @tc.name testUint8ClampedArrayFromOne021
     * @tc.desc Verify Uint8ClampedArray buffer distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const arr = Uint8ClampedArray.from(parent);
      expect(arr.buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_2200
     * @tc.name testUint8ClampedArrayFromOne022
     * @tc.desc Verify Uint8ClampedArray copy independent of parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30]);
      const arr = Uint8ClampedArray.from(parent);
      parent[0] = 99;
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_2300
     * @tc.name testUint8ClampedArrayFromOne023
     * @tc.desc Verify Uint8ClampedArray parent independent of copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30]);
      const arr = Uint8ClampedArray.from(parent);
      arr[0] = 88;
      expect(parent[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_2400
     * @tc.name testUint8ClampedArrayFromOne024
     * @tc.desc Verify from creates storage independent from a Uint8ClampedArray source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1]);
      const arr = Uint8ClampedArray.from(parent);
      arr[0] = 9;
      expect(parent[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_2500
     * @tc.name testUint8ClampedArrayFromOne025
     * @tc.desc Verify Uint8ClampedArray byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const arr = Uint8ClampedArray.from(parent);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_2600
     * @tc.name testUint8ClampedArrayFromOne026
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([0, 0, 0]);
      const arr = Uint8ClampedArray.from(parent);
      expect(arr[0]).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_2700
     * @tc.name testUint8ClampedArrayFromOne027
     * @tc.desc Verify Uint8ClampedArray.from element at arr[1] equals 255 for array [255, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([255, 255]);
      const arr = Uint8ClampedArray.from(parent);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_2800
     * @tc.name testUint8ClampedArrayFromOne028
     * @tc.desc Verify Uint8ClampedArray length=256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray(256);
      const arr = Uint8ClampedArray.from(parent);
      expect(arr.length).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_2900
     * @tc.name testUint8ClampedArrayFromOne029
     * @tc.desc Verify ArrayLike<number> 127.5 half-even 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [127.5];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_3000
     * @tc.name testUint8ClampedArrayFromOne030
     * @tc.desc Verify ArrayLike<number> 128.5 half-even 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [128.5];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_3100
     * @tc.name testUint8ClampedArrayFromOne031
     * @tc.desc Verify ArrayLike<number> 0.5 half-even 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.5];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_3200
     * @tc.name testUint8ClampedArrayFromOne032
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.4];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_3300
     * @tc.name testUint8ClampedArrayFromOne033
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 1 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.9];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_3400
     * @tc.name testUint8ClampedArrayFromOne034
     * @tc.desc Verify ArrayLike<number> NaN clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.NaN];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_3500
     * @tc.name testUint8ClampedArrayFromOne035
     * @tc.desc Verify ArrayLike<number> Infinity clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.POSITIVE_INFINITY];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_3600
     * @tc.name testUint8ClampedArrayFromOne036
     * @tc.desc Verify ArrayLike<number> -Infinity clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-Number.POSITIVE_INFINITY];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_3700
     * @tc.name testUint8ClampedArrayFromOne037
     * @tc.desc Verify ArrayLike<number> -0 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-0.0];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_3800
     * @tc.name testUint8ClampedArrayFromOne038
     * @tc.desc Verify ArrayLike<number> 1e9 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1e9];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_3900
     * @tc.name testUint8ClampedArrayFromOne039
     * @tc.desc Verify ArrayLike<number> -1e9 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1e9];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_4000
     * @tc.name testUint8ClampedArrayFromOne040
     * @tc.desc Verify ArrayLike<number> Number.MAX_VALUE clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.MAX_VALUE];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_4100
     * @tc.name testUint8ClampedArrayFromOne041
     * @tc.desc Verify ArrayLike<number> Number.MIN_VALUE clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.MIN_VALUE];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_4200
     * @tc.name testUint8ClampedArrayFromOne042
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-1.0, 0.0, 128.0, 255.0, 256.0];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
      expect(arr[3]).assertEqual(255);
      expect(arr[4]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_4300
     * @tc.name testUint8ClampedArrayFromOne043
     * @tc.desc Verify Uint8ClampedArray.from yields length 4 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0, 4.0];
      const arr = Uint8ClampedArray.from(src);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_4400
     * @tc.name testUint8ClampedArrayFromOne044
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 127 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [127.4];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_4500
     * @tc.name testUint8ClampedArrayFromOne045
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 128 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [127.6];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_4600
     * @tc.name testUint8ClampedArrayFromOne046
     * @tc.desc Verify ArrayLike<number> 254.5 half-even 254
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [254.5];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_4700
     * @tc.name testUint8ClampedArrayFromOne047
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [9999999];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_4800
     * @tc.name testUint8ClampedArrayFromOne048
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-9999999];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_4900
     * @tc.name testUint8ClampedArrayFromOne049
     * @tc.desc Verify ArrayLike<number> element 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_5000
     * @tc.name testUint8ClampedArrayFromOne050
     * @tc.desc Verify Uint8ClampedArray.from yields length 0 for from(set)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      const arr = Uint8ClampedArray.from(set);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_5100
     * @tc.name testUint8ClampedArrayFromOne051
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(set)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(0.0);
      const arr = Uint8ClampedArray.from(set);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_5200
     * @tc.name testUint8ClampedArrayFromOne052
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(set)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(255.0);
      const arr = Uint8ClampedArray.from(set);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_5300
     * @tc.name testUint8ClampedArrayFromOne053
     * @tc.desc Verify Iterable<number> Set 256.0 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(256.0);
      const arr = Uint8ClampedArray.from(set);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_5400
     * @tc.name testUint8ClampedArrayFromOne054
     * @tc.desc Verify Iterable<number> Set -1.0 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(-1.0);
      const arr = Uint8ClampedArray.from(set);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_5500
     * @tc.name testUint8ClampedArrayFromOne055
     * @tc.desc Verify Iterable<number> Set NaN clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(Number.NaN);
      const arr = Uint8ClampedArray.from(set);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_5600
     * @tc.name testUint8ClampedArrayFromOne056
     * @tc.desc Verify Iterable<number> Set Infinity clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(Number.POSITIVE_INFINITY);
      const arr = Uint8ClampedArray.from(set);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_5700
     * @tc.name testUint8ClampedArrayFromOne057
     * @tc.desc Verify Iterable<number> Set 10 20 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(10.0); set.add(20.0); set.add(30.0);
      const arr = Uint8ClampedArray.from(set);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_5800
     * @tc.name testUint8ClampedArrayFromOne058
     * @tc.desc Verify Iterable<number> Set length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0); set.add(2.0); set.add(3.0); set.add(4.0);
      const arr = Uint8ClampedArray.from(set);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_5900
     * @tc.name testUint8ClampedArrayFromOne059
     * @tc.desc Verify Iterable<number> Set dedup length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(5.0); set.add(5.0); set.add(5.0);
      const arr = Uint8ClampedArray.from(set);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_6000
     * @tc.name testUint8ClampedArrayFromOne060
     * @tc.desc Verify Iterable<number> Set 127.5 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(127.5);
      const arr = Uint8ClampedArray.from(set);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_6100
     * @tc.name testUint8ClampedArrayFromOne061
     * @tc.desc Verify from preserves the value and length of a Set source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0);
      const arr = Uint8ClampedArray.from(set);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_6200
     * @tc.name testUint8ClampedArrayFromOne062
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 1 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0); set.add(2.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => v);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_6300
     * @tc.name testUint8ClampedArrayFromOne063
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 20 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(10.0); set.add(20.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => v * 2.0);
      expect(arr[0]).assertEqual(20);
      expect(arr[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_6400
     * @tc.name testUint8ClampedArrayFromOne064
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => 256.0);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_6500
     * @tc.name testUint8ClampedArrayFromOne065
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => -1.0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_6600
     * @tc.name testUint8ClampedArrayFromOne066
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => Number.NaN);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_6700
     * @tc.name testUint8ClampedArrayFromOne067
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => Number.POSITIVE_INFINITY);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_6800
     * @tc.name testUint8ClampedArrayFromOne068
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => -Number.POSITIVE_INFINITY);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_6900
     * @tc.name testUint8ClampedArrayFromOne069
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 128 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => 127.5);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_7000
     * @tc.name testUint8ClampedArrayFromOne070
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 128 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => 128.5);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_7100
     * @tc.name testUint8ClampedArrayFromOne071
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(10.0); set.add(20.0); set.add(30.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => k);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_7200
     * @tc.name testUint8ClampedArrayFromOne072
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 107 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(7.0); set.add(8.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => v + 100.0);
      expect(arr[0]).assertEqual(107);
      expect(arr[1]).assertEqual(108);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_7300
     * @tc.name testUint8ClampedArrayFromOne073
     * @tc.desc Verify Uint8ClampedArray.from propagates Error thrown by mapfn for Set input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0);
      try {
        Uint8ClampedArray.from(set, (v: number, k: number): number => {
          throw new Error('mapfn error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_7400
     * @tc.name testUint8ClampedArrayFromOne074
     * @tc.desc Verify Uint8ClampedArray.from propagates TypeError thrown by mapfn for Set input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0);
      try {
        Uint8ClampedArray.from(set, (v: number, k: number): number => {
          throw new TypeError('bad');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_7500
     * @tc.name testUint8ClampedArrayFromOne075
     * @tc.desc Verify Uint8ClampedArray.from propagates RangeError thrown by mapfn for Set input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0);
      try {
        Uint8ClampedArray.from(set, (v: number, k: number): number => {
          throw new RangeError('range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_7600
     * @tc.name testUint8ClampedArrayFromOne076
     * @tc.desc Verify Uint8ClampedArray.from on empty Set does not call mapfn and returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      let called: int = 0;
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => {
        called = called + 1;
        return v;
      });
      expect(called).assertEqual(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_7700
     * @tc.name testUint8ClampedArrayFromOne077
     * @tc.desc Verify Uint8ClampedArray.from calls mapfn once per Set element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0); set.add(2.0); set.add(3.0);
      let called: int = 0;
      Uint8ClampedArray.from(set, (v: number, k: number): number => {
        called = called + 1;
        return v;
      });
      expect(called).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_7800
     * @tc.name testUint8ClampedArrayFromOne078
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(200.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => v + 128.0);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_7900
     * @tc.name testUint8ClampedArrayFromOne079
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(100.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => v - 200.0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_8000
     * @tc.name testUint8ClampedArrayFromOne080
     * @tc.desc Verify Uint8ClampedArray.from yields length 5 for from(set, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(1.0); set.add(2.0); set.add(3.0); set.add(4.0); set.add(5.0);
      const arr = Uint8ClampedArray.from(set, (v: number, k: number): number => v);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_8100
     * @tc.name testUint8ClampedArrayFromOne081
     * @tc.desc Verify from snapshots an Array source at construction time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1];
      const arr = Uint8ClampedArray.from(src);
      src[0] = 9;
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_ONE_8200
     * @tc.name testUint8ClampedArrayFromOne082
     * @tc.desc Verify Uint8ClampedArray.from yields BYTES_PER_ELEMENT 1 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1];
      const arr = Uint8ClampedArray.from(src);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });
  });
}
