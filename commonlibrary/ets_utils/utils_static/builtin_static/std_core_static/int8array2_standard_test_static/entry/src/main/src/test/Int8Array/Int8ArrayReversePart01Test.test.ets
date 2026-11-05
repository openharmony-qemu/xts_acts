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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from './../Util.test';

export default function int8ArrayReversePart01Test(): void {
  describe('Int8ArrayReversePart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_0100
     * @tc.name int8ArrayReversePart01Test001
     * @tc.desc Verify reverse() zero-argument call returns reference to same array with first element equal to original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: Int8Array = arr.reverse();
      let r1: number = r.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_0200
     * @tc.name int8ArrayReversePart01Test002
     * @tc.desc Verify reverse on two-element array swaps first element to original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([8, 9]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 9;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_0300
     * @tc.name int8ArrayReversePart01Test003
     * @tc.desc Verify reverse on three-element array swaps first to original last while middle stays unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 11, 12]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 12;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_0400
     * @tc.name int8ArrayReversePart01Test004
     * @tc.desc Verify reverse on four-element array swaps first element to original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([13, 14, 15, 16]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 16;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_0500
     * @tc.name int8ArrayReversePart01Test005
     * @tc.desc Verify reverse on array containing int8 min -128 results in last element being -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 50, -50]);
      arr.reverse();
      let result = arr.at(-1);
      let expected = INT8_MIN;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_0600
     * @tc.name int8ArrayReversePart01Test006
     * @tc.desc Verify reverse on array containing int8 max 127 results in last element being 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, 50, -50]);
      arr.reverse();
      let result = arr.at(-1);
      let expected = INT8_MAX;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_0700
     * @tc.name int8ArrayReversePart01Test007
     * @tc.desc Verify reverse on array containing zero value 0 results in last element being 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 50, -50]);
      arr.reverse();
      let result = arr.at(-1);
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_0800
     * @tc.name int8ArrayReversePart01Test008
     * @tc.desc Verify reverse on array containing -1 results in last element being -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 50, -50]);
      arr.reverse();
      let result = arr.at(-1);
      let expected = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_0900
     * @tc.name int8ArrayReversePart01Test009
     * @tc.desc Verify reverse on array containing positive one 1 results in last element being 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 50, -50]);
      arr.reverse();
      let result = arr.at(-1);
      let expected = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_1000
     * @tc.name int8ArrayReversePart01Test010
     * @tc.desc Verify reverse on array containing -127 results in last element being -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-INT8_MAX, 50, -50]);
      arr.reverse();
      let result = arr.at(-1);
      let expected = -127;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_1100
     * @tc.name int8ArrayReversePart01Test011
     * @tc.desc Verify reverse on array containing positive middle 64 results in last element being 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([64, 50, -50]);
      arr.reverse();
      let result = arr.at(-1);
      let expected = 64;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_1200
     * @tc.name int8ArrayReversePart01Test012
     * @tc.desc Verify reverse on array containing negative middle -64 results in last element being -64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-64, 50, -50]);
      arr.reverse();
      let result = arr.at(-1);
      let expected = -64;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_1300
     * @tc.name int8ArrayReversePart01Test013
     * @tc.desc Verify 1.9 truncates to 1 and 2.9 truncates to 2 then reverse swaps to first element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1.9, 2.9]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_1400
     * @tc.name int8ArrayReversePart01Test014
     * @tc.desc Verify -1.9 truncates to -1 and -2.9 truncates to -2 then reverse swaps to first element -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1.9, -2.9]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = -2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_1500
     * @tc.name int8ArrayReversePart01Test015
     * @tc.desc Verify 0.5 truncates to 0 and 1.5 truncates to 1 then reverse swaps to first element 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0.5, 1.5]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_1600
     * @tc.name int8ArrayReversePart01Test016
     * @tc.desc Verify 127.9 truncates to 127 and 126.9 truncates to 126 then reverse swaps to first element 126
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([127.9, 126.9]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 126;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_1700
     * @tc.name int8ArrayReversePart01Test017
     * @tc.desc Verify -128.9 truncates to -128 and -127.9 truncates to -127 then reverse swaps to first element -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128.9, -127.9]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = -127;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_1800
     * @tc.name int8ArrayReversePart01Test018
     * @tc.desc Verify Number.NEGATIVE_INFINITY truncates to -128 and 0.5 truncates to 0 then reverse swaps to first element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([Number.NEGATIVE_INFINITY, 0.5]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_1900
     * @tc.name int8ArrayReversePart01Test019
     * @tc.desc Verify reverse on ascending array has first element equal to original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_2000
     * @tc.name int8ArrayReversePart01Test020
     * @tc.desc Verify reverse on descending array has first element equal to original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 4, 3, 2, 1]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_2100
     * @tc.name int8ArrayReversePart01Test021
     * @tc.desc Verify reverse on shuffled array has first element equal to original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 4, 2]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_2200
     * @tc.name int8ArrayReversePart01Test022
     * @tc.desc Verify reverse on all-same-elements array has first element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 7;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_2300
     * @tc.name int8ArrayReversePart01Test023
     * @tc.desc Verify reverse on palindrome array has midpoint element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 2, 1]);
      arr.reverse();
      let result = arr.$_get(2);
      let expected = 3;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_2400
     * @tc.name int8ArrayReversePart01Test024
     * @tc.desc Verify reverse on array with duplicate elements has first element equal to original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 2, 3]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 3;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_2500
     * @tc.name int8ArrayReversePart01Test025
     * @tc.desc Verify reverse on alternating positive-negative array has first element equal to original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -1, 1, -1]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_2600
     * @tc.name int8ArrayReversePart01Test026
     * @tc.desc Verify reverse on step-repeat array has first element equal to original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 1, 1]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_2700
     * @tc.name int8ArrayReversePart01Test027
     * @tc.desc Verify reverse on [-128, 127] min-max pair swaps first element to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = INT8_MAX;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_2800
     * @tc.name int8ArrayReversePart01Test028
     * @tc.desc Verify reverse on [127, -128] max-min pair swaps first element to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MIN]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = INT8_MIN;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_2900
     * @tc.name int8ArrayReversePart01Test029
     * @tc.desc Verify reverse on [-128, 0, 127] three extrema has first element 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 0, INT8_MAX]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = INT8_MAX;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_3000
     * @tc.name int8ArrayReversePart01Test030
     * @tc.desc Verify reverse on [127, 0, -128] three extrema reversed has first element -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, 0, INT8_MIN]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = INT8_MIN;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_3100
     * @tc.name int8ArrayReversePart01Test031
     * @tc.desc Verify reverse on [-128, -128, 127, 127] extrema repeat has first element 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MIN, INT8_MAX, INT8_MAX]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = INT8_MAX;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_3200
     * @tc.name int8ArrayReversePart01Test032
     * @tc.desc Verify reverse on [127, 127, -128, -128] extrema repeat reversed has first element -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MAX, INT8_MIN, INT8_MIN]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = INT8_MIN;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_3300
     * @tc.name int8ArrayReversePart01Test033
     * @tc.desc Verify reverse on array with same first and last element has second element equal to original second-to-last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 1]);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = 3;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_3400
     * @tc.name int8ArrayReversePart01Test034
     * @tc.desc Verify reverse on array with zero first-last and nonzero middle has first element equal to original last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 2, 0]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_3500
     * @tc.name int8ArrayReversePart01Test035
     * @tc.desc Verify reverse on strictly increasing negative array has first element -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-3, -2, -1]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_3600
     * @tc.name int8ArrayReversePart01Test036
     * @tc.desc Verify reverse on negative-zero-positive symmetric array has first element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-2, 0, 2]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_3700
     * @tc.name int8ArrayReversePart01Test037
     * @tc.desc Verify reverse on positive-negative alternating increasing array has first element -4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -2, 3, -4]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = -4;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_3800
     * @tc.name int8ArrayReversePart01Test038
     * @tc.desc Verify reverse on zero-wrapping-nonzero-ending array has first element 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 5, 0, 9]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 9;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_3900
     * @tc.name int8ArrayReversePart01Test039
     * @tc.desc Verify reverse on two-value alternating array has first element 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 10, 20]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 20;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_4000
     * @tc.name int8ArrayReversePart01Test040
     * @tc.desc Verify reverse on first-half-positive-second-half-negative array has first element -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, -1, -2]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = -2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_4100
     * @tc.name int8ArrayReversePart01Test041
     * @tc.desc Verify reverse on 120-element large array has first element equal to original last element 119
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(120);
      let i: int = 0;
      for (i = 0; i < 120; i++) {
        arr.$_set(i, i);
      }
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 119;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_4200
     * @tc.name int8ArrayReversePart01Test042
     * @tc.desc Verify boundary -128 at first position after reverse has first element equal to original last element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 1, 2]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_4300
     * @tc.name int8ArrayReversePart01Test043
     * @tc.desc Verify boundary -128 at last position after reverse has first element -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, INT8_MIN]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = INT8_MIN;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_4400
     * @tc.name int8ArrayReversePart01Test044
     * @tc.desc Verify boundary -128 at middle position after reverse has first element equal to original last element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, INT8_MIN, 2]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_4500
     * @tc.name int8ArrayReversePart01Test045
     * @tc.desc Verify double -128 wrapping 127 array after reverse has first element -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX, INT8_MIN]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = INT8_MIN;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_4600
     * @tc.name int8ArrayReversePart01Test046
     * @tc.desc Verify zero and extrema mixed four elements after reverse has first element 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, INT8_MIN, 0, INT8_MAX]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = INT8_MAX;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_4700
     * @tc.name int8ArrayReversePart01Test047
     * @tc.desc Verify zero at first position three-element array after reverse has first element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 2]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_4800
     * @tc.name int8ArrayReversePart01Test048
     * @tc.desc Verify zero at last position three-element array after reverse has first element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 0]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_4900
     * @tc.name int8ArrayReversePart01Test049
     * @tc.desc Verify zero at middle position three-element array after reverse has first element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, 2]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_5000
     * @tc.name int8ArrayReversePart01Test050
     * @tc.desc Verify double zero wrapping nonzero four-element array after reverse has first element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 0, 2]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_5100
     * @tc.name int8ArrayReversePart01Test051
     * @tc.desc Verify reverse on [-1, 1] sign symmetric pair has first element 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 1]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_5200
     * @tc.name int8ArrayReversePart01Test052
     * @tc.desc Verify reverse on [1, -1] sign symmetric pair reversed has first element -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -1]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_5300
     * @tc.name int8ArrayReversePart01Test053
     * @tc.desc Verify reverse on [-1, 1, -1, 1] sign alternating four elements has first element 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 1, -1, 1]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_5400
     * @tc.name int8ArrayReversePart01Test054
     * @tc.desc Verify reverse on [-2, 1, -2, 1] asymmetric alternating has first element 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-2, 1, -2, 1]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_5500
     * @tc.name int8ArrayReversePart01Test055
     * @tc.desc Verify reverse on [1,1,2,2,3,3] double-repeat stair has first element 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 1, 2, 2, 3, 3]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 3;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_5600
     * @tc.name int8ArrayReversePart01Test056
     * @tc.desc Verify reverse on [1,1,1,2,2,2] triple-repeat stair has first element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 1, 1, 2, 2, 2]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_5700
     * @tc.name int8ArrayReversePart01Test057
     * @tc.desc Verify reverse on [3,3,2,2,1,1] decreasing repeat has first element 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 3, 2, 2, 1, 1]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_5800
     * @tc.name int8ArrayReversePart01Test058
     * @tc.desc Verify reverse on [-5,-4,-3,-2,-1] negative ascending has first element -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-5, -4, -3, -2, -1]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_5900
     * @tc.name int8ArrayReversePart01Test059
     * @tc.desc Verify reverse on [-1,-2,-3,-4,-5] negative descending has first element -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -2, -3, -4, -5]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = -5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_6000
     * @tc.name int8ArrayReversePart01Test060
     * @tc.desc Verify reverse on [0,1,2,3] zero-start ascending has first element 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 2, 3]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 3;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_6100
     * @tc.name int8ArrayReversePart01Test061
     * @tc.desc Verify reverse on [1,2,3,0] zero-end ascending has first element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 0]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_6200
     * @tc.name int8ArrayReversePart01Test062
     * @tc.desc Verify reverse on [127,-128,127,-128] extrema alternating reversed has first element -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MIN, INT8_MAX, INT8_MIN]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = INT8_MIN;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART01_6300
     * @tc.name int8ArrayReversePart01Test063
     * @tc.desc Verify reverse on [0,127,0,-128] zero and extrema alternating has first element -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, INT8_MAX, 0, INT8_MIN]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = INT8_MIN;
      expect(result).assertEqual(expected);
    });
  });
}
