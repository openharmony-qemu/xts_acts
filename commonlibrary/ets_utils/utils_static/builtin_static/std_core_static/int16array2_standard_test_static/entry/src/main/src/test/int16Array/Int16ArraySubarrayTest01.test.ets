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

export default function int16ArraySubarrayTestOneTest(): void {
  describe('Int16ArraySubarrayTestOneTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_0100
     * @tc.name testInt16ArraySubarrayTestOne001
     * @tc.desc Verify subarray() length and first element match full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray();
      let actual1: int = sub.length;
      expect(actual1).assertEqual(5);
      let actual2: number = sub.$_get(0);
      expect(actual2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_0200
     * @tc.name testInt16ArraySubarrayTestOne002
     * @tc.desc Verify subarray() length equals arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray();
      let actual1: int = sub.length;
      let expected1: int = arr.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_0300
     * @tc.name testInt16ArraySubarrayTestOne003
     * @tc.desc Verify subarray() element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray();
      let actual1: number = sub.$_get(0 as int);
      let expected1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_0400
     * @tc.name testInt16ArraySubarrayTestOne004
     * @tc.desc Verify subarray(1) element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(1);
      let actual1: number = sub.$_get(0 as int);
      let expected1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_0500
     * @tc.name testInt16ArraySubarrayTestOne005
     * @tc.desc Verify subarray(1) length equals arr.length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(1);
      let actual1: int = sub.length;
      let expected1: int = arr.length - 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_0600
     * @tc.name testInt16ArraySubarrayTestOne006
     * @tc.desc Verify subarray(0, 2) length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0, 2);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_0700
     * @tc.name testInt16ArraySubarrayTestOne007
     * @tc.desc Verify subarray(0) element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0);
      let actual1: number = sub.$_get(0 as int);
      let expected1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_0800
     * @tc.name testInt16ArraySubarrayTestOne008
     * @tc.desc Verify subarray(0) length equals arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0);
      let actual1: int = sub.length;
      let expected1: int = arr.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_0900
     * @tc.name testInt16ArraySubarrayTestOne009
     * @tc.desc Verify subarray(1) length equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(1);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_1000
     * @tc.name testInt16ArraySubarrayTestOne010
     * @tc.desc Verify subarray(4) element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(4);
      let actual1: number = sub.$_get(0 as int);
      let expected1: number = arr.$_get(4 as int);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_1100
     * @tc.name testInt16ArraySubarrayTestOne011
     * @tc.desc Verify subarray(4) length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(4);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_1200
     * @tc.name testInt16ArraySubarrayTestOne012
     * @tc.desc Verify subarray(5) length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(5);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_1300
     * @tc.name testInt16ArraySubarrayTestOne013
     * @tc.desc Verify subarray(2147483647) length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(2147483647);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_1400
     * @tc.name testInt16ArraySubarrayTestOne014
     * @tc.desc Verify subarray(-1) element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(-1);
      let actual1: number = sub.$_get(0 as int);
      let expected1: number = arr.$_get(4 as int);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_1500
     * @tc.name testInt16ArraySubarrayTestOne015
     * @tc.desc Verify subarray(-1) length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(-1);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_1600
     * @tc.name testInt16ArraySubarrayTestOne016
     * @tc.desc Verify subarray(-2) element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(-2);
      let actual1: number = sub.$_get(0 as int);
      let expected1: number = arr.$_get(3 as int);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_1700
     * @tc.name testInt16ArraySubarrayTestOne017
     * @tc.desc Verify subarray(-2) length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(-2);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_1800
     * @tc.name testInt16ArraySubarrayTestOne018
     * @tc.desc Verify subarray(-5) length equals arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(-5);
      let actual1: int = sub.length;
      let expected1: int = arr.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_1900
     * @tc.name testInt16ArraySubarrayTestOne019
     * @tc.desc Verify subarray(-5) element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(-5);
      let actual1: number = sub.$_get(0 as int);
      let expected1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_2000
     * @tc.name testInt16ArraySubarrayTestOne020
     * @tc.desc Verify subarray(-6) length equals arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(-6);
      let actual1: int = sub.length;
      let expected1: int = arr.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_2100
     * @tc.name testInt16ArraySubarrayTestOne021
     * @tc.desc Verify subarray(-6) element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(-6);
      let actual1: number = sub.$_get(0 as int);
      let expected1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_2200
     * @tc.name testInt16ArraySubarrayTestOne022
     * @tc.desc Verify subarray(-1) length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let sub: Int16Array = arr.subarray(-1);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_2300
     * @tc.name testInt16ArraySubarrayTestOne023
     * @tc.desc Verify subarray(1) length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let sub: Int16Array = arr.subarray(1);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_2400
     * @tc.name testInt16ArraySubarrayTestOne024
     * @tc.desc Verify subarray(0) length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let sub: Int16Array = arr.subarray(0);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_2500
     * @tc.name testInt16ArraySubarrayTestOne025
     * @tc.desc Verify subarray(0, 0) length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0, 0);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_2600
     * @tc.name testInt16ArraySubarrayTestOne026
     * @tc.desc Verify subarray(0, 1) element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0, 1);
      let actual1: number = sub.$_get(0 as int);
      let expected1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_2700
     * @tc.name testInt16ArraySubarrayTestOne027
     * @tc.desc Verify subarray(0, 1) length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0, 1);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_2800
     * @tc.name testInt16ArraySubarrayTestOne028
     * @tc.desc Verify subarray(0, 5) element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0, 5);
      let actual1: number = sub.$_get(4 as int);
      let expected1: number = arr.$_get(4 as int);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_2900
     * @tc.name testInt16ArraySubarrayTestOne029
     * @tc.desc Verify subarray(0, 6) length equals arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0, 6);
      let actual1: int = sub.length;
      let expected1: int = arr.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_3000
     * @tc.name testInt16ArraySubarrayTestOne030
     * @tc.desc Verify subarray(1, 1) length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(1, 1);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_3100
     * @tc.name testInt16ArraySubarrayTestOne031
     * @tc.desc Verify subarray(2, 1) length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(2, 1);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_3200
     * @tc.name testInt16ArraySubarrayTestOne032
     * @tc.desc Verify subarray(0, -1) length equals expected length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0, -1);
      let actual1: number = sub.$_get((sub.length - 1) as int);
      let expected1: number = arr.$_get((arr.length - 2) as int);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_3300
     * @tc.name testInt16ArraySubarrayTestOne033
     * @tc.desc Verify subarray(0, -1) length equals arr.length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0, -1);
      let actual1: int = sub.length;
      let expected1: int = arr.length - 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_3400
     * @tc.name testInt16ArraySubarrayTestOne034
     * @tc.desc Verify subarray(0, -2) length equals arr.length - 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0, -2);
      let actual1: int = sub.length;
      let expected1: int = arr.length - 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_3500
     * @tc.name testInt16ArraySubarrayTestOne035
     * @tc.desc Verify subarray(0, -5) length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0, -5);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_3600
     * @tc.name testInt16ArraySubarrayTestOne036
     * @tc.desc Verify subarray(0, 1) length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let sub: Int16Array = arr.subarray(0, 1);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_3700
     * @tc.name testInt16ArraySubarrayTestOne037
     * @tc.desc Verify subarray(0, 1) out-of-range $_get is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0, 1);
      let lenBefore: int = sub.length;
      try {
        sub.$_get(1 as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actual1: int = sub.length;
      let expected1: int = lenBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_3800
     * @tc.name testInt16ArraySubarrayTestOne038
     * @tc.desc Verify subarray(-2, -1) element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(-2, -1);
      let actual1: number = sub.$_get(0 as int);
      let expected1: number = arr.$_get(3 as int);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_3900
     * @tc.name testInt16ArraySubarrayTestOne039
     * @tc.desc Verify subarray(-2, -1) length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(-2, -1);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_4000
     * @tc.name testInt16ArraySubarrayTestOne040
     * @tc.desc Verify subarray(1, 4) length equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(1, 4);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_4100
     * @tc.name testInt16ArraySubarrayTestOne041
     * @tc.desc Verify subarray(1, 4) element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(1, 4);
      let actual1: number = sub.$_get(0 as int);
      expect(actual1).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_4200
     * @tc.name testInt16ArraySubarrayTestOne042
     * @tc.desc Verify subarray(1, 4) shares buffer: sub set reflects on original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(1, 4);
      sub.$_set(0 as int, 99);
      let actual1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_4300
     * @tc.name testInt16ArraySubarrayTestOne043
     * @tc.desc Verify subarray(1, 4) shares buffer: original set reflects on sub
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(1, 4);
      arr.$_set(2 as int, 88);
      let actual1: number = sub.$_get(1 as int);
      expect(actual1).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_4400
     * @tc.name testInt16ArraySubarrayTestOne044
     * @tc.desc Verify subarray(0, 3) shares buffer: sub set reflects on original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0, 3);
      sub.$_set(0 as int, 11);
      sub.$_set(1 as int, 22);
      sub.$_set(2 as int, 33);
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_4500
     * @tc.name testInt16ArraySubarrayTestOne045
     * @tc.desc Verify subarray(1, 4) byteOffset equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(1, 4);
      let actual1: int = sub.byteOffset;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_4600
     * @tc.name testInt16ArraySubarrayTestOne046
     * @tc.desc Verify subarray(0, 3) byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0, 3);
      let actual1: int = sub.byteOffset;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_4700
     * @tc.name testInt16ArraySubarrayTestOne047
     * @tc.desc Verify subarray(1, 4) byteLength equals 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(1, 4);
      let actual1: int = sub.byteLength;
      expect(actual1).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_4800
     * @tc.name testInt16ArraySubarrayTestOne048
     * @tc.desc Verify subarray(1, 3) shares buffer: original set reflects on sub
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(1, 3);
      arr.$_set(3 as int, 99);
      let actual1: number = sub.$_get(1 as int);
      expect(actual1).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_4900
     * @tc.name testInt16ArraySubarrayTestOne049
     * @tc.desc Verify overlapping subarray(0, 3) views share buffer mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let subA: Int16Array = arr.subarray(0, 3);
      let subB: Int16Array = arr.subarray(2, 5);
      subA.$_set(2 as int, 77);
      let actual1: number = subB.$_get(0 as int);
      expect(actual1).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_5000
     * @tc.name testInt16ArraySubarrayTestOne050
     * @tc.desc Verify overlapping subarray(0, 2) views share buffer mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let subA: Int16Array = arr.subarray(0, 2);
      let subB: Int16Array = arr.subarray(3, 5);
      subA.$_set(0 as int, 99);
      let actual1: number = subB.$_get(0 as int);
      expect(actual1).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_5100
     * @tc.name testInt16ArraySubarrayTestOne051
     * @tc.desc Verify subarray() shares buffer: sub set reflects on original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray();
      sub.$_set(0 as int, 55);
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_5200
     * @tc.name testInt16ArraySubarrayTestOne052
     * @tc.desc Verify subarray(1, 3) shares buffer with original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(1, 3);
      let actual1: boolean = sub.buffer === arr.buffer;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_5300
     * @tc.name testInt16ArraySubarrayTestOne053
     * @tc.desc Verify subarray(0, 3) length and first element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0, 3);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(3);
      let actual2: number = sub.$_get(0);
      expect(actual2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_5400
     * @tc.name testInt16ArraySubarrayTestOne054
     * @tc.desc Verify subarray(2, 2) shares buffer with original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(2, 2);
      let actual1: boolean = sub.buffer === arr.buffer;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_5500
     * @tc.name testInt16ArraySubarrayTestOne055
     * @tc.desc Verify subarray(0, 5) shares buffer: sub set reflects on original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(0, 5);
      sub.$_set(4 as int, 999);
      let actual1: number = arr.$_get(4 as int);
      expect(actual1).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_5600
     * @tc.name testInt16ArraySubarrayTestOne056
     * @tc.desc Verify subarray(1, 5) shares buffer: sub set reflects on original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub1: Int16Array = arr.subarray(1, 5);
      let sub2: Int16Array = sub1.subarray(1, 3);
      sub2.$_set(0 as int, 555);
      let actual1: number = arr.$_get(2 as int);
      expect(actual1).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_5700
     * @tc.name testInt16ArraySubarrayTestOne057
     * @tc.desc Verify subarray(1, 5) byteOffset equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub1: Int16Array = arr.subarray(1, 5);
      let sub2: Int16Array = sub1.subarray(1, 3);
      let actual1: int = sub2.byteOffset;
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_5800
     * @tc.name testInt16ArraySubarrayTestOne058
     * @tc.desc Verify subarray(-3, -1) shares buffer: sub set reflects on original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(-3, -1);
      sub.$_set(0 as int, 777);
      let actual1: number = arr.$_get(2 as int);
      expect(actual1).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_ONE_5900
     * @tc.name testInt16ArraySubarrayTestOne059
     * @tc.desc Verify subarray(-3) byteOffset equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(-3);
      let actual1: int = sub.byteOffset;
      expect(actual1).assertEqual(4);
    });
  });
}
