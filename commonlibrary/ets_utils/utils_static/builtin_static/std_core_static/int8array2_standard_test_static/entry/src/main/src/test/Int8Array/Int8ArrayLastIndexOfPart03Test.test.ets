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

export default function int8ArrayLastIndexOfPart03Test(): void {
  describe('Int8ArrayLastIndexOfPart03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_0100
     * @tc.name int8ArrayLastIndexOfPart03Test001
     * @tc.desc Verify fromIndex=length index 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5, 10, 10, 10);
      let r: int = a.lastIndexOf(5, 4);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_0200
     * @tc.name int8ArrayLastIndexOfPart03Test002
     * @tc.desc Verify lastIndexOf fromIndex=4 finds last distinct element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(10, 10, 10, 5);
      let r: int = a.lastIndexOf(5, 4);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_0300
     * @tc.name int8ArrayLastIndexOfPart03Test003
     * @tc.desc Verify fromIndex=-length-1 -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5);
      let r: int = a.lastIndexOf(5, -2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_0400
     * @tc.name int8ArrayLastIndexOfPart03Test004
     * @tc.desc Verify fromIndex=length(0) -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = new Int8Array(0);
      let r: int = a.lastIndexOf(5, 0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_0500
     * @tc.name int8ArrayLastIndexOfPart03Test005
     * @tc.desc Verify fromIndex=-1 -1+0=-1 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = new Int8Array(0);
      let r: int = a.lastIndexOf(5, -1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_0600
     * @tc.name int8ArrayLastIndexOfPart03Test006
     * @tc.desc Verify fromIndex= -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = new Int8Array(0);
      let r: int = a.lastIndexOf(5, 2147483647);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_0700
     * @tc.name int8ArrayLastIndexOfPart03Test007
     * @tc.desc Verify lastIndexOf fromIndex=length+1 returns -1 for missing value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5, 10, 5, 20, 5);
      let r: int = a.lastIndexOf(99, 6);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_0800
     * @tc.name int8ArrayLastIndexOfPart03Test008
     * @tc.desc Verify lastIndexOf fromIndex=-length-1 returns -1 for missing value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5, 10, 5, 20, 5);
      let r: int = a.lastIndexOf(99, -6);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_0900
     * @tc.name int8ArrayLastIndexOfPart03Test009
     * @tc.desc Verify fromIndex=length [10,20,30] 10 index 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(10, 20, 30);
      let r: int = a.lastIndexOf(10, 3);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_1000
     * @tc.name int8ArrayLastIndexOfPart03Test010
     * @tc.desc Verify fromIndex=-length-1 [10,20,30] 30 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(10, 20, 30);
      let r: int = a.lastIndexOf(30, -4);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_1100
     * @tc.name int8ArrayLastIndexOfPart03Test011
     * @tc.desc Verify fromIndex=-length [10,20,30] 0 index 0 10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(10, 20, 30);
      let r: int = a.lastIndexOf(10, -3);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_1200
     * @tc.name int8ArrayLastIndexOfPart03Test012
     * @tc.desc Verify fromIndex=-length [10,20,30] 0 index 0 30 index 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(10, 20, 30);
      let r: int = a.lastIndexOf(30, -3);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_1300
     * @tc.name int8ArrayLastIndexOfPart03Test013
     * @tc.desc Verify fromIndex=-length A index 0 10 index 0 -1 -length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5, 10, 5, 20, 5);
      let r: int = a.lastIndexOf(10, -5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_1400
     * @tc.name int8ArrayLastIndexOfPart03Test014
     * @tc.desc Verify fromIndex=length A 20 index 3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5, 10, 5, 20, 5);
      let r: int = a.lastIndexOf(20, 5);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_1500
     * @tc.name int8ArrayLastIndexOfPart03Test015
     * @tc.desc Verify lastIndexOf(Number.NaN) returns -1 because SameValueZero(Number.NaN,Number.NaN) is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(10, 0, 20, 0);
      let r: int = a.lastIndexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_1600
     * @tc.name int8ArrayLastIndexOfPart03Test016
     * @tc.desc Verify lastIndexOf searchElement=-0.0 0 index 0 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(0, 5);
      let r: int = a.lastIndexOf(-0.0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_1700
     * @tc.name int8ArrayLastIndexOfPart03Test017
     * @tc.desc Verify lastIndexOf searchElement=Number.NaN 0 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(1, 2, 3);
      let r: int = a.lastIndexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_1800
     * @tc.name int8ArrayLastIndexOfPart03Test018
     * @tc.desc Verify lastIndexOf searchElement=Number.POSITIVE_INFINITY 127 127 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(1, 2, 3);
      let r: int = a.lastIndexOf(Number.POSITIVE_INFINITY);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_1900
     * @tc.name int8ArrayLastIndexOfPart03Test019
     * @tc.desc Verify fromIndex=-1 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5);
      let r: int = a.lastIndexOf(5, -1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_2000
     * @tc.name int8ArrayLastIndexOfPart03Test020
     * @tc.desc Verify fromIndex=length(1) 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5);
      let r: int = a.lastIndexOf(5, 1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_2100
     * @tc.name int8ArrayLastIndexOfPart03Test021
     * @tc.desc Verify lastIndexOf(10) returns -1 when searchElement not in single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5);
      let r: int = a.lastIndexOf(10);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_2200
     * @tc.name int8ArrayLastIndexOfPart03Test022
     * @tc.desc Verify lastIndexOf fromIndex=length returns index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(7, 7, 7, 7);
      let r: int = a.lastIndexOf(7, 4);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_2300
     * @tc.name int8ArrayLastIndexOfPart03Test023
     * @tc.desc Verify lastIndexOf fromIndex=-length-1 returns -1 for present value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(7, 7, 7, 7);
      let r: int = a.lastIndexOf(7, -5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_2400
     * @tc.name int8ArrayLastIndexOfPart03Test024
     * @tc.desc Verify lastIndexOf fromIndex=-length returns index 0 for equal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(7, 7, 7, 7);
      let r: int = a.lastIndexOf(7, -4);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_2500
     * @tc.name int8ArrayLastIndexOfPart03Test025
     * @tc.desc Verify lastIndexOf fromIndex=-1 returns last of equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(7, 7, 7, 7);
      let r: int = a.lastIndexOf(7, -1);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_2600
     * @tc.name int8ArrayLastIndexOfPart03Test026
     * @tc.desc Verify lastIndexOf(8) returns -1 when value not in uniform array of 7s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(7, 7, 7, 7);
      let r: int = a.lastIndexOf(8);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_2700
     * @tc.name int8ArrayLastIndexOfPart03Test027
     * @tc.desc Verify lastIndexOf clamps INT_MAX fromIndex to last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(7, 7, 7, 7);
      let r: int = a.lastIndexOf(7, 2147483647);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_2800
     * @tc.name int8ArrayLastIndexOfPart03Test028
     * @tc.desc Verify lastIndexOf fromIndex=INT_MIN returns -1 on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = new Int8Array(0);
      let r: int = a.lastIndexOf(5, -2147483648);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_2900
     * @tc.name int8ArrayLastIndexOfPart03Test029
     * @tc.desc Verify fromIndex= 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5);
      let r: int = a.lastIndexOf(5, 2147483647);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_3000
     * @tc.name int8ArrayLastIndexOfPart03Test030
     * @tc.desc Verify lastIndexOf fromIndex=INT_MIN returns -1 on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5);
      let r: int = a.lastIndexOf(5, -2147483648);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_3100
     * @tc.name int8ArrayLastIndexOfPart03Test031
     * @tc.desc Verify lastIndexOf MIN(-128) -128 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(1, 2, 3);
      let r: int = a.lastIndexOf(-128);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_3200
     * @tc.name int8ArrayLastIndexOfPart03Test032
     * @tc.desc Verify lastIndexOf 0 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(1, 2, 3);
      let r: int = a.lastIndexOf(0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_3300
     * @tc.name int8ArrayLastIndexOfPart03Test033
     * @tc.desc Verify lastIndexOf -1 -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(0, 1, 2);
      let r: int = a.lastIndexOf(-1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_3400
     * @tc.name int8ArrayLastIndexOfPart03Test034
     * @tc.desc Verify fromIndex -1 -1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5, 10, 5, 20, 5);
      let r: int = a.lastIndexOf(99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_3500
     * @tc.name int8ArrayLastIndexOfPart03Test035
     * @tc.desc Verify searchElement=200( -56) fromIndex=-length-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(-56, 5, -56);
      let r: int = a.lastIndexOf(200, -4);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_3600
     * @tc.name int8ArrayLastIndexOfPart03Test036
     * @tc.desc Verify searchElement=255( -1) fromIndex=-length-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(-1, 5, -1);
      let r: int = a.lastIndexOf(255, -4);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_3700
     * @tc.name int8ArrayLastIndexOfPart03Test037
     * @tc.desc Verify fromIndex=length 10 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5, 10, 5, 20, 5);
      let r: int = a.lastIndexOf(10, 5);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_3800
     * @tc.name int8ArrayLastIndexOfPart03Test038
     * @tc.desc Verify fromIndex=-1 20 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5, 10, 5, 20, 5);
      let r: int = a.lastIndexOf(20, -1);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_3900
     * @tc.name int8ArrayLastIndexOfPart03Test039
     * @tc.desc Verify lastIndexOf returns -1 below range and keeps length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5, 10, 5, 20, 5);
      let before: int = a.length;
      let r: int = a.lastIndexOf(5, -6);
      let r1: int = a.length;
      let e1: int = before;
      expect(r).assertEqual(-1);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_4000
     * @tc.name int8ArrayLastIndexOfPart03Test040
     * @tc.desc Verify lastIndexOf index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5, 10, 5, 20, 5);
      let r: int = a.lastIndexOf(200, 2147483647);
      let r1: number = a.$_get(0);
      let e1: int = 5;
      expect(r).assertEqual(-1);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART03_TEST_4100
     * @tc.name int8ArrayLastIndexOfPart03Test041
     * @tc.desc Verify lastIndexOf index 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = Int8Array.of(5, 10, 5, 20, 5);
      let r: int = a.lastIndexOf(Number.NaN, -1);
      let r1: number = a.$_get(4);
      let e1: int = 5;
      expect(r).assertEqual(-1);
      expect(r1).assertEqual(e1);
    });
  });
}
