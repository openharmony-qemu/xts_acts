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
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';

export default function int16ArrayFillTestTwoTest(): void {
  describe('Int16ArrayFillTestTwoTest', (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_0100
     * @tc.name testInt16ArrayFillTestTwo001
     * @tc.desc Verify fill(99) expect 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_0200
     * @tc.name testInt16ArrayFillTestTwo002
     * @tc.desc Verify fill(77, 2) start range; expect 1/2/77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(77, 2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(2);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(77);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_0300
     * @tc.name testInt16ArrayFillTestTwo003
     * @tc.desc Verify fill(88, 1, 3) start/end range; expect 1/88/4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(88, 1, 3);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(88);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(88);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_0400
     * @tc.name testInt16ArrayFillTestTwo004
     * @tc.desc Verify fill(32767) expect 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(32767);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(32767);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_0500
     * @tc.name testInt16ArrayFillTestTwo005
     * @tc.desc Verify fill(-32768) int16 wrap/overflow; expect -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(-32768);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-32768);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_0600
     * @tc.name testInt16ArrayFillTestTwo006
     * @tc.desc Verify fill(0) expect 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_0700
     * @tc.name testInt16ArrayFillTestTwo007
     * @tc.desc Verify fill(-1) expect -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(-1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-1);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_0800
     * @tc.name testInt16ArrayFillTestTwo008
     * @tc.desc Verify fill(1) empty array; expect 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      arr.fill(1);
      let actual1: int = arr.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_0900
     * @tc.name testInt16ArrayFillTestTwo009
     * @tc.desc Verify fill(5) expect 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0);
      arr.fill(5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_1000
     * @tc.name testInt16ArrayFillTestTwo010
     * @tc.desc Verify fill(base * 3) expect 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let base: int = 10;
      arr.fill(base * 3);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_1100
     * @tc.name testInt16ArrayFillTestTwo011
     * @tc.desc Verify fill(32768) int16 wrap/overflow; expect -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(32768);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-32768);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_1200
     * @tc.name testInt16ArrayFillTestTwo012
     * @tc.desc Verify fill(-32769) expect 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(-32769);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(32767);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_1300
     * @tc.name testInt16ArrayFillTestTwo013
     * @tc.desc Verify fill(65535) int16 wrap/overflow; expect -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(65535);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-1);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_1400
     * @tc.name testInt16ArrayFillTestTwo014
     * @tc.desc Verify fill(65536) int16 wrap/overflow; expect 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 1, 1);
      arr.fill(65536);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_1500
     * @tc.name testInt16ArrayFillTestTwo015
     * @tc.desc Verify fill(-65536) int16 wrap/overflow; expect 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 1, 1);
      arr.fill(-65536);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_1600
     * @tc.name testInt16ArrayFillTestTwo016
     * @tc.desc Verify fill(0x8000) int16 wrap/overflow; expect -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      arr.fill(0x8000);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_1700
     * @tc.name testInt16ArrayFillTestTwo017
     * @tc.desc Verify fill(0x10000) int16 wrap/overflow; expect 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(99, 99);
      arr.fill(0x10000);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_1800
     * @tc.name testInt16ArrayFillTestTwo018
     * @tc.desc Verify fill(v) int16 wrap/overflow; expect -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0);
      let v: number = 32767 + 1;
      arr.fill(v);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_1900
     * @tc.name testInt16ArrayFillTestTwo019
     * @tc.desc Verify fill(32767) expect 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      arr.fill(32767);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_2000
     * @tc.name testInt16ArrayFillTestTwo020
     * @tc.desc Verify fill(-32768) int16 wrap/overflow; expect -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      arr.fill(-32768);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_2100
     * @tc.name testInt16ArrayFillTestTwo021
     * @tc.desc Verify fill(Number.NaN) NaN truncates to 0; expect 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(Number.NaN);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_2200
     * @tc.name testInt16ArrayFillTestTwo022
     * @tc.desc Verify fill(Number.POSITIVE_INFINITY) Infinity truncates to 0; expect 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(Number.POSITIVE_INFINITY);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_2300
     * @tc.name testInt16ArrayFillTestTwo023
     * @tc.desc Verify fill(-Number.POSITIVE_INFINITY) Infinity truncates to 0; expect 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(-Number.POSITIVE_INFINITY);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_2400
     * @tc.name testInt16ArrayFillTestTwo024
     * @tc.desc Verify fill(3.7) float truncation; expect 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(3.7);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(3);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_2500
     * @tc.name testInt16ArrayFillTestTwo025
     * @tc.desc Verify fill(-3.7) float truncation; expect -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(-3.7);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-3);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_2600
     * @tc.name testInt16ArrayFillTestTwo026
     * @tc.desc Verify fill(0.9) float truncation; expect 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 1);
      arr.fill(0.9);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_2700
     * @tc.name testInt16ArrayFillTestTwo027
     * @tc.desc Verify fill(-0.9) float truncation; expect 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 1);
      arr.fill(-0.9);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_2800
     * @tc.name testInt16ArrayFillTestTwo028
     * @tc.desc Verify fill(32767.5) float truncation; expect 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      arr.fill(32767.5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_2900
     * @tc.name testInt16ArrayFillTestTwo029
     * @tc.desc Verify fill(32768.1) int16 wrap/overflow; float truncation; expect -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0);
      arr.fill(32768.1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_3000
     * @tc.name testInt16ArrayFillTestTwo030
     * @tc.desc Verify fill(-0) expect 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(-0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_3100
     * @tc.name testInt16ArrayFillTestTwo031
     * @tc.desc Verify fill(-0) chained fill; expect arr2.$_get(0)/arr2.$_get(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int16Array = Int16Array.of(1, 1);
      let arr2: Int16Array = Int16Array.of(1, 1);
      arr1.fill(-0);
      arr2.fill(0);
      let actual1: number = arr1.$_get(0);
      let expected1: number = arr2.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr1.$_get(1);
      let expected2: number = arr2.$_get(1);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_3200
     * @tc.name testInt16ArrayFillTestTwo032
     * @tc.desc Verify fill(131072) int16 wrap/overflow; expect 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(99, 99);
      arr.fill(131072);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_3300
     * @tc.name testInt16ArrayFillTestTwo033
     * @tc.desc Verify fill(98304) int16 wrap/overflow; expect -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      arr.fill(98304);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_3400
     * @tc.name testInt16ArrayFillTestTwo034
     * @tc.desc Verify fill(99, 0) start range; expect 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_3500
     * @tc.name testInt16ArrayFillTestTwo035
     * @tc.desc Verify fill(99, 1) start range; expect 1/99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_3600
     * @tc.name testInt16ArrayFillTestTwo036
     * @tc.desc Verify fill(99, 4) start range; expect 1/4/99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 4);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(4);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_3700
     * @tc.name testInt16ArrayFillTestTwo037
     * @tc.desc Verify fill(55, s) start range; expect 1/2/55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let s: int = 2;
      arr.fill(55, s);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(2);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_3800
     * @tc.name testInt16ArrayFillTestTwo038
     * @tc.desc Verify fill(99, -1) negative index; start range; expect 1/4/99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, -1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(4);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_3900
     * @tc.name testInt16ArrayFillTestTwo039
     * @tc.desc Verify fill(99, -2) negative index; start range; expect 1/3/99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, -2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(3);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_4000
     * @tc.name testInt16ArrayFillTestTwo040
     * @tc.desc Verify fill(99, -5) negative index; start range; expect 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, -5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(4);
      expect(actual2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_4100
     * @tc.name testInt16ArrayFillTestTwo041
     * @tc.desc Verify fill(99, 5) start range; expect 1/2/5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(2);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_4200
     * @tc.name testInt16ArrayFillTestTwo042
     * @tc.desc Verify fill(99, 6) start range; expect 1/5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 6);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(4);
      expect(actual2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_4300
     * @tc.name testInt16ArrayFillTestTwo043
     * @tc.desc Verify fill(99, 100) start range; expect 1/3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(99, 100);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_4400
     * @tc.name testInt16ArrayFillTestTwo044
     * @tc.desc Verify fill(99, -6) negative index; start range; expect 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, -6);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_4500
     * @tc.name testInt16ArrayFillTestTwo045
     * @tc.desc Verify fill(88, 0) chained fill; start range; expect arr2.$_get(0)/arr2.$_get(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int16Array = Int16Array.of(1, 2, 3);
      let arr2: Int16Array = Int16Array.of(1, 2, 3);
      arr1.fill(88, 0);
      arr2.fill(88);
      let actual1: number = arr1.$_get(0);
      let expected1: number = arr2.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr1.$_get(2);
      let expected2: number = arr2.$_get(2);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_4600
     * @tc.name testInt16ArrayFillTestTwo046
     * @tc.desc Verify fill(99, 0, 1) start/end range; expect 99/2/3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 0, 1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(2);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_4700
     * @tc.name testInt16ArrayFillTestTwo047
     * @tc.desc Verify fill(99, 0, 4) start/end range; expect 99/5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 0, 4);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_4800
     * @tc.name testInt16ArrayFillTestTwo048
     * @tc.desc Verify fill(99, 0, 5) start/end range; expect 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 0, 5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(4);
      expect(actual2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_4900
     * @tc.name testInt16ArrayFillTestTwo049
     * @tc.desc Verify fill(77, 1, e) start/end range; expect 1/77/4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let e: int = 3;
      arr.fill(77, 1, e);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(77);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(77);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_5000
     * @tc.name testInt16ArrayFillTestTwo050
     * @tc.desc Verify fill(99, 0, -1) negative index; start/end range; expect 99/5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 0, -1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_5100
     * @tc.name testInt16ArrayFillTestTwo051
     * @tc.desc Verify fill(99, 0, -2) negative index; start/end range; expect 99/4/5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 0, -2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(4);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_5200
     * @tc.name testInt16ArrayFillTestTwo052
     * @tc.desc Verify fill(99, 1, -5) negative index; start/end range; expect 1/2/5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 1, -5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(2);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_5300
     * @tc.name testInt16ArrayFillTestTwo053
     * @tc.desc Verify fill(99, 2, 6) start/end range; expect 1/2/99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 2, 6);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(2);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_5400
     * @tc.name testInt16ArrayFillTestTwo054
     * @tc.desc Verify fill(99, 1, 100) start/end range; expect 1/99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 1, 100);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_5500
     * @tc.name testInt16ArrayFillTestTwo055
     * @tc.desc Verify fill(99, 0, -6) negative index; start/end range; expect 1/2/5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 0, -6);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(2);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_5600
     * @tc.name testInt16ArrayFillTestTwo056
     * @tc.desc Verify fill(99, 2, 2) start/end range; expect 1/3/5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 2, 2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(3);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_5700
     * @tc.name testInt16ArrayFillTestTwo057
     * @tc.desc Verify fill(99, 3, 1) start/end range; expect 1/4/5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 3, 1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(4);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_5800
     * @tc.name testInt16ArrayFillTestTwo058
     * @tc.desc Verify fill(99, -1, -2) negative index; start/end range; expect 1/4/5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, -1, -2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(4);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_5900
     * @tc.name testInt16ArrayFillTestTwo059
     * @tc.desc Verify fill(99, 0, 0) start/end range; expect 1/5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 0, 0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(4);
      expect(actual2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_6000
     * @tc.name testInt16ArrayFillTestTwo060
     * @tc.desc Verify fill(99, -1, 0) negative index; start/end range; expect 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, -1, 0);
      let actual1: number = arr.$_get(4);
      expect(actual1).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_6100
     * @tc.name testInt16ArrayFillTestTwo061
     * @tc.desc Verify fill(99, -4, -2) negative index; start/end range; expect 1/2/99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
      arr.fill(99, -4, -2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(2);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(99);
      let actual5: number = arr.$_get(4);
      expect(actual5).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_6200
     * @tc.name testInt16ArrayFillTestTwo062
     * @tc.desc Verify fill(99, 0) empty array; start range; expect 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      arr.fill(99, 0);
      let actual1: int = arr.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_6300
     * @tc.name testInt16ArrayFillTestTwo063
     * @tc.desc Verify fill(99, 0, 1) start/end range; expect 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(42);
      arr.fill(99, 0, 1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_6400
     * @tc.name testInt16ArrayFillTestTwo064
     * @tc.desc Verify fill(99, 0, 0) start/end range; expect 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(42);
      arr.fill(99, 0, 0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_6500
     * @tc.name testInt16ArrayFillTestTwo065
     * @tc.desc Verify fill(99, -1) negative index; start range; expect 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(42);
      arr.fill(99, -1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_6600
     * @tc.name testInt16ArrayFillTestTwo066
     * @tc.desc Verify fill(99) returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: Int16Array = arr.fill(99);
      let actual1: boolean = result === arr;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_6700
     * @tc.name testInt16ArrayFillTestTwo067
     * @tc.desc Verify fill(88, 0, 2) start/end range; expect 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let returned: Int16Array = arr.fill(88, 0, 2);
      returned.$_set(0, 77);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_6800
     * @tc.name testInt16ArrayFillTestTwo068
     * @tc.desc Verify fill(99, 0, 2).reverse() chain reverse; start/end range; expect 4/3/99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
      arr.fill(99, 0, 2).reverse();
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(4);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(3);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_6900
     * @tc.name testInt16ArrayFillTestTwo069
     * @tc.desc Verify fill(1, 0, 2).fill(2, 3, 5) chained fill; start/end range; expect 1/0/2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      arr.fill(1, 0, 2).fill(2, 3, 5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(1);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(0);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(2);
      let actual5: number = arr.$_get(4);
      expect(actual5).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_7000
     * @tc.name testInt16ArrayFillTestTwo070
     * @tc.desc Verify fill(0, 1, 4) start/end range; expect 1/0/5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let ret: Int16Array = arr.fill(0, 1, 4);
      let actual1: number = ret.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = ret.$_get(1);
      expect(actual2).assertEqual(0);
      let actual3: number = ret.$_get(3);
      expect(actual3).assertEqual(0);
      let actual4: number = ret.$_get(4);
      expect(actual4).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_7100
     * @tc.name testInt16ArrayFillTestTwo071
     * @tc.desc Verify fill(10, 0, 1) chained fill; returns this; start/end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let ret1: Int16Array = arr.fill(10, 0, 1);
      let ret2: Int16Array = ret1.fill(20, 1, 2);
      let ret3: Int16Array = ret2.fill(30, 2, 3);
      let actual1: boolean = ret3 === arr;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_7200
     * @tc.name testInt16ArrayFillTestTwo072
     * @tc.desc Verify fill(32768) int16 wrap/overflow; buffer shared view; expect -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int16Array = new Int16Array(buf);
      arr.fill(32768);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_7300
     * @tc.name testInt16ArrayFillTestTwo073
     * @tc.desc Verify fill(32768, 1, 3) int16 wrap/overflow; start/end range; expect 10/-32768/40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      arr.fill(32768, 1, 3);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-32768);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(-32768);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_7400
     * @tc.name testInt16ArrayFillTestTwo074
     * @tc.desc Verify fill(Number.NaN, 1, 2) NaN truncates to 0; start/end range; expect 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 1, 1);
      arr.fill(Number.NaN, 1, 2);
      let actual1: number = arr.$_get(1);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_7500
     * @tc.name testInt16ArrayFillTestTwo075
     * @tc.desc Verify fill(Number.POSITIVE_INFINITY, 0, 1) Infinity truncates to 0; start/end range; expect 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 1, 1);
      arr.fill(Number.POSITIVE_INFINITY, 0, 1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_7600
     * @tc.name testInt16ArrayFillTestTwo076
     * @tc.desc Verify fill(3.7) float truncation; chained fill; expect arr2.$_get(0)/arr2.$_get(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int16Array = Int16Array.of(0, 0);
      let arr2: Int16Array = Int16Array.of(0, 0);
      arr1.fill(3.7);
      arr2.fill(3);
      let actual1: number = arr1.$_get(0);
      let expected1: number = arr2.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr1.$_get(1);
      let expected2: number = arr2.$_get(1);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_7700
     * @tc.name testInt16ArrayFillTestTwo077
     * @tc.desc Verify fill(16, 1, 4) start/end range; expect 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      arr.fill(16, 1, 4);
      let sliced: Int16Array = arr.slice(1, 4);
      let actual1: number = sliced.$_get(0);
      expect(actual1).assertEqual(16);
      let actual2: number = sliced.$_get(2);
      expect(actual2).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_7800
     * @tc.name testInt16ArrayFillTestTwo078
     * @tc.desc Verify fill(25, 1, 3) then sort(); expect sorted 20/25/25/40/50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 10, 30, 20, 40);
      arr.fill(25, 1, 3);
      arr.sort();
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(20);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(25);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(25);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(40);
      let actual5: number = arr.$_get(4);
      expect(actual5).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_TWO_7900
     * @tc.name testInt16ArrayFillTestTwo079
     * @tc.desc Verify fill(99, 2, 4) start/end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 2, 4);
      let count: int = 0;
      arr.forEach((v: number, i: int) => {
        if (i >= 2 && i < 4) {
          expect(v).assertEqual(99);
        }
        count++;
      });
      expect(count).assertEqual(5);
    });
  });
}
