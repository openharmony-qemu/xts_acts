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

export default function int8ArrayReversePart03Test(): void {
  describe('Int8ArrayReversePart03Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_0100
     * @tc.name int8ArrayReversePart03Test001
     * @tc.desc Verify reverse after Int8Array constructed from [128, 5] truncates 128 to -128 and reverses position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [128, 5];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = INT8_MIN;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_0200
     * @tc.name int8ArrayReversePart03Test002
     * @tc.desc Verify reverse after Int8Array constructed from [-129, 7] truncates -129 to 127 and reverses position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-129, 7];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = INT8_MAX;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_0300
     * @tc.name int8ArrayReversePart03Test003
     * @tc.desc Verify reverse after Int8Array constructed from [255, 3] truncates 255 to -1 and reverses position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [255, 3];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_0400
     * @tc.name int8ArrayReversePart03Test004
     * @tc.desc Verify reverse after Int8Array constructed from [256, 8] truncates 256 to 0 and reverses position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [256, 8];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_0500
     * @tc.name int8ArrayReversePart03Test005
     * @tc.desc Verify reverse after Int8Array constructed from [129, 6] truncates 129 to -127 and reverses position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [129, 6];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = -127;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_0600
     * @tc.name int8ArrayReversePart03Test006
     * @tc.desc Verify reverse after Int8Array constructed from [Number.NaN, 4] truncates Number.NaN to 0 and reverses position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [Number.NaN, 4];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_0700
     * @tc.name int8ArrayReversePart03Test007
     * @tc.desc Verify reverse after Int8Array constructed from [1.9, 4] truncates 1.9 to 1 and reverses position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.9, 4];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_0800
     * @tc.name int8ArrayReversePart03Test008
     * @tc.desc Verify reverse after Int8Array constructed from [-1.9, 4] truncates -1.9 to -1 and reverses position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-1.9, 4];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_0900
     * @tc.name int8ArrayReversePart03Test009
     * @tc.desc Verify reverse after Int8Array constructed from [-0.0, 3] truncates -0.0 to 0 and reverses position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [-0.0, 3];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_1000
     * @tc.name int8ArrayReversePart03Test010
     * @tc.desc Verify reverse after Int8Array constructed from [254, 3] truncates 254 to -2 and reverses position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [254, 3];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = -2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_1100
     * @tc.name int8ArrayReversePart03Test011
     * @tc.desc Verify after reverse, $_set(0, 128) truncates 128 to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      arr.reverse();
      arr.$_set(0, 128);
      let result = arr.$_get(0);
      let expected = INT8_MIN;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_1200
     * @tc.name int8ArrayReversePart03Test012
     * @tc.desc Verify after reverse, $_set(0, -129) truncates -129 to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      arr.reverse();
      arr.$_set(0, -129);
      let result = arr.$_get(0);
      let expected = INT8_MAX;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_1300
     * @tc.name int8ArrayReversePart03Test013
     * @tc.desc Verify after reverse, $_set(0, 255) truncates 255 to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      arr.reverse();
      arr.$_set(0, 255);
      let result = arr.$_get(0);
      let expected = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_1400
     * @tc.name int8ArrayReversePart03Test014
     * @tc.desc Verify after reverse, $_set(0, 256) truncates 256 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      arr.reverse();
      arr.$_set(0, 256);
      let result = arr.$_get(0);
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_1500
     * @tc.name int8ArrayReversePart03Test015
     * @tc.desc Verify after reverse, $_set(0, 254) truncates 254 to -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      arr.reverse();
      arr.$_set(0, 254);
      let result = arr.$_get(0);
      let expected = -2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_1600
     * @tc.name int8ArrayReversePart03Test016
     * @tc.desc Verify after reverse, $_set(0, 129) truncates 129 to -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      arr.reverse();
      arr.$_set(0, 129);
      let result = arr.$_get(0);
      let expected = -127;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_1700
     * @tc.name int8ArrayReversePart03Test017
     * @tc.desc Verify reverse of Int8Array constructed from all-128 array keeps all elements -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [128, 128];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = INT8_MIN;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_1800
     * @tc.name int8ArrayReversePart03Test018
     * @tc.desc Verify reverse of [128, 50, 255, 60] moves the truncated middle value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [128, 50, 255, 60];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_1900
     * @tc.name int8ArrayReversePart03Test019
     * @tc.desc Verify reverse on empty array returns this reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let ret = arr.reverse();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_2000
     * @tc.name int8ArrayReversePart03Test020
     * @tc.desc Verify reverse on empty array keeps length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      arr.reverse();
      let result = arr.length;
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_2100
     * @tc.name int8ArrayReversePart03Test021
     * @tc.desc Verify reverse on single-element array returns this reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      let ret = arr.reverse();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_2400
     * @tc.name int8ArrayReversePart03Test024
     * @tc.desc Verify reverse on two-element array swaps elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 22;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_2500
     * @tc.name int8ArrayReversePart03Test025
     * @tc.desc Verify modifying return value of reverse affects original array on 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22]);
      let ret = arr.reverse();
      ret.$_set(0, 99);
      let result = arr.$_get(0);
      let expected = 99;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_2600
     * @tc.name int8ArrayReversePart03Test026
     * @tc.desc Verify reverse on three-element array keeps middle element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = 20;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_2700
     * @tc.name int8ArrayReversePart03Test027
     * @tc.desc Verify reverse on 256-element array covering full int8 range keeps length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(256);
      for (let i = 0; i < 256; i++) {
        arr.$_set(i, i - 128);
      }
      arr.reverse();
      let result = arr.length;
      let expected = 256;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_2800
     * @tc.name int8ArrayReversePart03Test028
     * @tc.desc Verify reverse on empty array keeps toString as empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      arr.reverse();
      let result = arr.toString();
      let expected = '';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_2900
     * @tc.name int8ArrayReversePart03Test029
     * @tc.desc Verify reverse on single-element array keeps toString unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      arr.reverse();
      let result = arr.toString();
      let expected = '42';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_3000
     * @tc.name int8ArrayReversePart03Test030
     * @tc.desc Verify reverse on all-zero array keeps specified position still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 0, 0, 0]);
      arr.reverse();
      let result = arr.$_get(2);
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_3800
     * @tc.name int8ArrayReversePart03Test038
     * @tc.desc Verify reverse of [1.9, 10, -1.9] moves the negative truncated value to the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1.9, 10, -1.9];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_3900
     * @tc.name int8ArrayReversePart03Test039
     * @tc.desc Verify reverse of all-Number.NaN array keeps middle position still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [Number.NaN, Number.NaN, Number.NaN];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_4000
     * @tc.name int8ArrayReversePart03Test040
     * @tc.desc Verify reverse of [-128, 127, 0] moves 0 to the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN, INT8_MAX, 0]);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_4100
     * @tc.name int8ArrayReversePart03Test041
     * @tc.desc Verify reverse of [Number.NaN, 10, Number.POSITIVE_INFINITY, 20] moves the last element to the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [Number.NaN, 10, Number.POSITIVE_INFINITY, 20];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 20;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_4200
     * @tc.name int8ArrayReversePart03Test042
     * @tc.desc Verify subarray view reverse modifies original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let view = arr.subarray(1, 4);
      view.reverse();
      let result = arr.$_get(1);
      let expected = 4;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_4300
     * @tc.name int8ArrayReversePart03Test043
     * @tc.desc Verify subarray(0, 3) view reverse on [10, 20, 30, 40] reverses first 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let resultVal1: Int8Array = arr.subarray(0, 3).reverse();
      let expectedVal1: Int8Array = new Int8Array([30, 20, 10]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let result = arr.$_get(2);
      let expected = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_4400
     * @tc.name int8ArrayReversePart03Test044
     * @tc.desc Verify subarray(1, 4) offset non-zero view reverse on [5, 6, 7, 8, 9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 6, 7, 8, 9]);
      let resultVal1: Int8Array = arr.subarray(1, 4).reverse();
      let expectedVal1: Int8Array = new Int8Array([8, 7, 6]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let result = arr.$_get(3);
      let expected = 6;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_4500
     * @tc.name int8ArrayReversePart03Test045
     * @tc.desc Verify shared buffer non-overlapping intervals, one view reverse does not affect another
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let a = new Int8Array(buf, 0, 2);
      let b = new Int8Array(buf, 2, 2);
      a.$_set(0, 1);
      a.$_set(1, 2);
      b.$_set(0, 3);
      b.$_set(1, 4);
      a.reverse();
      let firstValue: number = b.$_get(0);
      let expectedFirst: int = 3;
      expect(firstValue).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_4600
     * @tc.name int8ArrayReversePart03Test046
     * @tc.desc Verify slice copy reverse does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let copy = arr.slice();
      copy.reverse();
      let result = arr.$_get(0);
      let expected = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_4700
     * @tc.name int8ArrayReversePart03Test047
     * @tc.desc Verify full subarray(0) reverse is equivalent to original array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let resultVal1: Int8Array = arr.subarray(0).reverse();
      let expectedVal1: Int8Array = new Int8Array([3, 2, 1]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let result = arr.$_get(0);
      let expected = 3;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_4800
     * @tc.name int8ArrayReversePart03Test048
     * @tc.desc Verify empty view subarray(2, 2) reverse causes no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let view = arr.subarray(2, 2);
      view.reverse();
      let result = arr.$_get(2);
      let expected = 3;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_4900
     * @tc.name int8ArrayReversePart03Test049
     * @tc.desc Verify single-element view reverse causes no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let resultVal1: Int8Array = arr.subarray(1, 2).reverse();
      let expectedVal1: Int8Array = new Int8Array([2]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let result = arr.$_get(1);
      let expected = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_5000
     * @tc.name int8ArrayReversePart03Test050
     * @tc.desc Verify subarray view reverse returns view itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let view = arr.subarray(0, 2);
      let ret = view.reverse();
      expect(ret).assertEqual(view);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_5100
     * @tc.name int8ArrayReversePart03Test051
     * @tc.desc Verify multi-view chain subarray reverse subarray for segmented reversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      let resultVal1: Int8Array = arr.subarray(0, 3).reverse();
      let expectedVal1: Int8Array = new Int8Array([3, 2, 1]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let resultVal2: Int8Array = arr.subarray(3, 5).reverse();
      let expectedVal2: Int8Array = new Int8Array([5, 4]);
      expect(resultVal2.toString()).assertEqual(expectedVal2.toString());
      let result = arr.$_get(3);
      let expected = 5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_5200
     * @tc.name int8ArrayReversePart03Test052
     * @tc.desc Verify after reverse, at(length) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.reverse();
      let len: int = arr.length;
      expect(arr.at(len)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_5300
     * @tc.name int8ArrayReversePart03Test053
     * @tc.desc Verify after reverse, at(-length-1) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.reverse();
      let len: int = arr.length;
      expect(arr.at(-len - 1)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_5400
     * @tc.name int8ArrayReversePart03Test054
     * @tc.desc Verify after reverse, at(0) returns original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.reverse();
      let result = arr.at(0);
      let expected = 30;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_5500
     * @tc.name int8ArrayReversePart03Test055
     * @tc.desc Verify after reverse, at(-1) returns original first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.reverse();
      let result = arr.at(-1);
      let expected = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_5600
     * @tc.name int8ArrayReversePart03Test056
     * @tc.desc Verify after reverse on empty array, at(0) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      arr.reverse();
      expect(arr.at(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_5700
     * @tc.name int8ArrayReversePart03Test057
     * @tc.desc Verify after reverse on single-element array, at(1) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      arr.reverse();
      expect(arr.at(1)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_6000
     * @tc.name int8ArrayReversePart03Test060
     * @tc.desc Verify reverse keeps length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4, 5]);
      arr.reverse();
      let result = arr.length;
      let expected = 5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_6100
     * @tc.name int8ArrayReversePart03Test061
     * @tc.desc Verify reverse keeps byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new Int8Array(buf, 2, 4);
      let off: int = arr.byteOffset;
      arr.reverse();
      let result = arr.byteOffset;
      let expected = off;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_6200
     * @tc.name int8ArrayReversePart03Test062
     * @tc.desc Verify reverse keeps buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let buf = arr.buffer;
      arr.reverse();
      let result = arr.buffer;
      let expected = buf;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_6300
     * @tc.name int8ArrayReversePart03Test063
     * @tc.desc Verify modifying return value of reverse affects original array on 4 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let ret = arr.reverse();
      ret.$_set(0, 88);
      let result = arr.$_get(0);
      let expected = 88;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_6400
     * @tc.name int8ArrayReversePart03Test064
     * @tc.desc Verify reverse then indexOf finds original last element at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.reverse();
      let result = arr.indexOf(30);
      let expected = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_6500
     * @tc.name int8ArrayReversePart03Test065
     * @tc.desc Verify reverse maps original index 2 element to index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let mid = arr.$_get(2);
      arr.reverse();
      let result = arr.$_get(1);
      let expected = mid;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_6600
     * @tc.name int8ArrayReversePart03Test066
     * @tc.desc Verify reverse last element equals original first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let first = arr.$_get(0);
      arr.reverse();
      let result = arr.$_get(arr.length - 1);
      let expected = first;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_6700
     * @tc.name int8ArrayReversePart03Test067
     * @tc.desc Verify reverse toString reflects new order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      arr.reverse();
      let result = arr.toString();
      let expected = '3,2,1';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_6800
     * @tc.name int8ArrayReversePart03Test068
     * @tc.desc Verify reverse then includes works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.reverse();
      let includesResult: boolean = arr.includes(20);
      expect(includesResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_6900
     * @tc.name int8ArrayReversePart03Test069
     * @tc.desc Verify double reverse of [128, 5] keeps truncated value at original position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [128, 5];
      let arr = new Int8Array(src);
      arr.reverse();
      arr.reverse();
      let result = arr.$_get(0);
      let expected = INT8_MIN;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART03_TEST_7000
     * @tc.name int8ArrayReversePart03Test070
     * @tc.desc Verify reverse of [128, 5, 9] moves the original last element to the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [128, 5, 9];
      let arr = new Int8Array(src);
      arr.reverse();
      let result = arr.$_get(0);
      let expected = 9;
      expect(result).assertEqual(expected);
    });
  });
}
