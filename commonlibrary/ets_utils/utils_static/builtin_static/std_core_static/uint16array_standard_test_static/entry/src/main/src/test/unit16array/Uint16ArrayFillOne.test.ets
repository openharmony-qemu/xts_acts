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

export default function uint16ArrayFill101Test(): void {
  describe('Uint16ArrayFill101Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_0100
     * @tc.name testUint16ArrayFill101_001
     * @tc.desc Verify value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(1, 0, 3);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_0200
     * @tc.name testUint16ArrayFill101_002
     * @tc.desc Verify value 0x7FFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(0x7FFF, 0, 3);
      expect(arr.at(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_0300
     * @tc.name testUint16ArrayFill101_003
     * @tc.desc Verify value 0x8001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(0x8001, 0, 3);
      expect(arr.at(0)).assertEqual(32769);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_0400
     * @tc.name testUint16ArrayFill101_004
     * @tc.desc Verify value 1e4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(1e4, 0, 3);
      expect(arr.at(0)).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_0500
     * @tc.name testUint16ArrayFill101_005
     * @tc.desc Verify value 65537 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(65537, 0, 3);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_0600
     * @tc.name testUint16ArrayFill101_006
     * @tc.desc Verify value 0x1FFFF 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(0x1FFFF, 0, 3);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_0700
     * @tc.name testUint16ArrayFill101_007
     * @tc.desc Verify value 0x10001 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(0x10001, 0, 3);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_0800
     * @tc.name testUint16ArrayFill101_008
     * @tc.desc Verify value -2 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-2, 0, 3);
      expect(arr.at(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_0900
     * @tc.name testUint16ArrayFill101_009
     * @tc.desc Verify value -32768 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-32768, 0, 3);
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_1000
     * @tc.name testUint16ArrayFill101_010
     * @tc.desc Verify value -65535 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-65535, 0, 3);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_1100
     * @tc.name testUint16ArrayFill101_011
     * @tc.desc Verify value -0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-0.5, 0, 3);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_1200
     * @tc.name testUint16ArrayFill101_012
     * @tc.desc Verify value 0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(0.5, 0, 3);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_1300
     * @tc.name testUint16ArrayFill101_013
     * @tc.desc Verify value 1.5 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(1.5, 0, 3);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_1400
     * @tc.name testUint16ArrayFill101_014
     * @tc.desc Verify value 0xFFFFFFFF 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(0xFFFFFFFF, 0, 3);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_1500
     * @tc.name testUint16ArrayFill101_015
     * @tc.desc Verify start 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 2);
      expect(arr.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_1600
     * @tc.name testUint16ArrayFill101_016
     * @tc.desc Verify start 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 2, 4);
      expect(arr.at(2)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_1700
     * @tc.name testUint16ArrayFill101_017
     * @tc.desc Verify start 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 4, 5);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_1800
     * @tc.name testUint16ArrayFill101_018
     * @tc.desc Verify start 5 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 5, 5);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_1900
     * @tc.name testUint16ArrayFill101_019
     * @tc.desc Verify start 10 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 10, 10);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_2000
     * @tc.name testUint16ArrayFill101_020
     * @tc.desc Verify start -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -1, 5);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_2100
     * @tc.name testUint16ArrayFill101_021
     * @tc.desc Verify start -3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -3, 5);
      expect(arr.at(2)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_2200
     * @tc.name testUint16ArrayFill101_022
     * @tc.desc Verify start -5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -5, 3);
      expect(arr.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_2300
     * @tc.name testUint16ArrayFill101_023
     * @tc.desc Verify start -10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -10, 3);
      expect(arr.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_2400
     * @tc.name testUint16ArrayFill101_024
     * @tc.desc Verify end 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 1);
      expect(arr.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_2500
     * @tc.name testUint16ArrayFill101_025
     * @tc.desc Verify end 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 2);
      expect(arr.at(1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_2600
     * @tc.name testUint16ArrayFill101_026
     * @tc.desc Verify end 4 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 4);
      expect(arr.at(3)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_2700
     * @tc.name testUint16ArrayFill101_027
     * @tc.desc Verify end 5 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 5);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_2800
     * @tc.name testUint16ArrayFill101_028
     * @tc.desc Verify end 10 length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 10);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_2900
     * @tc.name testUint16ArrayFill101_029
     * @tc.desc Verify end 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 0);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_3000
     * @tc.name testUint16ArrayFill101_030
     * @tc.desc Verify end -1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, -1);
      expect(arr.at(3)).assertEqual(42);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_3100
     * @tc.name testUint16ArrayFill101_031
     * @tc.desc Verify end -3 length-3=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, -3);
      expect(arr.at(1)).assertEqual(42);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_3200
     * @tc.name testUint16ArrayFill101_032
     * @tc.desc Verify end -5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, -5);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_3300
     * @tc.name testUint16ArrayFill101_033
     * @tc.desc Verify end -10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, -10);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_3400
     * @tc.name testUint16ArrayFill101_034
     * @tc.desc Verify start=1, end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 1, 3);
      expect(arr.at(1)).assertEqual(42);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_3500
     * @tc.name testUint16ArrayFill101_035
     * @tc.desc Verify start=2, end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 2, 4);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(3)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_3600
     * @tc.name testUint16ArrayFill101_036
     * @tc.desc Verify start=3, end=1 start > end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 3, 1);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_3700
     * @tc.name testUint16ArrayFill101_037
     * @tc.desc Verify start=-3, end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -3, -1);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(3)).assertEqual(42);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_3800
     * @tc.name testUint16ArrayFill101_038
     * @tc.desc Verify start=-5, end=-2 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -5, -2);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_3900
     * @tc.name testUint16ArrayFill101_039
     * @tc.desc Verify start=2, end=-1 start end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 2, -1);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(3)).assertEqual(42);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_4000
     * @tc.name testUint16ArrayFill101_040
     * @tc.desc Verify start=-3, end=4 start end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -3, 4);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(3)).assertEqual(42);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_4100
     * @tc.name testUint16ArrayFill101_041
     * @tc.desc Verify start=0, end=-3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, -3);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(1)).assertEqual(42);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_4200
     * @tc.name testUint16ArrayFill101_042
     * @tc.desc Verify start=-2, end=0 start end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -2, 0);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_4300
     * @tc.name testUint16ArrayFill101_043
     * @tc.desc Verify start=0, end=100 end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 100);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_4400
     * @tc.name testUint16ArrayFill101_044
     * @tc.desc Verify fill this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      const result: Uint16Array = arr.fill(42);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_4500
     * @tc.name testUint16ArrayFill101_045
     * @tc.desc Verify fill arr.fill(10).fill(20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(10, 0, 5).fill(20, 0, 3);
      expect(arr.at(0)).assertEqual(20);
      expect(arr.at(3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_4600
     * @tc.name testUint16ArrayFill101_046
     * @tc.desc Verify fill arr.fill(5).fill(10).fill(15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(5, 0, 2).fill(10, 2, 4).fill(15, 4, 5);
      expect(arr.at(0)).assertEqual(5);
      expect(arr.at(2)).assertEqual(10);
      expect(arr.at(4)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_4700
     * @tc.name testUint16ArrayFill101_047
     * @tc.desc Verify fill Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      const result: Uint16Array = arr.fill(42, 1, 3);
      expect(result instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_4800
     * @tc.name testUint16ArrayFill101_048
     * @tc.desc Verify fill this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      const result: Uint16Array = arr.fill(42);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_4900
     * @tc.name testUint16ArrayFill101_049
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array();
      arr.fill(42);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_5000
     * @tc.name testUint16ArrayFill101_050
     * @tc.desc Verify fill start=end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 2, 2);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_5100
     * @tc.name testUint16ArrayFill101_051
     * @tc.desc Verify fill start > end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 4, 2);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_5200
     * @tc.name testUint16ArrayFill101_052
     * @tc.desc Verify value=65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(65536, 0, 3);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_5300
     * @tc.name testUint16ArrayFill101_053
     * @tc.desc Verify value=-1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-1, 0, 3);
      expect(arr.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_5400
     * @tc.name testUint16ArrayFill101_054
     * @tc.desc Verify value=3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(3.14, 0, 3);
      expect(arr.at(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_5500
     * @tc.name testUint16ArrayFill101_055
     * @tc.desc Verify value=NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(Number.NaN, 0, 3);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_5600
     * @tc.name testUint16ArrayFill101_056
     * @tc.desc Verify value=Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(Number.POSITIVE_INFINITY, 0, 3);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_5700
     * @tc.name testUint16ArrayFill101_057
     * @tc.desc Verify value=-Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-Number.POSITIVE_INFINITY, 0, 3);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_5800
     * @tc.name testUint16ArrayFill101_058
     * @tc.desc Verify value=65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(65535.9, 0, 3);
      expect(arr.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_5900
     * @tc.name testUint16ArrayFill101_059
     * @tc.desc Verify value=0x10000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(0x10000, 0, 3);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_6000
     * @tc.name testUint16ArrayFill101_060
     * @tc.desc Verify value=0xFFFF 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(0xFFFF, 0, 3);
      expect(arr.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_6100
     * @tc.name testUint16ArrayFill101_061
     * @tc.desc Verify value=-0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-0.5, 0, 3);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_6200
     * @tc.name testUint16ArrayFill101_062
     * @tc.desc Verify value=131072 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(131072, 0, 3);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_6300
     * @tc.name testUint16ArrayFill101_063
     * @tc.desc Verify value=-65535 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-65535, 0, 3);
      expect(arr.at(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_6400
     * @tc.name testUint16ArrayFill101_064
     * @tc.desc Verify value=2.999 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(2.999, 0, 3);
      expect(arr.at(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_6500
     * @tc.name testUint16ArrayFill101_065
     * @tc.desc Verify value=-2.999 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-2.999, 0, 3);
      expect(arr.at(1)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_6600
     * @tc.name testUint16ArrayFill101_066
     * @tc.desc Verify value=3.0 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(3.0, 0, 3);
      expect(arr.at(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_6700
     * @tc.name testUint16ArrayFill101_067
     * @tc.desc Verify value=0xABCD 43981
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(0xABCD, 0, 3);
      expect(arr.at(0)).assertEqual(43981);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_6800
     * @tc.name testUint16ArrayFill101_068
     * @tc.desc Verify 1 fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(1);
      arr.fill(99);
      expect(arr.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_6900
     * @tc.name testUint16ArrayFill101_069
     * @tc.desc Verify 2 fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(2);
      arr.fill(77);
      expect(arr.at(0)).assertEqual(77);
      expect(arr.at(1)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_7000
     * @tc.name testUint16ArrayFill101_070
     * @tc.desc Verify 10 fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(10);
      arr.fill(55);
      expect(arr.at(9)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_7100
     * @tc.name testUint16ArrayFill101_071
     * @tc.desc Verify 10 fill start=0, end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(10);
      arr.fill(55, 0, 3);
      expect(arr.at(0)).assertEqual(55);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_7200
     * @tc.name testUint16ArrayFill101_072
     * @tc.desc Verify fill(value) on array with initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      const result: Uint16Array = arr.fill(999);
      expect(result).assertEqual(arr);
      expect(arr.at(0)).assertEqual(999);
      expect(arr.at(4)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_7300
     * @tc.name testUint16ArrayFill101_073
     * @tc.desc Verify fill starts at Double.toInt(1.999) and fills through the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(888, Double.toInt(1.999));
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(888);
      expect(arr.at(4)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_7400
     * @tc.name testUint16ArrayFill101_074
     * @tc.desc Verify fill ends at Double.toInt(3.14) and leaves later elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(777, 0, Double.toInt(3.14));
      expect(arr.at(0)).assertEqual(777);
      expect(arr.at(2)).assertEqual(777);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_7500
     * @tc.name testUint16ArrayFill101_075
     * @tc.desc Verify fill with very large value (mod 65536) in middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536 + 1234, 1, 4);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(1234);
      expect(arr.at(3)).assertEqual(1234);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_7600
     * @tc.name testUint16ArrayFill101_076
     * @tc.desc Verify fill with negative value (mod 65536) on full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(3);
      arr.fill(-1000);
      expect(arr.at(0)).assertEqual(65536 - 1000);
      expect(arr.at(1)).assertEqual(65536 - 1000);
      expect(arr.at(2)).assertEqual(65536 - 1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL101_7700
     * @tc.name testUint16ArrayFill101_077
     * @tc.desc Verify fill with negative start and end (wrap)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill101_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.fill(0, -2, -1);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(2)).assertEqual(3);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(5);
    });

  });
}
