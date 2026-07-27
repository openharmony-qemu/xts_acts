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

export default function uint8ClampedArrayFindIndexTest(): void {
  describe('Uint8ClampedArrayFindIndexTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_0100
     * @tc.name testUint8ClampedArrayFindIndex001
     * @tc.desc Verify findIndex idx equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_0200
     * @tc.name testUint8ClampedArrayFindIndex002
     * @tc.desc Verify predicate value 10 returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 10);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_0300
     * @tc.name testUint8ClampedArrayFindIndex003
     * @tc.desc Verify findIndex idx equals 0 for array [5, 6, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => true);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_0400
     * @tc.name testUint8ClampedArrayFindIndex004
     * @tc.desc Verify findIndex idx equals -1 for array [5, 6, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => false);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_0500
     * @tc.name testUint8ClampedArrayFindIndex005
     * @tc.desc Verify findIndex idx equals 2 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => i === 2);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_0600
     * @tc.name testUint8ClampedArrayFindIndex006
     * @tc.desc Verify findIndex received equals arr for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let received: Uint8ClampedArray | null = null;
      arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => { received = a; return false; });
      expect(received).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_0700
     * @tc.name testUint8ClampedArrayFindIndex007
     * @tc.desc Verify predicate sums values 6 and indices 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let valSum: number = 0;
      let idxSum: int = 0;
      arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => { valSum += v; idxSum += i; return false; });
      expect(valSum).assertEqual(6);
      expect(idxSum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_0800
     * @tc.name testUint8ClampedArrayFindIndex008
     * @tc.desc Verify findIndex idx equals 2 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => { callCount++; return v === 3; });
      expect(idx).assertEqual(2);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_0900
     * @tc.name testUint8ClampedArrayFindIndex009
     * @tc.desc Verify findIndex idx equals -1 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let callCount: int = 0;
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => { callCount++; return false; });
      expect(idx).assertEqual(-1);
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_1000
     * @tc.name testUint8ClampedArrayFindIndex010
     * @tc.desc Verify findIndex idx equals 1 for array [5, 0, 10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 0, 10]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_1100
     * @tc.name testUint8ClampedArrayFindIndex011
     * @tc.desc Verify findIndex idx equals 1 for array [0, 255, 128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255, 128]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_1200
     * @tc.name testUint8ClampedArrayFindIndex012
     * @tc.desc Verify findIndex idx equals 1 for array [0, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 1);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_1300
     * @tc.name testUint8ClampedArrayFindIndex013
     * @tc.desc Verify findIndex idx equals 1 for array [0, 127, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 127, 200]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 127);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_1400
     * @tc.name testUint8ClampedArrayFindIndex014
     * @tc.desc Verify findIndex idx equals 1 for array [0, 128, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 128, 200]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 128);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_1500
     * @tc.name testUint8ClampedArrayFindIndex015
     * @tc.desc Verify predicate v > 50 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 5, 100, 200]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v > 50);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_1600
     * @tc.name testUint8ClampedArrayFindIndex016
     * @tc.desc Verify predicate v < 50 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([200, 100, 5, 1]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v < 50);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_1700
     * @tc.name testUint8ClampedArrayFindIndex017
     * @tc.desc Verify predicate v >= 50 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 49, 50, 51]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v >= 50);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_1800
     * @tc.name testUint8ClampedArrayFindIndex018
     * @tc.desc Verify predicate v <= 50 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 80, 50, 40]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v <= 50);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_1900
     * @tc.name testUint8ClampedArrayFindIndex019
     * @tc.desc Verify predicate v !== 5 returns index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5, 5, 10]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v !== 5);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_2000
     * @tc.name testUint8ClampedArrayFindIndex020
     * @tc.desc Verify predicate v % 2 === 0 returns index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 3, 5, 8, 9]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v % 2 === 0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_2100
     * @tc.name testUint8ClampedArrayFindIndex021
     * @tc.desc Verify predicate v % 2 === 1 returns index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 4, 6, 7, 8]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v % 2 === 1);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_2200
     * @tc.name testUint8ClampedArrayFindIndex022
     * @tc.desc Verify findIndex idx equals 0 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => i === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_2300
     * @tc.name testUint8ClampedArrayFindIndex023
     * @tc.desc Verify findIndex idx equals 1 for array [10, 20, 30, 40, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => i % 2 === 1);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_2400
     * @tc.name testUint8ClampedArrayFindIndex024
     * @tc.desc Verify predicate value index v === i
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 1, 2, 9, 4]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === i);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_2500
     * @tc.name testUint8ClampedArrayFindIndex025
     * @tc.desc Verify findIndex idx equals 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => i > 0 && a[i - 1] === 2);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_2600
     * @tc.name testUint8ClampedArrayFindIndex026
     * @tc.desc Verify predicate does not mutate array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_2700
     * @tc.name testUint8ClampedArrayFindIndex027
     * @tc.desc Verify predicate false does not change array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => false);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_2800
     * @tc.name testUint8ClampedArrayFindIndex028
     * @tc.desc Verify predicate v === 3 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_2900
     * @tc.name testUint8ClampedArrayFindIndex029
     * @tc.desc Verify predicate v === 5 returns index 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 5);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_3000
     * @tc.name testUint8ClampedArrayFindIndex030
     * @tc.desc Verify predicate v === 7 returns first index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7, 7]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 7);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_3100
     * @tc.name testUint8ClampedArrayFindIndex031
     * @tc.desc Verify predicate v === 5 returns first match index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 5, 2, 5]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 5);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_3200
     * @tc.name testUint8ClampedArrayFindIndex032
     * @tc.desc Verify predicate (v & 4) !== 0 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 4, 8, 16]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => (v & 4) !== 0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_3300
     * @tc.name testUint8ClampedArrayFindIndex033
     * @tc.desc Verify findIndex idx equals 1 for array [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v > 15 && v < 35);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_3400
     * @tc.name testUint8ClampedArrayFindIndex034
     * @tc.desc Verify findIndex idx equals 3 for array [1, 2, 3, 100, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 100, 200]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 100 || v === 200);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_3500
     * @tc.name testUint8ClampedArrayFindIndex035
     * @tc.desc Verify predicate named function returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const fn = (v: number, i: int, a: Uint8ClampedArray): boolean => v === 2;
      const idx: int = arr.findIndex(fn);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_3600
     * @tc.name testUint8ClampedArrayFindIndex036
     * @tc.desc Verify predicate v === target 15 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15, 20]);
      const target: number = 15;
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === target);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_3700
     * @tc.name testUint8ClampedArrayFindIndex037
     * @tc.desc Verify predicate index array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => i === a.length - 1);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_3800
     * @tc.name testUint8ClampedArrayFindIndex038
     * @tc.desc Verify findIndex idx equals 1 for array [10, 256, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 256, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_3900
     * @tc.name testUint8ClampedArrayFindIndex039
     * @tc.desc Verify findIndex idx equals 1 for array [10, -1, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, -1, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_4000
     * @tc.name testUint8ClampedArrayFindIndex040
     * @tc.desc Verify findIndex idx equals 1 for array [10, Number.NaN, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, Number.NaN, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_4100
     * @tc.name testUint8ClampedArrayFindIndex041
     * @tc.desc Verify findIndex idx equals 1 for array [10, Number.POSITIVE_INFINITY,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, Number.POSITIVE_INFINITY, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_4200
     * @tc.name testUint8ClampedArrayFindIndex042
     * @tc.desc Verify findIndex idx equals 1 for array [10, -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, -Number.POSITIVE_INFINITY, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_4300
     * @tc.name testUint8ClampedArrayFindIndex043
     * @tc.desc Verify findIndex idx equals 1 for array [10, 127.5, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 127.5, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 128);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_4400
     * @tc.name testUint8ClampedArrayFindIndex044
     * @tc.desc Verify findIndex idx equals 1 for array [10, 128.5, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 128.5, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 128);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_4500
     * @tc.name testUint8ClampedArrayFindIndex045
     * @tc.desc Verify findIndex idx equals 1 for array [10, 0.4, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 0.4, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_4600
     * @tc.name testUint8ClampedArrayFindIndex046
     * @tc.desc Verify findIndex idx equals 1 for array [10, 0.9, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 0.9, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 1);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_4700
     * @tc.name testUint8ClampedArrayFindIndex047
     * @tc.desc Verify findIndex idx equals 1 for array [10, 0.5, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 0.5, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_4800
     * @tc.name testUint8ClampedArrayFindIndex048
     * @tc.desc Verify findIndex idx equals 1 for array [10, 1e9, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 1e9, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_4900
     * @tc.name testUint8ClampedArrayFindIndex049
     * @tc.desc Verify findIndex idx equals 1 for array [10, -1e9, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, -1e9, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_5000
     * @tc.name testUint8ClampedArrayFindIndex050
     * @tc.desc Verify findIndex idx equals 1 for array [0x10, 0xFF, 0x80]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0x10, 0xFF, 0x80]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 0xFF);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_5100
     * @tc.name testUint8ClampedArrayFindIndex051
     * @tc.desc Verify findIndex idx equals 1 for array [0o10, 0o20, 0o30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o10, 0o20, 0o30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 0o20);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_5200
     * @tc.name testUint8ClampedArrayFindIndex052
     * @tc.desc Verify findIndex idx equals 2 for array [0b0001, 0b0010, 0b0100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b0001, 0b0010, 0b0100]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 0b0100);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_5300
     * @tc.name testUint8ClampedArrayFindIndex053
     * @tc.desc Verify findIndex idx equals 1 for array [1, 1e2, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 1e2, 200]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 100);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_5400
     * @tc.name testUint8ClampedArrayFindIndex054
     * @tc.desc Verify predicate v === 30 product 2*3*5 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2 * 3 * 5, 200]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 30);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_5500
     * @tc.name testUint8ClampedArrayFindIndex055
     * @tc.desc Verify findIndex idx equals -1 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let called: int = 0;
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => { called++; return true; });
      expect(idx).assertEqual(-1);
      expect(called).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_5600
     * @tc.name testUint8ClampedArrayFindIndex056
     * @tc.desc Verify predicate v === 42 returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 42);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_5700
     * @tc.name testUint8ClampedArrayFindIndex057
     * @tc.desc Verify predicate v === 43 no match returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 43);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_5800
     * @tc.name testUint8ClampedArrayFindIndex058
     * @tc.desc Verify predicate v === 20 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 20);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_5900
     * @tc.name testUint8ClampedArrayFindIndex059
     * @tc.desc Verify findIndex idx equals 128 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(256);
      const arr = new Uint8ClampedArray(buf);
      arr[128] = 77;
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 77);
      expect(idx).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_6000
     * @tc.name testUint8ClampedArrayFindIndex060
     * @tc.desc Verify findIndex idx equals 0 for length-10 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_6100
     * @tc.name testUint8ClampedArrayFindIndex061
     * @tc.desc Verify findIndex idx equals 0 for array [255, 255, 255, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255, 255]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 255);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_6200
     * @tc.name testUint8ClampedArrayFindIndex062
     * @tc.desc Verify findIndex idx equals -1 for length-10 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 1);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_6300
     * @tc.name testUint8ClampedArrayFindIndex063
     * @tc.desc Verify findIndex idx equals 2 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      arr[2] = 50;
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 50);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_6400
     * @tc.name testUint8ClampedArrayFindIndex064
     * @tc.desc Verify findIndex idx equals 1 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const full = new Uint8ClampedArray(buf);
      full[5] = 99;
      const view = new Uint8ClampedArray(buf, 4, 4);
      const idx: int = view.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 99);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_6500
     * @tc.name testUint8ClampedArrayFindIndex065
     * @tc.desc Verify subarray idx equals 1 for array [10, 20, 30, 40, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(1, 4);
      const idx: int = sub.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 30);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_6600
     * @tc.name testUint8ClampedArrayFindIndex066
     * @tc.desc Verify predicate findIndex findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const i1: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      const sub = arr.subarray(i1);
      const i2: int = sub.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 4);
      expect(i2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_6700
     * @tc.name testUint8ClampedArrayFindIndex067
     * @tc.desc Verify findIndex idx equals 3 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 4);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_6800
     * @tc.name testUint8ClampedArrayFindIndex068
     * @tc.desc Verify findIndex buffer reference matches for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const before = arr.buffer;
      arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_6900
     * @tc.name testUint8ClampedArrayFindIndex069
     * @tc.desc Verify predicate two arrays returns indices 1 and 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8ClampedArray([1, 2]);
      const arr2 = new Uint8ClampedArray([3, 4]);
      const i1: int = arr1.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 2);
      const i2: int = arr2.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 3);
      expect(i1).assertEqual(1);
      expect(i2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_7000
     * @tc.name testUint8ClampedArrayFindIndex070
     * @tc.desc Verify predicate same call twice returns equal indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15]);
      const i1: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 10);
      const i2: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 10);
      expect(i1).assertEqual(1);
      expect(i2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_7100
     * @tc.name testUint8ClampedArrayFindIndex071
     * @tc.desc Verify findIndex propagates Error thrown by the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => { throw new Error('boom'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_7200
     * @tc.name testUint8ClampedArrayFindIndex072
     * @tc.desc Verify findIndex propagates TypeError thrown by the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => { throw new TypeError('type'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_7300
     * @tc.name testUint8ClampedArrayFindIndex073
     * @tc.desc Verify findIndex propagates RangeError thrown by the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => { throw new RangeError('range'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_7400
     * @tc.name testUint8ClampedArrayFindIndex074
     * @tc.desc Verify predicate throws Error on first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let callCount: int = 0;
      try {
        arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => { callCount++; throw new Error('first'); });
        expect().assertFail();
      } catch (e) { expect(e.name).assertEqual('Error'); }
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_7500
     * @tc.name testUint8ClampedArrayFindIndex075
     * @tc.desc Verify predicate throws Error at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let callCount: int = 0;
      try {
        arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => {
          callCount++;
          if (i === 2) throw new Error('mid');
          return false;
        });
        expect().assertFail();
      } catch (e) { expect(e.name).assertEqual('Error'); }
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_7600
     * @tc.name testUint8ClampedArrayFindIndex076
     * @tc.desc Verify predicate throws Error at last index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => {
          if (i === 2) throw new Error('last');
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_7700
     * @tc.name testUint8ClampedArrayFindIndex077
     * @tc.desc Verify findIndex propagates Error thrown during predicate evaluation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => { throw new Error('x'); });
        expect().assertFail();
      } catch (e) { expect(e.name).assertEqual('Error'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_7800
     * @tc.name testUint8ClampedArrayFindIndex078
     * @tc.desc Verify findIndex idx equals 3 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v + a[0] === 5);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_7900
     * @tc.name testUint8ClampedArrayFindIndex079
     * @tc.desc Verify findIndex returns index 1 for the second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Uint8ClampedArray([1, 2, 3]);
      const a2 = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = a1.findIndex((v: number, i: int, a: Uint8ClampedArray) => {
        const inner: int = a2.findIndex((vv: number, ii: int, aa: Uint8ClampedArray) => vv === v * 10);
        return inner === 1;
      });
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_8000
     * @tc.name testUint8ClampedArrayFindIndex080
     * @tc.desc Verify findIndex idx equals 2 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => a.length === 5 && v === 3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_8100
     * @tc.name testUint8ClampedArrayFindIndex081
     * @tc.desc Verify findIndex behavior for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const arr = new Uint8ClampedArray(buf);
      arr[1] = 10;
      let bufMatched: boolean = false;
      arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => {
        if (a.buffer === buf) bufMatched = true;
        return false;
      });
      expect(bufMatched).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_8200
     * @tc.name testUint8ClampedArrayFindIndex082
     * @tc.desc Verify predicate v === 1 and v === 3 return indices 0 and 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const i1: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 1);
      const i2: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 3);
      expect(i1).assertEqual(0);
      expect(i2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_8300
     * @tc.name testUint8ClampedArrayFindIndex083
     * @tc.desc Verify Uint8ClampedArray.of idx equals 1 for of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 20);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_8400
     * @tc.name testUint8ClampedArrayFindIndex084
     * @tc.desc Verify Uint8ClampedArray.from idx equals 1 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [5.0, 10.0, 15.0];
      const arr = Uint8ClampedArray.from(src);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v === 10);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_8500
     * @tc.name testUint8ClampedArrayFindIndex085
     * @tc.desc Verify findIndex idx equals -1 for array [100, 200, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200, 255]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v > 255);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_8600
     * @tc.name testUint8ClampedArrayFindIndex086
     * @tc.desc Verify findIndex idx equals -1 for array [0, 50, 100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 50, 100]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v < 0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_8700
     * @tc.name testUint8ClampedArrayFindIndex087
     * @tc.desc Verify findIndex idx equals 3 for array [0, 0, 0, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 5]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v > 0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_8800
     * @tc.name testUint8ClampedArrayFindIndex088
     * @tc.desc Verify findIndex idx equals 1 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => i > 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_8900
     * @tc.name testUint8ClampedArrayFindIndex089
     * @tc.desc Verify predicate visits values 10 20 30 in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const seen: number[] = [];
      arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => { seen.push(v); return false; });
      expect(seen[0]).assertEqual(10);
      expect(seen[1]).assertEqual(20);
      expect(seen[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_9000
     * @tc.name testUint8ClampedArrayFindIndex090
     * @tc.desc Verify subarray iteration count equals 3 for array [10, 20, 30, 40, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(1, 4);
      let count: int = 0;
      sub.findIndex((v: number, i: int, a: Uint8ClampedArray) => { count++; return false; });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_9100
     * @tc.name testUint8ClampedArrayFindIndex091
     * @tc.desc Verify findIndex idx equals 1 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => v > 15 && a.length === 3);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_INDEX_9200
     * @tc.name testUint8ClampedArrayFindIndex092
     * @tc.desc Verify findIndex callback parameters confirm a[i] equals v for array [7, 8, 9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindIndex092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      let match: boolean = true;
      let calls: int = 0;
      arr.findIndex((v: number, i: int, a: Uint8ClampedArray) => { if (a[i] !== v) match = false; calls++; return false; });
      expect(match).assertTrue();
      expect(calls).assertEqual(3);
    });
  });
}
