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

export default function uint16ArrayFill202Test(): void {
  describe('Uint16ArrayFill202Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_0100
     * @tc.name testUint16ArrayFill202_001
     * @tc.desc Verify fill(0x10001, 0, 3) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(0x10001, 0, 3);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_0200
     * @tc.name testUint16ArrayFill202_002
     * @tc.desc Verify fill(-65535, 0, 4) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(-65535, 0, 4);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(1);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_0300
     * @tc.name testUint16ArrayFill202_003
     * @tc.desc Verify fill(65536+1, 2, 5) 1 [2,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536 + 1, 2, 5);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(1);
      expect(arr.at(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_0400
     * @tc.name testUint16ArrayFill202_004
     * @tc.desc Verify fill(65535.9, 0, 3) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65535.9, 0, 3);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(65535);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_0500
     * @tc.name testUint16ArrayFill202_005
     * @tc.desc Verify fill(-0.5, 1, 4) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(-0.5, 1, 4);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_0600
     * @tc.name testUint16ArrayFill202_006
     * @tc.desc Verify fill(1.999, 0, 5) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(1.999, 0, 5);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(1);
      expect(arr.at(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_0700
     * @tc.name testUint16ArrayFill202_007
     * @tc.desc Verify fill(65536*2+5, 0, 2) 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536 * 2 + 5, 0, 2);
      expect(arr.at(0)).assertEqual(5);
      expect(arr.at(1)).assertEqual(5);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_0800
     * @tc.name testUint16ArrayFill202_008
     * @tc.desc Verify fill(65536*10, 1, 3) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536 * 10, 1, 3);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_0900
     * @tc.name testUint16ArrayFill202_009
     * @tc.desc Verify fill(65536, -1, 3) start+ value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536, -1, 3);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_1000
     * @tc.name testUint16ArrayFill202_010
     * @tc.desc Verify fill(65536, 0, -1) end+ value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(65536, 0, -1);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_1100
     * @tc.name testUint16ArrayFill202_011
     * @tc.desc Verify fill converts value 3.14 to 3 within integer range [1, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(3.14, 1, 4);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(3);
      expect(arr.at(2)).assertEqual(3);
      expect(arr.at(3)).assertEqual(3);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_1200
     * @tc.name testUint16ArrayFill202_012
     * @tc.desc Verify fill(-1, -3, -1) start+ end+ value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(-1, -3, -1);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(65535);
      expect(arr.at(3)).assertEqual(65535);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_1300
     * @tc.name testUint16ArrayFill202_013
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(10).fill(20, 0, 2);
      expect(arr.at(0)).assertEqual(20);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(10);
      expect(arr.at(3)).assertEqual(10);
      expect(arr.at(4)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_1400
     * @tc.name testUint16ArrayFill202_014
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(99, 2, 4);
      expect(arr.at(2)).assertEqual(99);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_1500
     * @tc.name testUint16ArrayFill202_015
     * @tc.desc Verify fill for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(55);
      let allMatch: boolean = true;
      for (const val of arr) {
        if (val !== 55) {
          allMatch = false;
        }
      }
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_1600
     * @tc.name testUint16ArrayFill202_016
     * @tc.desc Verify fill some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(77);
      let found: boolean = arr.includes(77);
      expect(found).assertTrue();
      expect(arr.at(0)).assertEqual(77);
      expect(arr.at(1)).assertEqual(77);
      expect(arr.at(2)).assertEqual(77);
      expect(arr.at(3)).assertEqual(77);
      expect(arr.at(4)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_1700
     * @tc.name testUint16ArrayFill202_017
     * @tc.desc Verify fill every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(88);
      let all: boolean = arr.every((v: number): boolean => v === 88);
      expect(all).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_1800
     * @tc.name testUint16ArrayFill202_018
     * @tc.desc Verify fill(0) fill(65535)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.fill(0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
      arr.fill(65535);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(65535);
      expect(arr.at(4)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_1900
     * @tc.name testUint16ArrayFill202_019
     * @tc.desc Verify fill(NaN, -4, -1) start+ end+NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(Number.NaN, -4, -1);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_2000
     * @tc.name testUint16ArrayFill202_020
     * @tc.desc Verify fill(-Infinity, 1, -1) +
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(-Number.POSITIVE_INFINITY, 1, -1);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_2100
     * @tc.name testUint16ArrayFill202_021
     * @tc.desc Verify fill(0x10000, -3, 5) + start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(0x10000, -3, 5);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_2200
     * @tc.name testUint16ArrayFill202_022
     * @tc.desc Verify fill(1e5, 0, -2) + end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(1e5, 0, -2);
      expect(arr.at(0)).assertEqual(34464);
      expect(arr.at(1)).assertEqual(34464);
      expect(arr.at(2)).assertEqual(34464);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_2300
     * @tc.name testUint16ArrayFill202_023
     * @tc.desc Verify fill on array with initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.fill(987, 1, 4);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(987);
      expect(arr.at(2)).assertEqual(987);
      expect(arr.at(3)).assertEqual(987);
      expect(arr.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_2400
     * @tc.name testUint16ArrayFill202_024
     * @tc.desc Verify fill with float start (truncated to integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(777, Double.toInt(2.5));
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(777);
      expect(arr.at(4)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_2500
     * @tc.name testUint16ArrayFill202_025
     * @tc.desc Verify fill with value = 0x7FFF (32767)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(4);
      arr.fill(0x7FFF);
      expect(arr.at(0)).assertEqual(32767);
      expect(arr.at(1)).assertEqual(32767);
      expect(arr.at(2)).assertEqual(32767);
      expect(arr.at(3)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_2600
     * @tc.name testUint16ArrayFill202_026
     * @tc.desc Verify fill with value = -0.1 (truncates to 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr.fill(-0.1);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_2700
     * @tc.name testUint16ArrayFill202_027
     * @tc.desc Verify fill with start = 0, end = 100 (clamps to length 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(123, 0, 100);
      expect(arr.at(0)).assertEqual(123);
      expect(arr.at(4)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_2800
     * @tc.name testUint16ArrayFill202_028
     * @tc.desc Verify chaining multiple fill calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(7);
      arr.fill(111, 0, 2).fill(222, 2, 5).fill(333, 5, 7);
      expect(arr.at(0)).assertEqual(111);
      expect(arr.at(1)).assertEqual(111);
      expect(arr.at(2)).assertEqual(222);
      expect(arr.at(4)).assertEqual(222);
      expect(arr.at(5)).assertEqual(333);
      expect(arr.at(6)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_2900
     * @tc.name testUint16ArrayFill202_029
     * @tc.desc Verify fill offset view fill updates only its backing range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
            view.fill(9);
            expect(all.at(0)).assertEqual(1);
            expect(all.at(1)).assertEqual(9);
            expect(all.at(2)).assertEqual(9);
            expect(all.at(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_3000
     * @tc.name testUint16ArrayFill202_030
     * @tc.desc Verify fill equal start and end leave the receiver unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
            arr.fill(9, 1, 1);
            expect(arr.at(0)).assertEqual(1);
            expect(arr.at(1)).assertEqual(2);
            expect(arr.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_3100
     * @tc.name testUint16ArrayFill202_031
     * @tc.desc Verify fill start beyond length leaves the receiver unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
            arr.fill(9, 10);
            expect(arr.at(0)).assertEqual(1);
            expect(arr.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_3200
     * @tc.name testUint16ArrayFill202_032
     * @tc.desc Verify fill partial fill preserves elements outside the range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            arr.fill(8, 1, 3);
            expect(arr.at(0)).assertEqual(1);
            expect(arr.at(1)).assertEqual(8);
            expect(arr.at(2)).assertEqual(8);
            expect(arr.at(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILL202_3300
     * @tc.name testUint16ArrayFill202_033
     * @tc.desc Verify fill conversion on an offset view is visible through DataView and confined to the view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFill202_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(11, 22, 33, 44);
      let view: Uint16Array = new Uint16Array(backing.buffer, 2, 2);
      let result: Uint16Array = view.fill(-2);
      let dataView: DataView = new DataView(backing.buffer);
      expect(result).assertEqual(view);
      expect(dataView.getUint16(2, true)).assertEqual(65534);
      expect(dataView.getUint16(4, true)).assertEqual(65534);
      expect(backing.at(0)).assertEqual(11);
      expect(backing.at(3)).assertEqual(44);
    });

  });
}
