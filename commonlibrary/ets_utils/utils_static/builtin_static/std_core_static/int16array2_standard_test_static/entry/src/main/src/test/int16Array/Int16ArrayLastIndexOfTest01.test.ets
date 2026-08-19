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

export default function int16ArrayLastIndexOfTestOneTest(): void {
  describe('Int16ArrayLastIndexOfTestOneTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_0100
     * @tc.name testInt16ArrayLastIndexOfTestOne001
     * @tc.desc Verify arr.lastIndexOf(30) on new Int16Array([10, 20, 30]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: int = arr.lastIndexOf(30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_0200
     * @tc.name testInt16ArrayLastIndexOfTestOne002
     * @tc.desc Verify arr.lastIndexOf(40) on new Int16Array([40, 50, 60]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([40, 50, 60]);
      let result: int = arr.lastIndexOf(40);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_0300
     * @tc.name testInt16ArrayLastIndexOfTestOne003
     * @tc.desc Verify arr.lastIndexOf(999) on new Int16Array([1, 2, 3]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: int = arr.lastIndexOf(999);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_0400
     * @tc.name testInt16ArrayLastIndexOfTestOne004
     * @tc.desc Verify arr.lastIndexOf(5) on new Int16Array(0) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: int = arr.lastIndexOf(5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_0500
     * @tc.name testInt16ArrayLastIndexOfTestOne005
     * @tc.desc Verify arr.lastIndexOf(7, 0) on new Int16Array([7, 8, 9]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 8, 9]);
      let result: int = arr.lastIndexOf(7, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_0600
     * @tc.name testInt16ArrayLastIndexOfTestOne006
     * @tc.desc Verify arr.lastIndexOf(8, 0) on new Int16Array([7, 8, 9]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 8, 9]);
      let result: int = arr.lastIndexOf(8, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_0700
     * @tc.name testInt16ArrayLastIndexOfTestOne007
     * @tc.desc Verify arr.lastIndexOf(10, 2) on new Int16Array([10, 20, 10]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 10]);
      let result: int = arr.lastIndexOf(10, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_0800
     * @tc.name testInt16ArrayLastIndexOfTestOne008
     * @tc.desc Verify arr.lastIndexOf(10, -1) on new Int16Array([5, 10, 15, 10]) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15, 10]);
      let result: int = arr.lastIndexOf(10, -1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_0900
     * @tc.name testInt16ArrayLastIndexOfTestOne009
     * @tc.desc Verify arr.lastIndexOf(302) on new Int16Array([300, 301, 302, 303]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([300, 301, 302, 303]);
      let result: int = arr.lastIndexOf(302);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_1000
     * @tc.name testInt16ArrayLastIndexOfTestOne010
     * @tc.desc Verify arr.lastIndexOf(888) on new Int16Array([1, 2, 3]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: int = arr.lastIndexOf(888);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_1100
     * @tc.name testInt16ArrayLastIndexOfTestOne011
     * @tc.desc Verify arr.lastIndexOf(0) on new Int16Array(0) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: int = arr.lastIndexOf(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_1200
     * @tc.name testInt16ArrayLastIndexOfTestOne012
     * @tc.desc Verify arr.lastIndexOf(42) on new Int16Array([42]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      let result: int = arr.lastIndexOf(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_1300
     * @tc.name testInt16ArrayLastIndexOfTestOne013
     * @tc.desc Verify arr.lastIndexOf(99) on new Int16Array([42]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      let result: int = arr.lastIndexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_1400
     * @tc.name testInt16ArrayLastIndexOfTestOne014
     * @tc.desc Verify arr.lastIndexOf(11) on new Int16Array([11, 22, 11, 33]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([11, 22, 11, 33]);
      let result: int = arr.lastIndexOf(11);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_1500
     * @tc.name testInt16ArrayLastIndexOfTestOne015
     * @tc.desc Verify arr.lastIndexOf(5) on new Int16Array([5, 5, 5]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 5, 5]);
      let result: int = arr.lastIndexOf(5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_1600
     * @tc.name testInt16ArrayLastIndexOfTestOne016
     * @tc.desc Verify arr.lastIndexOf(77) on new Int16Array([77, 88, 99, 88, 77]) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([77, 88, 99, 88, 77]);
      let result: int = arr.lastIndexOf(77);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_1700
     * @tc.name testInt16ArrayLastIndexOfTestOne017
     * @tc.desc Verify arr.lastIndexOf(3) on new Int16Array([3, 3, 3, 3]) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 3, 3, 3]);
      let result: int = arr.lastIndexOf(3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_1800
     * @tc.name testInt16ArrayLastIndexOfTestOne018
     * @tc.desc Verify arr.lastIndexOf(2) on new Int16Array([1, 2, 2, 2, 3]) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 2, 2, 3]);
      let result: int = arr.lastIndexOf(2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_1900
     * @tc.name testInt16ArrayLastIndexOfTestOne019
     * @tc.desc Verify arr.lastIndexOf(0) on new Int16Array([1, 0, 2]) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 0, 2]);
      let result: int = arr.lastIndexOf(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_2000
     * @tc.name testInt16ArrayLastIndexOfTestOne020
     * @tc.desc Verify arr.lastIndexOf(-0) on new Int16Array([5, 0, 10]) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 0, 10]);
      let result: int = arr.lastIndexOf(-0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_2100
     * @tc.name testInt16ArrayLastIndexOfTestOne021
     * @tc.desc Verify arr.lastIndexOf(Number.NaN) on new Int16Array([10, 20, 30]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: int = arr.lastIndexOf(Number.NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_2200
     * @tc.name testInt16ArrayLastIndexOfTestOne022
     * @tc.desc Verify arr.lastIndexOf(Number.POSITIVE_INFINITY) on new Int16Array(1) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      arr.$_set(0 as int, Number.POSITIVE_INFINITY);
      let result: int = arr.lastIndexOf(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_2300
     * @tc.name testInt16ArrayLastIndexOfTestOne023
     * @tc.desc Verify arr.lastIndexOf(Number.NEGATIVE_INFINITY) on new Int16Array(1) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      arr.$_set(0 as int, Number.NEGATIVE_INFINITY);
      let result: int = arr.lastIndexOf(Number.NEGATIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_2400
     * @tc.name testInt16ArrayLastIndexOfTestOne024
     * @tc.desc Verify arr.lastIndexOf(0) on new Int16Array(1) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      arr.$_set(0 as int, Number.POSITIVE_INFINITY);
      let result: int = arr.lastIndexOf(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_2500
     * @tc.name testInt16ArrayLastIndexOfTestOne025
     * @tc.desc Verify arr.lastIndexOf(32767) on new Int16Array([0, 32767, 100]) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 32767, 100]);
      let result: int = arr.lastIndexOf(32767);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_2600
     * @tc.name testInt16ArrayLastIndexOfTestOne026
     * @tc.desc Verify arr.lastIndexOf(-32768) on new Int16Array([0, -32768, 100]) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, -32768, 100]);
      let result: int = arr.lastIndexOf(-32768);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_2700
     * @tc.name testInt16ArrayLastIndexOfTestOne027
     * @tc.desc Verify arr.lastIndexOf(32767) on new Int16Array([100, 200, 300]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: int = arr.lastIndexOf(32767);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_2800
     * @tc.name testInt16ArrayLastIndexOfTestOne028
     * @tc.desc Verify arr.lastIndexOf(-32768) on new Int16Array([100, 200, 300]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: int = arr.lastIndexOf(-32768);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_2900
     * @tc.name testInt16ArrayLastIndexOfTestOne029
     * @tc.desc Verify arr.lastIndexOf(32768) on new Int16Array(1) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      arr.$_set(0 as int, 32768);
      let result: int = arr.lastIndexOf(32768);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_3000
     * @tc.name testInt16ArrayLastIndexOfTestOne030
     * @tc.desc Verify arr.lastIndexOf(-32769) on new Int16Array(1) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      arr.$_set(0 as int, -32769);
      let result: int = arr.lastIndexOf(-32769);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_3100
     * @tc.name testInt16ArrayLastIndexOfTestOne031
     * @tc.desc Verify arr.lastIndexOf(-32768) on new Int16Array(1) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      arr.$_set(0 as int, 32768);
      let result: int = arr.lastIndexOf(-32768);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_3200
     * @tc.name testInt16ArrayLastIndexOfTestOne032
     * @tc.desc Verify arr.lastIndexOf(32767) on new Int16Array(1) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      arr.$_set(0 as int, -32769);
      let result: int = arr.lastIndexOf(32767);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_3300
     * @tc.name testInt16ArrayLastIndexOfTestOne033
     * @tc.desc Verify arr.lastIndexOf(3.7) on new Int16Array(1) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      arr.$_set(0 as int, 3.7);
      let result: int = arr.lastIndexOf(3.7);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_3400
     * @tc.name testInt16ArrayLastIndexOfTestOne034
     * @tc.desc Verify arr.lastIndexOf(3) on new Int16Array(1) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      arr.$_set(0 as int, 3.7);
      let result: int = arr.lastIndexOf(3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_3500
     * @tc.name testInt16ArrayLastIndexOfTestOne035
     * @tc.desc Verify arr.lastIndexOf(-3.7) on new Int16Array(1) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      arr.$_set(0 as int, -3.7);
      let result: int = arr.lastIndexOf(-3.7);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_3600
     * @tc.name testInt16ArrayLastIndexOfTestOne036
     * @tc.desc Verify arr.lastIndexOf(-3) on new Int16Array(1) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      arr.$_set(0 as int, -3.7);
      let result: int = arr.lastIndexOf(-3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_3700
     * @tc.name testInt16ArrayLastIndexOfTestOne037
     * @tc.desc Verify arr.lastIndexOf(3.0) on new Int16Array(1) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      arr.$_set(0 as int, 3.7);
      let result: int = arr.lastIndexOf(3.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_3800
     * @tc.name testInt16ArrayLastIndexOfTestOne038
     * @tc.desc Verify arr.lastIndexOf(-3.0) on new Int16Array(1) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      arr.$_set(0 as int, -3.7);
      let result: int = arr.lastIndexOf(-3.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_3900
     * @tc.name testInt16ArrayLastIndexOfTestOne039
     * @tc.desc Verify arr.lastIndexOf(-1) on new Int16Array([0, -1, 2]) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, -1, 2]);
      let result: int = arr.lastIndexOf(-1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_4000
     * @tc.name testInt16ArrayLastIndexOfTestOne040
     * @tc.desc Verify arr.lastIndexOf(-1) on new Int16Array([0, 1, 2]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 1, 2]);
      let result: int = arr.lastIndexOf(-1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_4100
     * @tc.name testInt16ArrayLastIndexOfTestOne041
     * @tc.desc Verify arr.lastIndexOf(100000) on new Int16Array([1, 2, 3]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: int = arr.lastIndexOf(100000);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_4200
     * @tc.name testInt16ArrayLastIndexOfTestOne042
     * @tc.desc Verify arr.lastIndexOf(-100000) on new Int16Array([1, 2, 3]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: int = arr.lastIndexOf(-100000);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_4300
     * @tc.name testInt16ArrayLastIndexOfTestOne043
     * @tc.desc Verify arr.lastIndexOf(0) on new Int16Array([0, 1, 0, 2, 0]) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 1, 0, 2, 0]);
      let result: int = arr.lastIndexOf(0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_4400
     * @tc.name testInt16ArrayLastIndexOfTestOne044
     * @tc.desc Verify arr.lastIndexOf(1000) on new Int16Array([1000, 2000, 1000]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1000, 2000, 1000]);
      let result: int = arr.lastIndexOf(1000);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_4500
     * @tc.name testInt16ArrayLastIndexOfTestOne045
     * @tc.desc Verify arr.lastIndexOf(99, 0) on new Int16Array([10, 20, 30]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: int = arr.lastIndexOf(99, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_4600
     * @tc.name testInt16ArrayLastIndexOfTestOne046
     * @tc.desc Verify arr.lastIndexOf(70, 2) on new Int16Array([70, 80, 90]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([70, 80, 90]);
      let result: int = arr.lastIndexOf(70, 2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_4700
     * @tc.name testInt16ArrayLastIndexOfTestOne047
     * @tc.desc Verify arr.lastIndexOf(3, 3) on new Int16Array([1, 2, 3]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: int = arr.lastIndexOf(3, 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_4800
     * @tc.name testInt16ArrayLastIndexOfTestOne048
     * @tc.desc Verify arr.lastIndexOf(30, 4) on new Int16Array([10, 20, 30]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let result: int = arr.lastIndexOf(30, 4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_4900
     * @tc.name testInt16ArrayLastIndexOfTestOne049
     * @tc.desc Verify arr.lastIndexOf(10, 10000) on new Int16Array([5, 10, 15, 10]) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15, 10]);
      let result: int = arr.lastIndexOf(10, 10000);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_5000
     * @tc.name testInt16ArrayLastIndexOfTestOne050
     * @tc.desc Verify arr.lastIndexOf(7, 1) on new Int16Array([7, 3, 7]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 3, 7]);
      let result: int = arr.lastIndexOf(7, 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_5100
     * @tc.name testInt16ArrayLastIndexOfTestOne051
     * @tc.desc Verify arr.lastIndexOf(3, 1) on new Int16Array([1, 2, 3]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: int = arr.lastIndexOf(3, 1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_5200
     * @tc.name testInt16ArrayLastIndexOfTestOne052
     * @tc.desc Verify arr.lastIndexOf(300, -1) on new Int16Array([100, 200, 300]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: int = arr.lastIndexOf(300, -1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_5300
     * @tc.name testInt16ArrayLastIndexOfTestOne053
     * @tc.desc Verify arr.lastIndexOf(200, -1) on new Int16Array([100, 200, 300]) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let result: int = arr.lastIndexOf(200, -1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_5400
     * @tc.name testInt16ArrayLastIndexOfTestOne054
     * @tc.desc Verify arr.lastIndexOf(30, -2) on new Int16Array([10, 20, 30, 40]) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let result: int = arr.lastIndexOf(30, -2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_5500
     * @tc.name testInt16ArrayLastIndexOfTestOne055
     * @tc.desc Verify arr.lastIndexOf(40, -2) on new Int16Array([10, 20, 30, 40]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let result: int = arr.lastIndexOf(40, -2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_5600
     * @tc.name testInt16ArrayLastIndexOfTestOne056
     * @tc.desc Verify arr.lastIndexOf(88, -3) on new Int16Array([88, 99, 100, 101]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([88, 99, 100, 101]);
      let result: int = arr.lastIndexOf(88, -3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_5700
     * @tc.name testInt16ArrayLastIndexOfTestOne057
     * @tc.desc Verify arr.lastIndexOf(4, -3) on new Int16Array([1, 2, 3, 4]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let result: int = arr.lastIndexOf(4, -3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_5800
     * @tc.name testInt16ArrayLastIndexOfTestOne058
     * @tc.desc Verify arr.lastIndexOf(55, -3) on new Int16Array([55, 66, 77]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([55, 66, 77]);
      let result: int = arr.lastIndexOf(55, -3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_5900
     * @tc.name testInt16ArrayLastIndexOfTestOne059
     * @tc.desc Verify arr.lastIndexOf(66, -3) on new Int16Array([55, 66, 77]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([55, 66, 77]);
      let result: int = arr.lastIndexOf(66, -3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_6000
     * @tc.name testInt16ArrayLastIndexOfTestOne060
     * @tc.desc Verify arr.lastIndexOf(1, -4) on new Int16Array([1, 2, 3]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: int = arr.lastIndexOf(1, -4);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_6100
     * @tc.name testInt16ArrayLastIndexOfTestOne061
     * @tc.desc Verify arr.lastIndexOf(10, -4) on new Int16Array([10, 20]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20]);
      let result: int = arr.lastIndexOf(10, -4);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_6200
     * @tc.name testInt16ArrayLastIndexOfTestOne062
     * @tc.desc Verify arr.lastIndexOf(5, -10000) on new Int16Array([5, 10, 15]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15]);
      let result: int = arr.lastIndexOf(5, -10000);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_6300
     * @tc.name testInt16ArrayLastIndexOfTestOne063
     * @tc.desc Verify arr.lastIndexOf(2, 0) on new Int16Array([2, 1, 3, 2]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([2, 1, 3, 2]);
      let result: int = arr.lastIndexOf(2, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_6400
     * @tc.name testInt16ArrayLastIndexOfTestOne064
     * @tc.desc Verify arr.lastIndexOf(5, 2) on new Int16Array([0, 5, 0, 5]) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 5, 0, 5]);
      let result: int = arr.lastIndexOf(5, 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_6500
     * @tc.name testInt16ArrayLastIndexOfTestOne065
     * @tc.desc Verify arr.lastIndexOf(1, -2) on new Int16Array([9, 1, 9, 1, 9]) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([9, 1, 9, 1, 9]);
      let result: int = arr.lastIndexOf(1, -2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_6600
     * @tc.name testInt16ArrayLastIndexOfTestOne066
     * @tc.desc Verify arr.lastIndexOf(1, -3) on new Int16Array([9, 1, 9, 1, 9]) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([9, 1, 9, 1, 9]);
      let result: int = arr.lastIndexOf(1, -3);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_6700
     * @tc.name testInt16ArrayLastIndexOfTestOne067
     * @tc.desc Verify arr.lastIndexOf(4, 1) on new Int16Array([4, 2, 4]) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([4, 2, 4]);
      let result: int = arr.lastIndexOf(4, 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_6800
     * @tc.name testInt16ArrayLastIndexOfTestOne068
     * @tc.desc Verify arr.lastIndexOf(1, 0) on new Int16Array(0) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: int = arr.lastIndexOf(1, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_ONE_6900
     * @tc.name testInt16ArrayLastIndexOfTestOne069
     * @tc.desc Verify arr.lastIndexOf(1, -1) on new Int16Array(0) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: int = arr.lastIndexOf(1, -1);
      expect(result).assertEqual(-1);
    });
  });
}
