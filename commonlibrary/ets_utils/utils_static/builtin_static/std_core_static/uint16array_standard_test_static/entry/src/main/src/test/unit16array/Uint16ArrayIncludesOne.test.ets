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

export default function uint16ArrayIncludesPart1Test(): void {
  describe('Uint16ArrayIncludesPart1Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_0100
     * @tc.name testUint16ArrayIncludesPart1_001
     * @tc.desc Verify includes searchElement fromIndex 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.includes(20, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_0200
     * @tc.name testUint16ArrayIncludesPart1_002
     * @tc.desc Verify searchElement 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_0300
     * @tc.name testUint16ArrayIncludesPart1_003
     * @tc.desc Verify searchElement 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(65535);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_0400
     * @tc.name testUint16ArrayIncludesPart1_004
     * @tc.desc Verify searchElement 3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_0500
     * @tc.name testUint16ArrayIncludesPart1_005
     * @tc.desc Verify searchElement 32768 0x8000 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(32768);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_0600
     * @tc.name testUint16ArrayIncludesPart1_006
     * @tc.desc Verify searchElement 10000 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(10000);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_0700
     * @tc.name testUint16ArrayIncludesPart1_007
     * @tc.desc Verify searchElement 0x0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0x0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_0800
     * @tc.name testUint16ArrayIncludesPart1_008
     * @tc.desc Verify searchElement 0xFFFF 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0xFFFF);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_0900
     * @tc.name testUint16ArrayIncludesPart1_009
     * @tc.desc Verify searchElement 0x8000 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0x8000);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_1000
     * @tc.name testUint16ArrayIncludesPart1_010
     * @tc.desc Verify searchElement 0x2710 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0x2710);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_1100
     * @tc.name testUint16ArrayIncludesPart1_011
     * @tc.desc Verify searchElement 0b0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0b0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_1200
     * @tc.name testUint16ArrayIncludesPart1_012
     * @tc.desc Verify searchElement 0b1111111111111111 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0b1111111111111111);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_1300
     * @tc.name testUint16ArrayIncludesPart1_013
     * @tc.desc Verify searchElement 0o0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0o0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_1400
     * @tc.name testUint16ArrayIncludesPart1_014
     * @tc.desc Verify searchElement 0o177777 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0o177777);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_1500
     * @tc.name testUint16ArrayIncludesPart1_015
     * @tc.desc Verify searchElement 1e4 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(1e4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_1600
     * @tc.name testUint16ArrayIncludesPart1_016
     * @tc.desc Verify searchElement 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_1700
     * @tc.name testUint16ArrayIncludesPart1_017
     * @tc.desc Verify searchElement 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_1800
     * @tc.name testUint16ArrayIncludesPart1_018
     * @tc.desc Verify searchElement 65534 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(65534);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_1900
     * @tc.name testUint16ArrayIncludesPart1_019
     * @tc.desc Verify searchElement 32769 32769
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(32769);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_2000
     * @tc.name testUint16ArrayIncludesPart1_020
     * @tc.desc Verify searchElement 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(3.14);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_2100
     * @tc.name testUint16ArrayIncludesPart1_021
     * @tc.desc Verify searchElement 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(65535.9);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_2200
     * @tc.name testUint16ArrayIncludesPart1_022
     * @tc.desc Verify searchElement 0x10001 65537
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(0x10001);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_2300
     * @tc.name testUint16ArrayIncludesPart1_023
     * @tc.desc Verify searchElement 1e5 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(1e5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_2400
     * @tc.name testUint16ArrayIncludesPart1_024
     * @tc.desc Verify searchElement NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(Number.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_2500
     * @tc.name testUint16ArrayIncludesPart1_025
     * @tc.desc Verify searchElement Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(Number.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_2600
     * @tc.name testUint16ArrayIncludesPart1_026
     * @tc.desc Verify searchElement -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(-Number.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_2700
     * @tc.name testUint16ArrayIncludesPart1_027
     * @tc.desc Verify searchElement 9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(9007199254740991);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_2800
     * @tc.name testUint16ArrayIncludesPart1_028
     * @tc.desc Verify searchElement 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(5e-324);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_2900
     * @tc.name testUint16ArrayIncludesPart1_029
     * @tc.desc Verify searchElement -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 3, 10000, 32768, 65535);
      const result = arr.includes(-0.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_3000
     * @tc.name testUint16ArrayIncludesPart1_030
     * @tc.desc Verify fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_3100
     * @tc.name testUint16ArrayIncludesPart1_031
     * @tc.desc Verify fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(99, 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_3200
     * @tc.name testUint16ArrayIncludesPart1_032
     * @tc.desc Verify fromIndex 1 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_3300
     * @tc.name testUint16ArrayIncludesPart1_033
     * @tc.desc Verify fromIndex 1 1 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(20, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_3400
     * @tc.name testUint16ArrayIncludesPart1_034
     * @tc.desc Verify fromIndex 2 2 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(30, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_3500
     * @tc.name testUint16ArrayIncludesPart1_035
     * @tc.desc Verify fromIndex 3 3 30 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(30, 3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_3600
     * @tc.name testUint16ArrayIncludesPart1_036
     * @tc.desc Verify fromIndex 4 4 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(50, 4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_3700
     * @tc.name testUint16ArrayIncludesPart1_037
     * @tc.desc Verify fromIndex -1 4 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(50, -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_3800
     * @tc.name testUint16ArrayIncludesPart1_038
     * @tc.desc Verify fromIndex -2 3 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(40, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_3900
     * @tc.name testUint16ArrayIncludesPart1_039
     * @tc.desc Verify fromIndex -3 2 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(30, -3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_4000
     * @tc.name testUint16ArrayIncludesPart1_040
     * @tc.desc Verify fromIndex -5 0 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, -5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_4100
     * @tc.name testUint16ArrayIncludesPart1_041
     * @tc.desc Verify fromIndex -1 40 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(40, -1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_4200
     * @tc.name testUint16ArrayIncludesPart1_042
     * @tc.desc Verify fromIndex -2 3 50 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(50, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_4300
     * @tc.name testUint16ArrayIncludesPart1_043
     * @tc.desc Verify fromIndex -4 1 10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, -4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_4400
     * @tc.name testUint16ArrayIncludesPart1_044
     * @tc.desc Verify fromIndex -4 1 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(20, -4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_4500
     * @tc.name testUint16ArrayIncludesPart1_045
     * @tc.desc Verify fromIndex -3 2 10 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, -3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_4600
     * @tc.name testUint16ArrayIncludesPart1_046
     * @tc.desc Verify fromIndex -2 3 30 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(30, -2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_4700
     * @tc.name testUint16ArrayIncludesPart1_047
     * @tc.desc Verify fromIndex -1 4 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(30, -1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_4800
     * @tc.name testUint16ArrayIncludesPart1_048
     * @tc.desc Verify fromIndex 5 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_4900
     * @tc.name testUint16ArrayIncludesPart1_049
     * @tc.desc Verify fromIndex 6 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, 6);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_5000
     * @tc.name testUint16ArrayIncludesPart1_050
     * @tc.desc Verify fromIndex 100 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_5100
     * @tc.name testUint16ArrayIncludesPart1_051
     * @tc.desc Verify fromIndex -10 0 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, -10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_5200
     * @tc.name testUint16ArrayIncludesPart1_052
     * @tc.desc Verify fromIndex -100 0 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, -100);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_5300
     * @tc.name testUint16ArrayIncludesPart1_053
     * @tc.desc Verify fromIndex -6 0 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, -6);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_5400
     * @tc.name testUint16ArrayIncludesPart1_054
     * @tc.desc Verify fromIndex -0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(10, -0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_5500
     * @tc.name testUint16ArrayIncludesPart1_055
     * @tc.desc Verify includes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const empty = new Uint16Array();
      const result = empty.includes(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_5600
     * @tc.name testUint16ArrayIncludesPart1_056
     * @tc.desc Verify includes fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const empty = new Uint16Array();
      const result = empty.includes(0, 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_5700
     * @tc.name testUint16ArrayIncludesPart1_057
     * @tc.desc Verify true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const single = Uint16Array.of(42);
      const result = single.includes(42);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_5800
     * @tc.name testUint16ArrayIncludesPart1_058
     * @tc.desc Verify false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const single = Uint16Array.of(42);
      const result = single.includes(99);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_5900
     * @tc.name testUint16ArrayIncludesPart1_059
     * @tc.desc Verify 0 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zeros = Uint16Array.of(0, 0, 0, 0, 0);
      const result = zeros.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_6000
     * @tc.name testUint16ArrayIncludesPart1_060
     * @tc.desc Verify 0 1 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zeros = Uint16Array.of(0, 0, 0, 0, 0);
      const result = zeros.includes(0, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_6100
     * @tc.name testUint16ArrayIncludesPart1_061
     * @tc.desc Verify 0 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zeros = Uint16Array.of(0, 0, 0, 0, 0);
      const result = zeros.includes(0, 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_6200
     * @tc.name testUint16ArrayIncludesPart1_062
     * @tc.desc Verify [0, 65535] 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const boundArr = Uint16Array.of(0, 65535);
      const result = boundArr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_6300
     * @tc.name testUint16ArrayIncludesPart1_063
     * @tc.desc Verify [0, 65535] 65535 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const boundArr = Uint16Array.of(0, 65535);
      const result = boundArr.includes(65535);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_6400
     * @tc.name testUint16ArrayIncludesPart1_064
     * @tc.desc Verify 0 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const boundArr = Uint16Array.of(0, 65535);
      const result = boundArr.includes(0, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_6500
     * @tc.name testUint16ArrayIncludesPart1_065
     * @tc.desc Verify 1 65535 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const boundArr = Uint16Array.of(0, 65535);
      const result = boundArr.includes(65535, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_6600
     * @tc.name testUint16ArrayIncludesPart1_066
     * @tc.desc Verify 2 65535 fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const boundArr = Uint16Array.of(0, 65535);
      const result = boundArr.includes(65535, 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_6700
     * @tc.name testUint16ArrayIncludesPart1_067
     * @tc.desc Verify 1 0 1 0 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const boundArr = Uint16Array.of(0, 65535);
      const result = boundArr.includes(0, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_6800
     * @tc.name testUint16ArrayIncludesPart1_068
     * @tc.desc Verify 0x7FFF 32767 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535);
      const result = arr.includes(0x7FFF);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_6900
     * @tc.name testUint16ArrayIncludesPart1_069
     * @tc.desc Verify fromIndex 1.5 treated as 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.includes(20, Double.toInt(1.5));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_7000
     * @tc.name testUint16ArrayIncludesPart1_070
     * @tc.desc Verify fromIndex NaN treated as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.includes(10, Double.toInt(Number.NaN));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_7100
     * @tc.name testUint16ArrayIncludesPart1_071
     * @tc.desc Verify fromIndex Infinity treated as length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.includes(20, Double.toInt(Number.POSITIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_7200
     * @tc.name testUint16ArrayIncludesPart1_072
     * @tc.desc Verify fromIndex using arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.includes(50, arr.length - 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_7300
     * @tc.name testUint16ArrayIncludesPart1_073
     * @tc.desc Verify fromIndex using arr.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.includes(20, arr.byteLength / 2 - 1);
      expect(arr.includes(30, arr.byteLength / 2 - 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_7400
     * @tc.name testUint16ArrayIncludesPart1_074
     * @tc.desc Verify fromIndex 0o1 (octal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.includes(20, 0o1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART1_7500
     * @tc.name testUint16ArrayIncludesPart1_075
     * @tc.desc Verify fromIndex 0b10 (binary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart1_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      const result = arr.includes(30, 0b10);
      expect(result).assertTrue();
    });
  });
}
