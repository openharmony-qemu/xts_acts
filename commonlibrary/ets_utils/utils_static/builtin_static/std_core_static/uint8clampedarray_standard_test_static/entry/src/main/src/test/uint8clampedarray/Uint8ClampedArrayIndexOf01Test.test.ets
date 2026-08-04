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

export default function uint8ClampedArrayIndexOf01Test(): void {
  describe('uint8ClampedArrayIndexOf01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_0100
     * @tc.name testUint8ClampedArrayIndexOfOne001
     * @tc.desc Verify indexOf r equals 0 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(10);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_0200
     * @tc.name testUint8ClampedArrayIndexOfOne002
     * @tc.desc Verify indexOf r equals 2 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(30);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_0300
     * @tc.name testUint8ClampedArrayIndexOfOne003
     * @tc.desc Verify searchElement 99 not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_0400
     * @tc.name testUint8ClampedArrayIndexOfOne004
     * @tc.desc Verify indexOf r equals 3 for array [10, 20, 30, 10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 10]);
      const r: int = arr.indexOf(10, 1);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_0500
     * @tc.name testUint8ClampedArrayIndexOfOne005
     * @tc.desc Verify searchElement + fromIndex=0 fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(20, 0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_0600
     * @tc.name testUint8ClampedArrayIndexOfOne006
     * @tc.desc Verify searchElement + fromIndex=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const r: int = arr.indexOf(6, undefined);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_0700
     * @tc.name testUint8ClampedArrayIndexOfOne007
     * @tc.desc Verify indexOf r equals -1 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const r: int = arr.indexOf(0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_0800
     * @tc.name testUint8ClampedArrayIndexOfOne008
     * @tc.desc Verify indexOf r equals 0 for array [0, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const r: int = arr.indexOf(0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_0900
     * @tc.name testUint8ClampedArrayIndexOfOne009
     * @tc.desc Verify searchElement=255 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([254, 255, 0]);
      const r: int = arr.indexOf(255);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_1000
     * @tc.name testUint8ClampedArrayIndexOfOne010
     * @tc.desc Verify searchElement=127 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([126, 127, 128]);
      const r: int = arr.indexOf(127);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_1100
     * @tc.name testUint8ClampedArrayIndexOfOne011
     * @tc.desc Verify searchElement=128 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([126, 127, 128]);
      const r: int = arr.indexOf(128);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_1200
     * @tc.name testUint8ClampedArrayIndexOfOne012
     * @tc.desc Verify searchElement=1 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const r: int = arr.indexOf(1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_1300
     * @tc.name testUint8ClampedArrayIndexOfOne013
     * @tc.desc Verify searchElement=254 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([253, 254, 255]);
      const r: int = arr.indexOf(254);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_1400
     * @tc.name testUint8ClampedArrayIndexOfOne014
     * @tc.desc Verify indexOf r equals -1 for array [0, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const r: int = arr.indexOf(-1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_1500
     * @tc.name testUint8ClampedArrayIndexOfOne015
     * @tc.desc Verify searchElement=1000 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      const r: int = arr.indexOf(1000);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_1600
     * @tc.name testUint8ClampedArrayIndexOfOne016
     * @tc.desc Verify searchElement=-1000 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1]);
      const r: int = arr.indexOf(-1000);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_1700
     * @tc.name testUint8ClampedArrayIndexOfOne017
     * @tc.desc Verify indexOf r equals -1 for array [0, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      const r: int = arr.indexOf(Number.POSITIVE_INFINITY);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_1800
     * @tc.name testUint8ClampedArrayIndexOfOne018
     * @tc.desc Verify indexOf r equals -1 for array [0, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      const r: int = arr.indexOf(-Number.POSITIVE_INFINITY);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_1900
     * @tc.name testUint8ClampedArrayIndexOfOne019
     * @tc.desc Verify indexOf r equals 0 for array [0, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const r: int = arr.indexOf(0.0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_2000
     * @tc.name testUint8ClampedArrayIndexOfOne020
     * @tc.desc Verify indexOf r equals -1 for array [0, 1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const r: int = arr.indexOf(0.5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_2100
     * @tc.name testUint8ClampedArrayIndexOfOne021
     * @tc.desc Verify indexOf r equals -1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: int = arr.indexOf(1.5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_2200
     * @tc.name testUint8ClampedArrayIndexOfOne022
     * @tc.desc Verify indexOf(127.5) not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 128]);
      const r: int = arr.indexOf(127.5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_2300
     * @tc.name testUint8ClampedArrayIndexOfOne023
     * @tc.desc Verify indexOf r equals 1 for array [254, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([254, 255]);
      const r: int = arr.indexOf(255.0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_2400
     * @tc.name testUint8ClampedArrayIndexOfOne024
     * @tc.desc Verify searchElement=Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      const r: int = arr.indexOf(Number.MAX_VALUE);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_2500
     * @tc.name testUint8ClampedArrayIndexOfOne025
     * @tc.desc Verify indexOf(Number.MIN_VALUE) not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const r: int = arr.indexOf(Number.MIN_VALUE);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_2600
     * @tc.name testUint8ClampedArrayIndexOfOne026
     * @tc.desc Verify searchElement=Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      const r: int = arr.indexOf(Number.MAX_SAFE_INTEGER);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_2700
     * @tc.name testUint8ClampedArrayIndexOfOne027
     * @tc.desc Verify searchElement=Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      const r: int = arr.indexOf(Number.MIN_SAFE_INTEGER);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_2800
     * @tc.name testUint8ClampedArrayIndexOfOne028
     * @tc.desc Verify searchElement=2147483648 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      const r: int = arr.indexOf(2147483648);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_2900
     * @tc.name testUint8ClampedArrayIndexOfOne029
     * @tc.desc Verify searchElement=1e9 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      const r: int = arr.indexOf(1e9);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_3000
     * @tc.name testUint8ClampedArrayIndexOfOne030
     * @tc.desc Verify searchElement=-1e9 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      const r: int = arr.indexOf(-1e9);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_3100
     * @tc.name testUint8ClampedArrayIndexOfOne031
     * @tc.desc Verify searchElement=1e2 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 100, 101]);
      const r: int = arr.indexOf(1e2);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_3200
     * @tc.name testUint8ClampedArrayIndexOfOne032
     * @tc.desc Verify searchElement=0x00 returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const r: int = arr.indexOf(0x00);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_3300
     * @tc.name testUint8ClampedArrayIndexOfOne033
     * @tc.desc Verify searchElement=0xFF returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([254, 255]);
      const r: int = arr.indexOf(0xFF);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_3400
     * @tc.name testUint8ClampedArrayIndexOfOne034
     * @tc.desc Verify searchElement=0x7F returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([126, 127, 128]);
      const r: int = arr.indexOf(0x7F);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_3500
     * @tc.name testUint8ClampedArrayIndexOfOne035
     * @tc.desc Verify searchElement=0x80 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 128, 129]);
      const r: int = arr.indexOf(0x80);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_3600
     * @tc.name testUint8ClampedArrayIndexOfOne036
     * @tc.desc Verify searchElement=0o17 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([14, 15, 16]);
      const r: int = arr.indexOf(0o17);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_3700
     * @tc.name testUint8ClampedArrayIndexOfOne037
     * @tc.desc Verify searchElement=0o377 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([254, 255]);
      const r: int = arr.indexOf(0o377);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_3800
     * @tc.name testUint8ClampedArrayIndexOfOne038
     * @tc.desc Verify searchElement=0b0 returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1]);
      const r: int = arr.indexOf(0b0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_3900
     * @tc.name testUint8ClampedArrayIndexOfOne039
     * @tc.desc Verify searchElement=0b11111111 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      const r: int = arr.indexOf(0b11111111);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_4000
     * @tc.name testUint8ClampedArrayIndexOfOne040
     * @tc.desc Verify searchElement=0b1 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const r: int = arr.indexOf(0b1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_4100
     * @tc.name testUint8ClampedArrayIndexOfOne041
     * @tc.desc Verify searchElement byte=20 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const v: byte = 20;
      const r: int = arr.indexOf(v);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_4200
     * @tc.name testUint8ClampedArrayIndexOfOne042
     * @tc.desc Verify searchElement byte=0 returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const v: byte = 0;
      const r: int = arr.indexOf(v);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_4300
     * @tc.name testUint8ClampedArrayIndexOfOne043
     * @tc.desc Verify searchElement byte=127 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([126, 127, 128]);
      const v: byte = 127;
      const r: int = arr.indexOf(v);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_4400
     * @tc.name testUint8ClampedArrayIndexOfOne044
     * @tc.desc Verify searchElement byte=-128 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 255]);
      const v: byte = -128;
      const r: int = arr.indexOf(v);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_4500
     * @tc.name testUint8ClampedArrayIndexOfOne045
     * @tc.desc Verify indexOf(2) not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const r: int = arr.indexOf(2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_4600
     * @tc.name testUint8ClampedArrayIndexOfOne046
     * @tc.desc Verify indexOf(255) not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2, 3]);
      const r: int = arr.indexOf(255);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_4700
     * @tc.name testUint8ClampedArrayIndexOfOne047
     * @tc.desc Verify indexOf(0) not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: int = arr.indexOf(0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_4800
     * @tc.name testUint8ClampedArrayIndexOfOne048
     * @tc.desc Verify indexOf r equals 0 for array [100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      const r: int = arr.indexOf(100);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_4900
     * @tc.name testUint8ClampedArrayIndexOfOne049
     * @tc.desc Verify indexOf r equals -1 for array [100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      const r: int = arr.indexOf(200);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_5000
     * @tc.name testUint8ClampedArrayIndexOfOne050
     * @tc.desc Verify indexOf r equals 0 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 42;
      const r: int = arr.indexOf(42);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_5100
     * @tc.name testUint8ClampedArrayIndexOfOne051
     * @tc.desc Verify indexOf r equals 1023 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Uint8ClampedArray(buf);
      arr[1023] = 42;
      const r: int = arr.indexOf(42);
      expect(r).assertEqual(1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_5200
     * @tc.name testUint8ClampedArrayIndexOfOne052
     * @tc.desc Verify searchElement=1.0e0 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      const r: int = arr.indexOf(1.0e0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_5300
     * @tc.name testUint8ClampedArrayIndexOfOne053
     * @tc.desc Verify indexOf r equals 2 for array [10, 20, 10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 10]);
      const r: int = arr.indexOf(10, 1);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_5400
     * @tc.name testUint8ClampedArrayIndexOfOne054
     * @tc.desc Verify indexOf r equals 2 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(30, 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_5500
     * @tc.name testUint8ClampedArrayIndexOfOne055
     * @tc.desc Verify indexOf r equals -1 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(10, 2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_5600
     * @tc.name testUint8ClampedArrayIndexOfOne056
     * @tc.desc Verify indexOf r equals -1 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(10, 3);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_5700
     * @tc.name testUint8ClampedArrayIndexOfOne057
     * @tc.desc Verify indexOf r equals -1 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(10, 4);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_5800
     * @tc.name testUint8ClampedArrayIndexOfOne058
     * @tc.desc Verify indexOf r equals -1 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(10, 103);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_5900
     * @tc.name testUint8ClampedArrayIndexOfOne059
     * @tc.desc Verify indexOf r equals 2 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(30, -1);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_6000
     * @tc.name testUint8ClampedArrayIndexOfOne060
     * @tc.desc Verify indexOf(10, -1) not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(10, -1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_6100
     * @tc.name testUint8ClampedArrayIndexOfOne061
     * @tc.desc Verify indexOf r equals 1 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(20, -2);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_6200
     * @tc.name testUint8ClampedArrayIndexOfOne062
     * @tc.desc Verify indexOf r equals 0 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(10, -3);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_6300
     * @tc.name testUint8ClampedArrayIndexOfOne063
     * @tc.desc Verify indexOf r equals 0 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(10, -4);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_6400
     * @tc.name testUint8ClampedArrayIndexOfOne064
     * @tc.desc Verify fromIndex=-length-100 -length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(20, -103);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_6500
     * @tc.name testUint8ClampedArrayIndexOfOne065
     * @tc.desc Verify fromIndex=2147483647 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(10, 2147483647);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_6600
     * @tc.name testUint8ClampedArrayIndexOfOne066
     * @tc.desc Verify fromIndex=0x7FFFFFFF returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(10, 0x7FFFFFFF);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_6700
     * @tc.name testUint8ClampedArrayIndexOfOne067
     * @tc.desc Verify fromIndex=-2147483648 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: int = arr.indexOf(20, -2147483648);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_6800
     * @tc.name testUint8ClampedArrayIndexOfOne068
     * @tc.desc Verify indexOf r equals -1 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const r: int = arr.indexOf(0, -1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_6900
     * @tc.name testUint8ClampedArrayIndexOfOne069
     * @tc.desc Verify indexOf r equals -1 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const r: int = arr.indexOf(0, 10);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_7000
     * @tc.name testUint8ClampedArrayIndexOfOne070
     * @tc.desc Verify indexOf r equals 0 for array [7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7]);
      const r: int = arr.indexOf(7, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_7100
     * @tc.name testUint8ClampedArrayIndexOfOne071
     * @tc.desc Verify indexOf r equals -1 for array [7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7]);
      const r: int = arr.indexOf(7, 1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_7200
     * @tc.name testUint8ClampedArrayIndexOfOne072
     * @tc.desc Verify indexOf r equals 0 for array [7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7]);
      const r: int = arr.indexOf(7, -1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_7300
     * @tc.name testUint8ClampedArrayIndexOfOne073
     * @tc.desc Verify fromIndex=0x10 finds element at index 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Uint8ClampedArray(buf);
      arr[20] = 88;
      const r: int = arr.indexOf(88, 0x10);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_7400
     * @tc.name testUint8ClampedArrayIndexOfOne074
     * @tc.desc Verify fromIndex=0o10 finds element at index 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf);
      arr[10] = 77;
      const r: int = arr.indexOf(77, 0o10);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_7500
     * @tc.name testUint8ClampedArrayIndexOfOne075
     * @tc.desc Verify fromIndex=0b100 returns index 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0, 5, 6]);
      const r: int = arr.indexOf(5, 0b100);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_7600
     * @tc.name testUint8ClampedArrayIndexOfOne076
     * @tc.desc Verify indexOf r equals 0 for array [7, 7, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7]);
      const r: int = arr.indexOf(7, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_7700
     * @tc.name testUint8ClampedArrayIndexOfOne077
     * @tc.desc Verify indexOf r equals 1 for array [7, 7, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7]);
      const r: int = arr.indexOf(7, 1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_7800
     * @tc.name testUint8ClampedArrayIndexOfOne078
     * @tc.desc Verify indexOf r equals 2 for array [7, 7, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7]);
      const r: int = arr.indexOf(7, 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_7900
     * @tc.name testUint8ClampedArrayIndexOfOne079
     * @tc.desc Verify indexOf r equals 0 for array [7, 7, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7]);
      const r: int = arr.indexOf(7, -3);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_8000
     * @tc.name testUint8ClampedArrayIndexOfOne080
     * @tc.desc Verify indexOf r equals 1 for array [7, 7, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7]);
      const r: int = arr.indexOf(7, -2);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_8100
     * @tc.name testUint8ClampedArrayIndexOfOne081
     * @tc.desc Verify indexOf r equals -1 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(256);
      const arr = new Uint8ClampedArray(buf);
      arr[100] = 11;
      const r: int = arr.indexOf(11, 1024);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_8200
     * @tc.name testUint8ClampedArrayIndexOfOne082
     * @tc.desc Verify indexOf r equals -1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: int = arr.indexOf(1, 65535);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_8300
     * @tc.name testUint8ClampedArrayIndexOfOne083
     * @tc.desc Verify indexOf r equals -1 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(255);
      const arr = new Uint8ClampedArray(buf);
      arr[254] = 9;
      const r: int = arr.indexOf(9, 255);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_8400
     * @tc.name testUint8ClampedArrayIndexOfOne084
     * @tc.desc Verify fromIndex=254 returns index 254
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(255);
      const arr = new Uint8ClampedArray(buf);
      arr[254] = 9;
      const r: int = arr.indexOf(9, 254);
      expect(r).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_8500
     * @tc.name testUint8ClampedArrayIndexOfOne085
     * @tc.desc Verify fromIndex=-255 returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(255);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 9;
      const r: int = arr.indexOf(9, -255);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_8600
     * @tc.name testUint8ClampedArrayIndexOfOne086
     * @tc.desc Verify fromIndex=-256 returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(255);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 9;
      const r: int = arr.indexOf(9, -256);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_8700
     * @tc.name testUint8ClampedArrayIndexOfOne087
     * @tc.desc Verify indexOf r equals -1 for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Uint8ClampedArray(buf);
      arr[500] = 77;
      const r: int = arr.indexOf(77, 1024);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_8800
     * @tc.name testUint8ClampedArrayIndexOfOne088
     * @tc.desc Verify fromIndex int=0 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const idx: int = 0;
      const r: int = arr.indexOf(6, idx);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_INDEX_OF_ONE_8900
     * @tc.name testUint8ClampedArrayIndexOfOne089
     * @tc.desc Verify indexOf r equals 2 for array [5, 6, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayIndexOfOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const r: int = arr.indexOf(7, 1 + 1);
      expect(r).assertEqual(2);
    });
  });
}
