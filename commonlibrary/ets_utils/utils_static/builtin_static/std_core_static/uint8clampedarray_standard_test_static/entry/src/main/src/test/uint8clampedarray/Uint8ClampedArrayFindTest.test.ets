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

export default function uint8ClampedArrayFindTest(): void {
  describe('Uint8ClampedArrayFindTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_0100
     * @tc.name testUint8ClampedArrayFind001
     * @tc.desc Verify find r equals 3 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 3);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_0200
     * @tc.name testUint8ClampedArrayFind002
     * @tc.desc Verify find r equals 10 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => true);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_0300
     * @tc.name testUint8ClampedArrayFind003
     * @tc.desc Verify find r equals undefined for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => false);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_0400
     * @tc.name testUint8ClampedArrayFind004
     * @tc.desc Verify find r equals 15 for array [5, 10, 15, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15, 20]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v > 12);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_0500
     * @tc.name testUint8ClampedArrayFind005
     * @tc.desc Verify find r equals 7 for array [2, 4, 7, 8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 4, 7, 8]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v % 2 === 1);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_0600
     * @tc.name testUint8ClampedArrayFind006
     * @tc.desc Verify find r equals 102 for array [100, 101, 102, 103]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 101, 102, 103]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => i === 2);
      expect(r).assertEqual(102);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_0700
     * @tc.name testUint8ClampedArrayFind007
     * @tc.desc Verify find r equals 20 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => a.length === 3 && v === 20);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_0800
     * @tc.name testUint8ClampedArrayFind008
     * @tc.desc Verify find r equals 4 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => i > 0 && a[i - 1] === 3);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_0900
     * @tc.name testUint8ClampedArrayFind009
     * @tc.desc Verify predicate truthy/falsy boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v > 1 ? true : false);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_1000
     * @tc.name testUint8ClampedArrayFind010
     * @tc.desc Verify find r equals 4 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let calls: int = 0;
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => { calls = calls + 1; return v === 4; });
      expect(r).assertEqual(4);
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_1100
     * @tc.name testUint8ClampedArrayFind011
     * @tc.desc Verify find r equals 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let calls: int = 0;
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => { calls = calls + 1; return v === 2; });
      expect(r).assertEqual(2);
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_1200
     * @tc.name testUint8ClampedArrayFind012
     * @tc.desc Verify find r equals 10 for array [5, 10, 15, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15, 20]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v > 5 && v < 20);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_1300
     * @tc.name testUint8ClampedArrayFind013
     * @tc.desc Verify find r equals 15 for array [5, 10, 15, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15, 20]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 0 || v === 15);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_1400
     * @tc.name testUint8ClampedArrayFind014
     * @tc.desc Verify find returns the first even value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => {
        const sub = new Uint8ClampedArray([v, v + 1]);
        return sub.find((x: number, j: int, b: Uint8ClampedArray) => x === 3) === 3;
      });
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_1500
     * @tc.name testUint8ClampedArrayFind015
     * @tc.desc Verify find r equals 0 for array [0, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_1600
     * @tc.name testUint8ClampedArrayFind016
     * @tc.desc Verify find r equals 255 for array [1, 256, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 256, 3]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_1700
     * @tc.name testUint8ClampedArrayFind017
     * @tc.desc Verify find r equals 0 for array [-1, 5, 10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1, 5, 10]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_1800
     * @tc.name testUint8ClampedArrayFind018
     * @tc.desc Verify find r equals 0 for array [Number.NaN, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN, 1, 2]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_1900
     * @tc.name testUint8ClampedArrayFind019
     * @tc.desc Verify find r equals 255 for array [Number.POSITIVE_INFINITY, 1, 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY, 1, 2]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_2000
     * @tc.name testUint8ClampedArrayFind020
     * @tc.desc Verify find r equals 0 for array [-Number.POSITIVE_INFINITY, 1,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-Number.POSITIVE_INFINITY, 1, 2]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_2100
     * @tc.name testUint8ClampedArrayFind021
     * @tc.desc Verify find r equals 128 for array [127.5, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5, 0, 0]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 128);
      expect(r).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_2200
     * @tc.name testUint8ClampedArrayFind022
     * @tc.desc Verify find r equals 128 for array [128.5, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128.5, 0, 0]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 128);
      expect(r).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_2300
     * @tc.name testUint8ClampedArrayFind023
     * @tc.desc Verify find r equals 0 for array [0.5, 10, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5, 10, 20]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_2400
     * @tc.name testUint8ClampedArrayFind024
     * @tc.desc Verify find r equals 1 for array [0.9, 10, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.9, 10, 20]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_2500
     * @tc.name testUint8ClampedArrayFind025
     * @tc.desc Verify find r equals 0 for array [0.4, 10, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.4, 10, 20]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_2600
     * @tc.name testUint8ClampedArrayFind026
     * @tc.desc Verify find r equals 32 for array [0x10, 0x20, 0x30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0x10, 0x20, 0x30]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 0x20);
      expect(r).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_2700
     * @tc.name testUint8ClampedArrayFind027
     * @tc.desc Verify find r equals 16 for array [0o10, 0o20, 0o30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o10, 0o20, 0o30]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 16);
      expect(r).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_2800
     * @tc.name testUint8ClampedArrayFind028
     * @tc.desc Verify find r equals 12 for array [0b1010, 0b1100, 0b1110]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b1010, 0b1100, 0b1110]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 12);
      expect(r).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_2900
     * @tc.name testUint8ClampedArrayFind029
     * @tc.desc Verify find r equals 255 for array [Number.MAX_VALUE, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.MAX_VALUE, 0, 0]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_3000
     * @tc.name testUint8ClampedArrayFind030
     * @tc.desc Verify find r equals 0 for array [Number.MIN_VALUE, 10, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.MIN_VALUE, 10, 20]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_3100
     * @tc.name testUint8ClampedArrayFind031
     * @tc.desc Verify find r equals 255 for array [2147483648, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2147483648, 0, 0]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_3200
     * @tc.name testUint8ClampedArrayFind032
     * @tc.desc Verify find returns 2 when searching for exact value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_3300
     * @tc.name testUint8ClampedArrayFind033
     * @tc.desc Verify find returns undefined for array [1, 2, 3] with no matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 200);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_3400
     * @tc.name testUint8ClampedArrayFind034
     * @tc.desc Verify find first matching value 5 in array with duplicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 5, 5, 5, 9]);
      let hitIndex: int = -1;
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => {
        if (v === 5) {
          hitIndex = i;
          return true;
        }
        return false;
      });
      expect(r).assertEqual(5);
      expect(hitIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_3500
     * @tc.name testUint8ClampedArrayFind035
     * @tc.desc Verify find yields length 4 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 3);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_3600
     * @tc.name testUint8ClampedArrayFind036
     * @tc.desc Verify find does not mutate arr[0] for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_3700
     * @tc.name testUint8ClampedArrayFind037
     * @tc.desc Verify find buffer reference matches for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const buf = arr.buffer;
      arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_3800
     * @tc.name testUint8ClampedArrayFind038
     * @tc.desc Verify find r equals undefined for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => true);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_3900
     * @tc.name testUint8ClampedArrayFind039
     * @tc.desc Verify find calls equals 0 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      let calls: int = 0;
      arr.find((v: number, i: int, a: Uint8ClampedArray) => { calls = calls + 1; return true; });
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_4000
     * @tc.name testUint8ClampedArrayFind040
     * @tc.desc Verify find value 33 at index 65534 in 65535-length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(65535);
      const arr = new Uint8ClampedArray(buf);
      arr[65534] = 33;
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 33);
      expect(r).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_4100
     * @tc.name testUint8ClampedArrayFind041
     * @tc.desc Verify Uint8ClampedArray.of r equals 30 for of(10, 20, 30, 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30, 40);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 30);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_4200
     * @tc.name testUint8ClampedArrayFind042
     * @tc.desc Verify Uint8ClampedArray.from r equals 2 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const arr = Uint8ClampedArray.from(src);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_4300
     * @tc.name testUint8ClampedArrayFind043
     * @tc.desc Verify find r equals 66 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      arr[1] = 66;
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 66);
      expect(r).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_4400
     * @tc.name testUint8ClampedArrayFind044
     * @tc.desc Verify subarray r equals 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      const r = sub.find((v: number, i: int, a: Uint8ClampedArray) => v === 3);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_4500
     * @tc.name testUint8ClampedArrayFind045
     * @tc.desc Verify subarray r equals undefined for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 3);
      const r = sub.find((v: number, i: int, a: Uint8ClampedArray) => v === 5);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_4600
     * @tc.name testUint8ClampedArrayFind046
     * @tc.desc Verify find propagates Error thrown by the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.find((v: number, i: int, a: Uint8ClampedArray) => { throw new Error('boom'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_4700
     * @tc.name testUint8ClampedArrayFind047
     * @tc.desc Verify find propagates RangeError thrown by the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.find((v: number, i: int, a: Uint8ClampedArray) => { throw new RangeError('range'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_4800
     * @tc.name testUint8ClampedArrayFind048
     * @tc.desc Verify find propagates TypeError thrown by the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.find((v: number, i: int, a: Uint8ClampedArray) => { throw new TypeError('type'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_4900
     * @tc.name testUint8ClampedArrayFind049
     * @tc.desc Verify find propagates Error thrown during the first predicate call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.find((v: number, i: int, a: Uint8ClampedArray) => {
          if (i === 0) throw new Error('idx0');
          return v === 2;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_5000
     * @tc.name testUint8ClampedArrayFind050
     * @tc.desc Verify find propagates Error thrown during the second predicate call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      try {
        arr.find((v: number, i: int, a: Uint8ClampedArray) => {
          if (i === 1) throw new Error('idx1');
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_5100
     * @tc.name testUint8ClampedArrayFind051
     * @tc.desc Verify find propagates Error thrown after callback evaluation begins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let calls: int = 0;
      try {
        arr.find((v: number, i: int, a: Uint8ClampedArray) => {
          calls = calls + 1;
          if (i === 1) throw new Error('stop');
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(calls).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_5200
     * @tc.name testUint8ClampedArrayFind052
     * @tc.desc Verify find passes the searched array as the callback third argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let same: boolean = false;
      arr.find((v: number, i: int, a: Uint8ClampedArray) => {
        same = (a === arr);
        return false;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_5300
     * @tc.name testUint8ClampedArrayFind053
     * @tc.desc Verify find invokes the predicate in ascending index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const order: number[] = [];
      arr.find((v: number, i: int, a: Uint8ClampedArray) => {
        order.push(i );
        return false;
      });
      expect(order.length).assertEqual(4);
      expect(order[0]).assertEqual(0);
      expect(order[1]).assertEqual(1);
      expect(order[2]).assertEqual(2);
      expect(order[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_5400
     * @tc.name testUint8ClampedArrayFind054
     * @tc.desc Verify find supplies the original first value to the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([11, 22, 33]);
      let snap: number = -1;
      arr.find((v: number, i: int, a: Uint8ClampedArray) => {
        if (i === 0) snap = v;
        return false;
      });
      expect(snap).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_5500
     * @tc.name testUint8ClampedArrayFind055
     * @tc.desc Verify find supplies consistent value index and array callback arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15]);
      let consistent: boolean = true;
      arr.find((v: number, i: int, a: Uint8ClampedArray) => {
        if (a[i] !== v) consistent = false;
        return false;
      });
      expect(consistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_5600
     * @tc.name testUint8ClampedArrayFind056
     * @tc.desc Verify find r2 equals 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r1 = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 2) ?? 0;
      const arr2 = new Uint8ClampedArray([r1, 5, 6]);
      const r2 = arr2.find((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      expect(r2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_5700
     * @tc.name testUint8ClampedArrayFind057
     * @tc.desc Verify find r1 equals 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r1 = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      const r2 = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 4);
      expect(r1).assertEqual(2);
      expect(r2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_5800
     * @tc.name testUint8ClampedArrayFind058
     * @tc.desc Verify slice r equals 20 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30]);
      const s = parent.slice(0, 3);
      const r = s.find((v: number, i: int, a: Uint8ClampedArray) => v === 20);
      expect(r).assertEqual(20);
      expect(s.buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_5900
     * @tc.name testUint8ClampedArrayFind059
     * @tc.desc Verify reverse r equals 4 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.reverse();
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 4);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_6000
     * @tc.name testUint8ClampedArrayFind060
     * @tc.desc Verify with r equals undefined for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.with(1, 99);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => v === 99);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_6100
     * @tc.name testUint8ClampedArrayFind061
     * @tc.desc Verify find r equals 4 for array [2, 4, 6, 8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 4, 6, 8]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => (v * 2) === 8);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_6200
     * @tc.name testUint8ClampedArrayFind062
     * @tc.desc Verify find r equals 4 for array [1, 2, 4, 8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 4, 8]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => (v & 4) !== 0);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_6300
     * @tc.name testUint8ClampedArrayFind063
     * @tc.desc Verify find r equals 11 for array [10, 11, 12, 13]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFind063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 11, 12, 13]);
      const r = arr.find((v: number, i: int, a: Uint8ClampedArray) => i % 2 === 1);
      expect(r).assertEqual(11);
    });
  });
}
