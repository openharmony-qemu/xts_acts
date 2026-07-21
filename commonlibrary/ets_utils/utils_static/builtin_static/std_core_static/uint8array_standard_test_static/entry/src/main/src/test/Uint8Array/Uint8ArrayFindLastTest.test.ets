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

export default function Uint8ArrayFindLastTest(): void {
  describe('Uint8ArrayFindLastTest', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_0100
     * @tc.name testUint8ArrayFindLast001
     * @tc.desc Verify findLast matches last element 5 in [1,2,3,4,5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 5; });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_0200
     * @tc.name testUint8ArrayFindLast002
     * @tc.desc Verify findLast matches 1 as last element in decreasing array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 4, 3, 2, 1);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 1; });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_0300
     * @tc.name testUint8ArrayFindLast003
     * @tc.desc Verify findLast matches 0 in array with zero value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 1, 2);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 0; });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_0400
     * @tc.name testUint8ArrayFindLast004
     * @tc.desc Verify findLast matches 255 in single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(255);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 255; });
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_0500
     * @tc.name testUint8ArrayFindLast005
     * @tc.desc Verify findLast matches middle value 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 127, 255);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 127; });
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_0600
     * @tc.name testUint8ArrayFindLast006
     * @tc.desc Verify findLast matches greater than 200 returns 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 127, 255);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v > 200; });
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_0700
     * @tc.name testUint8ArrayFindLast007
     * @tc.desc Verify findLast matches less than 100 returns 0 (last satisfying value)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 127, 255);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v < 100; });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_0800
     * @tc.name testUint8ArrayFindLast008
     * @tc.desc Verify findLast matches hexadecimal literal 0x00
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0x00, 0x80, 0xFF);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 0x00; });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_0900
     * @tc.name testUint8ArrayFindLast009
     * @tc.desc Verify findLast matches repeated value returns last occurrence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(100, 200, 100);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 100; });
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_1000
     * @tc.name testUint8ArrayFindLast010
     * @tc.desc Verify findLast matches 200 in repeated array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(100, 200, 100);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 200; });
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_1100
     * @tc.name testUint8ArrayFindLast011
     * @tc.desc Verify findLast matches 256 overflow truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(256, 5);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 0; });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_1200
     * @tc.name testUint8ArrayFindLast012
     * @tc.desc Verify findLast matches -1 truncated to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(256, -1);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 255; });
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_1300
     * @tc.name testUint8ArrayFindLast013
     * @tc.desc Verify findLast matches last element value >= 4 returns 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v >= 4; });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_1400
     * @tc.name testUint8ArrayFindLast014
     * @tc.desc Verify findLast matches less than or equal to 3 returns 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v <= 3; });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_1500
     * @tc.name testUint8ArrayFindLast015
     * @tc.desc Verify findLast matches not equal to 3 returns 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v !== 3; });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_1600
     * @tc.name testUint8ArrayFindLast016
     * @tc.desc Verify findLast matches greater than 0 in array containing 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 0, 0, 1, 0);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v > 0; });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_1700
     * @tc.name testUint8ArrayFindLast017
     * @tc.desc Verify findLast matches 0 in all-zero array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 0, 0, 0, 0);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 0; });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_1800
     * @tc.name testUint8ArrayFindLast018
     * @tc.desc Verify findLast matches odd numbers, returns 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v % 2 !== 0; });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_1900
     * @tc.name testUint8ArrayFindLast019
     * @tc.desc Verify findLast matches greater than 200 in mixed value array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 200, 255);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v > 200; });
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_2000
     * @tc.name testUint8ArrayFindLast020
     * @tc.desc Verify findLast matches less than 200 returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 200, 255);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v < 200; });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_2100
     * @tc.name testUint8ArrayFindLast021
     * @tc.desc Verify findLast matches index 0 returns 10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return i === 0; });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_2200
     * @tc.name testUint8ArrayFindLast022
     * @tc.desc Verify findLast matches index 2 returns 30
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return i === 2; });
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_2300
     * @tc.name testUint8ArrayFindLast023
     * @tc.desc Verify findLast returns value 50 at matching index 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return i === 4; });
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_2400
     * @tc.name testUint8ArrayFindLast024
     * @tc.desc Verify findLast matches index less than 2 returns 20
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return i < 2; });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_2500
     * @tc.name testUint8ArrayFindLast025
     * @tc.desc Verify findLast matches index >= 3 returns 50
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return i >= 3; });
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_2600
     * @tc.name testUint8ArrayFindLast026
     * @tc.desc Verify findLast matches index !== 4 returns 40
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return i !== 4; });
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_2700
     * @tc.name testUint8ArrayFindLast027
     * @tc.desc Verify findLast matches index 1 or 3 returns 40
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return i === 1 || i === 3; });
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_2800
     * @tc.name testUint8ArrayFindLast028
     * @tc.desc Verify findLast matches index > 0 in array with non-zero at end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 0, 0, 0, 0);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return i > 0; });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_2900
     * @tc.name testUint8ArrayFindLast029
     * @tc.desc Verify findLast matches index < 4 in array with 5 at end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 0, 0, 0, 5);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return i < 4; });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_3000
     * @tc.name testUint8ArrayFindLast030
     * @tc.desc Verify findLast matches index >= 0 returns last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return i >= 0; });
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_3100
     * @tc.name testUint8ArrayFindLast031
     * @tc.desc Verify findLast matches array length equals 3 returns last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: number | undefined = arr.findLast((v: number, i: int, a: Uint8Array): boolean => { return a.length === 3; });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_3200
     * @tc.name testUint8ArrayFindLast032
     * @tc.desc Verify findLast matches array reference equals external variable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: number | undefined = arr.findLast((v: number, i: int, a: Uint8Array): boolean => { return a === arr; });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_3300
     * @tc.name testUint8ArrayFindLast033
     * @tc.desc Verify findLast matches array first element equals 1 returns last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: number | undefined = arr.findLast((v: number, i: int, a: Uint8Array): boolean => { return a[0] === 1; });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_3400
     * @tc.name testUint8ArrayFindLast034
     * @tc.desc Verify findLast matches array last element equals 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number, i: int, a: Uint8Array): boolean => { return a[a.length - 1] === 5; });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_3500
     * @tc.name testUint8ArrayFindLast035
     * @tc.desc Verify findLast matches value and array parameter combination
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: number | undefined = arr.findLast((v: number, i: int, a: Uint8Array): boolean => { return v > 0 && a.length === 3; });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_3600
     * @tc.name testUint8ArrayFindLast036
     * @tc.desc Verify findLast matches value>3 and index<4 returns 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return v > 3 && i < 4; });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_3700
     * @tc.name testUint8ArrayFindLast037
     * @tc.desc Verify findLast matches value===1 and index===3 in all-1 array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 1, 1, 1, 1);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return v === 1 && i === 3; });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_3800
     * @tc.name testUint8ArrayFindLast038
     * @tc.desc Verify findLast matches value===2 and adjacent element check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number, i: int, a: Uint8Array): boolean => { return v === 2 && a[i + 1] === 3; });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_3900
     * @tc.name testUint8ArrayFindLast039
     * @tc.desc Verify findLast matches index>=2 and value>=4 returns 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return i >= 2 && v >= 4; });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_4000
     * @tc.name testUint8ArrayFindLast040
     * @tc.desc Verify findLast matches index<4 and value<5 returns 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return i < 4 && v < 5; });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_4100
     * @tc.name testUint8ArrayFindLast041
     * @tc.desc Verify findLast matches arr[i] equals value returns last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: number | undefined = arr.findLast((v: number, i: int, a: Uint8Array): boolean => { return a[i] === v; });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_4200
     * @tc.name testUint8ArrayFindLast042
     * @tc.desc Verify findLast matches arr[0] equals value only at index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: number | undefined = arr.findLast((v: number, i: int, a: Uint8Array): boolean => { return a[0] === v; });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_4300
     * @tc.name testUint8ArrayFindLast043
     * @tc.desc Verify findLast returns value equal to or greater than 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v >= 3; });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_4400
     * @tc.name testUint8ArrayFindLast044
     * @tc.desc Verify findLast with predicate always true returns last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: number | undefined = arr.findLast((): boolean => { return true; });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_4500
     * @tc.name testUint8ArrayFindLast045
     * @tc.desc Verify findLast on single element array with predicate always true returns that element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(42);
      let result: number | undefined = arr.findLast((): boolean => { return true; });
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_4600
     * @tc.name testUint8ArrayFindLast046
     * @tc.desc Verify findLast matches 0 returns 0 not undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 0; });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_4700
     * @tc.name testUint8ArrayFindLast047
     * @tc.desc Verify findLast with multiple 0 values returns last 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 0, 0);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 0; });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_4800
     * @tc.name testUint8ArrayFindLast048
     * @tc.desc Verify findLast does not change original array length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let lenBefore: int = arr.length;
      arr.findLast((v: number): boolean => { return v > 3; });
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_4900
     * @tc.name testUint8ArrayFindLast049
     * @tc.desc Verify findLast does not change original array elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      arr.findLast((v: number): boolean => { return v > 3; });
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_5000
     * @tc.name testUint8ArrayFindLast050
     * @tc.desc Verify findLast consistency across multiple calls
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let r1: number = arr.findLast((v: number): boolean => { return v > 2; });
      let r2: number = arr.findLast((v: number): boolean => { return v > 2; });
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_5100
     * @tc.name testUint8ArrayFindLast051
     * @tc.desc Verify findLast result equals arr[findLastIndex]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let idx: int = arr.findLastIndex((v: number): boolean => { return v > 2; });
      let val: number = arr.findLast((v: number): boolean => { return v > 2; });
      expect(val).assertEqual(arr[idx]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_5200
     * @tc.name testUint8ArrayFindLast052
     * @tc.desc Verify findLast throws ClassCastError when passed undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      try {
        arr.findLast(undefined as ESObject as (value: number, index: int, array: Uint8Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_5300
     * @tc.name testUint8ArrayFindLast053
     * @tc.desc Verify findLast propagates Error thrown in predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      try {
        arr.findLast((v: number): boolean => {
          throw new Error('test error');
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_5400
     * @tc.name testUint8ArrayFindLast054
     * @tc.desc Verify findLast propagates TypeError thrown in predicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      try {
        arr.findLast((v: number): boolean => {
          throw new TypeError('type error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect((e as Error).name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_5500
     * @tc.name testUint8ArrayFindLast055
     * @tc.desc Verify findLast propagates error at first traversal element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let callCount: int = 0;
      try {
        arr.findLast((v: number): boolean => {
          callCount++;
          if (callCount === 1) {
            throw new Error('first call error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_5600
     * @tc.name testUint8ArrayFindLast056
     * @tc.desc Verify findLast propagates error at last traversal element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let callCount: int = 0;
      try {
        arr.findLast((v: number): boolean => {
          callCount++;
          if (callCount === 3) {
            throw new Error('last call error');
          }
          return v > 3;
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_5700
     * @tc.name testUint8ArrayFindLast057
     * @tc.desc Verify findLast traverses from tail to head, returns last element matching
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v > 3; });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_5800
     * @tc.name testUint8ArrayFindLast058
     * @tc.desc Verify findLast returns last element greater than 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v > 4; });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_5900
     * @tc.name testUint8ArrayFindLast059
     * @tc.desc Verify findLast in decreasing array v<3 returns 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 4, 3, 2, 1);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v < 3; });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_6000
     * @tc.name testUint8ArrayFindLast060
     * @tc.desc Verify findLast v<4 in decreasing array returns 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 4, 3, 2, 1);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v < 4; });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_6100
     * @tc.name testUint8ArrayFindLast061
     * @tc.desc Verify findLast v<5 in decreasing array returns 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 4, 3, 2, 1);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v < 5; });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_6200
     * @tc.name testUint8ArrayFindLast062
     * @tc.desc Verify findLast v>3 in decreasing array returns 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 4, 3, 2, 1);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v > 3; });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_6300
     * @tc.name testUint8ArrayFindLast063
     * @tc.desc Verify findLast repeated value v===2 returns last occurrence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 2, 1);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 2; });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_6400
     * @tc.name testUint8ArrayFindLast064
     * @tc.desc Verify findLast repeated value v===1 returns last occurrence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 2, 1);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 1; });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_6500
     * @tc.name testUint8ArrayFindLast065
     * @tc.desc Verify findLast v<3 in repeated array returns 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 2, 1);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v < 3; });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_6600
     * @tc.name testUint8ArrayFindLast066
     * @tc.desc Verify findLast v>=2 in decreasing array returns 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 4, 3, 2, 1);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v >= 2; });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_6700
     * @tc.name testUint8ArrayFindLast067
     * @tc.desc Verify findLast v===5 in [5,5,5,3,5] returns value 5 at last matching index 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 5, 5, 3, 5);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 5; });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_6800
     * @tc.name testUint8ArrayFindLast068
     * @tc.desc Verify findLast v===3 in [5,5,5,3,5] returns 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 5, 5, 3, 5);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 3; });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_6900
     * @tc.name testUint8ArrayFindLast069
     * @tc.desc Verify findLast v===1 in [1,1,1,1,2] returns value 1 at last matching index 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 1, 1, 1, 2);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 1; });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_7000
     * @tc.name testUint8ArrayFindLast070
     * @tc.desc Verify findLast v===1 in array with first and last as 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(2, 1, 1, 1, 1);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 1; });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_7100
     * @tc.name testUint8ArrayFindLast071
     * @tc.desc Verify findLast v>=1 all match returns last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v >= 1; });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_7200
     * @tc.name testUint8ArrayFindLast072
     * @tc.desc Verify findLast v===1 in [0,0,0,1,0] returns 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 0, 0, 1, 0);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 1; });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_7300
     * @tc.name testUint8ArrayFindLast073
     * @tc.desc Verify findLast v===1 in [0,1,0,1,0] returns last occurrence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 1, 0, 1, 0);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 1; });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_7400
     * @tc.name testUint8ArrayFindLast074
     * @tc.desc Verify findLast v===1 in [1,0,1,0,1] returns last occurrence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 0, 1, 0, 1);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 1; });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_7500
     * @tc.name testUint8ArrayFindLast075
     * @tc.desc Verify findLast even index match in increasing array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return i % 2 === 0; });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_7600
     * @tc.name testUint8ArrayFindLast076
     * @tc.desc Verify findLast on length 100 increasing array matches last value 99
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr[i] = i;
      }
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 99; });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_7700
     * @tc.name testUint8ArrayFindLast077
     * @tc.desc Verify findLast on length 100 increasing array matches greater than 98
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr[i] = i;
      }
      let result: number | undefined = arr.findLast((v: number): boolean => { return v > 98; });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_7800
     * @tc.name testUint8ArrayFindLast078
     * @tc.desc Verify findLast on length 100 array matches index 50
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr[i] = i;
      }
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return i === 50; });
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_7900
     * @tc.name testUint8ArrayFindLast079
     * @tc.desc Verify findLast on Uint8Array created from FixedArray
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixed: number[] = [10, 20, 30, 40, 50];
      let arr: Uint8Array = new Uint8Array(fixed);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v > 25; });
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_8000
     * @tc.name testUint8ArrayFindLast080
     * @tc.desc Verify findLast on Uint8Array created from ArrayBuffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let arr: Uint8Array = new Uint8Array(buf);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 30; });
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_8100
     * @tc.name testUint8ArrayFindLast081
     * @tc.desc Verify findLast on Uint8Array copied from another Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint8Array = Uint8Array.of(5, 10, 15, 20);
      let arr: Uint8Array = new Uint8Array(src);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v % 10 === 0; });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_8200
     * @tc.name testUint8ArrayFindLast082
     * @tc.desc Verify findLast on 0-255 full value array matches 0xFF
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(256);
      for (let i: int = 0; i < 256; i++) {
        arr[i] = i;
      }
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 0xFF; });
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_8300
     * @tc.name testUint8ArrayFindLast083
     * @tc.desc Verify findLast with function expression syntax
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const isGreaterThan3 = (v: number): boolean => {
        return v > 3;
      };
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast(isGreaterThan3);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_8400
     * @tc.name testUint8ArrayFindLast084
     * @tc.desc Verify findLast predicate accesses external closure variable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threshold: number = 3;
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v > threshold; });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_8500
     * @tc.name testUint8ArrayFindLast085
     * @tc.desc Verify findLast with mixed radix literals
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0x0A, 0xFF, 0b10, 0o77);
      let result: number | undefined = arr.findLast((v: number): boolean => { return v === 0xFF; });
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_8600
     * @tc.name testUint8ArrayFindLast086
     * @tc.desc Verify findLast matches value>0 and even index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return v > 0 && i % 2 === 0; });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_8700
     * @tc.name testUint8ArrayFindLast087
     * @tc.desc Verify findLast matches value<5 and odd index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.findLast((v: number, i: int): boolean => { return v < 5 && i % 2 === 1; });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST_8800
     * @tc.name testUint8ArrayFindLast088
     * @tc.desc Verify findLast reads but does not modify original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      arr.findLast((v: number, i: int, a: Uint8Array): boolean => {
        let x: number = a[0];
        return v > 3;
      });
      expect(arr[0]).assertEqual(1);
    });

  });
}