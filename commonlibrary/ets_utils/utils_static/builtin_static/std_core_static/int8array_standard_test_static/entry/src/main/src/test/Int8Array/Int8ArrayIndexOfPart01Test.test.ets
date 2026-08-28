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

export default function int8ArrayIndexOfPart01Test(): void {
  describe('Int8ArrayIndexOfPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0100
     * @tc.name int8ArrayIndexOfPart01Test001
     * @tc.desc Verify indexOf(40) on Int8Array.of(30, 40, 50) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(30, 40, 50);
      const v: number = 40;
      let r1: int = arr.indexOf(v);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0200
     * @tc.name int8ArrayIndexOfPart01Test002
     * @tc.desc Verify indexOf(40, 0) on Int8Array.of(30, 40, 50) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(30, 40, 50);
      const v: number = 40;
      let r1: int = arr.indexOf(v, 0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0300
     * @tc.name int8ArrayIndexOfPart01Test003
     * @tc.desc Verify indexOf(40, 1) on Int8Array.of(40, 50, 40) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(40, 50, 40);
      const v: number = 40;
      let r1: int = arr.indexOf(v, 1);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0400
     * @tc.name int8ArrayIndexOfPart01Test004
     * @tc.desc Verify indexOf(-128) on Int8Array.of(-128, 0, INT8_MAX) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-128, 0, INT8_MAX);
      const v: number = -128;
      let r1: int = arr.indexOf(v);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0500
     * @tc.name int8ArrayIndexOfPart01Test005
     * @tc.desc Verify indexOf(INT8_MAX) on Int8Array.of(-128, 0, INT8_MAX) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-128, 0, INT8_MAX);
      const v: number = INT8_MAX;
      let r1: int = arr.indexOf(v);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0600
     * @tc.name int8ArrayIndexOfPart01Test006
     * @tc.desc Verify indexOf(0) on Int8Array.of(-128, 0, INT8_MAX) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-128, 0, INT8_MAX);
      const v: number = 0;
      let r1: int = arr.indexOf(v);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0700
     * @tc.name int8ArrayIndexOfPart01Test007
     * @tc.desc Verify indexOf(-1) on Int8Array.of(-1, 0, 1) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-1, 0, 1);
      const v: number = -1;
      let r1: int = arr.indexOf(v);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0800
     * @tc.name int8ArrayIndexOfPart01Test008
     * @tc.desc Verify indexOf(50) on Int8Array.of(50, 60, 70) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(50, 60, 70);
      const v: number = 50;
      let r1: int = arr.indexOf(v);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_0900
     * @tc.name int8ArrayIndexOfPart01Test009
     * @tc.desc Verify indexOf(7) on Int8Array.of(7, 8, 9) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(7, 8, 9);
      const v: number = 7;
      let r1: int = arr.indexOf(v);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1000
     * @tc.name int8ArrayIndexOfPart01Test010
     * @tc.desc Verify indexOf(9) on Int8Array.of(7, 8, 9) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(7, 8, 9);
      const v: number = 9;
      let r1: int = arr.indexOf(v);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1100
     * @tc.name int8ArrayIndexOfPart01Test011
     * @tc.desc Verify indexOf(8) on Int8Array.of(7, 8, 9) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(7, 8, 9);
      const v: number = 8;
      let r1: int = arr.indexOf(v);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1200
     * @tc.name int8ArrayIndexOfPart01Test012
     * @tc.desc Verify indexOf(5) on Int8Array.of(5, 6, 5, 6, 5) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(5, 6, 5, 6, 5);
      const v: number = 5;
      let r1: int = arr.indexOf(v);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1300
     * @tc.name int8ArrayIndexOfPart01Test013
     * @tc.desc Verify indexOf(3) on Int8Array.of(3, 3, 3, 3) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(3, 3, 3, 3);
      const v: number = 3;
      let r1: int = arr.indexOf(v);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1400
     * @tc.name int8ArrayIndexOfPart01Test014
     * @tc.desc Verify indexOf(99) on Int8Array.of(10, 20, 30) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const v: number = 99;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1500
     * @tc.name int8ArrayIndexOfPart01Test015
     * @tc.desc Verify indexOf(200) on Int8Array.of(10, 20, 30) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const v: number = 200;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1600
     * @tc.name int8ArrayIndexOfPart01Test016
     * @tc.desc Verify indexOf(5) on new Int8Array(0) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array(0);
      const v: number = 5;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1700
     * @tc.name int8ArrayIndexOfPart01Test017
     * @tc.desc Verify indexOf(42) on Int8Array.of(42) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(42);
      const v: number = 42;
      let r1: int = arr.indexOf(v);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1800
     * @tc.name int8ArrayIndexOfPart01Test018
     * @tc.desc Verify indexOf(43) on Int8Array.of(42) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(42);
      const v: number = 43;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_1900
     * @tc.name int8ArrayIndexOfPart01Test019
     * @tc.desc Verify indexOf(10, 0) on Int8Array.of(10, 20, 10, 20, 10) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 10, 20, 10);
      const v: number = 10;
      let r1: int = arr.indexOf(v, 0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2000
     * @tc.name int8ArrayIndexOfPart01Test020
     * @tc.desc Verify indexOf(10, 1) on Int8Array.of(10, 20, 10, 20, 10) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 10, 20, 10);
      const v: number = 10;
      let r1: int = arr.indexOf(v, 1);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2100
     * @tc.name int8ArrayIndexOfPart01Test021
     * @tc.desc Verify indexOf(50, 4) on Int8Array.of(10, 20, 30, 40, 50) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 50;
      let r1: int = arr.indexOf(v, 4);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2200
     * @tc.name int8ArrayIndexOfPart01Test022
     * @tc.desc Verify indexOf(10, 5) searches array and returns -1 when fromIndex equals array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 10;
      let r1: int = arr.indexOf(v, 5);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2300
     * @tc.name int8ArrayIndexOfPart01Test023
     * @tc.desc Verify indexOf(50, 6) searches array and returns -1 when fromIndex exceeds array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 50;
      let r1: int = arr.indexOf(v, 6);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2400
     * @tc.name int8ArrayIndexOfPart01Test024
     * @tc.desc Verify indexOf(10, 2147483647) searches array and returns -1 when fromIndex is a very large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const v: number = 10;
      let r1: int = arr.indexOf(v, 2147483647);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2500
     * @tc.name int8ArrayIndexOfPart01Test025
     * @tc.desc Verify indexOf(10, 4) on Int8Array.of(10, 20, 30, 40, 50) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 10;
      let r1: int = arr.indexOf(v, 4);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2600
     * @tc.name int8ArrayIndexOfPart01Test026
     * @tc.desc Verify indexOf(50, -1) on Int8Array.of(10, 20, 30, 40, 50) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 50;
      let r1: int = arr.indexOf(v, -1);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2700
     * @tc.name int8ArrayIndexOfPart01Test027
     * @tc.desc Verify indexOf(40, -2) searches array and returns 3 starting from the second-to-last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 40;
      let r1: int = arr.indexOf(v, -2);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2800
     * @tc.name int8ArrayIndexOfPart01Test028
     * @tc.desc Verify indexOf(10, -5) searches array and returns 0 when negative fromIndex clamps to start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 10;
      let r1: int = arr.indexOf(v, -5);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_2900
     * @tc.name int8ArrayIndexOfPart01Test029
     * @tc.desc Verify indexOf(10, -6) searches array and returns 0 when negative fromIndex exceeds array length bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 40, 50);
      const v: number = 10;
      let r1: int = arr.indexOf(v, -6);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3000
     * @tc.name int8ArrayIndexOfPart01Test030
     * @tc.desc Verify indexOf(10, -2147483647 - 1) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const v: number = 10;
      let r1: int = arr.indexOf(v, -2147483647 - 1);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3100
     * @tc.name int8ArrayIndexOfPart01Test031
     * @tc.desc Verify indexOf(10, -1) on Int8Array.of(10, 20, 30, 20, 10) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30, 20, 10);
      const v: number = 10;
      let r1: int = arr.indexOf(v, -1);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3200
     * @tc.name int8ArrayIndexOfPart01Test032
     * @tc.desc Verify indexOf(99, -1) on Int8Array.of(99, 20, 30, 40, 50) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(99, 20, 30, 40, 50);
      const v: number = 99;
      let r1: int = arr.indexOf(v, -1);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3300
     * @tc.name int8ArrayIndexOfPart01Test033
     * @tc.desc Verify indexOf(5, 0) on new Int8Array(0) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array(0);
      const v: number = 5;
      let r1: int = arr.indexOf(v, 0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3400
     * @tc.name int8ArrayIndexOfPart01Test034
     * @tc.desc Verify indexOf(5, -1) on new Int8Array(0) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array(0);
      const v: number = 5;
      let r1: int = arr.indexOf(v, -1);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3500
     * @tc.name int8ArrayIndexOfPart01Test035
     * @tc.desc Verify indexOf(42, 1) on Int8Array.of(42) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(42);
      const v: number = 42;
      let r1: int = arr.indexOf(v, 1);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3600
     * @tc.name int8ArrayIndexOfPart01Test036
     * @tc.desc Verify indexOf(20) on Int8Array.of(10, 20, 30) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const v: byte = 20;
      let r1: int = arr.indexOf(v);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3700
     * @tc.name int8ArrayIndexOfPart01Test037
     * @tc.desc Verify indexOf(20, 1) on Int8Array.of(20, 10, 20) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(20, 10, 20);
      const v: byte = 20;
      let r1: int = arr.indexOf(v, 1);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3800
     * @tc.name int8ArrayIndexOfPart01Test038
     * @tc.desc Verify indexOf(20) with number-typed argument on Int8Array.of(10, 20, 30) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const v: number = 20;
      let r1: int = arr.indexOf(v);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_3900
     * @tc.name int8ArrayIndexOfPart01Test039
     * @tc.desc Verify indexOf(99) with byte-typed argument on Int8Array.of(10, 20, 30) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const v: byte = 99;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_4000
     * @tc.name int8ArrayIndexOfPart01Test040
     * @tc.desc Verify indexOf(20) with byte argument returns index 1 on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const vb: byte = 20;
      let r1: int = arr.indexOf(vb);
      expect(r1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_4100
     * @tc.name int8ArrayIndexOfPart01Test041
     * @tc.desc Verify indexOf(-50) on Int8Array.of(-50, 10, 20) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-50, 10, 20);
      const v: number = -50;
      let r1: int = arr.indexOf(v);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_4200
     * @tc.name int8ArrayIndexOfPart01Test042
     * @tc.desc Verify indexOf(0) on Int8Array.of(0, 10, 20) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(0, 10, 20);
      const v: byte = 0;
      let r1: int = arr.indexOf(v);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_4300
     * @tc.name int8ArrayIndexOfPart01Test043
     * @tc.desc Verify indexOf(INT8_MAX) on Int8Array.of(INT8_MAX, 10, 20) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(INT8_MAX, 10, 20);
      const v: byte = INT8_MAX;
      let r1: int = arr.indexOf(v);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_4400
     * @tc.name int8ArrayIndexOfPart01Test044
     * @tc.desc Verify indexOf(128) on Int8Array.of(-128, 0, 127) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-128, 0, 127);
      const v: number = 128;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_4500
     * @tc.name int8ArrayIndexOfPart01Test045
     * @tc.desc Verify indexOf(129) on Int8Array.of(-127, 0, 1) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-127, 0, 1);
      const v: number = 129;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_4600
     * @tc.name int8ArrayIndexOfPart01Test046
     * @tc.desc Verify indexOf(0xff) on Int8Array.of(-1, 0, 1) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-1, 0, 1);
      const v: number = 0xff;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_4700
     * @tc.name int8ArrayIndexOfPart01Test047
     * @tc.desc Verify indexOf(256) on Int8Array.of(0, -1, 1) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(0, -1, 1);
      const v: number = 256;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_4800
     * @tc.name int8ArrayIndexOfPart01Test048
     * @tc.desc Verify indexOf(257) on Int8Array.of(1, -1, 0) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, -1, 0);
      const v: number = 257;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_4900
     * @tc.name int8ArrayIndexOfPart01Test049
     * @tc.desc Verify indexOf(-129) on Int8Array.of(127, 0, -128) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(127, 0, -128);
      const v: number = -129;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_5000
     * @tc.name int8ArrayIndexOfPart01Test050
     * @tc.desc Verify indexOf(Number.NaN) on Int8Array.of(0, -1, 1) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(0, -1, 1);
      const v: number = Number.NaN;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_5100
     * @tc.name int8ArrayIndexOfPart01Test051
     * @tc.desc Verify indexOf(Number.POSITIVE_INFINITY) on Int8Array.of(127, 0, -128) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(127, 0, -128);
      const v: number = Number.POSITIVE_INFINITY;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_5200
     * @tc.name int8ArrayIndexOfPart01Test052
     * @tc.desc Verify indexOf(Number.NEGATIVE_INFINITY) on Int8Array.of(-128, 0, 127) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-128, 0, 127);
      const v: number = Number.NEGATIVE_INFINITY;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_5300
     * @tc.name int8ArrayIndexOfPart01Test053
     * @tc.desc Verify indexOf(1.9) on Int8Array.of(1, 2, 3) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, 2, 3);
      const v: number = 1.9;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_5400
     * @tc.name int8ArrayIndexOfPart01Test054
     * @tc.desc Verify indexOf(-1.9) on Int8Array.of(-1, -2, 0) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-1, -2, 0);
      const v: number = -1.9;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_5500
     * @tc.name int8ArrayIndexOfPart01Test055
     * @tc.desc Verify indexOf(127.9) on Int8Array.of(127, 0, -1) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(127, 0, -1);
      const v: number = 127.9;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_5600
     * @tc.name int8ArrayIndexOfPart01Test056
     * @tc.desc Verify indexOf(-128.9) on Int8Array.of(-128, 0, 127) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-128, 0, 127);
      const v: number = -128.9;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_5700
     * @tc.name int8ArrayIndexOfPart01Test057
     * @tc.desc Verify indexOf(128.9) on Int8Array.of(-128, 0, 127) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-128, 0, 127);
      const v: number = 128.9;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_5800
     * @tc.name int8ArrayIndexOfPart01Test058
     * @tc.desc Verify indexOf(Number.MAX_VALUE) on Int8Array.of(127, 0, -128) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(127, 0, -128);
      const v: number = Number.MAX_VALUE;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_5900
     * @tc.name int8ArrayIndexOfPart01Test059
     * @tc.desc Verify indexOf(Number.MIN_VALUE) on Int8Array.of(0, -1, 1) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(0, -1, 1);
      const v: number = Number.MIN_VALUE;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_6000
     * @tc.name int8ArrayIndexOfPart01Test060
     * @tc.desc Verify indexOf(Number.MAX_SAFE_INTEGER) on Int8Array.of(-1, 0, 1) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-1, 0, 1);
      const v: number = Number.MAX_SAFE_INTEGER;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_6100
     * @tc.name int8ArrayIndexOfPart01Test061
     * @tc.desc Verify indexOf(-Number.MAX_SAFE_INTEGER) on Int8Array.of(1, -1, 0) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(1, -1, 0);
      const v: number = -Number.MAX_SAFE_INTEGER;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_6200
     * @tc.name int8ArrayIndexOfPart01Test062
     * @tc.desc Verify indexOf(2.5) on Int8Array.of(2, 3, 4) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(2, 3, 4);
      const v: number = 2.5;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_6300
     * @tc.name int8ArrayIndexOfPart01Test063
     * @tc.desc Verify indexOf(200) on Int8Array.of(-56, 10, 20) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(-56, 10, 20);
      const v: number = 200;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_6400
     * @tc.name int8ArrayIndexOfPart01Test064
     * @tc.desc Verify indexOf(200) on Int8Array.of(10, 20, -56) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, -56);
      const v: number = 200;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_6500
     * @tc.name int8ArrayIndexOfPart01Test065
     * @tc.desc Verify indexOf(20.9, 0) on Int8Array.of(10, 20, 30) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 20, 30);
      const v: number = 20.9;
      let r1: int = arr.indexOf(v, 0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART01_TEST_6600
     * @tc.name int8ArrayIndexOfPart01Test066
     * @tc.desc Verify indexOf(383) on Int8Array.of(10, 127, 20) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int8Array.of(10, 127, 20);
      const v: number = 383;
      let r1: int = arr.indexOf(v);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });
  });
}
