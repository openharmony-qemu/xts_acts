'use static';

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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int16ArrayLastIndexOfTestTwoTest(): void {
  describe('Int16ArrayLastIndexOfTestTwoTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_0100
     * @tc.name testInt16ArrayLastIndexOfTestTwo001
     * @tc.desc Verify lastIndexOf(20) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([10, 20, 30]);
      const result: int = arr.lastIndexOf(20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_0200
     * @tc.name testInt16ArrayLastIndexOfTestTwo002
     * @tc.desc Verify lastIndexOf(1) returns -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([]);
      const result: int = arr.lastIndexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_0300
     * @tc.name testInt16ArrayLastIndexOfTestTwo003
     * @tc.desc Verify lastIndexOf(100) returns -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([5, 6, 7]);
      const result: int = arr.lastIndexOf(100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_0400
     * @tc.name testInt16ArrayLastIndexOfTestTwo004
     * @tc.desc Verify lastIndexOf(42) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([10, 20, 42]);
      const result: int = arr.lastIndexOf(42);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_0500
     * @tc.name testInt16ArrayLastIndexOfTestTwo005
     * @tc.desc Verify lastIndexOf(5,0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([5, 10, 15]);
      const result: int = arr.lastIndexOf(5, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_0600
     * @tc.name testInt16ArrayLastIndexOfTestTwo006
     * @tc.desc Verify lastIndexOf(10,0) returns -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([5, 10, 15]);
      const result: int = arr.lastIndexOf(10, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_0700
     * @tc.name testInt16ArrayLastIndexOfTestTwo007
     * @tc.desc Verify lastIndexOf(2,3) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3, 2, 1]);
      const result: int = arr.lastIndexOf(2, 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_0800
     * @tc.name testInt16ArrayLastIndexOfTestTwo008
     * @tc.desc Verify lastIndexOf(3,-2) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3, 4, 5]);
      const result: int = arr.lastIndexOf(3, -2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_0900
     * @tc.name testInt16ArrayLastIndexOfTestTwo009
     * @tc.desc Verify lastIndexOf(1,-10) returns -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3]);
      const result: int = arr.lastIndexOf(1, -10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_1000
     * @tc.name testInt16ArrayLastIndexOfTestTwo010
     * @tc.desc Verify lastIndexOf(9,2) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([7, 8, 9]);
      const result: int = arr.lastIndexOf(9, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_1100
     * @tc.name testInt16ArrayLastIndexOfTestTwo011
     * @tc.desc Verify lastIndexOf(6,3) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([4, 5, 6]);
      const result: int = arr.lastIndexOf(6, 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_1200
     * @tc.name testInt16ArrayLastIndexOfTestTwo012
     * @tc.desc Verify lastIndexOf(9) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([8, 9, 10]);
      const result: int = arr.lastIndexOf(9);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_1300
     * @tc.name testInt16ArrayLastIndexOfTestTwo013
     * @tc.desc Verify lastIndexOf(6) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([3, 6, 9]);
      const result: int = arr.lastIndexOf(6);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_1400
     * @tc.name testInt16ArrayLastIndexOfTestTwo014
     * @tc.desc Verify lastIndexOf(4) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([2, 4, 6]);
      const result: int = arr.lastIndexOf(4);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_1500
     * @tc.name testInt16ArrayLastIndexOfTestTwo015
     * @tc.desc Verify lastIndexOf(22) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([11, 22, 33]);
      const result: int = arr.lastIndexOf(22);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_1600
     * @tc.name testInt16ArrayLastIndexOfTestTwo016
     * @tc.desc Verify lastIndexOf(99) returns -1 when element not present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3]);
      const result: int = arr.lastIndexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_1700
     * @tc.name testInt16ArrayLastIndexOfTestTwo017
     * @tc.desc Verify lastIndexOf found index is less than length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([5, 10, 15, 20]);
      const result: int = arr.lastIndexOf(15);
      let actual1: boolean = result < arr.length;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_1800
     * @tc.name testInt16ArrayLastIndexOfTestTwo018
     * @tc.desc Verify lastIndexOf(10) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([10, 20, 30]);
      const result: int = arr.lastIndexOf(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_1900
     * @tc.name testInt16ArrayLastIndexOfTestTwo019
     * @tc.desc Verify lastIndexOf(-1) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([-1, 2, -1]);
      const result: int = arr.lastIndexOf(-1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_2000
     * @tc.name testInt16ArrayLastIndexOfTestTwo020
     * @tc.desc Verify lastIndexOf(2,0) returns -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([7, 2, 7]);
      const result: int = arr.lastIndexOf(2, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_2100
     * @tc.name testInt16ArrayLastIndexOfTestTwo021
     * @tc.desc Verify lastIndexOf(4,1) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([4, 4, 3, 4]);
      const result: int = arr.lastIndexOf(4, 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_2200
     * @tc.name testInt16ArrayLastIndexOfTestTwo022
     * @tc.desc Verify lastIndexOf(5,3) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([5, 6, 7]);
      const result: int = arr.lastIndexOf(5, 3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_2300
     * @tc.name testInt16ArrayLastIndexOfTestTwo023
     * @tc.desc Verify lastIndexOf(1,100) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3, 4]);
      const result: int = arr.lastIndexOf(1, 100);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_2400
     * @tc.name testInt16ArrayLastIndexOfTestTwo024
     * @tc.desc Verify lastIndexOf(4,-1) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3, 4]);
      const result: int = arr.lastIndexOf(4, -1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_2500
     * @tc.name testInt16ArrayLastIndexOfTestTwo025
     * @tc.desc Verify lastIndexOf(15,-2) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([5, 10, 15, 20]);
      const result: int = arr.lastIndexOf(15, -2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_2600
     * @tc.name testInt16ArrayLastIndexOfTestTwo026
     * @tc.desc Verify lastIndexOf(8,-3) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([8, 8, 6, 7]);
      const result: int = arr.lastIndexOf(8, -3);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_2700
     * @tc.name testInt16ArrayLastIndexOfTestTwo027
     * @tc.desc Verify lastIndexOf(9,-4) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([9, 2, 3, 4]);
      const result: int = arr.lastIndexOf(9, -4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_2800
     * @tc.name testInt16ArrayLastIndexOfTestTwo028
     * @tc.desc Verify lastIndexOf(2,-4) returns -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([9, 2, 3, 4]);
      const result: int = arr.lastIndexOf(2, -4);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_2900
     * @tc.name testInt16ArrayLastIndexOfTestTwo029
     * @tc.desc Verify lastIndexOf(5,-4) returns -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([5, 6, 7]);
      const result: int = arr.lastIndexOf(5, -4);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_3000
     * @tc.name testInt16ArrayLastIndexOfTestTwo030
     * @tc.desc Verify lastIndexOf(1) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 1, 2]);
      const result: int = arr.lastIndexOf(1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_3100
     * @tc.name testInt16ArrayLastIndexOfTestTwo031
     * @tc.desc Verify lastIndexOf(5) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([5, 5, 5, 5]);
      const result: int = arr.lastIndexOf(5);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_3200
     * @tc.name testInt16ArrayLastIndexOfTestTwo032
     * @tc.desc Verify lastIndexOf(3,2) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([3, 1, 3, 1, 3]);
      const result: int = arr.lastIndexOf(3, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_3300
     * @tc.name testInt16ArrayLastIndexOfTestTwo033
     * @tc.desc Verify lastIndexOf(4,2) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([2, 4, 2, 4, 2]);
      const result: int = arr.lastIndexOf(4, 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_3400
     * @tc.name testInt16ArrayLastIndexOfTestTwo034
     * @tc.desc Verify lastIndexOf(6) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([6, 7, 6, 8]);
      const result: int = arr.lastIndexOf(6);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_3500
     * @tc.name testInt16ArrayLastIndexOfTestTwo035
     * @tc.desc Verify lastIndexOf(9) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([9, 2, 3, 9]);
      const result: int = arr.lastIndexOf(9);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_3600
     * @tc.name testInt16ArrayLastIndexOfTestTwo036
     * @tc.desc Verify lastIndexOf(Number.NaN,2) returns -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([5, 10, 15]);
      const result: int = arr.lastIndexOf(Number.NaN, 2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_3700
     * @tc.name testInt16ArrayLastIndexOfTestTwo037
     * @tc.desc Verify lastIndexOf(65536) returns -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([5, 0, 10]);
      const result: int = arr.lastIndexOf(65536);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_3800
     * @tc.name testInt16ArrayLastIndexOfTestTwo038
     * @tc.desc Verify lastIndexOf(0.5) returns -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 0, 2]);
      const result: int = arr.lastIndexOf(0.5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_3900
     * @tc.name testInt16ArrayLastIndexOfTestTwo039
     * @tc.desc Verify lastIndexOf(0x7fff) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([32767, 100, 200]);
      const result: int = arr.lastIndexOf(0x7fff);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_4000
     * @tc.name testInt16ArrayLastIndexOfTestTwo040
     * @tc.desc Verify lastIndexOf(0x8000) returns -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([0, -32768, 50]);
      const result: int = arr.lastIndexOf(0x8000);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_4100
     * @tc.name testInt16ArrayLastIndexOfTestTwo041
     * @tc.desc Verify lastIndexOf found index is less than length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([10, 20, 30]);
      const originalLen = arr.length;
      arr.lastIndexOf(20);
      let actual1: int = arr.length;
      let expected1: number = originalLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_4200
     * @tc.name testInt16ArrayLastIndexOfTestTwo042
     * @tc.desc Verify lastIndexOf found index is less than length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([10, 20, 30]);
      const originalLen = arr.length;
      arr.lastIndexOf(999);
      let actual1: int = arr.length;
      let expected1: number = originalLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_4300
     * @tc.name testInt16ArrayLastIndexOfTestTwo043
     * @tc.desc Verify lastIndexOf found index is less than length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([]);
      arr.lastIndexOf(1);
      let actual1: int = arr.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_4400
     * @tc.name testInt16ArrayLastIndexOfTestTwo044
     * @tc.desc Verify lastIndexOf fromIndex length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3, 4, 5]);
      const originalLen = arr.length;
      arr.lastIndexOf(3, 3);
      let actual1: int = arr.length;
      let expected1: number = originalLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_4500
     * @tc.name testInt16ArrayLastIndexOfTestTwo045
     * @tc.desc Verify lastIndexOf fromIndex length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3, 4, 5]);
      const originalLen = arr.length;
      arr.lastIndexOf(4, -2);
      let actual1: int = arr.length;
      let expected1: number = originalLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_4600
     * @tc.name testInt16ArrayLastIndexOfTestTwo046
     * @tc.desc Verify lastIndexOf(NaN) does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3]);
      const originalLen = arr.length;
      arr.lastIndexOf(Number.NaN);
      let actual1: int = arr.length;
      let expected1: number = originalLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_4700
     * @tc.name testInt16ArrayLastIndexOfTestTwo047
     * @tc.desc Verify lastIndexOf found index is less than length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([-32768, 0, 32767]);
      const originalLen = arr.length;
      arr.lastIndexOf(32768);
      let actual1: int = arr.length;
      let expected1: number = originalLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_4800
     * @tc.name testInt16ArrayLastIndexOfTestTwo048
     * @tc.desc Verify lastIndexOf byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3, 4]);
      const originalByteLen = arr.byteLength;
      arr.lastIndexOf(3);
      let actual1: int = arr.byteLength;
      let expected1: number = originalByteLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_4900
     * @tc.name testInt16ArrayLastIndexOfTestTwo049
     * @tc.desc Verify lastIndexOf byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3, 4]);
      const originalByteLen = arr.byteLength;
      arr.lastIndexOf(999);
      let actual1: int = arr.byteLength;
      let expected1: number = originalByteLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_5000
     * @tc.name testInt16ArrayLastIndexOfTestTwo050
     * @tc.desc Verify lastIndexOf byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([]);
      arr.lastIndexOf(1);
      let actual1: int = arr.byteLength;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_5100
     * @tc.name testInt16ArrayLastIndexOfTestTwo051
     * @tc.desc Verify lastIndexOf fromIndex byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([5, 6, 7, 8]);
      const originalByteLen = arr.byteLength;
      arr.lastIndexOf(6, 2);
      let actual1: int = arr.byteLength;
      let expected1: number = originalByteLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_5200
     * @tc.name testInt16ArrayLastIndexOfTestTwo052
     * @tc.desc Verify lastIndexOf fromIndex byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([5, 6, 7, 8]);
      const originalByteLen = arr.byteLength;
      arr.lastIndexOf(7, -2);
      let actual1: int = arr.byteLength;
      let expected1: number = originalByteLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_5300
     * @tc.name testInt16ArrayLastIndexOfTestTwo053
     * @tc.desc Verify lastIndexOf does not mutate array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([10, 20, 30]);
      arr.lastIndexOf(20);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_5400
     * @tc.name testInt16ArrayLastIndexOfTestTwo054
     * @tc.desc Verify lastIndexOf does not mutate array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([10, 20, 30]);
      arr.lastIndexOf(999);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_5500
     * @tc.name testInt16ArrayLastIndexOfTestTwo055
     * @tc.desc Verify lastIndexOf fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3, 2, 1]);
      arr.lastIndexOf(2, 2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(2);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(3);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(2);
      let actual5: number = arr.$_get(4);
      expect(actual5).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_5600
     * @tc.name testInt16ArrayLastIndexOfTestTwo056
     * @tc.desc Verify lastIndexOf fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([4, 5, 6, 5]);
      arr.lastIndexOf(5, -2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(4);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(5);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(6);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_5700
     * @tc.name testInt16ArrayLastIndexOfTestTwo057
     * @tc.desc Verify lastIndexOf does not mutate array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([7, 8, 9]);
      arr.lastIndexOf(Number.NaN);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(7);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(8);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_5800
     * @tc.name testInt16ArrayLastIndexOfTestTwo058
     * @tc.desc Verify lastIndexOf(Infinity) does not mutate elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([0, 1, 0]);
      arr.lastIndexOf(Number.POSITIVE_INFINITY);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(1);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_5900
     * @tc.name testInt16ArrayLastIndexOfTestTwo059
     * @tc.desc Verify lastIndexOf does not mutate array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([-32768, 0, 32767]);
      arr.lastIndexOf(32767);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_6000
     * @tc.name testInt16ArrayLastIndexOfTestTwo060
     * @tc.desc Verify lastIndexOf(2) returns last matching index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3, 2]);
      const result = arr.lastIndexOf(2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_6100
     * @tc.name testInt16ArrayLastIndexOfTestTwo061
     * @tc.desc Verify lastIndexOf(99) returns -1 when element not present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3]);
      const result = arr.lastIndexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_6200
     * @tc.name testInt16ArrayLastIndexOfTestTwo062
     * @tc.desc Verify lastIndexOf buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Int16Array(buf);
      const bufBefore = arr.buffer;
      arr.lastIndexOf(0);
      let actual1: boolean = arr.buffer === bufBefore;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_6300
     * @tc.name testInt16ArrayLastIndexOfTestTwo063
     * @tc.desc Verify lastIndexOf buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Int16Array(buf);
      arr.$_set(0, 100);
      arr.$_set(1, 200);
      arr.$_set(2, 300);
      arr.lastIndexOf(200);
      const view = new Int16Array(arr.buffer);
      let actual1: number = view.$_get(1);
      expect(actual1).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_6400
     * @tc.name testInt16ArrayLastIndexOfTestTwo064
     * @tc.desc Verify lastIndexOf byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const arr = new Int16Array(buf, 0, 3);
      const originalOffset = arr.byteOffset;
      arr.lastIndexOf(0);
      let actual1: int = arr.byteOffset;
      let expected1: number = originalOffset;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_6500
     * @tc.name testInt16ArrayLastIndexOfTestTwo065
     * @tc.desc Verify lastIndexOf byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const arr = new Int16Array(buf, 2, 3);
      const originalOffset = arr.byteOffset;
      arr.lastIndexOf(0);
      let actual1: int = arr.byteOffset;
      let expected1: number = originalOffset;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_6600
     * @tc.name testInt16ArrayLastIndexOfTestTwo066
     * @tc.desc Verify lastIndexOf BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3]);
      arr.lastIndexOf(2);
      let actual1: int = arr.BYTES_PER_ELEMENT;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_6700
     * @tc.name testInt16ArrayLastIndexOfTestTwo067
     * @tc.desc Verify lastIndexOf BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([]);
      arr.lastIndexOf(1);
      let actual1: int = arr.BYTES_PER_ELEMENT;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_6800
     * @tc.name testInt16ArrayLastIndexOfTestTwo068
     * @tc.desc Verify lastIndexOf A buffer B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arrA = new Int16Array(buf, 0, 2);
      const arrB = new Int16Array(buf, 4, 2);
      arrA.$_set(0, 10);
      arrA.$_set(1, 20);
      arrB.$_set(0, 30);
      arrB.$_set(1, 40);
      arrA.lastIndexOf(20);
      let actual1: number = arrB.$_get(0);
      expect(actual1).assertEqual(30);
      let actual2: number = arrB.$_get(1);
      expect(actual2).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_6900
     * @tc.name testInt16ArrayLastIndexOfTestTwo069
     * @tc.desc Verify lastIndexOf does not mutate array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Int16Array(buf);
      arr.$_set(0, 5);
      arr.$_set(1, 10);
      arr.$_set(2, 15);
      arr.lastIndexOf(10);
      const altView = new Int16Array(buf);
      let actual1: number = altView.$_get(0);
      expect(actual1).assertEqual(5);
      let actual2: number = altView.$_get(1);
      expect(actual2).assertEqual(10);
      let actual3: number = altView.$_get(2);
      expect(actual3).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_7000
     * @tc.name testInt16ArrayLastIndexOfTestTwo070
     * @tc.desc Verify lastIndexOf(7) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([7]);
      const result: int = arr.lastIndexOf(7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_7100
     * @tc.name testInt16ArrayLastIndexOfTestTwo071
     * @tc.desc Verify lastIndexOf(3) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([3, 3, 3, 3, 3]);
      const result: int = arr.lastIndexOf(3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_7200
     * @tc.name testInt16ArrayLastIndexOfTestTwo072
     * @tc.desc Verify lastIndexOf(8,2) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([8, 8, 8, 8, 8]);
      const result: int = arr.lastIndexOf(8, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_7300
     * @tc.name testInt16ArrayLastIndexOfTestTwo073
     * @tc.desc Verify lastIndexOf(0) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([0, 0, 0]);
      const result: int = arr.lastIndexOf(0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_TWO_7400
     * @tc.name testInt16ArrayLastIndexOfTestTwo074
     * @tc.desc Verify lastIndexOf(-1) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([-1, -1, -1, -1]);
      const result: int = arr.lastIndexOf(-1);
      expect(result).assertEqual(3);
    });
  });
}
