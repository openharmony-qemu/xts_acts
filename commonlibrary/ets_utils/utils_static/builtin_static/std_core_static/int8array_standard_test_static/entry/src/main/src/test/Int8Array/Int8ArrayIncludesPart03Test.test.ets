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

export default function int8ArrayIncludesPart03Test(): void {
  describe('Int8ArrayIncludesPart03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_0100
     * @tc.name int8ArrayIncludesPart03Test001
     * @tc.desc Verify includes searchElement=3 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_0200
     * @tc.name int8ArrayIncludesPart03Test002
     * @tc.desc Verify includes searchElement=3, 1 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(3, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_0300
     * @tc.name int8ArrayIncludesPart03Test003
     * @tc.desc Verify includes(Number.NaN) returns false on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.includes(Number.NaN);
      expect(result).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_0400
     * @tc.name int8ArrayIncludesPart03Test004
     * @tc.desc Verify includes searchElement=1, -1 returns false when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(1, -1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_0500
     * @tc.name int8ArrayIncludesPart03Test005
     * @tc.desc Verify includes searchElement=4, -2 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(4, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_0600
     * @tc.name int8ArrayIncludesPart03Test006
     * @tc.desc Verify includes searchElement=3, -2 returns false when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(3, -2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_0700
     * @tc.name int8ArrayIncludesPart03Test007
     * @tc.desc Verify includes searchElement=1, -5 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(1, -5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_0800
     * @tc.name int8ArrayIncludesPart03Test008
     * @tc.desc Verify includes searchElement=1, -6 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(1, -6);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_0900
     * @tc.name int8ArrayIncludesPart03Test009
     * @tc.desc Verify includes searchElement=3, -2147483648 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(3, -2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_1000
     * @tc.name int8ArrayIncludesPart03Test010
     * @tc.desc Verify includes searchElement=1, 0 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(1, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_1100
     * @tc.name int8ArrayIncludesPart03Test011
     * @tc.desc Verify includes searchElement=1, 2 returns false when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(1, 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_1200
     * @tc.name int8ArrayIncludesPart03Test012
     * @tc.desc Verify includes searchElement=3, 2 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(3, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_1300
     * @tc.name int8ArrayIncludesPart03Test013
     * @tc.desc Verify includes searchElement=5, 4 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(5, 4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_1400
     * @tc.name int8ArrayIncludesPart03Test014
     * @tc.desc Verify includes searchElement=4, 4 returns false when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(4, 4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_1500
     * @tc.name int8ArrayIncludesPart03Test015
     * @tc.desc Verify includes searchElement=5, 5 returns false when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(5, 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_1600
     * @tc.name int8ArrayIncludesPart03Test016
     * @tc.desc Verify includes searchElement=3, 6 returns false when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(3, 6);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_1700
     * @tc.name int8ArrayIncludesPart03Test017
     * @tc.desc Verify includes(3, 2147483647) with large fromIndex returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(3, 2147483647);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_1800
     * @tc.name int8ArrayIncludesPart03Test018
     * @tc.desc Verify includes searchElement=1, undefined returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(1, undefined);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_1900
     * @tc.name int8ArrayIncludesPart03Test019
     * @tc.desc Verify includes(INT8_MAX) returns true on new Int8Array([INT8_MAX, 1, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, 1, 2]);
      let result: boolean = arr.includes(INT8_MAX);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_2000
     * @tc.name int8ArrayIncludesPart03Test020
     * @tc.desc Verify includes(0) returns true on new Int8Array([0, 1, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 2]);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_2100
     * @tc.name int8ArrayIncludesPart03Test021
     * @tc.desc Verify includes(10) returns false on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.includes(10);
      expect(result).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_2200
     * @tc.name int8ArrayIncludesPart03Test022
     * @tc.desc Verify includes(9) checks element presence in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.includes(9);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_2300
     * @tc.name int8ArrayIncludesPart03Test023
     * @tc.desc Verify includes(3,1) does not mutate array: length remains 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let r1: boolean = arr.includes(3, 1);
      expect(r1).assertTrue();
      let r2: int = arr.length;
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_2400
     * @tc.name int8ArrayIncludesPart03Test024
     * @tc.desc Verify includes(3,1) does not mutate array: element at index 2 remains 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let r1: boolean = arr.includes(3, 1);
      expect(r1).assertTrue();
      let r2: number = arr.$_get(2);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_2500
     * @tc.name int8ArrayIncludesPart03Test025
     * @tc.desc Verify includes(1) with empty array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.includes(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_2600
     * @tc.name int8ArrayIncludesPart03Test026
     * @tc.desc Verify includes(1, -1) with empty array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.includes(1, -1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_2700
     * @tc.name int8ArrayIncludesPart03Test027
     * @tc.desc Verify includes(1, 5) with empty array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.includes(1, 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_2800
     * @tc.name int8ArrayIncludesPart03Test028
     * @tc.desc Verify includes(Number.NaN) returns false on empty new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.includes(Number.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_2900
     * @tc.name int8ArrayIncludesPart03Test029
     * @tc.desc Verify includes searchElement=7 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      let result: boolean = arr.includes(7);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_3000
     * @tc.name int8ArrayIncludesPart03Test030
     * @tc.desc Verify includes searchElement=7, 0 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      let result: boolean = arr.includes(7, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_3100
     * @tc.name int8ArrayIncludesPart03Test031
     * @tc.desc Verify includes searchElement=7, -1 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      let result: boolean = arr.includes(7, -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_3200
     * @tc.name int8ArrayIncludesPart03Test032
     * @tc.desc Verify includes searchElement=7, 1 returns false when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      let result: boolean = arr.includes(7, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_3300
     * @tc.name int8ArrayIncludesPart03Test033
     * @tc.desc Verify includes searchElement=7, -2 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      let result: boolean = arr.includes(7, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_3400
     * @tc.name int8ArrayIncludesPart03Test034
     * @tc.desc Verify includes searchElement=8 returns false when element does not exist in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      let result: boolean = arr.includes(8);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_3500
     * @tc.name int8ArrayIncludesPart03Test035
     * @tc.desc Verify includes(7, 2147483647) with large fromIndex returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      let result: boolean = arr.includes(7, 2147483647);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_3600
     * @tc.name int8ArrayIncludesPart03Test036
     * @tc.desc Verify includes searchElement=5 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5, 5]);
      let result: boolean = arr.includes(5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_3700
     * @tc.name int8ArrayIncludesPart03Test037
     * @tc.desc Verify includes searchElement=5, 2 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5, 5]);
      let result: boolean = arr.includes(5, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_3800
     * @tc.name int8ArrayIncludesPart03Test038
     * @tc.desc Verify includes searchElement=5, 4 returns false when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5, 5]);
      let result: boolean = arr.includes(5, 4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_3900
     * @tc.name int8ArrayIncludesPart03Test039
     * @tc.desc Verify includes(5, -1) with negative fromIndex returns true on new Int8Array([5, 5, 5, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5, 5]);
      let result: boolean = arr.includes(5, -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_4000
     * @tc.name int8ArrayIncludesPart03Test040
     * @tc.desc Verify includes searchElement=6 returns false when element does not exist in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5, 5]);
      let result: boolean = arr.includes(6);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_4100
     * @tc.name int8ArrayIncludesPart03Test041
     * @tc.desc Verify includes searchElement=5, -4 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5, 5]);
      let result: boolean = arr.includes(5, -4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_4200
     * @tc.name int8ArrayIncludesPart03Test042
     * @tc.desc Verify includes searchElement=5, -5 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5, 5]);
      let result: boolean = arr.includes(5, -5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_4300
     * @tc.name int8ArrayIncludesPart03Test043
     * @tc.desc Verify includes searchElement=200, 2 returns false when element does not exist in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, -56, 30, 40]);
      let result: boolean = arr.includes(200, 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_4400
     * @tc.name int8ArrayIncludesPart03Test044
     * @tc.desc Verify includes(Number.NaN, 2) returns false on new Int8Array([1, 0, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, 2]);
      let result: boolean = arr.includes(Number.NaN, 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_4500
     * @tc.name int8ArrayIncludesPart03Test045
     * @tc.desc Verify includes(Number.NaN, 3) returns false on new Int8Array([0, 1, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 2]);
      let result: boolean = arr.includes(Number.NaN, 3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_4600
     * @tc.name int8ArrayIncludesPart03Test046
     * @tc.desc Verify includes(0, 2147483647) with large fromIndex returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let result: boolean = arr.includes(0, 2147483647);
      expect(result).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_4700
     * @tc.name int8ArrayIncludesPart03Test047
     * @tc.desc Verify includes(Number.POSITIVE_INFINITY) with Infinity returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([127, 1, 2]);
      let result: boolean = arr.includes(Number.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_4800
     * @tc.name int8ArrayIncludesPart03Test048
     * @tc.desc Verify includes(-Number.POSITIVE_INFINITY) with Infinity returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 1, 2]);
      let result: boolean = arr.includes(-Number.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_4900
     * @tc.name int8ArrayIncludesPart03Test049
     * @tc.desc Verify includes searchElement=200 returns false when element does not exist in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, -56, 40]);
      let result: boolean = arr.includes(200);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_5000
     * @tc.name int8ArrayIncludesPart03Test050
     * @tc.desc Verify includes searchElement=128 returns false when element does not exist in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 1, 2]);
      let result: boolean = arr.includes(128);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_5100
     * @tc.name int8ArrayIncludesPart03Test051
     * @tc.desc Verify includes searchElement=-129 returns false when element does not exist in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([127, 1, 2]);
      let result: boolean = arr.includes(-129);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_5200
     * @tc.name int8ArrayIncludesPart03Test052
     * @tc.desc Verify includes searchElement=255 returns false when element does not exist in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 1, 2]);
      let result: boolean = arr.includes(255);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_5300
     * @tc.name int8ArrayIncludesPart03Test053
     * @tc.desc Verify includes searchElement=256 returns false when element does not exist in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 2]);
      let result: boolean = arr.includes(256);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_5400
     * @tc.name int8ArrayIncludesPart03Test054
     * @tc.desc Verify includes(1.9) with single-element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let result: boolean = arr.includes(1.9);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_5500
     * @tc.name int8ArrayIncludesPart03Test055
     * @tc.desc Verify includes(-1.9) with single-element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1]);
      let result: boolean = arr.includes(-1.9);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_5600
     * @tc.name int8ArrayIncludesPart03Test056
     * @tc.desc Verify includes searchElement=0.5 returns false when element does not exist in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 2]);
      let result: boolean = arr.includes(0.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_5700
     * @tc.name int8ArrayIncludesPart03Test057
     * @tc.desc Verify includes searchElement=-0.5 returns false when element does not exist in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 0, 1]);
      let result: boolean = arr.includes(-0.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_5800
     * @tc.name int8ArrayIncludesPart03Test058
     * @tc.desc Verify includes searchElement=0x81 returns false when element does not exist in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-127, 1, 2]);
      let result: boolean = arr.includes(0x81);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_5900
     * @tc.name int8ArrayIncludesPart03Test059
     * @tc.desc Verify includes searchElement=200, -1 returns false when element does not exist in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, -56]);
      let result: boolean = arr.includes(200, -1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_6000
     * @tc.name int8ArrayIncludesPart03Test060
     * @tc.desc Verify includes(Number.NaN, 0) returns false on new Int8Array([0, 1, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 2]);
      let result: boolean = arr.includes(Number.NaN, 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_6100
     * @tc.name int8ArrayIncludesPart03Test061
     * @tc.desc Verify includes(Number.POSITIVE_INFINITY, -4) with Infinity returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([127, 1, 2]);
      let result: boolean = arr.includes(Number.POSITIVE_INFINITY, -4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART03_TEST_6200
     * @tc.name int8ArrayIncludesPart03Test062
     * @tc.desc Verify includes searchElement=-129, 4 returns false when element does not exist in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 127]);
      let result: boolean = arr.includes(-129, 4);
      expect(result).assertFalse();
    });
  });
}
