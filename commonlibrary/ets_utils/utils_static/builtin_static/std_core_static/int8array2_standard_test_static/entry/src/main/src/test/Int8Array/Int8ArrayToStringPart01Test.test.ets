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
import Utils from '../Util.test';

export default function int8ArrayToStringPart01Test(): void {
  describe('Int8ArrayToStringPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_0100
     * @tc.name int8ArrayToStringPart01Test001
     * @tc.desc Verify toString() with no argument on multi-element array returns comma-separated element string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -1, INT8_MAX]);
      let result: string = arr.toString();
      let expected: string = '1,-1,127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_0200
     * @tc.name int8ArrayToStringPart01Test002
     * @tc.desc Verify toString() with no argument on single-element array returns single-value string without comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      let result: string = arr.toString();
      let expected: string = '7';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_0300
     * @tc.name int8ArrayToStringPart01Test003
     * @tc.desc Verify new Int8Array(0) length-0 empty array toString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: string = arr.toString();
      let expected: string = '';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_0400
     * @tc.name int8ArrayToStringPart01Test004
     * @tc.desc Verify new Int8Array(new ArrayBuffer(0)) empty buffer view toString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(new ArrayBuffer(0));
      let result: string = arr.toString();
      let expected: string = '';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_0500
     * @tc.name int8ArrayToStringPart01Test005
     * @tc.desc Verify new Int8Array([]) empty array literal toString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([]);
      let result: string = arr.toString();
      let expected: string = '';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_0600
     * @tc.name int8ArrayToStringPart01Test006
     * @tc.desc Verify Int8Array.from empty Set<int> iteration source toString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      let arr: Int8Array = Int8Array.from(src);
      let result: string = arr.toString();
      let expected: string = '';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_0700
     * @tc.name int8ArrayToStringPart01Test007
     * @tc.desc Verify single element MIN(-128) toString returns '-128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, INT8_MIN);
      let result: string = arr.toString();
      let expected: string = '-128';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_0800
     * @tc.name int8ArrayToStringPart01Test008
     * @tc.desc Verify single element MAX(127) toString returns '127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, INT8_MAX);
      let result: string = arr.toString();
      let expected: string = '127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_0900
     * @tc.name int8ArrayToStringPart01Test009
     * @tc.desc Verify single element 0 (zero value) toString returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 0);
      let result: string = arr.toString();
      let expected: string = '0';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_1000
     * @tc.name int8ArrayToStringPart01Test010
     * @tc.desc Verify single element -1 (negative unit) toString returns '-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, -1);
      let result: string = arr.toString();
      let expected: string = '-1';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_1100
     * @tc.name int8ArrayToStringPart01Test011
     * @tc.desc Verify single element 1 (positive unit) toString returns '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 1);
      let result: string = arr.toString();
      let expected: string = '1';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_1200
     * @tc.name int8ArrayToStringPart01Test012
     * @tc.desc Verify single element 10 (2-digit positive integer) toString returns '10'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 10);
      let result: string = arr.toString();
      let expected: string = '10';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_1300
     * @tc.name int8ArrayToStringPart01Test013
     * @tc.desc Verify single element -10 (2-digit negative integer) toString returns '-10'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, -10);
      let result: string = arr.toString();
      let expected: string = '-10';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_1400
     * @tc.name int8ArrayToStringPart01Test014
     * @tc.desc Verify writing 129 truncates to -127, toString returns '-127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 129);
      let result: string = arr.toString();
      let expected: string = '-127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_1500
     * @tc.name int8ArrayToStringPart01Test015
     * @tc.desc Verify writing 256 (full cycle) truncates to 0, toString returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 256);
      let result: string = arr.toString();
      let expected: string = '0';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_1600
     * @tc.name int8ArrayToStringPart01Test016
     * @tc.desc Verify writing -129 (MIN-1) truncates to 127, toString returns '127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, -129);
      let result: string = arr.toString();
      let expected: string = '127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_1700
     * @tc.name int8ArrayToStringPart01Test017
     * @tc.desc Verify writing -130 truncates to 126, toString returns '126'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, -130);
      let result: string = arr.toString();
      let expected: string = '126';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_1800
     * @tc.name int8ArrayToStringPart01Test018
     * @tc.desc Verify construct source containing 1.9 truncates to 1, toString returns '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1.9]);
      let result: string = arr.toString();
      let expected: string = '1';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_1900
     * @tc.name int8ArrayToStringPart01Test019
     * @tc.desc Verify construct source containing -1.9 truncates to -1, toString returns '-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1.9]);
      let result: string = arr.toString();
      let expected: string = '-1';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_2000
     * @tc.name int8ArrayToStringPart01Test020
     * @tc.desc Verify construct source containing 0.5 truncates to 0, toString returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0.5]);
      let result: string = arr.toString();
      let expected: string = '0';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_2100
     * @tc.name int8ArrayToStringPart01Test021
     * @tc.desc Verify construct source containing 127.9 truncates toward zero to 127, toString returns '127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([127.9]);
      let result: string = arr.toString();
      let expected: string = '127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_2200
     * @tc.name int8ArrayToStringPart01Test022
     * @tc.desc Verify [0, 0] double-zero array toString returns '0,0' comma-separated identical zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0]);
      let result: string = arr.toString();
      let expected: string = '0,0';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_2300
     * @tc.name int8ArrayToStringPart01Test023
     * @tc.desc Verify [-128, 127] MIN+MAX pair toString returns '-128,127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX]);
      let result: string = arr.toString();
      let expected: string = '-128,127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_2400
     * @tc.name int8ArrayToStringPart01Test024
     * @tc.desc Verify [-128, 0, 127] MIN/zero/MAX triplet toString returns '-128,0,127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 0, INT8_MAX]);
      let result: string = arr.toString();
      let expected: string = '-128,0,127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_2500
     * @tc.name int8ArrayToStringPart01Test025
     * @tc.desc Verify [127, 127, 127] all-MAX three elements toString returns '127,127,127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX]);
      let result: string = arr.toString();
      let expected: string = '127,127,127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_2600
     * @tc.name int8ArrayToStringPart01Test026
     * @tc.desc Verify [-128, -128] all-MIN double elements toString returns '-128,-128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MIN]);
      let result: string = arr.toString();
      let expected: string = '-128,-128';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_2700
     * @tc.name int8ArrayToStringPart01Test027
     * @tc.desc Verify [1, -1, 127, -128] four-element mixed boundaries toString returns '1,-1,127,-128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -1, INT8_MAX, INT8_MIN]);
      let result: string = arr.toString();
      let expected: string = '1,-1,127,-128';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_2800
     * @tc.name int8ArrayToStringPart01Test028
     * @tc.desc Verify [0, -1] zero followed by negative toString returns '0,-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, -1]);
      let result: string = arr.toString();
      let expected: string = '0,-1';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_2900
     * @tc.name int8ArrayToStringPart01Test029
     * @tc.desc Verify [-1, 0] negative followed by zero toString returns '-1,0' order-sensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 0]);
      let result: string = arr.toString();
      let expected: string = '-1,0';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_3000
     * @tc.name int8ArrayToStringPart01Test030
     * @tc.desc Verify [-128, -1, 0, 1, 127] ascending full-range five elements toString returns '-128,-1,0,1,127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, -1, 0, 1, INT8_MAX]);
      let result: string = arr.toString();
      let expected: string = '-128,-1,0,1,127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_3100
     * @tc.name int8ArrayToStringPart01Test031
     * @tc.desc Verify [127, 1, 0, -1, -128] descending full-range five elements toString returns '127,1,0,-1,-128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, 1, 0, -1, INT8_MIN]);
      let result: string = arr.toString();
      let expected: string = '127,1,0,-1,-128';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_3200
     * @tc.name int8ArrayToStringPart01Test032
     * @tc.desc Verify [0, -1, 0] negative surrounded by zeros toString returns '0,-1,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, -1, 0]);
      let result: string = arr.toString();
      let expected: string = '0,-1,0';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_3300
     * @tc.name int8ArrayToStringPart01Test033
     * @tc.desc Verify [10, -10, 127] mixed digit-width (2/2/3-digit) toString returns '10,-10,127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, -10, INT8_MAX]);
      let result: string = arr.toString();
      let expected: string = '10,-10,127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_3400
     * @tc.name int8ArrayToStringPart01Test034
     * @tc.desc Verify [1, 10, 127] all-positive (no negative sign in output) toString returns '1,10,127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 10, INT8_MAX]);
      let result: string = arr.toString();
      let expected: string = '1,10,127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_3500
     * @tc.name int8ArrayToStringPart01Test035
     * @tc.desc Verify [-1, -10, -128] all-negative (all with negative signs) toString returns '-1,-10,-128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -10, INT8_MIN]);
      let result: string = arr.toString();
      let expected: string = '-1,-10,-128';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_3600
     * @tc.name int8ArrayToStringPart01Test036
     * @tc.desc Verify new Int8Array([1, -1]) from Array<number> literal toString returns '1,-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -1]);
      let result: string = arr.toString();
      let expected: string = '1,-1';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_3700
     * @tc.name int8ArrayToStringPart01Test037
     * @tc.desc Verify new Int8Array([INT8_MAX, INT8_MIN]) static of-style construction toString returns '127,-128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MIN]);
      let result: string = arr.toString();
      let expected: string = '127,-128';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_3800
     * @tc.name int8ArrayToStringPart01Test038
     * @tc.desc Verify Int8Array.from(Array<int>) from int array toString preserves source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, -1, 127];
      let arr: Int8Array = Int8Array.from(src);
      let result: string = arr.toString();
      let expected: string = '1,-1,127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_3900
     * @tc.name int8ArrayToStringPart01Test039
     * @tc.desc Verify new Int8Array(otherInt8Array) copy construction toString preserves source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: Int8Array = new Int8Array([1, -1, INT8_MAX]);
      let copy: Int8Array = new Int8Array(original);
      let actualStr: string = copy.toString();
      let expectedStr: string = '1,-1,127';
      expect(actualStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_4000
     * @tc.name int8ArrayToStringPart01Test040
     * @tc.desc Verify new Int8Array(buf, 0, 3) from buffer offset 0 view toString reflects view elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let arr: Int8Array = new Int8Array(buf, 0, 3);
      arr.$_set(0, 1);
      arr.$_set(1, -1);
      arr.$_set(2, INT8_MAX);
      let result: string = arr.toString();
      let expected: string = '1,-1,127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_4100
     * @tc.name int8ArrayToStringPart01Test041
     * @tc.desc Verify new Int8Array(buf, 1, 2) from buffer offset 1 partial view toString only reflects view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let full: Int8Array = new Int8Array(buf);
      full.$_set(0, INT8_MIN);
      full.$_set(1, -1);
      full.$_set(2, 0);
      full.$_set(3, INT8_MAX);
      let view: Int8Array = new Int8Array(buf, 1, 2);
      let actualStr: string = view.toString();
      let expectedStr: string = '-1,0';
      expect(actualStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_4200
     * @tc.name int8ArrayToStringPart01Test042
     * @tc.desc Verify Int8Array.from(Set<int>) from set iteration source toString preserves insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Set<int> = new Set<int>();
      src.add(1);
      src.add(-1);
      let arr: Int8Array = Int8Array.from(src);
      let result: string = arr.toString();
      let expected: string = '1,-1';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_4300
     * @tc.name int8ArrayToStringPart01Test043
     * @tc.desc Verify new Int8Array(1) single element default zero value toString returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      let result: string = arr.toString();
      let expected: string = '0';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_4400
     * @tc.name int8ArrayToStringPart01Test044
     * @tc.desc Verify new Int8Array(3) three elements default zero value toString returns '0,0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      let result: string = arr.toString();
      let expected: string = '0,0,0';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_4500
     * @tc.name int8ArrayToStringPart01Test045
     * @tc.desc Verify new Int8Array(buf, byteLength, 0) buffer-ended zero-length view toString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 4, 0);
      let actualStr: string = view.toString();
      let expectedStr: string = '';
      expect(actualStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_4600
     * @tc.name int8ArrayToStringPart01Test046
     * @tc.desc Verify 256 full-range int8 values (0~255 truncated covering -128~127 domain) toString produces 256 comma-separated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(256);
      let i: int = 0;
      while (i < 256) {
        arr.$_set(i, i);
        i = i + 1;
      }
      let s: string = arr.toString();
      let actualCount: int = s.split(',').length;
      let expectedCount: int = 256;
      expect(actualCount).assertEqual(expectedCount);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_4700
     * @tc.name int8ArrayToStringPart01Test047
     * @tc.desc Verify $_set modifies middle element and toString reflects updated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, INT8_MAX]);
      arr.$_set(1, INT8_MIN);
      let result: string = arr.toString();
      let expected: string = '1,-128,127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_4800
     * @tc.name int8ArrayToStringPart01Test048
     * @tc.desc Verify fill(-1) fills all elements and toString reflects filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(-1);
      let result: string = arr.toString();
      let expected: string = '-1,-1,-1';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_4900
     * @tc.name int8ArrayToStringPart01Test049
     * @tc.desc Verify reverse in-place reversal and toString reflects reversed order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -1, INT8_MAX]);
      arr.reverse();
      let result: string = arr.toString();
      let expected: string = '127,-1,1';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_5000
     * @tc.name int8ArrayToStringPart01Test050
     * @tc.desc Verify [0, 127] zero followed by MAX toString returns '0,127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, INT8_MAX]);
      let result: string = arr.toString();
      let expected: string = '0,127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART01_5100
     * @tc.name int8ArrayToStringPart01Test051
     * @tc.desc Verify [127, 0] MAX followed by zero toString returns '127,0' order-sensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, 0]);
      let result: string = arr.toString();
      let expected: string = '127,0';
      expect(result).assertEqual(expected);
    });
  });
}
