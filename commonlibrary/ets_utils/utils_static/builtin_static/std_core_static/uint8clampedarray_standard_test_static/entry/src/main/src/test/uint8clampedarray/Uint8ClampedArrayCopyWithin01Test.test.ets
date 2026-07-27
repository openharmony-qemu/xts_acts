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

export default function uint8ClampedArrayCopyWithin01Test(): void {
  describe('uint8ClampedArrayCopyWithin01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_0100
     * @tc.name testUint8ClampedArrayCopyWithinOne001
     * @tc.desc Verify copyWithin(0,1) copies arr[1] to arr[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.copyWithin(0, 1);
      expect(r[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_0200
     * @tc.name testUint8ClampedArrayCopyWithinOne002
     * @tc.desc Verify copyWithin element at r[0] equals 2 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.copyWithin(0, 1, 3);
      expect(r[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_0300
     * @tc.name testUint8ClampedArrayCopyWithinOne003
     * @tc.desc Verify copyWithin(0, 1, undefined) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.copyWithin(0, 1, undefined);
      expect(r[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_0400
     * @tc.name testUint8ClampedArrayCopyWithinOne004
     * @tc.desc Verify copyWithin(2, 0) end =length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const r = arr.copyWithin(2, 0);
      expect(r[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_0500
     * @tc.name testUint8ClampedArrayCopyWithinOne005
     * @tc.desc Verify copyWithin element at arr[0] equals 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_0600
     * @tc.name testUint8ClampedArrayCopyWithinOne006
     * @tc.desc Verify copyWithin element at arr[1] equals 4 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(1, 3, 5);
      expect(arr[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_0700
     * @tc.name testUint8ClampedArrayCopyWithinOne007
     * @tc.desc Verify copyWithin element at arr[4] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(4, 0, 1);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_0800
     * @tc.name testUint8ClampedArrayCopyWithinOne008
     * @tc.desc Verify copyWithin element at arr[4] equals 5 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(5, 0, 3);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_0900
     * @tc.name testUint8ClampedArrayCopyWithinOne009
     * @tc.desc Verify copyWithin element at arr[4] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(-1, 0, 1);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_1000
     * @tc.name testUint8ClampedArrayCopyWithinOne010
     * @tc.desc Verify copyWithin element at arr[3] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(-2, 0, 1);
      expect(arr[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_1100
     * @tc.name testUint8ClampedArrayCopyWithinOne011
     * @tc.desc Verify copyWithin element at arr[0] equals 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(-5, 2, 4);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_1200
     * @tc.name testUint8ClampedArrayCopyWithinOne012
     * @tc.desc Verify copyWithin element at arr[0] equals 2 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(-100, 1, 2);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_1300
     * @tc.name testUint8ClampedArrayCopyWithinOne013
     * @tc.desc Verify copyWithin with target=INT_MAX is no-op, arr[0] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(2147483647, 0, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_1400
     * @tc.name testUint8ClampedArrayCopyWithinOne014
     * @tc.desc Verify copyWithin element at arr[0] equals 2 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(-2147483648, 1, 3);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_1500
     * @tc.name testUint8ClampedArrayCopyWithinOne015
     * @tc.desc Verify copyWithin element at arr[0] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0x7FFFFFFF, 0, 2);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_1600
     * @tc.name testUint8ClampedArrayCopyWithinOne016
     * @tc.desc Verify copyWithin element at arr[2] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0x02, 0, 2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_1700
     * @tc.name testUint8ClampedArrayCopyWithinOne017
     * @tc.desc Verify copyWithin element at arr[3] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0o3, 0, 1);
      expect(arr[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_1800
     * @tc.name testUint8ClampedArrayCopyWithinOne018
     * @tc.desc Verify copyWithin element at arr[2] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0b10, 0, 1);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_1900
     * @tc.name testUint8ClampedArrayCopyWithinOne019
     * @tc.desc Verify copyWithin element at arr[0] equals 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(-0, 2, 4);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_2000
     * @tc.name testUint8ClampedArrayCopyWithinOne020
     * @tc.desc Verify copyWithin element at arr[4] equals 1 for array [1, 2, 3, 4, 5, 6, 7, 8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8]);
      arr.copyWithin(4, 0, 2);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_2100
     * @tc.name testUint8ClampedArrayCopyWithinOne021
     * @tc.desc Verify copyWithin element at arr[3] equals 10 for array [10, 20, 30, 40, 50, 60]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(3, 0, 2);
      expect(arr[3]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_2200
     * @tc.name testUint8ClampedArrayCopyWithinOne022
     * @tc.desc Verify copyWithin element at arr[2] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(2, 0, 2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_2300
     * @tc.name testUint8ClampedArrayCopyWithinOne023
     * @tc.desc Verify copyWithin element at arr[0] equals 2 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 1, 3);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_2400
     * @tc.name testUint8ClampedArrayCopyWithinOne024
     * @tc.desc Verify copyWithin element at arr[0] equals 5 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 4);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_2500
     * @tc.name testUint8ClampedArrayCopyWithinOne025
     * @tc.desc Verify copyWithin with start=length is no-op, arr[0] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_2600
     * @tc.name testUint8ClampedArrayCopyWithinOne026
     * @tc.desc Verify copyWithin element at arr[0] equals 5 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, -1);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_2700
     * @tc.name testUint8ClampedArrayCopyWithinOne027
     * @tc.desc Verify copyWithin element at arr[0] equals 4 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, -2);
      expect(arr[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_2800
     * @tc.name testUint8ClampedArrayCopyWithinOne028
     * @tc.desc Verify copyWithin element at arr[2] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(2, -5, -3);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_2900
     * @tc.name testUint8ClampedArrayCopyWithinOne029
     * @tc.desc Verify copyWithin element at arr[0] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, -100, 2);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_3000
     * @tc.name testUint8ClampedArrayCopyWithinOne030
     * @tc.desc Verify copyWithin element at arr[0] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2147483647);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_3100
     * @tc.name testUint8ClampedArrayCopyWithinOne031
     * @tc.desc Verify copyWithin element at arr[0] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, -2147483648, 2);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_3200
     * @tc.name testUint8ClampedArrayCopyWithinOne032
     * @tc.desc Verify copyWithin element at arr[0] equals 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0x02);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_3300
     * @tc.name testUint8ClampedArrayCopyWithinOne033
     * @tc.desc Verify copyWithin element at arr[0] equals 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0o2);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_3400
     * @tc.name testUint8ClampedArrayCopyWithinOne034
     * @tc.desc Verify copyWithin element at arr[0] equals 4 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0b11);
      expect(arr[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_3500
     * @tc.name testUint8ClampedArrayCopyWithinOne035
     * @tc.desc Verify copyWithin element at arr[2] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(2, -0, 2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_3600
     * @tc.name testUint8ClampedArrayCopyWithinOne036
     * @tc.desc Verify copyWithin element at arr[0] equals 5 for array [1, 2, 3, 4, 5, 6, 7, 8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8]);
      arr.copyWithin(0, 4, 6);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_3700
     * @tc.name testUint8ClampedArrayCopyWithinOne037
     * @tc.desc Verify copyWithin element at arr[0] equals 30 for array [10, 20, 30, 40, 50, 60]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_3800
     * @tc.name testUint8ClampedArrayCopyWithinOne038
     * @tc.desc Verify copyWithin element at arr[0] equals 40 for array [10, 20, 30, 40, 50, 60]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 3, 5);
      expect(arr[0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_3900
     * @tc.name testUint8ClampedArrayCopyWithinOne039
     * @tc.desc Verify copyWithin element at arr[1] equals 6 for array [1, 2, 3, 4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(0, 4, 6);
      expect(arr[1]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_4000
     * @tc.name testUint8ClampedArrayCopyWithinOne040
     * @tc.desc Verify copyWithin element at arr[0] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, 0);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_4100
     * @tc.name testUint8ClampedArrayCopyWithinOne041
     * @tc.desc Verify copyWithin element at arr[2] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_4200
     * @tc.name testUint8ClampedArrayCopyWithinOne042
     * @tc.desc Verify copyWithin element at arr[2] equals 5 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2, 5);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_4300
     * @tc.name testUint8ClampedArrayCopyWithinOne043
     * @tc.desc Verify copyWithin element at arr[2] equals 4 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 1, 4);
      expect(arr[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_4400
     * @tc.name testUint8ClampedArrayCopyWithinOne044
     * @tc.desc Verify copyWithin element at arr[2] equals 5 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2, 6);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_4500
     * @tc.name testUint8ClampedArrayCopyWithinOne045
     * @tc.desc Verify copyWithin element at arr[3] equals 5 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 1, 105);
      expect(arr[3]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_4600
     * @tc.name testUint8ClampedArrayCopyWithinOne046
     * @tc.desc Verify copyWithin element at arr[0] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, -1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_4700
     * @tc.name testUint8ClampedArrayCopyWithinOne047
     * @tc.desc Verify copyWithin element at arr[1] equals 2 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, -2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_4800
     * @tc.name testUint8ClampedArrayCopyWithinOne048
     * @tc.desc Verify copyWithin element at arr[0] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, -5);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_4900
     * @tc.name testUint8ClampedArrayCopyWithinOne049
     * @tc.desc Verify copyWithin element at arr[0] equals 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2, 2147483647);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_5000
     * @tc.name testUint8ClampedArrayCopyWithinOne050
     * @tc.desc Verify copyWithin with end=INT_MIN clamped to 0 is no-op, arr[0] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, -2147483648);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_5100
     * @tc.name testUint8ClampedArrayCopyWithinOne051
     * @tc.desc Verify copyWithin element at arr[2] equals 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, 0x03);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_5200
     * @tc.name testUint8ClampedArrayCopyWithinOne052
     * @tc.desc Verify copyWithin element at arr[3] equals 4 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, 0o4);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_5300
     * @tc.name testUint8ClampedArrayCopyWithinOne053
     * @tc.desc Verify copyWithin element at arr[4] equals 5 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, 0b1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_5400
     * @tc.name testUint8ClampedArrayCopyWithinOne054
     * @tc.desc Verify copyWithin element at arr[3] equals 4 for array [1, 2, 3, 4, 5, 6, 7, 8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8]);
      arr.copyWithin(0, 0, 4);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_5500
     * @tc.name testUint8ClampedArrayCopyWithinOne055
     * @tc.desc Verify copyWithin element at arr[2] equals 10 for array [10, 20, 30, 40, 50, 60]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(2, 0, 2);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_5600
     * @tc.name testUint8ClampedArrayCopyWithinOne056
     * @tc.desc Verify copyWithin element at arr[3] equals 50 for array [10, 20, 30, 40, 50, 60]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50, 60]);
      arr.copyWithin(0, 1, 5);
      expect(arr[3]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_5700
     * @tc.name testUint8ClampedArrayCopyWithinOne057
     * @tc.desc Verify copyWithin element at arr[0] equals 2 for array [1, 2, 3, 4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6]);
      arr.copyWithin(0, 1, 4);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_5800
     * @tc.name testUint8ClampedArrayCopyWithinOne058
     * @tc.desc Verify copyWithin element at arr[2] equals 0 for array [0, 100, 200, 50, 80]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 100, 200, 50, 80]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_5900
     * @tc.name testUint8ClampedArrayCopyWithinOne059
     * @tc.desc Verify copyWithin element at arr[2] equals 255 for array [255, 100, 200, 50, 80]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 100, 200, 50, 80]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_6000
     * @tc.name testUint8ClampedArrayCopyWithinOne060
     * @tc.desc Verify copyWithin element at arr[2] equals 127 for array [127, 0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 0, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_6100
     * @tc.name testUint8ClampedArrayCopyWithinOne061
     * @tc.desc Verify copyWithin element at arr[2] equals 128 for array [128, 0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128, 0, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_6200
     * @tc.name testUint8ClampedArrayCopyWithinOne062
     * @tc.desc Verify 256 clamp 255 copyWithin 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, 0, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_6300
     * @tc.name testUint8ClampedArrayCopyWithinOne063
     * @tc.desc Verify copyWithin element at arr[2] equals 0 for array [-1, 100, 100, 100, 100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1, 100, 100, 100, 100]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_6400
     * @tc.name testUint8ClampedArrayCopyWithinOne064
     * @tc.desc Verify copyWithin element at arr[2] equals 0 for array [Number.NaN, 100, 100, 100, 100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN, 100, 100, 100, 100]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_6500
     * @tc.name testUint8ClampedArrayCopyWithinOne065
     * @tc.desc Verify Infinity clamp 255 copyWithin 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY, 0, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_6600
     * @tc.name testUint8ClampedArrayCopyWithinOne066
     * @tc.desc Verify -Infinity clamp 0 copyWithin 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-Number.POSITIVE_INFINITY, 100, 100, 100, 100]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_6700
     * @tc.name testUint8ClampedArrayCopyWithinOne067
     * @tc.desc Verify 1e9 clamp 255 copyWithin 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e9, 0, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_6800
     * @tc.name testUint8ClampedArrayCopyWithinOne068
     * @tc.desc Verify copyWithin element at arr[2] equals 0 for array [-1e9, 100, 100, 100, 100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1e9, 100, 100, 100, 100]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_6900
     * @tc.name testUint8ClampedArrayCopyWithinOne069
     * @tc.desc Verify 127.5 clamp 128(half-even) copyWithin 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5, 0, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_7000
     * @tc.name testUint8ClampedArrayCopyWithinOne070
     * @tc.desc Verify 128.5 clamp 128(half-even) copyWithin 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128.5, 0, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_7100
     * @tc.name testUint8ClampedArrayCopyWithinOne071
     * @tc.desc Verify 0.5 clamp 0(half-even) copyWithin 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5, 100, 100, 100, 100]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_7200
     * @tc.name testUint8ClampedArrayCopyWithinOne072
     * @tc.desc Verify copyWithin element at arr[2] equals 0 for array [0.4, 100, 100, 100, 100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.4, 100, 100, 100, 100]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_7300
     * @tc.name testUint8ClampedArrayCopyWithinOne073
     * @tc.desc Verify copyWithin element at arr[2] equals 1 for array [0.9, 0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.9, 0, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_7400
     * @tc.name testUint8ClampedArrayCopyWithinOne074
     * @tc.desc Verify 2147483648 clamp 255 copyWithin 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2147483648, 0, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_7500
     * @tc.name testUint8ClampedArrayCopyWithinOne075
     * @tc.desc Verify copyWithin element at arr[2] equals 0 for array [-0, 100, 100, 100, 100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-0, 100, 100, 100, 100]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_7600
     * @tc.name testUint8ClampedArrayCopyWithinOne076
     * @tc.desc Verify Number.MAX_VALUE clamp 255 copyWithin 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.MAX_VALUE, 0, 0, 0, 0]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_7700
     * @tc.name testUint8ClampedArrayCopyWithinOne077
     * @tc.desc Verify Number.MIN_VALUE clamp 0 copyWithin 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.MIN_VALUE, 100, 100, 100, 100]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_7800
     * @tc.name testUint8ClampedArrayCopyWithinOne078
     * @tc.desc Verify copyWithin yields length 0 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.copyWithin(0, 0, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_7900
     * @tc.name testUint8ClampedArrayCopyWithinOne079
     * @tc.desc Verify copyWithin element at arr[0] equals 42 for array [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      arr.copyWithin(0, 0, 1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_8000
     * @tc.name testUint8ClampedArrayCopyWithinOne080
     * @tc.desc Verify copyWithin element at arr[0] equals 1 for length-255 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(255);
      for (let i = 0; i < 255; i++) { arr[i] = i; }
      arr.copyWithin(0, 1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_8100
     * @tc.name testUint8ClampedArrayCopyWithinOne081
     * @tc.desc Verify copyWithin element at arr[0] equals 1 for length-256 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      for (let i = 0; i < 256; i++) { arr[i] = i; }
      arr.copyWithin(0, 1, 3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_8200
     * @tc.name testUint8ClampedArrayCopyWithinOne082
     * @tc.desc Verify copyWithin with start=512 is no-op for length-14 array, arr[0] equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(14);
      for (let i = 0; i < 14; i++) { arr[i] = i + 1; }
      arr.copyWithin(0, 512);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_8300
     * @tc.name testUint8ClampedArrayCopyWithinOne083
     * @tc.desc Verify copyWithin element at arr[0] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(-0, -0, -0);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_8400
     * @tc.name testUint8ClampedArrayCopyWithinOne084
     * @tc.desc Verify target=length-1 start=length-1 end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(4, 4, 5);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_8500
     * @tc.name testUint8ClampedArrayCopyWithinOne085
     * @tc.desc Verify copyWithin element at arr[4] equals 4 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(-1, -2, -1);
      expect(arr[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_8600
     * @tc.name testUint8ClampedArrayCopyWithinOne086
     * @tc.desc Verify copyWithin element at arr[0] equals 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, -3, 4);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_8700
     * @tc.name testUint8ClampedArrayCopyWithinOne087
     * @tc.desc Verify copyWithin element at arr[3] equals 2 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(-2, 1, -1);
      expect(arr[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_8800
     * @tc.name testUint8ClampedArrayCopyWithinOne088
     * @tc.desc Verify copyWithin element at arr[0] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 0, 1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_8900
     * @tc.name testUint8ClampedArrayCopyWithinOne089
     * @tc.desc Verify copyWithin element at arr[1] equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(1, 0, 1);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_9000
     * @tc.name testUint8ClampedArrayCopyWithinOne090
     * @tc.desc Verify target=INT_MAX start=INT_MAX end=INT_MAX no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(2147483647, 2147483647, 2147483647);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_9100
     * @tc.name testUint8ClampedArrayCopyWithinOne091
     * @tc.desc Verify target=INT_MIN start=INT_MIN end=INT_MIN no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(-2147483648, -2147483648, -2147483648);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_9200
     * @tc.name testUint8ClampedArrayCopyWithinOne092
     * @tc.desc Verify target=0x00 start=0x01 end=0x02
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0x00, 0x01, 0x02);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_9300
     * @tc.name testUint8ClampedArrayCopyWithinOne093
     * @tc.desc Verify target=0o0 start=0o1 end=0o2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0o0, 0o1, 0o2);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_9400
     * @tc.name testUint8ClampedArrayCopyWithinOne094
     * @tc.desc Verify target=0b00 start=0b01 end=0b10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0b00, 0b01, 0b10);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_9500
     * @tc.name testUint8ClampedArrayCopyWithinOne095
     * @tc.desc Verify copyWithin with start=15 is no-op for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 15);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_9600
     * @tc.name testUint8ClampedArrayCopyWithinOne096
     * @tc.desc Verify target=-length start=-length end=-length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.copyWithin(-5, -5, -5);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_9700
     * @tc.name testUint8ClampedArrayCopyWithinOne097
     * @tc.desc Verify length=100 copyWithin(50,0,50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      for (let i = 0; i < 100; i++) { src.push(i); }
      const arr = new Uint8ClampedArray(src);
      arr.copyWithin(50, 0, 50);
      expect(arr[50]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_COPY_WITHIN_ONE_9800
     * @tc.name testUint8ClampedArrayCopyWithinOne098
     * @tc.desc Verify copyWithin element at arr[10] equals 20 for array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayCopyWithinOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = new Array<number>();
      for (let i = 0; i < 50; i++) { src.push(i); }
      const arr = new Uint8ClampedArray(src);
      arr.copyWithin(10, 20, 30);
      expect(arr[10]).assertEqual(20);
    });
  });
}
