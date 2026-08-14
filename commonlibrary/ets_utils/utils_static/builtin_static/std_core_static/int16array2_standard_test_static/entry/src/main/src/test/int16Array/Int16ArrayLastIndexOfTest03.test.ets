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

export default function int16ArrayLastIndexOfTestThreeTest(): void {
  describe('Int16ArrayLastIndexOfTestThreeTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_0100
     * @tc.name testInt16ArrayLastIndexOfTestThree001
     * @tc.desc Verify lastIndexOf(50, -1) on new Int16Array([10, 20, 30, 40, 50]) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let actual1: int = arr.lastIndexOf(50, -1);
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_0200
     * @tc.name testInt16ArrayLastIndexOfTestThree002
     * @tc.desc Verify lastIndexOf(40, -2) on new Int16Array([10, 20, 30, 40, 50]) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let actual1: int = arr.lastIndexOf(40, -2);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_0300
     * @tc.name testInt16ArrayLastIndexOfTestThree003
     * @tc.desc Verify lastIndexOf(30, -3) on new Int16Array([10, 20, 30, 40, 50]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let actual1: int = arr.lastIndexOf(30, -3);
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_0400
     * @tc.name testInt16ArrayLastIndexOfTestThree004
     * @tc.desc Verify lastIndexOf(20, -4) on new Int16Array([10, 20, 30, 40, 50]) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let actual1: int = arr.lastIndexOf(20, -4);
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_0500
     * @tc.name testInt16ArrayLastIndexOfTestThree005
     * @tc.desc Verify lastIndexOf(77, -5) on new Int16Array([77, 88, 99, 11, 22]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([77, 88, 99, 11, 22]);
      let actual1: int = arr.lastIndexOf(77, -5);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_0600
     * @tc.name testInt16ArrayLastIndexOfTestThree006
     * @tc.desc Verify lastIndexOf(78, -1) on new Int16Array([12, 34, 56, 78, 90]) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([12, 34, 56, 78, 90]);
      let actual1: int = arr.lastIndexOf(78, -1);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_0700
     * @tc.name testInt16ArrayLastIndexOfTestThree007
     * @tc.desc Verify lastIndexOf(25, -3) on new Int16Array([5, 15, 25, 35, 45, 55]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 15, 25, 35, 45, 55]);
      let actual1: int = arr.lastIndexOf(25, -3);
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_0800
     * @tc.name testInt16ArrayLastIndexOfTestThree008
     * @tc.desc Verify lastIndexOf(91, -1) on new Int16Array([91, 92, 93, 94, 95]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([91, 92, 93, 94, 95]);
      let actual1: int = arr.lastIndexOf(91, -1);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_0900
     * @tc.name testInt16ArrayLastIndexOfTestThree009
     * @tc.desc Verify lastIndexOf(65, -2) on new Int16Array([61, 62, 63, 64, 65]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([61, 62, 63, 64, 65]);
      let actual1: int = arr.lastIndexOf(65, -2);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_1000
     * @tc.name testInt16ArrayLastIndexOfTestThree010
     * @tc.desc Verify lastIndexOf(35, -3) on new Int16Array([31, 32, 33, 34, 35]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([31, 32, 33, 34, 35]);
      let actual1: int = arr.lastIndexOf(35, -3);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_1100
     * @tc.name testInt16ArrayLastIndexOfTestThree011
     * @tc.desc Verify lastIndexOf(44, -4) on new Int16Array([41, 42, 43, 44, 45]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([41, 42, 43, 44, 45]);
      let actual1: int = arr.lastIndexOf(44, -4);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_1200
     * @tc.name testInt16ArrayLastIndexOfTestThree012
     * @tc.desc Verify lastIndexOf(83, -5) on new Int16Array([81, 82, 83, 84, 85]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([81, 82, 83, 84, 85]);
      let actual1: int = arr.lastIndexOf(83, -5);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_1300
     * @tc.name testInt16ArrayLastIndexOfTestThree013
     * @tc.desc Verify lastIndexOf(71, -2) on new Int16Array([71, 72, 73, 74, 75]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([71, 72, 73, 74, 75]);
      let actual1: int = arr.lastIndexOf(71, -2);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_1400
     * @tc.name testInt16ArrayLastIndexOfTestThree014
     * @tc.desc Verify lastIndexOf(11, -6) on new Int16Array([11, 22, 33, 44, 55]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([11, 22, 33, 44, 55]);
      let actual1: int = arr.lastIndexOf(11, -6);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_1500
     * @tc.name testInt16ArrayLastIndexOfTestThree015
     * @tc.desc Verify lastIndexOf(33, -7) on new Int16Array([11, 22, 33, 44, 55]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([11, 22, 33, 44, 55]);
      let actual1: int = arr.lastIndexOf(33, -7);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_1600
     * @tc.name testInt16ArrayLastIndexOfTestThree016
     * @tc.desc Verify lastIndexOf(14, -100) on new Int16Array([14, 28, 42, 56, 70]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([14, 28, 42, 56, 70]);
      let actual1: int = arr.lastIndexOf(14, -100);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_1700
     * @tc.name testInt16ArrayLastIndexOfTestThree017
     * @tc.desc Verify lastIndexOf(21, -1000000) on new Int16Array([7, 14, 21, 28, 35]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([7, 14, 21, 28, 35]);
      let actual1: int = arr.lastIndexOf(21, -1000000);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_1800
     * @tc.name testInt16ArrayLastIndexOfTestThree018
     * @tc.desc Verify lastIndexOf(8, -9999) on new Int16Array([8, 16, 24]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([8, 16, 24]);
      let actual1: int = arr.lastIndexOf(8, -9999);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_1900
     * @tc.name testInt16ArrayLastIndexOfTestThree019
     * @tc.desc Verify lastIndexOf(99, -6) on new Int16Array([3, 6, 9, 12, 15]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([3, 6, 9, 12, 15]);
      let actual1: int = arr.lastIndexOf(99, -6);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_2000
     * @tc.name testInt16ArrayLastIndexOfTestThree020
     * @tc.desc Verify lastIndexOf(55, 0) on new Int16Array([55, 66, 77, 88, 99]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([55, 66, 77, 88, 99]);
      let actual1: int = arr.lastIndexOf(55, 0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_2100
     * @tc.name testInt16ArrayLastIndexOfTestThree021
     * @tc.desc Verify lastIndexOf(24, 1) on new Int16Array([12, 24, 36, 48, 60]) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([12, 24, 36, 48, 60]);
      let actual1: int = arr.lastIndexOf(24, 1);
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_2200
     * @tc.name testInt16ArrayLastIndexOfTestThree022
     * @tc.desc Verify lastIndexOf(27, 3) on new Int16Array([9, 18, 27, 36, 45]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([9, 18, 27, 36, 45]);
      let actual1: int = arr.lastIndexOf(27, 3);
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_2300
     * @tc.name testInt16ArrayLastIndexOfTestThree023
     * @tc.desc Verify lastIndexOf(505, 4) on new Int16Array([101, 202, 303, 404, 505]) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([101, 202, 303, 404, 505]);
      let actual1: int = arr.lastIndexOf(505, 4);
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_2400
     * @tc.name testInt16ArrayLastIndexOfTestThree024
     * @tc.desc Verify lastIndexOf(73, 3) on new Int16Array([73, 74, 75, 76, 77]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([73, 74, 75, 76, 77]);
      let actual1: int = arr.lastIndexOf(73, 3);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_2500
     * @tc.name testInt16ArrayLastIndexOfTestThree025
     * @tc.desc Verify lastIndexOf(17, 2) on new Int16Array([17, 18, 19, 20, 17]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([17, 18, 19, 20, 17]);
      let actual1: int = arr.lastIndexOf(17, 2);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_2600
     * @tc.name testInt16ArrayLastIndexOfTestThree026
     * @tc.desc Verify lastIndexOf(24, 0) on new Int16Array([21, 22, 23, 24, 25]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([21, 22, 23, 24, 25]);
      let actual1: int = arr.lastIndexOf(24, 0);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_2700
     * @tc.name testInt16ArrayLastIndexOfTestThree027
     * @tc.desc Verify lastIndexOf(34, 1) on new Int16Array([31, 32, 33, 34, 35]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([31, 32, 33, 34, 35]);
      let actual1: int = arr.lastIndexOf(34, 1);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_2800
     * @tc.name testInt16ArrayLastIndexOfTestThree028
     * @tc.desc Verify lastIndexOf(45, 2) on new Int16Array([41, 42, 43, 44, 45]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([41, 42, 43, 44, 45]);
      let actual1: int = arr.lastIndexOf(45, 2);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_2900
     * @tc.name testInt16ArrayLastIndexOfTestThree029
     * @tc.desc Verify lastIndexOf(50, 5) on new Int16Array([10, 20, 30, 40, 50]) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      let actual1: int = arr.lastIndexOf(50, 5);
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_3000
     * @tc.name testInt16ArrayLastIndexOfTestThree030
     * @tc.desc Verify lastIndexOf(88, 5) on new Int16Array([88, 99, 11, 22, 33]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([88, 99, 11, 22, 33]);
      let actual1: int = arr.lastIndexOf(88, 5);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_3100
     * @tc.name testInt16ArrayLastIndexOfTestThree031
     * @tc.desc Verify lastIndexOf(25, 6) on new Int16Array([5, 10, 15, 20, 25]) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 10, 15, 20, 25]);
      let actual1: int = arr.lastIndexOf(25, 6);
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_3200
     * @tc.name testInt16ArrayLastIndexOfTestThree032
     * @tc.desc Verify lastIndexOf(5, 1000000) on new Int16Array([1, 2, 3, 4, 5]) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4, 5]);
      let actual1: int = arr.lastIndexOf(5, 1000000);
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_3300
     * @tc.name testInt16ArrayLastIndexOfTestThree033
     * @tc.desc Verify lastIndexOf(99, 2147483647) on new Int16Array([99, 88, 77, 66, 55]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([99, 88, 77, 66, 55]);
      let actual1: int = arr.lastIndexOf(99, 2147483647);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_3400
     * @tc.name testInt16ArrayLastIndexOfTestThree034
     * @tc.desc Verify lastIndexOf(99, 6) on new Int16Array([2, 4, 6, 8, 10]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([2, 4, 6, 8, 10]);
      let actual1: int = arr.lastIndexOf(99, 6);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_3500
     * @tc.name testInt16ArrayLastIndexOfTestThree035
     * @tc.desc Verify lastIndexOf(5, 0) on new Int16Array([]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([]);
      let actual1: int = arr.lastIndexOf(5, 0);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_3600
     * @tc.name testInt16ArrayLastIndexOfTestThree036
     * @tc.desc Verify lastIndexOf(10, -1) on new Int16Array([]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([]);
      let actual1: int = arr.lastIndexOf(10, -1);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_3700
     * @tc.name testInt16ArrayLastIndexOfTestThree037
     * @tc.desc Verify lastIndexOf(7, 0) on new Int16Array([]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([]);
      let actual1: int = arr.lastIndexOf(7, 0);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_3800
     * @tc.name testInt16ArrayLastIndexOfTestThree038
     * @tc.desc Verify lastIndexOf(42, 1) on new Int16Array([]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([]);
      let actual1: int = arr.lastIndexOf(42, 1);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_3900
     * @tc.name testInt16ArrayLastIndexOfTestThree039
     * @tc.desc Verify lastIndexOf(99, -0) on new Int16Array([]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([]);
      let actual1: int = arr.lastIndexOf(99, -0);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_4000
     * @tc.name testInt16ArrayLastIndexOfTestThree040
     * @tc.desc Verify lastIndexOf(50, -1) on new Int16Array([]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([]);
      let actual1: int = arr.lastIndexOf(50, -1);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_4100
     * @tc.name testInt16ArrayLastIndexOfTestThree041
     * @tc.desc Verify lastIndexOf(13, 100) on new Int16Array([]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([]);
      let actual1: int = arr.lastIndexOf(13, 100);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_4200
     * @tc.name testInt16ArrayLastIndexOfTestThree042
     * @tc.desc Verify lastIndexOf(77, -100) on new Int16Array([]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([]);
      let actual1: int = arr.lastIndexOf(77, -100);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_4300
     * @tc.name testInt16ArrayLastIndexOfTestThree043
     * @tc.desc Verify lastIndexOf(1, 2147483647) on new Int16Array([]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([]);
      let actual1: int = arr.lastIndexOf(1, 2147483647);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_4400
     * @tc.name testInt16ArrayLastIndexOfTestThree044
     * @tc.desc Verify lastIndexOf(Number.NaN, 0) on new Int16Array([8, 16, 24, 32, 40]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([8, 16, 24, 32, 40]);
      let actual1: int = arr.lastIndexOf(Number.NaN, 0);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_4500
     * @tc.name testInt16ArrayLastIndexOfTestThree045
     * @tc.desc Verify lastIndexOf(Number.NaN, -1) on new Int16Array([15, 30, 45, 60, 75]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([15, 30, 45, 60, 75]);
      let actual1: int = arr.lastIndexOf(Number.NaN, -1);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_4600
     * @tc.name testInt16ArrayLastIndexOfTestThree046
     * @tc.desc Verify lastIndexOf(Number.NaN, 3) on new Int16Array([3, 6, 9]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([3, 6, 9]);
      let actual1: int = arr.lastIndexOf(Number.NaN, 3);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_4700
     * @tc.name testInt16ArrayLastIndexOfTestThree047
     * @tc.desc Verify lastIndexOf(Number.NaN, -5) on new Int16Array([2, 4, 6, 8]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([2, 4, 6, 8]);
      let actual1: int = arr.lastIndexOf(Number.NaN, -5);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_4800
     * @tc.name testInt16ArrayLastIndexOfTestThree048
     * @tc.desc Verify lastIndexOf(Number.NaN, 1000000) on new Int16Array([25, 50, 75, 100]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([25, 50, 75, 100]);
      let actual1: int = arr.lastIndexOf(Number.NaN, 1000000);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_4900
     * @tc.name testInt16ArrayLastIndexOfTestThree049
     * @tc.desc Verify lastIndexOf(-32768) on new Int16Array([32768, 50, 32768]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([32768, 50, 32768]);
      let actual1: int = arr.lastIndexOf(-32768);
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_5000
     * @tc.name testInt16ArrayLastIndexOfTestThree050
     * @tc.desc Verify lastIndexOf(65536, -1) on new Int16Array([0, 7, 0, 14, 0]) returns -1 (searchElement not coerced)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 7, 0, 14, 0]);
      let actual1: int = arr.lastIndexOf(65536, -1);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_5100
     * @tc.name testInt16ArrayLastIndexOfTestThree051
     * @tc.desc Verify lastIndexOf(32768, 1) on new Int16Array([-32768, 5, 10, -32768]) returns -1 (searchElement not coerced)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([-32768, 5, 10, -32768]);
      let actual1: int = arr.lastIndexOf(32768, 1);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_5200
     * @tc.name testInt16ArrayLastIndexOfTestThree052
     * @tc.desc Verify lastIndexOf(-0, 0) on new Int16Array([0, 1, 2]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 1, 2]);
      let actual1: int = arr.lastIndexOf(-0, 0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_5300
     * @tc.name testInt16ArrayLastIndexOfTestThree053
     * @tc.desc Verify lastIndexOf(-0) on new Int16Array([1, 0, 3, 0, 5]) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 0, 3, 0, 5]);
      let actual1: int = arr.lastIndexOf(-0);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_5400
     * @tc.name testInt16ArrayLastIndexOfTestThree054
     * @tc.desc Verify lastIndexOf(-0) on new Int16Array([1, 2, 3, 4, 5]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4, 5]);
      let actual1: int = arr.lastIndexOf(-0);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_5500
     * @tc.name testInt16ArrayLastIndexOfTestThree055
     * @tc.desc Verify lastIndexOf(-32768, -1) on new Int16Array([-32768, 0, 32767]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([-32768, 0, 32767]);
      let actual1: int = arr.lastIndexOf(-32768, -1);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_5600
     * @tc.name testInt16ArrayLastIndexOfTestThree056
     * @tc.desc Verify lastIndexOf(32767, -1) on new Int16Array([-32768, 0, 32767]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([-32768, 0, 32767]);
      let actual1: int = arr.lastIndexOf(32767, -1);
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_5700
     * @tc.name testInt16ArrayLastIndexOfTestThree057
     * @tc.desc Verify lastIndexOf(-50000) on new Int16Array([10, 20, 30]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let actual1: int = arr.lastIndexOf(-50000);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_5800
     * @tc.name testInt16ArrayLastIndexOfTestThree058
     * @tc.desc Verify lastIndexOf(42, 0) on new Int16Array([42]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42]);
      let actual1: int = arr.lastIndexOf(42, 0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_5900
     * @tc.name testInt16ArrayLastIndexOfTestThree059
     * @tc.desc Verify lastIndexOf(42, -1) on new Int16Array([42]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42]);
      let actual1: int = arr.lastIndexOf(42, -1);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_6000
     * @tc.name testInt16ArrayLastIndexOfTestThree060
     * @tc.desc Verify lastIndexOf(42, 1) on new Int16Array([42]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42]);
      let actual1: int = arr.lastIndexOf(42, 1);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_6100
     * @tc.name testInt16ArrayLastIndexOfTestThree061
     * @tc.desc Verify lastIndexOf(42, 100) on new Int16Array([42]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42]);
      let actual1: int = arr.lastIndexOf(42, 100);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_6200
     * @tc.name testInt16ArrayLastIndexOfTestThree062
     * @tc.desc Verify lastIndexOf(42, -2) on new Int16Array([42]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42]);
      let actual1: int = arr.lastIndexOf(42, -2);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_6300
     * @tc.name testInt16ArrayLastIndexOfTestThree063
     * @tc.desc Verify lastIndexOf(42, -100) on new Int16Array([42]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([42]);
      let actual1: int = arr.lastIndexOf(42, -100);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_6400
     * @tc.name testInt16ArrayLastIndexOfTestThree064
     * @tc.desc Verify lastIndexOf(7) on new Int16Array([7, 7, 7, 7, 7]) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([7, 7, 7, 7, 7]);
      let actual1: int = arr.lastIndexOf(7);
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_6500
     * @tc.name testInt16ArrayLastIndexOfTestThree065
     * @tc.desc Verify lastIndexOf(7, 2) on new Int16Array([7, 7, 7, 7, 7]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([7, 7, 7, 7, 7]);
      let actual1: int = arr.lastIndexOf(7, 2);
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_6600
     * @tc.name testInt16ArrayLastIndexOfTestThree066
     * @tc.desc Verify lastIndexOf(7, -3) on new Int16Array([7, 7, 7, 7, 7]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([7, 7, 7, 7, 7]);
      let actual1: int = arr.lastIndexOf(7, -3);
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_6700
     * @tc.name testInt16ArrayLastIndexOfTestThree067
     * @tc.desc Verify lastIndexOf(7, -6) on new Int16Array([7, 7, 7, 7, 7]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([7, 7, 7, 7, 7]);
      let actual1: int = arr.lastIndexOf(7, -6);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_6800
     * @tc.name testInt16ArrayLastIndexOfTestThree068
     * @tc.desc Verify lastIndexOf(1) on new Int16Array([1, 2, 1, 2, 1]) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 1, 2, 1]);
      let actual1: int = arr.lastIndexOf(1);
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_6900
     * @tc.name testInt16ArrayLastIndexOfTestThree069
     * @tc.desc Verify lastIndexOf(1, 3) on new Int16Array([1, 2, 1, 2, 1]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 1, 2, 1]);
      let actual1: int = arr.lastIndexOf(1, 3);
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_7000
     * @tc.name testInt16ArrayLastIndexOfTestThree070
     * @tc.desc Verify lastIndexOf(2, 2) on new Int16Array([1, 2, 1, 2, 1]) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 1, 2, 1]);
      let actual1: int = arr.lastIndexOf(2, 2);
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_7100
     * @tc.name testInt16ArrayLastIndexOfTestThree071
     * @tc.desc Verify lastIndexOf(1, 0) on new Int16Array([1, 2, 1, 2, 1]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 1, 2, 1]);
      let actual1: int = arr.lastIndexOf(1, 0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_7200
     * @tc.name testInt16ArrayLastIndexOfTestThree072
     * @tc.desc Verify lastIndexOf(5) on new Int16Array([3, 3, 5, 3, 5]) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([3, 3, 5, 3, 5]);
      let actual1: int = arr.lastIndexOf(5);
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_7300
     * @tc.name testInt16ArrayLastIndexOfTestThree073
     * @tc.desc Verify lastIndexOf(9, -1) on new Int16Array([9, 8, 9, 8, 9]) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([9, 8, 9, 8, 9]);
      let actual1: int = arr.lastIndexOf(9, -1);
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_7400
     * @tc.name testInt16ArrayLastIndexOfTestThree074
     * @tc.desc Verify lastIndexOf(9, -2) on new Int16Array([9, 8, 9, 8, 9]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([9, 8, 9, 8, 9]);
      let actual1: int = arr.lastIndexOf(9, -2);
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_THREE_7500
     * @tc.name testInt16ArrayLastIndexOfTestThree075
     * @tc.desc Verify lastIndexOf(9, -6) on new Int16Array([9, 8, 9, 8, 9]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([9, 8, 9, 8, 9]);
      let actual1: int = arr.lastIndexOf(9, -6);
      expect(actual1).assertEqual(-1);
    });
  });
}
