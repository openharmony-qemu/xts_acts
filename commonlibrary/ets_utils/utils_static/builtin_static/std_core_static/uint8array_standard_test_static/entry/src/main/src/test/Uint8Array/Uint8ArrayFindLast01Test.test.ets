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

export default function Uint8ArrayFindLast01Test(): void {
  describe('Uint8ArrayFindLast01Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_0100
     * @tc.name testUint8ArrayFindLast001
     * @tc.desc Verify findLast with 1 parameter and inline arrow function callback is correctly called
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: number = arr.findLast((value: number): boolean => value > 5);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_0200
     * @tc.name testUint8ArrayFindLast002
     * @tc.desc Verify findLast with arrow function expression body as callback
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: number = arr.findLast((v: number): boolean => v > 2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_0300
     * @tc.name testUint8ArrayFindLast003
     * @tc.desc Verify findLast with arrow function block body with explicit return as callback
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: number = arr.findLast((v: number): boolean => {
        return v > 1;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_0400
     * @tc.name testUint8ArrayFindLast004
     * @tc.desc Verify findLast callback captures external closure variable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threshold: number = 100;
      const arr: Uint8Array = new Uint8Array([50, 150, 250]);
      const result: number = arr.findLast((v: number): boolean => v > threshold);
      expect(result).assertEqual(250);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_0500
     * @tc.name testUint8ArrayFindLast005
     * @tc.desc Verify findLast on single element array with minimum value 0 matching value === 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0]);
      const result: number = arr.findLast((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_0600
     * @tc.name testUint8ArrayFindLast006
     * @tc.desc Verify findLast on single element array with maximum value 255 matching value === 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255]);
      const result: number = arr.findLast((v: number): boolean => v === 255);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_0700
     * @tc.name testUint8ArrayFindLast007
     * @tc.desc Verify findLast on single element array with boundary value 128 matching value === 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([128]);
      const result: number = arr.findLast((v: number): boolean => v === 128);
      expect(result).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_0800
     * @tc.name testUint8ArrayFindLast008
     * @tc.desc Verify findLast on single element array with middle value 127 matching value === 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([127]);
      const result: number = arr.findLast((v: number): boolean => v === 127);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_0900
     * @tc.name testUint8ArrayFindLast009
     * @tc.desc Verify findLast on array containing minimum value 0 in three elements matching value === 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 100, 200]);
      const result: number = arr.findLast((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_1000
     * @tc.name testUint8ArrayFindLast010
     * @tc.desc Verify findLast on array containing maximum value 255 in three elements matching value === 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 100, 255]);
      const result: number = arr.findLast((v: number): boolean => v === 255);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_1100
     * @tc.name testUint8ArrayFindLast011
     * @tc.desc Verify findLast on array containing middle value 127 in three elements matching value === 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 127, 255]);
      const result: number = arr.findLast((v: number): boolean => v === 127);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_1200
     * @tc.name testUint8ArrayFindLast012
     * @tc.desc Verify findLast on array containing boundary value 128 in three elements matching value === 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 128, 255]);
      const result: number = arr.findLast((v: number): boolean => v === 128);
      expect(result).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_1300
     * @tc.name testUint8ArrayFindLast013
     * @tc.desc Verify findLast on four elements with all boundary values matching value > 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 127, 128, 255]);
      const result: number = arr.findLast((v: number): boolean => v > 127);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_1400
     * @tc.name testUint8ArrayFindLast014
     * @tc.desc Verify findLast on four elements with all boundary values matching value >= 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 127, 128, 255]);
      const result: number = arr.findLast((v: number): boolean => v >= 128);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_1500
     * @tc.name testUint8ArrayFindLast015
     * @tc.desc Verify findLast on four elements with all boundary values matching value <= 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 127, 128, 255]);
      const result: number = arr.findLast((v: number): boolean => v <= 128);
      expect(result).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_1600
     * @tc.name testUint8ArrayFindLast016
     * @tc.desc Verify findLast on four elements with all boundary values matching value < 129
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 127, 128, 255]);
      const result: number = arr.findLast((v: number): boolean => v < 129);
      expect(result).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_1700
     * @tc.name testUint8ArrayFindLast017
     * @tc.desc Verify findLast on four elements with all boundary values matching value < 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 127, 128, 255]);
      const result: number = arr.findLast((v: number): boolean => v < 128);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_1800
     * @tc.name testUint8ArrayFindLast018
     * @tc.desc Verify findLast on three elements all same value 100 matching value === 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([100, 100, 100]);
      const result: number = arr.findLast((v: number): boolean => v === 100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_1900
     * @tc.name testUint8ArrayFindLast019
     * @tc.desc Verify findLast on array containing overflow value 256 truncated to 0 matching value === 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([256]);
      const result: number = arr.findLast((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_2000
     * @tc.name testUint8ArrayFindLast020
     * @tc.desc Verify findLast on array containing negative value -1 wrapped to 255 matching value === 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([-1]);
      const result: number = arr.findLast((v: number): boolean => v === 255);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_2100
     * @tc.name testUint8ArrayFindLast021
     * @tc.desc Verify findLast on array containing float 0.5 truncated to 0 matching value === 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0.5]);
      const result: number = arr.findLast((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_2200
     * @tc.name testUint8ArrayFindLast022
     * @tc.desc Verify findLast on array containing float 255.9 truncated to 255 matching value === 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255.9]);
      const result: number = arr.findLast((v: number): boolean => v === 255);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_2300
     * @tc.name testUint8ArrayFindLast023
     * @tc.desc Verify findLast on array containing float 256.1 truncated and wrapped to 0 matching value === 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([256.1]);
      const result: number = arr.findLast((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_2400
     * @tc.name testUint8ArrayFindLast024
     * @tc.desc Verify findLast on array containing negative float -0.5 truncated to 0 matching value === 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([-0.5]);
      const result: number = arr.findLast((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_2500
     * @tc.name testUint8ArrayFindLast025
     * @tc.desc Verify findLast on array with hexadecimal literal 0xFF as element matching value === 0xFF
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0x00, 0x80, 0xFF]);
      const result: number = arr.findLast((v: number): boolean => v === 0xFF);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_2600
     * @tc.name testUint8ArrayFindLast026
     * @tc.desc Verify findLast on array with binary literal 0b11111111 as element matching value === 0b11111111
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0b00000000, 0b01111111, 0b11111111]);
      const result: number = arr.findLast((v: number): boolean => v === 0b11111111);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_2700
     * @tc.name testUint8ArrayFindLast027
     * @tc.desc Verify findLast on array with octal literal 0o377 as element matching value === 0o377
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0o0, 0o177, 0o377]);
      const result: number = arr.findLast((v: number): boolean => v === 0o377);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_2800
     * @tc.name testUint8ArrayFindLast028
     * @tc.desc Verify findLast on array with scientific notation 1e2 as element matching value === 1e2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1e0, 5e1, 1e2]);
      const result: number = arr.findLast((v: number): boolean => v === 1e2);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_2900
     * @tc.name testUint8ArrayFindLast029
     * @tc.desc Verify findLast callback checking index === 0 captures first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: number = arr.findLast((v: number, i: int): boolean => i === 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_3000
     * @tc.name testUint8ArrayFindLast030
     * @tc.desc Verify findLast callback checking index === 2 captures last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: number = arr.findLast((v: number, i: int): boolean => i === 2);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_3100
     * @tc.name testUint8ArrayFindLast031
     * @tc.desc Verify findLast callback checking index === array.length - 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: number = arr.findLast((v: number, i: int, a: Uint8Array): boolean => i === a.length - 1);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_3200
     * @tc.name testUint8ArrayFindLast032
     * @tc.desc Verify findLast callback checking index is even
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 10, 15, 20, 25]);
      const result: number = arr.findLast((v: number, i: int): boolean => i % 2 === 0);
      expect(result).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_3300
     * @tc.name testUint8ArrayFindLast033
     * @tc.desc Verify findLast callback combining value and index compound condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40]);
      const result: number = arr.findLast((v: number, i: int): boolean => v > 10 && i > 1);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_3400
     * @tc.name testUint8ArrayFindLast034
     * @tc.desc Verify findLast callback checking index > 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: number = arr.findLast((v: number, i: int): boolean => i > 2);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_3500
     * @tc.name testUint8ArrayFindLast035
     * @tc.desc Verify findLast callback referencing array[0] compared with current value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 10, 5]);
      const result: number = arr.findLast((v: number, i: int, a: Uint8Array): boolean => v === a[0]);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_3600
     * @tc.name testUint8ArrayFindLast036
     * @tc.desc Verify findLast callback referencing array.length compared with current value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([3, 2, 1]);
      const result: number = arr.findLast((v: number, i: int, a: Uint8Array): boolean => v < a.length);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_3700
     * @tc.name testUint8ArrayFindLast037
     * @tc.desc Verify findLast callback referencing array[i] self-reference always true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([7, 8, 9]);
      const result: number = arr.findLast((v: number, i: int, a: Uint8Array): boolean => v === a[i]);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_3800
     * @tc.name testUint8ArrayFindLast038
     * @tc.desc Verify findLast callback checking array[array.length - 1] > value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 10, 15]);
      const result: number = arr.findLast((v: number, i: int, a: Uint8Array): boolean => a[a.length - 1] > v);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_3900
     * @tc.name testUint8ArrayFindLast039
     * @tc.desc Verify findLast on duplicate values [10, 20, 10] with callback value === 10 returns last occurrence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 10]);
      const result: number = arr.findLast((v: number): boolean => v === 10);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_4000
     * @tc.name testUint8ArrayFindLast040
     * @tc.desc Verify findLast on all same values [1, 1, 1] with callback value === 1 returns last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 1, 1]);
      const result: number = arr.findLast((v: number): boolean => v === 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_4100
     * @tc.name testUint8ArrayFindLast041
     * @tc.desc Verify findLast on ascending sequence [5, 10, 15] with callback value > 8 finds last match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 10, 15]);
      const result: number = arr.findLast((v: number): boolean => v > 8);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_4200
     * @tc.name testUint8ArrayFindLast042
     * @tc.desc Verify findLast on ascending sequence [5, 10, 15] with callback value > 12 finds last match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 10, 15]);
      const result: number = arr.findLast((v: number): boolean => v > 12);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_4300
     * @tc.name testUint8ArrayFindLast043
     * @tc.desc Verify findLast on descending sequence [15, 10, 5] with callback value > 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([15, 10, 5]);
      const result: number = arr.findLast((v: number): boolean => v > 4);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_4400
     * @tc.name testUint8ArrayFindLast044
     * @tc.desc Verify findLast on descending sequence [15, 10, 5] with callback value > 10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([15, 10, 5]);
      const result: number = arr.findLast((v: number): boolean => v > 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_4500
     * @tc.name testUint8ArrayFindLast045
     * @tc.desc Verify findLast on duplicate values [1, 2, 3, 2, 1] with callback value === 2 returns last occurrence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 2, 1]);
      const result: number = arr.findLast((v: number): boolean => v === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_4600
     * @tc.name testUint8ArrayFindLast046
     * @tc.desc Verify findLast on duplicate values [1, 2, 3, 2, 1] with callback value > 1 returns last match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 2, 1]);
      const result: number = arr.findLast((v: number): boolean => v > 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_4700
     * @tc.name testUint8ArrayFindLast047
     * @tc.desc Verify findLast callback using strict equality
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 100, 200]);
      const result: number = arr.findLast((v: number): boolean => v === 200);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_4800
     * @tc.name testUint8ArrayFindLast048
     * @tc.desc Verify findLast callback using inequality
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 100, 200]);
      const result: number = arr.findLast((v: number): boolean => v !== 0);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_4900
     * @tc.name testUint8ArrayFindLast049
     * @tc.desc Verify findLast callback using greater than
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 100, 200]);
      const result: number = arr.findLast((v: number): boolean => v > 100);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_5000
     * @tc.name testUint8ArrayFindLast050
     * @tc.desc Verify findLast callback using greater than or equal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 100, 200]);
      const result: number = arr.findLast((v: number): boolean => v >= 200);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_5100
     * @tc.name testUint8ArrayFindLast051
     * @tc.desc Verify findLast callback using less than
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 100, 200]);
      const result: number = arr.findLast((v: number): boolean => v < 200);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_5200
     * @tc.name testUint8ArrayFindLast052
     * @tc.desc Verify findLast callback using less than or equal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 100, 200]);
      const result: number = arr.findLast((v: number): boolean => v <= 100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_5300
     * @tc.name testUint8ArrayFindLast053
     * @tc.desc Verify findLast callback value >= 0 matches all elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 100, 255]);
      const result: number = arr.findLast((v: number): boolean => v >= 0);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_5400
     * @tc.name testUint8ArrayFindLast054
     * @tc.desc Verify findLast callback value <= 255 matches all elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 100, 255]);
      const result: number = arr.findLast((v: number): boolean => v <= 255);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_5500
     * @tc.name testUint8ArrayFindLast055
     * @tc.desc Verify findLast callback using compound AND condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 127, 128, 255]);
      const result: number = arr.findLast((v: number): boolean => v > 0 && v < 255);
      expect(result).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_5600
     * @tc.name testUint8ArrayFindLast056
     * @tc.desc Verify findLast callback using compound OR condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 127, 128, 255]);
      const result: number = arr.findLast((v: number): boolean => v === 127 || v === 255);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_5700
     * @tc.name testUint8ArrayFindLast057
     * @tc.desc Verify findLast callback using negation ! operator
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 100, 255]);
      const result: number = arr.findLast((v: number): boolean => !(v > 100));
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_5800
     * @tc.name testUint8ArrayFindLast058
     * @tc.desc Verify findLast callback using arithmetic expression 255 - v > 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([100, 200, 250]);
      const result: number = arr.findLast((v: number): boolean => 255 - v > 0);
      expect(result).assertEqual(250);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_5900
     * @tc.name testUint8ArrayFindLast059
     * @tc.desc Verify findLast callback using arithmetic expression v + 10 > 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([100, 200, 250]);
      const result: number = arr.findLast((v: number): boolean => v + 10 > 255);
      expect(result).assertEqual(250);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_6000
     * @tc.name testUint8ArrayFindLast060
     * @tc.desc Verify findLast callback using operator priority expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([0, 100, 200]);
      const result: number = arr.findLast((v: number): boolean => (v > 50) && (v < 250));
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_6100
     * @tc.name testUint8ArrayFindLast061
     * @tc.desc Verify findLast callback returning true literal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: number = arr.findLast((v: number): boolean => true);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_6200
     * @tc.name testUint8ArrayFindLast062
     * @tc.desc Verify findLast callback using comparison expression value === 20
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: number = arr.findLast((v: number): boolean => v === 20);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST1_6300
     * @tc.name testUint8ArrayFindLast063
     * @tc.desc Verify findLast callback using compound boolean expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: number = arr.findLast((v: number): boolean => v >= 10 && v <= 30);
      expect(result).assertEqual(30);
    });
  });
}