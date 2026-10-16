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

export default function int8ArrayLastIndexOfPart01Test(): void {
  describe('Int8ArrayLastIndexOfPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_0100
     * @tc.name int8ArrayLastIndexOfPart01Test001
     * @tc.desc Verify arity=1 searchElement fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3, 2, 1);
      let result: int = arr.lastIndexOf(2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_0200
     * @tc.name int8ArrayLastIndexOfPart01Test002
     * @tc.desc Verify arity=2 searchElement + fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3, 2, 1);
      let result: int = arr.lastIndexOf(2, 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_0300
     * @tc.name int8ArrayLastIndexOfPart01Test003
     * @tc.desc Verify lastIndexOf searchElement = -128 int8 MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(0, -128, 127);
      let result: int = arr.lastIndexOf(-128);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_0400
     * @tc.name int8ArrayLastIndexOfPart01Test004
     * @tc.desc Verify lastIndexOf searchElement = 127 int8 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(0, -128, 127);
      let result: int = arr.lastIndexOf(127);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_0500
     * @tc.name int8ArrayLastIndexOfPart01Test005
     * @tc.desc Verify lastIndexOf searchElement = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-1, 0, 1);
      let result: int = arr.lastIndexOf(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_0600
     * @tc.name int8ArrayLastIndexOfPart01Test006
     * @tc.desc Verify lastIndexOf searchElement = -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(0, -1, 1);
      let result: int = arr.lastIndexOf(-1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_0700
     * @tc.name int8ArrayLastIndexOfPart01Test007
     * @tc.desc Verify lastIndexOf searchElement = -0.0 0 SameValueZero +0 -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-1, 0, 1);
      let result: int = arr.lastIndexOf(-0.0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_0800
     * @tc.name int8ArrayLastIndexOfPart01Test008
     * @tc.desc Verify lastIndexOf searchElement int8 MAX -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      let result: int = arr.lastIndexOf(127);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_0900
     * @tc.name int8ArrayLastIndexOfPart01Test009
     * @tc.desc Verify lastIndexOf searchElement -1 for out-of-range value 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      let result: int = arr.lastIndexOf(128);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_1000
     * @tc.name int8ArrayLastIndexOfPart01Test010
     * @tc.desc Verify lastIndexOf searchElement -1 on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array(0);
      let result: int = arr.lastIndexOf(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_1100
     * @tc.name int8ArrayLastIndexOfPart01Test011
     * @tc.desc Verify fromIndex = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(2, 1, 2, 1, 2);
      let result: int = arr.lastIndexOf(2, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_1200
     * @tc.name int8ArrayLastIndexOfPart01Test012
     * @tc.desc Verify fromIndex = length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(2, 1, 2, 1, 2);
      let result: int = arr.lastIndexOf(2, 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_1300
     * @tc.name int8ArrayLastIndexOfPart01Test013
     * @tc.desc Verify fromIndex = length length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(2, 1, 2, 1, 2);
      let result: int = arr.lastIndexOf(2, 5);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_1400
     * @tc.name int8ArrayLastIndexOfPart01Test014
     * @tc.desc Verify fromIndex = length+1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(2, 1, 2, 1, 2);
      let result: int = arr.lastIndexOf(2, 6);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_1500
     * @tc.name int8ArrayLastIndexOfPart01Test015
     * @tc.desc Verify fromIndex = 2147483647 int MAX length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(2, 1, 2, 1, 2);
      let result: int = arr.lastIndexOf(2, 2147483647);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_1600
     * @tc.name int8ArrayLastIndexOfPart01Test016
     * @tc.desc Verify fromIndex = -1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(2, 1, 2, 1, 2);
      let result: int = arr.lastIndexOf(2, -1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_1700
     * @tc.name int8ArrayLastIndexOfPart01Test017
     * @tc.desc Verify fromIndex = -2 length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(2, 1, 2, 1, 2);
      let result: int = arr.lastIndexOf(2, -2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_1800
     * @tc.name int8ArrayLastIndexOfPart01Test018
     * @tc.desc Verify fromIndex = -length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(2, 1, 2, 1, 2);
      let result: int = arr.lastIndexOf(2, -5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_1900
     * @tc.name int8ArrayLastIndexOfPart01Test019
     * @tc.desc Verify fromIndex = -length-1 k<0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(2, 1, 2, 1, 2);
      let result: int = arr.lastIndexOf(2, -6);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_2000
     * @tc.name int8ArrayLastIndexOfPart01Test020
     * @tc.desc Verify fromIndex = -2147483648 int MIN k<0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(2, 1, 2, 1, 2);
      let result: int = arr.lastIndexOf(2, -2147483648);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_2100
     * @tc.name int8ArrayLastIndexOfPart01Test021
     * @tc.desc Verify lastIndexOf with fromIndex=-1 starts search from last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 1, 1, 7, 1);
      let result: int = arr.lastIndexOf(7, 2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_2200
     * @tc.name int8ArrayLastIndexOfPart01Test022
     * @tc.desc Verify lastIndexOf(7, -1): fromIndex=-1 resolves to index 4, search finds 7 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(7, 1, 1, 1, 1);
      let result: int = arr.lastIndexOf(7, -1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_2300
     * @tc.name int8ArrayLastIndexOfPart01Test023
     * @tc.desc Verify fromIndex = 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 7, 7, 7, 7);
      let result: int = arr.lastIndexOf(7, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_2400
     * @tc.name int8ArrayLastIndexOfPart01Test024
     * @tc.desc Verify lastIndexOf with fromIndex=3 searches from third-to-last for duplicate value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 1, 2, 1);
      let result: int = arr.lastIndexOf(2, 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_2500
     * @tc.name int8ArrayLastIndexOfPart01Test025
     * @tc.desc Verify lastIndexOf with fromIndex=4 searches from fourth position for element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(2, 1, 2, 1, 1);
      let result: int = arr.lastIndexOf(2, 4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_2600
     * @tc.name int8ArrayLastIndexOfPart01Test026
     * @tc.desc Verify lastIndexOf searchElement E int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      let e: int = 2;
      let result: int = arr.lastIndexOf(e);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_2700
     * @tc.name int8ArrayLastIndexOfPart01Test027
     * @tc.desc Verify lastIndexOf(1) returns -1 when searchElement is not found in all-zero array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(0, 0, 0);
      let result: int = arr.lastIndexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_2800
     * @tc.name int8ArrayLastIndexOfPart01Test028
     * @tc.desc Verify lastIndexOf(3) returns correct last occurrence index 2 with duplicates present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3, 4, 5);
      let result: int = arr.lastIndexOf(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_2900
     * @tc.name int8ArrayLastIndexOfPart01Test029
     * @tc.desc Verify lastIndexOf(5) returns index 0 for single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(5);
      let result: int = arr.lastIndexOf(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_3000
     * @tc.name int8ArrayLastIndexOfPart01Test030
     * @tc.desc Verify lastIndexOf(6) returns -1 when searchElement not found in single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(5);
      let result: int = arr.lastIndexOf(6);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_3100
     * @tc.name int8ArrayLastIndexOfPart01Test031
     * @tc.desc Verify lastIndexOf(7) returns correct last occurrence index 3 with duplicates present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(7, 7, 7, 7);
      let result: int = arr.lastIndexOf(7);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_3200
     * @tc.name int8ArrayLastIndexOfPart01Test032
     * @tc.desc Verify lastIndexOf with fromIndex=-1 restricts search to last element only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(3, 3, 3, 9, 3);
      let result: int = arr.lastIndexOf(9, 1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_3300
     * @tc.name int8ArrayLastIndexOfPart01Test033
     * @tc.desc Verify lastIndexOf with fromIndex=-1 when searchElement not at last position returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array(0);
      let result: int = arr.lastIndexOf(0, 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_3400
     * @tc.name int8ArrayLastIndexOfPart01Test034
     * @tc.desc Verify lastIndexOf with explicit fromIndex finds correct occurrence in multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(5, 1, 5, 1, 5);
      let result: int = arr.lastIndexOf(5, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_3500
     * @tc.name int8ArrayLastIndexOfPart01Test035
     * @tc.desc Verify searchElement = -128 MIN + fromIndex = -1 MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(0, 1, -128);
      let result: int = arr.lastIndexOf(-128, -1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_3600
     * @tc.name int8ArrayLastIndexOfPart01Test036
     * @tc.desc Verify searchElement = 127 MAX + fromIndex = 0 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(127, 1, 0);
      let result: int = arr.lastIndexOf(127, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_3700
     * @tc.name int8ArrayLastIndexOfPart01Test037
     * @tc.desc Verify searchElement + fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 1, 1, -1, 1);
      let result: int = arr.lastIndexOf(255, 2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_3800
     * @tc.name int8ArrayLastIndexOfPart01Test038
     * @tc.desc Verify + fromIndex 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(8);
      let result: int = arr.lastIndexOf(8, 2147483647);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_3900
     * @tc.name int8ArrayLastIndexOfPart01Test039
     * @tc.desc Verify + fromIndex = 1 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(9);
      let result: int = arr.lastIndexOf(9, 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_4000
     * @tc.name int8ArrayLastIndexOfPart01Test040
     * @tc.desc Verify + fromIndex = -1 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(9);
      let result: int = arr.lastIndexOf(9, -1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART01_TEST_4100
     * @tc.name int8ArrayLastIndexOfPart01Test041
     * @tc.desc Verify lastIndexOf with 120-element cyclic array returns correct last occurrence index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [];
      for (let i = 0; i < 120; i++) {
        src.push(i % 10);
      }
      const arr: Int8Array = new Int8Array(src);
      let result: int = arr.lastIndexOf(5);
      expect(result).assertEqual(115);
    });
  });
}
