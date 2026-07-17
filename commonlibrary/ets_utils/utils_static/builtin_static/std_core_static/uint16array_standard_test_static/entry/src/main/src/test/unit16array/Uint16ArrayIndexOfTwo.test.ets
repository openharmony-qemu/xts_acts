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

export default function uint16ArrayIndexOfPart2Test(): void {
  describe('Uint16ArrayIndexOfPart2Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_0100
     * @tc.name testUint16ArrayIndexOfPart2_001
     * @tc.desc Verify indexOf number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_0200
     * @tc.name testUint16ArrayIndexOfPart2_002
     * @tc.desc Verify indexOf number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_0300
     * @tc.name testUint16ArrayIndexOfPart2_003
     * @tc.desc Verify indexOf fromIndex number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(20, 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_0400
     * @tc.name testUint16ArrayIndexOfPart2_004
     * @tc.desc Verify indexOf fromIndex number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(30, -1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_0500
     * @tc.name testUint16ArrayIndexOfPart2_005
     * @tc.desc Verify indexOf number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([]);
      let result: int = arr.indexOf(10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_0600
     * @tc.name testUint16ArrayIndexOfPart2_006
     * @tc.desc Verify indexOf number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([42]);
      let result: int = arr.indexOf(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_0700
     * @tc.name testUint16ArrayIndexOfPart2_007
     * @tc.desc Verify indexOf number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([5, 5, 5]);
      let result: int = arr.indexOf(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_0800
     * @tc.name testUint16ArrayIndexOfPart2_008
     * @tc.desc Verify indexOf searchElement number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([255]);
      let result: int = arr.indexOf(0xFF);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_0900
     * @tc.name testUint16ArrayIndexOfPart2_009
     * @tc.desc Verify indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_1000
     * @tc.name testUint16ArrayIndexOfPart2_010
     * @tc.desc Verify indexOf 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_1100
     * @tc.name testUint16ArrayIndexOfPart2_011
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_1200
     * @tc.name testUint16ArrayIndexOfPart2_012
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(50);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_1300
     * @tc.name testUint16ArrayIndexOfPart2_013
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 20, 30, 20]);
      let result: int = arr.indexOf(20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_1400
     * @tc.name testUint16ArrayIndexOfPart2_014
     * @tc.desc Verify indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 100, 200]);
      let result: int = arr.indexOf(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_1500
     * @tc.name testUint16ArrayIndexOfPart2_015
     * @tc.desc Verify indexOf 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([65535, 100, 200]);
      let result: int = arr.indexOf(65535);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_1600
     * @tc.name testUint16ArrayIndexOfPart2_016
     * @tc.desc Verify indexOf 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([32768, 100, 200]);
      let result: int = arr.indexOf(32768);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_1700
     * @tc.name testUint16ArrayIndexOfPart2_017
     * @tc.desc Verify indexOf 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([65535, 100, 200]);
      let result: int = arr.indexOf(0xFFFF);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_1800
     * @tc.name testUint16ArrayIndexOfPart2_018
     * @tc.desc Verify indexOf 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(0b1010);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_1900
     * @tc.name testUint16ArrayIndexOfPart2_019
     * @tc.desc Verify indexOf 0o77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([63, 100, 200]);
      let result: int = arr.indexOf(0o77);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_2000
     * @tc.name testUint16ArrayIndexOfPart2_020
     * @tc.desc Verify indexOf 1e4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10000, 200, 300]);
      let result: int = arr.indexOf(1e4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_2100
     * @tc.name testUint16ArrayIndexOfPart2_021
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([42]);
      let result: int = arr.indexOf(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_2200
     * @tc.name testUint16ArrayIndexOfPart2_022
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([7, 7, 7, 7]);
      let result: int = arr.indexOf(7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_2300
     * @tc.name testUint16ArrayIndexOfPart2_023
     * @tc.desc Verify indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_2400
     * @tc.name testUint16ArrayIndexOfPart2_024
     * @tc.desc Verify indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([]);
      let result: int = arr.indexOf(10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_2500
     * @tc.name testUint16ArrayIndexOfPart2_025
     * @tc.desc Verify indexOf NaN -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(Number.NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_2600
     * @tc.name testUint16ArrayIndexOfPart2_026
     * @tc.desc Verify indexOf Infinity -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_2700
     * @tc.name testUint16ArrayIndexOfPart2_027
     * @tc.desc Verify indexOf -Infinity -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(-Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_2800
     * @tc.name testUint16ArrayIndexOfPart2_028
     * @tc.desc Verify indexOf 3.14 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([3, 5, 7]);
      let result: int = arr.indexOf(3.14);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_2900
     * @tc.name testUint16ArrayIndexOfPart2_029
     * @tc.desc Verify indexOf -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(-1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_3000
     * @tc.name testUint16ArrayIndexOfPart2_030
     * @tc.desc Verify indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([42]);
      let result: int = arr.indexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_3100
     * @tc.name testUint16ArrayIndexOfPart2_031
     * @tc.desc Verify indexOf 65535.9 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([65535, 100, 200]);
      let result: int = arr.indexOf(65535.9);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_3200
     * @tc.name testUint16ArrayIndexOfPart2_032
     * @tc.desc Verify indexOf fromIndex=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(20, 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_3300
     * @tc.name testUint16ArrayIndexOfPart2_033
     * @tc.desc Verify indexOf fromIndex=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(20, 2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_3400
     * @tc.name testUint16ArrayIndexOfPart2_034
     * @tc.desc Verify indexOf fromIndex=3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([5, 10, 15, 20, 25]);
      let result: int = arr.indexOf(15, 3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_3500
     * @tc.name testUint16ArrayIndexOfPart2_035
     * @tc.desc Verify indexOf fromIndex=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40]);
      let result: int = arr.indexOf(40, -1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_3600
     * @tc.name testUint16ArrayIndexOfPart2_036
     * @tc.desc Verify indexOf fromIndex=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(20, -2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_3700
     * @tc.name testUint16ArrayIndexOfPart2_037
     * @tc.desc Verify indexOf fromIndex=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(10, -5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_3800
     * @tc.name testUint16ArrayIndexOfPart2_038
     * @tc.desc Verify indexOf fromIndex=-length-1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(10, -6);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_3900
     * @tc.name testUint16ArrayIndexOfPart2_039
     * @tc.desc Verify indexOf fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(10, 3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_4000
     * @tc.name testUint16ArrayIndexOfPart2_040
     * @tc.desc Verify indexOf fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(10, 10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_4100
     * @tc.name testUint16ArrayIndexOfPart2_041
     * @tc.desc Verify indexOf fromIndex=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(50, 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_4200
     * @tc.name testUint16ArrayIndexOfPart2_042
     * @tc.desc Verify indexOf fromIndex 0x1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(20, 0x1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_4300
     * @tc.name testUint16ArrayIndexOfPart2_043
     * @tc.desc Verify indexOf fromIndex 0b10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(20, 0b10);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_4400
     * @tc.name testUint16ArrayIndexOfPart2_044
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let lenBefore: int = arr.length;
      arr.indexOf(20);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_4500
     * @tc.name testUint16ArrayIndexOfPart2_045
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let lenBefore: int = arr.length;
      arr.indexOf(99);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_4600
     * @tc.name testUint16ArrayIndexOfPart2_046
     * @tc.desc Verify indexOf fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let lenBefore: int = arr.length;
      arr.indexOf(20, 1);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_4700
     * @tc.name testUint16ArrayIndexOfPart2_047
     * @tc.desc Verify indexOf fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let lenBefore: int = arr.length;
      arr.indexOf(30, -1);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_4800
     * @tc.name testUint16ArrayIndexOfPart2_048
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([]);
      let lenBefore: int = arr.length;
      arr.indexOf(10);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_4900
     * @tc.name testUint16ArrayIndexOfPart2_049
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([5, 5, 5]);
      let lenBefore: int = arr.length;
      arr.indexOf(5);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_5000
     * @tc.name testUint16ArrayIndexOfPart2_050
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([42]);
      let lenBefore: int = arr.length;
      arr.indexOf(42);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_5100
     * @tc.name testUint16ArrayIndexOfPart2_051
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let lenBefore: int = arr.length;
      arr.indexOf(20);
      arr.indexOf(10, 1);
      arr.indexOf(99);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_5200
     * @tc.name testUint16ArrayIndexOfPart2_052
     * @tc.desc Verify indexOf arr[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let v0: number = arr[0];
      arr.indexOf(20);
      expect(arr.at(0)).assertEqual(v0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_5300
     * @tc.name testUint16ArrayIndexOfPart2_053
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([]);
      arr.indexOf(10);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_5400
     * @tc.name testUint16ArrayIndexOfPart2_054
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr.indexOf(20);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_5500
     * @tc.name testUint16ArrayIndexOfPart2_055
     * @tc.desc Verify indexOf buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let bufLenBefore: int = arr.buffer.byteLength;
      arr.indexOf(20);
      expect(arr.buffer.byteLength).assertEqual(bufLenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_5600
     * @tc.name testUint16ArrayIndexOfPart2_056
     * @tc.desc Verify indexOf arr.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let blBefore: int = arr.byteLength;
      arr.indexOf(20);
      expect(arr.byteLength).assertEqual(blBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_5700
     * @tc.name testUint16ArrayIndexOfPart2_057
     * @tc.desc Verify indexOf arr.byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let boBefore: int = arr.byteOffset;
      arr.indexOf(20);
      expect(arr.byteOffset).assertEqual(boBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_5800
     * @tc.name testUint16ArrayIndexOfPart2_058
     * @tc.desc Verify indexOf arr.BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let bpeBefore: int = arr.BYTES_PER_ELEMENT;
      arr.indexOf(20);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(bpeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_5900
     * @tc.name testUint16ArrayIndexOfPart2_059
     * @tc.desc Verify indexOf buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let buf: ArrayBuffer = arr.buffer;
      let view: Uint16Array = new Uint16Array(buf);
      arr.indexOf(20);
      expect(view.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_6000
     * @tc.name testUint16ArrayIndexOfPart2_060
     * @tc.desc Verify indexOf buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let buf: ArrayBuffer = arr.buffer;
      let view: Uint16Array = new Uint16Array(buf);
      arr.indexOf(20);
      expect(view.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_6100
     * @tc.name testUint16ArrayIndexOfPart2_061
     * @tc.desc Verify indexOf buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let buf: ArrayBuffer = arr.buffer;
      let view: Uint16Array = new Uint16Array(buf);
      arr.indexOf(20);
      arr.indexOf(10, 1);
      arr.indexOf(99);
      expect(view.at(0)).assertEqual(10);
      expect(view.at(1)).assertEqual(20);
      expect(view.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_6200
     * @tc.name testUint16ArrayIndexOfPart2_062
     * @tc.desc Verify indexOf arr.byteLength length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr.indexOf(20);
      expect(arr.byteLength).assertEqual(arr.length * arr.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_6300
     * @tc.name testUint16ArrayIndexOfPart2_063
     * @tc.desc Verify indexOf arr.buffer instanceof ArrayBuffer true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr.indexOf(20);
      expect(arr.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_6400
     * @tc.name testUint16ArrayIndexOfPart2_064
     * @tc.desc Verify indexOf fromIndex 0o10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(20, 0o10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_6500
     * @tc.name testUint16ArrayIndexOfPart2_065
     * @tc.desc Verify indexOf fromIndex 1e0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(20, 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_6600
     * @tc.name testUint16ArrayIndexOfPart2_066
     * @tc.desc Verify indexOf fromIndex 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(30, Double.toInt(1.5));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_6700
     * @tc.name testUint16ArrayIndexOfPart2_067
     * @tc.desc Verify indexOf fromIndex NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(10, Double.toInt(Number.NaN));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_6800
     * @tc.name testUint16ArrayIndexOfPart2_068
     * @tc.desc Verify indexOf fromIndex Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(50, Double.toInt(Number.POSITIVE_INFINITY));
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_6900
     * @tc.name testUint16ArrayIndexOfPart2_069
     * @tc.desc Verify indexOf fromIndex arr.length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(50, arr.length - 1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_7000
     * @tc.name testUint16ArrayIndexOfPart2_070
     * @tc.desc Verify indexOf fromIndex arr.byteLength/2-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(50, arr.byteLength / 2 - 1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_7100
     * @tc.name testUint16ArrayIndexOfPart2_071
     * @tc.desc Verify indexOf observes a value written through an alias
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let arr: Uint16Array = new Uint16Array(buffer);
            let alias: Uint16Array = new Uint16Array(buffer);
            alias[2] = 50;
            expect(arr.indexOf(50)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_7200
     * @tc.name testUint16ArrayIndexOfPart2_072
     * @tc.desc Verify indexOf offset view reports a view-relative first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(9, 4, 5, 4);
            let view: Uint16Array = new Uint16Array(all.buffer, 2, 3);
            expect(view.indexOf(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_7300
     * @tc.name testUint16ArrayIndexOfPart2_073
     * @tc.desc Verify indexOf offset view excludes a match before its range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(9, 1, 2);
            let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
            expect(view.indexOf(9)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_7400
     * @tc.name testUint16ArrayIndexOfPart2_074
     * @tc.desc Verify indexOf alias replacement changes the first matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let arr: Uint16Array = new Uint16Array(buffer);
            arr.set([7, 7, 7]);
            let alias: Uint16Array = new Uint16Array(buffer);
            alias[0] = 6;
            expect(arr.indexOf(7)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEXOF_PART2_7500
     * @tc.name testUint16ArrayIndexOfPart2_075
     * @tc.desc Verify indexOf applies fromIndex and returns an index relative to a nonzero-offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfPart2_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(9, 7, 8, 7, 9);
      let view: Uint16Array = new Uint16Array(backing.buffer, 2, 3);
      expect(view.indexOf(7, 1)).assertEqual(2);
    });

  });
}
