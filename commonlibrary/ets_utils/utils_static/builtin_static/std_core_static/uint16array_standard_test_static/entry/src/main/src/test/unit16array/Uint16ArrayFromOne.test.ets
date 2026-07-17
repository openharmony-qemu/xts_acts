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

export default function uint16ArrayFrom101Test(): void {
  describe('Uint16ArrayFrom101Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_0100
     * @tc.name testUint16ArrayFrom101_001
     * @tc.desc Verify from 1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(10, 20, 30);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(20);
      expect(result.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_0200
     * @tc.name testUint16ArrayFrom101_002
     * @tc.desc Verify Uint16Array.from converts a two-element Set without a mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_0300
     * @tc.name testUint16ArrayFrom101_003
     * @tc.desc Verify from 2 Iterable<number> + mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => v * 2);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(2);
      expect(result.at(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_0400
     * @tc.name testUint16ArrayFrom101_004
     * @tc.desc Verify Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [];
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_0500
     * @tc.name testUint16ArrayFrom101_005
     * @tc.desc Verify Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [42];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_0600
     * @tc.name testUint16ArrayFrom101_006
     * @tc.desc Verify Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1, 2, 3, 4, 5];
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(5);
      expect(result.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_0700
     * @tc.name testUint16ArrayFrom101_007
     * @tc.desc Verify Array<number> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0, 100, 200];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_0800
     * @tc.name testUint16ArrayFrom101_008
     * @tc.desc Verify Array<number> 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [65535];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_0900
     * @tc.name testUint16ArrayFrom101_009
     * @tc.desc Verify Array<number> 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [65536];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_1000
     * @tc.name testUint16ArrayFrom101_010
     * @tc.desc Verify Array<number> -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [-1];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_1100
     * @tc.name testUint16ArrayFrom101_011
     * @tc.desc Verify Array<number> 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [32768];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_1200
     * @tc.name testUint16ArrayFrom101_012
     * @tc.desc Verify Array<number> 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0xFFFF];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_1300
     * @tc.name testUint16ArrayFrom101_013
     * @tc.desc Verify Array<number> 0b1111111111111111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0b1111111111111111];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_1400
     * @tc.name testUint16ArrayFrom101_014
     * @tc.desc Verify Array<number> 0o177777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0o177777];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_1500
     * @tc.name testUint16ArrayFrom101_015
     * @tc.desc Verify Array<number> 1e4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1e4];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_1600
     * @tc.name testUint16ArrayFrom101_016
     * @tc.desc Verify Array<number> -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [-32768];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_1700
     * @tc.name testUint16ArrayFrom101_017
     * @tc.desc Verify Uint16Array from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Uint16Array();
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_1800
     * @tc.name testUint16ArrayFrom101_018
     * @tc.desc Verify Uint16Array from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(99);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_1900
     * @tc.name testUint16ArrayFrom101_019
     * @tc.desc Verify Uint16Array from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(10, 20, 30);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(3);
      expect(result.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_2000
     * @tc.name testUint16ArrayFrom101_020
     * @tc.desc Verify Uint16Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(0, 1, 2);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_2100
     * @tc.name testUint16ArrayFrom101_021
     * @tc.desc Verify Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(65535);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_2200
     * @tc.name testUint16ArrayFrom101_022
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(100, 200, 300);
      let result = Uint16Array.from(source);
      source[0] = 999;
      expect(result.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_2300
     * @tc.name testUint16ArrayFrom101_023
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(100, 200, 300);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(100);
      expect(source.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_2400
     * @tc.name testUint16ArrayFrom101_024
     * @tc.desc Verify Uint16Array.from copies a zero value from a Uint16Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(0);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(source.at(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_2500
     * @tc.name testUint16ArrayFrom101_025
     * @tc.desc Verify Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1.0, 2.0, 3.0];
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(3);
      expect(result.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_2600
     * @tc.name testUint16ArrayFrom101_026
     * @tc.desc Verify Array<number> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0.0];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_2700
     * @tc.name testUint16ArrayFrom101_027
     * @tc.desc Verify Array<number> 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [3.14];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_2800
     * @tc.name testUint16ArrayFrom101_028
     * @tc.desc Verify Array<number> NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [Number.NaN];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_2900
     * @tc.name testUint16ArrayFrom101_029
     * @tc.desc Verify Array<number> Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [Number.POSITIVE_INFINITY];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_3000
     * @tc.name testUint16ArrayFrom101_030
     * @tc.desc Verify Array<number> -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [-Number.POSITIVE_INFINITY];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_3100
     * @tc.name testUint16ArrayFrom101_031
     * @tc.desc Verify Array<number> 0x10000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0x10000];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_3200
     * @tc.name testUint16ArrayFrom101_032
     * @tc.desc Verify Array<number> -0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [-0.5];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_3300
     * @tc.name testUint16ArrayFrom101_033
     * @tc.desc Verify Array<number> 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [65535.9];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_3400
     * @tc.name testUint16ArrayFrom101_034
     * @tc.desc Verify Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [10, 20, 30];
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(3);
      expect(result.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_3500
     * @tc.name testUint16ArrayFrom101_035
     * @tc.desc Verify Array<number> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_3600
     * @tc.name testUint16ArrayFrom101_036
     * @tc.desc Verify Array<number> 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [100000];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(34464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_3700
     * @tc.name testUint16ArrayFrom101_037
     * @tc.desc Verify Set<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_3800
     * @tc.name testUint16ArrayFrom101_038
     * @tc.desc Verify Set<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(5.0);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_3900
     * @tc.name testUint16ArrayFrom101_039
     * @tc.desc Verify Set<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      source.add(3.0);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(3);
      expect(result.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_4000
     * @tc.name testUint16ArrayFrom101_040
     * @tc.desc Verify Set<number> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(0.0);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_4100
     * @tc.name testUint16ArrayFrom101_041
     * @tc.desc Verify Set<number> 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(65535.0);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_4200
     * @tc.name testUint16ArrayFrom101_042
     * @tc.desc Verify Set<number> 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(3.14);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_4300
     * @tc.name testUint16ArrayFrom101_043
     * @tc.desc Verify Set<number> NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(Number.NaN);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_4400
     * @tc.name testUint16ArrayFrom101_044
     * @tc.desc Verify mapfn (v) => v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(5.0);
      source.add(10.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => v);
      expect(result.at(0)).assertEqual(5);
      expect(result.at(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_4500
     * @tc.name testUint16ArrayFrom101_045
     * @tc.desc Verify mapfn (v) => v * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(100.0);
      source.add(200.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => v * 2);
      expect(result.at(0)).assertEqual(200);
      expect(result.at(1)).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_4600
     * @tc.name testUint16ArrayFrom101_046
     * @tc.desc Verify mapfn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 0);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_4700
     * @tc.name testUint16ArrayFrom101_047
     * @tc.desc Verify mapfn 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 65535);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_4800
     * @tc.name testUint16ArrayFrom101_048
     * @tc.desc Verify mapfn 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 65536);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_4900
     * @tc.name testUint16ArrayFrom101_049
     * @tc.desc Verify mapfn -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => -1);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_5000
     * @tc.name testUint16ArrayFrom101_050
     * @tc.desc Verify mapfn 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 3.14);
      expect(result.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_5100
     * @tc.name testUint16ArrayFrom101_051
     * @tc.desc Verify mapfn index (v, k) => k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(100.0);
      source.add(200.0);
      source.add(300.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => k);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(1);
      expect(result.at(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_5200
     * @tc.name testUint16ArrayFrom101_052
     * @tc.desc Verify mapfn NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => Number.NaN);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_5300
     * @tc.name testUint16ArrayFrom101_053
     * @tc.desc Verify mapfn Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => Number.POSITIVE_INFINITY);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_5400
     * @tc.name testUint16ArrayFrom101_054
     * @tc.desc Verify mapfn -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => -Number.POSITIVE_INFINITY);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_5500
     * @tc.name testUint16ArrayFrom101_055
     * @tc.desc Verify mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      try {
        let result = Uint16Array.from(source, (v: number, k: number): number => {
          throw new Error("mapfn error");
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_5600
     * @tc.name testUint16ArrayFrom101_056
     * @tc.desc Verify mapfn 0x10000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 0x10000);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_5700
     * @tc.name testUint16ArrayFrom101_057
     * @tc.desc Verify mapfn -0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => -0.5);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_5800
     * @tc.name testUint16ArrayFrom101_058
     * @tc.desc Verify mapfn 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 65535.9);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_5900
     * @tc.name testUint16ArrayFrom101_059
     * @tc.desc Verify mapfn Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      let callCount: number = 0;
      let result = Uint16Array.from(source, (v: number, k: number): number => {
        callCount++;
        return v;
      });
      expect(result.length).assertEqual(0);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_6000
     * @tc.name testUint16ArrayFrom101_060
     * @tc.desc Verify from Uint16Array Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(source);
      expect(result instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_6100
     * @tc.name testUint16ArrayFrom101_061
     * @tc.desc Verify from Uint16Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(1, 2, 3);
      let result = Uint16Array.from(source);
      expect(result instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_6200
     * @tc.name testUint16ArrayFrom101_062
     * @tc.desc Verify from Uint16Array Iterable<number> + mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => v);
      expect(result instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_6300
     * @tc.name testUint16ArrayFrom101_063
     * @tc.desc Verify from byteLength Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1, 2, 3, 4];
      let result = Uint16Array.from(source);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_6400
     * @tc.name testUint16ArrayFrom101_064
     * @tc.desc Verify from byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [];
      let result = Uint16Array.from(source);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_6500
     * @tc.name testUint16ArrayFrom101_065
     * @tc.desc Verify from byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(source);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_6600
     * @tc.name testUint16ArrayFrom101_066
     * @tc.desc Verify from BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(source);
      expect(result.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_6700
     * @tc.name testUint16ArrayFrom101_067
     * @tc.desc Verify from buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(1, 2, 3);
      let result = Uint16Array.from(source);
      expect((result.buffer) !== (source.buffer)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_6800
     * @tc.name testUint16ArrayFrom101_068
     * @tc.desc Verify from null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result = Uint16Array.from(null!);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_6900
     * @tc.name testUint16ArrayFrom101_069
     * @tc.desc Verify from undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result = Uint16Array.from(undefined!);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_7000
     * @tc.name testUint16ArrayFrom101_070
     * @tc.desc Verify from null mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      try {
        let result = Uint16Array.from(source, null!);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_7100
     * @tc.name testUint16ArrayFrom101_071
     * @tc.desc Verify from undefined mapfn mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(5.0);
      source.add(10.0);
      let result = Uint16Array.from(source, undefined);
      expect(result.at(0)).assertEqual(5);
      expect(result.at(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_7200
     * @tc.name testUint16ArrayFrom101_072
     * @tc.desc Verify Array<number> 65535*2 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [131070];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_7300
     * @tc.name testUint16ArrayFrom101_073
     * @tc.desc Verify Array<number> -2 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [-2];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_7400
     * @tc.name testUint16ArrayFrom101_074
     * @tc.desc Verify Array<number> 0x7FFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0x7FFF];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_7500
     * @tc.name testUint16ArrayFrom101_075
     * @tc.desc Verify Array<number> 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0x8000];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_7600
     * @tc.name testUint16ArrayFrom101_076
     * @tc.desc Verify Array<number> -65535 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [-65535.0];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_7700
     * @tc.name testUint16ArrayFrom101_077
     * @tc.desc Verify mapfn 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 0x8000);
      expect(result.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_7800
     * @tc.name testUint16ArrayFrom101_078
     * @tc.desc Verify mapfn -65535 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => -65535);
      expect(result.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_7900
     * @tc.name testUint16ArrayFrom101_079
     * @tc.desc Verify mapfn 131072 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 131072);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_8000
     * @tc.name testUint16ArrayFrom101_080
     * @tc.desc Verify from Uint16Array (copy independence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(1, 2, 3, 4, 5);
      let result = Uint16Array.from(source);
      source[0] = 999;
      expect(result.at(0)).assertEqual(1);
      expect(result.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_8100
     * @tc.name testUint16ArrayFrom101_081
     * @tc.desc Verify from array with float values (truncated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1.1, 2.5, 3.999];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(2);
      expect(result.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_8200
     * @tc.name testUint16ArrayFrom101_082
     * @tc.desc Verify from with mapfn using index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [10, 20, 30];
      let result = Uint16Array.from(source, (v: number, k: number): number => k * 100);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(100);
      expect(result.at(2)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_8300
     * @tc.name testUint16ArrayFrom101_083
     * @tc.desc Verify from empty Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM101_8400
     * @tc.name testUint16ArrayFrom101_084
     * @tc.desc Verify from with mapfn throwing error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFrom101_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1, 2];
      try {
        Uint16Array.from(source, (v: number, k: number): number => { throw new Error("test"); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

  });
}
