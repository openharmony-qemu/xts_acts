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

export default function int16ArraySubarrayTestFourTest(): void {
  describe('Int16ArraySubarrayTestFourTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_0100
     * @tc.name testInt16ArraySubarrayTestFour001
     * @tc.desc Verify subarray 32769 -32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0);
      let ret: Int16Array = arr.subarray(1, 3);
      ret.$_set(0 as int, 32769);
      let actual1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(-32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_0200
     * @tc.name testInt16ArraySubarrayTestFour002
     * @tc.desc Verify subarray -32769 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0);
      let ret: Int16Array = arr.subarray(1, 3);
      ret.$_set(0 as int, -32769);
      let actual1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_0300
     * @tc.name testInt16ArraySubarrayTestFour003
     * @tc.desc Verify subarray overflow write truncates to Int16 range on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0);
      let ret: Int16Array = arr.subarray(0, 2);
      ret.$_set(0 as int, 65536);
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_0400
     * @tc.name testInt16ArraySubarrayTestFour004
     * @tc.desc Verify subarray write float truncates toward zero on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0);
      let ret: Int16Array = arr.subarray(1, 3);
      ret.$_set(0 as int, 3.7);
      let actual1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_0500
     * @tc.name testInt16ArraySubarrayTestFour005
     * @tc.desc Verify subarray write float truncates toward zero on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0);
      let ret: Int16Array = arr.subarray(2, 4);
      ret.$_set(0 as int, -3.7);
      let actual1: number = arr.$_get(2 as int);
      expect(actual1).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_0600
     * @tc.name testInt16ArraySubarrayTestFour006
     * @tc.desc Verify subarray $_set null 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
      let ret: Int16Array = arr.subarray(0, 2);
      let nullVal: number = 0;
      ret.$_set(0 as int, nullVal);
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_0700
     * @tc.name testInt16ArraySubarrayTestFour007
     * @tc.desc Verify subarray 32769 subarray -32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let ret: Int16Array = arr.subarray(0, 2);
      ret.$_set(0 as int, 32769);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(-32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_0800
     * @tc.name testInt16ArraySubarrayTestFour008
     * @tc.desc Verify subarray -32769 subarray 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let ret: Int16Array = arr.subarray(1, 3);
      ret.$_set(0 as int, -32769);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_0900
     * @tc.name testInt16ArraySubarrayTestFour009
     * @tc.desc Verify subarray 3.7 subarray 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let ret: Int16Array = arr.subarray(0, 2);
      ret.$_set(0 as int, 3.7);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_1000
     * @tc.name testInt16ArraySubarrayTestFour010
     * @tc.desc Verify subarray 2147483647 int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let ret: Int16Array = arr.subarray(1, 2);
      ret.$_set(0 as int, 2147483647);
      let actual1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_1100
     * @tc.name testInt16ArraySubarrayTestFour011
     * @tc.desc Verify subarray 32768 subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let ret: Int16Array = arr.subarray(1, 2);
      ret.$_set(0 as int, 32768);
      let actual1: number = ret.$_get(0 as int);
      let expected1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_1200
     * @tc.name testInt16ArraySubarrayTestFour012
     * @tc.desc Verify parent write is visible through subarray shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let ret: Int16Array = arr.subarray(1, 4);
      arr.$_set(2 as int, 77);
      let actual1: number = ret.$_get(1 as int);
      expect(actual1).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_1300
     * @tc.name testInt16ArraySubarrayTestFour013
     * @tc.desc Verify parent write is visible through subarray shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let ret: Int16Array = arr.subarray(2, 4);
      arr.$_set(1 as int, 99);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_1400
     * @tc.name testInt16ArraySubarrayTestFour014
     * @tc.desc Verify parent write is visible through subarray shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let ret: Int16Array = arr.subarray(0, 2);
      arr.$_set(2 as int, 99);
      let actual1: number = ret.$_get(1 as int);
      expect(actual1).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_1500
     * @tc.name testInt16ArraySubarrayTestFour015
     * @tc.desc Verify 32769 subarray subarray -32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let ret: Int16Array = arr.subarray(0, 2);
      arr.$_set(0 as int, 32769);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(-32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_1600
     * @tc.name testInt16ArraySubarrayTestFour016
     * @tc.desc Verify 3.7 subarray subarray 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let ret: Int16Array = arr.subarray(1, 2);
      arr.$_set(1 as int, 3.7);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_1700
     * @tc.name testInt16ArraySubarrayTestFour017
     * @tc.desc Verify parent fill propagates into subarray shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let ret: Int16Array = arr.subarray(1, 3);
      arr.fill(99);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(99);
      let actual2: number = ret.$_get(1 as int);
      expect(actual2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_1800
     * @tc.name testInt16ArraySubarrayTestFour018
     * @tc.desc Verify fill subarray subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let ret: Int16Array = arr.subarray(2, 5);
      arr.fill(99, 0, 3);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(99);
      let actual2: number = ret.$_get(1 as int);
      expect(actual2).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_1900
     * @tc.name testInt16ArraySubarrayTestFour019
     * @tc.desc Verify parent reverse propagates into subarray shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let ret: Int16Array = arr.subarray(1, 3);
      arr.reverse();
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(30);
      let actual2: number = ret.$_get(1 as int);
      expect(actual2).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_2000
     * @tc.name testInt16ArraySubarrayTestFour020
     * @tc.desc Verify parent copyWithin propagates into subarray shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let ret: Int16Array = arr.subarray(2, 4);
      arr.copyWithin(0, 2);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_2100
     * @tc.name testInt16ArraySubarrayTestFour021
     * @tc.desc Verify $_set null subarray subarray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let ret: Int16Array = arr.subarray(0, 2);
      let nullVal: number = 0;
      arr.$_set(0 as int, nullVal);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_2200
     * @tc.name testInt16ArraySubarrayTestFour022
     * @tc.desc Verify parent write is visible through subarray shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let ret: Int16Array = arr.subarray(0, 3);
      arr.$_set(0 as int, 55);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_2300
     * @tc.name testInt16ArraySubarrayTestFour023
     * @tc.desc Verify subarray $_set(0 as int, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let ret: Int16Array = arr.subarray(2, 4);
      ret.$_set(0 as int, 99);
      let actual1: number = arr.$_get(2 as int);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_2400
     * @tc.name testInt16ArraySubarrayTestFour024
     * @tc.desc Verify subarray fill subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let ret: Int16Array = arr.subarray(1, 3);
      ret.fill(77);
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1 as int);
      expect(actual2).assertEqual(77);
      let actual3: number = arr.$_get(2 as int);
      expect(actual3).assertEqual(77);
      let actual4: number = arr.$_get(3 as int);
      expect(actual4).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_2500
     * @tc.name testInt16ArraySubarrayTestFour025
     * @tc.desc Verify subarray reverse subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let ret: Int16Array = arr.subarray(1, 3);
      ret.reverse();
      let actual1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(30);
      let actual2: number = arr.$_get(2 as int);
      expect(actual2).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_2600
     * @tc.name testInt16ArraySubarrayTestFour026
     * @tc.desc Verify subarray copyWithin subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let ret: Int16Array = arr.subarray(1, 4);
      ret.copyWithin(0, 1);
      let actual1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(30);
      let actual2: number = arr.$_get(2 as int);
      expect(actual2).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_2700
     * @tc.name testInt16ArraySubarrayTestFour027
     * @tc.desc Verify subarray $_set 3.7 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let ret: Int16Array = arr.subarray(2, 3);
      ret.$_set(0 as int, 3.7);
      let actual1: number = arr.$_get(2 as int);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_2800
     * @tc.name testInt16ArraySubarrayTestFour028
     * @tc.desc Verify subarray $_set -32769 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let ret: Int16Array = arr.subarray(0, 1);
      ret.$_set(0 as int, -32769);
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_2900
     * @tc.name testInt16ArraySubarrayTestFour029
     * @tc.desc Verify subarray sort subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 10, 30, 20, 40);
      let ret: Int16Array = arr.subarray(1, 4);
      ret.sort();
      let actual1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(2 as int);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(3 as int);
      expect(actual3).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_3000
     * @tc.name testInt16ArraySubarrayTestFour030
     * @tc.desc Verify subarray sort subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 30, 10, 20, 40);
      let ret: Int16Array = arr.subarray(1, 4);
      ret.sort();
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(50);
      let actual2: number = arr.$_get(4 as int);
      expect(actual2).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_3100
     * @tc.name testInt16ArraySubarrayTestFour031
     * @tc.desc Verify subarray write is visible through parent shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let ret: Int16Array = arr.subarray(0, 3);
      ret.$_set(0 as int, 11);
      ret.$_set(1 as int, 22);
      ret.$_set(2 as int, 33);
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(11);
      let actual2: number = arr.$_get(1 as int);
      expect(actual2).assertEqual(22);
      let actual3: number = arr.$_get(2 as int);
      expect(actual3).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_3200
     * @tc.name testInt16ArraySubarrayTestFour032
     * @tc.desc Verify multi-subarray shared buffer interaction via subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0);
      let sub1: Int16Array = arr.subarray(0, 2);
      let sub2: Int16Array = arr.subarray(2, 4);
      sub1.$_set(0 as int, 11);
      sub2.$_set(0 as int, 22);
      let actual1: number = sub1.$_get(0 as int);
      expect(actual1).assertEqual(11);
      let actual2: number = sub2.$_get(0 as int);
      expect(actual2).assertEqual(22);
      let actual3: number = arr.$_get(0 as int);
      expect(actual3).assertEqual(11);
      let actual4: number = arr.$_get(2 as int);
      expect(actual4).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_3300
     * @tc.name testInt16ArraySubarrayTestFour033
     * @tc.desc Verify multi-subarray shared buffer interaction via subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let sub1: Int16Array = arr.subarray(0, 2);
      let sub2: Int16Array = arr.subarray(2, 4);
      sub1.$_set(1 as int, 99);
      let actual1: number = sub2.$_get(0 as int);
      expect(actual1).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_3400
     * @tc.name testInt16ArraySubarrayTestFour034
     * @tc.desc Verify multi-subarray shared buffer interaction via subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0, 0);
      let sub1: Int16Array = arr.subarray(0, 2);
      let sub2: Int16Array = arr.subarray(2, 4);
      let sub3: Int16Array = arr.subarray(4, 6);
      sub1.$_set(0 as int, 11);
      sub2.$_set(0 as int, 22);
      sub3.$_set(0 as int, 33);
      let actual1: number = sub1.$_get(0 as int);
      expect(actual1).assertEqual(11);
      let actual2: number = sub2.$_get(0 as int);
      expect(actual2).assertEqual(22);
      let actual3: number = sub3.$_get(0 as int);
      expect(actual3).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_3500
     * @tc.name testInt16ArraySubarrayTestFour035
     * @tc.desc Verify multi-subarray shared buffer interaction via subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let sub1: Int16Array = arr.subarray(0, 3);
      let sub2: Int16Array = arr.subarray(1, 4);
      sub1.$_set(1 as int, 99);
      let actual1: number = sub2.$_get(0 as int);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_3600
     * @tc.name testInt16ArraySubarrayTestFour036
     * @tc.desc Verify multi-subarray shared buffer interaction via subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let sub1: Int16Array = arr.subarray(0, 3);
      let sub2: Int16Array = arr.subarray(1, 4);
      arr.$_set(1 as int, 66);
      let actual1: number = sub1.$_get(1 as int);
      expect(actual1).assertEqual(66);
      let actual2: number = sub2.$_get(0 as int);
      expect(actual2).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_3700
     * @tc.name testInt16ArraySubarrayTestFour037
     * @tc.desc Verify subarray fill updates parent shared buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      let sub1: Int16Array = arr.subarray(0, 4);
      let sub2: Int16Array = arr.subarray(2, 5);
      sub1.fill(99);
      sub2.fill(88);
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(1 as int);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(2 as int);
      expect(actual3).assertEqual(88);
      let actual4: number = arr.$_get(3 as int);
      expect(actual4).assertEqual(88);
      let actual5: number = arr.$_get(4 as int);
      expect(actual5).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_3800
     * @tc.name testInt16ArraySubarrayTestFour038
     * @tc.desc Verify multi-subarray shared buffer interaction via subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let sub1: Int16Array = arr.subarray(1, 2);
      let sub2: Int16Array = arr.subarray(1, 2);
      sub1.$_set(0 as int, 55);
      sub2.$_set(0 as int, 77);
      let actual1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_3900
     * @tc.name testInt16ArraySubarrayTestFour039
     * @tc.desc Verify multi-subarray shared buffer interaction via subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub1: Int16Array = arr.subarray(0, 4);
      let sub2: Int16Array = sub1.subarray(1, 3);
      sub2.$_set(0 as int, 99);
      let actual1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_4000
     * @tc.name testInt16ArraySubarrayTestFour040
     * @tc.desc Verify multi-subarray shared buffer interaction via subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub1: Int16Array = arr.subarray(1, 5);
      let sub2: Int16Array = sub1.subarray(1, 3);
      arr.$_set(2 as int, 88);
      let actual1: number = sub2.$_get(0 as int);
      expect(actual1).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_4100
     * @tc.name testInt16ArraySubarrayTestFour041
     * @tc.desc Verify subarray begin/end buffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let sub1: Int16Array = arr.subarray(1, 3);
      let sub2: Int16Array = arr.subarray(1, 3);
      let actual1: boolean = sub1.buffer === sub2.buffer;
      expect(actual1).assertTrue();
      let actual2: int = sub1.byteOffset;
      let expected2: number = sub2.byteOffset;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_4200
     * @tc.name testInt16ArraySubarrayTestFour042
     * @tc.desc Verify multi-subarray shared buffer interaction via subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let sub1: Int16Array = arr.subarray(1, 3);
      let sub2: Int16Array = arr.subarray(1, 3);
      sub1.$_set(0 as int, 99);
      let actual1: number = sub2.$_get(0 as int);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_4300
     * @tc.name testInt16ArraySubarrayTestFour043
     * @tc.desc Verify parent fill propagates into subarray shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let sub1: Int16Array = arr.subarray(0, 2);
      let sub2: Int16Array = arr.subarray(2, 4);
      arr.fill(99);
      let actual1: number = sub1.$_get(0 as int);
      expect(actual1).assertEqual(99);
      let actual2: number = sub2.$_get(0 as int);
      expect(actual2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_4400
     * @tc.name testInt16ArraySubarrayTestFour044
     * @tc.desc Verify subarray overflow write truncates to Int16 range on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let blBefore: number = arr.byteLength;
      arr.subarray(0, 2);
      let actual1: int = arr.byteLength;
      let expected1: number = blBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_4500
     * @tc.name testInt16ArraySubarrayTestFour045
     * @tc.desc Verify Int16Array subarray shared buffer read/write semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.subarray(1, 2);
      let actual1: boolean = arr.buffer === bufBefore;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_4600
     * @tc.name testInt16ArraySubarrayTestFour046
     * @tc.desc Verify subarray(1, 3) view reads shared buffer element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let ret: Int16Array = arr.subarray(1, 3);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(0);
      let actual2: number = ret.$_get(1 as int);
      expect(actual2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_4700
     * @tc.name testInt16ArraySubarrayTestFour047
     * @tc.desc Verify subarray fill updates parent shared buffer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let ret: Int16Array = arr.subarray(1, 3);
      ret.fill(99);
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1 as int);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(2 as int);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(3 as int);
      expect(actual4).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_4800
     * @tc.name testInt16ArraySubarrayTestFour048
     * @tc.desc Verify parent write is visible through subarray shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let ret: Int16Array = arr.subarray(1, 3);
      arr.$_set(0 as int, 99);
      arr.$_set(3 as int, 88);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(20);
      let actual2: number = ret.$_get(1 as int);
      expect(actual2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_4900
     * @tc.name testInt16ArraySubarrayTestFour049
     * @tc.desc Verify subarray begin=end length 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let ret: Int16Array = arr.subarray(2, 2);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(0);
      let actual2: boolean = ret.buffer === arr.buffer;
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_5000
     * @tc.name testInt16ArraySubarrayTestFour050
     * @tc.desc Verify subarray offset length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let sub1: Int16Array = arr.subarray(0, 1);
      let sub2: Int16Array = arr.subarray(1, 3);
      let sub3: Int16Array = arr.subarray(3, 4);
      let actual1: int = sub1.length;
      expect(actual1).assertEqual(1);
      let actual2: int = sub2.length;
      expect(actual2).assertEqual(2);
      let actual3: int = sub3.length;
      expect(actual3).assertEqual(1);
      let actual4: int = sub1.byteOffset;
      expect(actual4).assertEqual(0);
      let actual5: int = sub2.byteOffset;
      expect(actual5).assertEqual(2);
      let actual6: int = sub3.byteOffset;
      expect(actual6).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_5100
     * @tc.name testInt16ArraySubarrayTestFour051
     * @tc.desc Verify subarray overflow write truncates to Int16 range on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let copy: number[] = [arr.$_get(0 as int), arr.$_get(1 as int), arr.$_get(2 as int), arr.$_get(3 as int)];
      arr.subarray(1, 3);
      let actual1: number = arr.$_get(0 as int);
      let expected1: number = copy[0];
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1 as int);
      let expected2: number = copy[1];
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2 as int);
      let expected3: number = copy[2];
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3 as int);
      let expected4: number = copy[3];
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_5200
     * @tc.name testInt16ArraySubarrayTestFour052
     * @tc.desc Verify creating subarray preserves parent array metadata state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let bpeBefore: number = arr.BYTES_PER_ELEMENT;
      arr.subarray(0, 1);
      let actual1: int = arr.BYTES_PER_ELEMENT;
      let expected1: number = bpeBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_5300
     * @tc.name testInt16ArraySubarrayTestFour053
     * @tc.desc Verify subarray overflow write truncates to Int16 range on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1, -32768);
      let bufBefore: ArrayBuffer = arr.buffer;
      let offBefore: number = arr.byteOffset;
      arr.subarray(-3, -1);
      let actual1: int = arr.length;
      expect(actual1).assertEqual(4);
      let actual2: int = arr.byteOffset;
      let expected2: number = offBefore;
      expect(actual2).assertEqual(expected2);
      let actual3: boolean = arr.buffer === bufBefore;
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_5400
     * @tc.name testInt16ArraySubarrayTestFour054
     * @tc.desc Verify subarray length clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub1: Int16Array = arr.subarray(0, 4);
      let sub2: Int16Array = sub1.subarray(1, 3);
      let actual1: int = sub2.length;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_5500
     * @tc.name testInt16ArraySubarrayTestFour055
     * @tc.desc Verify multi-subarray shared buffer interaction via subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60);
      let sub1: Int16Array = arr.subarray(1, 6);
      let sub2: Int16Array = sub1.subarray(1, 5);
      let sub3: Int16Array = sub2.subarray(1, 3);
      let actual1: int = sub3.byteOffset;
      expect(actual1).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_5600
     * @tc.name testInt16ArraySubarrayTestFour056
     * @tc.desc Verify fully overlapping subarray views share buffer and byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub1: Int16Array = arr.subarray(0, 4);
      let sub2: Int16Array = sub1.subarray(1, 3);
      let sub3: Int16Array = sub2.subarray(0, 1);
      let actual1: boolean = sub3.buffer === arr.buffer;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_5700
     * @tc.name testInt16ArraySubarrayTestFour057
     * @tc.desc Verify multi-subarray shared buffer interaction via subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub1: Int16Array = arr.subarray(1, 5);
      let sub2: Int16Array = sub1.subarray(-2);
      let actual1: int = sub2.byteOffset;
      expect(actual1).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_5800
     * @tc.name testInt16ArraySubarrayTestFour058
     * @tc.desc Verify multi-subarray shared buffer interaction via subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub1: Int16Array = arr.subarray(1, 5);
      let sub2: Int16Array = sub1.subarray(1, 3);
      sub1.$_set(1 as int, 77);
      let actual1: number = sub2.$_get(0 as int);
      expect(actual1).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_5900
     * @tc.name testInt16ArraySubarrayTestFour059
     * @tc.desc Verify multi-subarray shared buffer interaction via subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub1: Int16Array = arr.subarray(0, 4);
      let sub2: Int16Array = sub1.subarray(1, 3);
      sub2.$_set(1 as int, 66);
      let actual1: number = sub1.$_get(2 as int);
      expect(actual1).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_6000
     * @tc.name testInt16ArraySubarrayTestFour060
     * @tc.desc Verify multi-subarray shared buffer interaction via subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 0, -1);
      let sub1: Int16Array = arr.subarray(1, 1);
      let sub2: Int16Array = sub1.subarray(0, 0);
      let actual1: int = sub1.length;
      expect(actual1).assertEqual(0);
      let actual2: int = sub2.length;
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_6100
     * @tc.name testInt16ArraySubarrayTestFour061
     * @tc.desc Verify subarray fill subarray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let ret: Int16Array = arr.subarray(0, 5).fill(99).subarray(1, 4);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_6200
     * @tc.name testInt16ArraySubarrayTestFour062
     * @tc.desc Verify fill subarray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let ret: Int16Array = arr.fill(0).subarray(0, 3).reverse();
      ret.$_set(0 as int, 1);
      ret.$_set(1 as int, 2);
      ret.$_set(2 as int, 3);
      ret.reverse();
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(3);
      let actual2: number = ret.$_get(2 as int);
      expect(actual2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_6300
     * @tc.name testInt16ArraySubarrayTestFour063
     * @tc.desc Verify multi-subarray shared buffer interaction via subarray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60);
      let ret: Int16Array = arr.subarray(0, 6).subarray(1, 5).subarray(1, 3);
      arr.$_set(2 as int, 99);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_6400
     * @tc.name testInt16ArraySubarrayTestFour064
     * @tc.desc Verify subarray + copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let ret: Int16Array = arr.subarray(0, 4);
      ret.copyWithin(0, 2);
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(30);
      let actual2: number = arr.$_get(1 as int);
      expect(actual2).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_6500
     * @tc.name testInt16ArraySubarrayTestFour065
     * @tc.desc Verify fill + subarray + sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(30, 10, 40, 20, 50);
      let ret: Int16Array = arr.fill(0, 0, 4).subarray(0, 4);
      ret.$_set(0 as int, 40);
      ret.$_set(1 as int, 10);
      ret.$_set(2 as int, 30);
      ret.$_set(3 as int, 20);
      ret.sort();
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1 as int);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(2 as int);
      expect(actual3).assertEqual(30);
      let actual4: number = arr.$_get(3 as int);
      expect(actual4).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_6600
     * @tc.name testInt16ArraySubarrayTestFour066
     * @tc.desc Verify subarray + reverse + subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let ret: Int16Array = arr.subarray(0, 5).reverse().subarray(1, 4);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_6700
     * @tc.name testInt16ArraySubarrayTestFour067
     * @tc.desc Verify parent fill propagates into subarray shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      arr.subarray(1, 4).fill(99).reverse();
      let actual1: number = arr.$_get(0 as int);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(4 as int);
      expect(actual2).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_6800
     * @tc.name testInt16ArraySubarrayTestFour068
     * @tc.desc Verify parent write is visible through subarray shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let ret: Int16Array = arr.subarray(1, 2);
      arr.$_set(1 as int, 11);
      ret.$_set(0 as int, 22);
      arr.$_set(1 as int, 33);
      let actual1: number = ret.$_get(0 as int);
      expect(actual1).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_6900
     * @tc.name testInt16ArraySubarrayTestFour069
     * @tc.desc Verify subarray write is visible through parent shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0);
      let ret: Int16Array = arr.subarray(1, 4);
      ret.$_set(0 as int, 11);
      ret.$_set(1 as int, 22);
      ret.$_set(2 as int, 33);
      let actual1: number = arr.$_get(1 as int);
      expect(actual1).assertEqual(11);
      let actual2: number = arr.$_get(2 as int);
      expect(actual2).assertEqual(22);
      let actual3: number = arr.$_get(3 as int);
      expect(actual3).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_FOUR_7000
     * @tc.name testInt16ArraySubarrayTestFour070
     * @tc.desc Verify Int16Array subarray shared buffer read/write semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let ret: Int16Array = arr.subarray(1, 1);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1 as int);
      expect(actual2).assertEqual(20);
    });
  });
}
