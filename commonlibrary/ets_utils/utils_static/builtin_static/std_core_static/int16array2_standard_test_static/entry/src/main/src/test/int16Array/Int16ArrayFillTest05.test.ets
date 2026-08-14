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

export default function int16ArrayFillTestFiveTest(): void {
  describe('Int16ArrayFillTestFiveTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0010
     * @tc.name testInt16ArrayFillTestFive001
     * @tc.desc Verify fill with one number argument fills all 6 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60);
      arr.fill(42);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(42);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(42);
      let actual3: number = arr.$_get(5);
      expect(actual3).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0020
     * @tc.name testInt16ArrayFillTestFive002
     * @tc.desc Verify fill with value and start fills from start to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55, 66);
      arr.fill(88, 3);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(11);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(33);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(88);
      let actual4: number = arr.$_get(5);
      expect(actual4).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0030
     * @tc.name testInt16ArrayFillTestFive003
     * @tc.desc Verify fill with value start and end fills specified range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15, 20, 25, 30, 35);
      arr.fill(50, 2, 5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(5);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(10);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(50);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(50);
      let actual5: number = arr.$_get(5);
      expect(actual5).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0040
     * @tc.name testInt16ArrayFillTestFive004
     * @tc.desc Verify fill value 32769 overflows int16 and stores -32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(32769);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32767);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(-32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0050
     * @tc.name testInt16ArrayFillTestFive005
     * @tc.desc Verify fill value 65537 truncates low 16 bits to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      arr.fill(65537);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0060
     * @tc.name testInt16ArrayFillTestFive006
     * @tc.desc Verify fill value 0x10001 truncates low 16 bits to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(9, 9);
      arr.fill(0x10001);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0070
     * @tc.name testInt16ArrayFillTestFive007
     * @tc.desc Verify fill value -32770 underflows int16 and stores 32766
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(-32770);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(32766);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(32766);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0080
     * @tc.name testInt16ArrayFillTestFive008
     * @tc.desc Verify fill value 0xFFFF truncates to int16 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 100);
      arr.fill(0xffff);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0090
     * @tc.name testInt16ArrayFillTestFive009
     * @tc.desc Verify fill value 131071 truncates low 16 bits to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(131071);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-1);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0100
     * @tc.name testInt16ArrayFillTestFive010
     * @tc.desc Verify fill value 196608 wraps three times and stores 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(99, 99, 99);
      arr.fill(196608);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0110
     * @tc.name testInt16ArrayFillTestFive011
     * @tc.desc Verify fill value from Number 32767+1 overflows to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      let overflow: number = 32767 + 1;
      arr.fill(overflow);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0120
     * @tc.name testInt16ArrayFillTestFive012
     * @tc.desc Verify fill value expression 32767*2 truncates to -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      arr.fill(32767 * 2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-2);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0130
     * @tc.name testInt16ArrayFillTestFive013
     * @tc.desc Verify fill value 163840 wraps and stores -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      arr.fill(163840);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0140
     * @tc.name testInt16ArrayFillTestFive014
     * @tc.desc Verify fill with Number.MAX_SAFE_INTEGER wraps consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      let huge: number = 9007199254740991;
      arr.fill(huge);
      let firstResult: number = arr.$_get(0);
      let secondResult: number = arr.$_get(1);
      expect(firstResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0150
     * @tc.name testInt16ArrayFillTestFive015
     * @tc.desc Verify fill value 1000000 wraps and stores same truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      arr.fill(1000000);
      let firstValue: number = arr.$_get(0);
      let secondValue: number = arr.$_get(1);
      expect(firstValue).assertEqual(secondValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0160
     * @tc.name testInt16ArrayFillTestFive016
     * @tc.desc Verify fill value -1000000 wraps and stores same truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      arr.fill(-1000000);
      let result: number = arr.$_get(0);
      let actual1: number = arr.$_get(1);
      let expected1: number = result;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0170
     * @tc.name testInt16ArrayFillTestFive017
     * @tc.desc Verify fill value 2147483647 wraps consistently across elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let val: number = 2147483647;
      arr.fill(val);
      let actual1: number = arr.$_get(0);
      let expected1: number = arr.$_get(1);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = arr.$_get(0);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0180
     * @tc.name testInt16ArrayFillTestFive018
     * @tc.desc Verify fill value 262144 wraps four times and stores 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(77, 77);
      arr.fill(262144);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0190
     * @tc.name testInt16ArrayFillTestFive019
     * @tc.desc Verify fill with 0/0 NaN converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 50, 50);
      let nanVal: number = 0.0 / 0.0;
      arr.fill(nanVal);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0200
     * @tc.name testInt16ArrayFillTestFive020
     * @tc.desc Verify fill with Math.sqrt(-1) NaN converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(Math.sqrt(-1));
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0210
     * @tc.name testInt16ArrayFillTestFive021
     * @tc.desc Verify fill with 1/0 positive Infinity converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(99, 99);
      let posInf: number = 1.0 / 0.0;
      arr.fill(posInf);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0220
     * @tc.name testInt16ArrayFillTestFive022
     * @tc.desc Verify fill with -1/0 negative Infinity converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(88, 88);
      let negInf: number = -1.0 / 0.0;
      arr.fill(negInf);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0230
     * @tc.name testInt16ArrayFillTestFive023
     * @tc.desc Verify fill with NaN then every reports all elements are 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      arr.fill(Number.NaN);
      let allZero: boolean = arr.every((v: number): boolean => v === 0);
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0240
     * @tc.name testInt16ArrayFillTestFive024
     * @tc.desc Verify fill with Infinity then some finds no non-zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 5, 5);
      arr.fill(Number.POSITIVE_INFINITY);
      let hasNonZero: boolean = arr.some((v: number): boolean => v !== 0);
      expect(hasNonZero).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0250
     * @tc.name testInt16ArrayFillTestFive025
     * @tc.desc Verify fill with -0 stores positive 0 on read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 7);
      arr.fill(-0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0260
     * @tc.name testInt16ArrayFillTestFive026
     * @tc.desc Verify fill with -0 equals fill with +0 elementwise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrNeg: Int16Array = Int16Array.of(3, 3, 3);
      let arrPos: Int16Array = Int16Array.of(3, 3, 3);
      arrNeg.fill(-0);
      arrPos.fill(0);
      let actual1: number = arrNeg.$_get(0);
      let expected1: number = arrPos.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arrNeg.$_get(1);
      let expected2: number = arrPos.$_get(1);
      expect(actual2).assertEqual(expected2);
      let actual3: number = arrNeg.$_get(2);
      let expected3: number = arrPos.$_get(2);
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0270
     * @tc.name testInt16ArrayFillTestFive027
     * @tc.desc Verify fill range with -0 equals fill range with +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let arr2: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr1.fill(-0, 1, 4);
      arr2.fill(0, 1, 4);
      let actual1: number = arr1.$_get(1);
      let expected1: number = arr2.$_get(1);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr1.$_get(3);
      let expected2: number = arr2.$_get(3);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0280
     * @tc.name testInt16ArrayFillTestFive028
     * @tc.desc Verify fill value 32767.9 truncates to max 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      arr.fill(32767.9);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0290
     * @tc.name testInt16ArrayFillTestFive029
     * @tc.desc Verify fill value 32768.9 truncates then overflows to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      arr.fill(32768.9);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0300
     * @tc.name testInt16ArrayFillTestFive030
     * @tc.desc Verify fill value -32768.9 truncates to min -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      arr.fill(-32768.9);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0310
     * @tc.name testInt16ArrayFillTestFive031
     * @tc.desc Verify fill value -32769.1 truncates then overflows to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      arr.fill(-32769.1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0320
     * @tc.name testInt16ArrayFillTestFive032
     * @tc.desc Verify fill value 1.5 truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(9, 9);
      arr.fill(1.5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0330
     * @tc.name testInt16ArrayFillTestFive033
     * @tc.desc Verify fill value -1.5 truncates to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(9, 9);
      arr.fill(-1.5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0340
     * @tc.name testInt16ArrayFillTestFive034
     * @tc.desc Verify fill start from int variable 2 fills to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55, 66);
      let offset: int = 2;
      arr.fill(88, offset);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(11);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(22);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(88);
      let actual4: number = arr.$_get(5);
      expect(actual4).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0350
     * @tc.name testInt16ArrayFillTestFive035
     * @tc.desc Verify fill start from length/2 fills second half
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60, 70, 80);
      let mid: int = arr.length / 2;
      arr.fill(99, mid);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(40);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(7);
      expect(actual4).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0360
     * @tc.name testInt16ArrayFillTestFive036
     * @tc.desc Verify fill start from indexOf result fills from match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let pos: int = arr.indexOf(30);
      arr.fill(77, pos);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(77);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0370
     * @tc.name testInt16ArrayFillTestFive037
     * @tc.desc Verify fill start from lastIndexOf result fills from last match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 5, 10, 5);
      let lastPos: int = arr.lastIndexOf(10);
      arr.fill(0, lastPos);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(5);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(5);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(0);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0380
     * @tc.name testInt16ArrayFillTestFive038
     * @tc.desc Verify fill start Int.MAX_VALUE clamps with no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(99, 2147483647);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0390
     * @tc.name testInt16ArrayFillTestFive039
     * @tc.desc Verify fill start Int.MIN_VALUE clamps to 0 and fills all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(88, -2147483648);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(88);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0400
     * @tc.name testInt16ArrayFillTestFive040
     * @tc.desc Verify fill start length-2 fills last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
      let tailStart: int = arr.length - 2;
      arr.fill(55, tailStart);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(4);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(55);
      let actual4: number = arr.$_get(5);
      expect(actual4).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0410
     * @tc.name testInt16ArrayFillTestFive041
     * @tc.desc Verify fill end int variable 4 excludes index 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
      let stop: int = 4;
      arr.fill(88, 1, stop);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(88);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(88);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0420
     * @tc.name testInt16ArrayFillTestFive042
     * @tc.desc Verify fill end length-1 fills before last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let lastIdx: int = arr.length - 1;
      arr.fill(99, 1, lastIdx);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(99);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0430
     * @tc.name testInt16ArrayFillTestFive043
     * @tc.desc Verify fill end start+3 dynamically ends after three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0, 0, 0);
      let s: int = 1;
      arr.fill(55, s, s + 3);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(55);
      let actual3: number = arr.$_get(3);
      expect(actual3).assertEqual(55);
      let actual4: number = arr.$_get(4);
      expect(actual4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0440
     * @tc.name testInt16ArrayFillTestFive044
     * @tc.desc Verify fill end Int.MAX_VALUE clamps to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 2, 2147483647);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0450
     * @tc.name testInt16ArrayFillTestFive045
     * @tc.desc Verify fill start -3 end -1 fills last two before end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60, 70);
      arr.fill(99, -3, -1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(40);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(5);
      expect(actual4).assertEqual(99);
      let actual5: number = arr.$_get(6);
      expect(actual5).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0460
     * @tc.name testInt16ArrayFillTestFive046
     * @tc.desc Verify fill start -1 end length fills last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
      arr.fill(88, -1, 5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(11);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(44);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0470
     * @tc.name testInt16ArrayFillTestFive047
     * @tc.desc Verify fill(99, 0, -4) end clamps to 1; fills index 0; expect 99/5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, 0, -4);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(4);
      expect(actual2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0480
     * @tc.name testInt16ArrayFillTestFive048
     * @tc.desc Verify fill start -5 end -4 fills only index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60, 70);
      arr.fill(99, -5, -4);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(99);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0490
     * @tc.name testInt16ArrayFillTestFive049
     * @tc.desc Verify fill tiny negative start and end clamps to 0 with no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(77, -100, -200);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(4);
      expect(actual2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0500
     * @tc.name testInt16ArrayFillTestFive050
     * @tc.desc Verify fill huge start and end clamp to length with no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.fill(99, 999, 1000);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0510
     * @tc.name testInt16ArrayFillTestFive051
     * @tc.desc Verify fill start -2 end 0 resolves start greater than end with no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, -2, 0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(4);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0520
     * @tc.name testInt16ArrayFillTestFive052
     * @tc.desc Verify fill start -1 end -5 resolves start greater than end with no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(99, -1, -5);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(4);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0530
     * @tc.name testInt16ArrayFillTestFive053
     * @tc.desc Verify fill start 0 end 0 equals empty range with no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      arr.fill(55, 0, 0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0540
     * @tc.name testInt16ArrayFillTestFive054
     * @tc.desc Verify fill start 2 end 2 equals empty range with no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      arr.fill(88, 2, 2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(30);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0550
     * @tc.name testInt16ArrayFillTestFive055
     * @tc.desc Verify fill single-element array start 0 end 1 fills only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(123);
      arr.fill(456, 0, 1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0560
     * @tc.name testInt16ArrayFillTestFive056
     * @tc.desc Verify fill single-element array start 0 end 0 leaves value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(99);
      arr.fill(0, 0, 0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0570
     * @tc.name testInt16ArrayFillTestFive057
     * @tc.desc Verify fill single-element array start -1 fills only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(77);
      arr.fill(33, -1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0580
     * @tc.name testInt16ArrayFillTestFive058
     * @tc.desc Verify fill empty array length 0 with start 0 end 0 does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      arr.fill(99, 0, 0);
      let actual1: int = arr.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0590
     * @tc.name testInt16ArrayFillTestFive059
     * @tc.desc Verify fill returns this reference strictly equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 8, 9);
      let ret: Int16Array = arr.fill(55);
      let actual1: boolean = ret === arr;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0600
     * @tc.name testInt16ArrayFillTestFive060
     * @tc.desc Verify fill partial range returns same array with updated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
      let returned: Int16Array = arr.fill(99, 2, 5);
      let actual1: number = returned.$_get(2);
      expect(actual1).assertEqual(99);
      let actual2: number = returned.$_get(4);
      expect(actual2).assertEqual(99);
      let actual3: boolean = returned === arr;
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0610
     * @tc.name testInt16ArrayFillTestFive061
     * @tc.desc Verify fill chained with copyWithin fills then copies region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      arr.fill(1, 0, 2).copyWithin(2, 0, 2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(1);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(1);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(1);
      let actual5: number = arr.$_get(4);
      expect(actual5).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0620
     * @tc.name testInt16ArrayFillTestFive062
     * @tc.desc Verify fill chained with reverse fills then reverses array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(0, 0, 2).reverse();
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(5);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(4);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(3);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(0);
      let actual5: number = arr.$_get(4);
      expect(actual5).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0630
     * @tc.name testInt16ArrayFillTestFive063
     * @tc.desc Verify fill chained with sort fills then sorts array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 40, 30, 20, 10);
      arr.fill(25, 0, 2).sort();
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(25);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(25);
      let actual5: number = arr.$_get(4);
      expect(actual5).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0640
     * @tc.name testInt16ArrayFillTestFive064
     * @tc.desc Verify three chained fill calls all return same array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      let r1: Int16Array = arr.fill(10, 0, 1);
      let r2: Int16Array = r1.fill(20, 1, 2);
      let r3: Int16Array = r2.fill(30, 2, 3);
      let actual1: boolean = r3 === arr;
      expect(actual1).assertTrue();
      let actual2: number = arr.$_get(0);
      expect(actual2).assertEqual(10);
      let actual3: number = arr.$_get(1);
      expect(actual3).assertEqual(20);
      let actual4: number = arr.$_get(2);
      expect(actual4).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0650
     * @tc.name testInt16ArrayFillTestFive065
     * @tc.desc Verify fill keeps length and byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let origLen: int = arr.length;
      let origByteLen: int = arr.byteLength;
      arr.fill(123);
      let actual1: int = arr.length;
      let expected1: number = origLen;
      expect(actual1).assertEqual(expected1);
      let actual2: int = arr.byteLength;
      let expected2: number = origByteLen;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0660
     * @tc.name testInt16ArrayFillTestFive066
     * @tc.desc Verify fill on ArrayBuffer view returns this with correct binding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int16Array = new Int16Array(buf, 2, 4);
      let returned: Int16Array = arr.fill(42);
      let actual1: int = returned.byteOffset;
      expect(actual1).assertEqual(2);
      let actual2: int = returned.length;
      expect(actual2).assertEqual(4);
      let actual3: boolean = returned === arr;
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0670
     * @tc.name testInt16ArrayFillTestFive067
     * @tc.desc Verify fill 32768 byte layout via Int8Array low 0 high -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int16Array = new Int16Array(buf);
      arr.fill(32768);
      let bytes: Int8Array = new Int8Array(buf);
      let actual1: number = bytes.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = bytes.$_get(1);
      expect(actual2).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0680
     * @tc.name testInt16ArrayFillTestFive068
     * @tc.desc Verify fill -1 byte layout via Int8Array both bytes -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int16Array = new Int16Array(buf);
      arr.fill(-1);
      let bytes: Int8Array = new Int8Array(buf);
      let actual1: number = bytes.$_get(0);
      expect(actual1).assertEqual(-1);
      let actual2: number = bytes.$_get(1);
      expect(actual2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0690
     * @tc.name testInt16ArrayFillTestFive069
     * @tc.desc Verify fill 32767 byte layout via Int8Array low -1 high 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int16Array = new Int16Array(buf);
      arr.fill(32767);
      let bytes: Int8Array = new Int8Array(buf);
      let actual1: number = bytes.$_get(0);
      expect(actual1).assertEqual(-1);
      let actual2: number = bytes.$_get(1);
      expect(actual2).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0700
     * @tc.name testInt16ArrayFillTestFive070
     * @tc.desc Verify fill -32768 byte layout via Int8Array low 0 high -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int16Array = new Int16Array(buf);
      arr.fill(-32768);
      let bytes: Int8Array = new Int8Array(buf);
      let actual1: number = bytes.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = bytes.$_get(1);
      expect(actual2).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0710
     * @tc.name testInt16ArrayFillTestFive071
     * @tc.desc Verify fill truncated values remain truncated after slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      arr.fill(32768, 0, 3);
      let sliced: Int16Array = arr.slice(0, 3);
      let actual1: number = sliced.$_get(0);
      expect(actual1).assertEqual(-32768);
      let actual2: number = sliced.$_get(1);
      expect(actual2).assertEqual(-32768);
      let actual3: number = sliced.$_get(2);
      expect(actual3).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0720
     * @tc.name testInt16ArrayFillTestFive072
     * @tc.desc Verify fill truncated values remain truncated via subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      arr.fill(-32769, 1, 4);
      let sub: Int16Array = arr.subarray(1, 4);
      let actual1: number = sub.$_get(0);
      expect(actual1).assertEqual(32767);
      let actual2: number = sub.$_get(1);
      expect(actual2).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0730
     * @tc.name testInt16ArrayFillTestFive073
     * @tc.desc Verify fill NaN yields 0 after slice copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 1, 1);
      arr.fill(Number.NaN);
      let copied: Int16Array = arr.slice();
      let actual1: number = copied.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = copied.$_get(2);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0740
     * @tc.name testInt16ArrayFillTestFive074
     * @tc.desc Verify fill Infinity then with replaces element without residue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(Number.POSITIVE_INFINITY);
      let replaced: Int16Array = arr.with(1, 99);
      let actual1: number = replaced.$_get(1);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0750
     * @tc.name testInt16ArrayFillTestFive075
     * @tc.desc Verify fill on empty Int16Array returns this without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let ret: Int16Array = arr.fill(99);
      let actual1: int = ret.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0760
     * @tc.name testInt16ArrayFillTestFive076
     * @tc.desc Verify fill start far beyond length leaves array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.fill(99, 9999);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0770
     * @tc.name testInt16ArrayFillTestFive077
     * @tc.desc Verify fill end far beyond length clamps silently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(99, 0, 99999);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(99);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0780
     * @tc.name testInt16ArrayFillTestFive078
     * @tc.desc Verify fill start large negative clamps to 0 and fills
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(55, -2147483647);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(55);
      let actual2: number = arr.$_get(4);
      expect(actual2).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0790
     * @tc.name testInt16ArrayFillTestFive079
     * @tc.desc Verify fill on one Int16Array view is visible on another shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let view1: Int16Array = new Int16Array(buf, 0, 5);
      let view2: Int16Array = new Int16Array(buf, 0, 5);
      view1.fill(99, 1, 3);
      let actual1: number = view2.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = view2.$_get(1);
      expect(actual2).assertEqual(99);
      let actual3: number = view2.$_get(2);
      expect(actual3).assertEqual(99);
      let actual4: number = view2.$_get(3);
      expect(actual4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0800
     * @tc.name testInt16ArrayFillTestFive080
     * @tc.desc Verify fill -1 readable as 65535 through Uint16Array view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr16: Int16Array = new Int16Array(buf);
      arr16.fill(-1);
      let arrU16: Uint16Array = new Uint16Array(buf);
      let actual1: number = arrU16.$_get(0);
      expect(actual1).assertEqual(65535);
      let actual2: number = arrU16.$_get(1);
      expect(actual2).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0810
     * @tc.name testInt16ArrayFillTestFive081
     * @tc.desc Verify fill on subarray updates parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      let sub: Int16Array = parent.subarray(2, 5);
      sub.fill(88);
      let actual1: number = parent.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = parent.$_get(1);
      expect(actual2).assertEqual(0);
      let actual3: number = parent.$_get(2);
      expect(actual3).assertEqual(88);
      let actual4: number = parent.$_get(4);
      expect(actual4).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0820
     * @tc.name testInt16ArrayFillTestFive082
     * @tc.desc Verify fill on parent is visible through subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = parent.subarray(1, 4);
      parent.fill(77, 2, 5);
      let actual1: number = sub.$_get(1);
      expect(actual1).assertEqual(77);
      let actual2: number = sub.$_get(2);
      expect(actual2).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0830
     * @tc.name testInt16ArrayFillTestFive083
     * @tc.desc Verify fill 32768 readable as 32768 through Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int16Array = new Int16Array(buf);
      arr.fill(32768);
      let arrU16: Uint16Array = new Uint16Array(buf);
      let actual1: number = arrU16.$_get(0);
      expect(actual1).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0840
     * @tc.name testInt16ArrayFillTestFive084
     * @tc.desc Verify fill then manual merge via set contains filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(5, 0, 2);
      let tail: Int16Array = Int16Array.of(1, 1);
      let merged: Int16Array = new Int16Array(arr.length + tail.length);
      merged.set(arr, 0);
      merged.set(tail, arr.length);
      let actual1: number = merged.$_get(0);
      expect(actual1).assertEqual(5);
      let actual2: number = merged.$_get(1);
      expect(actual2).assertEqual(5);
      let actual3: number = merged.$_get(2);
      expect(actual3).assertEqual(0);
      let actual4: number = merged.$_get(3);
      expect(actual4).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0850
     * @tc.name testInt16ArrayFillTestFive085
     * @tc.desc Verify fill then join string reflects filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(0, 2, 4);
      let str: string = arr.join(',');
      let actual1: int = str.length;
      expect(actual1).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0860
     * @tc.name testInt16ArrayFillTestFive086
     * @tc.desc Verify fill then forEach counts filled and unfilled regions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
      arr.fill(99, 1, 5);
      let filledCount: int = 0;
      arr.forEach((v: number): void => {
        if (v === 99) {
          filledCount++;
        }
      });
      expect(filledCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0870
     * @tc.name testInt16ArrayFillTestFive087
     * @tc.desc Verify fill then entries iterator yields filled indices and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.fill(55, 0, 2);
      let checkPass: boolean = true;
      let iterator: IterableIterator<[int, number]> = arr.entries();
      let nextItem: IteratorResult<[int, number]> = iterator.next();
      while (!nextItem.done) {
        let pair: [int, number] = nextItem.value as [int, number];
        let idx: int = pair[0];
        let val: number = pair[1];
        if (idx < 2 && val !== 55) {
          checkPass = false;
        }
        nextItem = iterator.next();
      }
      expect(checkPass).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0880
     * @tc.name testInt16ArrayFillTestFive088
     * @tc.desc Verify fill then indexOf returns first filled index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      arr.fill(99, 2, 4);
      let pos: int = arr.indexOf(99);
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0890
     * @tc.name testInt16ArrayFillTestFive089
     * @tc.desc Verify fill then lastIndexOf returns last filled index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(88, 0, 3);
      let lastPos: int = arr.lastIndexOf(88);
      expect(lastPos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0900
     * @tc.name testInt16ArrayFillTestFive090
     * @tc.desc Verify fill then includes returns true for filled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(77, 0, 1);
      let found: boolean = arr.includes(77);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0910
     * @tc.name testInt16ArrayFillTestFive091
     * @tc.desc Verify fill then set covers part of filled region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      let src: Int16Array = Int16Array.of(8, 8);
      arr.fill(5);
      arr.set(src, 1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(5);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(8);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(8);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0920
     * @tc.name testInt16ArrayFillTestFive092
     * @tc.desc Verify fill then map creates new array without mutating source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.fill(5, 1, 3);
      let mapped: Int16Array = arr.map((v: number): number => v * 2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = mapped.$_get(0);
      expect(actual2).assertEqual(20);
      let actual3: number = mapped.$_get(1);
      expect(actual3).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0930
     * @tc.name testInt16ArrayFillTestFive093
     * @tc.desc Verify fill then filter selects filled values with correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      arr.fill(99, 0, 3);
      let filtered: Int16Array = arr.filter((v: number): boolean => v === 99);
      let actual1: int = filtered.length;
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0940
     * @tc.name testInt16ArrayFillTestFive094
     * @tc.desc Verify fill then reduce sums filled range correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      arr.fill(2, 1, 4);
      let sum: number = arr.reduce((acc: number, v: number): number => acc + v);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0950
     * @tc.name testInt16ArrayFillTestFive095
     * @tc.desc Verify fill then find returns first filled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(42, 1, 3);
      let found: number | undefined = arr.find((v: number): boolean => v === 42);
      let actual2: boolean = found !== undefined;
      expect(actual2).assertTrue();
      let actual1: number = found as number;
      expect(actual1).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0960
     * @tc.name testInt16ArrayFillTestFive096
     * @tc.desc Verify fill then findIndex returns first filled index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0);
      arr.fill(33, 1, 3);
      let idx: int = arr.findIndex((v: number): boolean => v === 33);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0970
     * @tc.name testInt16ArrayFillTestFive097
     * @tc.desc Verify fill 0 then every reports all zeros true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(0);
      let allZeros: boolean = arr.every((v: number): boolean => v === 0);
      expect(allZeros).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0980
     * @tc.name testInt16ArrayFillTestFive098
     * @tc.desc Verify fill non-zero then some reports non-zero true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      arr.fill(5, 1, 2);
      let hasNonZero: boolean = arr.some((v: number): boolean => v !== 0);
      expect(hasNonZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_0990
     * @tc.name testInt16ArrayFillTestFive099
     * @tc.desc Verify multiple fill ranges on long array stay independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      arr.fill(1, 0, 3);
      arr.fill(2, 3, 6);
      arr.fill(3, 6, 9);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(3);
      expect(actual2).assertEqual(2);
      let actual3: number = arr.$_get(5);
      expect(actual3).assertEqual(2);
      let actual4: number = arr.$_get(6);
      expect(actual4).assertEqual(3);
      let actual5: number = arr.$_get(8);
      expect(actual5).assertEqual(3);
      let actual6: number = arr.$_get(9);
      expect(actual6).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_1000
     * @tc.name testInt16ArrayFillTestFive100
     * @tc.desc Verify full fill then slice copy matches filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(128);
      let copy: Int16Array = arr.slice();
      let actual1: number = copy.$_get(0);
      expect(actual1).assertEqual(128);
      let actual2: number = copy.$_get(2);
      expect(actual2).assertEqual(128);
      let actual3: number = copy.$_get(4);
      expect(actual3).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_1010
     * @tc.name testInt16ArrayFillTestFive101
     * @tc.desc Verify fill(0).reverse().fill(9, 0, 2) chain; expect 9/9/0/0/0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(0).reverse().fill(9, 0, 2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(9);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(9);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(0);
      let actual4: number = arr.$_get(3);
      expect(actual4).assertEqual(0);
      let actual5: number = arr.$_get(4);
      expect(actual5).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_1020
     * @tc.name testInt16ArrayFillTestFive102
     * @tc.desc Verify fill then toSorted returns new array while original keeps fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 3, 1, 4, 2);
      arr.fill(0, 0, 2);
      let sorted: Int16Array = arr.toSorted();
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(0);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_FIVE_1030
     * @tc.name testInt16ArrayFillTestFive103
     * @tc.desc Verify fill then toReversed returns new array while original keeps fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestFive103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
      arr.fill(9, 0, 2);
      let reversed: Int16Array = arr.toReversed();
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(9);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(9);
    });
  });
}
