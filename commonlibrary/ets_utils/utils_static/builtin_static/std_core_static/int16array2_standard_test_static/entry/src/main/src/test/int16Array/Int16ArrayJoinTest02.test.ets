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

export default function int16ArrayJoinTestTwoTest(): void {
  describe('Int16ArrayJoinTestTwoTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_0100
     * @tc.name testInt16ArrayJoinTestTwo001
     * @tc.desc Verify join() returns "-32768,0,32767"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, 0, 32767);
      let result: string = arr.join();
      expect(result).assertEqual('-32768,0,32767');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_0200
     * @tc.name testInt16ArrayJoinTestTwo002
     * @tc.desc Verify join() default separator returns signed comma-separated negatives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1, -2, -3);
      let result: string = arr.join();
      expect(result).assertEqual('-1,-2,-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_0300
     * @tc.name testInt16ArrayJoinTestTwo003
     * @tc.desc Verify join() default separator returns zeros comma-separated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let result: string = arr.join();
      expect(result).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_0400
     * @tc.name testInt16ArrayJoinTestTwo004
     * @tc.desc Verify join('|') on empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let result: string = arr.join('|');
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_0500
     * @tc.name testInt16ArrayJoinTestTwo005
     * @tc.desc Verify join('|') on single element returns element string without separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5);
      let result: string = arr.join('|');
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_0600
     * @tc.name testInt16ArrayJoinTestTwo006
     * @tc.desc Verify join('|') returns signed pipe-separated negatives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1, -2, -3);
      let result: string = arr.join('|');
      expect(result).assertEqual('-1|-2|-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_0700
     * @tc.name testInt16ArrayJoinTestTwo007
     * @tc.desc Verify join('') concatenates signed negatives without separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1, -2, -3);
      let result: string = arr.join('');
      expect(result).assertEqual('-1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_0800
     * @tc.name testInt16ArrayJoinTestTwo008
     * @tc.desc Verify join('') concatenates mixed sign elements without separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1, 2, 3);
      let result: string = arr.join('');
      expect(result).assertEqual('-123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_0900
     * @tc.name testInt16ArrayJoinTestTwo009
     * @tc.desc Verify join() default separator result length is 5 for three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.join();
      let actual1: int = result.length;
      expect(actual1).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_1000
     * @tc.name testInt16ArrayJoinTestTwo010
     * @tc.desc Verify join('|') result length is 5 for three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.join('|');
      let actual1: int = result.length;
      expect(actual1).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_1100
     * @tc.name testInt16ArrayJoinTestTwo011
     * @tc.desc Verify join('') result length is 3 for three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.join('');
      let actual1: int = result.length;
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_1200
     * @tc.name testInt16ArrayJoinTestTwo012
     * @tc.desc Verify join() on empty array result length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let result: string = arr.join();
      let actual1: int = result.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_1300
     * @tc.name testInt16ArrayJoinTestTwo013
     * @tc.desc Verify join() on single element result length equals element string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5);
      let result: string = arr.join();
      let actual1: int = result.length;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_1400
     * @tc.name testInt16ArrayJoinTestTwo014
     * @tc.desc Verify join() default separator result length for two boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, 32767);
      let result: string = arr.join();
      let actual1: int = result.length;
      expect(actual1).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_1500
     * @tc.name testInt16ArrayJoinTestTwo015
     * @tc.desc Verify join("::") result length includes multi-char separator length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.join('::');
      let actual1: int = result.length;
      expect(actual1).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_1600
     * @tc.name testInt16ArrayJoinTestTwo016
     * @tc.desc Verify join() default separator result length includes four commas for five elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let result: string = arr.join();
      let actual1: int = result.length;
      expect(actual1).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_1700
     * @tc.name testInt16ArrayJoinTestTwo017
     * @tc.desc Verify join("---") result length includes long separator total length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.join('---');
      let actual1: int = result.length;
      expect(actual1).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_1800
     * @tc.name testInt16ArrayJoinTestTwo018
     * @tc.desc Verify join() result length counts multi-digit element characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 200, 3000);
      let result: string = arr.join();
      let expectedLen: number = 2 + 1 + 3 + 1 + 4;
      let actual1: int = result.length;
      let expected1: number = expectedLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_1900
     * @tc.name testInt16ArrayJoinTestTwo019
     * @tc.desc Verify join() default separator does not change original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let originalLen: number = arr.length;
      arr.join();
      let actual1: int = arr.length;
      let expected1: number = originalLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_2000
     * @tc.name testInt16ArrayJoinTestTwo020
     * @tc.desc Verify join('|') does not change original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let originalLen: number = arr.length;
      arr.join('|');
      let actual1: int = arr.length;
      let expected1: number = originalLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_2100
     * @tc.name testInt16ArrayJoinTestTwo021
     * @tc.desc Verify join('') does not change original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let originalLen: number = arr.length;
      arr.join('');
      let actual1: int = arr.length;
      let expected1: number = originalLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_2200
     * @tc.name testInt16ArrayJoinTestTwo022
     * @tc.desc Verify join() does not change first original array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.join();
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_2300
     * @tc.name testInt16ArrayJoinTestTwo023
     * @tc.desc Verify join('|') does not change middle original array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.join('|');
      let actual1: number = arr.$_get(1);
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_2400
     * @tc.name testInt16ArrayJoinTestTwo024
     * @tc.desc Verify join('') does not change last original array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.join('');
      let actual1: number = arr.$_get(2);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_2500
     * @tc.name testInt16ArrayJoinTestTwo025
     * @tc.desc Verify join() does not change original array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let origByteLen: number = arr.byteLength;
      arr.join();
      let actual1: int = arr.byteLength;
      let expected1: number = origByteLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_2600
     * @tc.name testInt16ArrayJoinTestTwo026
     * @tc.desc Verify join() called twice on same array returns identical string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let firstResult: string = arr.join();
      let secondResult: string = arr.join();
      expect(firstResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_2700
     * @tc.name testInt16ArrayJoinTestTwo027
     * @tc.desc Verify join('|') called twice on same array returns identical string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let firstResult: string = arr.join('|');
      let secondResult: string = arr.join('|');
      expect(firstResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_2800
     * @tc.name testInt16ArrayJoinTestTwo028
     * @tc.desc Verify join('') leaves original array elements unmodified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1, 2, 3);
      arr.join('');
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(-1);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_2900
     * @tc.name testInt16ArrayJoinTestTwo029
     * @tc.desc Verify join() does not change original array byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2, 2);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      let origOffset: number = arr.byteOffset;
      arr.join();
      let actual1: int = arr.byteOffset;
      let expected1: number = origOffset;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_3000
     * @tc.name testInt16ArrayJoinTestTwo030
     * @tc.desc Verify join() result charAt(0) returns first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.join();
      let actual1: string = result.charAt(0).toString();
      expect(actual1).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_3100
     * @tc.name testInt16ArrayJoinTestTwo031
     * @tc.desc Verify join() result substring extracts leading element string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.join();
      let actual1: string = result.substring(0, 1);
      expect(actual1).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_3200
     * @tc.name testInt16ArrayJoinTestTwo032
     * @tc.desc Verify join() default separator result indexOf finds comma position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.join();
      let actual1: int = result.indexOf(',');
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_3300
     * @tc.name testInt16ArrayJoinTestTwo033
     * @tc.desc Verify join('|') result indexOf finds pipe position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.join('|');
      let actual1: int = result.indexOf('|');
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_3400
     * @tc.name testInt16ArrayJoinTestTwo034
     * @tc.desc Verify join() result can concatenate with another string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.join();
      let combined: string = result + 'suffix';
      expect(combined).assertEqual('1,2,3suffix');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_3500
     * @tc.name testInt16ArrayJoinTestTwo035
     * @tc.desc Verify join('') result charAt returns concatenated character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.join('');
      let actual1: string = result.charAt(0).toString();
      expect(actual1).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_3600
     * @tc.name testInt16ArrayJoinTestTwo036
     * @tc.desc Verify join() result strictly equals expected string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.join();
      let expected: string = '1,2,3';
      let actual1: boolean = result === expected;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_3700
     * @tc.name testInt16ArrayJoinTestTwo037
     * @tc.desc Verify join() result length supports arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.join();
      let len: number = result.length;
      let doubled: number = len + len;
      expect(doubled).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_3800
     * @tc.name testInt16ArrayJoinTestTwo038
     * @tc.desc Verify join() result startsWith first element string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.join();
      let actual1: boolean = result.startsWith('1');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_JOIN_TWO_3900
     * @tc.name testInt16ArrayJoinTestTwo039
     * @tc.desc Verify join('') result startsWith first element digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayJoinTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: string = arr.join('');
      let actual1: boolean = result.startsWith('1');
      expect(actual1).assertTrue();
    });
  });
}
