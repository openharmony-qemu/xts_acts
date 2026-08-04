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

export default function uint8ClampedArrayLastIndexOf01Test(): void {
  describe('uint8ClampedArrayLastIndexOf01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_0100
     * @tc.name testUint8ClampedArrayLastIndexOfOne001
     * @tc.desc Verify lastIndexOf searchElement=20 number, returns last index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 20, 10]);
      const idx: int = arr.lastIndexOf(20);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_0200
     * @tc.name testUint8ClampedArrayLastIndexOfOne002
     * @tc.desc Verify lastIndexOf searchElement byte=30, returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 20, 10]);
      const target: byte = 30;
      const idx: int = arr.lastIndexOf(target);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_0300
     * @tc.name testUint8ClampedArrayLastIndexOfOne003
     * @tc.desc Verify lastIndexOf searchElement=20 with fromIndex=2, returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 20, 10]);
      const idx: int = arr.lastIndexOf(20, 2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_0400
     * @tc.name testUint8ClampedArrayLastIndexOfOne004
     * @tc.desc Verify lastIndexOf(10, 0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = arr.lastIndexOf(10, 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_0500
     * @tc.name testUint8ClampedArrayLastIndexOfOne005
     * @tc.desc Verify lastIndexOf default fromIndex=length-1, searchElement=42 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const idx: int = arr.lastIndexOf(42);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_0600
     * @tc.name testUint8ClampedArrayLastIndexOfOne006
     * @tc.desc Verify lastIndexOf empty array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const idx: int = arr.lastIndexOf(0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_0700
     * @tc.name testUint8ClampedArrayLastIndexOfOne007
     * @tc.desc Verify lastIndexOf idx equals 2 for array [5, 6, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const idx: int = arr.lastIndexOf(7);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_0800
     * @tc.name testUint8ClampedArrayLastIndexOfOne008
     * @tc.desc Verify lastIndexOf(5) default fromIndex equals fromIndex=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const idx1: int = arr.lastIndexOf(5);
      const idx2: int = arr.lastIndexOf(5, 4);
      expect(idx1).assertEqual(idx2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_0900
     * @tc.name testUint8ClampedArrayLastIndexOfOne009
     * @tc.desc Verify lastIndexOf searchElement=0, returns last index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2, 0, 3]);
      const idx: int = arr.lastIndexOf(0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_1000
     * @tc.name testUint8ClampedArrayLastIndexOfOne010
     * @tc.desc Verify lastIndexOf searchElement=255, returns last index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 255, 2, 255, 3]);
      const idx: int = arr.lastIndexOf(255);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_1100
     * @tc.name testUint8ClampedArrayLastIndexOfOne011
     * @tc.desc Verify lastIndexOf searchElement=1, returns last index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 1, 3]);
      const idx: int = arr.lastIndexOf(1);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_1200
     * @tc.name testUint8ClampedArrayLastIndexOfOne012
     * @tc.desc Verify lastIndexOf searchElement=127, returns last index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 127, 200, 127]);
      const idx: int = arr.lastIndexOf(127);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_1300
     * @tc.name testUint8ClampedArrayLastIndexOfOne013
     * @tc.desc Verify lastIndexOf searchElement=128, returns last index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 128, 129, 128]);
      const idx: int = arr.lastIndexOf(128);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_1400
     * @tc.name testUint8ClampedArrayLastIndexOfOne014
     * @tc.desc Verify lastIndexOf searchElement=254, returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([254, 255, 253]);
      const idx: int = arr.lastIndexOf(254);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_1500
     * @tc.name testUint8ClampedArrayLastIndexOfOne015
     * @tc.desc Verify lastIndexOf searchElement=256 not clamped (Strict Equality), not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      const idx: int = arr.lastIndexOf(256);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_1600
     * @tc.name testUint8ClampedArrayLastIndexOfOne016
     * @tc.desc Verify lastIndexOf searchElement=-1 not clamped (Strict Equality), not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const idx: int = arr.lastIndexOf(-1);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_1700
     * @tc.name testUint8ClampedArrayLastIndexOfOne017
     * @tc.desc Verify lastIndexOf searchElement=NaN, NaN!==NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const idx: int = arr.lastIndexOf(Number.NaN);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_1800
     * @tc.name testUint8ClampedArrayLastIndexOfOne018
     * @tc.desc Verify lastIndexOf searchElement=Infinity not clamped (Strict Equality), not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255]);
      const idx: int = arr.lastIndexOf(Number.POSITIVE_INFINITY);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_1900
     * @tc.name testUint8ClampedArrayLastIndexOfOne019
     * @tc.desc Verify lastIndexOf searchElement=-Infinity not clamped (Strict Equality), not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const idx: int = arr.lastIndexOf(-Number.POSITIVE_INFINITY);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_2000
     * @tc.name testUint8ClampedArrayLastIndexOfOne020
     * @tc.desc Verify lastIndexOf searchElement=0.0, returns last index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 0]);
      const idx: int = arr.lastIndexOf(0.0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_2100
     * @tc.name testUint8ClampedArrayLastIndexOfOne021
     * @tc.desc Verify lastIndexOf searchElement=0.5 not clamped (Strict Equality), not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const idx: int = arr.lastIndexOf(0.5);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_2200
     * @tc.name testUint8ClampedArrayLastIndexOfOne022
     * @tc.desc Verify lastIndexOf searchElement=127.5, not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 128]);
      const idx: int = arr.lastIndexOf(127.5);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_2300
     * @tc.name testUint8ClampedArrayLastIndexOfOne023
     * @tc.desc Verify lastIndexOf searchElement=100.0, returns last index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 100, 101, 100]);
      const idx: int = arr.lastIndexOf(100.0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_2400
     * @tc.name testUint8ClampedArrayLastIndexOfOne024
     * @tc.desc Verify lastIndexOf searchElement=1e2 (=100), returns last index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 50, 100]);
      const idx: int = arr.lastIndexOf(1e2);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_2500
     * @tc.name testUint8ClampedArrayLastIndexOfOne025
     * @tc.desc Verify lastIndexOf searchElement=0x7F (=127), returns last index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 0, 127]);
      const idx: int = arr.lastIndexOf(0x7F);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_2600
     * @tc.name testUint8ClampedArrayLastIndexOfOne026
     * @tc.desc Verify lastIndexOf searchElement=0xFF (=255), returns last index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 255, 0]);
      const idx: int = arr.lastIndexOf(0xFF);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_2700
     * @tc.name testUint8ClampedArrayLastIndexOfOne027
     * @tc.desc Verify lastIndexOf searchElement=0o17 (=15), returns last index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([15, 14, 15]);
      const idx: int = arr.lastIndexOf(0o17);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_2800
     * @tc.name testUint8ClampedArrayLastIndexOfOne028
     * @tc.desc Verify lastIndexOf searchElement=0b1010 (=10), returns last index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 10]);
      const idx: int = arr.lastIndexOf(0b1010);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_2900
     * @tc.name testUint8ClampedArrayLastIndexOfOne029
     * @tc.desc Verify lastIndexOf searchElement=0x100 (=256) not clamped (Strict Equality), not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255]);
      const idx: int = arr.lastIndexOf(0x100);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_3000
     * @tc.name testUint8ClampedArrayLastIndexOfOne030
     * @tc.desc Verify lastIndexOf searchElement=1e9 not clamped (Strict Equality), not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 200]);
      const idx: int = arr.lastIndexOf(1e9);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_3100
     * @tc.name testUint8ClampedArrayLastIndexOfOne031
     * @tc.desc Verify lastIndexOf searchElement=Number.MAX_VALUE not clamped (Strict Equality), not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      const idx: int = arr.lastIndexOf(Number.MAX_VALUE);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_3200
     * @tc.name testUint8ClampedArrayLastIndexOfOne032
     * @tc.desc Verify lastIndexOf searchElement=Number.MIN_VALUE not clamped (Strict Equality), not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1]);
      const idx: int = arr.lastIndexOf(Number.MIN_VALUE);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_3300
     * @tc.name testUint8ClampedArrayLastIndexOfOne033
     * @tc.desc Verify lastIndexOf searchElement=Number.MAX_SAFE_INTEGER not clamped (Strict Equality), not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      const idx: int = arr.lastIndexOf(Number.MAX_SAFE_INTEGER);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_3400
     * @tc.name testUint8ClampedArrayLastIndexOfOne034
     * @tc.desc Verify lastIndexOf searchElement byte=10, returns last index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 15, 10]);
      const target: byte = 10;
      const idx: int = arr.lastIndexOf(target);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_3500
     * @tc.name testUint8ClampedArrayLastIndexOfOne035
     * @tc.desc Verify lastIndexOf searchElement byte=0, returns last index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 0, 2]);
      const target: byte = 0;
      const idx: int = arr.lastIndexOf(target);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_3600
     * @tc.name testUint8ClampedArrayLastIndexOfOne036
     * @tc.desc Verify lastIndexOf searchElement byte=127, returns last index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 127, 2, 127]);
      const target: byte = 127;
      const idx: int = arr.lastIndexOf(target);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_3700
     * @tc.name testUint8ClampedArrayLastIndexOfOne037
     * @tc.desc Verify lastIndexOf searchElement byte=-1 not clamped (Strict Equality), not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const target: byte = -1;
      const idx: int = arr.lastIndexOf(target);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_3800
     * @tc.name testUint8ClampedArrayLastIndexOfOne038
     * @tc.desc Verify lastIndexOf searchElement byte=-128 not clamped (Strict Equality), not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const target: byte = -128;
      const idx: int = arr.lastIndexOf(target);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_3900
     * @tc.name testUint8ClampedArrayLastIndexOfOne039
     * @tc.desc Verify lastIndexOf searchElement=42, returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42, 1, 2, 3]);
      const idx: int = arr.lastIndexOf(42);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_4000
     * @tc.name testUint8ClampedArrayLastIndexOfOne040
     * @tc.desc Verify lastIndexOf searchElement=99, returns index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 99]);
      const idx: int = arr.lastIndexOf(99);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_4100
     * @tc.name testUint8ClampedArrayLastIndexOfOne041
     * @tc.desc Verify lastIndexOf searchElement=7, returns last index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7, 7]);
      const idx: int = arr.lastIndexOf(7);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_4200
     * @tc.name testUint8ClampedArrayLastIndexOfOne042
     * @tc.desc Verify lastIndexOf(99) not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const idx: int = arr.lastIndexOf(99);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_4300
     * @tc.name testUint8ClampedArrayLastIndexOfOne043
     * @tc.desc Verify lastIndexOf fromIndex=0, searchElement=10 returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 10]);
      const idx: int = arr.lastIndexOf(10, 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_4400
     * @tc.name testUint8ClampedArrayLastIndexOfOne044
     * @tc.desc Verify lastIndexOf fromIndex=0, searchElement=20 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = arr.lastIndexOf(20, 0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_4500
     * @tc.name testUint8ClampedArrayLastIndexOfOne045
     * @tc.desc Verify lastIndexOf idx equals 1 for array [10, 20, 30, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 20]);
      const idx: int = arr.lastIndexOf(20, 1);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_4600
     * @tc.name testUint8ClampedArrayLastIndexOfOne046
     * @tc.desc Verify lastIndexOf idx equals 1 for array [10, 20, 30, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 20]);
      const idx: int = arr.lastIndexOf(20, 2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_4700
     * @tc.name testUint8ClampedArrayLastIndexOfOne047
     * @tc.desc Verify lastIndexOf fromIndex=length-1, searchElement=20 returns index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 20]);
      const idx: int = arr.lastIndexOf(20, 3);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_4800
     * @tc.name testUint8ClampedArrayLastIndexOfOne048
     * @tc.desc Verify lastIndexOf fromIndex=length, searchElement=30 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = arr.lastIndexOf(30, 3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_4900
     * @tc.name testUint8ClampedArrayLastIndexOfOne049
     * @tc.desc Verify lastIndexOf fromIndex=length+1, searchElement=10 returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = arr.lastIndexOf(10, 4);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_5000
     * @tc.name testUint8ClampedArrayLastIndexOfOne050
     * @tc.desc Verify lastIndexOf fromIndex=length+100, searchElement=3 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const idx: int = arr.lastIndexOf(3, 103);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_5100
     * @tc.name testUint8ClampedArrayLastIndexOfOne051
     * @tc.desc Verify lastIndexOf fromIndex=-1, searchElement=30 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = arr.lastIndexOf(30, -1);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_5200
     * @tc.name testUint8ClampedArrayLastIndexOfOne052
     * @tc.desc Verify lastIndexOf fromIndex=-2, searchElement=30 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = arr.lastIndexOf(30, -2);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_5300
     * @tc.name testUint8ClampedArrayLastIndexOfOne053
     * @tc.desc Verify lastIndexOf fromIndex=-2, searchElement=20 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const idx: int = arr.lastIndexOf(20, -2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_5400
     * @tc.name testUint8ClampedArrayLastIndexOfOne054
     * @tc.desc Verify lastIndexOf fromIndex=-length (=0), searchElement=10 returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = arr.lastIndexOf(10, -3);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_5500
     * @tc.name testUint8ClampedArrayLastIndexOfOne055
     * @tc.desc Verify lastIndexOf idx equals -1 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = arr.lastIndexOf(20, -3);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_5600
     * @tc.name testUint8ClampedArrayLastIndexOfOne056
     * @tc.desc Verify lastIndexOf fromIndex=-length-1, searchElement=10 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = arr.lastIndexOf(10, -4);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_5700
     * @tc.name testUint8ClampedArrayLastIndexOfOne057
     * @tc.desc Verify lastIndexOf fromIndex=-length-100, searchElement=10 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const idx: int = arr.lastIndexOf(10, -103);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_5800
     * @tc.name testUint8ClampedArrayLastIndexOfOne058
     * @tc.desc Verify lastIndexOf fromIndex=INT_MAX, searchElement=9 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      const idx: int = arr.lastIndexOf(9, 2147483647);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_5900
     * @tc.name testUint8ClampedArrayLastIndexOfOne059
     * @tc.desc Verify lastIndexOf fromIndex=INT_MIN, searchElement=7 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      const idx: int = arr.lastIndexOf(7, -2147483648);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_6000
     * @tc.name testUint8ClampedArrayLastIndexOfOne060
     * @tc.desc Verify lastIndexOf fromIndex=0x7FFFFFFF (=INT_MAX), searchElement=2 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const idx: int = arr.lastIndexOf(2, 0x7FFFFFFF);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_6100
     * @tc.name testUint8ClampedArrayLastIndexOfOne061
     * @tc.desc Verify lastIndexOf fromIndex=0x0 (=0), searchElement=5 returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 5]);
      const idx: int = arr.lastIndexOf(5, 0x0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_6200
     * @tc.name testUint8ClampedArrayLastIndexOfOne062
     * @tc.desc Verify lastIndexOf fromIndex=0o3 (=3), searchElement=3 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 3]);
      const idx: int = arr.lastIndexOf(3, 0o3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_6300
     * @tc.name testUint8ClampedArrayLastIndexOfOne063
     * @tc.desc Verify lastIndexOf fromIndex=0b10 (=2), searchElement=2 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 2]);
      const idx: int = arr.lastIndexOf(2, 0b10);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_6400
     * @tc.name testUint8ClampedArrayLastIndexOfOne064
     * @tc.desc Verify lastIndexOf fromIndex=1e1 (=10), searchElement=3 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const idx: int = arr.lastIndexOf(3, 10);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_6500
     * @tc.name testUint8ClampedArrayLastIndexOfOne065
     * @tc.desc Verify lastIndexOf(3, 0) not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const idx: int = arr.lastIndexOf(3, 0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_6600
     * @tc.name testUint8ClampedArrayLastIndexOfOne066
     * @tc.desc Verify lastIndexOf fromIndex=3, searchElement=50 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const idx: int = arr.lastIndexOf(50, 3);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_6700
     * @tc.name testUint8ClampedArrayLastIndexOfOne067
     * @tc.desc Verify lastIndexOf fromIndex=3, searchElement=20 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const idx: int = arr.lastIndexOf(20, 3);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_6800
     * @tc.name testUint8ClampedArrayLastIndexOfOne068
     * @tc.desc Verify lastIndexOf fromIndex=2, searchElement=30 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const idx: int = arr.lastIndexOf(30, 2);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_6900
     * @tc.name testUint8ClampedArrayLastIndexOfOne069
     * @tc.desc Verify lastIndexOf fromIndex=-length, searchElement=88 returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([88, 1, 2, 3]);
      const idx: int = arr.lastIndexOf(88, -4);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_7000
     * @tc.name testUint8ClampedArrayLastIndexOfOne070
     * @tc.desc Verify lastIndexOf 64-element array fromIndex=30, searchElement=50 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<number> = [
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
        11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
        21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
        31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
        41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
        51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
        61, 62, 63, 64
      ];
      const arr = new Uint8ClampedArray(data);
      const idx: int = arr.lastIndexOf(50, 30);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_7100
     * @tc.name testUint8ClampedArrayLastIndexOfOne071
     * @tc.desc Verify lastIndexOf 64-element array fromIndex=49, searchElement=50 returns index 49
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<number> = [
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
        11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
        21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
        31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
        41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
        51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
        61, 62, 63, 64
      ];
      const arr = new Uint8ClampedArray(data);
      const idx: int = arr.lastIndexOf(50, 49);
      expect(idx).assertEqual(49);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_7200
     * @tc.name testUint8ClampedArrayLastIndexOfOne072
     * @tc.desc Verify lastIndexOf empty array fromIndex=0, returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const idx: int = arr.lastIndexOf(0, 0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_7300
     * @tc.name testUint8ClampedArrayLastIndexOfOne073
     * @tc.desc Verify lastIndexOf fromIndex=3, searchElement=5 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 5, 6, 5, 6]);
      const idx: int = arr.lastIndexOf(5, 3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_7400
     * @tc.name testUint8ClampedArrayLastIndexOfOne074
     * @tc.desc Verify lastIndexOf fromIndex=0, searchElement=5 returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 5, 6, 5, 6]);
      const idx: int = arr.lastIndexOf(5, 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_7500
     * @tc.name testUint8ClampedArrayLastIndexOfOne075
     * @tc.desc Verify lastIndexOf 256-element array fromIndex=255, searchElement=100 returns index 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<number> = new Array<number>();
      for (let i: int = 0; i < 256; i++) {
        data.push(i % 256);
      }
      const arr = new Uint8ClampedArray(data);
      const idx: int = arr.lastIndexOf(100, 255);
      expect(idx).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_7600
     * @tc.name testUint8ClampedArrayLastIndexOfOne076
     * @tc.desc Verify lastIndexOf fromIndex=-3, searchElement=40 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const idx: int = arr.lastIndexOf(40, -3);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_LAST_INDEX_OF_ONE_7700
     * @tc.name testUint8ClampedArrayLastIndexOfOne077
     * @tc.desc Verify lastIndexOf fromIndex=-3, searchElement=30 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayLastIndexOfOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const idx: int = arr.lastIndexOf(30, -3);
      expect(idx).assertEqual(2);
    });
  });
}
