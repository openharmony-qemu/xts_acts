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

export default function uint16ArrayOf02Test(): void {
  describe('Uint16ArrayOf02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_0100
     * @tc.name testUint16ArrayOfTwo001
     * @tc.desc Verify of(5.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(5.0);
      expect(arr.length).assertEqual(1);
      expect(arr.at(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_0200
     * @tc.name testUint16ArrayOfTwo002
     * @tc.desc Verify of(5.0, 10.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(5.0, 10.0);
      expect(arr.length).assertEqual(2);
      expect(arr.at(0)).assertEqual(5);
      expect(arr.at(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_0300
     * @tc.name testUint16ArrayOfTwo003
     * @tc.desc Verify of(5.0, 10.0, 15.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(5.0, 10.0, 15.0);
      expect(arr.length).assertEqual(3);
      expect(arr.at(0)).assertEqual(5);
      expect(arr.at(1)).assertEqual(10);
      expect(arr.at(2)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_0400
     * @tc.name testUint16ArrayOfTwo004
     * @tc.desc Verify of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0);
      expect(arr.length).assertEqual(10);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.at(i)).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_0500
     * @tc.name testUint16ArrayOfTwo005
     * @tc.desc Verify of() with 50 zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(
        0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
        0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
        0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
        0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
        0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
      );
      expect(arr.length).assertEqual(50);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.at(i)).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_0600
     * @tc.name testUint16ArrayOfTwo006
     * @tc.desc Verify of(0.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0.0);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_0700
     * @tc.name testUint16ArrayOfTwo007
     * @tc.desc Verify of(65535.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(65535.0);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_0800
     * @tc.name testUint16ArrayOfTwo008
     * @tc.desc Verify of(32768.0) 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(32768.0);
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_0900
     * @tc.name testUint16ArrayOfTwo009
     * @tc.desc Verify of(65535.9) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(65535.9);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_1000
     * @tc.name testUint16ArrayOfTwo010
     * @tc.desc Verify of(-0.5) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(-0.5);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_1100
     * @tc.name testUint16ArrayOfTwo011
     * @tc.desc Verify of(NaN) NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(Number.NaN);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_1200
     * @tc.name testUint16ArrayOfTwo012
     * @tc.desc Verify of(Infinity) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(Number.POSITIVE_INFINITY);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_1300
     * @tc.name testUint16ArrayOfTwo013
     * @tc.desc Verify of(-Infinity) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(-Number.POSITIVE_INFINITY);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_1400
     * @tc.name testUint16ArrayOfTwo014
     * @tc.desc Verify of(-65536.0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(-65536.0);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_1500
     * @tc.name testUint16ArrayOfTwo015
     * @tc.desc Verify of(-65537.0) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(-65537.0);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_1600
     * @tc.name testUint16ArrayOfTwo016
     * @tc.desc Verify of(131073.0) 65536 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(131073.0);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_1700
     * @tc.name testUint16ArrayOfTwo017
     * @tc.desc Verify of(1e-10) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1e-10);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_1800
     * @tc.name testUint16ArrayOfTwo018
     * @tc.desc Verify of(0.999) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0.999);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_1900
     * @tc.name testUint16ArrayOfTwo019
     * @tc.desc Verify of(65536.5) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(65536.5);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_2000
     * @tc.name testUint16ArrayOfTwo020
     * @tc.desc Verify of(0xFF) 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0xFF);
      expect(arr.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_2100
     * @tc.name testUint16ArrayOfTwo021
     * @tc.desc Verify of(0o377) 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0o377);
      expect(arr.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_2200
     * @tc.name testUint16ArrayOfTwo022
     * @tc.desc Verify of(0b11111111) 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0b11111111);
      expect(arr.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_2300
     * @tc.name testUint16ArrayOfTwo023
     * @tc.desc Verify of(1.0e4) 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1.0e4);
      expect(arr.at(0)).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_2400
     * @tc.name testUint16ArrayOfTwo024
     * @tc.desc Verify of(0xFFFF) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0xFFFF);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_2500
     * @tc.name testUint16ArrayOfTwo025
     * @tc.desc Verify of(0x10000) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0x10000);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_2600
     * @tc.name testUint16ArrayOfTwo026
     * @tc.desc Verify of(-0xFF) 65281
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(-0xFF);
      expect(arr.at(0)).assertEqual(65281);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_2700
     * @tc.name testUint16ArrayOfTwo027
     * @tc.desc Verify of(0x8000) 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0x8000);
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_2800
     * @tc.name testUint16ArrayOfTwo028
     * @tc.desc Verify of(0x7FFF) 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0x7FFF);
      expect(arr.at(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_2900
     * @tc.name testUint16ArrayOfTwo029
     * @tc.desc Verify of(-0x8000) 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(-0x8000);
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_3000
     * @tc.name testUint16ArrayOfTwo030
     * @tc.desc Verify of(0b1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0b1);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_3100
     * @tc.name testUint16ArrayOfTwo031
     * @tc.desc Verify of(0b1111111111111111) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0b1111111111111111);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_3200
     * @tc.name testUint16ArrayOfTwo032
     * @tc.desc Verify of(0b10000000000000000) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0b10000000000000000);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_3300
     * @tc.name testUint16ArrayOfTwo033
     * @tc.desc Verify of(0.0, 65535.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0.0, 65535.0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_3400
     * @tc.name testUint16ArrayOfTwo034
     * @tc.desc Verify of(65536.0, -1.0) 0 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(65536.0, -1.0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_3500
     * @tc.name testUint16ArrayOfTwo035
     * @tc.desc Verify of(3.14, 65535.9) 3 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(3.14, 65535.9);
      expect(arr.at(0)).assertEqual(3);
      expect(arr.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_3600
     * @tc.name testUint16ArrayOfTwo036
     * @tc.desc Verify of(NaN, Infinity) NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(Number.NaN, Number.POSITIVE_INFINITY);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_3700
     * @tc.name testUint16ArrayOfTwo037
     * @tc.desc Verify of(-0.5, 32768.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(-0.5, 32768.5);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_3800
     * @tc.name testUint16ArrayOfTwo038
     * @tc.desc Verify of(0xFF, 0xFFFF) 255 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0xFF, 0xFFFF);
      expect(arr.at(0)).assertEqual(255);
      expect(arr.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_3900
     * @tc.name testUint16ArrayOfTwo039
     * @tc.desc Verify of(0b1, 0b10, 0b100) 1, 2, 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0b1, 0b10, 0b100);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_4000
     * @tc.name testUint16ArrayOfTwo040
     * @tc.desc Verify of(0o10, 0o100, 0o1000) 8, 64, 512
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0o10, 0o100, 0o1000);
      expect(arr.at(0)).assertEqual(8);
      expect(arr.at(1)).assertEqual(64);
      expect(arr.at(2)).assertEqual(512);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_4100
     * @tc.name testUint16ArrayOfTwo041
     * @tc.desc Verify of(32768.0, 32768.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(32768.0, 32768.0);
      expect(arr.at(0)).assertEqual(32768);
      expect(arr.at(1)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_4200
     * @tc.name testUint16ArrayOfTwo042
     * @tc.desc Verify of(0.0, 0.0, 0.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0.0, 0.0, 0.0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_4300
     * @tc.name testUint16ArrayOfTwo043
     * @tc.desc Verify of(65535.0, 65535.0, 65535.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(65535.0, 65535.0, 65535.0);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_4400
     * @tc.name testUint16ArrayOfTwo044
     * @tc.desc Verify of(1.0, 65535.0, 1.0, 65535.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1.0, 65535.0, 1.0, 65535.0);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_4500
     * @tc.name testUint16ArrayOfTwo045
     * @tc.desc Verify of(-1.0, -1.0, -1.0) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(-1.0, -1.0, -1.0);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_4600
     * @tc.name testUint16ArrayOfTwo046
     * @tc.desc Verify of(65536.0, 65536.0, 65536.0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(65536.0, 65536.0, 65536.0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_4700
     * @tc.name testUint16ArrayOfTwo047
     * @tc.desc Verify of(100.0, 200.0, 300.0, 400.0, 500.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100.0, 200.0, 300.0, 400.0, 500.0);
      expect(arr.at(0)).assertEqual(100);
      expect(arr.at(1)).assertEqual(200);
      expect(arr.at(2)).assertEqual(300);
      expect(arr.at(3)).assertEqual(400);
      expect(arr.at(4)).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_4800
     * @tc.name testUint16ArrayOfTwo048
     * @tc.desc Verify of(1.0, 3.14, 65535.9, -1.0, 65536.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1.0, 3.14, 65535.9, -1.0, 65536.0);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(3);
      expect(arr.at(2)).assertEqual(65535);
      expect(arr.at(3)).assertEqual(65535);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_4900
     * @tc.name testUint16ArrayOfTwo049
     * @tc.desc Verify of(-Infinity, NaN, Infinity) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(-Number.POSITIVE_INFINITY, Number.NaN, Number.POSITIVE_INFINITY);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_5000
     * @tc.name testUint16ArrayOfTwo050
     * @tc.desc Verify of(0x7FFF, 0x8000, 0xFFFF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0x7FFF, 0x8000, 0xFFFF);
      expect(arr.at(0)).assertEqual(32767);
      expect(arr.at(1)).assertEqual(32768);
      expect(arr.at(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_5100
     * @tc.name testUint16ArrayOfTwo051
     * @tc.desc Verify of(0b0, 0b1111111111111111, 0b10000000000000000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0b0, 0b1111111111111111, 0b10000000000000000);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_5200
     * @tc.name testUint16ArrayOfTwo052
     * @tc.desc Verify of(-0.0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(-0.0);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_5300
     * @tc.name testUint16ArrayOfTwo053
     * @tc.desc Verify of(32768.9) 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(32768.9);
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_5400
     * @tc.name testUint16ArrayOfTwo054
     * @tc.desc Verify of(32767.1) 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(32767.1);
      expect(arr.at(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_5500
     * @tc.name testUint16ArrayOfTwo055
     * @tc.desc Verify of() Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10.0, 20.0);
      expect(arr instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_5600
     * @tc.name testUint16ArrayOfTwo056
     * @tc.desc Verify of() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10.0, 20.0, 30.0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_5700
     * @tc.name testUint16ArrayOfTwo057
     * @tc.desc Verify of() byteLength 2 * length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10.0, 20.0);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_5800
     * @tc.name testUint16ArrayOfTwo058
     * @tc.desc Verify of() byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10.0, 20.0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_5900
     * @tc.name testUint16ArrayOfTwo059
     * @tc.desc Verify of() BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10.0, 20.0);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_6000
     * @tc.name testUint16ArrayOfTwo060
     * @tc.desc Verify of() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10.0, 20.0);
      expect(arr.buffer.byteLength).assertEqual(4);
      expect(arr.buffer.byteLength).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_6200
     * @tc.name testUint16ArrayOfTwo062
     * @tc.desc Verify of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10.0, 20.0, 30.0, 40.0);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
      expect(arr.at(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_6300
     * @tc.name testUint16ArrayOfTwo063
     * @tc.desc Verify of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10.0, 20.0);
      let count: int = 0;
      for (const val of arr) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_6400
     * @tc.name testUint16ArrayOfTwo064
     * @tc.desc Verify of(-2.0) 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(-2.0);
      expect(arr.at(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_6500
     * @tc.name testUint16ArrayOfTwo065
     * @tc.desc Verify of(196608.0) 65536*3 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(196608.0);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_6600
     * @tc.name testUint16ArrayOfTwo066
     * @tc.desc Verify of(65536.0 * 1000.0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(65536.0 * 1000.0);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_6700
     * @tc.name testUint16ArrayOfTwo067
     * @tc.desc Verify of(65536.0 * 1000.0 + 1234.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(65536.0 * 1000.0 + 1234.0);
      expect(arr.at(0)).assertEqual(1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_6800
     * @tc.name testUint16ArrayOfTwo068
     * @tc.desc Verify of(0x1FFFF) 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0x1FFFF);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_6900
     * @tc.name testUint16ArrayOfTwo069
     * @tc.desc Verify of(0x10001) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0x10001);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_7000
     * @tc.name testUint16ArrayOfTwo070
     * @tc.desc Verify of(65535, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(65535.0, 0.0);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_7100
     * @tc.name testUint16ArrayOfTwo071
     * @tc.desc Verify of(100.0 + 200.0) 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100.0 + 200.0);
      expect(arr.at(0)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_7200
     * @tc.name testUint16ArrayOfTwo072
     * @tc.desc Verify of(65535.0 - 1.0) 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(65535.0 - 1.0);
      expect(arr.at(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_7300
     * @tc.name testUint16ArrayOfTwo073
     * @tc.desc Verify of(65535.0 + 1.0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(65535.0 + 1.0);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_7400
     * @tc.name testUint16ArrayOfTwo074
     * @tc.desc Verify of(10.0 * 10.0) 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10.0 * 10.0);
      expect(arr.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_7500
     * @tc.name testUint16ArrayOfTwo075
     * @tc.desc Verify of(65536.0 / 2.0) 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(65536.0 / 2.0);
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_7600
     * @tc.name testUint16ArrayOfTwo076
     * @tc.desc Verify of(100.0 * 655.36)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(100.0 * 655.36);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_7700
     * @tc.name testUint16ArrayOfTwo077
     * @tc.desc Verify of() 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(
        65535.0, 65535.0, 65535.0, 65535.0, 65535.0,
        65535.0, 65535.0, 65535.0, 65535.0, 65535.0,
        65535.0, 65535.0, 65535.0, 65535.0, 65535.0,
        65535.0, 65535.0, 65535.0, 65535.0, 65535.0,
        65535.0, 65535.0, 65535.0, 65535.0, 65535.0
      );
      expect(arr.length).assertEqual(25);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.at(i)).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_7800
     * @tc.name testUint16ArrayOfTwo078
     * @tc.desc Verify of() 0 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(
        0.0, 65535.0, 0.0, 65535.0, 0.0,
        65535.0, 0.0, 65535.0, 0.0, 65535.0,
        0.0, 65535.0, 0.0, 65535.0, 0.0,
        65535.0, 0.0, 65535.0, 0.0, 65535.0,
        0.0, 65535.0, 0.0, 65535.0, 0.0,
        65535.0, 0.0, 65535.0, 0.0, 65535.0,
        0.0, 65535.0, 0.0, 65535.0, 0.0,
        65535.0, 0.0, 65535.0, 0.0, 65535.0,
        0.0, 65535.0, 0.0, 65535.0, 0.0,
        65535.0, 0.0, 65535.0, 0.0, 65535.0
      );
      expect(arr.length).assertEqual(50);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.at(i)).assertEqual(i % 2 === 0 ? 0 : 65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_7900
     * @tc.name testUint16ArrayOfTwo079
     * @tc.desc Verify of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(
        0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9,
        0xA, 0xB, 0xC, 0xD, 0xE, 0xF, 0x10, 0x11, 0x12, 0x13
      );
      expect(arr.length).assertEqual(20);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.at(i)).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_8000
     * @tc.name testUint16ArrayOfTwo080
     * @tc.desc Verify of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(
        0.0, 1.1, 2.9, 3.14, 4.99, 5.01, 6.5, 7.999, 8.0, 9.9999,
        10.0, 32767.1, 32768.9, 65534.0, 65535.9,
        65536.0, -0.5, -1.0, Number.NaN, Number.POSITIVE_INFINITY,
        -Number.POSITIVE_INFINITY, 0xFF, 0o777, 0b1010, 1e4,
        0x7FFF, 0x8000, 0xFFFF, 0x10000, 100000.0
      );
      expect(arr.length).assertEqual(30);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(4)).assertEqual(4);
      expect(arr.at(14)).assertEqual(65535);
      expect(arr.at(15)).assertEqual(0);
      expect(arr.at(16)).assertEqual(0);
      expect(arr.at(17)).assertEqual(65535);
      expect(arr.at(18)).assertEqual(0);
      expect(arr.at(19)).assertEqual(0);
      expect(arr.at(20)).assertEqual(0);
      expect(arr.at(21)).assertEqual(255);
      expect(arr.at(22)).assertEqual(511);
      expect(arr.at(23)).assertEqual(10);
      expect(arr.at(24)).assertEqual(10000);
      expect(arr.at(25)).assertEqual(32767);
      expect(arr.at(26)).assertEqual(32768);
      expect(arr.at(27)).assertEqual(65535);
      expect(arr.at(28)).assertEqual(0);
      expect(arr.at(29)).assertEqual(34464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_8100
     * @tc.name testUint16ArrayOfTwo081
     * @tc.desc Verify of with value -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(-32768);
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_8200
     * @tc.name testUint16ArrayOfTwo082
     * @tc.desc Verify of with 7 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5, 6, 7);
      expect(arr.length).assertEqual(7);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.at(i)).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_8300
     * @tc.name testUint16ArrayOfTwo083
     * @tc.desc Verify of with value 65536 * 2 + 100 (100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(65536 * 2 + 100);
      expect(arr.at(0)).assertEqual(100);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_8500
     * @tc.name testUint16ArrayOfTwo085
     * @tc.desc Verify of with mixed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0x10001, -2, 65535.9, 123.456);
      expect(arr.length).assertEqual(4);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(65534);
      expect(arr.at(2)).assertEqual(65535);
      expect(arr.at(3)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_8600
     * @tc.name testUint16ArrayOfTwo086
     * @tc.desc Verify Uint16Array.of empty argument list creates an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Uint16Array = Uint16Array.of();
            expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_8700
     * @tc.name testUint16ArrayOfTwo087
     * @tc.desc Verify Uint16Array.of result preserves argument order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Uint16Array = Uint16Array.of(3, 1, 2);
            expect(result.at(0)).assertEqual(3);
            expect(result.at(1)).assertEqual(1);
            expect(result.at(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_8800
     * @tc.name testUint16ArrayOfTwo088
     * @tc.desc Verify Uint16Array.of mixed conversion classes are applied per argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Uint16Array = Uint16Array.of(-1, 65536, 3.9);
            expect(result.at(0)).assertEqual(65535);
            expect(result.at(1)).assertEqual(0);
            expect(result.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_8900
     * @tc.name testUint16ArrayOfTwo089
     * @tc.desc Verify Uint16Array.of result elements can be mutated independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Uint16Array = Uint16Array.of(1, 2);
            result[0] = 9;
            expect(result.at(0)).assertEqual(9);
            expect(result.at(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_OF_TWO_9000
     * @tc.name testUint16ArrayOfTwo090
     * @tc.desc Verify separate Uint16Array.of calls allocate independent backing storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayOfTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Uint16Array = Uint16Array.of(1, 2);
      let second: Uint16Array = Uint16Array.of(1, 2);
      first[0] = 9;
      second[1] = 8;
      expect(first.at(1)).assertEqual(2);
      expect(first.at(0)).assertEqual(9);
      expect(second.at(0)).assertEqual(1);
    });

  });
}
