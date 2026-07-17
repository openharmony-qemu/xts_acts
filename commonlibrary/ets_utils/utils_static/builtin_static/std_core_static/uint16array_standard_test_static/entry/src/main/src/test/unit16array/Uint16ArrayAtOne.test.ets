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

export default function uint16ArrayAt01Test(): void {
  describe('Uint16ArrayAt01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_0100
     * @tc.name testUint16ArrayAt01_001
     * @tc.desc Verify at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      expect(arr.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_0200
     * @tc.name testUint16ArrayAt01_002
     * @tc.desc Verify at int at(2 + 2) at(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(2 + 2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_0300
     * @tc.name testUint16ArrayAt01_003
     * @tc.desc Verify at(1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_0400
     * @tc.name testUint16ArrayAt01_004
     * @tc.desc Verify at(2) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_0500
     * @tc.name testUint16ArrayAt01_005
     * @tc.desc Verify at(3) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_0600
     * @tc.name testUint16ArrayAt01_006
     * @tc.desc Verify at(4) 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_0700
     * @tc.name testUint16ArrayAt01_007
     * @tc.desc Verify at(0) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(65535);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_0800
     * @tc.name testUint16ArrayAt01_008
     * @tc.desc Verify at(1) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(0, 65535);
      expect(arr.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_0900
     * @tc.name testUint16ArrayAt01_009
     * @tc.desc Verify at(0) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2, 3, 4, 5);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_1000
     * @tc.name testUint16ArrayAt01_010
     * @tc.desc Verify at(4) 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2, 3, 4, 5);
      expect(arr.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_1100
     * @tc.name testUint16ArrayAt01_011
     * @tc.desc Verify at(0) -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([-1, 0]);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_1200
     * @tc.name testUint16ArrayAt01_012
     * @tc.desc Verify at(1) 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([0, 65536]);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_1300
     * @tc.name testUint16ArrayAt01_013
     * @tc.desc Verify at(0) 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([3.14]);
      expect(arr.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_1400
     * @tc.name testUint16ArrayAt01_014
     * @tc.desc Verify at(0) NaN NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([Number.NaN]);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_1500
     * @tc.name testUint16ArrayAt01_015
     * @tc.desc Verify at(0) Infinity Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([Number.POSITIVE_INFINITY]);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_1600
     * @tc.name testUint16ArrayAt01_016
     * @tc.desc Verify at(0) -Infinity -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([-Number.POSITIVE_INFINITY]);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_1700
     * @tc.name testUint16ArrayAt01_017
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(-1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_1800
     * @tc.name testUint16ArrayAt01_018
     * @tc.desc Verify at(-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(-2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_1900
     * @tc.name testUint16ArrayAt01_019
     * @tc.desc Verify at(-3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(-3)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_2000
     * @tc.name testUint16ArrayAt01_020
     * @tc.desc Verify at(-4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(-4)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_2100
     * @tc.name testUint16ArrayAt01_021
     * @tc.desc Verify at(-5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(-5)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_2200
     * @tc.name testUint16ArrayAt01_022
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(42);
      expect(arr.at(-1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_2300
     * @tc.name testUint16ArrayAt01_023
     * @tc.desc Verify at(-1) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(0, 65535);
      expect(arr.at(-1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_2400
     * @tc.name testUint16ArrayAt01_024
     * @tc.desc Verify at(-2) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(0, 65535);
      expect(arr.at(-2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_2500
     * @tc.name testUint16ArrayAt01_025
     * @tc.desc Verify at(-1) 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(65535, 0, 32768);
      expect(arr.at(-1)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_2600
     * @tc.name testUint16ArrayAt01_026
     * @tc.desc Verify at(-2) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(65535, 0, 32768);
      expect(arr.at(-2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_2700
     * @tc.name testUint16ArrayAt01_027
     * @tc.desc Verify at(-3) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(65535, 0, 32768);
      expect(arr.at(-3)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_2800
     * @tc.name testUint16ArrayAt01_028
     * @tc.desc Verify at(-1) 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(1, 2, 3, 4);
      expect(arr.at(-1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_2900
     * @tc.name testUint16ArrayAt01_029
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([-1, 65536, 3.14]);
      expect(arr.at(-1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_3000
     * @tc.name testUint16ArrayAt01_030
     * @tc.desc Verify at(-2) 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([-1, 65536, 3.14]);
      expect(arr.at(-2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_3100
     * @tc.name testUint16ArrayAt01_031
     * @tc.desc Verify at(-3) -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([-1, 65536, 3.14]);
      expect(arr.at(-3)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_3200
     * @tc.name testUint16ArrayAt01_032
     * @tc.desc Verify at(length) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(arr.length) === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_3300
     * @tc.name testUint16ArrayAt01_033
     * @tc.desc Verify at(-(length + 1)) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(-6) === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_3400
     * @tc.name testUint16ArrayAt01_034
     * @tc.desc Verify at int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      let idx: int = 0;
      expect(arr.at(idx)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_3500
     * @tc.name testUint16ArrayAt01_035
     * @tc.desc Verify at int -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      let idx: int = -1;
      expect(arr.at(idx)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_3600
     * @tc.name testUint16ArrayAt01_036
     * @tc.desc Verify at length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40);
      let idx: int = arr.length - 1;
      expect(arr.at(idx)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_3700
     * @tc.name testUint16ArrayAt01_037
     * @tc.desc Verify at 0x2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      expect(arr.at(0x2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_3800
     * @tc.name testUint16ArrayAt01_038
     * @tc.desc Verify at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array();
      expect(arr.at(0) === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_3900
     * @tc.name testUint16ArrayAt01_039
     * @tc.desc Verify at(-2) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(99);
      expect(arr.at(-2) === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_4000
     * @tc.name testUint16ArrayAt01_040
     * @tc.desc Verify new Uint16Array(3) 0 at(1) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(3);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_4100
     * @tc.name testUint16ArrayAt01_041
     * @tc.desc Verify new Uint16Array([1, 2, 3]) at(0) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array([1, 2, 3]);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_4200
     * @tc.name testUint16ArrayAt01_042
     * @tc.desc Verify Uint16Array.of(100, 200, 300) at(1) 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(100, 200, 300);
      expect(arr.at(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_4300
     * @tc.name testUint16ArrayAt01_043
     * @tc.desc Verify new Uint16Array(src) at(2) 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = new Uint16Array([5, 6, 7]);
      let arr = new Uint16Array(src);
      expect(arr.at(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_4400
     * @tc.name testUint16ArrayAt01_044
     * @tc.desc Verify Uint16Array.from([10, 20]) at(0) 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.from([10, 20]);
      expect(arr.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_4500
     * @tc.name testUint16ArrayAt01_045
     * @tc.desc Verify 100 at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      arr[0] = 1;
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_4600
     * @tc.name testUint16ArrayAt01_046
     * @tc.desc Verify 100 at(99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      arr[99] = 65535;
      expect(arr.at(99)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_4700
     * @tc.name testUint16ArrayAt01_047
     * @tc.desc Verify 100 at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      arr[99] = 32768;
      expect(arr.at(-1)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_4800
     * @tc.name testUint16ArrayAt01_048
     * @tc.desc Verify 100 at(-100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(100);
      arr[0] = 42;
      expect(arr.at(-100)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_4900
     * @tc.name testUint16ArrayAt01_049
     * @tc.desc Verify at(0) number undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20);
      let v = arr.at(0);
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_5000
     * @tc.name testUint16ArrayAt01_050
     * @tc.desc Verify at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      expect(arr.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_5100
     * @tc.name testUint16ArrayAt01_051
     * @tc.desc Verify at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30, 40, 50);
      expect(arr.at(-1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_5200
     * @tc.name testUint16ArrayAt01_052
     * @tc.desc Verify at(length) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      let caught = false;
      try {
        let v = arr.at(arr.length);
        expect(v).assertUndefined();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        caught = true;
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_5300
     * @tc.name testUint16ArrayAt01_053
     * @tc.desc Verify at(-length - 1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      let caught = false;
      try {
        let v = arr.at(-4);
        expect(v).assertUndefined();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        caught = true;
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_5400
     * @tc.name testUint16ArrayAt01_054
     * @tc.desc Verify at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array();
      let caught = false;
      try {
        let v = arr.at(0);
        expect(v).assertUndefined();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        caught = true;
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_5500
     * @tc.name testUint16ArrayAt01_055
     * @tc.desc Verify $_set(0, 32768) at(0) 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(1);
      arr.$_set(0, 32768);
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_5600
     * @tc.name testUint16ArrayAt01_056
     * @tc.desc Verify ArrayBuffer Uint16Array at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(4);
      let arr1 = new Uint16Array(buffer);
      let arr2 = new Uint16Array(buffer);
      arr2[0] = 42;
      expect(arr1.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_5700
     * @tc.name testUint16ArrayAt01_057
     * @tc.desc Verify buffer at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(4);
      let arr1 = new Uint16Array(buffer);
      let arr2 = new Uint16Array(buffer);
      arr2[1] = 65535;
      expect(arr1.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_5800
     * @tc.name testUint16ArrayAt01_058
     * @tc.desc Verify buffer at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(4);
      let arr1 = new Uint16Array(buffer);
      let arr2 = new Uint16Array(buffer);
      arr1[0] = 32768;
      arr1[1] = 100;
      expect(arr2.at(-1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_5900
     * @tc.name testUint16ArrayAt01_059
     * @tc.desc Verify fill(42) at(0) 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = new Uint16Array(3);
      arr.fill(42);
      expect(arr.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_6000
     * @tc.name testUint16ArrayAt01_060
     * @tc.desc Verify at(0o2) octal index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      expect(arr.at(0o2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_6100
     * @tc.name testUint16ArrayAt01_061
     * @tc.desc Verify at(2.9) float index truncates to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(10, 20, 30);
      expect(arr.at(Double.toInt(2.9))).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_6200
     * @tc.name testUint16ArrayAt01_062
     * @tc.desc Verify at() with boundary values array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr = Uint16Array.of(0, 1, 32767, 32768, 65534, 65535);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(2)).assertEqual(32767);
      expect(arr.at(5)).assertEqual(65535);
      expect(arr.at(-1)).assertEqual(65535);
      expect(arr.at(-6)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_AT01_6300
     * @tc.name testUint16ArrayAt01_063
     * @tc.desc Verify at() on array created from another Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayAt01_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(100, 200, 300);
      let arr = new Uint16Array(src);
      expect(arr.at(1)).assertEqual(200);
      expect(arr.at(-2)).assertEqual(200);
    });

  });
}
