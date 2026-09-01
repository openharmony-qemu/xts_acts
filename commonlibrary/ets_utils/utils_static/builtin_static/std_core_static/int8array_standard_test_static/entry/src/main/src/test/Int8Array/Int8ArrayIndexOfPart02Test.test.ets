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

export default function int8ArrayIndexOfPart02Test(): void {
  describe('Int8ArrayIndexOfPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0100
     * @tc.name int8ArrayIndexOfPart02Test001
     * @tc.desc Verify indexOf(20) returns 1 via result variable, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result = arr.indexOf(20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0200
     * @tc.name int8ArrayIndexOfPart02Test002
     * @tc.desc Verify indexOf(99) returns -1 via result variable, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result = arr.indexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0300
     * @tc.name int8ArrayIndexOfPart02Test003
     * @tc.desc Verify indexOf(0) returns -1 via result variable, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let result = arr.indexOf(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0400
     * @tc.name int8ArrayIndexOfPart02Test004
     * @tc.desc Verify indexOf(6) on new Int8Array([3, 6, 9]) returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 6, 9]);
      let result = arr.indexOf(6);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0500
     * @tc.name int8ArrayIndexOfPart02Test005
     * @tc.desc Verify indexOf(2) on new Int8Array([1, 2, 3]) returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.indexOf(2);
      expect(arr.length).assertEqual(3);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0600
     * @tc.name int8ArrayIndexOfPart02Test006
     * @tc.desc Verify indexOf(2) on new Int8Array([1, 2, 3]) returns index 1 and length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let r1: int = arr.indexOf(2);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0700
     * @tc.name int8ArrayIndexOfPart02Test007
     * @tc.desc Verify indexOf(22) on new Int8Array([11, 22, 33]) returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33]);
      let result = arr.indexOf(22);
      expect(result + 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0800
     * @tc.name int8ArrayIndexOfPart02Test008
     * @tc.desc Verify indexOf(44) on new Int8Array([11, 22, 33]) returns -1 (not found)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33]);
      let result = arr.indexOf(44);
      expect(result + 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0900
     * @tc.name int8ArrayIndexOfPart02Test009
     * @tc.desc Verify indexOf(10) on new Int8Array([10, 20, 30]) returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1000
     * @tc.name int8ArrayIndexOfPart02Test010
     * @tc.desc Verify indexOf(20) returns 1 via inline assertion, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1100
     * @tc.name int8ArrayIndexOfPart02Test011
     * @tc.desc Verify indexOf(30) on new Int8Array([10, 20, 30]) returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(30)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1200
     * @tc.name int8ArrayIndexOfPart02Test012
     * @tc.desc Verify indexOf(5) on new Int8Array([5, 5, 5]) returns index 0 (first occurrence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 5, 5]);
      expect(arr.indexOf(5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1300
     * @tc.name int8ArrayIndexOfPart02Test013
     * @tc.desc Verify indexOf(10, 0) on new Int8Array([10, 20, 30]) returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(10, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1400
     * @tc.name int8ArrayIndexOfPart02Test014
     * @tc.desc Verify indexOf(20, 1) on new Int8Array([10, 20, 30]) returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(20, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1500
     * @tc.name int8ArrayIndexOfPart02Test015
     * @tc.desc Verify indexOf(10, 1) on new Int8Array([10, 20, 30]) returns -1 (element before fromIndex)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(10, 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1600
     * @tc.name int8ArrayIndexOfPart02Test016
     * @tc.desc Verify indexOf(5, 1) on new Int8Array([5, 5, 5]) returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 5, 5]);
      expect(arr.indexOf(5, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1700
     * @tc.name int8ArrayIndexOfPart02Test017
     * @tc.desc Verify indexOf(99) returns -1 via inline assertion, on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1800
     * @tc.name int8ArrayIndexOfPart02Test018
     * @tc.desc Verify indexOf(0) returns -1 via inline assertion, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      expect(arr.indexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1900
     * @tc.name int8ArrayIndexOfPart02Test019
     * @tc.desc Verify indexOf(7) on new Int8Array([42]) returns -1 (not found)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      expect(arr.indexOf(7)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2000
     * @tc.name int8ArrayIndexOfPart02Test020
     * @tc.desc Verify indexOf(9) on new Int8Array([8, 8, 8]) returns -1 (not found)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([8, 8, 8]);
      expect(arr.indexOf(9)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2100
     * @tc.name int8ArrayIndexOfPart02Test021
     * @tc.desc Verify indexOf(128) returns -1, searchElement out of Int8 range uses strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-128, 0, INT8_MAX]);
      expect(arr.indexOf(128)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2200
     * @tc.name int8ArrayIndexOfPart02Test022
     * @tc.desc Verify indexOf(-129) returns -1, searchElement out of Int8 range uses strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-128, 0, INT8_MAX]);
      expect(arr.indexOf(-129)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2300
     * @tc.name int8ArrayIndexOfPart02Test023
     * @tc.desc Verify indexOf(255) returns -1, searchElement out of Int8 range uses strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, 0, 1]);
      expect(arr.indexOf(255)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2400
     * @tc.name int8ArrayIndexOfPart02Test024
     * @tc.desc Verify indexOf(256) returns -1, searchElement out of Int8 range uses strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, 0, 1]);
      expect(arr.indexOf(256)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2500
     * @tc.name int8ArrayIndexOfPart02Test025
     * @tc.desc Verify indexOf(30, -1) on new Int8Array([10, 20, 30]) returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(30, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2600
     * @tc.name int8ArrayIndexOfPart02Test026
     * @tc.desc Verify indexOf(10, -3) on new Int8Array([10, 20, 30]) returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(10, -3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2700
     * @tc.name int8ArrayIndexOfPart02Test027
     * @tc.desc Verify indexOf(10, -4) on new Int8Array([10, 20, 30]) returns index 0 (negative fromIndex clamped to 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(10, -4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2800
     * @tc.name int8ArrayIndexOfPart02Test028
     * @tc.desc Verify indexOf(10, -2) on new Int8Array([10, 20, 10]) returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 10]);
      expect(arr.indexOf(10, -2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2900
     * @tc.name int8ArrayIndexOfPart02Test029
     * @tc.desc Verify indexOf(10, 3) on new Int8Array([10, 20, 30]) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(10, 3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3000
     * @tc.name int8ArrayIndexOfPart02Test030
     * @tc.desc Verify indexOf(10, 4) on new Int8Array([10, 20, 30]) returns -1 (fromIndex >= length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(10, 4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3100
     * @tc.name int8ArrayIndexOfPart02Test031
     * @tc.desc Verify indexOf(30, 2) on new Int8Array([10, 20, 30]) returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(30, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3200
     * @tc.name int8ArrayIndexOfPart02Test032
     * @tc.desc Verify indexOf(20) on new Int8Array([10, 20, 30]) returns index 1 and length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let r1: int = arr.indexOf(20);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: int = arr.length;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3300
     * @tc.name int8ArrayIndexOfPart02Test033
     * @tc.desc Verify indexOf(99) on new Int8Array([10, 20, 30]) returns -1 and length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let r1: int = arr.indexOf(99);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: int = arr.length;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3400
     * @tc.name int8ArrayIndexOfPart02Test034
     * @tc.desc Verify indexOf(20) on new Int8Array([10, 20, 30]) returns index 1 and byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let r1: int = arr.indexOf(20);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: int = arr.byteLength;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3500
     * @tc.name int8ArrayIndexOfPart02Test035
     * @tc.desc Verify byteLength unchanged after indexOf with fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let r1: int = arr.indexOf(20, 1);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: int = arr.byteLength;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3600
     * @tc.name int8ArrayIndexOfPart02Test036
     * @tc.desc Verify empty array length remains 0 after indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let r1: int = arr.indexOf(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      expect(arr.length).assertEqual(0);
      let r2: int = arr.byteLength;
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3700
     * @tc.name int8ArrayIndexOfPart02Test037
     * @tc.desc Verify single element array length remains 1 after indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      let r1: int = arr.indexOf(42);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(arr.length).assertEqual(1);
      let r2: number = arr.$_get(0);
      let e2: int = 42;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3800
     * @tc.name int8ArrayIndexOfPart02Test038
     * @tc.desc Verify indexOf(128) on new Int8Array([-128, 0, INT8_MAX]) returns -1 and buffer byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-128, 0, INT8_MAX]);
      let buf = arr.buffer;
      let r1: int = arr.indexOf(128);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: int = buf.byteLength;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3900
     * @tc.name int8ArrayIndexOfPart02Test039
     * @tc.desc Verify arr.length equals arr.byteLength after indexOf, int8 1-byte-per-element invariant unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let r1: int = arr.indexOf(20);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      expect(arr.length).assertEqual(arr.byteLength);
      let r2: number = arr.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(1);
      let e3: int = 20;
      expect(r3).assertEqual(e3);
      let r4: number = arr.$_get(2);
      let e4: int = 30;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4000
     * @tc.name int8ArrayIndexOfPart02Test040
     * @tc.desc Verify array elements unchanged after indexOf(99) on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let r1: int = arr.indexOf(99);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4100
     * @tc.name int8ArrayIndexOfPart02Test041
     * @tc.desc Verify array elements unchanged after indexOf(128) on new Int8Array([-128, 0, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-128, 0, INT8_MAX]);
      let r1: int = arr.indexOf(128);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4200
     * @tc.name int8ArrayIndexOfPart02Test042
     * @tc.desc Verify array elements unchanged after indexOf(30, -1) on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let r1: int = arr.indexOf(30, -1);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4300
     * @tc.name int8ArrayIndexOfPart02Test043
     * @tc.desc Verify duplicate element array unchanged after indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 5, 5]);
      let r1: int = arr.indexOf(5);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4400
     * @tc.name int8ArrayIndexOfPart02Test044
     * @tc.desc Verify array elements unchanged after indexOf(10, 3) on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let r1: int = arr.indexOf(10, 3);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4500
     * @tc.name int8ArrayIndexOfPart02Test045
     * @tc.desc Verify all same elements array unchanged after indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([8, 8, 8]);
      let r1: int = arr.indexOf(9);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      expect(arr.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4600
     * @tc.name int8ArrayIndexOfPart02Test046
     * @tc.desc Verify $_set at index from indexOf(20) on new Int8Array([10, 20, 30]) writes and reads back correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let idx = arr.indexOf(20);
      arr.$_set(idx, 99);
      expect(arr.$_get(idx)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4700
     * @tc.name int8ArrayIndexOfPart02Test047
     * @tc.desc Verify consecutive indexOf calls find duplicate element occurrences at indices 1 and 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 20]);
      let first = arr.indexOf(20);
      let second = arr.indexOf(20, first + 1);
      expect(first).assertEqual(1);
      expect(second).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4800
     * @tc.name int8ArrayIndexOfPart02Test048
     * @tc.desc Verify indexOf(30) result used as $_set index reads back 30 via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let idx = arr.indexOf(30);
      expect(arr.$_get(idx)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4900
     * @tc.name int8ArrayIndexOfPart02Test049
     * @tc.desc Verify indexOf(99) searches array and assertFail not reached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let idx = arr.indexOf(99);
      expect(idx).assertEqual(-1);
      try {
        arr.$_get(idx);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5000
     * @tc.name int8ArrayIndexOfPart02Test050
     * @tc.desc Verify byteOffset unchanged after indexOf, default view byteOffset=0 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let r1: int = arr.indexOf(20);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: int = arr.byteOffset;
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5100
     * @tc.name int8ArrayIndexOfPart02Test051
     * @tc.desc Verify subarray view byteOffset unchanged after indexOf, non-zero offset preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([10, 20, 30, 40]);
      let view = base.subarray(1, 3);
      let r1: int = view.indexOf(20);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: int = view.byteOffset;
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5200
     * @tc.name int8ArrayIndexOfPart02Test052
     * @tc.desc Verify subarray view indexOf only searches within view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([10, 20, 30, 40]);
      let view = base.subarray(1, 3);
      expect(view.indexOf(20)).assertEqual(0);
      expect(view.indexOf(40)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5300
     * @tc.name int8ArrayIndexOfPart02Test053
     * @tc.desc Verify subarray view shares buffer after indexOf, write to view affects original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([10, 20, 30, 40]);
      let view = base.subarray(1, 3);
      let r1: int = view.indexOf(30);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      view.$_set(0, 99);
      expect(base.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5400
     * @tc.name int8ArrayIndexOfPart02Test054
     * @tc.desc Verify slice copy has independent buffer after indexOf, write to copy does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([10, 20, 30]);
      let copy = base.slice(0, 3);
      let r1: int = copy.indexOf(20);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      copy.$_set(0, 99);
      expect(base.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5500
     * @tc.name int8ArrayIndexOfPart02Test055
     * @tc.desc Verify subarray view length unchanged after indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([10, 20, 30, 40]);
      let view = base.subarray(1, 3);
      let r1: int = view.indexOf(20);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: int = view.length;
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5600
     * @tc.name int8ArrayIndexOfPart02Test056
     * @tc.desc Verify subarray view byteLength unchanged after indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([10, 20, 30, 40]);
      let view = base.subarray(1, 3);
      let r1: int = view.indexOf(30);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: int = view.byteLength;
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5700
     * @tc.name int8ArrayIndexOfPart02Test057
     * @tc.desc Verify offset ArrayBuffer view indexOf byteOffset remains 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(5);
      let view = new Int8Array(buf, 1, 3);
      view.$_set(0, 10);
      view.$_set(1, 20);
      view.$_set(2, 30);
      let r1: int = view.indexOf(20);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      expect(view.byteOffset).assertEqual(1);
    });
  });
}
