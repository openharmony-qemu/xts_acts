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
  Level,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayIndexOfPart01TestTest(): void {
  describe('Int8ArrayIndexOfPart01TestTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0100
     * @tc.name int8ArrayIndexOfPart01Test001
     * @tc.desc Verify 1: arity 1 fromIndex fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(30, 40, 50);
      const v: number = 40;
      expect(arr.indexOf(v)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0200
     * @tc.name int8ArrayIndexOfPart01Test002
     * @tc.desc Verify 2: arity 2 fromIndex 0 arity 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(30, 40, 50);
      const v: number = 40;
      expect(arr.indexOf(v, 0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0300
     * @tc.name int8ArrayIndexOfPart01Test003
     * @tc.desc Verify 3: arity 2 fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(40, 50, 40);
      const v: number = 40;
      expect(arr.indexOf(v, 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0400
     * @tc.name int8ArrayIndexOfPart01Test004
     * @tc.desc Verify 4: searchElement int8 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-128, 0, INT8_MAX);
      const v: number = -128;
      expect(arr.indexOf(v)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0500
     * @tc.name int8ArrayIndexOfPart01Test005
     * @tc.desc Verify 5: searchElement int8 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-128, 0, INT8_MAX);
      const v: number = INT8_MAX;
      expect(arr.indexOf(v)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0600
     * @tc.name int8ArrayIndexOfPart01Test006
     * @tc.desc Verify 6: searchElement 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-128, 0, INT8_MAX);
      const v: number = 0;
      expect(arr.indexOf(v)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0700
     * @tc.name int8ArrayIndexOfPart01Test007
     * @tc.desc Verify 7: searchElement -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-1, 0, 1);
      const v: number = -1;
      expect(arr.indexOf(v)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0800
     * @tc.name int8ArrayIndexOfPart01Test008
     * @tc.desc Verify 8: searchElement 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(50, 60, 70);
      const v: number = 50;
      expect(arr.indexOf(v)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0900
     * @tc.name int8ArrayIndexOfPart01Test009
     * @tc.desc Verify 28: searchElement 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(7, 8, 9);
      const v: number = 7;
      expect(arr.indexOf(v)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1000
     * @tc.name int8ArrayIndexOfPart01Test010
     * @tc.desc Verify 29: searchElement length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(7, 8, 9);
      const v: number = 9;
      expect(arr.indexOf(v)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1100
     * @tc.name int8ArrayIndexOfPart01Test011
     * @tc.desc Verify 30: searchElement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(7, 8, 9);
      const v: number = 8;
      expect(arr.indexOf(v)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1200
     * @tc.name int8ArrayIndexOfPart01Test012
     * @tc.desc Verify 31: searchElement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(5, 6, 5, 6, 5);
      const v: number = 5;
      expect(arr.indexOf(v)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1300
     * @tc.name int8ArrayIndexOfPart01Test013
     * @tc.desc Verify 32: searchElement 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(3, 3, 3, 3);
      const v: number = 3;
      expect(arr.indexOf(v)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1400
     * @tc.name int8ArrayIndexOfPart01Test014
     * @tc.desc Verify 33: searchElement -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const v: number = 99;
      expect(arr.indexOf(v)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1500
     * @tc.name int8ArrayIndexOfPart01Test015
     * @tc.desc Verify 34: searchElement -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const v: number = 200;
      expect(arr.indexOf(v)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1600
     * @tc.name int8ArrayIndexOfPart01Test016
     * @tc.desc Verify 35: searchElement -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array(0);
      const v: number = 5;
      expect(arr.indexOf(v)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1700
     * @tc.name int8ArrayIndexOfPart01Test017
     * @tc.desc Verify 36: searchElement 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(42);
      const v: number = 42;
      expect(arr.indexOf(v)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1800
     * @tc.name int8ArrayIndexOfPart01Test018
     * @tc.desc Verify 37: searchElement -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(42);
      const v: number = 43;
      expect(arr.indexOf(v)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1900
     * @tc.name int8ArrayIndexOfPart01Test019
     * @tc.desc Verify 40: fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 10, 20, 10);
      const v: number = 10;
      expect(arr.indexOf(v, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2000
     * @tc.name int8ArrayIndexOfPart01Test020
     * @tc.desc Verify 41: fromIndex 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 10, 20, 10);
      const v: number = 10;
      expect(arr.indexOf(v, 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2100
     * @tc.name int8ArrayIndexOfPart01Test021
     * @tc.desc Verify 42: fromIndex length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 50;
      expect(arr.indexOf(v, 4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2200
     * @tc.name int8ArrayIndexOfPart01Test022
     * @tc.desc Verify 43: fromIndex length -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 10;
      expect(arr.indexOf(v, 5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2300
     * @tc.name int8ArrayIndexOfPart01Test023
     * @tc.desc Verify 44: fromIndex length+1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 50;
      expect(arr.indexOf(v, 6)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2400
     * @tc.name int8ArrayIndexOfPart01Test024
     * @tc.desc Verify 45: fromIndex 2147483647 int -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const v: number = 10;
      expect(arr.indexOf(v, 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2500
     * @tc.name int8ArrayIndexOfPart01Test025
     * @tc.desc Verify 46: fromIndex length-1 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 10;
      expect(arr.indexOf(v, 4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2600
     * @tc.name int8ArrayIndexOfPart01Test026
     * @tc.desc Verify 47: fromIndex -1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 50;
      expect(arr.indexOf(v, -1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2700
     * @tc.name int8ArrayIndexOfPart01Test027
     * @tc.desc Verify 48: fromIndex -2 length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 40;
      expect(arr.indexOf(v, -2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2800
     * @tc.name int8ArrayIndexOfPart01Test028
     * @tc.desc Verify 49: fromIndex -length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 10;
      expect(arr.indexOf(v, -5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2900
     * @tc.name int8ArrayIndexOfPart01Test029
     * @tc.desc Verify 50: fromIndex -length-1 -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 10;
      expect(arr.indexOf(v, -6)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3000
     * @tc.name int8ArrayIndexOfPart01Test030
     * @tc.desc Verify 51: fromIndex int -2147483648 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const v: number = 10;
      expect(arr.indexOf(v, -2147483647 - 1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3100
     * @tc.name int8ArrayIndexOfPart01Test031
     * @tc.desc Verify 52: fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 20, 10);
      const v: number = 10;
      expect(arr.indexOf(v, -1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3200
     * @tc.name int8ArrayIndexOfPart01Test032
     * @tc.desc Verify 53: fromIndex -1 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(99, 20, 30, 40, 50);
      const v: number = 99;
      expect(arr.indexOf(v, -1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3300
     * @tc.name int8ArrayIndexOfPart01Test033
     * @tc.desc Verify 54: fromIndex 0 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array(0);
      const v: number = 5;
      expect(arr.indexOf(v, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3400
     * @tc.name int8ArrayIndexOfPart01Test034
     * @tc.desc Verify 55: fromIndex -1 -1 0 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array(0);
      const v: number = 5;
      expect(arr.indexOf(v, -1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3500
     * @tc.name int8ArrayIndexOfPart01Test035
     * @tc.desc Verify 56: fromIndex 1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(42);
      const v: number = 42;
      expect(arr.indexOf(v, 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3600
     * @tc.name int8ArrayIndexOfPart01Test036
     * @tc.desc Verify 57: E byte fromIndex byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const v: byte = 20;
      expect(arr.indexOf(v)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3700
     * @tc.name int8ArrayIndexOfPart01Test037
     * @tc.desc Verify 58: E byte fromIndex 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(20, 10, 20);
      const v: byte = 20;
      expect(arr.indexOf(v, 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3800
     * @tc.name int8ArrayIndexOfPart01Test038
     * @tc.desc Verify 59: number fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const v: number = 20;
      expect(arr.indexOf(v)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3900
     * @tc.name int8ArrayIndexOfPart01Test039
     * @tc.desc Verify 61: E byte -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const v: byte = 99;
      expect(arr.indexOf(v)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_4000
     * @tc.name int8ArrayIndexOfPart01Test040
     * @tc.desc Verify 63: E byte number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const vb: byte = 20;
      const vn: number = 20;
      expect(arr.indexOf(vb)).assertEqual(arr.indexOf(vn));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_4100
     * @tc.name int8ArrayIndexOfPart01Test041
     * @tc.desc Verify 64: number -50 -50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-50, 10, 20);
      const v: number = -50;
      expect(arr.indexOf(v)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_4200
     * @tc.name int8ArrayIndexOfPart01Test042
     * @tc.desc Verify 65: E byte 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(0, 10, 20);
      const v: byte = 0;
      expect(arr.indexOf(v)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_4300
     * @tc.name int8ArrayIndexOfPart01Test043
     * @tc.desc Verify 66: E byte 127 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(INT8_MAX, 10, 20);
      const v: byte = INT8_MAX;
      expect(arr.indexOf(v)).assertEqual(0);
    });

  });
}
