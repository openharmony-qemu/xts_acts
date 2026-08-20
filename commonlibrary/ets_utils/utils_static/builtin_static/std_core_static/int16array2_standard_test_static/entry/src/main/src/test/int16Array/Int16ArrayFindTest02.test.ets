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

export default function int16ArrayFindTestTwoTest(): void {
  describe('Int16ArrayFindTestTwoTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_0100
     * @tc.name testInt16ArrayFindTestTwo001
     * @tc.desc Verify find no match returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 100);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_0200
     * @tc.name testInt16ArrayFindTestTwo002
     * @tc.desc Verify find match is not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 15, 25);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 10);
      let actual1: boolean = result === undefined;
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_0300
     * @tc.name testInt16ArrayFindTestTwo003
     * @tc.desc Verify find(2) returns matched value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_0400
     * @tc.name testInt16ArrayFindTestTwo004
     * @tc.desc Verify find match returns finite number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 200, 300);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 150);
      let actual1: boolean = isFinite(result as number);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_0500
     * @tc.name testInt16ArrayFindTestTwo005
     * @tc.desc Verify find on empty array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_0600
     * @tc.name testInt16ArrayFindTestTwo006
     * @tc.desc Verify find always-true predicate returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(42, 99, 7);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => true);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_0700
     * @tc.name testInt16ArrayFindTestTwo007
     * @tc.desc Verify find returns first element greater than threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 8, 2, 9, 1);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 5);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_0800
     * @tc.name testInt16ArrayFindTestTwo008
     * @tc.desc Verify find returns first element greater or equal threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(4, 5, 6, 7);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value >= 5);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_0900
     * @tc.name testInt16ArrayFindTestTwo009
     * @tc.desc Verify find returns first element less than threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 8, 3, 15);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value < 9);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_1000
     * @tc.name testInt16ArrayFindTestTwo010
     * @tc.desc Verify find returns first element less or equal threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(20, 15, 10, 5);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value <= 15);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_1100
     * @tc.name testInt16ArrayFindTestTwo011
     * @tc.desc Verify find returns first element not equal skip value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 7, 3, 7, 5);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value !== 7);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_1200
     * @tc.name testInt16ArrayFindTestTwo012
     * @tc.desc Verify find returns expected matched value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-3, 0, 3);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_1300
     * @tc.name testInt16ArrayFindTestTwo013
     * @tc.desc Verify find returns expected matched value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(2, -1, 4, -1, 6);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value === -1,
      );
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_1400
     * @tc.name testInt16ArrayFindTestTwo014
     * @tc.desc Verify find returns Int16 max value match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 32767, 200);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value === 32767,
      );
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_1500
     * @tc.name testInt16ArrayFindTestTwo015
     * @tc.desc Verify find returns Int16 min value match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, -32768, 150);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value === -32768,
      );
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_1600
     * @tc.name testInt16ArrayFindTestTwo016
     * @tc.desc Verify find returns positive value match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-5, 100, -10, 50);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value === 100,
      );
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_1700
     * @tc.name testInt16ArrayFindTestTwo017
     * @tc.desc Verify find predicate uses index greater-or-equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => index >= 3);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_1800
     * @tc.name testInt16ArrayFindTestTwo018
     * @tc.desc Verify find predicate uses even index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 15, 25, 35, 45);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => index % 2 === 0,
      );
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_1900
     * @tc.name testInt16ArrayFindTestTwo019
     * @tc.desc Verify find predicate combines value and index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 3, 7, 10, 15);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value > 5 && index > 1,
      );
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_2000
     * @tc.name testInt16ArrayFindTestTwo020
     * @tc.desc Verify find predicate uses array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 6, 9, 12, 15);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value === array.length * 3,
      );
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_2100
     * @tc.name testInt16ArrayFindTestTwo021
     * @tc.desc Verify find predicate checks array identity equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 14, 21);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => {
        return array === arr && value > 10;
      });
      expect(result).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_2200
     * @tc.name testInt16ArrayFindTestTwo022
     * @tc.desc Verify find returns Int16 max value match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 200, 300);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value > 32767,
      );
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_2300
     * @tc.name testInt16ArrayFindTestTwo023
     * @tc.desc Verify find returns Int16 min value match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-100, -200, -300);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value < -32768,
      );
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_2400
     * @tc.name testInt16ArrayFindTestTwo024
     * @tc.desc Verify find returns undefined for no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value === 999,
      );
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_2500
     * @tc.name testInt16ArrayFindTestTwo025
     * @tc.desc Verify find behavior on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 10);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_2600
     * @tc.name testInt16ArrayFindTestTwo026
     * @tc.desc Verify find does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let lenBefore: number = arr.length;
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 25);
      let actual1: int = arr.length;
      let expected1: number = lenBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_2700
     * @tc.name testInt16ArrayFindTestTwo027
     * @tc.desc Verify find does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 3, 5, 7, 9);
      let lenBefore: number = arr.length;
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 100);
      let actual1: int = arr.length;
      let expected1: number = lenBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_2800
     * @tc.name testInt16ArrayFindTestTwo028
     * @tc.desc Verify find does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => true);
      let actual1: int = arr.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_2900
     * @tc.name testInt16ArrayFindTestTwo029
     * @tc.desc Verify find behavior on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(42);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value === 42,
      );
      let actual1: int = arr.length;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_3000
     * @tc.name testInt16ArrayFindTestTwo030
     * @tc.desc Verify find does not change BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let bpeBefore: number = arr.BYTES_PER_ELEMENT;
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 3);
      let actual1: int = arr.BYTES_PER_ELEMENT;
      let expected1: number = bpeBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_3100
     * @tc.name testInt16ArrayFindTestTwo031
     * @tc.desc Verify find does not change BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let bpeBefore: number = arr.BYTES_PER_ELEMENT;
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 999);
      let actual1: int = arr.BYTES_PER_ELEMENT;
      let expected1: number = bpeBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_3200
     * @tc.name testInt16ArrayFindTestTwo032
     * @tc.desc Verify find does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
      let blBefore: number = arr.byteLength;
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 3);
      let actual1: int = arr.byteLength;
      let expected1: number = blBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_3300
     * @tc.name testInt16ArrayFindTestTwo033
     * @tc.desc Verify find does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 14, 21, 28);
      let blBefore: number = arr.byteLength;
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value > 1000,
      );
      let actual1: int = arr.byteLength;
      let expected1: number = blBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_3400
     * @tc.name testInt16ArrayFindTestTwo034
     * @tc.desc Verify find keeps index 0 element unchanged after match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 60, 70, 80, 90);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 65);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_3500
     * @tc.name testInt16ArrayFindTestTwo035
     * @tc.desc Verify find returns expected matched value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(15, 25, 35, 45);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value < 0);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_3600
     * @tc.name testInt16ArrayFindTestTwo036
     * @tc.desc Verify find keeps middle index element unchanged after match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value === 40,
      );
      let actual1: number = arr.$_get(2);
      expect(actual1).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_3700
     * @tc.name testInt16ArrayFindTestTwo037
     * @tc.desc Verify find returns expected matched value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15, 20, 25);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 100);
      let actual1: number = arr.$_get(2);
      expect(actual1).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_3800
     * @tc.name testInt16ArrayFindTestTwo038
     * @tc.desc Verify find keeps last index element unchanged after match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 3, 5, 7, 9);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 4);
      let actual1: number = arr.$_get(4);
      expect(actual1).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_3900
     * @tc.name testInt16ArrayFindTestTwo039
     * @tc.desc Verify find returns expected matched value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33, 44, 55);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value === 44,
      );
      let actual1: number = arr.$_get(1);
      expect(actual1).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_4000
     * @tc.name testInt16ArrayFindTestTwo040
     * @tc.desc Verify find keeps all elements unchanged after iteration check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 6, 9, 12, 15);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 10);
      let allMatch: boolean = true;
      let expected: number[] = [3, 6, 9, 12, 15];
      for (let i = 0; i < arr.length; i++) {
        if (arr.$_get(i) !== expected[i]) {
          allMatch = false;
          break;
        }
      }
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_4100
     * @tc.name testInt16ArrayFindTestTwo041
     * @tc.desc Verify find keeps all elements unchanged after iteration check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 8, 9, 10, 11);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value > 1000,
      );
      let allMatch: boolean = true;
      let expected: number[] = [7, 8, 9, 10, 11];
      for (let i = 0; i < arr.length; i++) {
        if (arr.$_get(i) !== expected[i]) {
          allMatch = false;
          break;
        }
      }
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_4200
     * @tc.name testInt16ArrayFindTestTwo042
     * @tc.desc Verify find does not change buffer identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let bufBefore: ArrayBuffer = arr.buffer;
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 3);
      let actual1: boolean = arr.buffer === bufBefore;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_4300
     * @tc.name testInt16ArrayFindTestTwo043
     * @tc.desc Verify find does not change buffer identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let bufBefore: ArrayBuffer = arr.buffer;
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value < 0);
      let actual1: boolean = arr.buffer === bufBefore;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_4400
     * @tc.name testInt16ArrayFindTestTwo044
     * @tc.desc Verify find does not change byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let arr: Int16Array = new Int16Array(buf, 2, 5);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      arr.$_set(3, 40);
      arr.$_set(4, 50);
      let offsetBefore: number = arr.byteOffset;
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 25);
      let actual1: int = arr.byteOffset;
      let expected1: number = offsetBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_4500
     * @tc.name testInt16ArrayFindTestTwo045
     * @tc.desc Verify find does not change byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int16Array = new Int16Array(buf, 4, 3);
      arr.$_set(0, 5);
      arr.$_set(1, 10);
      arr.$_set(2, 15);
      let offsetBefore: number = arr.byteOffset;
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 100);
      let actual1: int = arr.byteOffset;
      let expected1: number = offsetBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_4600
     * @tc.name testInt16ArrayFindTestTwo046
     * @tc.desc Verify find returns expected matched value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767);
      let result: number | undefined = arr.find(
        (value: number, index: int, array: Int16Array): boolean => value === 32767,
      );
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_4700
     * @tc.name testInt16ArrayFindTestTwo047
     * @tc.desc Verify find returns negative value match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, -32768, 50);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value < 0);
      if (result !== undefined) {
        let actual1: boolean = (result as number) < 0;
        expect(actual1).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_4800
     * @tc.name testInt16ArrayFindTestTwo048
     * @tc.desc Verify find returns expected matched value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(42, 42, 42, 42);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => true);
      expect(result).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_4900
     * @tc.name testInt16ArrayFindTestTwo049
     * @tc.desc Verify find returns negative value match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, -1, 32767, -32768, 50);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value < 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FIND_TWO_5000
     * @tc.name testInt16ArrayFindTestTwo050
     * @tc.desc Verify find returns expected matched value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFindTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-5, -10, 1, 32767, -32768);
      let result: number | undefined = arr.find((value: number, index: int, array: Int16Array): boolean => value > 0);
      expect(result).assertEqual(1);
    });
  });
}
