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

export default function uint16ArrayFindLastIndex01Test(): void {
  describe('Uint16ArrayFindLastIndex01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_0100
     * @tc.name testUint16ArrayFindLastIndex01_001
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_0200
     * @tc.name testUint16ArrayFindLastIndex01_002
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 10);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_0300
     * @tc.name testUint16ArrayFindLastIndex01_003
     * @tc.desc Verify findLastIndex 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 20, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 20);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_0400
     * @tc.name testUint16ArrayFindLastIndex01_004
     * @tc.desc Verify findLastIndex 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 20, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 10);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_0500
     * @tc.name testUint16ArrayFindLastIndex01_005
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 20, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_0600
     * @tc.name testUint16ArrayFindLastIndex01_006
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 10, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 10);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_0700
     * @tc.name testUint16ArrayFindLastIndex01_007
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_0800
     * @tc.name testUint16ArrayFindLastIndex01_008
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value !== 10);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_0900
     * @tc.name testUint16ArrayFindLastIndex01_009
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value !== 20);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_1000
     * @tc.name testUint16ArrayFindLastIndex01_010
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value !== 30);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_1100
     * @tc.name testUint16ArrayFindLastIndex01_011
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value !== 99);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_1200
     * @tc.name testUint16ArrayFindLastIndex01_012
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 10, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value !== 10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_1300
     * @tc.name testUint16ArrayFindLastIndex01_013
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 10 || value === 30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_1400
     * @tc.name testUint16ArrayFindLastIndex01_014
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 25);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_1500
     * @tc.name testUint16ArrayFindLastIndex01_015
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 30);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_1600
     * @tc.name testUint16ArrayFindLastIndex01_016
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value < 15);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_1700
     * @tc.name testUint16ArrayFindLastIndex01_017
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value < 25);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_1800
     * @tc.name testUint16ArrayFindLastIndex01_018
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value < 35);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_1900
     * @tc.name testUint16ArrayFindLastIndex01_019
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value < 10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_2000
     * @tc.name testUint16ArrayFindLastIndex01_020
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value >= 20);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_2100
     * @tc.name testUint16ArrayFindLastIndex01_021
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value >= 30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_2200
     * @tc.name testUint16ArrayFindLastIndex01_022
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value <= 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_2300
     * @tc.name testUint16ArrayFindLastIndex01_023
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value <= 20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_2400
     * @tc.name testUint16ArrayFindLastIndex01_024
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 10 && value < 30);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_2500
     * @tc.name testUint16ArrayFindLastIndex01_025
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value >= 15 && value <= 25);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_2600
     * @tc.name testUint16ArrayFindLastIndex01_026
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(5, 15, 25);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 10 && value < 20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_2700
     * @tc.name testUint16ArrayFindLastIndex01_027
     * @tc.desc Verify findLastIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 1, 2);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_2800
     * @tc.name testUint16ArrayFindLastIndex01_028
     * @tc.desc Verify findLastIndex 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 65535);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_2900
     * @tc.name testUint16ArrayFindLastIndex01_029
     * @tc.desc Verify findLastIndex 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 32768);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_3000
     * @tc.name testUint16ArrayFindLastIndex01_030
     * @tc.desc Verify findLastIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_3100
     * @tc.name testUint16ArrayFindLastIndex01_031
     * @tc.desc Verify findLastIndex 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 65535);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 65535);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_3200
     * @tc.name testUint16ArrayFindLastIndex01_032
     * @tc.desc Verify findLastIndex 0 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(65535, 0, 65535);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_3300
     * @tc.name testUint16ArrayFindLastIndex01_033
     * @tc.desc Verify findLastIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 0);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_3400
     * @tc.name testUint16ArrayFindLastIndex01_034
     * @tc.desc Verify findLastIndex 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(65535, 65535, 65535);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 65535);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_3500
     * @tc.name testUint16ArrayFindLastIndex01_035
     * @tc.desc Verify findLastIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_3600
     * @tc.name testUint16ArrayFindLastIndex01_036
     * @tc.desc Verify findLastIndex 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 0);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_3700
     * @tc.name testUint16ArrayFindLastIndex01_037
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 0);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value !== 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_3800
     * @tc.name testUint16ArrayFindLastIndex01_038
     * @tc.desc Verify findLastIndex 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value >= 32768);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_3900
     * @tc.name testUint16ArrayFindLastIndex01_039
     * @tc.desc Verify findLastIndex 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value <= 32768);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_4000
     * @tc.name testUint16ArrayFindLastIndex01_040
     * @tc.desc Verify findLastIndex 65535 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 65535);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_4100
     * @tc.name testUint16ArrayFindLastIndex01_041
     * @tc.desc Verify findLastIndex 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value < 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_4200
     * @tc.name testUint16ArrayFindLastIndex01_042
     * @tc.desc Verify findLastIndex 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_4300
     * @tc.name testUint16ArrayFindLastIndex01_043
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index === 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_4400
     * @tc.name testUint16ArrayFindLastIndex01_044
     * @tc.desc Verify findLastIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_4500
     * @tc.name testUint16ArrayFindLastIndex01_045
     * @tc.desc Verify findLastIndex 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index < 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_4600
     * @tc.name testUint16ArrayFindLastIndex01_046
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index % 2 === 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_4700
     * @tc.name testUint16ArrayFindLastIndex01_047
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index % 2 !== 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_4800
     * @tc.name testUint16ArrayFindLastIndex01_048
     * @tc.desc Verify findLastIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index >= 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_4900
     * @tc.name testUint16ArrayFindLastIndex01_049
     * @tc.desc Verify findLastIndex 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index < 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_5000
     * @tc.name testUint16ArrayFindLastIndex01_050
     * @tc.desc Verify findLastIndex array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array.length === 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_5100
     * @tc.name testUint16ArrayFindLastIndex01_051
     * @tc.desc Verify findLastIndex array -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array.length < 2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_5200
     * @tc.name testUint16ArrayFindLastIndex01_052
     * @tc.desc Verify findLastIndex array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array[0] === value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_5300
     * @tc.name testUint16ArrayFindLastIndex01_053
     * @tc.desc Verify findLastIndex array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array[0] < value);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_5400
     * @tc.name testUint16ArrayFindLastIndex01_054
     * @tc.desc Verify findLastIndex array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array[1] > value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_5500
     * @tc.name testUint16ArrayFindLastIndex01_055
     * @tc.desc Verify findLastIndex array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array[index] === value);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_5600
     * @tc.name testUint16ArrayFindLastIndex01_056
     * @tc.desc Verify findLastIndex array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array[0] + array[1] === value);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_5700
     * @tc.name testUint16ArrayFindLastIndex01_057
     * @tc.desc Verify findLastIndex array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array[1] + array[2] === value + 20);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_5800
     * @tc.name testUint16ArrayFindLastIndex01_058
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(2, 4, 6);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value % 2 === 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_5900
     * @tc.name testUint16ArrayFindLastIndex01_059
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 3, 5);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value % 2 === 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_6000
     * @tc.name testUint16ArrayFindLastIndex01_060
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value % 2 !== 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_6100
     * @tc.name testUint16ArrayFindLastIndex01_061
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value % 2 === 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_6200
     * @tc.name testUint16ArrayFindLastIndex01_062
     * @tc.desc Verify findLastIndex 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(5, 10, 15);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value % 5 === 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_6300
     * @tc.name testUint16ArrayFindLastIndex01_063
     * @tc.desc Verify findLastIndex 3 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(6, 12, 18);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value % 3 === 0 && value % 6 === 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_6400
     * @tc.name testUint16ArrayFindLastIndex01_064
     * @tc.desc Verify findLastIndex 10 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 21, 32);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value % 10 === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_6500
     * @tc.name testUint16ArrayFindLastIndex01_065
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value / 10 === 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_6600
     * @tc.name testUint16ArrayFindLastIndex01_066
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => true);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_6700
     * @tc.name testUint16ArrayFindLastIndex01_067
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => false);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_6800
     * @tc.name testUint16ArrayFindLastIndex01_068
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_6900
     * @tc.name testUint16ArrayFindLastIndex01_069
     * @tc.desc Verify findLastIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_7000
     * @tc.name testUint16ArrayFindLastIndex01_070
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_7100
     * @tc.name testUint16ArrayFindLastIndex01_071
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_7200
     * @tc.name testUint16ArrayFindLastIndex01_072
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 5);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_7300
     * @tc.name testUint16ArrayFindLastIndex01_073
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_7400
     * @tc.name testUint16ArrayFindLastIndex01_074
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 10);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLASTINDEX01_7500
     * @tc.name testUint16ArrayFindLastIndex01_075
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndex01_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 8);
      expect(result).assertEqual(9);
    });

  });
}
