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

export default function uint16ArrayFill201Test(): void {
  describe('Uint16ArrayFill201Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_0100
     * @tc.name testUint16ArrayFill201_001
     * @tc.desc Verify fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(42);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(1)).assertEqual(42);
      expect(arr.at(2)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_0200
     * @tc.name testUint16ArrayFill201_002
     * @tc.desc Verify fill value start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 2);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_0300
     * @tc.name testUint16ArrayFill201_003
     * @tc.desc Verify fill value start end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 1, 4);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(42);
      expect(arr.at(3)).assertEqual(42);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_0400
     * @tc.name testUint16ArrayFill201_004
     * @tc.desc Verify value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      arr.fill(0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_0500
     * @tc.name testUint16ArrayFill201_005
     * @tc.desc Verify value 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(65535);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_0600
     * @tc.name testUint16ArrayFill201_006
     * @tc.desc Verify value 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(65536);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_0700
     * @tc.name testUint16ArrayFill201_007
     * @tc.desc Verify value -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(-1);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_0800
     * @tc.name testUint16ArrayFill201_008
     * @tc.desc Verify value 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(32768);
      expect(arr.at(0)).assertEqual(32768);
      expect(arr.at(1)).assertEqual(32768);
      expect(arr.at(2)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_0900
     * @tc.name testUint16ArrayFill201_009
     * @tc.desc Verify value 0x10000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(0x10000);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_1000
     * @tc.name testUint16ArrayFill201_010
     * @tc.desc Verify value 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(3.14);
      expect(arr.at(0)).assertEqual(3);
      expect(arr.at(1)).assertEqual(3);
      expect(arr.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_1100
     * @tc.name testUint16ArrayFill201_011
     * @tc.desc Verify value 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(65535.9);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_1200
     * @tc.name testUint16ArrayFill201_012
     * @tc.desc Verify value -0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(-0.5);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_1300
     * @tc.name testUint16ArrayFill201_013
     * @tc.desc Verify value NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(Number.NaN);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_1400
     * @tc.name testUint16ArrayFill201_014
     * @tc.desc Verify value 1e5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(1e5);
      expect(arr.at(0)).assertEqual(34464);
      expect(arr.at(1)).assertEqual(34464);
      expect(arr.at(2)).assertEqual(34464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_1500
     * @tc.name testUint16ArrayFill201_015
     * @tc.desc Verify value 0.999 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(0.999);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_1600
     * @tc.name testUint16ArrayFill201_016
     * @tc.desc Verify value 1.999 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(1.999);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_1700
     * @tc.name testUint16ArrayFill201_017
     * @tc.desc Verify value 65537 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(65537);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_1800
     * @tc.name testUint16ArrayFill201_018
     * @tc.desc Verify value -2 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(-2);
      expect(arr.at(0)).assertEqual(65534);
      expect(arr.at(1)).assertEqual(65534);
      expect(arr.at(2)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_1900
     * @tc.name testUint16ArrayFill201_019
     * @tc.desc Verify value 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(128);
      expect(arr.at(0)).assertEqual(128);
      expect(arr.at(1)).assertEqual(128);
      expect(arr.at(2)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_2000
     * @tc.name testUint16ArrayFill201_020
     * @tc.desc Verify value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(255);
      expect(arr.at(0)).assertEqual(255);
      expect(arr.at(1)).assertEqual(255);
      expect(arr.at(2)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_2100
     * @tc.name testUint16ArrayFill201_021
     * @tc.desc Verify value 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(256);
      expect(arr.at(0)).assertEqual(256);
      expect(arr.at(1)).assertEqual(256);
      expect(arr.at(2)).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_2200
     * @tc.name testUint16ArrayFill201_022
     * @tc.desc Verify value 65535-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(65535 - 1);
      expect(arr.at(0)).assertEqual(65534);
      expect(arr.at(1)).assertEqual(65534);
      expect(arr.at(2)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_2300
     * @tc.name testUint16ArrayFill201_023
     * @tc.desc Verify value 50000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(50000);
      expect(arr.at(0)).assertEqual(50000);
      expect(arr.at(1)).assertEqual(50000);
      expect(arr.at(2)).assertEqual(50000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_2400
     * @tc.name testUint16ArrayFill201_024
     * @tc.desc Verify value 60000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(60000);
      expect(arr.at(0)).assertEqual(60000);
      expect(arr.at(1)).assertEqual(60000);
      expect(arr.at(2)).assertEqual(60000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_2500
     * @tc.name testUint16ArrayFill201_025
     * @tc.desc Verify value 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(100);
      expect(arr.at(0)).assertEqual(100);
      expect(arr.at(1)).assertEqual(100);
      expect(arr.at(2)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_2600
     * @tc.name testUint16ArrayFill201_026
     * @tc.desc Verify value 65536*10+7 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(65536 * 10 + 7);
      expect(arr.at(0)).assertEqual(7);
      expect(arr.at(1)).assertEqual(7);
      expect(arr.at(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_2700
     * @tc.name testUint16ArrayFill201_027
     * @tc.desc Verify start 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_2800
     * @tc.name testUint16ArrayFill201_028
     * @tc.desc Verify start 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 1);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_2900
     * @tc.name testUint16ArrayFill201_029
     * @tc.desc Verify start length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 4);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_3000
     * @tc.name testUint16ArrayFill201_030
     * @tc.desc Verify start length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 5);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_3100
     * @tc.name testUint16ArrayFill201_031
     * @tc.desc Verify start length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 6);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_3200
     * @tc.name testUint16ArrayFill201_032
     * @tc.desc Verify start -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -1);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_3300
     * @tc.name testUint16ArrayFill201_033
     * @tc.desc Verify start -length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -5);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_3400
     * @tc.name testUint16ArrayFill201_034
     * @tc.desc Verify start -length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -6);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_3500
     * @tc.name testUint16ArrayFill201_035
     * @tc.desc Verify start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 9999);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_3600
     * @tc.name testUint16ArrayFill201_036
     * @tc.desc Verify start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -9999);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_3700
     * @tc.name testUint16ArrayFill201_037
     * @tc.desc Verify start 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 2);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_3800
     * @tc.name testUint16ArrayFill201_038
     * @tc.desc Verify start 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 3);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_3900
     * @tc.name testUint16ArrayFill201_039
     * @tc.desc Verify start -3.14 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -3);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(3)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_4000
     * @tc.name testUint16ArrayFill201_040
     * @tc.desc Verify start -2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -2);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_4100
     * @tc.name testUint16ArrayFill201_041
     * @tc.desc Verify start -3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, -3);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_4200
     * @tc.name testUint16ArrayFill201_042
     * @tc.desc Verify start 0 value=65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536, 0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_4300
     * @tc.name testUint16ArrayFill201_043
     * @tc.desc Verify start 0 value=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(-1, 0);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(4)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_4400
     * @tc.name testUint16ArrayFill201_044
     * @tc.desc Verify start 0 NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(Number.NaN, 0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_4500
     * @tc.name testUint16ArrayFill201_045
     * @tc.desc Verify start 0 Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(Number.POSITIVE_INFINITY, 0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_4600
     * @tc.name testUint16ArrayFill201_046
     * @tc.desc Verify end 1 [0,1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 1);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_4700
     * @tc.name testUint16ArrayFill201_047
     * @tc.desc Verify end 3 [0,3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 3);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_4800
     * @tc.name testUint16ArrayFill201_048
     * @tc.desc Verify end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 5);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_4900
     * @tc.name testUint16ArrayFill201_049
     * @tc.desc Verify end length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 6);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_5000
     * @tc.name testUint16ArrayFill201_050
     * @tc.desc Verify end 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_5100
     * @tc.name testUint16ArrayFill201_051
     * @tc.desc Verify end -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, -1);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(3)).assertEqual(42);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_5200
     * @tc.name testUint16ArrayFill201_052
     * @tc.desc Verify end -length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, -5);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_5300
     * @tc.name testUint16ArrayFill201_053
     * @tc.desc Verify end -length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, -6);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_5400
     * @tc.name testUint16ArrayFill201_054
     * @tc.desc Verify end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 9999);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_5500
     * @tc.name testUint16ArrayFill201_055
     * @tc.desc Verify end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, -9999);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_5600
     * @tc.name testUint16ArrayFill201_056
     * @tc.desc Verify end -3.14 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, -3);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(1)).assertEqual(42);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_5700
     * @tc.name testUint16ArrayFill201_057
     * @tc.desc Verify end 2 [0,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 2);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(1)).assertEqual(42);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_5800
     * @tc.name testUint16ArrayFill201_058
     * @tc.desc Verify end 4 [0,4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, 4);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(3)).assertEqual(42);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_5900
     * @tc.name testUint16ArrayFill201_059
     * @tc.desc Verify end -2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, -2);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(2)).assertEqual(42);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_6000
     * @tc.name testUint16ArrayFill201_060
     * @tc.desc Verify end -3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42, 0, -3);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(1)).assertEqual(42);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_6100
     * @tc.name testUint16ArrayFill201_061
     * @tc.desc Verify end 1 value=65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536, 0, 1);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_6200
     * @tc.name testUint16ArrayFill201_062
     * @tc.desc Verify end 1 value=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(-1, 0, 1);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_6300
     * @tc.name testUint16ArrayFill201_063
     * @tc.desc Verify end 1 NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(Number.NaN, 0, 1);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_6400
     * @tc.name testUint16ArrayFill201_064
     * @tc.desc Verify fill Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      let result: Uint16Array = arr.fill(42);
      expect(result instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_6500
     * @tc.name testUint16ArrayFill201_065
     * @tc.desc Verify fill this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      let result: Uint16Array = arr.fill(42);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_6600
     * @tc.name testUint16ArrayFill201_066
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(42).fill(0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_6700
     * @tc.name testUint16ArrayFill201_067
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(10).fill(20).fill(30);
      expect(arr.at(0)).assertEqual(30);
      expect(arr.at(1)).assertEqual(30);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_6800
     * @tc.name testUint16ArrayFill201_068
     * @tc.desc Verify fill length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      let lenBefore: int = arr.length;
      arr.fill(42);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_6900
     * @tc.name testUint16ArrayFill201_069
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(0);
      let result: Uint16Array = arr.fill(42);
      expect(result).assertEqual(arr);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_7000
     * @tc.name testUint16ArrayFill201_070
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(1);
      arr.fill(42);
      expect(arr.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_7100
     * @tc.name testUint16ArrayFill201_071
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(100);
      arr.fill(42);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(50)).assertEqual(42);
      expect(arr.at(99)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_7200
     * @tc.name testUint16ArrayFill201_072
     * @tc.desc Verify fill buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.fill(42);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_7300
     * @tc.name testUint16ArrayFill201_073
     * @tc.desc Verify fill byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      let blBefore: int = arr.byteLength;
      arr.fill(42);
      expect(arr.byteLength).assertEqual(blBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_7400
     * @tc.name testUint16ArrayFill201_074
     * @tc.desc Verify fill byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      let offBefore: int = arr.byteOffset;
      arr.fill(42);
      expect(arr.byteOffset).assertEqual(offBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_7500
     * @tc.name testUint16ArrayFill201_075
     * @tc.desc Verify fill forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(77);
      let count: int = 0;
      arr.forEach((val: number, idx: int, a: Uint16Array) => {
        expect(val).assertEqual(77);
        count++;

      });
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_7600
     * @tc.name testUint16ArrayFill201_076
     * @tc.desc Verify fill(65536, 0, 3) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536, 0, 3);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_7700
     * @tc.name testUint16ArrayFill201_077
     * @tc.desc Verify fill(-1, 1, 4) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(-1, 1, 4);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(65535);
      expect(arr.at(3)).assertEqual(65535);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_7800
     * @tc.name testUint16ArrayFill201_078
     * @tc.desc Verify fill(3.14, 0, 2) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(3.14, 0, 2);
      expect(arr.at(0)).assertEqual(3);
      expect(arr.at(1)).assertEqual(3);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_7900
     * @tc.name testUint16ArrayFill201_079
     * @tc.desc Verify fill(NaN, 1, 5)NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(Number.NaN, 1, 5);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_8000
     * @tc.name testUint16ArrayFill201_080
     * @tc.desc Verify fill(Infinity, 0, 4)Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(Number.POSITIVE_INFINITY, 0, 4);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_8100
     * @tc.name testUint16ArrayFill201_081
     * @tc.desc Verify fill(-Infinity, 2, 5)-Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(-Number.POSITIVE_INFINITY, 2, 5);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_8200
     * @tc.name testUint16ArrayFill201_082
     * @tc.desc Verify fill(65536+32768, 0, 5) 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536 + 32768, 0, 5);
      expect(arr.at(0)).assertEqual(32768);
      expect(arr.at(2)).assertEqual(32768);
      expect(arr.at(4)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_8300
     * @tc.name testUint16ArrayFill201_083
     * @tc.desc Verify fill(-32768, 0, 3) 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(-32768, 0, 3);
      expect(arr.at(0)).assertEqual(32768);
      expect(arr.at(1)).assertEqual(32768);
      expect(arr.at(2)).assertEqual(32768);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_8400
     * @tc.name testUint16ArrayFill201_084
     * @tc.desc Verify fill(65536.5, 0, 2) + 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536.5, 0, 2);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_8500
     * @tc.name testUint16ArrayFill201_085
     * @tc.desc Verify fill(-1.5, 0, 3) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(-1.5, 0, 3);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(65535);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_8600
     * @tc.name testUint16ArrayFill201_086
     * @tc.desc Verify fill(0x1FFFF, 1, 4) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(0x1FFFF, 1, 4);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(65535);
      expect(arr.at(3)).assertEqual(65535);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_8700
     * @tc.name testUint16ArrayFill201_087
     * @tc.desc Verify fill(-65536-1, 0, 2) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(-65536 - 1, 0, 2);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_8800
     * @tc.name testUint16ArrayFill201_088
     * @tc.desc Verify fill with value = 0x8000 (32768) on full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(4);
      arr.fill(0x8000);
      expect(arr.at(0)).assertEqual(32768);
      expect(arr.at(1)).assertEqual(32768);
      expect(arr.at(2)).assertEqual(32768);
      expect(arr.at(3)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_8900
     * @tc.name testUint16ArrayFill201_089
     * @tc.desc Verify fill with start = -4, end = -1 on length 5 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.fill(999, -4, -1);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(999);
      expect(arr.at(2)).assertEqual(999);
      expect(arr.at(3)).assertEqual(999);
      expect(arr.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_9000
     * @tc.name testUint16ArrayFill201_090
     * @tc.desc Verify fill with value = 65535.5 (should truncate to 65535)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(65535.5);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_9100
     * @tc.name testUint16ArrayFill201_091
     * @tc.desc Verify fill with value = -32767 (becomes 65536 - 32767 = 32769)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(2);
      arr.fill(-32767, 0, 2);
      expect(arr.at(0)).assertEqual(32769);
      expect(arr.at(1)).assertEqual(32769);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL201_9200
     * @tc.name testUint16ArrayFill201_092
     * @tc.desc Verify fill after modifying array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill201_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40]);
      arr[0] = 999;
      arr[3] = 888;
      arr.fill(111, 1, 3);
      expect(arr.at(0)).assertEqual(999);
      expect(arr.at(1)).assertEqual(111);
      expect(arr.at(2)).assertEqual(111);
      expect(arr.at(3)).assertEqual(888);
    });

  });
}
