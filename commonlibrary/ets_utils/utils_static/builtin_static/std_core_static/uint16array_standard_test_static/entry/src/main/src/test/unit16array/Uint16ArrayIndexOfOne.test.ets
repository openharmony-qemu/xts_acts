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

export default function uint16ArrayIndexOfPart1Test(): void {
  describe('Uint16ArrayIndexOfPart1Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_0100
     * @tc.name testUint16ArrayIndexOfPart1_001
     * @tc.desc Verify searchElement fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_0200
     * @tc.name testUint16ArrayIndexOfPart1_002
     * @tc.desc Verify searchElement fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_0300
     * @tc.name testUint16ArrayIndexOfPart1_003
     * @tc.desc Verify searchElement 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_0400
     * @tc.name testUint16ArrayIndexOfPart1_004
     * @tc.desc Verify searchElement 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(65535);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_0500
     * @tc.name testUint16ArrayIndexOfPart1_005
     * @tc.desc Verify searchElement 32768(0x8000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(32768);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_0600
     * @tc.name testUint16ArrayIndexOfPart1_006
     * @tc.desc Verify searchElement 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(100);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_0700
     * @tc.name testUint16ArrayIndexOfPart1_007
     * @tc.desc Verify searchElement 20000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(20000);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_0800
     * @tc.name testUint16ArrayIndexOfPart1_008
     * @tc.desc Verify searchElement 50000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(50000);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_0900
     * @tc.name testUint16ArrayIndexOfPart1_009
     * @tc.desc Verify searchElement 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_1000
     * @tc.name testUint16ArrayIndexOfPart1_010
     * @tc.desc Verify searchElement 101
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(101);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_1100
     * @tc.name testUint16ArrayIndexOfPart1_011
     * @tc.desc Verify searchElement NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(Number.NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_1200
     * @tc.name testUint16ArrayIndexOfPart1_012
     * @tc.desc Verify searchElement Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_1300
     * @tc.name testUint16ArrayIndexOfPart1_013
     * @tc.desc Verify searchElement -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(-Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_1400
     * @tc.name testUint16ArrayIndexOfPart1_014
     * @tc.desc Verify searchElement 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(3.14);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_1500
     * @tc.name testUint16ArrayIndexOfPart1_015
     * @tc.desc Verify searchElement 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(65535.9);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_1600
     * @tc.name testUint16ArrayIndexOfPart1_016
     * @tc.desc Verify searchElement -0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(-0.5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_1700
     * @tc.name testUint16ArrayIndexOfPart1_017
     * @tc.desc Verify searchElement -0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(-0.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_1800
     * @tc.name testUint16ArrayIndexOfPart1_018
     * @tc.desc Verify searchElement 1e0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(1e0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_1900
     * @tc.name testUint16ArrayIndexOfPart1_019
     * @tc.desc Verify searchElement 0xFFFF 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(0xFFFF);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_2000
     * @tc.name testUint16ArrayIndexOfPart1_020
     * @tc.desc Verify searchElement 0x8000 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(0x8000);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_2100
     * @tc.name testUint16ArrayIndexOfPart1_021
     * @tc.desc Verify searchElement 0o177777 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(0o177777);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_2200
     * @tc.name testUint16ArrayIndexOfPart1_022
     * @tc.desc Verify searchElement 0b1111111111111111 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(0b1111111111111111);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_2300
     * @tc.name testUint16ArrayIndexOfPart1_023
     * @tc.desc Verify searchElement 0x0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(0x0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_2400
     * @tc.name testUint16ArrayIndexOfPart1_024
     * @tc.desc Verify searchElement 0x1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(0x1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_2500
     * @tc.name testUint16ArrayIndexOfPart1_025
     * @tc.desc Verify searchElement 6.5535e4 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(6.5535e4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_2600
     * @tc.name testUint16ArrayIndexOfPart1_026
     * @tc.desc Verify searchElement 1e5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(1e5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_2700
     * @tc.name testUint16ArrayIndexOfPart1_027
     * @tc.desc Verify 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array();
      const result = arr.indexOf(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_2800
     * @tc.name testUint16ArrayIndexOfPart1_028
     * @tc.desc Verify 65535 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array();
      const result = arr.indexOf(65535);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_2900
     * @tc.name testUint16ArrayIndexOfPart1_029
     * @tc.desc Verify NaN -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array();
      const result = arr.indexOf(Number.NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_3000
     * @tc.name testUint16ArrayIndexOfPart1_030
     * @tc.desc Verify -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array();
      const result = arr.indexOf(-1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_3100
     * @tc.name testUint16ArrayIndexOfPart1_031
     * @tc.desc Verify [5] 5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5);
      const result = arr.indexOf(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_3200
     * @tc.name testUint16ArrayIndexOfPart1_032
     * @tc.desc Verify [5] 6 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5);
      const result = arr.indexOf(6);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_3300
     * @tc.name testUint16ArrayIndexOfPart1_033
     * @tc.desc Verify [5] 5.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5);
      const result = arr.indexOf(5.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_3400
     * @tc.name testUint16ArrayIndexOfPart1_034
     * @tc.desc Verify [0] 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0);
      const result = arr.indexOf(0);
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_3500
     * @tc.name testUint16ArrayIndexOfPart1_035
     * @tc.desc Verify [10, 20, 10, 30, 10] 10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_3600
     * @tc.name testUint16ArrayIndexOfPart1_036
     * @tc.desc Verify [10, 20, 10, 30, 10] 20 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_3700
     * @tc.name testUint16ArrayIndexOfPart1_037
     * @tc.desc Verify [10, 20, 10, 30, 10] 30 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(30);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_3800
     * @tc.name testUint16ArrayIndexOfPart1_038
     * @tc.desc Verify [10, 20, 10, 30, 10] 40 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(40);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_3900
     * @tc.name testUint16ArrayIndexOfPart1_039
     * @tc.desc Verify [7, 7, 7, 7, 7] 7 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(7, 7, 7, 7, 7);
      const result = arr.indexOf(7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_4000
     * @tc.name testUint16ArrayIndexOfPart1_040
     * @tc.desc Verify [7, 7, 7, 7, 7] 8 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(7, 7, 7, 7, 7);
      const result = arr.indexOf(8);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_4100
     * @tc.name testUint16ArrayIndexOfPart1_041
     * @tc.desc Verify [0, 65535, 0, 65535] 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535, 0, 65535);
      const result = arr.indexOf(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_4200
     * @tc.name testUint16ArrayIndexOfPart1_042
     * @tc.desc Verify [0, 65535, 0, 65535] 65535 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535, 0, 65535);
      const result = arr.indexOf(65535);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_4300
     * @tc.name testUint16ArrayIndexOfPart1_043
     * @tc.desc Verify fromIndex = 0 30 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_4400
     * @tc.name testUint16ArrayIndexOfPart1_044
     * @tc.desc Verify fromIndex = 2 30 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_4500
     * @tc.name testUint16ArrayIndexOfPart1_045
     * @tc.desc Verify fromIndex = 3 30 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, 3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_4600
     * @tc.name testUint16ArrayIndexOfPart1_046
     * @tc.desc Verify fromIndex = -1 30 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_4700
     * @tc.name testUint16ArrayIndexOfPart1_047
     * @tc.desc Verify fromIndex = -4 2 30 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, -4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_4800
     * @tc.name testUint16ArrayIndexOfPart1_048
     * @tc.desc Verify [10, 20, 10, 30, 10] fromIndex = 1 10 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(10, 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_4900
     * @tc.name testUint16ArrayIndexOfPart1_049
     * @tc.desc Verify [10, 20, 10, 30, 10] fromIndex = 3 10 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(10, 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_5000
     * @tc.name testUint16ArrayIndexOfPart1_050
     * @tc.desc Verify [10, 20, 10, 30, 10] fromIndex = -1 10 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(10, -1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_5100
     * @tc.name testUint16ArrayIndexOfPart1_051
     * @tc.desc Verify [10, 20, 10, 30, 10] fromIndex = -3 10 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(10, -3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_5200
     * @tc.name testUint16ArrayIndexOfPart1_052
     * @tc.desc Verify [10, 20, 30, 40, 50] fromIndex = 4 50 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(50, 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_5300
     * @tc.name testUint16ArrayIndexOfPart1_053
     * @tc.desc Verify [10, 20, 30, 40, 50] fromIndex = -1 50 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(50, -1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_5400
     * @tc.name testUint16ArrayIndexOfPart1_054
     * @tc.desc Verify [10, 20, 30, 40, 50] fromIndex = 5 50 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(50, 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_5500
     * @tc.name testUint16ArrayIndexOfPart1_055
     * @tc.desc Verify [10, 20, 30, 40, 50] fromIndex = -2 50 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(50, -2);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_5600
     * @tc.name testUint16ArrayIndexOfPart1_056
     * @tc.desc Verify [10, 20, 30, 40, 50] fromIndex = 0 50 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(50, 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_5700
     * @tc.name testUint16ArrayIndexOfPart1_057
     * @tc.desc Verify [1, 2, 3] fromIndex = 0 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.indexOf(1, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_5800
     * @tc.name testUint16ArrayIndexOfPart1_058
     * @tc.desc Verify [1, 2, 3] fromIndex = -100 0 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.indexOf(1, -100);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_5900
     * @tc.name testUint16ArrayIndexOfPart1_059
     * @tc.desc Verify [1, 2, 3] fromIndex = 1 1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.indexOf(1, 1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_6000
     * @tc.name testUint16ArrayIndexOfPart1_060
     * @tc.desc Verify fromIndex 2147483647 30 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, 2147483647);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_6100
     * @tc.name testUint16ArrayIndexOfPart1_061
     * @tc.desc Verify fromIndex -2147483648 0 30 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, -2147483648);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_6200
     * @tc.name testUint16ArrayIndexOfPart1_062
     * @tc.desc Verify 99 fromIndex = 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(99, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_6300
     * @tc.name testUint16ArrayIndexOfPart1_063
     * @tc.desc Verify 99 fromIndex = -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(99, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_6400
     * @tc.name testUint16ArrayIndexOfPart1_064
     * @tc.desc Verify 99 fromIndex = 100 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(99, 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_6500
     * @tc.name testUint16ArrayIndexOfPart1_065
     * @tc.desc Verify fromIndex 1.5 treated as 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(30, Double.toInt(1.5));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_6600
     * @tc.name testUint16ArrayIndexOfPart1_066
     * @tc.desc Verify fromIndex NaN treated as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(10, Double.toInt(Number.NaN));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_6700
     * @tc.name testUint16ArrayIndexOfPart1_067
     * @tc.desc Verify fromIndex Infinity treated as length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(50, Double.toInt(Number.POSITIVE_INFINITY));
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_6800
     * @tc.name testUint16ArrayIndexOfPart1_068
     * @tc.desc Verify fromIndex using arr.length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(50, arr.length - 1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_6900
     * @tc.name testUint16ArrayIndexOfPart1_069
     * @tc.desc Verify fromIndex 0o1 (octal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(20, 0o1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART1_7000
     * @tc.name testUint16ArrayIndexOfPart1_070
     * @tc.desc Verify fromIndex 0b10 (binary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart1_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(30, 0b10);
      expect(result).assertEqual(2);
    });
  });
}
