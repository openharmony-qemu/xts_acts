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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Uint8ArrayOf01Test(): void {
  describe('Uint8ArrayOf01Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_0100
     * @tc.name testUint8ArrayOf001
     * @tc.desc Verify of() with empty parameter list creates non-null Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of();
      expect(arr).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_0200
     * @tc.name testUint8ArrayOf002
     * @tc.desc Verify of(17) with single parameter has length 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(17);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_0300
     * @tc.name testUint8ArrayOf003
     * @tc.desc Verify of(99, 199) with two parameters has length 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(99, 199);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_0400
     * @tc.name testUint8ArrayOf004
     * @tc.desc Verify of(11, 22, 33) with three parameters has length 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(11, 22, 33);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_0500
     * @tc.name testUint8ArrayOf005
     * @tc.desc Verify of(1,2,3,4,5,6,7,8,9,10) with ten parameters has length 10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_0600
     * @tc.name testUint8ArrayOf006
     * @tc.desc Verify of(0) with minimum value boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_0700
     * @tc.name testUint8ArrayOf007
     * @tc.desc Verify of(255) with maximum value boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255);
      expect(arr.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_0800
     * @tc.name testUint8ArrayOf008
     * @tc.desc Verify of(128) with mid-value+1 boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(128);
      expect(arr.at(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_0900
     * @tc.name testUint8ArrayOf009
     * @tc.desc Verify of(127) with mid-value boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(127);
      expect(arr.at(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_1000
     * @tc.name testUint8ArrayOf010
     * @tc.desc Verify of(1) with minimum positive value boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_1100
     * @tc.name testUint8ArrayOf011
     * @tc.desc Verify of(254) with maximum value-1 boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(254);
      expect(arr.at(0)).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_1200
     * @tc.name testUint8ArrayOf012
     * @tc.desc Verify of(0x00) with hexadecimal minimum value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x00);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_1300
     * @tc.name testUint8ArrayOf013
     * @tc.desc Verify of(0xFF) with hexadecimal maximum value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFF);
      expect(arr.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_1400
     * @tc.name testUint8ArrayOf014
     * @tc.desc Verify of(0x80) with hexadecimal 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x80);
      expect(arr.at(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_1500
     * @tc.name testUint8ArrayOf015
     * @tc.desc Verify of(0x0F) with hexadecimal 15
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x0F);
      expect(arr.at(0)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_1600
     * @tc.name testUint8ArrayOf016
     * @tc.desc Verify of(0xA5) with hexadecimal 165
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xA5);
      expect(arr.at(0)).assertEqual(165);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_1700
     * @tc.name testUint8ArrayOf017
     * @tc.desc Verify of(0b00000000) with binary minimum value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0b00000000);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_1800
     * @tc.name testUint8ArrayOf018
     * @tc.desc Verify of(0b11111111) with binary maximum value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0b11111111);
      expect(arr.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_1900
     * @tc.name testUint8ArrayOf019
     * @tc.desc Verify of(0b10000000) with binary 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0b10000000);
      expect(arr.at(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_2000
     * @tc.name testUint8ArrayOf020
     * @tc.desc Verify of(0b10101010) with binary 170
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0b10101010);
      expect(arr.at(0)).assertEqual(170);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_2100
     * @tc.name testUint8ArrayOf021
     * @tc.desc Verify of(0o000) with octal minimum value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0o000);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_2200
     * @tc.name testUint8ArrayOf022
     * @tc.desc Verify of(0o377) with octal maximum value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0o377);
      expect(arr.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_2300
     * @tc.name testUint8ArrayOf023
     * @tc.desc Verify of(0o200) with octal 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0o200);
      expect(arr.at(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_2400
     * @tc.name testUint8ArrayOf024
     * @tc.desc Verify of(0o077) with octal 63
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0o077);
      expect(arr.at(0)).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_2500
     * @tc.name testUint8ArrayOf025
     * @tc.desc Verify of(1+2) with addition expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1 + 2);
      expect(arr.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_2600
     * @tc.name testUint8ArrayOf026
     * @tc.desc Verify of(10-1) with subtraction expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10 - 1);
      expect(arr.at(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_2700
     * @tc.name testUint8ArrayOf027
     * @tc.desc Verify of(3*5) with multiplication expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(3 * 5);
      expect(arr.at(0)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_2800
     * @tc.name testUint8ArrayOf028
     * @tc.desc Verify of(100/2) with division expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100 / 2);
      expect(arr.at(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_2900
     * @tc.name testUint8ArrayOf029
     * @tc.desc Verify of(10%3) with modulo expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10 % 3);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_3000
     * @tc.name testUint8ArrayOf030
     * @tc.desc Verify of(1<<3) with left shift expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1 << 3);
      expect(arr.at(0)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_3100
     * @tc.name testUint8ArrayOf031
     * @tc.desc Verify of(0xFF & 0x0F) with bitwise AND expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFF & 0x0F);
      expect(arr.at(0)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_3200
     * @tc.name testUint8ArrayOf032
     * @tc.desc Verify of(0xFF ^ 0x0F) with bitwise XOR expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFF ^ 0x0F);
      expect(arr.at(0)).assertEqual(240);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_3300
     * @tc.name testUint8ArrayOf033
     * @tc.desc Verify of(0xFF | 0x00) with bitwise OR expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFF | 0x00);
      expect(arr.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_3400
     * @tc.name testUint8ArrayOf034
     * @tc.desc Verify of(0,0) with double minimum values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_3500
     * @tc.name testUint8ArrayOf035
     * @tc.desc Verify of(0,255) with minimum followed by maximum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 255);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_3600
     * @tc.name testUint8ArrayOf036
     * @tc.desc Verify of(255,0) with maximum followed by minimum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255, 0);
      expect(arr.at(0)).assertEqual(255);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_3700
     * @tc.name testUint8ArrayOf037
     * @tc.desc Verify of(127,128) with mid-value and mid-value+1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(127, 128);
      expect(arr.at(0)).assertEqual(127);
      expect(arr.at(1)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_3800
     * @tc.name testUint8ArrayOf038
     * @tc.desc Verify of(0,128) with minimum and mid-value+1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 128);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_3900
     * @tc.name testUint8ArrayOf039
     * @tc.desc Verify of(255,128) with maximum and mid-value+1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255, 128);
      expect(arr.at(0)).assertEqual(255);
      expect(arr.at(1)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_4000
     * @tc.name testUint8ArrayOf040
     * @tc.desc Verify of(1,254) with boundary values 1 and 254
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 254);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_4100
     * @tc.name testUint8ArrayOf041
     * @tc.desc Verify of(0,127,255) with increasing three values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 127, 255);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(127);
      expect(arr.at(2)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_4200
     * @tc.name testUint8ArrayOf042
     * @tc.desc Verify of(255,254,253) with decreasing three values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255, 254, 253);
      expect(arr.at(0)).assertEqual(255);
      expect(arr.at(1)).assertEqual(254);
      expect(arr.at(2)).assertEqual(253);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_4300
     * @tc.name testUint8ArrayOf043
     * @tc.desc Verify of(1,1,1,1,1) with all same values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 1, 1, 1, 1);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(1);
      expect(arr.at(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_4400
     * @tc.name testUint8ArrayOf044
     * @tc.desc Verify of(255,255,255) with all maximum values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255, 255, 255);
      expect(arr.at(0)).assertEqual(255);
      expect(arr.at(1)).assertEqual(255);
      expect(arr.at(2)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_4500
     * @tc.name testUint8ArrayOf045
     * @tc.desc Verify of(0,0,0) with all minimum values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 0, 0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_4600
     * @tc.name testUint8ArrayOf046
     * @tc.desc Verify of(128,128,128,128) with all mid-value+1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(128, 128, 128, 128);
      expect(arr.at(0)).assertEqual(128);
      expect(arr.at(1)).assertEqual(128);
      expect(arr.at(2)).assertEqual(128);
      expect(arr.at(3)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_4700
     * @tc.name testUint8ArrayOf047
     * @tc.desc Verify of(1,10,100,200) with increasing mixed values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 10, 100, 200);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(10);
      expect(arr.at(2)).assertEqual(100);
      expect(arr.at(3)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_4800
     * @tc.name testUint8ArrayOf048
     * @tc.desc Verify of() returns Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_4900
     * @tc.name testUint8ArrayOf049
     * @tc.desc Verify of(0) returns Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_5000
     * @tc.name testUint8ArrayOf050
     * @tc.desc Verify of(1,2,3) returns Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_5100
     * @tc.name testUint8ArrayOf051
     * @tc.desc Verify of() empty array has length 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_5200
     * @tc.name testUint8ArrayOf052
     * @tc.desc Verify of(0) single element array has length 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_5300
     * @tc.name testUint8ArrayOf053
     * @tc.desc Verify of(0,255) two element array has length 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 255);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_5400
     * @tc.name testUint8ArrayOf054
     * @tc.desc Verify of(1,2,3) three element array has length 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_5500
     * @tc.name testUint8ArrayOf055
     * @tc.desc Verify of(1,2,3,4,5) five element array has length 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_5600
     * @tc.name testUint8ArrayOf056
     * @tc.desc Verify of(0,1,2) read first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 2);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_5700
     * @tc.name testUint8ArrayOf057
     * @tc.desc Verify of(200,255) read tail maximum element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(200, 255);
      expect(arr.at(1)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_5800
     * @tc.name testUint8ArrayOf058
     * @tc.desc Verify of(128,64) read first element 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(128, 64);
      expect(arr.at(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_5900
     * @tc.name testUint8ArrayOf059
     * @tc.desc Verify of(0xFF,0x00) read hexadecimal first element 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFF, 0x00);
      expect(arr.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_6000
     * @tc.name testUint8ArrayOf060
     * @tc.desc Verify of(0b11111111,0b00000000) read binary first element 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0b11111111, 0b00000000);
      expect(arr.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_6100
     * @tc.name testUint8ArrayOf061
     * @tc.desc Verify of(0,255) read two elements first
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 255);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_6200
     * @tc.name testUint8ArrayOf062
     * @tc.desc Verify of(0,255) read two elements second
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 255);
      expect(arr.at(1)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_6300
     * @tc.name testUint8ArrayOf063
     * @tc.desc Verify of(1,2,3) read middle element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      expect(arr.at(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_6400
     * @tc.name testUint8ArrayOf064
     * @tc.desc Verify of(1,2,3) read last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      expect(arr.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_6500
     * @tc.name testUint8ArrayOf065
     * @tc.desc Verify of(254,255) elements near maximum value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(254, 255);
      expect(arr.at(0)).assertEqual(254);
      expect(arr.at(1)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_6600
     * @tc.name testUint8ArrayOf066
     * @tc.desc Verify of() returns array with BYTES_PER_ELEMENT 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_6700
     * @tc.name testUint8ArrayOf067
     * @tc.desc Verify of(255) returns array with BYTES_PER_ELEMENT 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_6800
     * @tc.name testUint8ArrayOf068
     * @tc.desc Verify of(1,2,3) returns array with BYTES_PER_ELEMENT 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_6900
     * @tc.name testUint8ArrayOf069
     * @tc.desc Verify of() returns array with non-null buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of();
      expect(arr.buffer).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_7000
     * @tc.name testUint8ArrayOf070
     * @tc.desc Verify of(0) returns array with buffer byteLength 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0);
      expect(arr.buffer.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_7100
     * @tc.name testUint8ArrayOf071
     * @tc.desc Verify of(0,255) returns array with buffer byteLength 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 255);
      expect(arr.buffer.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_7200
     * @tc.name testUint8ArrayOf072
     * @tc.desc Verify of() empty array has buffer byteLength 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of();
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_7300
     * @tc.name testUint8ArrayOf073
     * @tc.desc Verify of(127+128) addition reaches maximum boundary 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(127 + 128);
      expect(arr.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_7400
     * @tc.name testUint8ArrayOf074
     * @tc.desc Verify of(200+55) addition reaches maximum boundary 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(200 + 55);
      expect(arr.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_7500
     * @tc.name testUint8ArrayOf075
     * @tc.desc Verify of(300%256) modulo result 44 within byte range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(300 % 256);
      expect(arr.at(0)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_7600
     * @tc.name testUint8ArrayOf076
     * @tc.desc Verify of(1+2+3+4+5) multi-step addition sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1 + 2 + 3 + 4 + 5);
      expect(arr.at(0)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_7700
     * @tc.name testUint8ArrayOf077
     * @tc.desc Verify of(5*5*5) multiplication result 125 within byte range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5 * 5 * 5);
      expect(arr.at(0)).assertEqual(125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_7800
     * @tc.name testUint8ArrayOf078
     * @tc.desc Verify of(255<<0) left shift 0 does not change value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255 << 0);
      expect(arr.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_7900
     * @tc.name testUint8ArrayOf079
     * @tc.desc Verify of(0xFF>>1) right shift 1 gives 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFF >> 1);
      expect(arr.at(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_8000
     * @tc.name testUint8ArrayOf080
     * @tc.desc Verify of(0x100 & 0xFF) bitwise AND truncation result 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x100 & 0xFF);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_8100
     * @tc.name testUint8ArrayOf081
     * @tc.desc Verify of() empty parameters does not throw exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        const arr: Uint8Array = Uint8Array.of();
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_8200
     * @tc.name testUint8ArrayOf082
     * @tc.desc Verify of(0) single parameter does not throw exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0);
      expect(arr).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_OF01_8300
     * @tc.name testUint8ArrayOf083
     * @tc.desc Verify of(1,2,3,4,5,6,7,8,9,10) multiple parameters does not throw exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayOf083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      expect(arr).not().assertNull();
    });
  });
}