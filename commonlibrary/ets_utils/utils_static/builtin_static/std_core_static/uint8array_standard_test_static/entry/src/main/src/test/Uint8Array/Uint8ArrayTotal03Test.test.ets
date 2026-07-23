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

export default function Uint8ArrayTotal03Test(): void {
  describe('Uint8ArrayTotal03Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});
    afterAll(() => {});


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0010
     * @tc.name testUint8ArrayTotal001
     * @tc.desc Verify includes returns false when fromIndex equals length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.includes(10, 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0020
     * @tc.name testUint8ArrayTotal002
     * @tc.desc Verify includes returns false when fromIndex far exceeds length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.includes(10, 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0030
     * @tc.name testUint8ArrayTotal003
     * @tc.desc Verify includes returns true when fromIndex is negative and abs(fromIndex) exceeds length, fromIndex clamped to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.includes(10, -100);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0040
     * @tc.name testUint8ArrayTotal004
     * @tc.desc Verify includes returns true when fromIndex is negative and element exists in range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.includes(40, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0050
     * @tc.name testUint8ArrayTotal005
     * @tc.desc Verify includes returns false for non-existent element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.includes(99);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0060
     * @tc.name testUint8ArrayTotal006
     * @tc.desc Verify includes returns true for element at first index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.includes(10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0070
     * @tc.name testUint8ArrayTotal007
     * @tc.desc Verify includes returns true for element at last index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.includes(50);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0080
     * @tc.name testUint8ArrayTotal008
     * @tc.desc Verify includes returns true for element at middle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.includes(30);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0090
     * @tc.name testUint8ArrayTotal009
     * @tc.desc Verify includes with fromIndex=0 returns true for existing element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.includes(10, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0100
     * @tc.name testUint8ArrayTotal010
     * @tc.desc Verify includes with fromIndex=4 finds last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.includes(50, 4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0110
     * @tc.name testUint8ArrayTotal011
     * @tc.desc Verify includes with fromIndex=0 on single element array returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5]);
      let result = arr.includes(5, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0120
     * @tc.name testUint8ArrayTotal012
     * @tc.desc Verify includes with fromIndex=1 on single element array returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5]);
      let result = arr.includes(5, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0130
     * @tc.name testUint8ArrayTotal013
     * @tc.desc Verify includes returns true for zero value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 1, 2]);
      let result = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0140
     * @tc.name testUint8ArrayTotal014
     * @tc.desc Verify includes returns true for 255 max value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255]);
      let result = arr.includes(255);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0150
     * @tc.name testUint8ArrayTotal015
     * @tc.desc Verify includes returns true for value 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([128]);
      let result = arr.includes(128);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0160
     * @tc.name testUint8ArrayTotal016
     * @tc.desc Verify indexOf returns -1 when fromIndex equals length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.indexOf(10, 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0170
     * @tc.name testUint8ArrayTotal017
     * @tc.desc Verify indexOf returns -1 when fromIndex far exceeds length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.indexOf(10, 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0180
     * @tc.name testUint8ArrayTotal018
     * @tc.desc Verify indexOf returns 0 for first element with default fromIndex
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.indexOf(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0190
     * @tc.name testUint8ArrayTotal019
     * @tc.desc Verify indexOf returns 4 for last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.indexOf(50);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0200
     * @tc.name testUint8ArrayTotal020
     * @tc.desc Verify indexOf returns 2 for middle element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.indexOf(30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0210
     * @tc.name testUint8ArrayTotal021
     * @tc.desc Verify indexOf returns -1 for non-existent element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.indexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0220
     * @tc.name testUint8ArrayTotal022
     * @tc.desc Verify indexOf returns first occurrence for duplicate values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 10, 40, 50]);
      let result = arr.indexOf(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0230
     * @tc.name testUint8ArrayTotal023
     * @tc.desc Verify indexOf with fromIndex=2 skips earlier duplicate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 10, 40, 50]);
      let result = arr.indexOf(10, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0240
     * @tc.name testUint8ArrayTotal024
     * @tc.desc Verify lastIndexOf returns last occurrence for duplicate values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 10, 40, 50]);
      let result = arr.lastIndexOf(10);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0250
     * @tc.name testUint8ArrayTotal025
     * @tc.desc Verify lastIndexOf returns -1 for non-existent element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.lastIndexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0260
     * @tc.name testUint8ArrayTotal026
     * @tc.desc Verify lastIndexOf returns 4 for last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.lastIndexOf(50);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0270
     * @tc.name testUint8ArrayTotal027
     * @tc.desc Verify lastIndexOf with fromIndex=0 returns first element if matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.lastIndexOf(10, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0280
     * @tc.name testUint8ArrayTotal028
     * @tc.desc Verify lastIndexOf with negative fromIndex searches from offset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.lastIndexOf(50, -1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0290
     * @tc.name testUint8ArrayTotal029
     * @tc.desc Verify indexOf returns 0 when fromIndex is negative and abs(fromIndex) exceeds length, fromIndex clamped to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.indexOf(10, -100);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0300
     * @tc.name testUint8ArrayTotal030
     * @tc.desc Verify indexOf with fromIndex=-2 finds element in last two positions
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.indexOf(40, -2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0310
     * @tc.name testUint8ArrayTotal031
     * @tc.desc Verify lastIndexOf with fromIndex=-3 searches only first 3 positions from end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.lastIndexOf(50, -3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0320
     * @tc.name testUint8ArrayTotal032
     * @tc.desc Verify indexOf works with 0 value on array containing zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 1, 2]);
      let result = arr.indexOf(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0330
     * @tc.name testUint8ArrayTotal033
     * @tc.desc Verify indexOf works with 255 max value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255]);
      let result = arr.indexOf(255);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0340
     * @tc.name testUint8ArrayTotal034
     * @tc.desc Verify lastIndexOf works for single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([42]);
      let result = arr.lastIndexOf(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0350
     * @tc.name testUint8ArrayTotal035
     * @tc.desc Verify indexOf on empty array returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      let result = arr.indexOf(10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0360
     * @tc.name testUint8ArrayTotal036
     * @tc.desc Verify includes on empty array returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      let result = arr.includes(10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0370
     * @tc.name testUint8ArrayTotal037
     * @tc.desc Verify lastIndexOf on empty array returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      let result = arr.lastIndexOf(10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0380
     * @tc.name testUint8ArrayTotal038
     * @tc.desc Verify indexOf with fromIndex=-0 treated as 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.indexOf(10, -0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0390
     * @tc.name testUint8ArrayTotal039
     * @tc.desc Verify findIndex returns index of matching element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.findIndex((val: number): boolean => val > 25);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0400
     * @tc.name testUint8ArrayTotal040
     * @tc.desc Verify findIndex returns -1 when no element matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result = arr.findIndex((val: number): boolean => val > 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0410
     * @tc.name testUint8ArrayTotal041
     * @tc.desc Verify find returns matching element value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.find((val: number): boolean => val > 25);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0420
     * @tc.name testUint8ArrayTotal042
     * @tc.desc Verify find returns undefined when no element matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result = arr.find((val: number): boolean => val > 100);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0430
     * @tc.name testUint8ArrayTotal043
     * @tc.desc Verify some returns true when at least one element matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.some((val: number): boolean => val > 25);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0440
     * @tc.name testUint8ArrayTotal044
     * @tc.desc Verify some returns false when no element matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result = arr.some((val: number): boolean => val > 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0450
     * @tc.name testUint8ArrayTotal045
     * @tc.desc Verify every returns true when all elements match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result = arr.every((val: number): boolean => val > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0460
     * @tc.name testUint8ArrayTotal046
     * @tc.desc Verify every returns false when at least one element fails
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result = arr.every((val: number): boolean => val > 15);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0470
     * @tc.name testUint8ArrayTotal047
     * @tc.desc Verify Uint8Array.from([256]) overflow source truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([256]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0480
     * @tc.name testUint8ArrayTotal048
     * @tc.desc Verify Uint8Array.from([-1]) negative source wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([-1]);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0490
     * @tc.name testUint8ArrayTotal049
     * @tc.desc Verify Uint8Array.from([3.14]) float truncates to 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([3.14]);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0500
     * @tc.name testUint8ArrayTotal050
     * @tc.desc Verify Uint8Array.from([-3.14]) negative float truncates and wraps
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([-3.14]);
      expect(arr[0]).assertEqual(253);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0510
     * @tc.name testUint8ArrayTotal051
     * @tc.desc Verify Uint8Array.from([NaN]) source NaN truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([Number.NaN]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0520
     * @tc.name testUint8ArrayTotal052
     * @tc.desc Verify Uint8Array.from([-Infinity]) source negative infinity truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([Number.NEGATIVE_INFINITY]);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0530
     * @tc.name testUint8ArrayTotal053
     * @tc.desc Verify Uint8Array.from([Infinity]) source positive infinity truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([Number.POSITIVE_INFINITY]);
      expect(arr[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0540
     * @tc.name testUint8ArrayTotal054
     * @tc.desc Verify constructor with negative int length -1 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Uint8Array = new Uint8Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0550
     * @tc.name testUint8ArrayTotal055
     * @tc.desc Verify constructor with large negative int length -100 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Uint8Array = new Uint8Array(-100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0560
     * @tc.name testUint8ArrayTotal056
     * @tc.desc Verify constructor with negative number length -1.0 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Uint8Array = new Uint8Array(-1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0570
     * @tc.name testUint8ArrayTotal057
     * @tc.desc Verify constructor with ArrayBuffer offset exceeding buffer length throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        let arr: Uint8Array = new Uint8Array(buf, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0580
     * @tc.name testUint8ArrayTotal058
     * @tc.desc Verify constructor with ArrayBuffer length exceeding buffer throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        let arr: Uint8Array = new Uint8Array(buf, 0, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0590
     * @tc.name testUint8ArrayTotal059
     * @tc.desc Verify constructor with ArrayBuffer offset+length exceeding buffer throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        let arr: Uint8Array = new Uint8Array(buf, 8, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0600
     * @tc.name testUint8ArrayTotal060
     * @tc.desc Verify constructor with negative ArrayBuffer offset throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        let arr: Uint8Array = new Uint8Array(buf, -1);
        expect().assertFail();
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0610
     * @tc.name testUint8ArrayTotal061
     * @tc.desc Verify $_get with negative index -1 returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        let result = arr.$_get(-1);
        expect(result).assertUndefined();
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0620
     * @tc.name testUint8ArrayTotal062
     * @tc.desc Verify $_get with negative index -5 equals -length returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        let result = arr.$_get(-5);
        expect(result).assertUndefined();
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0630
     * @tc.name testUint8ArrayTotal063
     * @tc.desc Verify $_get with negative index -6 equals -length-1 returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        let result = arr.$_get(-6);
        expect(result).assertUndefined();
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0640
     * @tc.name testUint8ArrayTotal064
     * @tc.desc Verify $_get with index 5 equals length returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        let result = arr.$_get(5);
        expect(result).assertUndefined();
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0650
     * @tc.name testUint8ArrayTotal065
     * @tc.desc Verify $_get with index 6 equals length+1 returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        let result = arr.$_get(6);
        expect(result).assertUndefined();
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0660
     * @tc.name testUint8ArrayTotal066
     * @tc.desc Verify $_get with large positive index 100000 returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        let result = arr.$_get(100000);
        expect(result).assertUndefined();
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0670
     * @tc.name testUint8ArrayTotal067
     * @tc.desc Verify $_get with large negative index -100000 returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        let result = arr.$_get(-100000);
        expect(result).assertUndefined();
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0680
     * @tc.name testUint8ArrayTotal068
     * @tc.desc Verify $_set with negative index -1 does not modify array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.$_set(-1, 99);
        expect(arr[0]).assertEqual(10);
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0690
     * @tc.name testUint8ArrayTotal069
     * @tc.desc Verify $_set with negative index -5 equals -length does not modify array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.$_set(-5, 99);
        expect(arr[0]).assertEqual(10);
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0700
     * @tc.name testUint8ArrayTotal070
     * @tc.desc Verify $_set with negative index -6 equals -length-1 does not modify array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.$_set(-6, 99);
        expect(arr[0]).assertEqual(10);
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0710
     * @tc.name testUint8ArrayTotal071
     * @tc.desc Verify $_set with index 5 equals length does not modify array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.$_set(5, 99);
        expect(arr[0]).assertEqual(10);
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0720
     * @tc.name testUint8ArrayTotal072
     * @tc.desc Verify $_set with index 6 equals length+1 does not modify array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.$_set(6, 99);
        expect(arr[0]).assertEqual(10);
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0730
     * @tc.name testUint8ArrayTotal073
     * @tc.desc Verify $_set with large positive index 100000 does not modify array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.$_set(100000, 99);
        expect(arr[0]).assertEqual(10);
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0740
     * @tc.name testUint8ArrayTotal074
     * @tc.desc Verify $_set with large negative index -100000 does not modify array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.$_set(-100000, 99);
        expect(arr[0]).assertEqual(10);
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0750
     * @tc.name testUint8ArrayTotal075
     * @tc.desc Verify $_set with value 256 overflows and truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.$_set(0, 256);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0760
     * @tc.name testUint8ArrayTotal076
     * @tc.desc Verify $_set with value -1 wraps around to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.$_set(0, -1);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0770
     * @tc.name testUint8ArrayTotal077
     * @tc.desc Verify $_set with value 512 multiple overflow wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.$_set(0, 512);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0780
     * @tc.name testUint8ArrayTotal078
     * @tc.desc Verify $_set with value -257 negative multiple wraps to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.$_set(0, -257);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0790
     * @tc.name testUint8ArrayTotal079
     * @tc.desc Verify $_set with float value 3.14 truncates to 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.$_set(0, 3.14);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0800
     * @tc.name testUint8ArrayTotal080
     * @tc.desc Verify $_set with float value 255.9 truncates to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.$_set(0, 255.9);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0810
     * @tc.name testUint8ArrayTotal081
     * @tc.desc Verify $_set with negative float -3.14 truncates and wraps to 253
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr.$_set(0, -3.14);
      expect(arr[0]).assertEqual(253);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0820
     * @tc.name testUint8ArrayTotal082
     * @tc.desc Verify at with index 5 equals length returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.at(5);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0830
     * @tc.name testUint8ArrayTotal083
     * @tc.desc Verify at with index 6 equals length+1 returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.at(6);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0840
     * @tc.name testUint8ArrayTotal084
     * @tc.desc Verify at with index -6 equals -length-1 returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.at(-6);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0850
     * @tc.name testUint8ArrayTotal085
     * @tc.desc Verify at with large positive index 100000 returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.at(100000);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0860
     * @tc.name testUint8ArrayTotal086
     * @tc.desc Verify at with large negative index -100000 returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.at(-100000);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0870
     * @tc.name testUint8ArrayTotal087
     * @tc.desc Verify with with index -6 equals -length-1 throws IndexOutOfBoundsError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.with(-6, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0880
     * @tc.name testUint8ArrayTotal088
     * @tc.desc Verify with with index 5 equals length throws IndexOutOfBoundsError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.with(5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0890
     * @tc.name testUint8ArrayTotal089
     * @tc.desc Verify with with index 6 equals length+1 throws IndexOutOfBoundsError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.with(6, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0900
     * @tc.name testUint8ArrayTotal090
     * @tc.desc Verify with with large positive index 100000 throws IndexOutOfBoundsError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.with(100000, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0910
     * @tc.name testUint8ArrayTotal091
     * @tc.desc Verify with with large negative index -100000 throws IndexOutOfBoundsError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.with(-100000, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0920
     * @tc.name testUint8ArrayTotal092
     * @tc.desc Verify set with negative offset -1 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.set([99], -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0930
     * @tc.name testUint8ArrayTotal093
     * @tc.desc Verify set with offset+source length exceeding this throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.set([99, 100], 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0940
     * @tc.name testUint8ArrayTotal094
     * @tc.desc Verify set with offset equal to length throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.set([99, 100], 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0950
     * @tc.name testUint8ArrayTotal095
     * @tc.desc Verify set with large positive offset 100000 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.set([99], 100000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0960
     * @tc.name testUint8ArrayTotal096
     * @tc.desc Verify set with large negative offset -100000 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.set([99], -100000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0970
     * @tc.name testUint8ArrayTotal097
     * @tc.desc Verify set with source array exceeding total target length throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.set([1, 2, 3, 4, 5, 6], 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0980
     * @tc.name testUint8ArrayTotal098
     * @tc.desc Verify set with Uint8Array source and offset exceeding throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      try {
        arr.set([1, 2, 3], 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_0990
     * @tc.name testUint8ArrayTotal099
     * @tc.desc Verify copyWithin with negative target copies from 2nd last position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      arr.copyWithin(-2, 0);
      expect(arr.join(',')).assertEqual('10,20,30,10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1000
     * @tc.name testUint8ArrayTotal100
     * @tc.desc Verify copyWithin with negative start copies from 2nd last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      arr.copyWithin(0, -2);
      expect(arr.join(',')).assertEqual('40,50,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1010
     * @tc.name testUint8ArrayTotal101
     * @tc.desc Verify copyWithin with negative end excludes the last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      arr.copyWithin(0, 1, -1);
      expect(arr.join(',')).assertEqual('20,30,40,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1020
     * @tc.name testUint8ArrayTotal102
     * @tc.desc Verify copyWithin with start far beyond length leaves array unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      arr.copyWithin(0, 100);
      expect(arr.join(',')).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1030
     * @tc.name testUint8ArrayTotal103
     * @tc.desc Verify copyWithin with start greater than end leaves array unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      arr.copyWithin(0, 3, 1);
      expect(arr.join(',')).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1040
     * @tc.name testUint8ArrayTotal104
     * @tc.desc Verify copyWithin with large negative start clamps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      arr.copyWithin(0, -100, 2);
      expect(arr.join(',')).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1050
     * @tc.name testUint8ArrayTotal105
     * @tc.desc Verify copyWithin with negative target beyond start clamps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      arr.copyWithin(-100, 2, 4);
      expect(arr.join(',')).assertEqual('30,40,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1060
     * @tc.name testUint8ArrayTotal106
     * @tc.desc Verify copyWithin with positive indices copies middle segment to front
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      arr.copyWithin(0, 2, 4);
      expect(arr.join(',')).assertEqual('30,40,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1070
     * @tc.name testUint8ArrayTotal107
     * @tc.desc Verify copyWithin with overlapping ranges copies correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(1, 0, 3);
      expect(arr.join(',')).assertEqual('1,1,2,3,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1080
     * @tc.name testUint8ArrayTotal108
     * @tc.desc Verify fill with negative end clamps to 0, no fill
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      arr.fill(99, 0, -100);
      expect(arr.join(',')).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1090
     * @tc.name testUint8ArrayTotal109
     * @tc.desc Verify fill with negative start replaces from that offset to end
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      arr.fill(88, -2);
      expect(arr.join(',')).assertEqual('10,20,30,88,88');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1100
     * @tc.name testUint8ArrayTotal110
     * @tc.desc Verify fill with start greater than end leaves array unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      arr.fill(77, 4, 2);
      expect(arr.join(',')).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1110
     * @tc.name testUint8ArrayTotal111
     * @tc.desc Verify fill with large overflow end clamps to length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      arr.fill(66, 0, 100);
      expect(arr.join(',')).assertEqual('66,66,66,66,66');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1120
     * @tc.name testUint8ArrayTotal112
     * @tc.desc Verify fill with large negative start clamps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      arr.fill(55, -100, 2);
      expect(arr.join(',')).assertEqual('55,55,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1130
     * @tc.name testUint8ArrayTotal113
     * @tc.desc Verify fill on empty array with default indices does nothing
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      arr.fill(99);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1140
     * @tc.name testUint8ArrayTotal114
     * @tc.desc Verify ArrayBuffer offset mismatch with subarray byteOffset - offset must be multiple of element size
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.subarray(1, 4);
      expect(result.byteOffset).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1150
     * @tc.name testUint8ArrayTotal115
     * @tc.desc Verify subarray with negative begin takes last elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.subarray(-2);
      expect(result.join(',')).assertEqual('40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1160
     * @tc.name testUint8ArrayTotal116
     * @tc.desc Verify subarray with negative begin and end selects elements between
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.subarray(-4, -1);
      expect(result.join(',')).assertEqual('20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1170
     * @tc.name testUint8ArrayTotal117
     * @tc.desc Verify subarray with begin greater than end returns empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.subarray(4, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1180
     * @tc.name testUint8ArrayTotal118
     * @tc.desc Verify subarray with begin and end equal returns empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.subarray(2, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1190
     * @tc.name testUint8ArrayTotal119
     * @tc.desc Verify subarray with begin=0 end=length returns full copy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.subarray(0, 5);
      expect(result.join(',')).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1200
     * @tc.name testUint8ArrayTotal120
     * @tc.desc Verify subarray with begin=0 includes first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.subarray(0, 1);
      expect(result[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1210
     * @tc.name testUint8ArrayTotal121
     * @tc.desc Verify subarray with begin=length-1 takes last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.subarray(4);
      expect(result[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1220
     * @tc.name testUint8ArrayTotal122
     * @tc.desc Verify subarray with begin=length returns empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.subarray(5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1230
     * @tc.name testUint8ArrayTotal123
     * @tc.desc Verify subarray with begin far beyond length returns empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.subarray(100);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1240
     * @tc.name testUint8ArrayTotal124
     * @tc.desc Verify subarray with begin=0 end far beyond length truncates to all elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.subarray(0, 100);
      expect(result.join(',')).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1250
     * @tc.name testUint8ArrayTotal125
     * @tc.desc Verify subarray with large negative begin clamps to 0 and takes all
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.subarray(-100);
      expect(result.join(',')).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TOTAL03_1260
     * @tc.name testUint8ArrayTotal126
     * @tc.desc Verify subarray with large negative begin clamps to 0 and takes first 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayTotal126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.subarray(-100, 2);
      expect(result.join(',')).assertEqual('10,20');
    });
  });
}