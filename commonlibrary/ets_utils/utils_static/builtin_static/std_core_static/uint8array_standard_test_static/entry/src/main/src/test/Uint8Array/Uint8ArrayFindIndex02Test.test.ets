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

export default function Uint8ArrayFindIndex02Test(): void {
  describe('Uint8ArrayFindIndex02Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_0100
     * @tc.name testUint8ArrayFindIndex001
     * @tc.desc Verify findIndex returns number type when element is found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 15, 25);
      const result: int = arr.findIndex((value: number): boolean => value === 15);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_0200
     * @tc.name testUint8ArrayFindIndex002
     * @tc.desc Verify findIndex returns number type when element is not found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: int = arr.findIndex((value: number): boolean => value > 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_0300
     * @tc.name testUint8ArrayFindIndex003
     * @tc.desc Verify findIndex returns number type on empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      const result: int = arr.findIndex((value: number): boolean => true);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_0400
     * @tc.name testUint8ArrayFindIndex004
     * @tc.desc Verify findIndex returns number type with hexadecimal comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 10, 20);
      const result: int = arr.findIndex((value: number): boolean => value === 0x0A);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_0500
     * @tc.name testUint8ArrayFindIndex005
     * @tc.desc Verify findIndex returns number type with binary comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 2);
      const result: int = arr.findIndex((value: number): boolean => value > 0b0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_0600
     * @tc.name testUint8ArrayFindIndex006
     * @tc.desc Verify array length property type after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      arr.findIndex((value: number): boolean => value === 3);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_0700
     * @tc.name testUint8ArrayFindIndex007
     * @tc.desc Verify array byteLength property type after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.findIndex((value: number): boolean => value > 5);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_0800
     * @tc.name testUint8ArrayFindIndex008
     * @tc.desc Verify array byteOffset property type after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100, 200);
      arr.findIndex((value: number): boolean => value === 200);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_0900
     * @tc.name testUint8ArrayFindIndex009
     * @tc.desc Verify array BYTES_PER_ELEMENT property type after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(50, 100, 150);
      arr.findIndex((value: number): boolean => value > 75);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_1000
     * @tc.name testUint8ArrayFindIndex010
     * @tc.desc Verify array buffer property type after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.findIndex((value: number): boolean => value === 2);
      expect(arr.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_1100
     * @tc.name testUint8ArrayFindIndex011
     * @tc.desc Verify array name property type after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(7, 14, 21);
      arr.findIndex((value: number): boolean => value % 7 === 0);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_1200
     * @tc.name testUint8ArrayFindIndex012
     * @tc.desc Verify subarray view byteOffset type after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5);
      const sub: Uint8Array = arr.subarray(1, 4);
      sub.findIndex((value: number): boolean => value === 2);
      expect(sub.byteOffset).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_1300
     * @tc.name testUint8ArrayFindIndex013
     * @tc.desc Verify subarray view byteLength type after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5);
      const sub: Uint8Array = arr.subarray(2, 5);
      sub.findIndex((value: number): boolean => value > 3);
      expect(sub.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_1400
     * @tc.name testUint8ArrayFindIndex014
     * @tc.desc Verify ArrayBuffer view byteOffset type after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view: Uint8Array = new Uint8Array(buf, 2, 4);
      view[0] = 10;
      view.findIndex((value: number): boolean => value === 10);
      expect(view.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_1500
     * @tc.name testUint8ArrayFindIndex015
     * @tc.desc Verify findIndex returns correct index with hexadecimal comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 10, 20, 30);
      const result: int = arr.findIndex((value: number): boolean => value === 0x0A);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_1600
     * @tc.name testUint8ArrayFindIndex016
     * @tc.desc Verify findIndex returns correct index with binary comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(15, 30);
      const result: int = arr.findIndex((value: number): boolean => value === 0b1111);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_1700
     * @tc.name testUint8ArrayFindIndex017
     * @tc.desc Verify findIndex returns correct index with octal comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 16);
      const result: int = arr.findIndex((value: number): boolean => value === 0o20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_1800
     * @tc.name testUint8ArrayFindIndex018
     * @tc.desc Verify findIndex returns correct index with scientific notation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 1, 1);
      const result: int = arr.findIndex((value: number): boolean => value === 1e1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_1900
     * @tc.name testUint8ArrayFindIndex019
     * @tc.desc Verify findIndex returns correct index with expression comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100, 240);
      const result: int = arr.findIndex((value: number): boolean => value === (0xFF - 0x0F));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_2000
     * @tc.name testUint8ArrayFindIndex020
     * @tc.desc Verify findIndex returns correct index with greater than comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(250, 251);
      const result: int = arr.findIndex((value: number): boolean => value > 0xFA);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_2100
     * @tc.name testUint8ArrayFindIndex021
     * @tc.desc Verify findIndex returns correct index with greater than or equal comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(127, 128);
      const result: int = arr.findIndex((value: number): boolean => value >= 0x80);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_2200
     * @tc.name testUint8ArrayFindIndex022
     * @tc.desc Verify findIndex returns correct index with less than comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100, 50, 0);
      const result: int = arr.findIndex((value: number): boolean => value < 0x40);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_2300
     * @tc.name testUint8ArrayFindIndex023
     * @tc.desc Verify findIndex returns correct index for 0x7F boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(126, 127, 128);
      const result: int = arr.findIndex((value: number): boolean => value === 0x7F);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_2400
     * @tc.name testUint8ArrayFindIndex024
     * @tc.desc Verify findIndex returns correct index for 0x80 boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(127, 128, 129);
      const result: int = arr.findIndex((value: number): boolean => value === 0x80);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_2500
     * @tc.name testUint8ArrayFindIndex025
     * @tc.desc Verify findIndex returns correct index with binary greater than comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(127, 128);
      const result: int = arr.findIndex((value: number): boolean => value > 0b01111111);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_2600
     * @tc.name testUint8ArrayFindIndex026
     * @tc.desc Verify findIndex returns correct index with arithmetic expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(30, 40);
      const result: int = arr.findIndex((value: number): boolean => value === (10 + 20));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_2700
     * @tc.name testUint8ArrayFindIndex027
     * @tc.desc Verify findIndex returns correct index for single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(50);
      const result: int = arr.findIndex((value: number): boolean => value === 50);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_2800
     * @tc.name testUint8ArrayFindIndex028
     * @tc.desc Verify findIndex returns -1 when element not found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100, 150);
      const result: int = arr.findIndex((value: number): boolean => value === 200);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_2900
     * @tc.name testUint8ArrayFindIndex029
     * @tc.desc Verify findIndex returns -1 when condition never satisfied
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 255);
      const result: int = arr.findIndex((value: number): boolean => value > 255);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_3000
     * @tc.name testUint8ArrayFindIndex030
     * @tc.desc Verify findIndex returns -1 when negative condition never satisfied
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1);
      const result: int = arr.findIndex((value: number): boolean => value < 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_3100
     * @tc.name testUint8ArrayFindIndex031
     * @tc.desc Verify findIndex returns correct index with greater than comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(201, 202, 203);
      const result: int = arr.findIndex((value: number): boolean => value > 200);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_3200
     * @tc.name testUint8ArrayFindIndex032
     * @tc.desc Verify findIndex returns correct index for 0xFF boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 255, 0);
      const result: int = arr.findIndex((value: number): boolean => value === 0xFF);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_3300
     * @tc.name testUint8ArrayFindIndex033
     * @tc.desc Verify findIndex returns correct index with not equal comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 0, 1);
      const result: int = arr.findIndex((value: number): boolean => value !== 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_3400
     * @tc.name testUint8ArrayFindIndex034
     * @tc.desc Verify findIndex returns correct index with less than or equal comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 11, 12);
      const result: int = arr.findIndex((value: number): boolean => value <= 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_3500
     * @tc.name testUint8ArrayFindIndex035
     * @tc.desc Verify findIndex returns -1 when condition never satisfied for 0xFF
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255, 254);
      const result: int = arr.findIndex((value: number): boolean => value > 0xFF);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_3600
     * @tc.name testUint8ArrayFindIndex036
     * @tc.desc Verify findIndex returns correct index with greater than or equal comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(239, 240, 241);
      const result: int = arr.findIndex((value: number): boolean => value >= 0xF0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_3700
     * @tc.name testUint8ArrayFindIndex037
     * @tc.desc Verify array length remains unchanged after findIndex finds element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      arr.findIndex((value: number): boolean => value === 30);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_3800
     * @tc.name testUint8ArrayFindIndex038
     * @tc.desc Verify array length remains unchanged after findIndex does not find element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      arr.findIndex((value: number): boolean => value > 100);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_3900
     * @tc.name testUint8ArrayFindIndex039
     * @tc.desc Verify empty array length remains 0 after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      arr.findIndex((value: number): boolean => true);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_4000
     * @tc.name testUint8ArrayFindIndex040
     * @tc.desc Verify array byteLength remains unchanged after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255, 254, 253, 252, 251);
      arr.findIndex((value: number): boolean => value > 250);
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_4100
     * @tc.name testUint8ArrayFindIndex041
     * @tc.desc Verify default view byteOffset remains 0 after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100, 200, 300);
      arr.findIndex((value: number): boolean => value === 200);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_4200
     * @tc.name testUint8ArrayFindIndex042
     * @tc.desc Verify BYTES_PER_ELEMENT remains 1 after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5, 6);
      arr.findIndex((value: number): boolean => value % 2 === 0);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_4300
     * @tc.name testUint8ArrayFindIndex043
     * @tc.desc Verify array name remains 'Uint8Array' after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(7, 14, 21, 28);
      arr.findIndex((value: number): boolean => value % 7 === 0);
      expect(arr.name).assertEqual('Uint8Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_4400
     * @tc.name testUint8ArrayFindIndex044
     * @tc.desc Verify buffer byteLength remains unchanged after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      const before: number = arr.buffer.byteLength;
      arr.findIndex((value: number): boolean => value === 3);
      expect(arr.buffer.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_4500
     * @tc.name testUint8ArrayFindIndex045
     * @tc.desc Verify large array length remains unchanged after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(100);
      arr[50] = 88;
      arr.findIndex((value: number): boolean => value === 88);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_4600
     * @tc.name testUint8ArrayFindIndex046
     * @tc.desc Verify original array length remains unchanged after subarray findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5, 6);
      const sub: Uint8Array = arr.subarray(1, 4);
      sub.findIndex((value: number): boolean => value === 2);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_4700
     * @tc.name testUint8ArrayFindIndex047
     * @tc.desc Verify subarray view byteLength remains unchanged after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 10, 20, 30, 40);
      const sub: Uint8Array = arr.subarray(1, 4);
      const subByteLen: number = sub.byteLength;
      sub.findIndex((value: number): boolean => value === 20);
      expect(sub.byteLength).assertEqual(subByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_4800
     * @tc.name testUint8ArrayFindIndex048
     * @tc.desc Verify ArrayBuffer view byteOffset remains unchanged after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view: Uint8Array = new Uint8Array(buf, 3, 3);
      view[0] = 55;
      const viewOffset: number = view.byteOffset;
      view.findIndex((value: number): boolean => value === 55);
      expect(view.byteOffset).assertEqual(viewOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_4900
     * @tc.name testUint8ArrayFindIndex049
     * @tc.desc Verify ArrayBuffer view byteLength remains unchanged after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const view: Uint8Array = new Uint8Array(buf, 2, 6);
      view[0] = 77;
      view.findIndex((value: number): boolean => value === 77);
      expect(view.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_5000
     * @tc.name testUint8ArrayFindIndex050
     * @tc.desc Verify empty ArrayBuffer view byteLength remains 0 after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      const view: Uint8Array = new Uint8Array(buf);
      view.findIndex((value: number): boolean => true);
      expect(view.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_5100
     * @tc.name testUint8ArrayFindIndex051
     * @tc.desc Verify array element at index 0 remains unchanged after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      arr.findIndex((value: number): boolean => value === 30);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_5200
     * @tc.name testUint8ArrayFindIndex052
     * @tc.desc Verify array element at index 2 remains unchanged after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      arr.findIndex((value: number): boolean => value === 30);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_5300
     * @tc.name testUint8ArrayFindIndex053
     * @tc.desc Verify array element at index 4 remains unchanged after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      arr.findIndex((value: number): boolean => value === 30);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_5400
     * @tc.name testUint8ArrayFindIndex054
     * @tc.desc Verify all array elements remain unchanged when findIndex does not find element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255, 254, 253, 0);
      arr.findIndex((value: number): boolean => value > 300);
      expect(arr[0]).assertEqual(255);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_5500
     * @tc.name testUint8ArrayFindIndex055
     * @tc.desc Verify array elements remain unchanged when findIndex finds element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(128, 64, 32, 16);
      arr.findIndex((value: number): boolean => value === 128);
      expect(arr[1]).assertEqual(64);
      expect(arr[2]).assertEqual(32);
      expect(arr[3]).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_5600
     * @tc.name testUint8ArrayFindIndex056
     * @tc.desc Verify array elements remain unchanged after findIndex finds last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 99);
      arr.findIndex((value: number): boolean => value === 99);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_5700
     * @tc.name testUint8ArrayFindIndex057
     * @tc.desc Verify array elements remain unchanged after two consecutive findIndex calls
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(11, 22, 33, 44);
      arr.findIndex((value: number): boolean => value > 20);
      arr.findIndex((value: number): boolean => value < 40);
      expect(arr[0]).assertEqual(11);
      expect(arr[1]).assertEqual(22);
      expect(arr[2]).assertEqual(33);
      expect(arr[3]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_5800
     * @tc.name testUint8ArrayFindIndex058
     * @tc.desc Verify original array elements remain unchanged after subarray findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const sub: Uint8Array = arr.subarray(1, 4);
      sub.findIndex((value: number): boolean => value === 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_5900
     * @tc.name testUint8ArrayFindIndex059
     * @tc.desc Verify underlying buffer bytes remain unchanged after ArrayBuffer view findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8Array = new Uint8Array(buf);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr.findIndex((value: number): boolean => value === 30);
      const check: Uint8Array = new Uint8Array(buf);
      expect(check[0]).assertEqual(10);
      expect(check[1]).assertEqual(20);
      expect(check[2]).assertEqual(30);
      expect(check[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_6000
     * @tc.name testUint8ArrayFindIndex060
     * @tc.desc Verify single element array element remains unchanged after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(77);
      arr.findIndex((value: number): boolean => value === 77);
      expect(arr[0]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_6100
     * @tc.name testUint8ArrayFindIndex061
     * @tc.desc Verify boundary value array elements remain unchanged after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 127, 255);
      arr.findIndex((value: number): boolean => value > 100);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(127);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_6200
     * @tc.name testUint8ArrayFindIndex062
     * @tc.desc Verify subarray view buffer refers to original array buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      const sub: Uint8Array = arr.subarray(1, 3);
      sub.findIndex((value: number): boolean => value === 2);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_6300
     * @tc.name testUint8ArrayFindIndex063
     * @tc.desc Verify subarray view byteOffset after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 5, 10, 15, 20);
      const sub: Uint8Array = arr.subarray(2, 5);
      sub.findIndex((value: number): boolean => value > 12);
      expect(sub.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_6400
     * @tc.name testUint8ArrayFindIndex064
     * @tc.desc Verify subarray view byteOffset remains unchanged after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4);
      const sub: Uint8Array = arr.subarray(1, 4);
      const offsetBefore: number = sub.byteOffset;
      sub.findIndex((value: number): boolean => value === 2);
      expect(sub.byteOffset).assertEqual(offsetBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_6500
     * @tc.name testUint8ArrayFindIndex065
     * @tc.desc Verify ArrayBuffer view byteOffset after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const view: Uint8Array = new Uint8Array(buf, 4, 4);
      view[0] = 100;
      view.findIndex((value: number): boolean => value === 100);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_6600
     * @tc.name testUint8ArrayFindIndex066
     * @tc.desc Verify ArrayBuffer view byteLength unchanged after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const view: Uint8Array = new Uint8Array(buf, 4, 6);
      view[2] = 200;
      view.findIndex((value: number): boolean => value === 200);
      expect(view.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_6700
     * @tc.name testUint8ArrayFindIndex067
     * @tc.desc Verify subarray view reflects changes to original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const sub: Uint8Array = arr.subarray(1, 4);
      arr[2] = 99;
      const result: int = sub.findIndex((value: number): boolean => value === 99);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_6800
     * @tc.name testUint8ArrayFindIndex068
     * @tc.desc Verify changes to subarray view propagate to original array findIndex
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      const sub: Uint8Array = arr.subarray(1, 4);
      sub[1] = 88;
      const result: int = arr.findIndex((value: number): boolean => value === 88);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_6900
     * @tc.name testUint8ArrayFindIndex069
     * @tc.desc Verify two subarray views sharing same buffer affect findIndex results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5, 6);
      const sub1: Uint8Array = arr.subarray(1, 5);
      const sub2: Uint8Array = arr.subarray(1, 5);
      sub1[2] = 77;
      const r1: int = sub1.findIndex((value: number): boolean => value === 77);
      const r2: int = sub2.findIndex((value: number): boolean => value === 77);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_7000
     * @tc.name testUint8ArrayFindIndex070
     * @tc.desc Verify nested subarray cumulative byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6);
      const sub1: Uint8Array = arr.subarray(1, 6);
      const sub2: Uint8Array = sub1.subarray(1, 4);
      sub2.findIndex((value: number): boolean => value === 3);
      expect(sub2.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_7100
     * @tc.name testUint8ArrayFindIndex071
     * @tc.desc Verify view can findIndex into underlying ArrayBuffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const arr: Uint8Array = new Uint8Array(buf);
      arr[3] = 50;
      const view2: Uint8Array = new Uint8Array(buf, 2, 3);
      const result: int = view2.findIndex((value: number): boolean => value === 50);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_7200
     * @tc.name testUint8ArrayFindIndex072
     * @tc.desc Verify two different offset views have independent findIndex results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const lowView: Uint8Array = new Uint8Array(buf, 0, 4);
      const highView: Uint8Array = new Uint8Array(buf, 4, 4);
      lowView[0] = 11;
      lowView[3] = 44;
      highView[0] = 55;
      highView[3] = 88;
      const r1: int = lowView.findIndex((value: number): boolean => value === 11);
      const r2: int = highView.findIndex((value: number): boolean => value === 11);
      expect(r1).assertEqual(0);
      expect(r2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_7300
     * @tc.name testUint8ArrayFindIndex073
     * @tc.desc Verify original array buffer remains unchanged after subarray findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 10, 15, 20);
      const sub: Uint8Array = arr.subarray(1, 3);
      const bufRef: ArrayBuffer = arr.buffer;
      sub.findIndex((value: number): boolean => value > 12);
      expect(arr.buffer).assertEqual(bufRef);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_7400
     * @tc.name testUint8ArrayFindIndex074
     * @tc.desc Verify ArrayBuffer view buffer unchanged after findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const view: Uint8Array = new Uint8Array(buf, 1, 4);
      view.findIndex((value: number): boolean => value === 99);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_7500
     * @tc.name testUint8ArrayFindIndex075
     * @tc.desc Verify original array byteOffset unchanged after subarray findIndex call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const sub: Uint8Array = arr.subarray(1, 4);
      sub.findIndex((value: number): boolean => value > 1);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX2_7600
     * @tc.name testUint8ArrayFindIndex076
     * @tc.desc Verify buffer byteLength unchanged after multiple view findIndex calls
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const lowView: Uint8Array = new Uint8Array(buf, 0, 6);
      const highView: Uint8Array = new Uint8Array(buf, 6, 6);
      lowView[2] = 33;
      highView[3] = 66;
      lowView.findIndex((value: number): boolean => value === 33);
      highView.findIndex((value: number): boolean => value === 66);
      expect(buf.byteLength).assertEqual(12);
    });
  });
}