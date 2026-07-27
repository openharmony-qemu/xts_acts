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

export default function uint8ClampedArrayFill01Test(): void {
  describe('uint8ClampedArrayFill01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_0100
     * @tc.name testUint8ClampedArrayFillOne001
     * @tc.desc Verify fill element at arr[0] equals 7 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(v);
      expect(arr[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_0200
     * @tc.name testUint8ClampedArrayFillOne002
     * @tc.desc Verify fill element at arr[1] equals 9 for array [0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.fill(v, 1);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_0300
     * @tc.name testUint8ClampedArrayFillOne003
     * @tc.desc Verify fill element at arr[2] equals 5 for array [0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 5;
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.fill(v, 1, 3);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_0400
     * @tc.name testUint8ClampedArrayFillOne004
     * @tc.desc Verify fill element at arr[0] equals 8 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 8;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v, 0);
      expect(arr[0]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_0500
     * @tc.name testUint8ClampedArrayFillOne005
     * @tc.desc Verify fill element at arr[2] equals 4 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 4;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(v, 0, 3);
      expect(arr[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_0600
     * @tc.name testUint8ClampedArrayFillOne006
     * @tc.desc Verify fill element at arr[0] equals 0 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 0;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_0700
     * @tc.name testUint8ClampedArrayFillOne007
     * @tc.desc Verify fill element at arr[1] equals 1 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(v);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_0800
     * @tc.name testUint8ClampedArrayFillOne008
     * @tc.desc Verify fill element at arr[0] equals 127 for array [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 127;
      const arr = new Uint8ClampedArray([0, 0]);
      arr.fill(v);
      expect(arr[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_0900
     * @tc.name testUint8ClampedArrayFillOne009
     * @tc.desc Verify fill element at arr[0] equals 0 for array [10, 10, 10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -1;
      const arr = new Uint8ClampedArray([10, 10, 10]);
      arr.fill(v);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_1000
     * @tc.name testUint8ClampedArrayFillOne010
     * @tc.desc Verify value=byte -128 byte clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -128;
      const arr = new Uint8ClampedArray([5, 5, 5]);
      arr.fill(v);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_1100
     * @tc.name testUint8ClampedArrayFillOne011
     * @tc.desc Verify fill element at arr[0] equals 100 for array [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 100;
      const arr = new Uint8ClampedArray([0, 0]);
      arr.fill(v);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_1200
     * @tc.name testUint8ClampedArrayFillOne012
     * @tc.desc Verify fill element at arr[0] equals 50 for array [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 0o62;
      const arr = new Uint8ClampedArray([0, 0]);
      arr.fill(v);
      expect(arr[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_1300
     * @tc.name testUint8ClampedArrayFillOne013
     * @tc.desc Verify fill element at arr[0] equals 10 for array [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 0b1010;
      const arr = new Uint8ClampedArray([0, 0]);
      arr.fill(v);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_1400
     * @tc.name testUint8ClampedArrayFillOne014
     * @tc.desc Verify fill element at arr[0] equals 0 for array [99, 99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -64;
      const arr = new Uint8ClampedArray([99, 99]);
      arr.fill(v);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_1500
     * @tc.name testUint8ClampedArrayFillOne015
     * @tc.desc Verify fill element at arr[0] equals 7 for array [0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.fill(v, 0);
      expect(arr[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_1600
     * @tc.name testUint8ClampedArrayFillOne016
     * @tc.desc Verify fill element at arr[0] equals 0 for array [0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.fill(v, 1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_1700
     * @tc.name testUint8ClampedArrayFillOne017
     * @tc.desc Verify fill element at arr[3] equals 7 for array [0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.fill(v, 3);
      expect(arr[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_1800
     * @tc.name testUint8ClampedArrayFillOne018
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v, 3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_1900
     * @tc.name testUint8ClampedArrayFillOne019
     * @tc.desc Verify fill element at arr[2] equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v, 4);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_2000
     * @tc.name testUint8ClampedArrayFillOne020
     * @tc.desc Verify fill element at arr[3] equals 7 for array [0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.fill(v, -1);
      expect(arr[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_2100
     * @tc.name testUint8ClampedArrayFillOne021
     * @tc.desc Verify fill element at arr[0] equals 7 for array [0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.fill(v, -4);
      expect(arr[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_2200
     * @tc.name testUint8ClampedArrayFillOne022
     * @tc.desc Verify fill element at arr[0] equals 7 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(v, -10);
      expect(arr[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_2300
     * @tc.name testUint8ClampedArrayFillOne023
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v, 2147483647);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_2400
     * @tc.name testUint8ClampedArrayFillOne024
     * @tc.desc Verify fill element at arr[0] equals 7 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(v, -2147483648);
      expect(arr[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_2500
     * @tc.name testUint8ClampedArrayFillOne025
     * @tc.desc Verify fill element at arr[1] equals 2 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v, 0x7FFFFFFF);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_2600
     * @tc.name testUint8ClampedArrayFillOne026
     * @tc.desc Verify fill element at arr[2] equals 7 for array [0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.fill(v, -2);
      expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_2700
     * @tc.name testUint8ClampedArrayFillOne027
     * @tc.desc Verify fill element at arr[2] equals 7 for array [0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.fill(v, 2);
      expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_2800
     * @tc.name testUint8ClampedArrayFillOne028
     * @tc.desc Verify fill element at arr[2] equals 7 for array [0, 0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0, 0, 0]);
      arr.fill(v, -3);
      expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_2900
     * @tc.name testUint8ClampedArrayFillOne029
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v, 0, 0);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_3000
     * @tc.name testUint8ClampedArrayFillOne030
     * @tc.desc Verify fill element at arr[0] equals 7 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(v, 0, 1);
      expect(arr[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_3100
     * @tc.name testUint8ClampedArrayFillOne031
     * @tc.desc Verify fill element at arr[2] equals 7 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(v, 0, 3);
      expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_3200
     * @tc.name testUint8ClampedArrayFillOne032
     * @tc.desc Verify fill element at arr[2] equals 7 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(v, 0, 4);
      expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_3300
     * @tc.name testUint8ClampedArrayFillOne033
     * @tc.desc Verify fill element at arr[2] equals 0 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(v, 0, 2);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_3400
     * @tc.name testUint8ClampedArrayFillOne034
     * @tc.desc Verify fill element at arr[3] equals 0 for array [0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.fill(v, 0, -1);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_3500
     * @tc.name testUint8ClampedArrayFillOne035
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(v, 0, -4);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_3600
     * @tc.name testUint8ClampedArrayFillOne036
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v, 0, -10);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_3700
     * @tc.name testUint8ClampedArrayFillOne037
     * @tc.desc Verify fill element at arr[2] equals 7 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(v, 0, 2147483647);
      expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_3800
     * @tc.name testUint8ClampedArrayFillOne038
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v, 0, -2147483648);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_3900
     * @tc.name testUint8ClampedArrayFillOne039
     * @tc.desc Verify fill element at arr[1] equals 7 for array [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0]);
      arr.fill(v, 0, 0x7FFFFFFF);
      expect(arr[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_4000
     * @tc.name testUint8ClampedArrayFillOne040
     * @tc.desc Verify fill element at arr[1] equals 7 for array [0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.fill(v, 0, -2);
      expect(arr[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_4100
     * @tc.name testUint8ClampedArrayFillOne041
     * @tc.desc Verify fill element at arr[1] equals 7 for array [0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.fill(v, 0, 2);
      expect(arr[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_4200
     * @tc.name testUint8ClampedArrayFillOne042
     * @tc.desc Verify fill element at arr[1] equals 9 for array [0, 0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([0, 0, 0, 0, 0]);
      arr.fill(v, 1, 3);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_4300
     * @tc.name testUint8ClampedArrayFillOne043
     * @tc.desc Verify fill element at arr[3] equals 9 for array [0, 0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([0, 0, 0, 0, 0]);
      arr.fill(v, -3, -1);
      expect(arr[3]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_4400
     * @tc.name testUint8ClampedArrayFillOne044
     * @tc.desc Verify fill element at arr[2] equals 9 for array [0, 0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([0, 0, 0, 0, 0]);
      arr.fill(v, -3, 4);
      expect(arr[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_4500
     * @tc.name testUint8ClampedArrayFillOne045
     * @tc.desc Verify fill element at arr[0] equals 9 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(v, 0, 3);
      expect(arr[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_4600
     * @tc.name testUint8ClampedArrayFillOne046
     * @tc.desc Verify fill element at arr[2] equals 9 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(v, 2, 3);
      expect(arr[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_4700
     * @tc.name testUint8ClampedArrayFillOne047
     * @tc.desc Verify fill element at arr[1] equals 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(v, 3, 1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_4800
     * @tc.name testUint8ClampedArrayFillOne048
     * @tc.desc Verify fill element at arr[2] equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v, 2, 2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_4900
     * @tc.name testUint8ClampedArrayFillOne049
     * @tc.desc Verify fill element at arr[2] equals 3 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(v, -1, -3);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_5000
     * @tc.name testUint8ClampedArrayFillOne050
     * @tc.desc Verify fill element at arr[0] equals 9 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(v, -100, 100);
      expect(arr[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_5100
     * @tc.name testUint8ClampedArrayFillOne051
     * @tc.desc Verify fill element at arr[1] equals 0 for array [50, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -100;
      const arr = new Uint8ClampedArray([50, 50]);
      arr.fill(v);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_5200
     * @tc.name testUint8ClampedArrayFillOne052
     * @tc.desc Verify fill element at arr[0] equals 126 for array [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 126;
      const arr = new Uint8ClampedArray([0, 0]);
      arr.fill(v);
      expect(arr[0]).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_5300
     * @tc.name testUint8ClampedArrayFillOne053
     * @tc.desc Verify fill element at arr[1] equals 1 for array [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      const arr = new Uint8ClampedArray([0, 0]);
      arr.fill(v);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_5400
     * @tc.name testUint8ClampedArrayFillOne054
     * @tc.desc Verify fill element at arr[2] equals 0 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 0;
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.fill(v);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_5500
     * @tc.name testUint8ClampedArrayFillOne055
     * @tc.desc Verify fill with byte=-5 clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -5;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_5600
     * @tc.name testUint8ClampedArrayFillOne056
     * @tc.desc Verify fill element at arr[0] equals 0 for array [100, 100, 100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -50;
      const arr = new Uint8ClampedArray([100, 100, 100]);
      arr.fill(v, 0, 2);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_5700
     * @tc.name testUint8ClampedArrayFillOne057
     * @tc.desc Verify fill element at arr[1] equals 0 for array [99, 99, 99, 99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -1;
      const arr = new Uint8ClampedArray([99, 99, 99, 99]);
      arr.fill(v, 1, 3);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_5800
     * @tc.name testUint8ClampedArrayFillOne058
     * @tc.desc Verify fill yields length 0 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray(0);
      arr.fill(v);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_5900
     * @tc.name testUint8ClampedArrayFillOne059
     * @tc.desc Verify fill yields length 0 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray(0);
      arr.fill(v, 0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_6000
     * @tc.name testUint8ClampedArrayFillOne060
     * @tc.desc Verify fill r equals arr for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray(0);
      const r = arr.fill(v);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_6100
     * @tc.name testUint8ClampedArrayFillOne061
     * @tc.desc Verify fill element at arr[0] equals 9 for array [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([0]);
      arr.fill(v);
      expect(arr[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_6200
     * @tc.name testUint8ClampedArrayFillOne062
     * @tc.desc Verify fill element at arr[0] equals 5 for array [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 5;
      const arr = new Uint8ClampedArray([0]);
      arr.fill(v, 0, 1);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_6300
     * @tc.name testUint8ClampedArrayFillOne063
     * @tc.desc Verify fill starting at length leaves the single element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 5;
      const arr = new Uint8ClampedArray([3]);
      arr.fill(v, 1);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_6400
     * @tc.name testUint8ClampedArrayFillOne064
     * @tc.desc Verify fill element at arr[1] equals 9 for array [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([0, 0]);
      arr.fill(v);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_6500
     * @tc.name testUint8ClampedArrayFillOne065
     * @tc.desc Verify fill element at arr[1] equals 2 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v, 1, 1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_6600
     * @tc.name testUint8ClampedArrayFillOne066
     * @tc.desc Verify fill element at arr[2] equals 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v, 2, 0);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_6700
     * @tc.name testUint8ClampedArrayFillOne067
     * @tc.desc Verify start=length end=length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v, 3, 3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_6800
     * @tc.name testUint8ClampedArrayFillOne068
     * @tc.desc Verify fill yields length 3 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v, 3, 1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_6900
     * @tc.name testUint8ClampedArrayFillOne069
     * @tc.desc Verify fill r equals arr for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.fill(v, 3, 1);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_7000
     * @tc.name testUint8ClampedArrayFillOne070
     * @tc.desc Verify fill element at arr[0] equals 10 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.fill(v, 2, 2);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_7100
     * @tc.name testUint8ClampedArrayFillOne071
     * @tc.desc Verify fill r equals arr for array [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 5;
      const arr = new Uint8ClampedArray([0, 0]);
      const r = arr.fill(v);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_7200
     * @tc.name testUint8ClampedArrayFillOne072
     * @tc.desc Verify fill yields length 3 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 5;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const r = arr.fill(v);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_7300
     * @tc.name testUint8ClampedArrayFillOne073
     * @tc.desc Verify fill buffer reference matches for array [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 5;
      const arr = new Uint8ClampedArray([0, 0]);
      const r = arr.fill(v);
      expect(r.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_7400
     * @tc.name testUint8ClampedArrayFillOne074
     * @tc.desc Verify fill yields byteLength 3 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 5;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const r = arr.fill(v);
      expect(r.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_7500
     * @tc.name testUint8ClampedArrayFillOne075
     * @tc.desc Verify fill element at arr[0] equals 9 for array [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstValue: byte = 5;
      const secondValue: byte = 9;
      const arr = new Uint8ClampedArray([0, 0]);
      arr.fill(firstValue).fill(secondValue);
      expect(arr[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_7600
     * @tc.name testUint8ClampedArrayFillOne076
     * @tc.desc Verify fill returns the receiver and mutates every selected element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 5;
      const arr = new Uint8ClampedArray([0, 0]);
      const r = arr.fill(v);
      expect(r).assertEqual(arr);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_7700
     * @tc.name testUint8ClampedArrayFillOne077
     * @tc.desc Verify fill yields byteOffset 1 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 5;
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 1, 2);
      const r = arr.fill(v);
      expect(r.byteOffset).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_7800
     * @tc.name testUint8ClampedArrayFillOne078
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v, 999);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_7900
     * @tc.name testUint8ClampedArrayFillOne079
     * @tc.desc Verify fill element at arr[0] equals 7 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(v, -999);
      expect(arr[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_8000
     * @tc.name testUint8ClampedArrayFillOne080
     * @tc.desc Verify fill element at arr[2] equals 7 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(v, 0, 999);
      expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_8100
     * @tc.name testUint8ClampedArrayFillOne081
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(v, 0, -999);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_8200
     * @tc.name testUint8ClampedArrayFillOne082
     * @tc.desc Verify fill r equals arr for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2]);
      const r = arr.fill(v, 2147483647);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_8300
     * @tc.name testUint8ClampedArrayFillOne083
     * @tc.desc Verify fill r equals arr for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2]);
      const r = arr.fill(v, 0, -2147483648);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_8400
     * @tc.name testUint8ClampedArrayFillOne084
     * @tc.desc Verify fill() out-of-range start/end on length=0 array no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray(0);
      const r = arr.fill(v, -100, 100);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_8500
     * @tc.name testUint8ClampedArrayFillOne085
     * @tc.desc Verify fill element at arr[0] equals 1 for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([1, 2]);
      arr.fill(v, 2147483647, 2147483647);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_8600
     * @tc.name testUint8ClampedArrayFillOne086
     * @tc.desc Verify fill() start=2 leaves index 0 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(v, 2);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_8700
     * @tc.name testUint8ClampedArrayFillOne087
     * @tc.desc Verify fill() end=2 leaves index 3 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(v, 0, 2);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_8800
     * @tc.name testUint8ClampedArrayFillOne088
     * @tc.desc Verify fill() start=1 leaves index 0 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.fill(v, 1, 4);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_8900
     * @tc.name testUint8ClampedArrayFillOne089
     * @tc.desc Verify fill() start=1 end=4 sets index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      arr.fill(v, 1, 4);
      expect(arr[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_9000
     * @tc.name testUint8ClampedArrayFillOne090
     * @tc.desc Verify fill element at arr[0] equals 8 for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstValue: byte = 3;
      const secondValue: byte = 8;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(firstValue);
      arr.fill(secondValue);
      expect(arr[0]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_9100
     * @tc.name testUint8ClampedArrayFillOne091
     * @tc.desc Verify fill element at arr[1] equals 2 for array [0, 0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstValue: byte = 1;
      const secondValue: byte = 2;
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.fill(firstValue);
      arr.fill(secondValue, 1, 3);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_9200
     * @tc.name testUint8ClampedArrayFillOne092
     * @tc.desc Verify fill arr.$_get(0) equals 7 for array [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0]);
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_9300
     * @tc.name testUint8ClampedArrayFillOne093
     * @tc.desc Verify fill element at view[0] equals 7 for array [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray([0, 0]);
      arr.fill(v);
      const view = new Uint8ClampedArray(arr.buffer);
      expect(view[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_9400
     * @tc.name testUint8ClampedArrayFillOne094
     * @tc.desc Verify fill element at arr[0] equals 10 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.fill(v, 1, 2);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_9500
     * @tc.name testUint8ClampedArrayFillOne095
     * @tc.desc Verify fill yields length before for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 9;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const before = arr.length;
      arr.fill(v);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_9600
     * @tc.name testUint8ClampedArrayFillOne096
     * @tc.desc Verify fill() length=256 last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 100;
      const arr = new Uint8ClampedArray(256);
      arr.fill(v);
      expect(arr[255]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_9700
     * @tc.name testUint8ClampedArrayFillOne097
     * @tc.desc Verify fill() length=1024 first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 50;
      const arr = new Uint8ClampedArray(1024);
      arr.fill(v);
      expect(arr[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_9800
     * @tc.name testUint8ClampedArrayFillOne098
     * @tc.desc Verify fill() length=1024 last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 50;
      const arr = new Uint8ClampedArray(1024);
      arr.fill(v);
      expect(arr[1023]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FILL_ONE_9900
     * @tc.name testUint8ClampedArrayFillOne099
     * @tc.desc Verify fill() length=10 start=3 end=7 sets index 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFillOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 7;
      const arr = new Uint8ClampedArray(10);
      arr.fill(v, 3, 7);
      expect(arr[5]).assertEqual(7);
    });
  });
}
