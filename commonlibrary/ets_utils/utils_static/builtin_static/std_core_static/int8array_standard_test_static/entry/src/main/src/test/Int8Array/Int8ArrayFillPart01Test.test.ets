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

export default function int8ArrayFillPart01Test(): void {
  describe('Int8ArrayFillPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_0100
     * @tc.name int8ArrayFillPart01Test001
     * @tc.desc Verify fill(v) with 5 writes 5 to all 3 elements on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 5;
      const result = arr.fill(v);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_0200
     * @tc.name int8ArrayFillPart01Test002
     * @tc.desc Verify fill(7, 1) keeps index 0 at 0 and fills 1..3 on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 7;
      arr.fill(v, 1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_0300
     * @tc.name int8ArrayFillPart01Test003
     * @tc.desc Verify fill(9, 1, 4) fills range [1,4) keeping edges 0 on new Int8Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(5);
      const v: byte = 9;
      arr.fill(v, 1, 4);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(9);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_0400
     * @tc.name int8ArrayFillPart01Test004
     * @tc.desc Verify fill(v) on empty new Int8Array(0) returns the array itself with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(0);
      const v: byte = 5;
      const result = arr.fill(v);
      expect(result).assertEqual(arr);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_0500
     * @tc.name int8ArrayFillPart01Test005
     * @tc.desc Verify fill(v, 0, 0) on empty new Int8Array(0) returns the array itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(0);
      const v: byte = 5;
      const result = arr.fill(v, 0, 0);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_0600
     * @tc.name int8ArrayFillPart01Test006
     * @tc.desc Verify fill(0) writes 0 to all elements on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 0;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_0700
     * @tc.name int8ArrayFillPart01Test007
     * @tc.desc Verify fill(1) sets elements asserting indices 0 and 2, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 1;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_0800
     * @tc.name int8ArrayFillPart01Test008
     * @tc.desc Verify fill(-1) writes -1 to all elements on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = -1;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_0900
     * @tc.name int8ArrayFillPart01Test009
     * @tc.desc Verify fill(INT8_MAX) sets elements asserting indices 0 and 2, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = INT8_MAX;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_1000
     * @tc.name int8ArrayFillPart01Test010
     * @tc.desc Verify fill(v) with v=64 fills all elements of new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 64;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(64);
      expect(arr.$_get(2)).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_1100
     * @tc.name int8ArrayFillPart01Test011
     * @tc.desc Verify fill(v) with v=-64 fills all elements of new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = -64;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(-64);
      expect(arr.$_get(2)).assertEqual(-64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_1200
     * @tc.name int8ArrayFillPart01Test012
     * @tc.desc Verify fill(v) with v=7 overwrites preset elements 10, 20, 30, 40, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      arr.$_set(3, 40);
      const v: byte = 7;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_1300
     * @tc.name int8ArrayFillPart01Test013
     * @tc.desc Verify repeated fill(5) keeps 5 at all elements on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 5;
      arr.fill(v);
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_1400
     * @tc.name int8ArrayFillPart01Test014
     * @tc.desc Verify second fill(9) overwrites first fill 5 at all elements on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const fillValA: byte = 5;
      const fillValB: byte = 9;
      arr.fill(fillValA);
      arr.fill(fillValB);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_1500
     * @tc.name int8ArrayFillPart01Test015
     * @tc.desc Verify fill(v, 0) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 3;
      arr.fill(v, 0);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_1600
     * @tc.name int8ArrayFillPart01Test016
     * @tc.desc Verify fill(3, 1) keeps index 0 at 0 and fills 1..3 on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 3;
      arr.fill(v, 1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_1700
     * @tc.name int8ArrayFillPart01Test017
     * @tc.desc Verify fill(v, 3) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 3;
      arr.fill(v, 3);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_1800
     * @tc.name int8ArrayFillPart01Test018
     * @tc.desc Verify fill(v, 4) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      const v: byte = 9;
      arr.fill(v, 4);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_1900
     * @tc.name int8ArrayFillPart01Test019
     * @tc.desc Verify fill(v, 5) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.$_set(0, 1);
      const v: byte = 9;
      arr.fill(v, 5);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_2000
     * @tc.name int8ArrayFillPart01Test020
     * @tc.desc Verify fill(v, -1) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 7;
      arr.fill(v, -1);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_2100
     * @tc.name int8ArrayFillPart01Test021
     * @tc.desc Verify fill(v, -4) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 7;
      arr.fill(v, -4);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_2200
     * @tc.name int8ArrayFillPart01Test022
     * @tc.desc Verify fill(v, -3) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 7;
      arr.fill(v, -3);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_2300
     * @tc.name int8ArrayFillPart01Test023
     * @tc.desc Verify fill(v, -5) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 7;
      arr.fill(v, -5);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_2400
     * @tc.name int8ArrayFillPart01Test024
     * @tc.desc Verify fill(v, 2147483647) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.$_set(0, 1);
      const v: byte = 9;
      arr.fill(v, 2147483647);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_2500
     * @tc.name int8ArrayFillPart01Test025
     * @tc.desc Verify fill(v, -2147483648) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 9;
      arr.fill(v, -2147483648);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_2600
     * @tc.name int8ArrayFillPart01Test026
     * @tc.desc Verify fill(v, 0, 4) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 6;
      arr.fill(v, 0, 4);
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_2700
     * @tc.name int8ArrayFillPart01Test027
     * @tc.desc Verify fill(v, 0, 3) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 6;
      arr.fill(v, 0, 3);
      expect(arr.$_get(2)).assertEqual(6);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_2800
     * @tc.name int8ArrayFillPart01Test028
     * @tc.desc Verify fill(v, 0, 1) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 6;
      arr.fill(v, 0, 1);
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_2900
     * @tc.name int8ArrayFillPart01Test029
     * @tc.desc Verify fill(v, 0, 0) empty range keeps original value 2 at index 0, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.$_set(0, 2);
      const v: byte = 6;
      arr.fill(v, 0, 0);
      expect(arr.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_3000
     * @tc.name int8ArrayFillPart01Test030
     * @tc.desc Verify fill(v, 2, 2) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.$_set(2, 5);
      const v: byte = 6;
      arr.fill(v, 2, 2);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_3100
     * @tc.name int8ArrayFillPart01Test031
     * @tc.desc Verify fill(6, 3, 1) with start>end is no-op keeping $_set(1, 5) on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.$_set(1, 5);
      const v: byte = 6;
      arr.fill(v, 3, 1);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_3200
     * @tc.name int8ArrayFillPart01Test032
     * @tc.desc Verify fill(v, 0, -1) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 6;
      arr.fill(v, 0, -1);
      expect(arr.$_get(2)).assertEqual(6);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_3300
     * @tc.name int8ArrayFillPart01Test033
     * @tc.desc Verify fill(v, 0, -4) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.$_set(0, 8);
      const v: byte = 6;
      arr.fill(v, 0, -4);
      expect(arr.$_get(0)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_3400
     * @tc.name int8ArrayFillPart01Test034
     * @tc.desc Verify fill(v, 0, -3) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 6;
      arr.fill(v, 0, -3);
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_3500
     * @tc.name int8ArrayFillPart01Test035
     * @tc.desc Verify fill(v, 0, -5) clamps end to 0 and keeps original value 8 at index 0, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.$_set(0, 8);
      const v: byte = 6;
      arr.fill(v, 0, -5);
      expect(arr.$_get(0)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_3600
     * @tc.name int8ArrayFillPart01Test036
     * @tc.desc Verify fill(v, 0, 5) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 6;
      arr.fill(v, 0, 5);
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_3700
     * @tc.name int8ArrayFillPart01Test037
     * @tc.desc Verify fill(v, 0, 2147483647) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 6;
      arr.fill(v, 0, 2147483647);
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_3800
     * @tc.name int8ArrayFillPart01Test038
     * @tc.desc Verify fill(v, 0, -2147483648) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.$_set(0, 8);
      const v: byte = 6;
      arr.fill(v, 0, -2147483648);
      expect(arr.$_get(0)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_3900
     * @tc.name int8ArrayFillPart01Test039
     * @tc.desc Verify fill(v) returns the array itself on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 4;
      const result = arr.fill(v);
      expect(result).assertEqual(arr);
      let r1: number = arr.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_4000
     * @tc.name int8ArrayFillPart01Test040
     * @tc.desc Verify chained fill(4) then fill(8) leaves 8 at indices 0 and 2, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const fillValA: byte = 4;
      const fillValB: byte = 8;
      arr.fill(fillValA).fill(fillValB);
      expect(arr.$_get(0)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_4100
     * @tc.name int8ArrayFillPart01Test041
     * @tc.desc Verify fill(v) with v=4 fills all 5 elements, on new Int8Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(5);
      const v: byte = 4;
      arr.fill(v);
      let r1: number = arr.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4);
      let e2: int = 4;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_4200
     * @tc.name int8ArrayFillPart01Test042
     * @tc.desc Verify fill(v) with v=4 fills all elements of new Int8Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(5);
      const v: byte = 4;
      arr.fill(v);
      let r1: number = arr.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4);
      let e2: int = 4;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_4300
     * @tc.name int8ArrayFillPart01Test043
     * @tc.desc Verify fill(v) with v=4 fills elements of new Int8Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(5);
      const v: byte = 4;
      arr.fill(v);
      let r1: number = arr.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_4400
     * @tc.name int8ArrayFillPart01Test044
     * @tc.desc Verify fill(v).subarray(1, 3) yields 4 at index 0 with length 2 on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 4;
      const sub = arr.fill(v).subarray(1, 3);
      expect(sub.$_get(0)).assertEqual(4);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_4500
     * @tc.name int8ArrayFillPart01Test045
     * @tc.desc Verify fill(v) on Int8Array(buf, 2, 4) view writes 4 to view elements on ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int8Array(buf, 2, 4);
      const v: byte = 4;
      arr.fill(v);
      let r1: number = arr.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(3);
      let e2: int = 4;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_4600
     * @tc.name int8ArrayFillPart01Test046
     * @tc.desc Verify fill(v, 3, 1) start > end keeps preset values 1 and 4, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(3, 4);
      const v: byte = 9;
      arr.fill(v, 3, 1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_4700
     * @tc.name int8ArrayFillPart01Test047
     * @tc.desc Verify fill(v, -1, -2) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.$_set(3, 8);
      const v: byte = 9;
      arr.fill(v, -1, -2);
      expect(arr.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_4800
     * @tc.name int8ArrayFillPart01Test048
     * @tc.desc Verify fill(9, 0, -5) with end clamped to 0 is no-op keeping $_set(0, 3) on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.$_set(0, 3);
      const v: byte = 9;
      arr.fill(v, 0, -5);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_4900
     * @tc.name int8ArrayFillPart01Test049
     * @tc.desc Verify fill(v, 10, 20) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      arr.$_set(0, 1);
      const v: byte = 9;
      arr.fill(v, 10, 20);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_5000
     * @tc.name int8ArrayFillPart01Test050
     * @tc.desc Verify fill(v, -10, -8) replaces elements in specified range with given value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      arr.$_set(0, 1);
      const v: byte = 9;
      arr.fill(v, -10, -8);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_5100
     * @tc.name int8ArrayFillPart01Test051
     * @tc.desc Verify fill(v, -1, 1) replaces elements in specified range with given value on new Int8Array(0) and length remains 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(0);
      const v: byte = 9;
      const result = arr.fill(v, -1, 1);
      expect(result).assertEqual(arr);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_5200
     * @tc.name int8ArrayFillPart01Test052
     * @tc.desc Verify fill(v) with v=42 fills the single element of new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      const v: byte = 42;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_5300
     * @tc.name int8ArrayFillPart01Test053
     * @tc.desc Verify fill(v) then $_set(1, 99) keeps 5 at indices 0, 2 and 99 at index 1, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 5;
      arr.fill(v);
      arr.$_set(1, 99);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(99);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_5400
     * @tc.name int8ArrayFillPart01Test054
     * @tc.desc Verify fill(v) with v=-128 fills all 3 elements, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = -128;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-128);
      expect(arr.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_5500
     * @tc.name int8ArrayFillPart01Test055
     * @tc.desc Verify fill(INT8_MAX) sets elements asserting indices 0 1 and 2, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = INT8_MAX;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
      expect(arr.$_get(1)).assertEqual(INT8_MAX);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_5600
     * @tc.name int8ArrayFillPart01Test056
     * @tc.desc Verify fill(0) overwrites preset 50, 60, 70 to 0 on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      arr.$_set(0, 50);
      arr.$_set(1, 60);
      arr.$_set(2, 70);
      const v: byte = 0;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_5700
     * @tc.name int8ArrayFillPart01Test057
     * @tc.desc Verify fill(v) with v=-1 fills all 3 elements and toString returns '-1,-1,-1', on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = -1;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(-1);
      let r1: string = arr.toString();
      let e1: string = '-1,-1,-1';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_5800
     * @tc.name int8ArrayFillPart01Test058
     * @tc.desc Verify fill(1) sets elements asserting indices 0 1 and 2, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 1;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_5900
     * @tc.name int8ArrayFillPart01Test059
     * @tc.desc Verify fill(7, 1, 4) fills range [1,4) keeping edges 0 on new Int8Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(5);
      const v: byte = 7;
      arr.fill(v, 1, 4);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_6000
     * @tc.name int8ArrayFillPart01Test060
     * @tc.desc Verify fill(33) readable via at(0) and at(-1) on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 33;
      arr.fill(v);
      expect(arr.at(0)).assertEqual(33);
      expect(arr.at(-1)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_6100
     * @tc.name int8ArrayFillPart01Test061
     * @tc.desc Verify fill(5) makes join(',') return '5,5,5' on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 5;
      arr.fill(v);
      expect(arr.join(',')).assertEqual('5,5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_6200
     * @tc.name int8ArrayFillPart01Test062
     * @tc.desc Verify fill(7, 1, 4) keeps $_set(0, 11) and $_set(4, 99) outside range on new Int8Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(5);
      arr.$_set(0, 11);
      arr.$_set(4, 99);
      const v: byte = 7;
      arr.fill(v, 1, 4);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(4)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_6300
     * @tc.name int8ArrayFillPart01Test063
     * @tc.desc Verify fill(v, 2, 4) replaces elements in specified range with given value verified via at(0) and at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(5);
      arr.$_set(0, 11);
      const v: byte = 7;
      arr.fill(v, 2, 4);
      expect(arr.at(0)).assertEqual(11);
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_6400
     * @tc.name int8ArrayFillPart01Test064
     * @tc.desc Verify fill(42) makes forEach sum 126 on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 42;
      arr.fill(v);
      let sum: number = 0;
      arr.forEach((x: number) => {
        sum += x;
      });
      expect(sum).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_6500
     * @tc.name int8ArrayFillPart01Test065
     * @tc.desc Verify fill(5) on new Int8Array(buf) writes 5 visible via new view on ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int8Array(buf);
      const v: byte = 5;
      arr.fill(v);
      const view = new Int8Array(buf);
      expect(view.$_get(0)).assertEqual(5);
      expect(view.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_6600
     * @tc.name int8ArrayFillPart01Test066
     * @tc.desc Verify a.fill(7) on Int8Array(buf) visible in sibling view b on ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Int8Array(buf);
      const b = new Int8Array(buf);
      const v: byte = 7;
      a.fill(v);
      expect(b.$_get(0)).assertEqual(7);
      expect(b.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_6700
     * @tc.name int8ArrayFillPart01Test067
     * @tc.desc Verify fill(v) on subarray(1,4) writes to original array at indices 1-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(5);
      const sub = arr.subarray(1, 4);
      const v: byte = 9;
      sub.fill(v);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(9);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_6800
     * @tc.name int8ArrayFillPart01Test068
     * @tc.desc Verify copy.fill(9) leaves original arr $_set(0, 1) unchanged on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.$_set(0, 1);
      const copy = arr.slice();
      const v: byte = 9;
      copy.fill(v);
      expect(arr.$_get(0)).assertEqual(1);
      expect(copy.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_6900
     * @tc.name int8ArrayFillPart01Test069
     * @tc.desc Verify fill(v) with v=4 fills every element, on new Int8Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(5);
      const v: byte = 4;
      arr.fill(v);
      let r1: number = arr.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(4);
      let e2: int = 4;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_7000
     * @tc.name int8ArrayFillPart01Test070
     * @tc.desc Verify fill(v) with v=6 writes view range only, other buffer bytes stay 0, on new Int8Array(buf, 2, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int8Array(buf, 2, 4);
      const v: byte = 6;
      arr.fill(v);
      const full = new Int8Array(buf);
      expect(full.$_get(0)).assertEqual(0);
      expect(full.$_get(2)).assertEqual(6);
      expect(full.$_get(5)).assertEqual(6);
      expect(full.$_get(6)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_7100
     * @tc.name int8ArrayFillPart01Test071
     * @tc.desc Verify a1.fill(5) on Int8Array(buf, 0, 3) writes 5 visible in sibling view on ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const a1 = new Int8Array(buf, 0, 3);
      const a2 = new Int8Array(buf, 3, 3);
      const fillValA: byte = 5;
      const fillValB: byte = 10;
      a1.fill(fillValA);
      a2.fill(fillValB);
      expect(a1.$_get(0)).assertEqual(5);
      expect(a2.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_7200
     * @tc.name int8ArrayFillPart01Test072
     * @tc.desc Verify fill(-1) writes 255 bit pattern in Uint8Array view of shared buffer, on new Int8Array(buf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int8Array(buf);
      const v: byte = -1;
      arr.fill(v);
      const u8 = new Uint8Array(buf);
      expect(u8.$_get(0)).assertEqual(255);
      expect(u8.$_get(3)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_7300
     * @tc.name int8ArrayFillPart01Test073
     * @tc.desc Verify fill(9, 0, 2) then reverse() yields 0 at index 0 and 9 at index 3 on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 9;
      arr.fill(v, 0, 2);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_7400
     * @tc.name int8ArrayFillPart01Test074
     * @tc.desc Verify fill(7, 0, 2) then copyWithin(3, 0, 2) keeps filled values 7 at indices 3, 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(5);
      const v: byte = 7;
      arr.fill(v, 0, 2);
      arr.copyWithin(3, 0, 2);
      expect(arr.$_get(3)).assertEqual(7);
      expect(arr.$_get(4)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_7500
     * @tc.name int8ArrayFillPart01Test075
     * @tc.desc Verify fill(1, 0, 2) then fill(2, 2, 4) then fill(3, 4, 6) writes 1 at index 0 on new Int8Array(6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(6);
      const fillValA: byte = 1;
      const fillValB: byte = 2;
      const fillValC: byte = 3;
      arr.fill(fillValA, 0, 2);
      arr.fill(fillValB, 2, 4);
      arr.fill(fillValC, 4, 6);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_7600
     * @tc.name int8ArrayFillPart01Test076
     * @tc.desc Verify fill(7) makes indexOf(7) return 0 and includes(7) true on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 7;
      arr.fill(v);
      expect(arr.indexOf(7)).assertEqual(0);
      expect(arr.includes(7)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_7700
     * @tc.name int8ArrayFillPart01Test077
     * @tc.desc Verify fill(5) makes find(x === 5) return 5 on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 5;
      arr.fill(v);
      const found = arr.find((x: number) => x === 5);
      expect(found).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_7800
     * @tc.name int8ArrayFillPart01Test078
     * @tc.desc Verify fill(3, 0, 2).fill(6, 2, 4) writes 3, 3, 6, 6 on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const fillValA: byte = 3;
      const fillValB: byte = 6;
      arr.fill(fillValA, 0, 2).fill(fillValB, 2, 4);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(6);
      expect(arr.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FILL_PART01_TEST_7900
     * @tc.name int8ArrayFillPart01Test079
     * @tc.desc Verify fill(5) then set(src, 1) preserves 5 at index 0 and fills 10, 20 at 1, 2 on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFillPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 5;
      arr.fill(v);
      const src = new Int8Array([10, 20]);
      arr.set(src, 1);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(20);
      expect(arr.$_get(3)).assertEqual(5);
    });
  });
}
