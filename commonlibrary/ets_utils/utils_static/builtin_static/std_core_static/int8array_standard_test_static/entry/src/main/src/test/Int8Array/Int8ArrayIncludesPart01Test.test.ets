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

export default function int8ArrayIncludesPart01Test(): void {
  describe('int8ArrayIncludesPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_0100
     * @tc.name int8ArrayIncludesPart01Test001
     * @tc.desc Verify includes(2) on Int8Array.of(1, 2, 3) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(2);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_0200
     * @tc.name int8ArrayIncludesPart01Test002
     * @tc.desc Verify includes(9) returns false on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(9);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_0300
     * @tc.name int8ArrayIncludesPart01Test003
     * @tc.desc Verify includes(20, 1) returns true on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let res1: boolean = arr.includes(20, 1);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_0400
     * @tc.name int8ArrayIncludesPart01Test004
     * @tc.desc Verify includes(INT8_MIN) on Int8Array.of(INT8_MIN, 0, INT8_MAX) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: byte = INT8_MIN;
      let arr: Int8Array = Int8Array.of(INT8_MIN, 0, INT8_MAX);
      let res1: boolean = arr.includes(target);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_0500
     * @tc.name int8ArrayIncludesPart01Test005
     * @tc.desc Verify includes(INT8_MAX) on Int8Array.of(0, INT8_MAX, -1) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: byte = INT8_MAX;
      let arr: Int8Array = Int8Array.of(0, INT8_MAX, -1);
      let res1: boolean = arr.includes(target);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_0600
     * @tc.name int8ArrayIncludesPart01Test006
     * @tc.desc Verify includes(0) on Int8Array.of(-1, 0, 1) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: byte = 0;
      let arr: Int8Array = Int8Array.of(-1, 0, 1);
      let res1: boolean = arr.includes(target);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_0700
     * @tc.name int8ArrayIncludesPart01Test007
     * @tc.desc Verify includes(-1) on Int8Array.of(-1, INT8_MAX, 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: byte = -1;
      let arr: Int8Array = Int8Array.of(-1, INT8_MAX, 0);
      let res1: boolean = arr.includes(target);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_0800
     * @tc.name int8ArrayIncludesPart01Test008
     * @tc.desc Verify includes(50) on Int8Array.of(50, -50, 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: byte = 50;
      let arr: Int8Array = Int8Array.of(50, -50, 0);
      let res1: boolean = arr.includes(target);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_0900
     * @tc.name int8ArrayIncludesPart01Test009
     * @tc.desc Verify includes(-50) on Int8Array.of(50, -50, 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: byte = -50;
      let arr: Int8Array = Int8Array.of(50, -50, 0);
      let res1: boolean = arr.includes(target);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_1000
     * @tc.name int8ArrayIncludesPart01Test010
     * @tc.desc Verify includes(INT8_MIN) on Int8Array.of(0, INT8_MAX, -1) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: byte = INT8_MIN;
      let arr: Int8Array = Int8Array.of(0, INT8_MAX, -1);
      let res1: boolean = arr.includes(target);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_1100
     * @tc.name int8ArrayIncludesPart01Test011
     * @tc.desc Verify includes(INT8_MAX) on Int8Array.of(0, INT8_MIN, -1) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: byte = INT8_MAX;
      let arr: Int8Array = Int8Array.of(0, INT8_MIN, -1);
      let res1: boolean = arr.includes(target);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_1200
     * @tc.name int8ArrayIncludesPart01Test012
     * @tc.desc Verify includes(0) on Int8Array.of(-1, -2, -3) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: byte = 0;
      let arr: Int8Array = Int8Array.of(-1, -2, -3);
      let res1: boolean = arr.includes(target);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_1300
     * @tc.name int8ArrayIncludesPart01Test013
     * @tc.desc Verify includes(50) on Int8Array.of(1, 2, 3) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: byte = 50;
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(target);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_1400
     * @tc.name int8ArrayIncludesPart01Test014
     * @tc.desc Verify includes(-50) on Int8Array.of(1, 2, 3) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: byte = -50;
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(target);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_1500
     * @tc.name int8ArrayIncludesPart01Test015
     * @tc.desc Verify includes(128) on Int8Array.of(INT8_MIN, 0, INT8_MAX) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MIN, 0, INT8_MAX);
      let res1: boolean = arr.includes(128);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_1600
     * @tc.name int8ArrayIncludesPart01Test016
     * @tc.desc Verify includes(-129) on Int8Array.of(0, INT8_MAX, -1) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, INT8_MAX, -1);
      let res1: boolean = arr.includes(-129);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_1700
     * @tc.name int8ArrayIncludesPart01Test017
     * @tc.desc Verify includes(255) on Int8Array.of(-1, 0, 1) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1, 0, 1);
      let res1: boolean = arr.includes(255);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_1800
     * @tc.name int8ArrayIncludesPart01Test018
     * @tc.desc Verify includes(256) on Int8Array.of(0, 1, 2) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 1, 2);
      let res1: boolean = arr.includes(256);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_1900
     * @tc.name int8ArrayIncludesPart01Test019
     * @tc.desc Verify includes(Number.NaN) on Int8Array.of(0, 1, 2) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 1, 2);
      let res1: boolean = arr.includes(Number.NaN);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_2000
     * @tc.name int8ArrayIncludesPart01Test020
     * @tc.desc Verify includes(Number.POSITIVE_INFINITY) on Int8Array.of(INT8_MAX, 0, -1) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MAX, 0, -1);
      let res1: boolean = arr.includes(Number.POSITIVE_INFINITY);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_2100
     * @tc.name int8ArrayIncludesPart01Test021
     * @tc.desc Verify includes(-Number.POSITIVE_INFINITY) on Int8Array.of(INT8_MIN, 0, 1) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(INT8_MIN, 0, 1);
      let res1: boolean = arr.includes(-Number.POSITIVE_INFINITY);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_2200
     * @tc.name int8ArrayIncludesPart01Test022
     * @tc.desc Verify includes(1.9) on Int8Array.of(1, 2, 3) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(1.9);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_2300
     * @tc.name int8ArrayIncludesPart01Test023
     * @tc.desc Verify includes(-1.9) on Int8Array.of(-1, 0, 1) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-1, 0, 1);
      let res1: boolean = arr.includes(-1.9);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_2400
     * @tc.name int8ArrayIncludesPart01Test024
     * @tc.desc Verify includes(200) on Int8Array.of(-56, 0, 1) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-56, 0, 1);
      let res1: boolean = arr.includes(200);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_2500
     * @tc.name int8ArrayIncludesPart01Test025
     * @tc.desc Verify includes(-0.0) with -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 1, 2);
      let res1: boolean = arr.includes(-0.0);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_2600
     * @tc.name int8ArrayIncludesPart01Test026
     * @tc.desc Verify includes(300) on Int8Array.of(44, 0, 1) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(44, 0, 1);
      let res1: boolean = arr.includes(300);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_2700
     * @tc.name int8ArrayIncludesPart01Test027
     * @tc.desc Verify includes(128) on Int8Array.of(0, 1, 2) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 1, 2);
      let res1: boolean = arr.includes(128);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_2800
     * @tc.name int8ArrayIncludesPart01Test028
     * @tc.desc Verify includes(Number.NaN) on Int8Array.of(1, 2, 3) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(Number.NaN);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_2900
     * @tc.name int8ArrayIncludesPart01Test029
     * @tc.desc Verify includes(1.5) returns false on Int8Array.of(0, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 2, 3);
      let res1: boolean = arr.includes(1.5);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_3000
     * @tc.name int8ArrayIncludesPart01Test030
     * @tc.desc Verify includes(200) on Int8Array.of(0, 1, 2) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 1, 2);
      let res1: boolean = arr.includes(200);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_3100
     * @tc.name int8ArrayIncludesPart01Test031
     * @tc.desc Verify includes(1, 0) on Int8Array.of(1, 2, 3) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(1, 0);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_3200
     * @tc.name int8ArrayIncludesPart01Test032
     * @tc.desc Verify includes(15, 1) returns true on Int8Array.of(5, 15, 25)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 15, 25);
      let res1: boolean = arr.includes(15, 1);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_3300
     * @tc.name int8ArrayIncludesPart01Test033
     * @tc.desc Verify includes(3, 2) returns true on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(3, 2);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_3400
     * @tc.name int8ArrayIncludesPart01Test034
     * @tc.desc Verify includes(1, 3) returns false on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(1, 3);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_3500
     * @tc.name int8ArrayIncludesPart01Test035
     * @tc.desc Verify includes(1, 4) returns false on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(1, 4);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_3600
     * @tc.name int8ArrayIncludesPart01Test036
     * @tc.desc Verify includes(3, -1) on Int8Array.of(1, 2, 3) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(3, -1);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_3700
     * @tc.name int8ArrayIncludesPart01Test037
     * @tc.desc Verify includes(1, -3) returns true on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(1, -3);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_3800
     * @tc.name int8ArrayIncludesPart01Test038
     * @tc.desc Verify includes(1, -4) returns true on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(1, -4);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_3900
     * @tc.name int8ArrayIncludesPart01Test039
     * @tc.desc Verify includes(1, 2147483647) with large fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(1, 2147483647);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_4000
     * @tc.name int8ArrayIncludesPart01Test040
     * @tc.desc Verify includes(1, -2147483648) returns true on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(1, -2147483648);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_4100
     * @tc.name int8ArrayIncludesPart01Test041
     * @tc.desc Verify includes(5) returns true and includes(5, 0) returns true on Int8Array.of(5, 6, 7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 6, 7);
      let r1: boolean = arr.includes(5);
      let r2: boolean = arr.includes(5, 0);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_4200
     * @tc.name int8ArrayIncludesPart01Test042
     * @tc.desc Verify includes(2, 1) returns true on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(2, 1);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_4300
     * @tc.name int8ArrayIncludesPart01Test043
     * @tc.desc Verify includes(7, 1) returns false on Int8Array.of(7, 8, 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 8, 9);
      let res1: boolean = arr.includes(7, 1);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_4400
     * @tc.name int8ArrayIncludesPart01Test044
     * @tc.desc Verify includes(1, -100) returns true on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let res1: boolean = arr.includes(1, -100);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_4500
     * @tc.name int8ArrayIncludesPart01Test045
     * @tc.desc Verify includes(1) on an empty Int8Array.of() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of();
      let res1: boolean = arr.includes(1);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_4600
     * @tc.name int8ArrayIncludesPart01Test046
     * @tc.desc Verify includes(1, 0) on an empty Int8Array.of() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of();
      let res1: boolean = arr.includes(1, 0);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_4700
     * @tc.name int8ArrayIncludesPart01Test047
     * @tc.desc Verify includes(42) returns true on Int8Array.of(42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let res1: boolean = arr.includes(42);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_4800
     * @tc.name int8ArrayIncludesPart01Test048
     * @tc.desc Verify includes(43) returns false on Int8Array.of(42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let res1: boolean = arr.includes(43);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_4900
     * @tc.name int8ArrayIncludesPart01Test049
     * @tc.desc Verify includes(42, 1) returns false on Int8Array.of(42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let res1: boolean = arr.includes(42, 1);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_5000
     * @tc.name int8ArrayIncludesPart01Test050
     * @tc.desc Verify includes(42, -1) returns true on Int8Array.of(42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let res1: boolean = arr.includes(42, -1);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_5100
     * @tc.name int8ArrayIncludesPart01Test051
     * @tc.desc Verify includes(10, 2) returns false on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let res1: boolean = arr.includes(10, 2);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_5200
     * @tc.name int8ArrayIncludesPart01Test052
     * @tc.desc Verify includes(30, 1) returns true on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      let res1: boolean = arr.includes(30, 1);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_5300
     * @tc.name int8ArrayIncludesPart01Test053
     * @tc.desc Verify includes(5) on Int8Array.of(5, 10, 15) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: byte = 5;
      let arr: Int8Array = Int8Array.of(5, 10, 15);
      let res1: boolean = arr.includes(target);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_5400
     * @tc.name int8ArrayIncludesPart01Test054
     * @tc.desc Verify includes(261) on Int8Array.of(5, 10, 15) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 10, 15);
      let res1: boolean = arr.includes(261);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_5500
     * @tc.name int8ArrayIncludesPart01Test055
     * @tc.desc Verify includes(126) on Int8Array.of(126, 0, -1) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: byte = 126;
      let arr: Int8Array = Int8Array.of(126, 0, -1);
      let res1: boolean = arr.includes(target);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_5600
     * @tc.name int8ArrayIncludesPart01Test056
     * @tc.desc Verify includes(1000) on Int8Array.of(-24, 0, 1) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-24, 0, 1);
      let res1: boolean = arr.includes(1000);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_5700
     * @tc.name int8ArrayIncludesPart01Test057
     * @tc.desc Verify includes(0) returns true on Int8Array.of(0, 0, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0);
      let res1: boolean = arr.includes(0);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_5800
     * @tc.name int8ArrayIncludesPart01Test058
     * @tc.desc Verify includes(1) on Int8Array.of(0, 0, 0) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0);
      let res1: boolean = arr.includes(1);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_5900
     * @tc.name int8ArrayIncludesPart01Test059
     * @tc.desc Verify includes(5, 2) returns true on Int8Array.of(5, 5, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 5, 5);
      let res1: boolean = arr.includes(5, 2);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_6000
     * @tc.name int8ArrayIncludesPart01Test060
     * @tc.desc Verify includes(6) returns false on Int8Array.of(5, 5, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 5, 5);
      let res1: boolean = arr.includes(6);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_6100
     * @tc.name int8ArrayIncludesPart01Test061
     * @tc.desc Verify includes(30, 3) returns false on Int8Array.of(10, 20, 30, 40, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let res1: boolean = arr.includes(30, 3);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_6200
     * @tc.name int8ArrayIncludesPart01Test062
     * @tc.desc Verify includes(50, 1) returns false on Int8Array.of(50, 40, 30, 20, 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(50, 40, 30, 20, 10);
      let res1: boolean = arr.includes(50, 1);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_6300
     * @tc.name int8ArrayIncludesPart01Test063
     * @tc.desc Verify includes(7, 2) returns true on Int8Array.of(7, 8, 7, 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 8, 7, 9);
      let res1: boolean = arr.includes(7, 2);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_6400
     * @tc.name int8ArrayIncludesPart01Test064
     * @tc.desc Verify includes(3, -2) returns true on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let res1: boolean = arr.includes(3, -2);
      expect(res1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_6500
     * @tc.name int8ArrayIncludesPart01Test065
     * @tc.desc Verify includes(3, -1) on Int8Array.of(1, 2, 3, 4) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let res1: boolean = arr.includes(3, -1);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_6600
     * @tc.name int8ArrayIncludesPart01Test066
     * @tc.desc Verify includes with 0.5 returns false (no int8 truncation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 1, 2);
      let res1: boolean = arr.includes(0.5);
      expect(res1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_6700
     * @tc.name int8ArrayIncludesPart01Test067
     * @tc.desc Verify includes(INT8_MIN) returns true but includes(128) returns false for Int8Array.of(-128, 0, 127)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t1: byte = INT8_MIN;
      let arr: Int8Array = Int8Array.of(INT8_MIN, 0, 127);
      let r1: boolean = arr.includes(t1);
      let r2: boolean = arr.includes(128);
      expect(r1).assertTrue();
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART01_TEST_6800
     * @tc.name int8ArrayIncludesPart01Test068
     * @tc.desc Verify includes(1) returns true but includes(1.9) returns false for Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t1: byte = 1;
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let r1: boolean = arr.includes(t1);
      let r2: boolean = arr.includes(1.9);
      expect(r1).assertTrue();
      expect(r2).assertFalse();
    });
  });
}
