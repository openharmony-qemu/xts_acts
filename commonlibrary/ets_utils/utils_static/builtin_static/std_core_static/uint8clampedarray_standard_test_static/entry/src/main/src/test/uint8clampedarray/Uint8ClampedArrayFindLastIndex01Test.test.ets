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

export default function uint8ClampedArrayFindLastIndex01Test(): void {
  describe('uint8ClampedArrayFindLastIndex01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_0100
     * @tc.name testUint8ClampedArrayFindLastIndexOne001
     * @tc.desc Verify findLastIndex idx equals 2 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const idx: int = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_0200
     * @tc.name testUint8ClampedArrayFindLastIndexOne002
     * @tc.desc Verify findLastIndex returns 2 for array [10, 20, 30] with predicate always true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => true);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_0300
     * @tc.name testUint8ClampedArrayFindLastIndexOne003
     * @tc.desc Verify findLastIndex idx equals -1 for array [5, 10, 15, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15, 20]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => false);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_0400
     * @tc.name testUint8ClampedArrayFindLastIndexOne004
     * @tc.desc Verify findLastIndex idx equals 1 for array [100, 255, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 255, 200]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 255);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_0500
     * @tc.name testUint8ClampedArrayFindLastIndexOne005
     * @tc.desc Verify findLastIndex idx equals 1 for array [126, 127, 128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([126, 127, 128]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 127);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_0600
     * @tc.name testUint8ClampedArrayFindLastIndexOne006
     * @tc.desc Verify findLastIndex idx equals 2 for array [126, 127, 128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([126, 127, 128]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 128);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_0700
     * @tc.name testUint8ClampedArrayFindLastIndexOne007
     * @tc.desc Verify findLastIndex idx equals 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => i === 2);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_0800
     * @tc.name testUint8ClampedArrayFindLastIndexOne008
     * @tc.desc Verify findLastIndex idx equals 0 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => i === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_0900
     * @tc.name testUint8ClampedArrayFindLastIndexOne009
     * @tc.desc Verify predicate index === length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => i === a.length - 1);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_1000
     * @tc.name testUint8ClampedArrayFindLastIndexOne010
     * @tc.desc Verify findLastIndex idx equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => a.length === 3 && v === 2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_1100
     * @tc.name testUint8ClampedArrayFindLastIndexOne011
     * @tc.desc Verify findLastIndex idx equals 0 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => a === arr && v === 1);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_1200
     * @tc.name testUint8ClampedArrayFindLastIndexOne012
     * @tc.desc Verify findLastIndex idx equals 2 for array [50, 150, 200, 80]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 150, 200, 80]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v > 100);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_1300
     * @tc.name testUint8ClampedArrayFindLastIndexOne013
     * @tc.desc Verify findLastIndex idx equals 2 for array [10, 60, 20, 70]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 60, 20, 70]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v < 50);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_1400
     * @tc.name testUint8ClampedArrayFindLastIndexOne014
     * @tc.desc Verify findLastIndex idx equals 3 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v % 2 === 0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_1500
     * @tc.name testUint8ClampedArrayFindLastIndexOne015
     * @tc.desc Verify findLastIndex idx equals 4 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v % 2 === 1);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_1600
     * @tc.name testUint8ClampedArrayFindLastIndexOne016
     * @tc.desc Verify findLastIndex idx equals 3 for array [100, 130, 50, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 130, 50, 200]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v >= 128);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_1700
     * @tc.name testUint8ClampedArrayFindLastIndexOne017
     * @tc.desc Verify findLastIndex idx equals 2 for array [100, 130, 50, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 130, 50, 200]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v <= 127);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_1800
     * @tc.name testUint8ClampedArrayFindLastIndexOne018
     * @tc.desc Verify findLastIndex idx equals -1 for array [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v + i === 13);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_1900
     * @tc.name testUint8ClampedArrayFindLastIndexOne019
     * @tc.desc Verify findLastIndex idx equals 0 for array [0x10, 0x20, 0x30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0x10, 0x20, 0x30]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 0x10);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_2000
     * @tc.name testUint8ClampedArrayFindLastIndexOne020
     * @tc.desc Verify findLastIndex idx equals 2 for array [0xFF, 0x7F, 0xFF]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF, 0x7F, 0xFF]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 0xFF);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_2100
     * @tc.name testUint8ClampedArrayFindLastIndexOne021
     * @tc.desc Verify predicate 0b10000000 2 = 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b00000001, 0b10000000, 0b11111111]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 0b10000000);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_2200
     * @tc.name testUint8ClampedArrayFindLastIndexOne022
     * @tc.desc Verify findLastIndex idx equals 2 for array [0o17, 0o20, 0o17]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o17, 0o20, 0o17]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 0o17);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_2300
     * @tc.name testUint8ClampedArrayFindLastIndexOne023
     * @tc.desc Verify findLastIndex idx equals 1 for array [99, 100, 101]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 100, 101]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 1e2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_2400
     * @tc.name testUint8ClampedArrayFindLastIndexOne024
     * @tc.desc Verify findLastIndex idx equals -1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const idx: int = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v > 1000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_2500
     * @tc.name testUint8ClampedArrayFindLastIndexOne025
     * @tc.desc Verify findLastIndex v === 5 returns last index 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 5, 10, 5]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 5);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_2600
     * @tc.name testUint8ClampedArrayFindLastIndexOne026
     * @tc.desc Verify findLastIndex visits indices from length-1 down to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const visitedIndices: int[] = [];
      arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => {
        visitedIndices.push(i);
        return false;
      });
      expect(visitedIndices.length).assertEqual(5);
      expect(visitedIndices[0]).assertEqual(4);
      expect(visitedIndices[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_2700
     * @tc.name testUint8ClampedArrayFindLastIndexOne027
     * @tc.desc Verify findLastIndex callCount equals 3 for v === 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => {
        callCount++;
        return v === 3;
      });
      expect(idx).assertEqual(2);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_2800
     * @tc.name testUint8ClampedArrayFindLastIndexOne028
     * @tc.desc Verify findLastIndex returns -1 after six reverse predicate calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6]);
      let callCount: int = 0;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => {
        callCount++;
        return false;
      });
      expect(idx).assertEqual(-1);
      expect(callCount).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_2900
     * @tc.name testUint8ClampedArrayFindLastIndexOne029
     * @tc.desc Verify findLastIndex on empty array returns -1 without calling predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let called: boolean = false;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => {
        called = true;
        return true;
      });
      expect(idx).assertEqual(-1);
      expect(called).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_3000
     * @tc.name testUint8ClampedArrayFindLastIndexOne030
     * @tc.desc Verify findLastIndex v === 99 single element returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 99);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_3100
     * @tc.name testUint8ClampedArrayFindLastIndexOne031
     * @tc.desc Verify findLastIndex no match single element returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 100);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_3200
     * @tc.name testUint8ClampedArrayFindLastIndexOne032
     * @tc.desc Verify findLastIndex v === 2 two elements returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_3300
     * @tc.name testUint8ClampedArrayFindLastIndexOne033
     * @tc.desc Verify findLastIndex v === 1 two elements returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 1);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_3400
     * @tc.name testUint8ClampedArrayFindLastIndexOne034
     * @tc.desc Verify findLastIndex v===255 in 0..255 array returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: number[] = [];
      for (let i = 0; i < 256; i++) {
        data.push(i);
      }
      const arr = new Uint8ClampedArray(data);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 255);
      expect(idx).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_3500
     * @tc.name testUint8ClampedArrayFindLastIndexOne035
     * @tc.desc Verify findLastIndex returns 1023 for value 7 in 1024-length array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      arr[1023] = 7;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 7);
      expect(idx).assertEqual(1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_3600
     * @tc.name testUint8ClampedArrayFindLastIndexOne036
     * @tc.desc Verify findLastIndex idx equals 1023 for length-1024 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 0);
      expect(idx).assertEqual(1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_3700
     * @tc.name testUint8ClampedArrayFindLastIndexOne037
     * @tc.desc Verify findLastIndex idx equals 1 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = 10;
      arr[1] = 256;
      arr[2] = 20;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 255);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_3800
     * @tc.name testUint8ClampedArrayFindLastIndexOne038
     * @tc.desc Verify findLastIndex idx equals 1 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = 10;
      arr[1] = -1;
      arr[2] = 20;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_3900
     * @tc.name testUint8ClampedArrayFindLastIndexOne039
     * @tc.desc Verify findLastIndex idx equals 1 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = 10;
      arr[1] = Number.NaN;
      arr[2] = 20;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_4000
     * @tc.name testUint8ClampedArrayFindLastIndexOne040
     * @tc.desc Verify findLastIndex idx equals 1 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = 10;
      arr[1] = Number.POSITIVE_INFINITY;
      arr[2] = 20;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 255);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_4100
     * @tc.name testUint8ClampedArrayFindLastIndexOne041
     * @tc.desc Verify findLastIndex idx equals 1 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = 10;
      arr[1] = -Number.POSITIVE_INFINITY;
      arr[2] = 20;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_4200
     * @tc.name testUint8ClampedArrayFindLastIndexOne042
     * @tc.desc Verify findLastIndex idx equals 1 for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 50;
      arr[1] = 127.5;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 128);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_4300
     * @tc.name testUint8ClampedArrayFindLastIndexOne043
     * @tc.desc Verify findLastIndex idx equals 1 for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 50;
      arr[1] = 128.5;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 128);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_4400
     * @tc.name testUint8ClampedArrayFindLastIndexOne044
     * @tc.desc Verify findLastIndex idx equals 1 for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 50;
      arr[1] = 0.4;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_4500
     * @tc.name testUint8ClampedArrayFindLastIndexOne045
     * @tc.desc Verify findLastIndex idx equals 1 for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 50;
      arr[1] = 0.9;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 1);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_4600
     * @tc.name testUint8ClampedArrayFindLastIndexOne046
     * @tc.desc Verify findLastIndex idx equals 1 for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 50;
      arr[1] = 1e9;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 255);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_4700
     * @tc.name testUint8ClampedArrayFindLastIndexOne047
     * @tc.desc Verify findLastIndex idx equals 1 for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 50;
      arr[1] = -1e9;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_4800
     * @tc.name testUint8ClampedArrayFindLastIndexOne048
     * @tc.desc Verify findLastIndex idx equals 1 for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 50;
      arr[1] = Number.MAX_VALUE;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 255);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_4900
     * @tc.name testUint8ClampedArrayFindLastIndexOne049
     * @tc.desc Verify findLastIndex idx equals 1 for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 50;
      arr[1] = Number.MIN_VALUE;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_5000
     * @tc.name testUint8ClampedArrayFindLastIndexOne050
     * @tc.desc Verify findLastIndex idx equals 1 for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 50;
      arr[1] = 2147483648;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 255);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_5100
     * @tc.name testUint8ClampedArrayFindLastIndexOne051
     * @tc.desc Verify findLastIndex idx equals 1 for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 50;
      arr[1] = -0;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_5200
     * @tc.name testUint8ClampedArrayFindLastIndexOne052
     * @tc.desc Verify Uint8ClampedArray.of findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30, 20);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 20);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_5300
     * @tc.name testUint8ClampedArrayFindLastIndexOne053
     * @tc.desc Verify findLastIndex idx equals 4 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(5);
      const arr = new Uint8ClampedArray(buf);
      arr[2] = 100;
      arr[4] = 100;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 100);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_5400
     * @tc.name testUint8ClampedArrayFindLastIndexOne054
     * @tc.desc Verify ArrayBuffer + byteOffset findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      arr[1] = 50;
      arr[3] = 50;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 50);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_5500
     * @tc.name testUint8ClampedArrayFindLastIndexOne055
     * @tc.desc Verify new Uint8ClampedArray(length) findLastIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 0);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_5600
     * @tc.name testUint8ClampedArrayFindLastIndexOne056
     * @tc.desc Verify findLastIndex idx equals 3 for array(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [5, 10, 15, 10];
      const arr = new Uint8ClampedArray(src);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 10);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_5700
     * @tc.name testUint8ClampedArrayFindLastIndexOne057
     * @tc.desc Verify subarray idx equals 1 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      const idx = sub.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 3);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_5800
     * @tc.name testUint8ClampedArrayFindLastIndexOne058
     * @tc.desc Verify slice idx equals 2 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const slice = parent.slice(1, 4);
      const idx = slice.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 4);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_5900
     * @tc.name testUint8ClampedArrayFindLastIndexOne059
     * @tc.desc Verify findLastIndex returns -1 for array [1, 2, 3] with no matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 100);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_6000
     * @tc.name testUint8ClampedArrayFindLastIndexOne060
     * @tc.desc Verify findLastIndex idx equals 4 for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => true);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_6100
     * @tc.name testUint8ClampedArrayFindLastIndexOne061
     * @tc.desc Verify findLastIndex does not mutate array elements and returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 20);
      expect(idx).assertEqual(1);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_6200
     * @tc.name testUint8ClampedArrayFindLastIndexOne062
     * @tc.desc Verify findLastIndex does not mutate array length and returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const beforeLen = arr.length;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 20);
      expect(idx).assertEqual(1);
      expect(arr.length).assertEqual(beforeLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_6300
     * @tc.name testUint8ClampedArrayFindLastIndexOne063
     * @tc.desc Verify findLastIndex does not mutate buffer reference and returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const beforeBuffer = arr.buffer;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 20);
      expect(idx).assertEqual(1);
      expect(arr.buffer).assertEqual(beforeBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_6400
     * @tc.name testUint8ClampedArrayFindLastIndexOne064
     * @tc.desc Verify findLastIndex same predicate returns equal index twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx1 = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 20);
      const idx2 = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 20);
      expect(idx1).assertEqual(1);
      expect(idx2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_6500
     * @tc.name testUint8ClampedArrayFindLastIndexOne065
     * @tc.desc Verify findLastIndex v===1 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 1);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_6600
     * @tc.name testUint8ClampedArrayFindLastIndexOne066
     * @tc.desc Verify findLastIndex idx equals arr.length - 1 for array [1, 2, 3, 4, 5, 6, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => true);
      expect(idx).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_6700
     * @tc.name testUint8ClampedArrayFindLastIndexOne067
     * @tc.desc Verify findLastIndex v === 30 index dereferences arr value 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === 30);
      expect(arr[idx]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_6800
     * @tc.name testUint8ClampedArrayFindLastIndexOne068
     * @tc.desc Verify findLastIndex propagates Error thrown by the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => {
          throw new Error('predicate failed');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_6900
     * @tc.name testUint8ClampedArrayFindLastIndexOne069
     * @tc.desc Verify findLastIndex propagates RangeError thrown by the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => {
          throw new RangeError('range fail');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_7000
     * @tc.name testUint8ClampedArrayFindLastIndexOne070
     * @tc.desc Verify findLastIndex propagates TypeError thrown by the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => {
          throw new TypeError('type fail');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_7100
     * @tc.name testUint8ClampedArrayFindLastIndexOne071
     * @tc.desc Verify findLastIndex predicate throws Error on first call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let callCount: int = 0;
      try {
        arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => {
          callCount++;
          throw new Error('first call throw');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_7200
     * @tc.name testUint8ClampedArrayFindLastIndexOne072
     * @tc.desc Verify findLastIndex predicate throws Error on second call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let callCount: int = 0;
      try {
        arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => {
          callCount++;
          if (callCount === 2) {
            throw new Error('second call');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_7300
     * @tc.name testUint8ClampedArrayFindLastIndexOne073
     * @tc.desc Verify predicate throws Error (name check)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => {
          throw new Error('custom msg 123');
        });
        expect().assertFail();
      } catch (e) { expect(e.name).assertEqual('Error'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_7400
     * @tc.name testUint8ClampedArrayFindLastIndexOne074
     * @tc.desc Verify findLastIndex predicate mutation arr[0]=99 persists and returns matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => {
        if (i === 2) {
          arr[0] = 99;
        }
        return v === 99;
      });
      expect(idx).assertEqual(0);
      expect(arr[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_7500
     * @tc.name testUint8ClampedArrayFindLastIndexOne075
     * @tc.desc Verify predicate truthy v > 0 boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v > 0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_7600
     * @tc.name testUint8ClampedArrayFindLastIndexOne076
     * @tc.desc Verify findLastIndex returns last index when predicate !isNaN(v)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => !isNaN(v));
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_7700
     * @tc.name testUint8ClampedArrayFindLastIndexOne077
     * @tc.desc Verify nested findLastIndex in predicate finds last occurrence of value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => {
        const inner = a.findLastIndex((vv: number, ii: int, aa: Uint8ClampedArray): boolean => vv === v);
        return inner === i && v === 3;
      });
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FIND_LAST_INDEX_ONE_7800
     * @tc.name testUint8ClampedArrayFindLastIndexOne078
     * @tc.desc Verify findLastIndex v === target 20 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFindLastIndexOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const target: number = 20;
      const idx = arr.findLastIndex((v: number, i: int, a: Uint8ClampedArray): boolean => v === target);
      expect(idx).assertEqual(1);
    });
  });
}
