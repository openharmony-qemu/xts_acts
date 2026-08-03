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

export default function uint8ClampedArrayFull07Test(): void {
  describe('uint8ClampedArrayFull07Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_0100
     * @tc.name testUint8ClampedArrayFullSeven001
     * @tc.desc Verify fill element at arr[0] equals 9 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(9);
      expect(arr[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_0200
     * @tc.name testUint8ClampedArrayFullSeven002
     * @tc.desc Verify fill element at arr[2] equals 7 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(7, 2);
      expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_0300
     * @tc.name testUint8ClampedArrayFullSeven003
     * @tc.desc Verify fill element at arr[1] equals 5 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(5, 1, 3);
      expect(arr[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_0400
     * @tc.name testUint8ClampedArrayFullSeven004
     * @tc.desc Verify copyWithin element at arr[2] equals 10 for array [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      arr.copyWithin(2);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_0500
     * @tc.name testUint8ClampedArrayFullSeven005
     * @tc.desc Verify copyWithin element at arr[0] equals 30 for array [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_0600
     * @tc.name testUint8ClampedArrayFullSeven006
     * @tc.desc Verify constructor element [0] equals 255 for array [256]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256]);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_0700
     * @tc.name testUint8ClampedArrayFullSeven007
     * @tc.desc Verify constructor element [0] equals 255 for array [257]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([257]);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_0800
     * @tc.name testUint8ClampedArrayFullSeven008
     * @tc.desc Verify constructor element [0] equals 255 for array [1000]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1000]);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_0900
     * @tc.name testUint8ClampedArrayFullSeven009
     * @tc.desc Verify constructor element [0] equals 255 for array [1e9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e9]);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_1000
     * @tc.name testUint8ClampedArrayFullSeven010
     * @tc.desc Verify constructor element [0] equals 0 for array [-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_1100
     * @tc.name testUint8ClampedArrayFullSeven011
     * @tc.desc Verify constructor element [0] equals 0 for array [-100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-100]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_1200
     * @tc.name testUint8ClampedArrayFullSeven012
     * @tc.desc Verify constructor element [0] equals 0 for array [-1e9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1e9]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_1300
     * @tc.name testUint8ClampedArrayFullSeven013
     * @tc.desc Verify constructor element [0] equals 0 for array [Number.NaN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_1400
     * @tc.name testUint8ClampedArrayFullSeven014
     * @tc.desc Verify constructor element [0] equals 255 for array [Number.POSITIVE_INFINITY]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY]);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_1500
     * @tc.name testUint8ClampedArrayFullSeven015
     * @tc.desc Verify constructor element [0] equals 0 for array [-Number.POSITIVE_INFINITY]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-Number.POSITIVE_INFINITY]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_1600
     * @tc.name testUint8ClampedArrayFullSeven016
     * @tc.desc Verify constructor element [0] equals 0 for array [0.4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.4]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_1700
     * @tc.name testUint8ClampedArrayFullSeven017
     * @tc.desc Verify constructor element [0] equals 0 for array [0.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_1800
     * @tc.name testUint8ClampedArrayFullSeven018
     * @tc.desc Verify constructor element [0] equals 1 for array [0.9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.9]);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_1900
     * @tc.name testUint8ClampedArrayFullSeven019
     * @tc.desc Verify constructor element [0] equals 128 for array [127.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5]);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_2000
     * @tc.name testUint8ClampedArrayFullSeven020
     * @tc.desc Verify constructor element [0] equals 128 for array [128.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128.5]);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_2100
     * @tc.name testUint8ClampedArrayFullSeven021
     * @tc.desc Verify constructor element [0] equals 0 for array [-0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-0]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_2200
     * @tc.name testUint8ClampedArrayFullSeven022
     * @tc.desc Verify constructor element [0] equals 255 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr.$_set(0, 256);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_2300
     * @tc.name testUint8ClampedArrayFullSeven023
     * @tc.desc Verify constructor element [0] equals 0 for array [100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      arr.$_set(0, -1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_2400
     * @tc.name testUint8ClampedArrayFullSeven024
     * @tc.desc Verify constructor element [0] equals 0 for array [100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      arr.$_set(0, Number.NaN);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_2500
     * @tc.name testUint8ClampedArrayFullSeven025
     * @tc.desc Verify constructor element [0] equals 255 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_2600
     * @tc.name testUint8ClampedArrayFullSeven026
     * @tc.desc Verify constructor element [0] equals 0 for array [100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      arr.$_set(0, -Number.POSITIVE_INFINITY);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_2700
     * @tc.name testUint8ClampedArrayFullSeven027
     * @tc.desc Verify constructor element [0] equals 200 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr.$_set(0, 200.5);
      expect(arr[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_2800
     * @tc.name testUint8ClampedArrayFullSeven028
     * @tc.desc Verify constructor element [0] equals 202 for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr.$_set(0, 201.5);
      expect(arr[0]).assertEqual(202);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_2900
     * @tc.name testUint8ClampedArrayFullSeven029
     * @tc.desc Verify fill element at arr[1] equals 255 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr.fill(300);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_3000
     * @tc.name testUint8ClampedArrayFullSeven030
     * @tc.desc Verify fill element at arr[0] equals 0 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.fill(-50);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_3100
     * @tc.name testUint8ClampedArrayFullSeven031
     * @tc.desc Verify fill element at arr[2] equals 0 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.fill(Number.NaN);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_3200
     * @tc.name testUint8ClampedArrayFullSeven032
     * @tc.desc Verify fill element at arr[1] equals 255 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr.fill(Number.POSITIVE_INFINITY);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_3300
     * @tc.name testUint8ClampedArrayFullSeven033
     * @tc.desc Verify fill element at arr[0] equals 100 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr.fill(99.5);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_3400
     * @tc.name testUint8ClampedArrayFullSeven034
     * @tc.desc Verify fill element at arr[0] equals 100 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr.fill(100.5);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_3500
     * @tc.name testUint8ClampedArrayFullSeven035
     * @tc.desc Verify with index RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.with(-4, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_3600
     * @tc.name testUint8ClampedArrayFullSeven036
     * @tc.desc Verify with element at r[1] equals 255 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.with(1, 256);
      expect(r[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_3700
     * @tc.name testUint8ClampedArrayFullSeven037
     * @tc.desc Verify with element at r[0] equals 0 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.with(0, -10);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_3800
     * @tc.name testUint8ClampedArrayFullSeven038
     * @tc.desc Verify with element at r[2] equals 0 for array [5, 6, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const r = arr.with(2, Number.NaN);
      expect(r[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_3900
     * @tc.name testUint8ClampedArrayFullSeven039
     * @tc.desc Verify Uint8ClampedArray.of element at arr[0] equals 255 for of(500)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(500);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_4000
     * @tc.name testUint8ClampedArrayFullSeven040
     * @tc.desc Verify of with mixed values: -5 clamp 0, 100 keep, 300 clamp 255, NaN clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(-5, 100, 300, Number.NaN);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(255);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_4100
     * @tc.name testUint8ClampedArrayFullSeven041
     * @tc.desc Verify from with boundary values: 256 clamp 255, -1 clamp 0, 128 keep
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [256.0, -1.0, 128.0];
      const arr = Uint8ClampedArray.from(src);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_4200
     * @tc.name testUint8ClampedArrayFullSeven042
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 255 for from(src, (v: number, i: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const arr = Uint8ClampedArray.from(src, (v: number, i: number): number => v + 300.0);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_4300
     * @tc.name testUint8ClampedArrayFullSeven043
     * @tc.desc Verify Uint8ClampedArray.from element at arr[0] equals 0 for from(src, (v: number, i: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10.0, 20.0];
      const arr = Uint8ClampedArray.from(src, (v: number, i: number): number => -v);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_4400
     * @tc.name testUint8ClampedArrayFullSeven044
     * @tc.desc Verify .set element at arr[2] equals 255 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      const src: Array<number> = [-5.0, 128.0, 999.0];
      arr.set(src, 0);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_4500
     * @tc.name testUint8ClampedArrayFullSeven045
     * @tc.desc Verify subarray buffer reference matches for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(0, 2);
      expect(sub.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_4600
     * @tc.name testUint8ClampedArrayFullSeven046
     * @tc.desc Verify subarray element at parent[1] equals 99 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(1, 3);
      sub[0] = 99;
      expect(parent[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_4700
     * @tc.name testUint8ClampedArrayFullSeven047
     * @tc.desc Verify subarray element at sub[1] equals 88 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(1, 3);
      parent[2] = 88;
      expect(sub[1]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_4800
     * @tc.name testUint8ClampedArrayFullSeven048
     * @tc.desc Verify subarray element at b[0] equals 77 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const a = parent.subarray(0, 3);
      const b = parent.subarray(2, 5);
      a[2] = 77;
      expect(b[0]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_4900
     * @tc.name testUint8ClampedArrayFullSeven049
     * @tc.desc Verify subarray buffer reference matches for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const s1 = parent.subarray(0, 3);
      const s2 = s1.subarray(0, 2);
      expect(s2.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_5000
     * @tc.name testUint8ClampedArrayFullSeven050
     * @tc.desc Verify subarray yields byteOffset 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = parent.subarray(2, 4);
      expect(s.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_5100
     * @tc.name testUint8ClampedArrayFullSeven051
     * @tc.desc Verify slice result shares no buffer with parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const s = parent.slice(0, 2);
      expect(s.buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_5200
     * @tc.name testUint8ClampedArrayFullSeven052
     * @tc.desc Verify slice element at parent[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const s = parent.slice(0, 2);
      s[0] = 99;
      expect(parent[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_5300
     * @tc.name testUint8ClampedArrayFullSeven053
     * @tc.desc Verify slice element at s[0] equals 10 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30]);
      const s = parent.slice(0, 2);
      parent[0] = 200;
      expect(s[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_5400
     * @tc.name testUint8ClampedArrayFullSeven054
     * @tc.desc Verify map result shares no buffer with parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const m = parent.map((v: number, i: int, _a: Uint8ClampedArray): number => v + 1);
      expect(m.buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_5500
     * @tc.name testUint8ClampedArrayFullSeven055
     * @tc.desc Verify filter result shares no buffer with parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const f = parent.filter((v: number, i: int, _a: Uint8ClampedArray): boolean => v > 1);
      expect(f.buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_5600
     * @tc.name testUint8ClampedArrayFullSeven056
     * @tc.desc Verify toReversed result shares no buffer with parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const r = parent.toReversed();
      expect(r.buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_5700
     * @tc.name testUint8ClampedArrayFullSeven057
     * @tc.desc Verify toSorted result shares no buffer with parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([3, 1, 2]);
      const r = parent.toSorted();
      expect(r.buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_5800
     * @tc.name testUint8ClampedArrayFullSeven058
     * @tc.desc Verify from(Uint8ClampedArray) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const copy = Uint8ClampedArray.from(parent);
      expect(copy.buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_5900
     * @tc.name testUint8ClampedArrayFullSeven059
     * @tc.desc Verify constructor element [0] equals 99 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const firstView = new Uint8ClampedArray(buf);
      const secondView = new Uint8ClampedArray(buf);
      firstView[0] = 99;
      expect(secondView[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_6000
     * @tc.name testUint8ClampedArrayFullSeven060
     * @tc.desc Verify constructing ArrayBuffer-backed array yields length secondView.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const firstView = new Uint8ClampedArray(buf);
      const secondView = new Uint8ClampedArray(buf);
      expect(firstView.length).assertEqual(6);
      expect(secondView.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_6100
     * @tc.name testUint8ClampedArrayFullSeven061
     * @tc.desc Verify constructor element [0] equals 11 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const firstView = new Uint8ClampedArray(buf, 0, 3);
      const secondView = new Uint8ClampedArray(buf, 3, 3);
      firstView[0] = 11;
      secondView[0] = 22;
      expect(firstView[0]).assertEqual(11);
      expect(secondView[0]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_6200
     * @tc.name testUint8ClampedArrayFullSeven062
     * @tc.desc Verify constructor element [0] equals 50 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const firstView = new Uint8ClampedArray(buf, 0, 4);
      const secondView = new Uint8ClampedArray(buf, 2, 4);
      firstView[2] = 50;
      expect(secondView[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_6300
     * @tc.name testUint8ClampedArrayFullSeven063
     * @tc.desc Verify subarray buffer reference matches for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const s = parent.subarray(2, 2);
      expect(s.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_6400
     * @tc.name testUint8ClampedArrayFullSeven064
     * @tc.desc Verify subarray yields byteLength 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const s = parent.subarray(1, 4);
      expect(s.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_6500
     * @tc.name testUint8ClampedArrayFullSeven065
     * @tc.desc Verify reverse yields length before for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_6600
     * @tc.name testUint8ClampedArrayFullSeven066
     * @tc.desc Verify toReversed element at arr[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const reversed = arr.toReversed();
      expect(reversed.length).assertEqual(3);
      expect(reversed[0]).assertEqual(3);
      expect(reversed[1]).assertEqual(2);
      expect(reversed[2]).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_6700
     * @tc.name testUint8ClampedArrayFullSeven067
     * @tc.desc Verify toSorted element at arr[0] equals 3 for array [3, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_6800
     * @tc.name testUint8ClampedArrayFullSeven068
     * @tc.desc Verify map element at arr[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const mapped = arr.map((v: number, i: int, _a: Uint8ClampedArray): number => v + 1);
      expect(mapped.length).assertEqual(3);
      expect(mapped[0]).assertEqual(2);
      expect(mapped[1]).assertEqual(3);
      expect(mapped[2]).assertEqual(4);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_6900
     * @tc.name testUint8ClampedArrayFullSeven069
     * @tc.desc Verify filter yields length 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const filtered = arr.filter((v: number, i: int, _a: Uint8ClampedArray): boolean => v > 1);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(2);
      expect(filtered[1]).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_7000
     * @tc.name testUint8ClampedArrayFullSeven070
     * @tc.desc Verify slice yields length 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sliced = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0]).assertEqual(1);
      expect(sliced[1]).assertEqual(2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_7100
     * @tc.name testUint8ClampedArrayFullSeven071
     * @tc.desc Verify with element at arr[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const withed = arr.with(0, 99);
      expect(withed.length).assertEqual(3);
      expect(withed[0]).assertEqual(99);
      expect(withed[1]).assertEqual(2);
      expect(withed[2]).assertEqual(3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_7200
     * @tc.name testUint8ClampedArrayFullSeven072
     * @tc.desc Verify subarray element at arr[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sub = arr.subarray(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_7300
     * @tc.name testUint8ClampedArrayFullSeven073
     * @tc.desc Verify join returns '1,2,3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      expect(arr.join(',')).assertEqual('1,2,3');
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_7400
     * @tc.name testUint8ClampedArrayFullSeven074
     * @tc.desc Verify indexOf element at arr[1] equals 2 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const idx = arr.indexOf(2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_7500
     * @tc.name testUint8ClampedArrayFullSeven075
     * @tc.desc Verify reverse element at arr[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      arr.reverse();
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_7600
     * @tc.name testUint8ClampedArrayFullSeven076
     * @tc.desc Verify toReversed element at r[0] equals arr[0] for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toReversed().toReversed();
      expect(r[0]).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_7700
     * @tc.name testUint8ClampedArrayFullSeven077
     * @tc.desc Verify toReversed element at r[0] equals 3 for array [3, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const r = arr.toSorted().toReversed();
      expect(r[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_7800
     * @tc.name testUint8ClampedArrayFullSeven078
     * @tc.desc Verify slice yields length 2 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.slice(0, 4).slice(1, 3);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_7900
     * @tc.name testUint8ClampedArrayFullSeven079
     * @tc.desc Verify subarray yields length 2 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.subarray(1, 5).subarray(0, 2);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_8000
     * @tc.name testUint8ClampedArrayFullSeven080
     * @tc.desc Verify map element at r[0] equals 4 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.map((v: number, i: int, _a: Uint8ClampedArray): number => v + 1).map((v: number, i: int, _a: Uint8ClampedArray): number => v * 2);
      expect(r[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_8100
     * @tc.name testUint8ClampedArrayFullSeven081
     * @tc.desc Verify filter yields length 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.filter((v: number, i: int, _a: Uint8ClampedArray): boolean => v > 1).filter((v: number, i: int, _a: Uint8ClampedArray): boolean => v < 4);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_8200
     * @tc.name testUint8ClampedArrayFullSeven082
     * @tc.desc Verify with element at r[1] equals 20 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.with(0, 10).with(1, 20);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_8300
     * @tc.name testUint8ClampedArrayFullSeven083
     * @tc.desc Verify fill element at arr[0] equals 5 for length-4 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      arr.fill(5).sort();
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_8400
     * @tc.name testUint8ClampedArrayFullSeven084
     * @tc.desc Verify copyWithin element at arr[0] equals 4 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.copyWithin(0, 2).reverse();
      expect(arr[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_8500
     * @tc.name testUint8ClampedArrayFullSeven085
     * @tc.desc Verify forEach accumulated sum equals 6 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let sum: number = 0;
      arr.forEach((v: number, i: int, _a: Uint8ClampedArray): void => { sum += v; });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_8600
     * @tc.name testUint8ClampedArrayFullSeven086
     * @tc.desc Verify forEach acc equals 60 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const factor: number = 10;
      let acc: number = 0;
      arr.forEach((v: number, i: int, _a: Uint8ClampedArray): void => { acc += v * factor; });
      expect(acc).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_8700
     * @tc.name testUint8ClampedArrayFullSeven087
     * @tc.desc Verify map element at r[0] equals 101 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const offset: number = 100;
      const r = arr.map((v: number, i: int, _a: Uint8ClampedArray): number => v + offset);
      expect(r[0]).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_8800
     * @tc.name testUint8ClampedArrayFullSeven088
     * @tc.desc Verify filter yields length 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const threshold: number = 2;
      const r = arr.filter((v: number, i: int, _a: Uint8ClampedArray): boolean => v > threshold);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_8900
     * @tc.name testUint8ClampedArrayFullSeven089
     * @tc.desc Verify reduce r equals 6 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.reduce((acc: number, v: number, i: int, _a: Uint8ClampedArray): number => acc + v, 0.0);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_9000
     * @tc.name testUint8ClampedArrayFullSeven090
     * @tc.desc Verify find hitIdx equals 1 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let hitIdx: number = -1;
      arr.find((v: number, i: int, _a: Uint8ClampedArray): boolean => { if (v === 20) { hitIdx = i; return true; } return false; });
      expect(hitIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_9100
     * @tc.name testUint8ClampedArrayFullSeven091
     * @tc.desc Verify forEach element at collected[2] equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const collected: Array<number> = [0.0, 0.0, 0.0];
      arr.forEach((v: number, i: int, _a: Uint8ClampedArray): void => { collected[i] = v; });
      expect(collected[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_9200
     * @tc.name testUint8ClampedArrayFullSeven092
     * @tc.desc Verify some iteration count equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let count: number = 0;
      arr.some((v: number, i: int, _a: Uint8ClampedArray): boolean => { count++; return v > 100; });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FULL_SEVEN_9300
     * @tc.name testUint8ClampedArrayFullSeven093
     * @tc.desc Verify every calls equals 2 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFullSeven093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let calls: number = 0;
      arr.every((v: number, i: int, _a: Uint8ClampedArray): boolean => { calls++; return v < 2; });
      expect(calls).assertEqual(2);
    });
  });
}
